inherited RptSegurados: TRptSegurados
  Left = 296
  Top = 169
  Width = 326
  Height = 244
  Caption = 'RptSegurados'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Segurados'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT P.IDPESSOA, P.NOME'
          'FROM PESSOA P, PATRO PT'
          'WHERE (P.IDPESSOA=PT.IDPESSOA) AND'
          '               (P.IDPESSOA=P.IDPESSOA)'
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'NOME'
        LookupSettings.Tamanho = '30'
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
      end
      item
        Caption = 'Situação Principal do Participante'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDSITPART, FLGINTERNO, DESCRICAO '
          'FROM SITPART'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'IDSITPART'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Situação'
        LookupSettings.Tamanho = '30'
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
        MostraComboCompara = True
        Required = False
        Name = 'Situação do Participante'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Situação do Participante no Assistencial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDSITPLANOASS, FLGINTERNO, DESCRICAO '
          'FROM SITPLANOASS'
          'ORDER BY DESCRICAO'
          '')
        LookupSettings.Chave = 'IDSITPLANOASS'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Situação no Assistencial'
        LookupSettings.Tamanho = '30'
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
        MostraComboCompara = True
        Required = False
        Name = 'SitPlanoAss'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Formheight = 300
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = RpSeg
    Left = 81
  end
  object RpSeg: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
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
    Template.Format = ftASCII
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 267
    Top = 9
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 265
        mmTop = 26723
        mmWidth = 262203
        BandType = 0
      end
      object ppDBImage19: TppDBImage
        UserName = 'DBImage17'
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
      object ppDBText187: TppDBText
        UserName = 'DBText165'
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
      object ppDBText188: TppDBText
        UserName = 'DBText166'
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
      object ppDBText189: TppDBText
        UserName = 'DBText167'
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
      object ppDBText190: TppDBText
        UserName = 'DBText168'
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
      object ppLabel113: TppLabel
        UserName = 'Label98'
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
      object ppDBText191: TppDBText
        UserName = 'DBText169'
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
      object ppDBText192: TppDBText
        UserName = 'DBText170'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 23019
        BandType = 0
      end
      object ppDBText193: TppDBText
        UserName = 'DBText171'
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
      object ppDBText194: TppDBText
        UserName = 'DBText172'
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
        mmLeft = 87842
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText195: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBTextTitular: TppDBText
        UserName = 'DBTextTitular'
        DataField = 'TITULAR'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 21960
        mmTop = 265
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText199: TppDBText
        UserName = 'DBText199'
        DataField = 'DATAINSCRICAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 89429
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        DataField = 'SITUACAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 111390
        mmTop = 265
        mmWidth = 76465
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PLANO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 190500
        mmTop = 265
        mmWidth = 48419
        BandType = 4
      end
      object ppVarPremio: TppVariable
        UserName = 'VarPremio'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        OnCalc = ppVarPremioCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 242359
        mmTop = 265
        mmWidth = 19050
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'ppLabel90'
        AutoSize = False
        Caption = 'Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 1058
        mmWidth = 198173
        BandType = 8
      end
      object ppSVarSistema: TppSystemVariable
        UserName = 'Calc39'
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
        mmLeft = 794
        mmTop = 1323
        mmWidth = 197644
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'ppCalc401'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummary: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup14: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLabel120: TppLabel
          UserName = 'rpRelBenSaudeLabel2'
          Caption = 'PATROCINADORA : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 3704
          mmTop = 529
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppDBText198: TppDBText
          UserName = 'rpRelBenSaudeDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 45508
          mmTop = 529
          mmWidth = 33867
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'ppLabel91'
          Caption = 'Matricula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 6350
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'ppLabel92'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23283
          mmTop = 6350
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = 'Data Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 6615
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Situação Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111125
          mmTop = 6615
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Prêmio (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 243417
          mmTop = 6879
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label5'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 190765
          mmTop = 6615
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Total de Segurados: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3704
          mmTop = 4233
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TITULAR'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          ResetGroup = ppGroup14
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 34660
          mmTop = 4233
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Valor Total de Prêmios (R$) : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 81227
          mmTop = 4498
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppVarTotalPremios: TppVariable
          UserName = 'VarTotalPremios'
          AutoSize = False
          CalcOrder = 0
          DataType = dtDouble
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          ResetComponent = ppGroup14
          ResetType = veGroupStart
          Transparent = True
          mmHeight = 3175
          mmLeft = 123561
          mmTop = 4498
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 187
    Top = 8
    object PpRptCMppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object PpRptCMppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDEPENDENTE'
      FieldName = 'IDDEPENDENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object PpRptCMppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpRptCMppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpRptCMppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANASS'
      FieldName = 'IDPLANASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'TITULAR'
      FieldName = 'TITULAR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object PpRptCMppField9: TppField
      FieldAlias = 'DATAENTRADA'
      FieldName = 'DATAENTRADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object PpRptCMppField10: TppField
      FieldAlias = 'DATACANCELAMENTO'
      FieldName = 'DATACANCELAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object PpRptCMppField11: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 10
    end
    object PpRptCMppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpRptCMppField13: TppField
      FieldAlias = 'DATAINSCRICAO'
      FieldName = 'DATAINSCRICAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object PpRptCMppField14: TppField
      FieldAlias = 'FLGINTERNO'
      FieldName = 'FLGINTERNO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object PpRptCMppField15: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
    object PpRptCMppField16: TppField
      FieldAlias = 'SITPARTICIPANTE'
      FieldName = 'SITPARTICIPANTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object PpRptCMppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 142
    Top = 104
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 104
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 65
    Top = 104
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '             SELECT   PT.IDPESSOA,'
      '            PT.IDPESSOA AS IDDEPENDENTE,'
      '            PP.IDPESSJUR,'
      '            PS.IDPLANOPREV,'
      '            PS.IDPLANASS,'
      '            PT.NOME AS TITULAR,'
      '            PJ.NOME AS PATROCINADORA,'
      '            PL.NOME AS PLANO,'
      '            BF.DATAENTRADA,'
      '            PS.DATACANCELAMENTO,'
      '            EL.MATRICULA AS MATRICULA,'
      '            PP.INSCRICAONUMERO AS INSCRICAO,'
      '            PS.DATAENTRADA AS DATAINSCRICAO,'
      '            SP.FLGINTERNO,'
      '            ST.DESCRICAO AS SITUACAO,'
      '            SP.DESCRICAO AS SITPARTICIPANTE,'
      '            CB.IDREGRA'
      ''
      '            FROM'
      '            PESSOA PT,'
      '            PESSOA PJ,'
      '            PESSOAFISICA PF,'
      '            PARTPREVPLAN PP,'
      '            ELEGPATRO EL,'
      '            PARTASS PS,'
      '            BENEFASS BF,'
      '            CONTASS CT,'
      '            CONTRIBASS CB,'
      '            PLANASS PL,'
      '            SITPART ST,'
      '            SITPLANOASS SP'
      ''
      '            WHERE'
      '           '
      '            (PT.IDPESSOA=PF.IDPESSOA) AND'
      '            (PT.IDPESSOA=PT.IDPESSOA) AND'
      '            (PT.IDPESSOA=PP.IDPESSOA) AND'
      ''
      '            (PT.IDPESSOA=EL.IDPESSOA) AND'
      '            (PT.IDPESSOA=BF.IDTITULAR) AND'
      '            (PT.IDPESSOA=PS.IDPESSOA) AND'
      ''
      '            (PJ.IDPESSOA=  1) AND'
      ''
      '            (PJ.IDPESSOA=PP.IDPESSJUR) AND'
      '            (PJ.IDPESSOA=PJ.IDPESSOA) AND'
      '            (PJ.IDPESSOA=EL.IDPESSJUR) AND'
      '            (PJ.IDPESSOA=PS.IDPESSJUR) AND'
      '            (PJ.IDPESSOA=BF.IDPESSJUR) AND'
      ''
      '            (PP.IDPESSJUR=PS.IDPESSJUR)AND'
      '            (PP.IDPESSOA=PP.IDPESSOA) AND'
      '            (PP.IDPLANOPREV=PS.IDPLANOPREV) AND'
      '            (PP.IDSITPART=ST.IDSITPART) AND'
      '            (PP.FLGDESATIVADO=0) AND --'
      ''
      '            (EL.IDPESSJUR=PS.IDPESSJUR) AND'
      ''
      '            (PS.FLGINSCRICAOCANC=0) AND   --'
      '            (PS.IDPESSOA=BF.IDTITULAR) AND'
      '            (PS.IDPESSOA=CT.IDTITULAR) AND'
      '            (PS.IDPLANASS=CT.IDPLANASS) AND --'
      '            (PS.IDPLANASS=CB.IDPLANASS) AND -- '
      '            (CT.IDCONTASS=CB.IDCONTASS) AND'
      ''
      '            (PS.IDSITPART=SP.IDSITPLANOASS) AND'
      ''
      '           -- (ST.IDSITPLANOASS=1) AND'
      '            (ST.IDSITPART=1) AND'
      ''
      '            (BF.IDPLANASS=PS.IDPLANASS) AND'
      '            (BF.IDPLANASS=PL.IDPLANASS)  AND '
      '            (ROWNUM<5)   '
      ''
      ''
      '            ORDER BY  PATROCINADORA, TITULAR'
      ''
      ''
      ''
      ''
      ''
      '')
    UniDirectional = True
    ValidateWithMask = True
    Left = 27
    Top = 104
  end
  object AQryFundacao: TADOQuery
    DataSource = dsFundacao
    Parameters = <>
    Left = 179
    Top = 56
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 220
    Top = 57
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 142
    Top = 58
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
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
    Left = 26
    Top = 58
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 64
    Top = 58
  end
  object CdsFundacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 103
    Top = 58
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 181
    Top = 104
  end
  object qryRegraIn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' QRYDEPLEGAL.HAVEDEPLEGAL, PB.IDPESSOA, PB.NUMDOCUMENTO, PFB.DAT' +
        'ANASC, PFB.SEXO, PFB.ESTCIVIL, PFB.DATAMORTE,'
      
        ' DT.IDDEPENDENCIA, DT.IDTITULAR, DT.IDPESSOA, D.IDSITDEPENDENTE,' +
        ' BA.IDPLANASS,'
      ' BA.IDPLANOPREV, BA.IDPESSJUR, BA.SEQPROPOSTA, BA.DATAENTRADA,'
      
        ' TO_CHAR(BA.DATAENTRADA,'#39'YYYY/MM'#39') MESENTRADA, PA.FLGINSCRICAOCA' +
        'NC, PA.INSCRICAONUMERO,'
      
        ' PA.DATACANCELAMENTO, PA.FLGPARTBENEF, PT.FLGFUNCIONARIO, EP.MAT' +
        'RICULA, EP.DATAADMISSAO,'
      
        ' EP.NIVEL, EP.TEMPOSERVANTERIOR, EP.TEMPONAOCREDITADO, EP.TEMPOS' +
        'ERVANTREAL,'
      
        ' EP.TEMPOSITESPECIAL, EP.VALORBASE1, EP.VALORBASE2, EP.VALORBASE' +
        '3, EP.NIVEL,'
      ' :MESREF MESREF, PPP.SALPARTICIPACAO,'
      
        ' PPP.SALMANTIDO, NVL(QRYBENEF.SALBENEFICIO,0) SALBENEFICIO, EP.S' +
        'ALREFERENCIA,'
      
        ' EP.IDSITFUNC, EP.DATADEMISSAO, PPP.IDSITPART, S.FLGINTERNO, F.S' +
        'ALARIOATUAL, DT.FLGDEPLEGAL,'
      ' BA.RESPONSAVELPAG, PA.OPCAOA, PA.OPCAOB'
      'FROM'
      
        ' PESSOA PB, PESSOAFISICA PFB, DEPENTIT DT, DEPENDENTE D, SITDEPE' +
        'NDENTE SD, BENEFASS BA,'
      
        ' PARTASS PA, ELEGPATRO EP, PESSOA PT, PARTPREVPLAN PPP, SITPART ' +
        'S, FUNCIONARIO F,'
      ' (SELECT BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR,'
      '         SUM(BF.VALORATUAL) SALBENEFICIO'
      '    FROM BENEFBFCIARIO BF'
      '   WHERE (BF.IDTITULAR   = :IDTITULAR)'
      '     AND (BF.IDPLANOPREV = :IDPLANOPREV)'
      '     AND (BF.IDPESSJUR   = :IDPESSJUR)'
      '-- Filtro para pegar apenas os benefícios com situação NORMAL'
      '     AND (BF.IDSITBENEFICIO = 1)'
      '-- Filtro para pegar apenas os benefícios diferentes de resgate'
      '     AND (BF.IDBENEFICIO NOT IN (20))'
      
        '   GROUP BY BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR, BF.IDPES' +
        'SOA) QRYBENEF,'
      ''
      '  (SELECT B.IDTITULAR, B.IDPLANASS, QRY.HAVEDEPLEGAL'
      '   FROM BENEFASS B,'
      '      (SELECT DECODE(COUNT(*),0,0,1,0,1) AS HAVEDEPLEGAL'
      '       FROM PESSOAFISICA PF, DEPENTIT D, BENEFASS B'
      '         WHERE PF.IDPESSOA  = PF.IDPESSOA     AND'
      '               D.IDTITULAR = :IDTITULAR  AND'
      '               D.IDPESSOA = PF.IDPESSOA AND'
      '               B.IDTITULAR = D.IDTITULAR AND'
      '               B.IDPLANASS    = :IDPLANASS AND'
      '               B.IDDEPENDENTE = D.IDPESSOA  AND'
      '               B.DTCANCELAMENTO IS NULL AND'
      
        '               ( ( D.IDDEPENDENCIA = '#39'PRP'#39' OR  D.IDDEPENDENCIA =' +
        ' '#39'COM'#39'  OR  D.IDDEPENDENCIA= '#39'COP'#39') OR'
      
        '                 ( D.IDDEPENDENCIA = '#39'FIL'#39'  AND TRUNC((SYSDATE -' +
        ' PF.DATANASC)/365.5) <= 24 )'
      '               )'
      '      ) QRY'
      '   WHERE B.IDDEPENDENTE = :IDDEPENDENTE AND'
      '         B.IDTITULAR    = :IDTITULAR    AND'
      '         B.IDPLANASS    = :IDPLANASS'
      '  ) QRYDEPLEGAL'
      ''
      'WHERE'
      ' (BA.IDTITULAR    = :IDTITULAR) AND'
      ' (BA.IDDEPENDENTE = :IDDEPENDENTE) AND'
      ' (BA.IDPESSJUR    = :IDPESSJUR) AND'
      ' (BA.IDPLANOPREV  = :IDPLANOPREV) AND'
      ' (BA.IDPLANASS    = :IDPLANASS) AND'
      ' (BA.IDTITULAR    = F.IDPESSOA(+)) AND'
      ' (BA.IDTITULAR    = DT.IDTITULAR) AND'
      ' (BA.IDDEPENDENTE = DT.IDPESSOA) AND'
      ' (BA.IDTITULAR    = PPP.IDPESSOA) AND'
      ' (BA.IDPLANOPREV  = PPP.IDPLANOPREV) AND'
      ' (BA.IDPESSJUR    = PPP.IDPESSJUR) AND'
      ' (PPP.IDSITPART   = S.IDSITPART) AND'
      ' (BA.IDTITULAR    = QRYBENEF.IDTITULAR(+)) AND'
      ' (BA.IDPLANOPREV  = QRYBENEF.IDPLANOPREV(+)) AND'
      ' (BA.IDPESSJUR    = QRYBENEF.IDPESSJUR(+)) AND'
      ''
      ' (BA.IDTITULAR    = QRYDEPLEGAL.IDTITULAR(+)) AND'
      ' (BA.IDPLANASS    = QRYDEPLEGAL.IDPLANASS(+)) AND'
      ''
      ' (BA.IDDEPENDENTE = PFB.IDPESSOA) AND'
      ' (BA.IDDEPENDENTE = D.IDPESSOA) AND'
      ' (D.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+)) AND'
      ' (BA.IDDEPENDENTE = PB.IDPESSOA) AND'
      ' (BA.IDPESSJUR   = PA.IDPESSJUR(+)) AND'
      ' (BA.SEQPROPOSTA = PA.SEQPROPOSTA(+)) AND'
      ' (BA.IDPLANOPREV = PA.IDPLANOPREV(+)) AND'
      ' (BA.IDTITULAR   = PA.IDPESSOA(+)) AND'
      ' (BA.IDPLANASS   = PA.IDPLANASS(+)) AND'
      ' (BA.IDTITULAR = PT.IDPESSOA) AND'
      ' (BA.IDPESSJUR = EP.IDPESSJUR) AND'
      ' (BA.IDTITULAR = EP.IDPESSOA)'
      ''
      ''
      '')
    UniDirectional = True
    ValidateWithMask = True
    Left = 27
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object DspRegraIn: TDataSetProvider
    DataSet = qryRegraIn
    Constraints = True
    Left = 65
    Top = 152
  end
  object CdsRegraIn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspRegraIn'
    Left = 104
    Top = 152
  end
  object DsRegraIn: TwwDataSource
    DataSet = CdsRegraIn
    Left = 145
    Top = 152
  end
  object AQryRegraIn: TADOQuery
    DataSource = DsRegraIn
    Parameters = <>
    Left = 184
    Top = 152
  end
  object ppSegurados: TppBDEPipeline
    OpenDataSource = False
    UserName = 'Segurados'
    Left = 219
    Top = 104
  end
end
