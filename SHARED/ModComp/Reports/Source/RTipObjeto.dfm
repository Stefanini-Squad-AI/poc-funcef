inherited RptTipObjeto: TRptTipObjeto
  Left = 264
  Top = 180
  Width = 275
  Height = 267
  Caption = 'RptTipObjeto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem dos Tipos de Objetos'
    Params = <
      item
        Caption = 'Sequência'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Por Código'
          'Alfabética')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Ordenacao'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Formheight = 120
    FormWidth = 350
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpTipObjeto
    ConnectionType = cntBDE
  end
  object rpTipObjeto: TppReport
    AutoStop = False
    DataPipeline = ppTipObjeto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
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
    Left = 211
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipObjetoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipObjetoLbl1: TppLabel
        UserName = 'rpTipObjetoLbl1'
        Caption = 'Listagem dos Tipos de Objetos Reclamados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 104775
        mmTop = 9790
        mmWidth = 74877
        BandType = 0
      end
      object rpTipObjetoLbl2: TppLabel
        UserName = 'rpTipObjetoLbl2'
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
        mmLeft = 219340
        mmTop = 6350
        mmWidth = 9525
        BandType = 0
      end
      object rpTipObjetoLbl3: TppLabel
        UserName = 'rpTipObjetoLbl3'
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
        mmLeft = 213784
        mmTop = 10583
        mmWidth = 15081
        BandType = 0
      end
      object rpTipObjetoLbl4: TppLabel
        UserName = 'rpTipObjetoLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipObjetoLbl5: TppLabel
        UserName = 'rpTipObjetoLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 17992
        mmWidth = 115094
        BandType = 0
      end
      object rpTipObjetoLine1: TppLine
        UserName = 'rpTipObjetoLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 13494
        mmTop = 22490
        mmWidth = 257440
        BandType = 0
      end
      object rpTipObjetoDBTxt1: TppDBText
        UserName = 'rpTipObjetoDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 132292
        mmTop = 2646
        mmWidth = 17198
        BandType = 0
      end
      object rpTipObjetoLbl6: TppLabel
        UserName = 'rpTipObjetoLbl6'
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 17992
        mmWidth = 44715
        BandType = 0
      end
      object rpTipObjetoSysVar1: TppSystemVariable
        UserName = 'rpTipObjetoSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 6350
        mmWidth = 23283
        BandType = 0
      end
      object rpTipObjetoSysVar2: TppSystemVariable
        UserName = 'rpTipObjetoSysVar2'
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
        mmLeft = 229659
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
      object rpTipObjetoLbl7: TppLabel
        UserName = 'rpTipObjetoLbl7'
        AutoSize = False
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 17992
        mmWidth = 70644
        BandType = 0
      end
    end
    object rpTipObjetoDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipObjetoDBTxt3: TppDBText
        UserName = 'rpTipObjetoDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 794
        mmWidth = 115094
        BandType = 4
      end
      object rpTipObjetoDBTxt2: TppDBText
        UserName = 'rpTipObjetoDBTxt2'
        DataField = 'CODTIPOOBJETO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object rpTipObjetoDBTxt4: TppDBText
        UserName = 'rpTipObjetoDBTxt4'
        DataField = 'GRUPOOBJETO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 794
        mmWidth = 44715
        BandType = 4
      end
      object rpTipObjetoDBTxt5: TppDBText
        UserName = 'rpTipObjetoDBTxt5'
        DataField = 'PROVENTO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 794
        mmWidth = 70644
        BandType = 4
      end
    end
    object rpTipObjetoFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipObjetoSmryBnd: TppSummaryBand
      AfterPrint = rpTipObjetoSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipObjetoGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipObjeto
      UserName = 'rpTipObjetoGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipObjetoGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipObjetoGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipObjetoLbl8: TppLabel
          UserName = 'rpTipObjetoLbl8'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 13494
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipObjetoDBCalc1: TppDBCalc
          UserName = 'rpTipObjetoDBCalc1'
          DataField = 'CODTIPOOBJETO'
          DataPipeline = ppTipObjeto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipObjetoGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 51329
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipObjeto: TppBDEPipeline
    DataSource = dsTipObjeto
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo5'
    Left = 211
    Top = 48
    object ppTipObjetoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField2: TppField
      FieldAlias = 'CODTIPOOBJETO'
      FieldName = 'CODTIPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField4: TppField
      FieldAlias = 'GRUPOOBJETO'
      FieldName = 'GRUPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField5: TppField
      FieldAlias = 'PROVENTO'
      FieldName = 'PROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsTipObjeto: TwwDataSource
    DataSet = CdsTipObjeto
    Left = 211
    Top = 96
  end
  object sqlTipObjeto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS ESTAB,'
      '  '#39'2'#39' AS MATRICULA,'
      '  '#39'3'#39' AS LOGRADOURO,'
      '  '#39'4'#39' AS CIDADE,'
      '  '#39'5'#39' AS BAIRRO,'
      '  '#39'6'#39' AS CEP,'
      '  '#39'7'#39' AS ESTCIVIL,'
      '  '#39'8'#39' AS CTPS,'
      '  '#39'9'#39' AS CTPS_UF,'
      '  '#39'0'#39' AS CPF,'
      '  '#39'1'#39' AS TELEFONE,'
      '  '#39'2'#39' AS UF,'
      '  '#39'3'#39' AS EMPREGADO,'
      '  '#39'4'#39' AS DEPENDENTE,'
      '  '#39'5'#39' AS DATANASC,'
      '  '#39'6'#39' AS DEPENDENCIA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsTipObjeto
    Left = 211
    Top = 192
  end
  object CdsTipObjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsTipObjetoAfterOpen
    AfterScroll = CdsTipObjetoAfterScroll
    Left = 211
    Top = 144
  end
end
