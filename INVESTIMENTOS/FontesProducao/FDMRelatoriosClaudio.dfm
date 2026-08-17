inherited DMRelatoriosClaudio: TDMRelatoriosClaudio
  Left = 221
  Top = 114
  Width = 328
  Height = 356
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 181
  end
  inherited dsExemplo: TwwDataSource
    Left = 101
  end
  inherited qryExemplo: TwwQuery
    Left = 29
  end
  inherited rpExemplo: TppReport
    Left = 253
    DataPipelineName = 'pplExemplo'
  end
  object PpParticEmp: TppReport
    AutoStop = False
    DataPipeline = bdeParticEmp
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
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 255
    Top = 71
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeParticEmp'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Enquadramento por Participação nas Empresas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 52652
        mmTop = 8731
        mmWidth = 96573
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel17: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel17'
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
      object PpParticEmpLabel1: TppLabel
        UserName = 'PpParticEmpLabel1'
        Caption = 'Empresas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 26723
        mmWidth = 16140
        BandType = 0
      end
      object PpParticEmpLabel2: TppLabel
        UserName = 'PpParticEmpLabel2'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 26723
        mmWidth = 13494
        BandType = 0
      end
      object PpParticEmpLabel3: TppLabel
        UserName = 'PpParticEmpLabel3'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 47096
        mmTop = 26723
        mmWidth = 8467
        BandType = 0
      end
      object PpParticEmpLabel4: TppLabel
        UserName = 'PpParticEmpLabel4'
        Caption = 'Qtde. Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113506
        mmTop = 26723
        mmWidth = 20108
        BandType = 0
      end
      object PpParticEmpLabel5: TppLabel
        UserName = 'PpParticEmpLabel5'
        Caption = '% Partic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 140494
        mmTop = 26723
        mmWidth = 13494
        BandType = 0
      end
      object PpParticEmpLabel6: TppLabel
        UserName = 'PpParticEmpLabel6'
        Caption = 'Acima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 26723
        mmWidth = 10583
        BandType = 0
      end
      object PpParticEmpLabel8: TppLabel
        UserName = 'PpParticEmpLabel8'
        Caption = 'Limite de Enquadramento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 19050
        mmWidth = 44715
        BandType = 0
      end
      object PpParticEmpDBText6: TppDBText
        UserName = 'PpParticEmpDBText6'
        AutoSize = True
        DataField = 'PERCPARTICEMPR'
        DataPipeline = bdeParticEmp
        DisplayFormat = '#,0.00 %;-#,0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 4233
        mmLeft = 46567
        mmTop = 19050
        mmWidth = 31750
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      BeforePrint = ppDetailBand7BeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object PpParticEmpDBText3: TppDBText
        UserName = 'PpParticEmpDBText3'
        AutoSize = True
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeParticEmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 3704
        mmLeft = 47361
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object PpParticEmpDBText5: TppDBText
        UserName = 'PpParticEmpDBText5'
        AutoSize = True
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeParticEmp
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 3704
        mmLeft = 105040
        mmTop = 265
        mmWidth = 28575
        BandType = 4
      end
      object lblAcima: TppLabel
        UserName = 'lblAcima'
        Caption = 'lblAcima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 161661
        mmTop = 265
        mmWidth = 10795
        BandType = 4
      end
      object lblPerc: TppLabel
        UserName = 'lblPerc'
        Caption = 'lblPerc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 140759
        mmTop = 265
        mmWidth = 8678
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
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
        mmLeft = 0
        mmTop = 6085
        mmWidth = 197909
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
        mmHeight = 3683
        mmLeft = -10
        mmTop = 12965
        mmWidth = 197401
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
        mmHeight = 3683
        mmLeft = 171440
        mmTop = 3175
        mmWidth = 26204
        BandType = 8
      end
    end
    object PpParticEmpGroup3: TppGroup
      BreakName = 'NOME'
      DataPipeline = bdeParticEmp
      OutlineSettings.CreateNode = True
      UserName = 'PpParticEmpGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeParticEmp'
      object PpParticEmpGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = PpParticEmpGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object lbldbErro: TppLabel
          UserName = 'lbldbErro'
          Caption = 'Parâmetro não cadastrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 113506
          mmTop = 2117
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object lbldbEmpresa: TppDBText
          UserName = 'lbldbEmpresa'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = bdeParticEmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3704
          mmLeft = 794
          mmTop = 2117
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object lbldbTot: TppDBText
          UserName = 'lbldbTot'
          AutoSize = True
          DataField = 'TOT'
          DataPipeline = bdeParticEmp
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3704
          mmLeft = 128323
          mmTop = 2117
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpLine1: TppLine
          UserName = 'PpParticEmpLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpLine2: TppLine
          UserName = 'PpParticEmpLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpLine3: TppLine
          UserName = 'PpParticEmpLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object PpParticEmpGroupFooterBand3: TppGroupFooterBand
        AfterPrint = PpParticEmpGroupFooterBand3AfterPrint
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object PpParticEmpDBCalc1: TppDBCalc
          UserName = 'PpParticEmpDBCalc1'
          AutoSize = True
          DataField = 'SALDOQTDEINVCART'
          DataPipeline = bdeParticEmp
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = PpParticEmpGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 1323
          mmWidth = 37835
          BandType = 5
          GroupNo = 0
        end
        object PpParticEmpLabel7: TppLabel
          UserName = 'PpParticEmpLabel7'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25665
          mmTop = 1058
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object PpParticEmpLine4: TppLine
          UserName = 'PpParticEmpLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object lblPercTot: TppLabel
          UserName = 'lblPercTot'
          Caption = 'lblPercTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 140759
          mmTop = 1588
          mmWidth = 12785
          BandType = 5
          GroupNo = 0
        end
        object lblAcimaTot: TppLabel
          UserName = 'lblAcimaTot'
          Caption = 'lblAcimaTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 161661
          mmTop = 1588
          mmWidth = 14901
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object PpParticEmpGroup4: TppGroup
      BreakName = 'IDCARTEIRAINVEST'
      DataPipeline = bdeParticEmp
      OutlineSettings.CreateNode = True
      UserName = 'PpParticEmpGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeParticEmp'
      object PpParticEmpGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object PpParticEmpDBText2: TppDBText
          UserName = 'PpParticEmpDBText2'
          AutoSize = True
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeParticEmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3704
          mmLeft = 25665
          mmTop = 265
          mmWidth = 24077
          BandType = 3
          GroupNo = 1
        end
      end
      object PpParticEmpGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeParticEmp: TppBDEPipeline
    DataSource = dtsParticEmp
    UserName = 'bdeParticEmp'
    Left = 179
    Top = 71
  end
  object dtsParticEmp: TwwDataSource
    DataSet = qryParticEmp
    Left = 99
    Top = 71
  end
  object qryParticEmp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct H.SaldoQtdeInvCart, H.DataMovCartInv,'
      #9' SL.Tot,PI.PercParticEmpr, P.Nome, I.DescInvestimento, '
      '                 C.DescCartInvest, SL.IdEmissor, '
      #9' H.IdCarteiraInvest, H.IdInvestimento'
      ''
      
        'From HistCartInv H, CarteiraInvest C, Acao A, TipoAcao TA, Pesso' +
        'a P, Investimento I,'
      ''
      '      (Select PercParticEmpr From ParamInvest) PI,'
      ''
      #9'(Select  Sum(PE.VlrParamEmissor) as Tot, PE.IdEmissor'
      #9' From ValParamXEmissor PE, Pessoa P'
      #9' Where P.IdPessoa=IdEmissor and '
      #9#9' IdParamEmissor in '
      #9#9' (Select IdParamEmissor From TipoAcao)'
      #9' Group By PE.IdEmissor) SL'
      ''
      'Where (I.IdInvestimento=H.IdInvestimento and'
      #9'P.IdPessoa=I.IdEmissor and'
      #9'C.IdCarteiraInvest=H.IdCarteiraInvest and'
      #9'A.IdAcao=H.IdInvestimento and'
      #9'TA.CodTipoAcao=A.CodTipoAcao and'
      #9'I.IdEmissor=SL.IdEmissor(+)) and'
      ''
      #9'IdHistCartInv = (Select Max(IdHistCartInv) From HistCartInv H3'
      #9#9#9'     Where H3.DataMovCartInv=H.DataMovCartInv and'
      #9#9#9#9'     H3.IdCarteiraInvest=H.IdCarteiraInvest and'
      #9#9#9#9'     H3.IdInvestimento=H.IdInvestimento) and'
      ''
      
        #9'DataMovCartInv = (Select Max(DataMovCartInv) From HistCartInv H' +
        '2'
      #9#9#9#9'Where H2.IdCarteiraInvest=H.IdCarteiraInvest and'
      #9#9#9#9'      H2.IdInvestimento=H.IdInvestimento)'
      ''
      'Group By P.Nome, C.DescCartInvest, SL.Tot, SL.IdEmissor, '
      #9'   H.IdCarteiraInvest, H.IdInvestimento, I.DescInvestimento,'
      #9'   PI.PercParticEmpr, H.SaldoQtdeInvCart, H.DataMovCartInv'
      '')
    ValidateWithMask = True
    Left = 27
    Top = 71
    object qryParticEmpSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryParticEmpDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryParticEmpTOT: TFloatField
      FieldName = 'TOT'
    end
    object qryParticEmpPERCPARTICEMPR: TFloatField
      FieldName = 'PERCPARTICEMPR'
    end
    object qryParticEmpNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryParticEmpDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryParticEmpDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryParticEmpIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryParticEmpIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryParticEmpIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
  end
end
