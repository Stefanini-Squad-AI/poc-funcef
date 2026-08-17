inherited dtmRelQuitacaoNaoEfetivada: TdtmRelQuitacaoNaoEfetivada
  Left = 294
  Top = 259
  Width = 289
  Height = 166
  Caption = 'dtmRelQuitacaoNaoEfetivada'
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
  object pplQuitacaoNaoEfetivada: TppBDEPipeline
    DataSource = dsQuitacaoNaoEfetivada
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 88
  end
  object dsQuitacaoNaoEfetivada: TwwDataSource
    DataSet = qryQuitacaoNaoEfetivada
    Left = 136
    Top = 72
  end
  object rptQuitacaoNaoEfetivada: TppReport
    AutoStop = False
    DataPipeline = pplQuitacaoNaoEfetivada
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Quitações Não Efetivadas'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    DataPipelineName = 'pplQuitacaoNaoEfetivada'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 32015
        mmWidth = 183886
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Quitações Não Efetivadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 265
        mmTop = 8731
        mmWidth = 183357
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
        mmTop = 24606
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
        mmLeft = 105834
        mmTop = 24606
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
        mmTop = 24606
        mmWidth = 68527
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
        mmLeft = 119063
        mmTop = 24606
        mmWidth = 64558
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
        mmTop = 19579
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
        mmLeft = 96573
        mmTop = 19579
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
        mmTop = 19579
        mmWidth = 66146
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
        mmLeft = 119063
        mmTop = 19579
        mmWidth = 64558
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 32015
        mmWidth = 183886
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplQuitacaoNaoEfetivada
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuitacaoNaoEfetivada'
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HMEPARCELA'
        DataPipeline = pplQuitacaoNaoEfetivada
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuitacaoNaoEfetivada'
        mmHeight = 3440
        mmLeft = 153194
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplQuitacaoNaoEfetivada
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuitacaoNaoEfetivada'
        mmHeight = 3440
        mmLeft = 53975
        mmTop = 529
        mmWidth = 94192
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplQuitacaoNaoEfetivada
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuitacaoNaoEfetivada'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MATRICULA'
        DataPipeline = pplQuitacaoNaoEfetivada
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuitacaoNaoEfetivada'
        mmHeight = 3440
        mmLeft = 19050
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = pplQuitacaoNaoEfetivada
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuitacaoNaoEfetivada'
        mmHeight = 3440
        mmLeft = 37042
        mmTop = 529
        mmWidth = 15081
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
      mmHeight = 11113
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplQuitacaoNaoEfetivada
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplQuitacaoNaoEfetivada'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 9525
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          Color = clSilver
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplQuitacaoNaoEfetivada
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplQuitacaoNaoEfetivada'
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 529
          mmWidth = 25400
          BandType = 3
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 9260
          mmWidth = 183622
          BandType = 3
          GroupNo = 2
        end
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
          mmTop = 5556
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
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
          mmLeft = 19050
          mmTop = 5556
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
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
          mmLeft = 53975
          mmTop = 5556
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 153194
          mmTop = 5556
          mmWidth = 10054
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Data Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 165100
          mmTop = 5556
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Insc.Prev.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 37042
          mmTop = 5556
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 183622
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryQuitacaoNaoEfetivada: TwwQuery
    BeforeOpen = qryQuitacaoNaoEfetivadaBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  CON.TCEDESCRICAO,                                             ' +
        '                     '
      
        '  CON.IDCONTRATOEMPTMO,                                         ' +
        '                     '
      
        '  CON.INSCRICAONUMERO,                                          ' +
        '                     '
      
        '  CON.MATRICULA,                                                ' +
        '                     '
      
        '  CON.NOME,                                                     ' +
        '                     '
      
        '  HME.HMEPARCELA,                                               ' +
        '                     '
      
        '  HME.HMEDATAPREVISTA                                           ' +
        '                     '
      
        'FROM                                                            ' +
        '                     '
      '  HISTMOVEMPTMO HME,'
      
        '  VWCONTRATOEP  CON                                             ' +
        '                     '
      
        'WHERE                                                           ' +
        '                     '
      '      1 = 2'
      '  AND HME.HMETIPOMOV         = 3'
      '  AND HME.HMEORIGEM          <> 8'
      '  AND HME.HMECENTRALIZA      = 1'
      '  AND ( HME.FLGBAIXADO       = 0 OR HME.HMEVLREFETIVO IS NULL )'
      ''
      'ORDER BY'
      '  CON.TCEDESCRICAO, CON.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA')
    ValidateWithMask = True
    Left = 136
    Top = 56
    object qryQuitacaoNaoEfetivadaTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDESCRICAO'
      Size = 60
    end
    object qryQuitacaoNaoEfetivadaIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryQuitacaoNaoEfetivadaINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.VWCONTRATOEP.INSCRICAONUMERO'
    end
    object qryQuitacaoNaoEfetivadaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
      Size = 15
    end
    object qryQuitacaoNaoEfetivadaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      Size = 60
    end
    object qryQuitacaoNaoEfetivadaHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELA'
    end
    object qryQuitacaoNaoEfetivadaHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAPREVISTA'
    end
  end
end
