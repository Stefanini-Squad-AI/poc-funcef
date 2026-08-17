inherited RptQtBenef: TRptQtBenef
  Left = 336
  Top = 241
  Width = 374
  Height = 194
  Caption = 'RptQtBenef'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Quantitativo de Beneficiários por Situação'
    DataBaseName = 'BaseDados'
    Formheight = 100
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = RpQtBenef
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'PLANOASSISTENCIAL'
      FieldName = 'PLANOASSISTENCIAL'
      FieldLength = 40
      DisplayWidth = 40
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PpRptCMppField3: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object PpRptCMppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMBENEF'
      FieldName = 'NUMBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 120
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 57
    Top = 120
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'PA.NOME AS PLANOASSISTENCIAL,'
      'PJ.NOME AS PATROCINADORA,'
      'SP.DESCRICAO AS SITUACAO,'
      'COUNT(*) AS NUMBENEF'
      'FROM'
      'PARTASS PT,'
      'PARTPREVPLAN PP,'
      'SITPART SP,'
      'PESSOA PJ,'
      'PLANASS PA'
      ''
      'WHERE'
      '(PT.DATACANCELAMENTO IS NULL) AND'
      '(PT.FLGINSCRICAOCANC = 0) AND'
      '(PP.IDPESSJUR = PT.IDPESSJUR) AND'
      '(PP.IDPLANOPREV = PT.IDPLANOPREV) AND'
      '(PP.FLGDESATIVADO = 0) AND'
      '(PP.IDPESSOA = PT.IDPESSOA) AND'
      '(PP.SEQPROPOSTA =   PT.SEQPROPOSTA) AND'
      '(SP.IDSITPART = PP.IDSITPART) AND'
      '(PJ.IDPESSOA = PT.IDPESSJUR) AND'
      '(PA.IDPLANASS = PT.IDPLANASS)'
      'GROUP BY PJ.NOME,PA.NOME,SP.DESCRICAO'
      'ORDER BY PJ.NOME,PA.NOME,SP.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 11
    Top = 120
  end
  object AQryFundacao: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 305
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 305
    Top = 65
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 241
    Top = 66
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)')
    ValidateWithMask = True
    Left = 18
    Top = 66
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 96
    Top = 66
  end
  object CdsFundacao: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 171
    Top = 67
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 209
    Top = 120
  end
  object RpQtBenef: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 315
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppDBImage4: TppDBImage
        UserName = 'DBImage4'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 101071
        BandType = 0
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'QUANTITATIVO DE PARTICIPANTES  POR SITUAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 30427
        mmTop = 28840
        mmWidth = 108479
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 35190
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object rpRelaQuantBenefGrpDBText4: TppDBText
        UserName = 'rpRelaQuantBenefGrpDBText4'
        DataField = 'NUMBENEF'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 141552
        mmTop = 1058
        mmWidth = 11905
        BandType = 4
      end
      object rpRelaQuantBenefGrpDBText3: TppDBText
        UserName = 'rpRelaQuantBenefGrpDBText3'
        DataField = 'SITUACAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 3704
        mmTop = 1058
        mmWidth = 137054
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
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
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRelaQuantBenefGrpGroup2: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'rpRelaQuantBenefGrpGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelaQuantBenefGrpGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpRelaQuantBenefGrpDBText2: TppDBText
          UserName = 'rpRelaQuantBenefGrpDBText2'
          DataField = 'PATROCINADORA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 31750
          mmTop = 794
          mmWidth = 147109
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 5027
          mmLeft = 3175
          mmTop = 794
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRelaQuantBenefGrpGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpRelaQuantBenefGrpDBCalc2: TppDBCalc
          UserName = 'rpRelaQuantBenefGrpDBCalc2'
          Color = clSilver
          DataField = 'NUMBENEF'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ResetGroup = rpRelaQuantBenefGrpGroup2
          TextAlignment = taRightJustified
          mmHeight = 4763
          mmLeft = 141552
          mmTop = 1323
          mmWidth = 11905
          BandType = 5
          GroupNo = 1
        end
        object ppVarDescPatrocinadora: TppVariable
          UserName = 'VarDescPatrocinadora'
          AutoSize = False
          CalcOrder = 0
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          mmHeight = 4763
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 138377
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpRelaQuantBenefSitGroup1: TppGroup
      BreakName = 'PLANOASSISTENCIAL'
      DataPipeline = PpRptCM
      UserName = 'rpRelaQuantBenefSitGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 25400
      object rpRelaQuantBenefSitGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpRelaQuantBenefGrpDBText1: TppDBText
          UserName = 'rpRelaQuantBenefGrpDBText1'
          DataField = 'PLANOASSISTENCIAL'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4763
          mmLeft = 3969
          mmTop = 794
          mmWidth = 185209
          BandType = 3
          GroupNo = 1
        end
      end
      object rpRelaQuantBenefSitGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          Color = clSilver
          DataField = 'NUMBENEF'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ResetGroup = rpRelaQuantBenefSitGroup1
          TextAlignment = taRightJustified
          mmHeight = 4498
          mmLeft = 141552
          mmTop = 529
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Sub Total: '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Visible = False
          mmHeight = 4763
          mmLeft = 10583
          mmTop = 794
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object ppVarDescPlano: TppVariable
          UserName = 'VarDescPlano'
          CalcOrder = 0
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taRightJustified
          mmHeight = 4498
          mmLeft = 116681
          mmTop = 529
          mmWidth = 25135
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061A
        56617244657363506174726F63696E61646F72614F6E43616C630B50726F6772
        616D54797065070B747450726F63656475726506536F75726365069170726F63
        65647572652056617244657363506174726F63696E61646F72614F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        202056616C7565203A3D2027546F74616C20646120506174726F63696E61646F
        726120272B5070527074434D5B27504154524F43494E41444F5241275D2B273A
        20273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650614566172
        44657363506174726F63696E61646F7261094576656E744E616D6506064F6E43
        616C63074576656E74494402210001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65061256617244657363506C616E6F4F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        065970726F6365647572652056617244657363506C616E6F4F6E43616C632876
        61722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A5661
        6C75653A3D2753756220546F74616C3A20273B0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060C56617244657363506C616E6F094576656E744E616D
        6506064F6E43616C63074576656E74494402210000}
    end
  end
end
