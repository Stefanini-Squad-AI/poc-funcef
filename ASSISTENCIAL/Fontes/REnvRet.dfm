inherited RptEnvRet: TRptEnvRet
  Left = 354
  Top = 101
  Width = 374
  Height = 194
  Caption = 'Rpt Envio Retorno'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatório de Segurados'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Patrocinadora'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Patrocinadora'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Formheight = 200
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = rpEnvRet
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
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
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
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
  object rpEnvRet: TppReport
    AutoStop = False
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    ModalPreview = False
    Left = 309
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand21: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppLabel88: TppLabel
        UserName = 'ppLabel88'
        Caption = 'Listagem Comparativa de Envio X Retorno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 85725
        mmTop = 29369
        mmWidth = 85725
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'MÊS: 05 / 2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 35454
        mmWidth = 24606
        BandType = 0
      end
      object rptRecadastramentoDBImage1: TppDBImage
        UserName = 'rptRecadastramentoDBImage1'
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
      object rptRecadastramentoDBText1: TppDBText
        UserName = 'rptRecadastramentoDBText1'
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
      object rptRecadastramentoDBText2: TppDBText
        UserName = 'rptRecadastramentoDBText2'
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
        mmWidth = 25929
        BandType = 0
      end
      object rptRecadastramentoDBText3: TppDBText
        UserName = 'rptRecadastramentoDBText3'
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
      object rptRecadastramentoDBText4: TppDBText
        UserName = 'rptRecadastramentoDBText4'
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
      object rptRecadastramentoDBText5: TppDBText
        UserName = 'rptRecadastramentoDBText5'
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
      object rptRecadastramentoDBText7: TppDBText
        UserName = 'rptRecadastramentoDBText7'
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
      object rptRecadastramentoDBText6: TppDBText
        UserName = 'rptRecadastramentoDBText6'
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
      object rptRecadastramentoLabel1: TppLabel
        UserName = 'rptRecadastramentoLabel1'
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
      object rptRecadastramentoDBText8: TppDBText
        UserName = 'rptRecadastramentoDBText8'
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
    end
    object ppDetailBand19: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpCompEnvioDBText3: TppDBText
        UserName = 'rpCompEnvioDBText3'
        DataField = 'NUMDOC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
      object rpCompEnvioDBText4: TppDBText
        UserName = 'rpCompEnvioDBText4'
        AutoSize = True
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object rpCompEnvioDBText5: TppDBText
        UserName = 'rpCompEnvioDBText5'
        DataField = 'INSCRICAONUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object rpCompEnvioDBText6: TppDBText
        UserName = 'rpCompEnvioDBText6'
        AutoSize = True
        DataField = 'LOCAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
      object rpCompEnvioDBText7: TppDBText
        UserName = 'rpCompEnvioDBText7'
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 69586
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object rpCompEnvioDBText8: TppDBText
        UserName = 'rpCompEnvioDBText8'
        DataField = 'SITUACAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 0
        mmWidth = 48683
        BandType = 4
      end
      object rpCompEnvioDBText9: TppDBText
        UserName = 'rpCompEnvioDBText9'
        DataField = 'MOTIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 213255
        mmTop = 265
        mmWidth = 40217
        BandType = 4
      end
      object rpCompEnvioDBText10: TppDBText
        UserName = 'rpCompEnvioDBText10'
        DataField = 'VALOR'
        DisplayFormat = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 264055
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpCompEnvioLabel95: TppLabel
        UserName = 'rpCompEnvioLabel95'
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
        mmTop = 9525
        mmWidth = 284428
        BandType = 8
      end
      object ppCalc41: TppSystemVariable
        UserName = 'Calc41'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 9525
        mmWidth = 283898
        BandType = 8
      end
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252942
        mmTop = 9260
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object rpCompEnvioLabel20: TppLabel
        UserName = 'rpCompEnvioLabel20'
        Caption = 'TOTAIS GERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 794
        mmWidth = 26988
        BandType = 7
      end
      object rpCompEnvioLabel21: TppLabel
        UserName = 'rpCompEnvioLabel21'
        Caption = 'Documentos Enviados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 8467
        mmWidth = 37835
        BandType = 7
      end
      object rpCompEnvioLabel22: TppLabel
        UserName = 'rpCompEnvioLabel22'
        Caption = 'Valor enviado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 13229
        mmWidth = 24606
        BandType = 7
      end
      object rpCompEnvioDBCalc3: TppDBCalc
        UserName = 'rpCompEnvioDBCalc3'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 8467
        mmWidth = 17198
        BandType = 7
      end
      object rpCompEnvioDBCalc4: TppDBCalc
        UserName = 'rpCompEnvioDBCalc4'
        AutoSize = True
        DataField = 'VALOR'
        DisplayFormat = 'R$ ###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 13229
        mmWidth = 24871
        BandType = 7
      end
      object rpCompEnvioLine3: TppLine
        UserName = 'rpCompEnvioLine3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 17992
        mmWidth = 283634
        BandType = 7
      end
      object rpCompEnvioLabel23: TppLabel
        UserName = 'rpCompEnvioLabel23'
        Caption = 'Documentos Rejeitados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 8467
        mmWidth = 40481
        BandType = 7
      end
      object rpCompEnvioLabel24: TppLabel
        UserName = 'rpCompEnvioLabel24'
        Caption = 'Valor Rejeitado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 13229
        mmWidth = 27252
        BandType = 7
      end
      object rpCompEnviodrt: TppLabel
        UserName = 'rpCompEnviodrt'
        Caption = 'rpCompEnviodrt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 8467
        mmWidth = 25929
        BandType = 7
      end
      object rpCompEnviovrt: TppLabel
        UserName = 'rpCompEnviovrt'
        Caption = 'rpCompEnviovrt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 95779
        mmTop = 13229
        mmWidth = 25929
        BandType = 7
      end
      object rpCompEnvioLabel27: TppLabel
        UserName = 'rpCompEnvioLabel27'
        Caption = 'Documentos Debitados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 8202
        mmWidth = 39423
        BandType = 7
      end
      object rpCompEnvioLabel28: TppLabel
        UserName = 'rpCompEnvioLabel28'
        Caption = 'Valor Debitado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 12965
        mmWidth = 26194
        BandType = 7
      end
      object rpCompEnvioddt: TppLabel
        UserName = 'rpCompEnvioddt'
        Caption = 'rpCompEnvioddt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 193146
        mmTop = 8202
        mmWidth = 24871
        BandType = 7
      end
      object rpCompEnviovdt: TppLabel
        UserName = 'rpCompEnviovdt'
        Caption = 'rpCompEnviovdt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 12965
        mmWidth = 24342
        BandType = 7
      end
      object rpCompEnvioLabel31: TppLabel
        UserName = 'rpCompEnvioLabel31'
        Caption = 'Documentos s/Retorno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 227807
        mmTop = 8202
        mmWidth = 38629
        BandType = 7
      end
      object rpCompEnvioLabel32: TppLabel
        UserName = 'rpCompEnvioLabel32'
        Caption = 'Valor s/Retorno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 227807
        mmTop = 12965
        mmWidth = 26988
        BandType = 7
      end
      object rpCompEnviovst: TppLabel
        UserName = 'rpCompEnviovst'
        Caption = 'rpCompEnviovst'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 256117
        mmTop = 12965
        mmWidth = 24342
        BandType = 7
      end
      object rpCompEnviodst: TppLabel
        UserName = 'rpCompEnviodst'
        Caption = 'rpCompEnviodst'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 268023
        mmTop = 8202
        mmWidth = 24871
        BandType = 7
      end
    end
    object rpCompEnvioGroup1: TppGroup
      BreakName = 'RUBRICA'
      NewPage = True
      UserName = 'rpCompEnvioGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCompEnvioGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19050
        mmPrintPosition = 0
        object rpCompEnvioShape1: TppShape
          UserName = 'rpCompEnvioShape1'
          mmHeight = 12435
          mmLeft = 529
          mmTop = 794
          mmWidth = 282840
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel1: TppLabel
          UserName = 'rpCompEnvioLabel1'
          Caption = 'Banco: XXXX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 2117
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel2: TppLabel
          UserName = 'rpCompEnvioLabel2'
          Caption = 'Rubrica: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 7673
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioDBText1: TppDBText
          UserName = 'rpCompEnvioDBText1'
          DataField = 'RUBRICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16669
          mmTop = 7673
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioDBText2: TppDBText
          UserName = 'rpCompEnvioDBText2'
          AutoSize = True
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35983
          mmTop = 7673
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel3: TppLabel
          UserName = 'rpCompEnvioLabel3'
          Caption = 'Nº Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 14552
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel4: TppLabel
          UserName = 'rpCompEnvioLabel4'
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12965
          mmTop = 14552
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel5: TppLabel
          UserName = 'rpCompEnvioLabel5'
          Caption = 'Nº Insc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 31221
          mmTop = 14552
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel6: TppLabel
          UserName = 'rpCompEnvioLabel6'
          Caption = 'Local'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 51858
          mmTop = 14552
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel7: TppLabel
          UserName = 'rpCompEnvioLabel7'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 70115
          mmTop = 14552
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel8: TppLabel
          UserName = 'rpCompEnvioLabel8'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 158750
          mmTop = 14552
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel9: TppLabel
          UserName = 'rpCompEnvioLabel9'
          Caption = 'Status Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 213519
          mmTop = 14552
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLabel10: TppLabel
          UserName = 'rpCompEnvioLabel10'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 266701
          mmTop = 14552
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpCompEnvioLine1: TppLine
          UserName = 'rpCompEnvioLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 18521
          mmWidth = 283634
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCompEnvioGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 20373
        mmPrintPosition = 0
        object rpCompEnvioLabel11: TppLabel
          UserName = 'rpCompEnvioLabel11'
          Caption = 'TOTAIS PARCIAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 794
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel12: TppLabel
          UserName = 'rpCompEnvioLabel12'
          Caption = 'Documentos Enviados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 8467
          mmWidth = 37835
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel13: TppLabel
          UserName = 'rpCompEnvioLabel13'
          Caption = 'Valor enviado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 13229
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioDBCalc1: TppDBCalc
          UserName = 'rpCompEnvioDBCalc1'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpCompEnvioGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 4233
          mmLeft = 39952
          mmTop = 8467
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioDBCalc2: TppDBCalc
          UserName = 'rpCompEnvioDBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DisplayFormat = 'R$ ###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpCompEnvioGroup1
          Transparent = True
          mmHeight = 3969
          mmLeft = 27517
          mmTop = 13229
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLine2: TppLine
          UserName = 'rpCompEnvioLine2'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 18521
          mmWidth = 283634
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel14: TppLabel
          UserName = 'rpCompEnvioLabel14'
          Caption = 'Documentos Rejeitados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 8467
          mmWidth = 40481
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel15: TppLabel
          UserName = 'rpCompEnvioLabel15'
          Caption = 'Valor Rejeitado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 13229
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnviodrp: TppLabel
          UserName = 'rpCompEnviodrp'
          Caption = 'rpCompEnviodrp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 109009
          mmTop = 8467
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnviovrp: TppLabel
          UserName = 'rpCompEnviovrp'
          Caption = 'rpCompEnviovrp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 96044
          mmTop = 13229
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel16: TppLabel
          UserName = 'rpCompEnvioLabel16'
          Caption = 'Documentos Debitados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 152136
          mmTop = 8202
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel17: TppLabel
          UserName = 'rpCompEnvioLabel17'
          Caption = 'Valor Debitado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 152136
          mmTop = 12965
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioddp: TppLabel
          UserName = 'rpCompEnvioddp'
          Caption = 'rpCompEnvioddp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 193411
          mmTop = 8202
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnviovdp: TppLabel
          UserName = 'rpCompEnviovdp'
          Caption = 'rpCompEnviovdp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 180446
          mmTop = 12965
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel18: TppLabel
          UserName = 'rpCompEnvioLabel18'
          Caption = 'Documentos s/Retorno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 228071
          mmTop = 8202
          mmWidth = 38629
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnvioLabel19: TppLabel
          UserName = 'rpCompEnvioLabel19'
          Caption = 'Valor s/Retorno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 228071
          mmTop = 12965
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnviosdp: TppLabel
          UserName = 'rpCompEnviosdp'
          Caption = 'rpCompEnviosdp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 269346
          mmTop = 8202
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object rpCompEnviovsp: TppLabel
          UserName = 'rpCompEnviovsp'
          Caption = 'rpCompEnviovsp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 256382
          mmTop = 12965
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
