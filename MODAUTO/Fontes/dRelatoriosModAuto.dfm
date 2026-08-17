inherited dtmRelatoriosModAuto: TdtmRelatoriosModAuto
  Left = 105
  Top = 137
  Width = 668
  Height = 407
  Caption = 'Relatorios ModAuto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 27
    Top = 44
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
    Top = 30
  end
  inherited qryExemplo: TwwQuery
    Left = 26
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 56
    DataPipelineName = 'pplExemplo'
  end
  object dsgnRelatorios: TppDesigner
    Caption = 'Alteração do Layout de Etiquetas de Atualização de CTPS'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 633
    Top = 13
  end
  object qryAtivGestor2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   C.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, G.CODGRUPOORC, G.NOMEGR' +
        'UPOORCAMEN,'
      '   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+'
      '    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-'
      '    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-'
      '    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+'
      '    DECODE(VR.VLRRET,NULL,0,VR.VLRRET)) AS VLRINICIAL,'
      '    VA.VLRORCACUM,  VA.VLRREALACUM,'
      '    VT1.VLRTRANSFORI, VT2.VLRTRANSFDES,'
      '    VS.VLRSUPL, VR.VLRRET, VRE.VLRRES, 0  AS VLRCOMP,'
      '   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)-'
      '    DECODE(VRE.VLRRES,NULL,0,VRE.VLRRES)) AS SALDO,'
      '   (DECODE(   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+'
      '    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-'
      '    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-'
      '    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+'
      
        '    DECODE(VR.VLRRET,NULL,0,VR.VLRRET)),0,0,(VA.VLRREALACUM/   (' +
        'DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+'
      '    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-'
      '    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-'
      '    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+'
      '    DECODE(VR.VLRRET,NULL,0,VR.VLRRET))*100))) AS PERCENT'
      'FROM'
      '   (SELECT'
      '       SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)) AS VLRORCACUM,'
      
        '       SUM(DECODE(VLRREALIZADO,NULL,0,VLRREALIZADO)) AS VLRREALA' +
        'CUM, IDCONTAORCAMEN'
      '    FROM'
      '       SALDOORCADO'
      '    WHERE'
      '       (EXERCICIO =2000) AND'
      '       (PERIODO BETWEEN 1 AND 4) AND'
      '       (IDPLANOORCAMEN = 2) AND'
      '       (IDPESSOA = 1)'
      '    GROUP BY'
      '       IDCONTAORCAMEN) VA,'
      ''
      '   (SELECT'
      '       SUM(VLRRESERVA) AS VLRRES, IDCONTAORCAMEN'
      '    FROM'
      '       RESERVAORCAMEN'
      '    WHERE'
      '       (EXERCICIO =2000) AND'
      '       (PERIODO BETWEEN 1 AND 4) AND'
      '       (IDPLANOORCAMEN = 2) AND'
      '       (IDPESSOA = 1) AND'
      '       (FLGRESERVA = '#39'A'#39')'
      '    GROUP BY'
      '       IDCONTAORCAMEN) VRE,'
      ''
      '   (SELECT'
      '       SUM(VLRSOLICITADO) AS VLRTRANSFORI, IDCONTAORIGEM'
      '    FROM'
      '       ALTERORCAMENTO'
      '    WHERE'
      '       (EXERCICIOORIGEM =2000) AND'
      '       (PERIODOORIGEM BETWEEN 1 AND 4) AND'
      '       (IDPLANOORCAMEN = 2) AND'
      '       (IDPESSOA = 1) AND'
      #9'    (FLGTIPOALTER = '#39'T'#39')'
      '    GROUP BY'
      '       IDCONTAORIGEM) VT1,'
      ''
      '   (SELECT'
      '       SUM(VLRSOLICITADO) AS VLRTRANSFDES, IDCONTADESTINO'
      '    FROM'
      '       ALTERORCAMENTO'
      '    WHERE'
      '       (EXERCICIODESTINO =2000) AND'
      '       (PERIODODESTINO BETWEEN 1 AND 4) AND'
      '       (IDPLANOORCAMEN = 2) AND'
      '       (IDPESSOA = 1) AND'
      #9'    (FLGTIPOALTER = '#39'T'#39')'
      '    GROUP BY'
      '       IDCONTADESTINO) VT2,'
      '   (SELECT'
      '       SUM(VLRSOLICITADO) AS VLRRET, IDCONTAORIGEM'
      '    FROM'
      '       ALTERORCAMENTO'
      '    WHERE'
      '       (EXERCICIOORIGEM =2000) AND'
      '       (PERIODOORIGEM BETWEEN 1 AND 4) AND'
      '       (IDPLANOORCAMEN = 2) AND'
      '       (IDPESSOA = 1) AND'
      #9'    (FLGTIPOALTER = '#39'R'#39')'
      '    GROUP BY'
      '       IDCONTAORIGEM) VR,'
      '   (SELECT'
      '       SUM(VLRSOLICITADO) AS VLRSUPL, IDCONTAORIGEM'
      '    FROM'
      '       ALTERORCAMENTO'
      '    WHERE'
      '       (EXERCICIOORIGEM =2000) AND'
      '       (PERIODOORIGEM BETWEEN 1 AND 4) AND'
      '       (IDPESSOA = 1) AND'
      '       (IDPLANOORCAMEN = 2) AND'
      #9'    (FLGTIPOALTER = '#39'S'#39')'
      '    GROUP BY'
      '       IDCONTAORIGEM) VS,'
      ''
      '    CONTASORCAMEN C,'
      '    GRUPOORCAMEN G'
      'WHERE'
      '  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND'
      '  (C.IDPLANOORCAMEN = 2) AND'
      '  (C.IDCONTAORCAMEN = VA.IDCONTAORCAMEN) AND'
      '  (C.IDCONTAORCAMEN = VT1.IDCONTAORIGEM(+)) AND'
      '  (C.IDCONTAORCAMEN = VT2.IDCONTADESTINO(+)) AND'
      '  (C.IDCONTAORCAMEN = VRE.IDCONTAORCAMEN(+)) AND'
      '  (C.IDCONTAORCAMEN = VR.IDCONTAORIGEM(+)) AND'
      '  (C.IDCONTAORCAMEN = VS.IDCONTAORIGEM(+))'
      
        'ORDER BY                                                        ' +
        '                    '
      'G.NOMEGRUPOORCAMEN,'
      'C.IDCONTAORCAMEN'
      '')
    ValidateWithMask = True
    Left = 237
    Top = 161
  end
  object dsAtivGestor2: TwwDataSource
    DataSet = qryAtivGestor2
    Left = 277
    Top = 161
  end
  object pplAtivGestor2: TppBDEPipeline
    DataSource = dsAtivGestor2
    UserName = 'lAtivGestor2'
    Left = 317
    Top = 161
    object pplAtivGestor2ppField1: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object pplAtivGestor2ppField2: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplAtivGestor2ppField3: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object pplAtivGestor2ppField4: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplAtivGestor2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRINICIAL'
      FieldName = 'VLRINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplAtivGestor2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRORCACUM'
      FieldName = 'VLRORCACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplAtivGestor2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRREALACUM'
      FieldName = 'VLRREALACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplAtivGestor2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTRANSFORI'
      FieldName = 'VLRTRANSFORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplAtivGestor2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTRANSFDES'
      FieldName = 'VLRTRANSFDES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplAtivGestor2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSUPL'
      FieldName = 'VLRSUPL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplAtivGestor2ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRET'
      FieldName = 'VLRRET'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplAtivGestor2ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRES'
      FieldName = 'VLRRES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplAtivGestor2ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOMP'
      FieldName = 'VLRCOMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplAtivGestor2ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplAtivGestor2ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENT'
      FieldName = 'PERCENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
  object rptAtivGestor2: TppReport
    AutoStop = False
    DataPipeline = pplAtivGestor2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 357
    Top = 161
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAtivGestor2'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppLabel127: TppLabel
        UserName = 'ppLabel127'
        Caption = 'Distribuição de Saldos por Grupos Orçamentários - modelo 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 80963
        mmTop = 8731
        mmWidth = 122238
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel128: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel128'
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
      object ppLabel129: TppLabel
        UserName = 'ppLabel129'
        Caption = 'Conta Orcamentária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 28310
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'ppLabel130'
        AutoSize = False
        Caption = 'Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 28310
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'ppLabel131'
        AutoSize = False
        Caption = 'Dotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 24342
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'ppLabel132'
        AutoSize = False
        Caption = 'Suplementações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 28310
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'ppLabel133'
        AutoSize = False
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 24342
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'ppLabel134'
        AutoSize = False
        Caption = 'Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 28310
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'ppLabel135'
        AutoSize = False
        Caption = 'Transf.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 24342
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel136: TppLabel
        UserName = 'ppLabel136'
        AutoSize = False
        Caption = 'Enviadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 28310
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel137: TppLabel
        UserName = 'ppLabel137'
        AutoSize = False
        Caption = 'Transf.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 24342
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel138: TppLabel
        UserName = 'ppLabel138'
        AutoSize = False
        Caption = 'Aguardando'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 28310
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel139: TppLabel
        UserName = 'ppLabel139'
        AutoSize = False
        Caption = 'Res./Comp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 24342
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Efetivados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 28310
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel152: TppLabel
        UserName = 'ppLabel152'
        AutoSize = False
        Caption = 'Compromissos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 24342
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel197: TppLabel
        UserName = 'ppLabel197'
        AutoSize = False
        Caption = 'SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 28310
        mmWidth = 22225
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'ppLine36'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33073
        mmWidth = 284300
        BandType = 0
      end
      object rptAtivGestor2Label1: TppLabel
        UserName = 'rptAtivGestor2Label1'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 272786
        mmTop = 28310
        mmWidth = 2381
        BandType = 0
      end
      object txtPerGestor2: TppLabel
        UserName = 'txtPerGestor2'
        AutoSize = False
        Caption = 'txtPerGestor2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 17198
        mmWidth = 103188
        BandType = 0
      end
      object rptAtivGestor2Label4: TppLabel
        UserName = 'rptAtivGestor2Label4'
        AutoSize = False
        Caption = 'Retornos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 28310
        mmWidth = 21431
        BandType = 0
      end
      object rptAtivGestor2Label5: TppLabel
        UserName = 'rptAtivGestor2Label5'
        AutoSize = False
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 24342
        mmWidth = 21431
        BandType = 0
      end
      object rptAtivGestor2Label6: TppLabel
        UserName = 'rptAtivGestor2Label6'
        Caption = 'rptAtivGestor2Label6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 17727
        mmWidth = 27252
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText47: TppDBText
        UserName = 'ppDBText47'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplAtivGestor2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplAtivGestor2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 529
        mmWidth = 50006
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        DataField = 'VLRINICIAL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 70908
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'ppDBText86'
        DataField = 'VLRSUPL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'ppDBText87'
        DataField = 'VLRTRANSFORI'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'ppDBText88'
        DataField = 'VLRTRANSFDES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'ppDBText89'
        DataField = 'SALDO'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'ppDBText90'
        DataField = 'VLRCOMP'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'ppDBText91'
        DataField = 'VLRRES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestor2DBText2: TppDBText
        UserName = 'rptAtivGestor2DBText2'
        DataField = 'VLRRET'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText156: TppDBText
        UserName = 'DBText156'
        DataField = 'PERCENT'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 270140
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel199: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel199'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 3175
        mmWidth = 70644
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 3175
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rptAtivGestor2SummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rptAtivGestor2Label3: TppLabel
        UserName = 'rptAtivGestor2Label3'
        Caption = 'TOTAL GERAL :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 48419
        mmTop = 4233
        mmWidth = 21696
        BandType = 7
      end
      object rptAtivGestor2DBCalc8: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc8'
        DataField = 'VLRINICIAL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 70908
        mmTop = 4233
        mmWidth = 25135
        BandType = 7
      end
      object rptAtivGestor2DBCalc9: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc9'
        DataField = 'VLRSUPL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 4233
        mmWidth = 25135
        BandType = 7
      end
      object rptAtivGestor2DBCalc10: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc10'
        DataField = 'VLRTRANSFDES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 4233
        mmWidth = 25135
        BandType = 7
      end
      object rptAtivGestor2DBCalc11: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc11'
        DataField = 'VLRTRANSFORI'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 4233
        mmWidth = 25135
        BandType = 7
      end
      object rptAtivGestor2DBCalc12: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc12'
        DataField = 'VLRRES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 4233
        mmWidth = 25135
        BandType = 7
      end
      object rptAtivGestor2DBCalc13: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc13'
        DataField = 'VLRCOMP'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 4233
        mmWidth = 25135
        BandType = 7
      end
      object rptAtivGestor2DBCalc14: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc14'
        DataField = 'SALDO'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 4233
        mmWidth = 22754
        BandType = 7
      end
      object rptAtivGestor2Line1: TppLine
        UserName = 'rptAtivGestor2Line1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object rptAtivGestor2Line2: TppLine
        UserName = 'rptAtivGestor2Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 11113
        mmWidth = 284300
        BandType = 7
      end
      object rptAtivGestor2DBCalc16: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc16'
        DataField = 'VLRRET'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 4233
        mmWidth = 20373
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CODGRUPOORC'
      DataPipeline = pplAtivGestor2
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAtivGestor2'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText93: TppDBText
          UserName = 'ppDBText93'
          DataField = 'CODGRUPOORC'
          DataPipeline = pplAtivGestor2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 4233
          mmLeft = 16140
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText94: TppDBText
          UserName = 'ppDBText94'
          DataField = 'NOMEGRUPOORCAMEN'
          DataPipeline = pplAtivGestor2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 529
          mmWidth = 70379
          BandType = 3
          GroupNo = 0
        end
        object ppLabel200: TppLabel
          UserName = 'ppLabel200'
          Caption = 'Grupo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 529
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'ppLine55'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine56: TppLine
          UserName = 'ppLine56'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc1: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc1'
          DataField = 'VLRINICIAL'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 70908
          mmTop = 2646
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc2: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc2'
          DataField = 'VLRSUPL'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 96838
          mmTop = 2646
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc3: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc3'
          DataField = 'VLRTRANSFDES'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 143934
          mmTop = 2646
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc4: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc4'
          DataField = 'VLRTRANSFORI'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 169598
          mmTop = 2646
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc5: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc5'
          DataField = 'VLRRES'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 195263
          mmTop = 2646
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc6: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc6'
          DataField = 'VLRCOMP'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 220928
          mmTop = 2646
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc7: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc7'
          DataField = 'SALDO'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 246592
          mmTop = 2646
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2Label2: TppLabel
          UserName = 'rptAtivGestor2Label2'
          Caption = 'TOTAIS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 57944
          mmTop = 2646
          mmWidth = 12171
          BandType = 5
          GroupNo = 0
        end
        object rptAtivGestor2DBCalc15: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc15'
          DataField = 'VLRRET'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 3704
          mmLeft = 122767
          mmTop = 2646
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryOrcxRealConta: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '   U.FLGSINALGRUPO, U.CODGRUPOORC, U.IDCONTAORCAMEN,'
      '   U.NOMEGRUPOORCAMEN, U.NOMECONTAORCAMEN,'
      '   SUM(NVL(U.VLRORCADOACUM,0)) AS VLRORCADOACUM,'
      '   SUM(NVL(U.VLRREALIZADOACUM,0)) AS VLRREALIZADOACUM,'
      
        '   (SUM(NVL(U.VLRREALIZADOACUM,0)) - SUM(NVL(U.VLRORCADOACUM,0))' +
        ') AS VARACUM,'
      
        '   DECODE(SUM(NVL(U.VLRORCADOACUM,0)),0,0,(SUM(NVL(U.VLRREALIZAD' +
        'OACUM,0)) - SUM(NVL(U.VLRORCADOACUM,0)))/SUM(NVL(U.VLRORCADOACUM' +
        ',0))*100) AS VARPACUM,'
      '   SUM(NVL(U.VLRORCADO,0)) AS VLRORCADO,'
      '   SUM(NVL(U.VLRREALIZADO,0)) AS VLRREALIZADO,'
      
        '   (SUM(NVL(U.VLRREALIZADO,0)) - SUM(NVL(U.VLRORCADO,0))) AS VAR' +
        'PER,'
      
        '   DECODE(SUM(NVL(U.VLRORCADO,0)),0,0,(SUM(NVL(U.VLRREALIZADO,0)' +
        ') - SUM(NVL(U.VLRORCADO,0)))/SUM(NVL(U.VLRORCADO,0))*100) AS VAR' +
        'PPER'
      'FROM ('
      'SELECT  /*+ index (SALDOORCADO XIF4223SALDOORCADO) */'
      '   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN,'
      '   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,'
      '   (0) AS VLRORCADOACUM,'
      '   (0) AS VLRREALIZADOACUM,'
      
        '   ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'#39'P' +
        #39',S.VLRORCADO,(S.VLRORCADO*-1)))),2) AS VLRORCADO,'
      
        '   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA' +
        ','#39'P'#39',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADO'
      'FROM'
      '    GRUPOORCAMEN G,'
      '    CONTASORCAMEN C,'
      '    SALDOORCADO S'
      'WHERE'
      '   (S.EXERCICIO =2000) AND'
      '   (S.PERIODO <= 10) AND'
      '   (S.IDPESSOA = 1) AND'
      '   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      'GROUP BY'
      '   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,'
      '   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN'
      'UNION ALL'
      'SELECT  /*+ index (SALDOORCADO XIF4223SALDOORCADO) */'
      '   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN,'
      '   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,'
      
        '   ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'#39'P' +
        #39',S.VLRORCADO,(S.VLRORCADO*-1)))),2) AS VLRORCADOACUM,'
      
        '   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA' +
        ','#39'P'#39',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOACU' +
        'M,'
      '   (0) AS VLRORCADO,'
      '   (0) AS VLRREALIZADO'
      'FROM'
      '    GRUPOORCAMEN G,'
      '    CONTASORCAMEN C,'
      '    SALDOORCADO S'
      'WHERE'
      '   (S.EXERCICIO =2000) AND'
      '   (S.PERIODO <= 10) AND'
      '   (S.IDPESSOA = 1) AND'
      '   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      'GROUP BY'
      '   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,'
      '   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN) U'
      'GROUP BY'
      '   U.NOMEGRUPOORCAMEN, U.NOMECONTAORCAMEN,'
      '   U.FLGSINALGRUPO, U.CODGRUPOORC, U.IDCONTAORCAMEN'
      'HAVING'
      '   (SUM(NVL(U.VLRORCADOACUM,0)) <> 0) OR'
      '   (SUM(NVL(U.VLRREALIZADOACUM,0)) <> 0) OR'
      '   (SUM(NVL(U.VLRORCADO,0)) <> 0) OR'
      '   (SUM(NVL(U.VLRREALIZADO,0)) <> 0)'
      'ORDER  BY'
      '   U.CODGRUPOORC, U.IDCONTAORCAMEN'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 312
  end
  object dsOrcxRealConta: TwwDataSource
    DataSet = qryOrcxRealConta
    Left = 77
    Top = 312
  end
  object pplOrcxRealConta: TppBDEPipeline
    DataSource = dsOrcxRealConta
    UserName = 'lCompContas1'
    Left = 117
    Top = 312
    object pplOrcxRealContappField1: TppField
      FieldAlias = 'FLGSINALGRUPO'
      FieldName = 'FLGSINALGRUPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplOrcxRealContappField2: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object pplOrcxRealContappField3: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 25
      DisplayWidth = 25
      Position = 2
    end
    object pplOrcxRealContappField4: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplOrcxRealContappField5: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplOrcxRealContappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRORCADOACUM'
      FieldName = 'VLRORCADOACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplOrcxRealContappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRREALIZADOACUM'
      FieldName = 'VLRREALIZADOACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplOrcxRealContappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARACUM'
      FieldName = 'VARACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplOrcxRealContappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARPACUM'
      FieldName = 'VARPACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplOrcxRealContappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRORCADO'
      FieldName = 'VLRORCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplOrcxRealContappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRREALIZADO'
      FieldName = 'VLRREALIZADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplOrcxRealContappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARPER'
      FieldName = 'VARPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplOrcxRealContappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARPPER'
      FieldName = 'VARPPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object rpOrcxRealConta: TppReport
    AutoStop = False
    DataPipeline = pplOrcxRealConta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 157
    Top = 312
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplOrcxRealConta'
    object ppHeaderBand26: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLine69: TppLine
        UserName = 'Line701'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 111390
        mmTop = 18785
        mmWidth = 29369
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line68'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 18785
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'ppLabel202'
        Caption = 'Orçado x Realizado em Novembro/2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 102394
        mmTop = 8731
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel213: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel203'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel218: TppLabel
        UserName = 'rpCompContasLabel2'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel219: TppLabel
        UserName = 'Label219'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 23283
        mmTop = 20902
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel228: TppLabel
        UserName = 'Label228'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 203465
        mmTop = 20902
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel239: TppLabel
        UserName = 'Label239'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 221986
        mmTop = 20902
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel240: TppLabel
        UserName = 'Label240'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 245269
        mmTop = 20902
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel241: TppLabel
        UserName = 'Label241'
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 257705
        mmTop = 20902
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel242: TppLabel
        UserName = 'Label242'
        AutoSize = False
        Caption = 'Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 16669
        mmWidth = 77788
        BandType = 0
      end
      object ppLine71: TppLine
        UserName = 'Line71'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 240242
        mmTop = 18785
        mmWidth = 29369
        BandType = 0
      end
      object ppLine70: TppLine
        UserName = 'Line70'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 192088
        mmTop = 18785
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel221: TppLabel
        UserName = 'Label221'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122767
        mmTop = 20902
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel222: TppLabel
        UserName = 'Label222'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 141288
        mmTop = 20902
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel224: TppLabel
        UserName = 'Label2401'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 20902
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel225: TppLabel
        UserName = 'Label225'
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 20902
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel227: TppLabel
        UserName = 'Label227'
        AutoSize = False
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 111390
        mmTop = 16669
        mmWidth = 77788
        BandType = 0
      end
      object ppLine73: TppLine
        UserName = 'Line73'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel244: TppLabel
        UserName = 'ppLabel244'
        Caption = 'ppLabel244'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 6615
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand26: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText115: TppDBText
        UserName = 'rpCompContasDBText5'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplOrcxRealConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 23283
        mmTop = 265
        mmWidth = 86519
        BandType = 4
      end
      object ppDBText114: TppDBText
        UserName = 'rpCompContasDBText4'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplOrcxRealConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText109: TppDBText
        UserName = 'DBText109'
        DataField = 'VLRORCADO'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 111390
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText110: TppDBText
        UserName = 'DBText110'
        DataField = 'VLRREALIZADO'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText111: TppDBText
        UserName = 'DBText1101'
        DataField = 'VARPER'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText116: TppDBText
        UserName = 'DBText116'
        DataField = 'VARPPER'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 265
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText117: TppDBText
        UserName = 'DBText117'
        DataField = 'VLRORCADOACUM'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText118: TppDBText
        UserName = 'DBText1102'
        DataField = 'VLRREALIZADOACUM'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 214048
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText119: TppDBText
        UserName = 'DBText119'
        DataField = 'VARACUM'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 236009
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText120: TppDBText
        UserName = 'DBText120'
        DataField = 'VARPACUM'
        DataPipeline = pplOrcxRealConta
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRealConta'
        mmHeight = 3175
        mmLeft = 257705
        mmTop = 265
        mmWidth = 12171
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc44'
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
        mmWidth = 276226
        BandType = 8
      end
      object ppLabel215: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel204'
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
        mmWidth = 276490
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 3175
        mmWidth = 33602
        BandType = 8
      end
      object ppLine65: TppLine
        UserName = 'ppLine60'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODGRUPOORC'
      DataPipeline = pplOrcxRealConta
      OutlineSettings.CreateNode = True
      UserName = 'rpCompContasGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcxRealConta'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLabel216: TppLabel
          UserName = 'rpCompContasLabel1'
          Caption = 'Grupo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppDBText112: TppDBText
          UserName = 'rpCompContasDBText1'
          AutoSize = True
          DataField = 'CODGRUPOORC'
          DataPipeline = pplOrcxRealConta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 4233
          mmLeft = 30692
          mmTop = 2381
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppDBText113: TppDBText
          UserName = 'rpCompContasDBText2'
          AutoSize = True
          DataField = 'NOMEGRUPOORCAMEN'
          DataPipeline = pplOrcxRealConta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 4233
          mmLeft = 58738
          mmTop = 2381
          mmWidth = 41804
          BandType = 3
          GroupNo = 0
        end
        object ppLine67: TppLine
          UserName = 'rpCompContasLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 7673
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine66: TppLine
          UserName = 'ppLine59'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6615
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine72: TppLine
          UserName = 'Line72'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel243: TppLabel
          UserName = 'Label243'
          Caption = 'Total do Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 82815
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRORCADO'
          DataPipeline = pplOrcxRealConta
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 3175
          mmLeft = 111390
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VLRREALIZADO'
          DataPipeline = pplOrcxRealConta
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLRORCADOACUM'
          DataPipeline = pplOrcxRealConta
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 3175
          mmLeft = 192088
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'VLRREALIZADOACUM'
          DataPipeline = pplOrcxRealConta
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 3175
          mmLeft = 214048
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VLRREALIZADOACUM'
          DataPipeline = pplOrcxRealConta
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 3175
          mmLeft = 236009
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VARPER'
          DataPipeline = pplOrcxRealConta
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRealConta'
          mmHeight = 3175
          mmLeft = 155311
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryRelatGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN,'
      '      0 AS ORC01, 0 AS REA01,'
      '      0 AS ORC02, 0 AS REA02,'
      '      0 AS ORC03, 0 AS REA03,'
      '      0 AS ORC04, 0 AS REA04,'
      '      0 AS ORC05, 0 AS REA05,'
      '      0 AS ORC06, 0 AS REA06,'
      '      0 AS TOTORC, 0 AS TOTREA,'
      '      0 AS PERORC, 0 AS PERREA'
      'FROM GRUPOORCAMEN'
      'WHERE (LENGTH(RTRIM(CODGRUPOORC)) <= :NUMDIGGRAU) AND'
      '      (CODGRUPOORC >= :CODGRUPOINI) AND'
      '      (CODGRUPOORC <= :CODGRUPOFIM)'
      'ORDER BY CODGRUPOORC')
    UpdateObject = updRelatGrupo
    ValidateWithMask = True
    Left = 214
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMDIGGRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODGRUPOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODGRUPOFIM'
        ParamType = ptUnknown
      end>
  end
  object dsRelatGrupo: TwwDataSource
    DataSet = qryRelatGrupo
    Left = 254
    Top = 244
  end
  object pplRelatGrupo: TppBDEPipeline
    DataSource = dsRelatGrupo
    UserName = 'lRelatGrupo'
    Left = 294
    Top = 244
  end
  object rpRelatGrupo: TppReport
    AutoStop = False
    DataPipeline = pplRelatGrupo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 334
    Top = 244
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRelatGrupo'
    object ppHeaderBand24: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel83: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Orçado x Realizado por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 111654
        mmTop = 8731
        mmWidth = 61119
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'ppLine61'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16404
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel205: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel205'
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
      object rpRelatGrupoLabel1: TppLabel
        UserName = 'rpRelatGrupoLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 9525
        mmTop = 22225
        mmWidth = 8731
        BandType = 0
      end
      object rpRelatGrupoLabel2: TppLabel
        UserName = 'rpRelatGrupoLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 26458
        mmTop = 22225
        mmWidth = 11906
        BandType = 0
      end
      object rpRelatGrupoLine1: TppLine
        UserName = 'rpRelatGrupoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284427
        BandType = 0
      end
      object rpRelatGrupoLine2: TppLine
        UserName = 'rpRelatGrupoLine2'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel3: TppLabel
        UserName = 'rpRelatGrupoLabel3'
        AutoSize = False
        Caption = 'Mes01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 89694
        mmTop = 16933
        mmWidth = 7144
        BandType = 0
      end
      object rpRelatGrupoLabel4: TppLabel
        UserName = 'rpRelatGrupoLabel4'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLabel5: TppLabel
        UserName = 'rpRelatGrupoLabel5'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 93398
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLine3: TppLine
        UserName = 'rpRelatGrupoLine3'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 98690
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLine4: TppLine
        UserName = 'rpRelatGrupoLine4'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 109802
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel6: TppLabel
        UserName = 'rpRelatGrupoLabel6'
        AutoSize = False
        Caption = 'Mes02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 122238
        mmTop = 16933
        mmWidth = 7144
        BandType = 0
      end
      object rpRelatGrupoLabel7: TppLabel
        UserName = 'rpRelatGrupoLabel7'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 109802
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLabel8: TppLabel
        UserName = 'rpRelatGrupoLabel8'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 125942
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLine5: TppLine
        UserName = 'rpRelatGrupoLine5'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 131234
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLine6: TppLine
        UserName = 'rpRelatGrupoLine6'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 142346
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel9: TppLabel
        UserName = 'rpRelatGrupoLabel9'
        AutoSize = False
        Caption = 'Mes03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 154252
        mmTop = 16933
        mmWidth = 7144
        BandType = 0
      end
      object rpRelatGrupoLabel10: TppLabel
        UserName = 'rpRelatGrupoLabel10'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 142346
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLabel11: TppLabel
        UserName = 'rpRelatGrupoLabel11'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 158486
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLine7: TppLine
        UserName = 'rpRelatGrupoLine7'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 163777
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLine8: TppLine
        UserName = 'rpRelatGrupoLine8'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 175419
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel12: TppLabel
        UserName = 'rpRelatGrupoLabel12'
        AutoSize = False
        Caption = 'Mes04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 187590
        mmTop = 16933
        mmWidth = 7144
        BandType = 0
      end
      object rpRelatGrupoLabel13: TppLabel
        UserName = 'rpRelatGrupoLabel13'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 175419
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLabel14: TppLabel
        UserName = 'rpRelatGrupoLabel14'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 191294
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLine9: TppLine
        UserName = 'rpRelatGrupoLine9'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 196586
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLine10: TppLine
        UserName = 'rpRelatGrupoLine10'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 207698
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel15: TppLabel
        UserName = 'rpRelatGrupoLabel15'
        AutoSize = False
        Caption = 'Mes05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 220134
        mmTop = 16933
        mmWidth = 7144
        BandType = 0
      end
      object rpRelatGrupoLabel16: TppLabel
        UserName = 'rpRelatGrupoLabel16'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 207698
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLabel17: TppLabel
        UserName = 'rpRelatGrupoLabel17'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 223838
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLine11: TppLine
        UserName = 'rpRelatGrupoLine11'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 229130
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLine12: TppLine
        UserName = 'rpRelatGrupoLine12'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 240242
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel18: TppLabel
        UserName = 'rpRelatGrupoLabel18'
        AutoSize = False
        Caption = 'Mes06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 252148
        mmTop = 16933
        mmWidth = 7144
        BandType = 0
      end
      object rpRelatGrupoLabel19: TppLabel
        UserName = 'rpRelatGrupoLabel19'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 240242
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLabel20: TppLabel
        UserName = 'rpRelatGrupoLabel20'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 256382
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoLine13: TppLine
        UserName = 'rpRelatGrupoLine13'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 261673
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoLabel21: TppLabel
        UserName = 'rpRelatGrupoLabel21'
        Caption = 'rpRelatGrupoLabel21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 3704
        mmWidth = 30427
        BandType = 0
      end
      object rpRelatGrupoLabel22: TppLabel
        UserName = 'rpRelatGrupoLabel22'
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 3704
        mmWidth = 13758
        BandType = 0
      end
      object rpRelatGrupoLabel23: TppLabel
        UserName = 'rpRelatGrupoLabel23'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 8202
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoLabel24: TppLabel
        UserName = 'rpRelatGrupoLabel24'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 12171
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoLabel25: TppLabel
        UserName = 'rpRelatGrupoLabel25'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 8202
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoLabel26: TppLabel
        UserName = 'rpRelatGrupoLabel26'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 12171
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoLabel27: TppLabel
        UserName = 'rpRelatGrupoLabel27'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 12171
        mmWidth = 74348
        BandType = 0
      end
      object rpRelatGrupoLabel28: TppLabel
        UserName = 'rpRelatGrupoLabel28'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 8202
        mmWidth = 74348
        BandType = 0
      end
      object rpRelatGrupoLabel29: TppLabel
        UserName = 'rpRelatGrupoLabel29'
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 273844
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
    end
    object ppDetailBand24: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpRelatGrupoDBText1: TppDBText
        UserName = 'rpRelatGrupoDBText1'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object rpRelatGrupoDBText2: TppDBText
        UserName = 'rpRelatGrupoDBText2'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 265
        mmWidth = 49742
        BandType = 4
      end
      object rpRelatGrupoDBText3: TppDBText
        UserName = 'rpRelatGrupoDBText3'
        DataField = 'ORC01'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 77523
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText4: TppDBText
        UserName = 'rpRelatGrupoDBText4'
        DataField = 'REA01'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 93398
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText5: TppDBText
        UserName = 'rpRelatGrupoDBText5'
        DataField = 'ORC02'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 109802
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText6: TppDBText
        UserName = 'rpRelatGrupoDBText6'
        DataField = 'REA02'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText7: TppDBText
        UserName = 'rpRelatGrupoDBText7'
        DataField = 'ORC03'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText8: TppDBText
        UserName = 'rpRelatGrupoDBText8'
        DataField = 'REA03'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText9: TppDBText
        UserName = 'rpRelatGrupoDBText9'
        DataField = 'ORC04'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 174890
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText10: TppDBText
        UserName = 'rpRelatGrupoDBText10'
        DataField = 'REA04'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 191030
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText11: TppDBText
        UserName = 'rpRelatGrupoDBText11'
        DataField = 'ORC05'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 207434
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText12: TppDBText
        UserName = 'rpRelatGrupoDBText12'
        DataField = 'REA05'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 223573
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText13: TppDBText
        UserName = 'rpRelatGrupoDBText13'
        DataField = 'ORC06'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 239978
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText14: TppDBText
        UserName = 'rpRelatGrupoDBText14'
        DataField = 'REA06'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 256117
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object rpRelatGrupoDBText15: TppDBText
        UserName = 'rpRelatGrupoDBText15'
        DataField = 'PERORC'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 3175
        mmLeft = 273844
        mmTop = 265
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel206: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel206'
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
        mmWidth = 280194
        BandType = 8
      end
      object ppLine62: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284427
        BandType = 8
      end
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
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
        mmWidth = 280194
        BandType = 8
      end
      object ppCalc47: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254265
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object updRelatGrupo: TUpdateSQL
    Left = 368
    Top = 245
  end
  object qryRelatGrupoAnual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN,'
      '      0 AS VAL01, 0 AS VAL07,'
      '      0 AS VAL02, 0 AS VAL08,'
      '      0 AS VAL03, 0 AS VAL09,'
      '      0 AS VAL04, 0 AS VAL10,'
      '      0 AS VAL05, 0 AS VAL11,'
      '      0 AS VAL06, 0 AS VAL12,'
      '      0 AS TOTAL'
      'FROM GRUPOORCAMEN'
      'WHERE (LENGTH(RTRIM(CODGRUPOORC)) <= :NUMDIGGRAU) AND'
      '      (CODGRUPOORC >= :CODGRUPOINI) AND'
      '      (CODGRUPOORC <= :CODGRUPOFIM)'
      'ORDER BY CODGRUPOORC')
    UpdateObject = updRelatGrupoAnual
    ValidateWithMask = True
    Left = 412
    Top = 302
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMDIGGRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODGRUPOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODGRUPOFIM'
        ParamType = ptUnknown
      end>
  end
  object dsRelatGrupoAnual: TwwDataSource
    DataSet = qryRelatGrupoAnual
    Left = 452
    Top = 302
  end
  object pplRelatGrupoAnual: TppBDEPipeline
    DataSource = dsRelatGrupoAnual
    UserName = 'lRelatGrupoAnual'
    Left = 492
    Top = 302
  end
  object rpRelatGrupoAnual: TppReport
    AutoStop = False
    DataPipeline = pplRelatGrupoAnual
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 538
    Top = 299
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRelatGrupoAnual'
    object ppHeaderBand25: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel207: TppLabel
        UserName = 'ppLabel207'
        Caption = 'Valores por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 123561
        mmTop = 8731
        mmWidth = 37042
        BandType = 0
      end
      object ppLine63: TppLine
        UserName = 'ppLine63'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel208: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel208'
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
      object ppLabel209: TppLabel
        UserName = 'ppLabel209'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 6615
        mmTop = 22225
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'ppLabel210'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 23548
        mmTop = 22225
        mmWidth = 11906
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'ppLine64'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel211: TppLabel
        UserName = 'ppLabel211'
        AutoSize = False
        Caption = 'Mes01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 74613
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'ppLabel214'
        AutoSize = False
        Caption = 'Mes02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 90488
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel217: TppLabel
        UserName = 'ppLabel217'
        AutoSize = False
        Caption = 'Mes03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 106627
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel220: TppLabel
        UserName = 'ppLabel220'
        AutoSize = False
        Caption = 'Mes04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 122502
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel223: TppLabel
        UserName = 'ppLabel223'
        AutoSize = False
        Caption = 'Mes05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 138907
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel226: TppLabel
        UserName = 'ppLabel226'
        AutoSize = False
        Caption = 'Mes06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 155046
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel229: TppLabel
        UserName = 'ppLabel229'
        Caption = 'rpRelatGrupoLabel21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 3704
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel230: TppLabel
        UserName = 'ppLabel230'
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 3704
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel231: TppLabel
        UserName = 'ppLabel231'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 10583
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel232: TppLabel
        UserName = 'ppLabel232'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 14552
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel233: TppLabel
        UserName = 'ppLabel233'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 10583
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel234: TppLabel
        UserName = 'ppLabel234'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 14552
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel235: TppLabel
        UserName = 'ppLabel235'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 14552
        mmWidth = 74348
        BandType = 0
      end
      object ppLabel236: TppLabel
        UserName = 'ppLabel236'
        AutoSize = False
        Caption = 'rpRelatGrupoLabel28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 10583
        mmWidth = 74348
        BandType = 0
      end
      object ppLabel237: TppLabel
        UserName = 'ppLabel237'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 268023
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoAnualLabel1: TppLabel
        UserName = 'rpRelatGrupoAnualLabel1'
        AutoSize = False
        Caption = 'Mes07'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 171186
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoAnualLabel2: TppLabel
        UserName = 'rpRelatGrupoAnualLabel2'
        AutoSize = False
        Caption = 'Mes08'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 187061
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoAnualLabel3: TppLabel
        UserName = 'rpRelatGrupoAnualLabel3'
        AutoSize = False
        Caption = 'Mes09'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 203200
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoAnualLabel4: TppLabel
        UserName = 'rpRelatGrupoAnualLabel4'
        AutoSize = False
        Caption = 'Mes10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 219075
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoAnualLabel5: TppLabel
        UserName = 'rpRelatGrupoAnualLabel5'
        AutoSize = False
        Caption = 'Mes11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 235480
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
      object rpRelatGrupoAnualLabel6: TppLabel
        UserName = 'rpRelatGrupoAnualLabel6'
        AutoSize = False
        Caption = 'Mes12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 251619
        mmTop = 22225
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText92: TppDBText
        UserName = 'ppDBText92'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplRelatGrupoAnual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 6615
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText95: TppDBText
        UserName = 'ppDBText95'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplRelatGrupoAnual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 23548
        mmTop = 265
        mmWidth = 49742
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'ppDBText96'
        DataField = 'VAL01'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 74613
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'ppDBText97'
        DataField = 'VAL02'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 90488
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'ppDBText98'
        DataField = 'VAL03'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 106627
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText99: TppDBText
        UserName = 'ppDBText99'
        DataField = 'VAL04'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'ppDBText100'
        DataField = 'VAL05'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 138907
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'ppDBText101'
        DataField = 'VAL06'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 155046
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'ppDBText102'
        DataField = 'VAL07'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 171186
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'ppDBText103'
        DataField = 'VAL08'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'ppDBText104'
        DataField = 'VAL09'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 203465
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'ppDBText105'
        DataField = 'VAL10'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 219605
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'ppDBText106'
        DataField = 'VAL11'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 235744
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'ppDBText107'
        DataField = 'VAL12'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 251884
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'ppDBText108'
        DataField = 'TOTAL'
        DataPipeline = pplRelatGrupoAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupoAnual'
        mmHeight = 3175
        mmLeft = 268023
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel238: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel238'
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
        mmWidth = 280194
        BandType = 8
      end
      object ppLine77: TppLine
        UserName = 'ppLine77'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284427
        BandType = 8
      end
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
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
        mmWidth = 280194
        BandType = 8
      end
      object ppCalc49: TppSystemVariable
        UserName = 'Calc49'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254265
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object updRelatGrupoAnual: TUpdateSQL
    Left = 574
    Top = 303
  end
  object rpAvisoFerias: TppReport
    AutoStop = False
    DataPipeline = ppAvisoFerias
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Aviso de Férias'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 116
    Top = 141
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppAvisoFerias'
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 211403
      mmPrintPosition = 0
      object AvisoFeriasLbl9: TppLabel
        UserName = 'AvisoFeriasLbl9'
        Caption = 'Parcelamento da devolução do adiantamento de férias em: 00 vezes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 126207
        mmWidth = 81756
        BandType = 4
      end
      object AvisoFeriasShp3: TppShape
        UserName = 'AvisoFeriasShp3'
        mmHeight = 28046
        mmLeft = 2910
        mmTop = 144992
        mmWidth = 192088
        BandType = 4
      end
      object AvisoFeriasShp1: TppShape
        UserName = 'AvisoFeriasShp1'
        mmHeight = 25665
        mmLeft = 2646
        mmTop = 2646
        mmWidth = 192088
        BandType = 4
      end
      object AvisoFeriasDbTxt2: TppDBText
        UserName = 'AvisoFeriasDbTxt2'
        DataField = 'CGC'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 10319
        mmWidth = 93398
        BandType = 4
      end
      object AvisoFeriasDbTxt1: TppDBText
        UserName = 'AvisoFeriasDbTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 5027
        mmWidth = 187325
        BandType = 4
      end
      object AvisoFeriasDbTxt3: TppDBText
        UserName = 'AvisoFeriasDbTxt3'
        DataField = 'INSCRICAO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 10319
        mmWidth = 93398
        BandType = 4
      end
      object AvisoFeriasDbTxt4: TppDBText
        UserName = 'AvisoFeriasDbTxt4'
        DataField = 'ENDERECO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 17463
        mmWidth = 187325
        BandType = 4
      end
      object AvisoFeriasLbl1: TppLabel
        UserName = 'AvisoFeriasLbl1'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 23813
        mmWidth = 12171
        BandType = 4
      end
      object AvisoFeriasLbl2: TppLabel
        UserName = 'AvisoFeriasLbl2'
        Caption = 'AVISO DE FÉRIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 75671
        mmTop = 34131
        mmWidth = 36777
        BandType = 4
      end
      object AvisoFeriasShp2: TppShape
        UserName = 'AvisoFeriasShp2'
        mmHeight = 11377
        mmLeft = 2646
        mmTop = 53975
        mmWidth = 192000
        BandType = 4
      end
      object AvisoFeriasMem1: TppMemo
        UserName = 'AvisoFeriasMem1'
        Caption = '7'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          '                                                       '
          
            ' A empresa comunica de acordo com os Artigos 129 e 130, a conces' +
            'sao das férias ao funcionário discriminado abaixo:')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 12965
        mmLeft = 2646
        mmTop = 41275
        mmWidth = 192000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem2: TppMemo
        UserName = 'AvisoFeriasMem2'
        Caption = 'Memo3'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          
            'Fica estabelecido que as férias serão concedidas de acordo com a' +
            ' tabela abaixo, em comparação ao período a que se refere')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7673
        mmLeft = 2646
        mmTop = 66940
        mmWidth = 192000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem5: TppMemo
        UserName = 'AvisoFeriasMem5'
        Caption = 'Memo4'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'DIAS DE DURACAO'
          '            30 (trinta)'
          '            24 (vinte e quatro)'
          '            18 (dezoito)'
          '            12 (doze)'
          '            00 (zero)')
        Transparent = True
        mmHeight = 26194
        mmLeft = 115359
        mmTop = 77258
        mmWidth = 37042
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasLbl3: TppLabel
        UserName = 'AvisoFeriasLbl3'
        Caption = 'Cód:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 55298
        mmWidth = 5821
        BandType = 4
      end
      object AvisoFeriasDbTxt5: TppDBText
        UserName = 'AvisoFeriasDbTxt5'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 11642
        mmTop = 55298
        mmWidth = 16404
        BandType = 4
      end
      object AvisoFeriasLbl6: TppLabel
        UserName = 'AvisoFeriasLbl6'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 55298
        mmWidth = 7938
        BandType = 4
      end
      object AvisoFeriasDbTxt9: TppDBText
        UserName = 'AvisoFeriasDbTxt9'
        AutoSize = True
        DataField = 'EMPREGADO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 55298
        mmWidth = 18521
        BandType = 4
      end
      object AvisoFeriasLbl4: TppLabel
        UserName = 'AvisoFeriasLbl4'
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 60061
        mmWidth = 8467
        BandType = 4
      end
      object AvisoFeriasDbTxt6: TppDBText
        UserName = 'AvisoFeriasDbTxt6'
        AutoSize = True
        DataField = 'CARGO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 14288
        mmTop = 60061
        mmWidth = 10319
        BandType = 4
      end
      object AvisoFeriasLbl7: TppLabel
        UserName = 'AvisoFeriasLbl7'
        Caption = 'Centro de Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 60061
        mmWidth = 21431
        BandType = 4
      end
      object AvisoFeriasDbTxt10: TppDBText
        UserName = 'AvisoFeriasDbTxt10'
        AutoSize = True
        DataField = 'C_CUSTO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 60061
        mmWidth = 13494
        BandType = 4
      end
      object AvisoFeriasLbl5: TppLabel
        UserName = 'AvisoFeriasLbl5'
        Caption = 'CTPS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 55298
        mmWidth = 7673
        BandType = 4
      end
      object AvisoFeriasDbTxt7: TppDBText
        UserName = 'AvisoFeriasDbTxt7'
        DataField = 'CTPS_NUM'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 55298
        mmWidth = 28310
        BandType = 4
      end
      object AvisoFeriasDbTxt8: TppDBText
        UserName = 'AvisoFeriasDbTxt8'
        AutoSize = True
        DataField = 'CTPS_UF'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 75936
        mmTop = 55298
        mmWidth = 12965
        BandType = 4
      end
      object AvisoFeriasMem3: TppMemo
        UserName = 'AvisoFeriasMem3'
        Caption = 'AvisoFeriasMem3'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'DIAS DE FALTAS INJUSTIFICADAS'
          '    00 (zero)'
          '    06 (seis)'
          '    15 (quinze)'
          '    24 (vinte e quatro)'
          '    mais de 32 (trinta e dois)')
        Transparent = True
        mmHeight = 26194
        mmLeft = 49742
        mmTop = 77258
        mmWidth = 46567
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem4: TppMemo
        UserName = 'AvisoFeriasMem4'
        Caption = 'AvisoFeriasMem4'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'a  05 (cinco)'
          'a  14 (quatorze)'
          'a  23 (vinte e tres)'
          'a  32 (trinta e dois)')
        Transparent = True
        mmHeight = 15346
        mmLeft = 78581
        mmTop = 80698
        mmWidth = 24871
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem7: TppMemo
        UserName = 'AvisoFeriasMem7'
        Caption = 'Memo7'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Lines.Strings = (
          '(até 15 (quinze) dias antes do início das férias)'
          
            'O empregado acima solicita a concessão do abono pecuniário 1/3 (' +
            'um terço) do valor das férias')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 43127
        mmTop = 136261
        mmWidth = 116946
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem9: TppMemo
        UserName = 'AvisoFeriasMem9'
        Caption = 'Memo10'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          
            '    Pelo presente instrumento, estou informado sobre minhas féri' +
            'as:'
          ''
          ''
          '    Data ____ /____ /________'
          ''
          ''
          
            '    _________________________________________                   ' +
            '              __________________________________________________' +
            '__________'
          
            '                      Assinatura do Empregado                   ' +
            '                                                               C' +
            'arimbo e Assinatura do Empregador'
          ''
          ''
          ''
          '')
        Transparent = True
        mmHeight = 34660
        mmLeft = 2646
        mmTop = 175948
        mmWidth = 192088
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasLbl10: TppLabel
        UserName = 'AvisoFeriasLbl10'
        Caption = 'SOLICITAÇÃO DE ALTERAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 146050
        mmWidth = 42598
        BandType = 4
      end
      object rpAvisoFeriasShape2: TppShape
        UserName = 'rpAvisoFeriasShape2'
        mmHeight = 5027
        mmLeft = 45773
        mmTop = 153988
        mmWidth = 5027
        BandType = 4
      end
      object rpAvisoFeriasShape3: TppShape
        UserName = 'rpAvisoFeriasShape3'
        mmHeight = 5027
        mmLeft = 63500
        mmTop = 153988
        mmWidth = 5027
        BandType = 4
      end
      object rpAvisoFeriasShape4: TppShape
        UserName = 'rpAvisoFeriasShape4'
        mmHeight = 5027
        mmLeft = 70644
        mmTop = 160073
        mmWidth = 5027
        BandType = 4
      end
      object rpAvisoFeriasShape5: TppShape
        UserName = 'rpAvisoFeriasShape5'
        mmHeight = 5027
        mmLeft = 88371
        mmTop = 160073
        mmWidth = 5027
        BandType = 4
      end
      object AvisoFeriasLbl8: TppLabel
        UserName = 'AvisoFeriasLbl8'
        Caption = 'SOLICITAÇÃO DE ABONO PECUNIÁRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 75406
        mmTop = 131763
        mmWidth = 52652
        BandType = 4
      end
      object AvisoFeriasLbl11: TppLabel
        UserName = 'AvisoFeriasLbl11'
        Caption = 'Período aquisitivo de DD/MM/AAAA a DD/MM/AAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 105304
        mmWidth = 64029
        BandType = 4
      end
      object AvisoFeriasLbl12: TppLabel
        UserName = 'AvisoFeriasLbl12'
        Caption = 'Dias de Duração: 00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 112184
        mmWidth = 24871
        BandType = 4
      end
      object AvisoFeriasLbl13: TppLabel
        UserName = 'AvisoFeriasLbl13'
        Caption = 'Período de Gozo de DD/MM/AAAA a DD/MM/AAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 119327
        mmWidth = 62971
        BandType = 4
      end
      object AvisoFeriasLbl14: TppLabel
        UserName = 'AvisoFeriasLbl14'
        AutoSize = False
        Caption = 'Alterar a data de início das férias  ____ / ____ / _______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 148167
        mmWidth = 62971
        BandType = 4
      end
      object AvisoFeriasLbl15: TppLabel
        UserName = 'AvisoFeriasLbl15'
        AutoSize = False
        Caption = 'Antecipação do 13º salário          SIM                NÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 155046
        mmWidth = 59267
        BandType = 4
      end
      object AvisoFeriasLbl16: TppLabel
        UserName = 'AvisoFeriasLbl16'
        AutoSize = False
        Caption = 
          'Abono pecuniário (um terço) do período de férias          SIM   ' +
          '             NÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 161132
        mmWidth = 84138
        BandType = 4
      end
      object AvisoFeriasLbl17: TppLabel
        UserName = 'AvisoFeriasLbl17'
        AutoSize = False
        Caption = 
          'Parcelamento da devolução do adiantamento de férias em _________' +
          '____ vezes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 167746
        mmWidth = 89959
        BandType = 4
      end
      object rpAvisoFeriasSysVar1: TppSystemVariable
        UserName = 'rpAvisoFeriasSysVar1'
        AutoSize = False
        VarType = vtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 23813
        mmWidth = 24077
        BandType = 4
      end
    end
    object rpAvisoFeriasFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
  end
  object ppAvisoFerias: TppBDEPipeline
    DataSource = dsAvisoFerias
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'AvisoFerias'
    Left = 116
    Top = 129
    object ppAvisoFeriasppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField3: TppField
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField4: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField5: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField6: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField7: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField8: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField9: TppField
      FieldAlias = 'ANTECIPACAO13'
      FieldName = 'ANTECIPACAO13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField10: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField11: TppField
      FieldAlias = 'CTPS_NUM'
      FieldName = 'CTPS_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField12: TppField
      FieldAlias = 'CTPS_UF'
      FieldName = 'CTPS_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField13: TppField
      FieldAlias = 'INIPERIODOFERIAS'
      FieldName = 'INIPERIODOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField14: TppField
      FieldAlias = 'FIMPERIODOFERIAS'
      FieldName = 'FIMPERIODOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField15: TppField
      FieldAlias = 'INIGOZOFERIAS'
      FieldName = 'INIGOZOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField16: TppField
      FieldAlias = 'FIMGOZOFERIAS'
      FieldName = 'FIMGOZOFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField17: TppField
      FieldAlias = 'DIASDEFERIAS'
      FieldName = 'DIASDEFERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField18: TppField
      FieldAlias = 'FLGABONO'
      FieldName = 'FLGABONO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppAvisoFeriasppField19: TppField
      FieldAlias = 'QTDPARCDEVOL'
      FieldName = 'QTDPARCDEVOL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object dsAvisoFerias: TDataSource
    DataSet = qryAvisoFerias
    Left = 116
    Top = 117
  end
  object updSQL: TUpdateSQL
    Left = 504
    Top = 4
  end
  object qryAvisoFerias: TQuery
    CachedUpdates = True
    AfterOpen = qryVariavelMensalAfterOpen
    AfterScroll = qryAvisoFeriasAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS CGC,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  '#39'1234'#39' AS UF,'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      '  '#39'123456789012345678901234567890'#39' AS C_CUSTO,'
      '  '#39'12345678901234567890123456789012345'#39' AS ANTECIPACAO13,'
      '  '#39'12345678901234567890123456789012345678901234567890'#39' AS CARGO,'
      '  '#39'12345678901234567890'#39' AS CTPS_NUM,'
      '  '#39'1234'#39' AS CTPS_UF,'
      '  '#39'1234567890'#39' AS INIPERIODOFERIAS,'
      '  '#39'1234567890'#39' AS FIMPERIODOFERIAS,'
      '  '#39'1234567890'#39' AS INIGOZOFERIAS,'
      '  '#39'1234567890'#39' AS FIMGOZOFERIAS,'
      '  '#39'1234567890'#39' AS DIASDEFERIAS,'
      '  0 AS FLGABONO,'
      '  0 AS QTDPARCDEVOL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' '
      ' ')
    Left = 116
    Top = 104
  end
  object rpLancRubReemb: TppReport
    AutoStop = False
    DataPipeline = ppLancRubReemb
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos de Rubricas Individuais'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 8350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 338
    Top = 39
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLancRubReemb'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 52917
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 4498
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 13229
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'ppLabel17'
        Caption = 'LANÇAMENTO DE RUBRICAS DE REEMBOLSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 18521
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 8996
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 14023
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText6'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 7673
        mmWidth = 6350
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText7'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 4498
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText8'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 12435
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 47096
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel20'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 47096
        mmWidth = 8467
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 5027
        mmTop = 51594
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel21'
        AutoSize = False
        Caption = 'Valor do Reembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 47096
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText9'
        DataField = 'CODIGORUBRICA'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 39158
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText10'
        DataField = 'NOMERUBRICA'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 39158
        mmWidth = 119592
        BandType = 0
      end
      object rpLancRubReembLabel1: TppLabel
        UserName = 'rpLancRubReembLabel1'
        Caption = 'Rubrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 39158
        mmWidth = 11642
        BandType = 0
      end
      object rpLancRubReembLabel2: TppLabel
        UserName = 'rpLancRubReembLabel2'
        AutoSize = False
        Caption = 'Mês/Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 114565
        mmTop = 47096
        mmWidth = 14817
        BandType = 0
      end
      object rpLancRubReembLine1: TppLine
        UserName = 'rpLancRubReembLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 5027
        mmTop = 24871
        mmWidth = 191559
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 8996
        mmWidth = 7938
        BandType = 0
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 13229
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Assinatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 46831
        mmWidth = 19050
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'A nossa assinatura, aposta abaixo, implica em nossa concordância' +
            ' com o valor respectivo e autorização para que o mesmo seja '
          'debitado pela Folha de Pagamento no mês indicado.')
        Transparent = True
        mmHeight = 8202
        mmLeft = 7144
        mmTop = 28046
        mmWidth = 187061
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'ppDBText17'
        DataField = 'MATRICULA'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 1852
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText20'
        DataField = 'FUNCIONARIO'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 1852
        mmWidth = 84402
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'ppDBText22'
        DataField = 'VALORLANCADO'
        DataPipeline = ppLancRubReemb
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 1852
        mmWidth = 19050
        BandType = 4
      end
      object rpLancRubReembDBText1: TppDBText
        UserName = 'rpLancRubReembDBText1'
        DataField = 'ANOMES'
        DataPipeline = ppLancRubReemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubReemb'
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 1852
        mmWidth = 12965
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 166688
        mmTop = 5027
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8000
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      AfterPrint = rpVarMensalSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 794
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'CODIGORUBRICA'
      DataPipeline = ppLancRubReemb
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppLancRubReemb'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'ppLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 5027
          mmTop = 529
          mmWidth = 191559
          BandType = 5
          GroupNo = 1
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          AutoSize = False
          Caption = 'TOTAL LANÇADO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 103452
          mmTop = 2381
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'VALORLANCADO'
          DataPipeline = ppLancRubReemb
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancRubReemb'
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 2381
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppLancRubReemb: TppBDEPipeline
    DataSource = dsLancRubReemb
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'LancRubReemb'
    Left = 338
    Top = 29
  end
  object dsLancRubReemb: TDataSource
    DataSet = qryLancRubReemb
    Left = 338
    Top = 17
  end
  object qryLancRubReemb: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.RAZAOSOCIAL AS EMPRESA,'
      '  CGC.NUM        AS CGC,'
      '  ES.CODESTADO   AS UF,'
      
        '  RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.NUMERO ||'#39#39'|| DECODE(E.COMPLEME' +
        'NTO,'#39' '#39','#39' - '#39' ||'#39#39'||'
      
        '    RTRIM(E.COMPLEMENTO)) ||'#39' - '#39'|| RTRIM(E.BAIRRO) ||'#39' - '#39'|| RT' +
        'RIM(CIDADES.NOME) ||'#39' - CEP:'#39'||'
      
        '    RTRIM(SUBSTR(E.CEP,1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR(E.CEP,6,3)) AS' +
        ' ENDERECO,'
      
        '  SUBSTR(RI.ANOMESINICIO,6,2) ||'#39#39'/'#39#39'|| SUBSTR(RI.ANOMESINICIO,1' +
        ',4) ANOMES,'
      '  RI.ANOMESINICIO,'
      '  RP.CODPROVDESC   AS CODIGORUBRICA,'
      '  RP.DESCRPROVDESC AS NOMERUBRICA,'
      '  RI.VALORRUBRICA  AS VALORLANCADO,'
      '  DECODE(RI.FLGPERMANENTE,1,'#39'Sim'#39','#39'Não'#39')        AS PERMANENTE,'
      
        '  DECODE(RI.FLGPERMANENTE,0,RI.NUMOCORRENCIAS,'#39#39') AS OCORRENCIAS' +
        ','
      '  DECODE(RI.FLGPERMANENTE,0,RI.PARCELAS,'#39#39')       AS PARCELAS,'
      
        '  RI.SEQRUBRICAINDIV                                AS SEQUENCIA' +
        ','
      '  F.MATRICULA,'
      '  UPPER(PF.NOME) AS FUNCIONARIO'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, ENDPESS E, RUBRICAXPESS RP, RUBRICAINDIV' +
        ' RI,'
      
        '  FUNCIONARIO F, PROVDESC PD, CIDADES, ESTADO ES, FILIALPESSOA F' +
        'P,'
      '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,'
      
        '          RTRIM(TDO.SIGLADOCUMENTO ||'#39' '#39'|| DO.NUMDOCUMENTO) AS N' +
        'UM'
      '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP'
      '   WHERE  ((RTRIM(TDO.SIGLADOCUMENTO) = '#39'CNPJ:'#39')    OR'
      '           (RTRIM(TDO.SIGLADOCUMENTO) = '#39'CGC:'#39'))   AND'
      '          (FP.IDFILIALPESSOA          = DO.IDPESSOA) AND'
      '          (DO.IDDOCUMENTO             = TDO.IDDOCUMENTO)) CGC'
      'WHERE'
      '  (RP.IDPESSOA  = 2)         AND'
      
        '  (RP.CODPROVDESC IN ('#39'3824'#39','#39'9000'#39','#39'01064'#39','#39'01088'#39','#39'01203'#39','#39'379' +
        '7'#39','#39'01230'#39','#39'01072'#39'))   AND'
      '  (F.CODCENTROCUSTO IN ('#39'423'#39')) AND'
      '  (PJ.IDPESSOA   = 535)       AND'
      '  (RI.FLGPERMANENTE  = 1)      AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)       AND'
      '  (PJ.IDPESSOA       = CGC.IDPESSOA)      AND'
      '  (PJ.IDPESSOA       = E.IDPESSOA)        AND'
      '  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND'
      '  (F.IDESTAB         = PJ.IDPESSOA)       AND'
      '  (F.IDPESSOA        = RI.IDPESSOA)       AND'
      '  (RI.IDRUBRICA      = PD.IDPROVENTO)     AND'
      '  (RI.IDRUBRICA      = RP.IDRUBRICA)      AND'
      '  (RI.IDPESSOA       = PF.IDPESSOA)       AND'
      '  (E.IDCIDADES       = CIDADES.IDCIDADES) AND'
      '  (CIDADES.IDESTADO  = ES.IDESTADO)'
      'ORDER BY'
      '  ANOMESINICIO, SEQRUBRICAINDIV, CODPROVDESC, FUNCIONARIO')
    Left = 338
    Top = 4
  end
  object rpDestacamento: TppReport
    AutoStop = False
    DataPipeline = ppDestacamento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Férias Programadas'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 7350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 462
    Top = 118
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDestacamento'
    object DestacamentoppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object DestacamentoppLblTitulo: TppLabel
        UserName = 'DestacamentoppLblTitulo'
        Caption = 'RELATÓRIO DE DESTACAMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 7673
        mmWidth = 47361
        BandType = 0
      end
      object DestacamentoppDBTxtEmpresa: TppDBText
        UserName = 'DestacamentoppDBTxtEmpresa'
        DataField = 'EMPRESA'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 102923
        BandType = 0
      end
      object DestacamentoppDBTxtCPFCGC: TppDBText
        UserName = 'DestacamentoppDBTxtCPFCGC'
        DataField = 'CGC'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 5556
        mmWidth = 38365
        BandType = 0
      end
      object DestacamentoppDBTxtTipo: TppDBText
        UserName = 'DestacamentoppDBTxtTipo'
        DataField = 'INSCRICAO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 9525
        mmWidth = 38365
        BandType = 0
      end
      object DestacamentoppDBTxtEndereco: TppDBText
        UserName = 'DestacamentoppDBTxtEndereco'
        DataField = 'ENDERECO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 14023
        mmWidth = 131234
        BandType = 0
      end
      object DestacamentorpLabel1: TppLabel
        UserName = 'DestacamentorpLabel1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 6879
        mmWidth = 19844
        BandType = 0
      end
      object DestacamentorpLabel2: TppLabel
        UserName = 'DestacamentorpLabel2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 11113
        mmWidth = 19844
        BandType = 0
      end
      object rpDestacamentoLabel1: TppLabel
        UserName = 'rpDestacamentoLabel1'
        AutoSize = False
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 2646
        mmWidth = 19844
        BandType = 0
      end
      object rpDestacamentoDBText1: TppDBText
        UserName = 'rpDestacamentoDBText1'
        DataField = 'UF'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 2646
        mmWidth = 23548
        BandType = 0
      end
      object rpCadDependenteLabel5: TppLabel
        UserName = 'rpCadDependenteLabel5'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 15346
        mmWidth = 19844
        BandType = 0
      end
      object rpCadDependenteDBText1: TppDBText
        UserName = 'rpCadDependenteDBText1'
        DataField = 'REFERENCIA'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 15346
        mmWidth = 33338
        BandType = 0
      end
      object DestacamentorpLblMatricula: TppLabel
        UserName = 'DestacamentorpLblMatricula'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 28310
        mmWidth = 12435
        BandType = 0
      end
      object DestacamentorpLblNome: TppLabel
        UserName = 'DestacamentorpLblNome'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 14552
        mmTop = 28310
        mmWidth = 68263
        BandType = 0
      end
      object DestacamentorpLblAvos1: TppLabel
        UserName = 'DestacamentorpLblAvos1'
        AutoSize = False
        Caption = 'Período da Viagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 84138
        mmTop = 24606
        mmWidth = 27781
        BandType = 0
      end
      object rpCadDependenteLabel2: TppLabel
        UserName = 'rpCadDependenteLabel2'
        Caption = 'Transporte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 131234
        mmTop = 25400
        mmWidth = 11906
        BandType = 0
      end
      object rpCadDependenteLabel6: TppLabel
        UserName = 'rpCadDependenteLabel6'
        AutoSize = False
        Caption = '      de             até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 84138
        mmTop = 28310
        mmWidth = 27781
        BandType = 0
      end
      object rpFeriasProgramLabel2: TppLabel
        UserName = 'rpFeriasProgramLabel2'
        Caption = 'Diárias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 133615
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object DestacamentorpCalc1: TppSystemVariable
        UserName = 'DestacamentorpCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 6879
        mmWidth = 23548
        BandType = 0
      end
      object DestacamentorpCalc2: TppSystemVariable
        UserName = 'DestacamentorpCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 11113
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label2'
        Caption = 'Total Adto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 131498
        mmTop = 28575
        mmWidth = 11853
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Itinerário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 176742
        mmTop = 28310
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Natureza/Justificativa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 202671
        mmTop = 28310
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Objetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 113771
        mmTop = 28310
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'ADIANTAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 127265
        mmTop = 18521
        mmWidth = 19516
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label4'
        Caption = 'Outras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 158132
        mmTop = 25400
        mmWidth = 7324
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label5'
        Caption = 'Alimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 155307
        mmTop = 21960
        mmWidth = 13504
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label6'
        Caption = 'Total Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 153549
        mmTop = 28575
        mmWidth = 17018
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        Caption = 'ACERTO CONTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 151303
        mmTop = 18521
        mmWidth = 21251
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Refere-se a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 19315
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PERIODOREF'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 19315
        mmWidth = 33338
        BandType = 0
      end
    end
    object DestacamentoppDetailBand15: TppDetailBand
      BeforePrint = DestacamentoppDetailBand15BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object DestacamentorpDBText1: TppDBText
        UserName = 'DestacamentorpDBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object DestacamentorpDBText2: TppDBText
        UserName = 'DestacamentorpDBText2'
        DataField = 'EMPREGADO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 14552
        mmTop = 794
        mmWidth = 68263
        BandType = 4
      end
      object rpCadDependenteDBText3: TppDBText
        UserName = 'rpCadDependenteDBText3'
        DataField = 'DATAINI'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 84138
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object rpCadDependenteDBText4: TppDBText
        UserName = 'rpCadDependenteDBText4'
        DataField = 'DATAFIM'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 98161
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object rpDestacamentoDiarias: TppVariable
        UserName = 'rpDestacamentoDiarias'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 130704
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object rpDestacamentoTransporte: TppVariable
        UserName = 'rpDestacamentoTransporte'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 130969
        mmTop = 4763
        mmWidth = 13758
        BandType = 4
      end
      object rpDestacamentoValorTotal: TppVariable
        UserName = 'rpDestacamentoValorTotal'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 130440
        mmTop = 8731
        mmWidth = 14288
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1000
        mmLeft = 794
        mmTop = 100
        mmWidth = 283000
        BandType = 4
      end
      object ppDestacamentoObserv: TppDBMemo
        UserName = 'DestacamentoObserv'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 2910
        mmLeft = 202671
        mmTop = 794
        mmWidth = 80963
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpDestacamentoItinerario: TppMemo
        UserName = 'rpDestacamentoItinerario'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 176742
        mmTop = 794
        mmWidth = 24606
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'OBJETIVO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 113771
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object dbedValorAlim: TppDBText
        UserName = 'dbedValorAlim'
        DataField = 'VALALIMENT'
        DataPipeline = ppDestacamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbedValorAlim1'
        DataField = 'VALOUTROS'
        DataPipeline = ppDestacamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 4763
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'dbedValorAlim2'
        DataField = 'VALTOTAL'
        DataPipeline = ppDestacamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 8731
        mmWidth = 14023
        BandType = 4
      end
    end
    object DestacamentoppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object DestacamentorpSummaryBand1: TppSummaryBand
      AfterPrint = rpVarMensalSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object rpCadDependenteLabel3: TppLabel
        UserName = 'rpCadDependenteLabel3'
        AutoSize = False
        Caption = 'Nº de Destacamentos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 4498
        mmWidth = 33073
        BandType = 7
      end
      object rpCadDependenteDBCalc1: TppDBCalc
        UserName = 'rpCadDependenteDBCalc1'
        DataField = 'EMPREGADO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3440
        mmLeft = 35454
        mmTop = 4498
        mmWidth = 37835
        BandType = 7
      end
      object rpDestacamentoTotDiarias: TppVariable
        UserName = 'rpDestacamentoDiarias1'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 128852
        mmTop = 4498
        mmWidth = 15875
        BandType = 7
      end
      object rpDestacamentoTotTransporte: TppVariable
        UserName = 'rpDestacamentoTransporte1'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 128323
        mmTop = 8467
        mmWidth = 16404
        BandType = 7
      end
      object rpDestacamentoTotValorTotal: TppVariable
        UserName = 'rpDestacamentoValorTotal1'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 121709
        mmTop = 12700
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label3'
        Caption = 'Totais de Adtos. e Despesas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 76200
        mmTop = 4498
        mmWidth = 45244
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALALIMENT'
        DataPipeline = ppDestacamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3440
        mmLeft = 152136
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALOUTROS'
        DataPipeline = ppDestacamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3440
        mmLeft = 152136
        mmTop = 8467
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VALTOTAL'
        DataPipeline = ppDestacamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 3440
        mmLeft = 152136
        mmTop = 12700
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDestacamento: TppBDEPipeline
    DataSource = dsDestacamento
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Destacamento'
    Left = 422
    Top = 105
  end
  object dsDestacamento: TDataSource
    DataSet = qryDestacamento
    Left = 470
    Top = 69
  end
  object qryDestacamento: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  '#39'1234567890'#39' AS IDPESSOA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      '  '#39'12345678901234567890'#39' AS CGC,'
      '  '#39'12345678901234567890'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      '  '#39'1234'#39' AS UF,'
      '  '#39'12345678901234567890'#39' AS MATRICULA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      '  '#39'1234567890123456789012345678'#39' AS REFERENCIA,'
      '  '#39'1234567890123456789012345678'#39' AS PERIODOREF,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM,'
      '  RPAD('#39'1'#39',200,'#39'1'#39') AS OBSERVACAO,'
      '  '#39'Treinamento'#39' AS OBJETIVO,'
      '  0 AS IDDESTACAMENTO,'
      '  0 AS VLRACERTO,'
      '  0 AS VALALIMENT,'
      '  0 AS VALOUTROS,'
      '  0 AS VALTOTAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    Left = 422
    Top = 80
  end
  object qryCalen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDESTACAMENTO, DATADESTACAMENTO, '
      '      FLGDIARIA, VLRDIARIA'
      'FROM DSTCALENDARIO'
      'WHERE IDDESTACAMENTO = :IDDESTACAMENTO'
      'ORDER BY DATADESTACAMENTO')
    ControlType.Strings = (
      'FLGDIARIA;CheckBox;0;1')
    ValidateWithMask = True
    Left = 504
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDESTACAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryTrecho: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDDESTACAMENTO, '
      'D.NUMSEQ         ,'
      'D.IDCIDADES     , '
      'D.DATAINI       , '
      'D.INDTRANSPORTE  ,'
      'D.FLGTRANSPORTE , '
      'D.VLRTRANSPORTE , '
      'D.VLREMBARQUE   , '
      'D.VLRDESEMBARQUE ,'
      'C.NOME '
      'FROM DSTTRECHO D, CIDADES C'
      'WHERE D.IDDESTACAMENTO = :IDDESTACAMENTO'
      'AND       D.IDCIDADES = C.IDCIDADES'
      'ORDER BY D.DATAINI')
    ValidateWithMask = True
    Left = 552
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDESTACAMENTO'
        ParamType = ptUnknown
      end>
  end
  object rpCadDependente: TppReport
    AutoStop = False
    DataPipeline = ppCadDependente
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 482
    Top = 217
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppCadDependente'
    object rpCadDependenteHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object rpCadDependenteLbl1: TppLabel
        UserName = 'rpCadDependenteLbl1'
        AutoSize = False
        Caption = 'RELAÇÃO DE DEPENDENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 9525
        mmWidth = 103717
        BandType = 0
      end
      object rpCadDependenteDBTxt1: TppDBText
        UserName = 'rpCadDependenteDBTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 102923
        BandType = 0
      end
      object rpCadDependenteDBTxt2: TppDBText
        UserName = 'rpCadDependenteDBTxt2'
        DataField = 'CGC'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 5556
        mmWidth = 38365
        BandType = 0
      end
      object rpCadDependenteDBTxt3: TppDBText
        UserName = 'rpCadDependenteDBTxt3'
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 9525
        mmWidth = 38365
        BandType = 0
      end
      object rpCadDependenteDBTxt4: TppDBText
        UserName = 'rpCadDependenteDBTxt4'
        DataField = 'ENDERECO'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 14288
        mmWidth = 144198
        BandType = 0
      end
      object rpCadDependenteLbl3: TppLabel
        UserName = 'rpCadDependenteLbl3'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 6615
        mmWidth = 19844
        BandType = 0
      end
      object rpCadDependenteLbl4: TppLabel
        UserName = 'rpCadDependenteLbl4'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 10848
        mmWidth = 19844
        BandType = 0
      end
      object rpCadDependenteLbl2: TppLabel
        UserName = 'rpCadDependenteLbl2'
        AutoSize = False
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 2117
        mmWidth = 19844
        BandType = 0
      end
      object rpCadDependenteDBTxt5: TppDBText
        UserName = 'rpCadDependenteDBTxt5'
        DataField = 'UF'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 2117
        mmWidth = 23548
        BandType = 0
      end
      object rpCadDependenteSysVar1: TppSystemVariable
        UserName = 'rpCadDependenteSysVar1'
        AutoSize = False
        VarType = vtPageSet
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 6615
        mmWidth = 23548
        BandType = 0
      end
      object rpCadDependenteSysVar2: TppSystemVariable
        UserName = 'rpCadDependenteSysVar2'
        AutoSize = False
        VarType = vtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 10848
        mmWidth = 23548
        BandType = 0
      end
    end
    object rpCadDependenteDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpCadDependenteDBTxt10: TppDBText
        UserName = 'rpCadDependenteDBTxt10'
        DataField = 'DEPENDENTE'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 529
        mmWidth = 84402
        BandType = 4
      end
      object rpCadDependenteDBTxt11: TppDBText
        UserName = 'rpCadDependenteDBTxt11'
        DataField = 'DATANASC'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3440
        mmLeft = 96309
        mmTop = 529
        mmWidth = 27781
        BandType = 4
      end
      object rpCadDependenteDBTxt12: TppDBText
        UserName = 'rpCadDependenteDBTxt12'
        DataField = 'DEPENDENCIA'
        DataPipeline = ppCadDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCadDependente'
        mmHeight = 3440
        mmLeft = 134938
        mmTop = 529
        mmWidth = 49742
        BandType = 4
      end
    end
    object rpCadDependenteFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object rpCadDependenteSmryBnd1: TppSummaryBand
      AfterPrint = rpVarMensalSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
    object rpCadDependenteGrp1: TppGroup
      BreakName = 'ESTAB'
      DataPipeline = ppCadDependente
      OutlineSettings.CreateNode = True
      UserName = 'rpCadDependenteGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCadDependente'
      object rpCadDependenteGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpCadDependenteGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLine10: TppLine
          UserName = 'Line10'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 1058
          mmTop = 1852
          mmWidth = 195792
          BandType = 5
          GroupNo = 0
        end
        object rpCadDependenteLbl12: TppLabel
          UserName = 'rpCadDependenteLbl12'
          AutoSize = False
          Caption = 'Nº Total de Dependentes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 3440
          mmWidth = 37306
          BandType = 5
          GroupNo = 0
        end
        object rpCadDependenteDBCalc2: TppDBCalc
          UserName = 'rpCadDependenteDBCalc2'
          DataField = 'DEPENDENTE'
          DataPipeline = ppCadDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpCadDependenteGrp1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppCadDependente'
          mmHeight = 3704
          mmLeft = 39158
          mmTop = 3440
          mmWidth = 37835
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpCadDependenteGrp2: TppGroup
      BreakName = 'EMPREGADO'
      DataPipeline = ppCadDependente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'rpCadDependenteGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCadDependente'
      object rpCadDependenteGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 6085
          mmLeft = 1058
          mmTop = 794
          mmWidth = 195792
          BandType = 3
          GroupNo = 1
        end
        object rpCadDependenteLbl6: TppLabel
          UserName = 'rpCadDependenteLbl6'
          AutoSize = False
          Caption = 'Empregado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 42598
          mmTop = 2117
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object rpCadDependenteLine1: TppLine
          UserName = 'rpCadDependenteLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 1058
          mmTop = 11377
          mmWidth = 195792
          BandType = 3
          GroupNo = 1
        end
        object rpCadDependenteLbl8: TppLabel
          UserName = 'rpCadDependenteLbl8'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 7408
          mmWidth = 84402
          BandType = 3
          GroupNo = 1
        end
        object rpCadDependenteLbl10: TppLabel
          UserName = 'rpCadDependenteLbl10'
          AutoSize = False
          Caption = 'Dependência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 135202
          mmTop = 7408
          mmWidth = 49742
          BandType = 3
          GroupNo = 1
        end
        object rpCadDependenteDBTxt7: TppDBText
          UserName = 'rpCadDependenteDBTxt7'
          DataField = 'EMPREGADO'
          DataPipeline = ppCadDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCadDependente'
          mmHeight = 3704
          mmLeft = 62706
          mmTop = 2117
          mmWidth = 91281
          BandType = 3
          GroupNo = 1
        end
        object rpCadDependenteLbl9: TppLabel
          UserName = 'rpCadDependenteLbl9'
          AutoSize = False
          Caption = 'Data de Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 96573
          mmTop = 7408
          mmWidth = 27781
          BandType = 3
          GroupNo = 1
        end
        object ppLabel25: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Matrícula:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 2117
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppDBText28: TppDBText
          UserName = 'DBText2'
          DataField = 'MATRICULA'
          DataPipeline = ppCadDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCadDependente'
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 2117
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = 'Admissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 155046
          mmTop = 2117
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppDBText29: TppDBText
          UserName = 'DBText5'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppCadDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCadDependente'
          mmHeight = 3704
          mmLeft = 173302
          mmTop = 2117
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
      end
      object rpCadDependenteGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpCadDependenteLine2: TppLine
          UserName = 'rpCadDependenteLine2'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 1058
          mmTop = 265
          mmWidth = 195792
          BandType = 5
          GroupNo = 1
        end
        object rpCadDependenteLbl11: TppLabel
          UserName = 'rpCadDependenteLbl11'
          AutoSize = False
          Caption = 'Nº de Dependentes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1852
          mmWidth = 29633
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'rpCadDependenteDBCalc1'
          DataField = 'DEPENDENTE'
          DataPipeline = ppCadDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpCadDependenteGrp2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppCadDependente'
          mmHeight = 3704
          mmLeft = 31485
          mmTop = 1852
          mmWidth = 37835
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppCadDependente: TppBDEPipeline
    DataSource = dsCadDependente
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'CadDependente'
    Left = 482
    Top = 205
    object ppCadDependenteppField1: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField3: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField4: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField5: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField7: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField8: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField9: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField10: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppCadDependenteppField11: TppField
      FieldAlias = 'DEPENDENCIA'
      FieldName = 'DEPENDENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object dsCadDependente: TwwDataSource
    DataSet = qryCadDependente
    Left = 482
    Top = 193
  end
  object qryCadDependente: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39#39' AS ESTAB,'
      '  '#39#39' AS CGC,'
      '  '#39#39' AS ESTADUALMUNICIPAL,'
      '  '#39#39' AS ENDERECO,'
      '  '#39#39' AS UF,'
      '  '#39#39' AS MATRICULA,'
      '  '#39#39' AS EMPREGADO,'
      '  '#39#39' AS DATAADMISSAO,'
      '  '#39#39' AS DEPENDENTE,'
      '  '#39#39' AS DATANASC,'
      '  '#39#39' AS DEPENDENCIA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ValidateWithMask = True
    Left = 482
    Top = 181
  end
  object rpLancRubIndiv: TppReport
    AutoStop = False
    DataPipeline = ppLancRubIndiv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos de Rubricas Individuais'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 8350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 226
    Top = 50
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLancRubIndiv'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'ppLabel13'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 4498
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 13229
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'ppLabel17'
        Caption = 'LANÇAMENTO DE RUBRICAS INDIVIDUAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 18521
        mmWidth = 70115
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 8996
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 14023
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText6'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 7673
        mmWidth = 6350
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText7'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 4498
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'ppDBText8'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 12435
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel19'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 35190
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'ppLabel20'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 35190
        mmWidth = 8467
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'ppLine2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 5027
        mmTop = 39688
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel21'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 35190
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText9'
        DataField = 'CODIGORUBRICA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 27252
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText10'
        DataField = 'NOMERUBRICA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 27252
        mmWidth = 119592
        BandType = 0
      end
      object rpLancRubIndivLabel1: TppLabel
        UserName = 'rpLancRubIndivLabel1'
        Caption = 'Rubrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 27252
        mmWidth = 11642
        BandType = 0
      end
      object rpLancRubIndivLabel2: TppLabel
        UserName = 'rpLancRubIndivLabel2'
        AutoSize = False
        Caption = 'Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 95515
        mmTop = 35190
        mmWidth = 13229
        BandType = 0
      end
      object rpLancRubIndivLabel3: TppLabel
        UserName = 'rpLancRubIndivLabel3'
        AutoSize = False
        Caption = 'Permanente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 35190
        mmWidth = 19315
        BandType = 0
      end
      object rpLancRubIndivLabel4: TppLabel
        UserName = 'rpLancRubIndivLabel4'
        AutoSize = False
        Caption = 'Ocorrências'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 35190
        mmWidth = 19050
        BandType = 0
      end
      object rpLancRubIndivLabel5: TppLabel
        UserName = 'rpLancRubIndivLabel5'
        AutoSize = False
        Caption = 'Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 35190
        mmWidth = 13494
        BandType = 0
      end
      object rpLancRubIndivLabel6: TppLabel
        UserName = 'rpLancRubIndivLabel6'
        AutoSize = False
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 35190
        mmWidth = 9525
        BandType = 0
      end
      object rpLancRubIndivLine1: TppLine
        UserName = 'rpLancRubIndivLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 5027
        mmTop = 24871
        mmWidth = 191559
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 8996
        mmWidth = 7938
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 13229
        mmWidth = 22225
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText36: TppDBText
        UserName = 'ppDBText17'
        DataField = 'MATRICULA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText20'
        DataField = 'FUNCIONARIO'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 529
        mmWidth = 70115
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText22'
        DataField = 'VALORLANCADO'
        DataPipeline = ppLancRubIndiv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
      object rpLancRubIndivDBText1: TppDBText
        UserName = 'rpLancRubIndivDBText1'
        DataField = 'ANOMES'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 95515
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object rpLancRubIndivDBText2: TppDBText
        UserName = 'rpLancRubIndivDBText2'
        DataField = 'PERMANENTE'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object rpLancRubIndivDBText3: TppDBText
        UserName = 'rpLancRubIndivDBText3'
        DataField = 'OCORRENCIAS'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object rpLancRubIndivDBText4: TppDBText
        UserName = 'rpLancRubIndivDBText4'
        DataField = 'PARCELAS'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object rpLancRubIndivDBText5: TppDBText
        UserName = 'rpLancRubIndivDBText5'
        DataField = 'SALDO'
        DataPipeline = ppLancRubIndiv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 529
        mmWidth = 14500
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8000
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      AfterPrint = rpVarMensalSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 794
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'CODIGORUBRICA'
      DataPipeline = ppLancRubIndiv
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppLancRubIndiv'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine8: TppLine
          UserName = 'ppLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 5027
          mmTop = 529
          mmWidth = 191559
          BandType = 5
          GroupNo = 1
        end
        object ppLabel34: TppLabel
          UserName = 'ppLabel22'
          AutoSize = False
          Caption = 'TOTAL LANÇADO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 141288
          mmTop = 2381
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'VALORLANCADO'
          DataPipeline = ppLancRubIndiv
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancRubIndiv'
          mmHeight = 3704
          mmLeft = 170657
          mmTop = 2381
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppLancRubIndiv: TppBDEPipeline
    DataSource = dsLancRubIndiv
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'LancRubIndiv'
    Left = 226
    Top = 37
    object ppLancRubIndivppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppLancRubIndivppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 34
      DisplayWidth = 34
      Position = 1
    end
    object ppLancRubIndivppField3: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object ppLancRubIndivppField4: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 185
      DisplayWidth = 185
      Position = 3
    end
    object ppLancRubIndivppField5: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 4
    end
    object ppLancRubIndivppField6: TppField
      FieldAlias = 'ANOMESINICIO'
      FieldName = 'ANOMESINICIO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
    object ppLancRubIndivppField7: TppField
      FieldAlias = 'CODIGORUBRICA'
      FieldName = 'CODIGORUBRICA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppLancRubIndivppField8: TppField
      FieldAlias = 'NOMERUBRICA'
      FieldName = 'NOMERUBRICA'
      FieldLength = 130
      DisplayWidth = 130
      Position = 7
    end
    object ppLancRubIndivppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCADO'
      FieldName = 'VALORLANCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppLancRubIndivppField10: TppField
      FieldAlias = 'PERMANENTE'
      FieldName = 'PERMANENTE'
      FieldLength = 3
      DisplayWidth = 3
      Position = 9
    end
    object ppLancRubIndivppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'OCORRENCIAS'
      FieldName = 'OCORRENCIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppLancRubIndivppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS'
      FieldName = 'PARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppLancRubIndivppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQUENCIA'
      FieldName = 'SEQUENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppLancRubIndivppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppLancRubIndivppField15: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 14
    end
    object ppLancRubIndivppField16: TppField
      FieldAlias = 'FUNCIONARIO'
      FieldName = 'FUNCIONARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
  end
  object dsLancRubIndiv: TDataSource
    DataSet = qryLancRubIndiv
    Left = 226
    Top = 25
  end
  object qryLancRubIndiv: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.RAZAOSOCIAL AS EMPRESA,'
      '  CGC.NUM        AS CGC,'
      '  ES.CODESTADO   AS UF,'
      
        '  RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.NUMERO ||'#39#39'|| DECODE(E.COMPLEME' +
        'NTO,'#39' '#39','#39' - '#39' ||'#39#39'||'
      
        '    RTRIM(E.COMPLEMENTO)) ||'#39' - '#39'|| RTRIM(E.BAIRRO) ||'#39' - '#39'|| RT' +
        'RIM(CIDADES.NOME) ||'#39' - CEP:'#39'||'
      
        '    RTRIM(SUBSTR(E.CEP,1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR(E.CEP,6,3)) AS' +
        ' ENDERECO,'
      
        '  SUBSTR(RI.ANOMESINICIO,6,2) ||'#39#39'/'#39#39'|| SUBSTR(RI.ANOMESINICIO,1' +
        ',4) ANOMES,'
      '  RI.ANOMESINICIO,'
      '  RP.CODPROVDESC   AS CODIGORUBRICA,'
      '  RP.DESCRPROVDESC AS NOMERUBRICA,'
      '  RI.VALORRUBRICA  AS VALORLANCADO,'
      '  DECODE(RI.FLGPERMANENTE,1,'#39'Sim'#39','#39'Não'#39')        AS PERMANENTE,'
      
        '  DECODE(RI.FLGPERMANENTE,0,RI.NUMOCORRENCIAS,'#39#39') AS OCORRENCIAS' +
        ','
      '  DECODE(RI.FLGPERMANENTE,0,RI.PARCELAS,'#39#39')       AS PARCELAS,'
      
        '  RI.SEQRUBRICAINDIV                                AS SEQUENCIA' +
        ','
      '  0 AS SALDO,'
      '  F.MATRICULA,'
      '  UPPER(PF.NOME) AS FUNCIONARIO'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, ENDPESS E, RUBRICAXPESS RP, RUBRICAINDIV' +
        ' RI,'
      
        '  FUNCIONARIO F, PROVDESC PD, CIDADES, ESTADO ES, FILIALPESSOA F' +
        'P,'
      '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA,'
      
        '          RTRIM(TDO.SIGLADOCUMENTO ||'#39' '#39'|| DO.NUMDOCUMENTO) AS N' +
        'UM'
      '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO, FILIALPESSOA FP'
      '   WHERE  ((RTRIM(TDO.SIGLADOCUMENTO) = '#39'CNPJ:'#39')    OR'
      '           (RTRIM(TDO.SIGLADOCUMENTO) = '#39'CGC:'#39'))   AND'
      '          (FP.IDFILIALPESSOA          = DO.IDPESSOA) AND'
      '          (DO.IDDOCUMENTO             = TDO.IDDOCUMENTO)) CGC'
      'WHERE'
      '  (RP.IDPESSOA  = 2)         AND'
      
        '  (RP.CODPROVDESC IN ('#39'3824'#39','#39'9000'#39','#39'01064'#39','#39'01088'#39','#39'01203'#39','#39'379' +
        '7'#39','#39'01230'#39','#39'01072'#39'))   AND'
      '  (F.CODCENTROCUSTO IN ('#39'423'#39')) AND'
      '  (PJ.IDPESSOA   = 535)       AND'
      '  (RI.FLGPERMANENTE  = 1)      AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)       AND'
      '  (PJ.IDPESSOA       = CGC.IDPESSOA)      AND'
      '  (PJ.IDPESSOA       = E.IDPESSOA)        AND'
      '  (PJ.IDENDCOMERCIAL = E.IDENDERECO)      AND'
      '  (F.IDESTAB         = PJ.IDPESSOA)       AND'
      '  (F.IDPESSOA        = RI.IDPESSOA)       AND'
      '  (RI.IDRUBRICA      = PD.IDPROVENTO)     AND'
      '  (RI.IDRUBRICA      = RP.IDRUBRICA)      AND'
      '  (RI.IDPESSOA       = PF.IDPESSOA)       AND'
      '  (E.IDCIDADES       = CIDADES.IDCIDADES) AND'
      '  (CIDADES.IDESTADO  = ES.IDESTADO)'
      'ORDER BY'
      '  ANOMESINICIO, SEQRUBRICAINDIV, CODIGORUBRICA, FUNCIONARIO'
      ''
      '')
    Left = 226
    Top = 12
  end
end
