inherited dtmRelatoriosAva: TdtmRelatoriosAva
  Left = 371
  Top = 214
  Width = 189
  Height = 123
  Caption = 'dtmRelatoriosAva'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 41
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
    Left = 18
    Top = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 18
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 4
  end
  object rpFormAvalBranco: TppReport
    AutoStop = False
    DataPipeline = ppFormAvalBranco
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    Left = 94
    Top = 40
    Version = '5.5'
    mmColumnWidth = 197300
    object rpFormAvalBrancoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object rpFormAvalBrancoLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
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
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpFormAvalBrancoLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
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
        mmLeft = 146050
        mmTop = 10319
        mmWidth = 14817
        BandType = 0
      end
      object rpFormAvalBrancoDBTxt1: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppFormAvalBranco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2381
        mmWidth = 17198
        BandType = 0
      end
      object rpFormAvalBrancoCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 7938
        BandType = 0
      end
      object rpFormAvalBrancoCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object rpFormAvalBrancoDBTxt2: TppDBText
        UserName = 'rpFormAvalBrancoDBTxt2'
        AutoSize = True
        DataField = 'DESCRTIPOAVAL'
        DataPipeline = ppFormAvalBranco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 83873
        mmTop = 10319
        mmWidth = 29898
        BandType = 0
      end
    end
    object rpFormAvalBrancoDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object rpFormAvalBrancoDBTxt5: TppDBText
        UserName = 'rpFormAvalBrancoDBTxt5'
        DataField = 'DESCRFATORAVAL'
        DataPipeline = ppFormAvalBranco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 794
        mmWidth = 114300
        BandType = 4
      end
      object rpFormAvalBrancoLbl7: TppLabel
        UserName = 'rpFormAvalBrancoLbl7'
        AutoSize = False
        Caption = '|___________|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object rpFormAvalBrancoRegiaoObserv: TppRegion
        UserName = 'rpFormAvalBrancoRegiaoObserv'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 7408
        mmLeft = 29000
        mmTop = 4763
        mmWidth = 111000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFormAvalBrancoDBObserv: TppDBMemo
          UserName = 'rpFormAvalBrancoDBObserv'
          CharWrap = False
          DataField = 'OBSFATORAVAL'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 5027
          mmLeft = 29898
          mmTop = 4763
          mmWidth = 109000
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object rpFormAvalBrancoSmryBnd: TppSummaryBand
      AfterPrint = rpFormAvalBrancoSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 1058
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppFormAvalBranco
      NewPage = True
      ResetPageNo = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22490
        mmPrintPosition = 0
        object rpFormAvalBrancoLbl3: TppLabel
          UserName = 'rpFormAvalBrancoLbl3'
          AutoSize = False
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 5556
          mmTop = 0
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rpFormAvalBrancoLbl4: TppLabel
          UserName = 'rpFormAvalBrancoLbl4'
          AutoSize = False
          Caption = 'Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 5556
          mmTop = 5027
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rpFormAvalBrancoDBTxt3: TppDBText
          UserName = 'rpFormAvalBrancoDBTxt3'
          DataField = 'NOME'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 0
          mmWidth = 86784
          BandType = 3
          GroupNo = 0
        end
        object rpFormAvalBrancoDBTxt4: TppDBText
          UserName = 'rpFormAvalBrancoDBTxt4'
          DataField = 'CARGO'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 5027
          mmWidth = 86784
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 5292
          mmTop = 0
          mmWidth = 186796
          BandType = 3
          GroupNo = 0
        end
        object rpFormAvalBrancoLbl5: TppLabel
          UserName = 'rpFormAvalBrancoLbl5'
          AutoSize = False
          Caption = 'Fator de Avaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 17463
          mmWidth = 114300
          BandType = 3
          GroupNo = 0
        end
        object rpFormAvalBrancoLbl6: TppLabel
          UserName = 'rpFormAvalBrancoLbl6'
          AutoSize = False
          Caption = 'Grau Atribuído'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 152400
          mmTop = 17463
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.5
          mmHeight = 1323
          mmLeft = 5292
          mmTop = 16140
          mmWidth = 186796
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 123561
          mmTop = 0
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Admissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 107950
          mmTop = 0
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'C.Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 107950
          mmTop = 5027
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CENTROCUSTO'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 123561
          mmTop = 5027
          mmWidth = 66940
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Subord. a:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 10054
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CHEFE'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 19050
          mmTop = 10054
          mmWidth = 86784
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.5
          mmHeight = 1323
          mmLeft = 22754
          mmTop = 21696
          mmWidth = 114300
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.5
          mmHeight = 1323
          mmLeft = 152400
          mmTop = 21696
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 87313
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Pontos Fortes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 3969
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Pontos Fracos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 25135
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Principais Limitações:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 47096
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Metas Para o Próximo Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 3969
          mmWidth = 50006
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Medidas Recomendadas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 25135
          mmWidth = 50006
          BandType = 5
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Comentários do Avaliador:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 47096
          mmWidth = 50006
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.5
          mmHeight = 1323
          mmLeft = 7673
          mmTop = 2117
          mmWidth = 186796
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Resumo da Avaliação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 70115
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Comentários do Avaliado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 70115
          mmWidth = 50006
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Avaliador: _______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 15081
          mmTop = 82815
          mmWidth = 67998
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Data: ___/___/_____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 118269
          mmTop = 82815
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = ppFormAvalBranco
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpFormAvalBrancoGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'DESCRICAO'
          DataPipeline = ppFormAvalBranco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5027
          mmTop = 1323
          mmWidth = 85196
          BandType = 3
          GroupNo = 1
        end
      end
      object rpFormAvalBrancoGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
      end
    end
  end
  object ppFormAvalBranco: TppBDEPipeline
    DataSource = dsFormAvalBranco
    SkipWhenNoRecords = False
    UserName = 'FormAvalBranco'
    Left = 94
    Top = 27
    object ppFormAvalBrancoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppFormAvalBrancoppField2: TppField
      FieldAlias = 'DESCRTIPOAVAL'
      FieldName = 'DESCRTIPOAVAL'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppFormAvalBrancoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFormAvalBrancoppField4: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppFormAvalBrancoppField5: TppField
      FieldAlias = 'DESCRFATORAVAL'
      FieldName = 'DESCRFATORAVAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppFormAvalBrancoppField6: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppFormAvalBrancoppField7: TppField
      FieldAlias = 'FIMEXPERIENCIA'
      FieldName = 'FIMEXPERIENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppFormAvalBrancoppField8: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 7
    end
    object ppFormAvalBrancoppField9: TppField
      FieldAlias = 'CHEFE'
      FieldName = 'CHEFE'
      FieldLength = 80
      DisplayWidth = 80
      Position = 8
    end
    object ppFormAvalBrancoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPOFATORAVAL'
      FieldName = 'IDGRUPOFATORAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppFormAvalBrancoppField11: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 29
      DisplayWidth = 29
      Position = 10
    end
    object ppFormAvalBrancoppField12: TppField
      FieldAlias = 'OBSFATORAVAL'
      FieldName = 'OBSFATORAVAL'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object dsFormAvalBranco: TwwDataSource
    DataSet = qryFormAvalBranco
    Left = 94
    Top = 14
  end
  object qryFormAvalBranco: TwwQuery
    Active = True
    BeforeOpen = qryFormAvalBrancoBeforeOpen
    AfterOpen = qryFormAvalBrancoAfterOpen
    AfterScroll = qryFormAvalBrancoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  TA.DESCRTIPOAVAL, PF.NOME, C.TITULO AS CARGO,'
      '  FA.DESCRFATORAVAL,'
      '  F.DATAADMISSAO,'
      '  (F.DATAADMISSAO + 89) AS FIMEXPERIENCIA,'
      
        '  '#39'                                                             ' +
        '                   '#39'  CENTROCUSTO,'
      
        '  '#39'                                                             ' +
        '                   '#39'  CHEFE,'
      '  0 IDGRUPOFATORAVAL,'
      ' '#39'                             '#39' DESCRICAO,'
      ' FA.OBSFATORAVAL'
      'FROM'
      '  PESSOA PF, FUNCIONARIO F, CARGO C, FATORAVAL FA, TIPOAVAL TA'
      'WHERE'
      '  (PF.IDPESSOA    = -1) AND'
      '  (TA.CODTIPOAVAL = -1) AND'
      '  (PF.IDPESSOA    = F.IDPESSOA) AND'
      '  (F.IDCARGO      = C.IDCARGO)'
      'ORDER BY'
      '  FA.DESCRFATORAVAL'
      ' ')
    ValidateWithMask = True
    Left = 94
    Top = 2
  end
end
