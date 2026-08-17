inherited dtmRelPerdasDiario: TdtmRelPerdasDiario
  Left = 504
  Top = 254
  Width = 494
  Height = 149
  Caption = 'dtmRelPerdasDiario'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros'
    Params = <
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataIni'
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
      end
      item
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataFim'
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
      end
      item
        Caption = 'Tipo de Imóvel'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODTIPIMOVEL, DESCTIPOIMOVEL'
          '   FROM TIPOIMOVEL')
        LookupSettings.Chave = 'CODTIPIMOVEL'
        LookupSettings.Display = 'DESCTIPOIMOVEL'
        LookupSettings.Descricao = 'Segmento'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TipoImovel'
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
      end
      item
        Caption = 'SituacaoContratual'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'SituacaoContratual'
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
    Formheight = 150
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppPerdasDiario
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      A20400009619E0BD010000001800000005000E00000003000000E3000F444553
      43435553544F524543494D4F0100490000000100055749445448020002003C00
      08444154414F50455208000800000000000C434F44544950494D4F56454C0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020005000E444553435449504F494D4F56454C01004900000001
      0005574944544802000200190006564C52444941080004000000000002000D44
      454641554C545F4F524445520200820003000000010002000400044C43494404
      000100090800000000001950726F766973696F6E616D656E746F206465205065
      726461730000F60673BECC420552454E444112496D6F76656973207061726120
      52656E6461EC51B85E0E1341410000001950726F766973696F6E616D656E746F
      206465205065726461730000F60673BECC420553484F50500F53686F7070696E
      672043656E746572E17A144E779E53410000001950726F766973696F6E616D65
      6E746F206465205065726461730000249A75BECC420552454E444112496D6F76
      65697320706172612052656E64613333333333CF71400000001950726F766973
      696F6E616D656E746F206465205065726461730000249A75BECC420553484F50
      500F53686F7070696E672043656E7465728FC2F5285C0F44400000001950726F
      766973696F6E616D656E746F206465205065726461730000522D78BECC420552
      454E444112496D6F7665697320706172612052656E64613E0AD7A370CD714000
      00001950726F766973696F6E616D656E746F206465205065726461730000522D
      78BECC420553484F50500F53686F7070696E672043656E746572AE47E17A140E
      44400000001950726F766973696F6E616D656E746F2064652050657264617300
      0080C07ABECC420552454E444112496D6F7665697320706172612052656E6461
      AE47E17A14CE71400000001950726F766973696F6E616D656E746F2064652050
      6572646173000080C07ABECC420553484F50500F53686F7070696E672043656E
      746572713D0AD7A31044400000001950726F766973696F6E616D656E746F2064
      65205065726461730000AE537DBECC420552454E444112496D6F766569732070
      6172612052656E6461295C8FC2F57C95400000001950726F766973696F6E616D
      656E746F206465205065726461730000AE537DBECC420553484F50500F53686F
      7070696E672043656E746572A4703D0AD71369400000001950726F766973696F
      6E616D656E746F2064652050657264617300007A1397BECC420552454E444112
      496D6F7665697320706172612052656E6461CDCCCCCCA4A70441000000195072
      6F766973696F6E616D656E746F2064652050657264617300007A1397BECC4205
      53484F50500F53686F7070696E672043656E7465725C8FC2F592F30441000000
      1950726F766973696F6E616D656E746F206465205065726461730000A8A699BE
      CC420552454E444112496D6F7665697320706172612052656E6461A4703D0AD7
      8B87400000001950726F766973696F6E616D656E746F20646520506572646173
      0000A8A699BECC420553484F50500F53686F7070696E672043656E7465726766
      666666A64C40}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      
        'SELECT T.DESCCUSTORECIMO, L.DATAOPER, L.CODTIPIMOVEL, I.DESCTIPO' +
        'IMOVEL, L.VLRDIA'
      '  FROM LANCOPERIMOB L,'
      '       TIPOCUSTORECIMOV T,'
      '       TIPOIMOVEL I'
      ' WHERE L.IDOPERACAO   = T.IDTIPOCUSTORECIMO'
      '   AND L.CODTIPIMOVEL = I.CODTIPIMOVEL'
      '   AND L.IDOPERACAO   = 94'
      '   AND L.IDMODULO     = 64'
      ' ORDER BY T.DESCCUSTORECIMO, L.DATAOPER, I.DESCTIPOIMOVEL'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 176
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'DATAOPER'
      FieldName = 'DATAOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDIA'
      FieldName = 'VLRDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object ppPerdasDiario: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Contabilização Diária'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197115
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Provisão de Perdas - Lançamentos Diário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Segmento de Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 20902
        mmWidth = 32279
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor Diário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 20902
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 20902
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        AutoSize = False
        Caption = 'Situação Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 126471
        mmTop = 20902
        mmWidth = 38629
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object dbtTipoCustoRecImo: TppDBText
        UserName = 'dbtTipoCustoRecImo'
        DataField = 'DESCTIPOIMOVEL'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 0
        mmWidth = 97102
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRDIA'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 166952
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppSubReportContrato: TppSubReport
        OnPrint = ppSubReportContratoPrint
        UserName = 'SubReportContrato'
        DrillDownComponent = dbtTipoCustoRecImo
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplContrato'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4233
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplContrato
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Contabilização Diária'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 192
          Top = 56
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplContrato'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppLine6: TppLine
              OnPrint = pplSeparadorPrint
              UserName = 'lSeparador1'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              StretchWithParent = True
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppShape1: TppShape
              OnPrint = ppsCorPrint
              UserName = 'sCor1'
              Brush.Color = clLime
              ParentHeight = True
              ParentWidth = True
              Pen.Style = psClear
              StretchWithParent = True
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object dbtMestre: TppDBText
              UserName = 'dbtMestre'
              DataField = 'CONNOME'
              DataPipeline = pplContrato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContrato'
              mmHeight = 3969
              mmLeft = 51329
              mmTop = 265
              mmWidth = 81756
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'VLRDIA'
              DataPipeline = pplContrato
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplContrato'
              mmHeight = 3969
              mmLeft = 171980
              mmTop = 265
              mmWidth = 24871
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'dbtMestre2'
              DataField = 'CONNUMERO'
              DataPipeline = pplContrato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContrato'
              mmHeight = 3969
              mmLeft = 28046
              mmTop = 265
              mmWidth = 22490
              BandType = 4
            end
            object pdbtxtsITcONTR1: TppDBText
              UserName = 'pdbtxtsITcONTR1'
              DataField = 'DESCR_SITCONTR'
              DataPipeline = pplContrato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContrato'
              mmHeight = 3969
              mmLeft = 134144
              mmTop = 265
              mmWidth = 36777
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1323
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 529
              mmWidth = 197300
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAOPER'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object lblSistema: TppLabel
        UserName = 'LblSistema'
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
        mmWidth = 196850
        BandType = 8
      end
      object ppOrcamentoSystemVariable7: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
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
        mmWidth = 28840
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATAOPER'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRDIA'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3969
          mmLeft = 167217
          mmTop = 0
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object CMspImovel: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.MESCOMPETENCIA, P.ANOCOMPETENCIA, P.CODTIPIMOVEL, P.IDT' +
        'IPOCUSTORECIMO,'
      
        '       I.IMONOME, I.IDIMOVELMESTRE, P.DTINICTBDIARIA, P.DTFIMCTB' +
        'DIARIA, P.VLRMES'
      '  FROM PREVIMOB P,'
      '       IMOVEL I, IMOVEL IM'
      ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL'
      '   AND P.IDIMOVEL = I.IDIMOVEL'
      '   AND P.MESCOMPETENCIA = 1'
      '   AND P.ANOCOMPETENCIA = 2002'
      ''
      
        'ORDER BY P.MESCOMPETENCIA, P.ANOCOMPETENCIA, P.CODTIPIMOVEL, I.I' +
        'MONOME'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsImovel
    Left = 413
    Top = 8
  end
  object cdsImovel: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 413
    Top = 20
    Data = {
      1E0100009619E0BD0100000018000000090000000000030000001E010E4D4553
      434F4D504554454E43494108000400000000000E414E4F434F4D504554454E43
      494108000400000000000C434F44544950494D4F56454C010049000000010005
      57494454480200020005001149445449504F435553544F524543494D4F080004
      000000000007494D4F4E4F4D4501004900000001000557494454480200020064
      000E4944494D4F56454C4D455354524508000400000000000E4454494E494354
      4244494152494108000800000000000E445446494D4354424449415249410800
      08000000000006564C524D4553080004000000000002000D44454641554C545F
      4F5244455202008200040000000100020003000500044C434944040001000904
      0000}
  end
  object dsImovel: TDataSource
    DataSet = cdsImovel
    Left = 413
    Top = 32
  end
  object pplImovel: TppBDEPipeline
    DataSource = dsImovel
    UserName = 'pplImovel'
    Left = 414
    Top = 47
    object pplImovelppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplImovelppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplImovelppField3: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object pplImovelppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCUSTORECIMO'
      FieldName = 'IDTIPOCUSTORECIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplImovelppField5: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object pplImovelppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplImovelppField7: TppField
      FieldAlias = 'DTINICTBDIARIA'
      FieldName = 'DTINICTBDIARIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplImovelppField8: TppField
      FieldAlias = 'DTFIMCTBDIARIA'
      FieldName = 'DTFIMCTBDIARIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplImovelppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMES'
      FieldName = 'VLRMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object CMspContrato: TCMSqlParams
    SQL.Strings = (
      
        'SELECT L.DATAOPER, L.CODTIPIMOVEL, C.CONNUMERO, L.VLRDIA, SC.DES' +
        'CRICAO AS DESCR_SITCONTR,'
      
        '       DECODE(L.IDCONTRATOIMOVEL,NULL, P.RAZAOSOCIAL, C.CONNOME)' +
        ' AS CONNOME'
      '  FROM LANCOPERDIAIMOB L,'
      '       CONTRATOIMOVEL C,'
      '       SITCONTIMOB SC,'
      '       PESSOA P'
      ' WHERE L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)'
      '   AND C.IDSITCONTIMOB = SC.IDSITCONTIMOB(+)'
      '   AND L.IDFORCLI = P.IDPESSOA(+)'
      '   AND L.IDMODULO   = 64'
      '   AND L.IDOPERACAO = 94'
      '   AND L.VLRDIA IS NOT NULL'
      ' ORDER BY DATAOPER, CODTIPIMOVEL, CONNOME')
    ClientDataSet = cdsContrato
    Left = 331
    Top = 8
  end
  object cdsContrato: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 331
    Top = 20
    Data = {
      444F00009619E0BD010000001800000005005101000003000000D60008444154
      414F50455208000800000000000C434F44544950494D4F56454C010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      02000200050009434F4E4E554D45524F01004900000001000557494454480200
      0200140006564C52444941080004000000000007434F4E4E4F4D450100490000
      000100055749445448020002003C0002000D44454641554C545F4F5244455202
      00820003000000010002000500044C43494404000100090800000000000000F6
      0673BECC420450524F500C3032302F52454645522F39391F85EB517886B64007
      436F6D617061730010000000F60673BECC420450524F503E0AD7A37014A1402D
      434F4D415041532D434F4D455243494F204445204D41504153204520504C414E
      544153202020202020202020200000000000F60673BECC420552454E44410C30
      32302F52454645522F3938A4703D0AD744C9400D3535204175746F6D6F766569
      730000000000F60673BECC420552454E44410830303532342F30310000000000
      F9F5401D41474D20434F4E532E204520504156494D454E5441C7C34F204C5444
      410000000000F60673BECC420552454E44410830303637392F303115AE47E1FA
      41E24024416772656D6961633F6F20646F7320506F6C69636961697320652042
      6F6D626569726F730000000000F60673BECC420552454E44410830303636332F
      3031000000008027AE40234173736F63696163616F20646F732041706F73656E
      7461646F732064612052464653410000000000F60673BECC420552454E444108
      30303535362F30319A999999995EB0401C4175737472656E69657461204D6167
      6E6F20646F732053616E746F730000000000F60673BECC420552454E44410830
      303539322F3031295C8FC2F53AB14018417574656D6964696F20416E73656C6D
      6F204A756C69616F0000000000F60673BECC420552454E44410C3031362F5245
      4645522F393715AE47E17A3FBC400E42616E636F2046656E6963696120000000
      0000F60673BECC420552454E44410830303638332F3031713D0AD7A343CB4027
      426F6D204A657375732050726F66697373696F6E616C697A2E20706172612054
      72616E7369746F0000000000F60673BECC420552454E44410C3030322F524546
      45522F303000000000000078400F4272697469736820436F756E63696C000000
      0000F60673BECC420552454E44410830303433352F303385EB51B81EB9B74020
      43616C65646F6E6561205365727669636F73205465636E69636F73204C746461
      0000000000F60673BECC420552454E44410830303634332F3032A4703D0AD74D
      97401A43616E616C20527572616C2050726F6475636F6573204C746461000000
      0000F60673BECC420552454E44410830303437382F303200000000805FAD401B
      436C617261204D617269612056656C6F736F20436F72646569726F0000000000
      F60673BECC420552454E44410C3031322F52454645522F393315AE47E17A7476
      4016436F6E73747275746F7261204C6F747573204C7464610000000000F60673
      BECC420552454E44410830303336352F3031CDCCCCCC0CFACE4021446F6D696E
      6920436F6E73756C746F7269612064652056656E646173204C74646100100000
      00F60673BECC420552454E4441000000000078AE4021446F6D696E6920436F6E
      73756C746F72696120656D2056656E646173206C7464610000000000F60673BE
      CC420552454E44410830303537302F3031EC51B81ECD5DE3402B45617469202D
      45737475646F73204176616E6361646F7320656D205465632E206520496E662E
      204C7464610000000000F60673BECC420552454E44410C3031302F5245464552
      2F30319A9999999999B93F18456363656C65726120646F2042726173696C204C
      7464612E0000000000F60673BECC420552454E44410C3033372F52454645522F
      393948E17A14AE0738400A454C4554524F425241530000000000F60673BECC42
      0552454E44410C3033362F52454645522F3031CDCCCCCCCC179E400A454C4554
      524F4252C1530000000000F60673BECC420552454E44410830303638342F3031
      EC51B81E8510A34021456C697A616265746820526F736120646520536F757A61
      20437570657274696E6F0000000000F60673BECC420552454E44410830303437
      392F303248E17A14AEC6B34026466162726963696F2043686176657320436176
      616C63616E7465206465204F6C6976656972610010000000F60673BECC420552
      454E4441000000000088934026466162726963696F2043686176657320436176
      616C63616E7465206465204F6C6976656972610000000000F60673BECC420552
      454E44410830303637362F30310000000000E09F401B4665726E616E646F2054
      61766172657320646520467265697461730000000000F60673BECC420552454E
      44410830303638322F30313E0AD7A3702CAA4019466C61766961205461766172
      657320646520467265697461730000000000F60673BECC420552454E44410830
      303338362F3031713D0AD7233BB1400F466C6176696F2064652050696C6C6100
      00000000F60673BECC420552454E44410830303536322F3032F6285C8F4267AB
      40194672616E636973636F2041726D616E646F204D6F72656972610000000000
      F60673BECC420552454E44410C3031332F52454645522F3030C3F5285C8FD27D
      400D46756E646163E36F20434F47450000000000F60673BECC420552454E4441
      0C3030332F52454645522F3030B81E85EB6CE51C4121474446202D20476F7665
      726E6F20646F20446973747269746F204665646572616C0000000000F60673BE
      CC420552454E44410C3030392F52454645522F303000000000BC2E0541204744
      462D20476F7665726E6F20646F20446973747269746F204665646572616C0000
      000000F60673BECC420552454E44410C3032342F52454645522F39347B14AE47
      E17A843F0747656F706C616E0000000000F60673BECC420552454E44410C3031
      332F52454645522F39396766666666EE934015476572616C20646520436F6E63
      7265746F20532F410000000000F60673BECC420552454E44410830303438352F
      30328FC2F5285CEEA240254748202D20436F6D657263696F204D61726B657469
      6E67205265702065204576656E746F730000000000F60673BECC420552454E44
      410830303437392F303100000000007097401F4861726F6C646F2050696E6865
      69726F2041727175697465746F204C7464610000000000F60673BECC42055245
      4E44410830303532372F3031295C8FC2F596BF40134964656961732054757269
      736D6F204C7464610000000000F60673BECC420552454E44410830303637342F
      3031676666666666C24013496E7374697475746F2053616E746F2049766F0000
      000000F60673BECC420552454E44410830303634362F3031F6285C8F8227BE40
      134A43204275656E6F202620436961204C7464610000000000F60673BECC4205
      52454E44410830303534342F303200000000006890401B4A4A2050726F647563
      6F65732065204576656E746F73204C7464610000000000F60673BECC42055245
      4E44410830303536332F3032EC51B81E85D8A940124A6F616F20506564726F20
      506572656972610000000000F60673BECC420552454E44410830303537392F30
      31A4703D0A4776EB40104A6F736520446F6368652046696C686F0000000000F6
      0673BECC420552454E44410830303437332F303385EB51B81E2AA640144A6F73
      6520526F636861206465204D6F726169730010000000F60673BECC420552454E
      44410000000000E08540144A6F736520526F636861206465204D6F7261697300
      00000000F60673BECC420552454E44410C3032392F52454645522F30309A9999
      999999B93F084A504D6F7267616E0000000000F60673BECC420552454E44410C
      3032312F52454645522F393752B81E85EBB96F40194B4C4D204167EA6E636961
      204D6172ED74696D61204C5444410000000000F60673BECC420552454E444108
      30303338352F30330000000000889340114C7569656E65204E617363696D656E
      746F0000000000F60673BECC420552454E44410830303538352F303185EB51B8
      9E50A2401C4C75736967726163696120536971756569726120532E20546F7374
      610000000000F60673BECC420552454E44410830303536342F30329A99999999
      71C040244D264D20436F6E73756C746F726961206520436F6E746162696C6964
      616465204C7464610000000000F60673BECC420552454E44410830303339342F
      3031C3F5285CCFFFD040254D2E4B2E456D707265656E64696D656E746F732049
      6D6F62696C696172696F73204C7464610000000000F60673BECC420552454E44
      410830303537362F3031295C8FC2F53AB1401B4D61726320466F6D656E746F20
      4D657263616E74696C204C7464610000000000F60673BECC420552454E444108
      30303539362F3033B81E85EB51ADA240144D617263696F204D65737369617320
      43756E68610000000000F60673BECC420552454E44410830303339332F3032EC
      51B81E8518AA40134D6172636F73204A6F73652053657374696E690000000000
      F60673BECC420552454E44410830303538332F3031CDCCCCCCCC09A940144D61
      726961205A656C7920476F6E63616C7665730000000000F60673BECC42055245
      4E44410C3035362F52454645522F30311F85EB51B89E2240264D617374657220
      436F6220436F6272616EE761206520436F6E73756C746F726961204C74646100
      00000000F60673BECC420552454E44410830303537372F3032A4703D0A5712A6
      400D4D656C6F20262053616E746F730000000000F60673BECC420552454E4441
      0830303637352F30313E0AD7A37084AC40244D696469612042726173696C2050
      75626C696369646164652065204D61726B6574696E670000000000F60673BECC
      420552454E44410C3031302F52454645522F393585EB51B8FEBEDE40094D756C
      7469637265640000000000F60673BECC420552454E44410830303630332F3032
      713D0AD7233BB140154E6579204665726E616E64657320506569786F746F0000
      000000F60673BECC420552454E44410830303634372F3031AE47E17A1476A540
      145061756C6F204D6F747461204E617264656C6C690000000000F60673BECC42
      0552454E44410C3033312F52454645522F39397B14AE47E17A843F1350656472
      6F205061756C6F20426172656C6C610000000000F60673BECC420552454E4441
      0830303630342F3031E17A14AE273BC14004504D44420000000000F60673BECC
      420552454E44410C3030322F52454645522F3935713D0AD7813307411150726F
      6374657220262047616D626C65200000000000F60673BECC420552454E444108
      30303532362F303185EB51B83E76D4401C50726F2D53797374656D7320496E66
      6F726D6174696361204C7464610000000000F60673BECC420552454E44410830
      303437332F30320000000000E08540265175616C696E65777320436F6D756E69
      636163616F20456D70726573617269616C204C7464610000000000F60673BECC
      420552454E44410830303637322F30315C8FC2F5283B914016526164696F2041
      6E74656E61204E6F7665204C7464610000000000F60673BECC420552454E4441
      0830303637372F30310000000000E075401952616D69726F204C617465726361
      20646520416C6D656964610000000000F60673BECC420552454E444108303036
      38312F30313E0AD7A3702CAA4021526564652042726173696C2045642E205465
      632E206520506572696F6469636F730000000000F60673BECC420552454E4441
      0830303630322F303285EB51B81E258A401C526F73616E6E6520416C76657320
      646520416C6275717565727175650000000000F60673BECC420552454E444108
      30303635362F3031E17A14AEC7D8A9401253616C6C7573204173732E204D6564
      6963610000000000F60673BECC420552454E44410830303439302F3034000000
      008027AE402453616C6C7573204173736973742E204D65646963612065204F64
      6F6E746F6C6F676963610000000000F60673BECC420552454E44410830303535
      332F3031295C8FC2F53AB1401A53656C6D61204D61726961204C6F6261746F20
      506572656972610000000000F60673BECC420552454E44410C3030382F524546
      45522F30303E0AD7A3409714412753696E64696361746F20646F732054726162
      616C6861646F72657320656D20456D7072657361730000000000F60673BECC42
      0552454E44410830303539352F3031713D0AD7233BB14022536F6C7563616F20
      436F6E7461646F726573204173736F636961646F73204C7464610000000000F6
      0673BECC420552454E44410C3031342F52454645522F30307B14AE47E17A843F
      0954656B74726F6E69780000000000F60673BECC420552454E44410C3032392F
      52454645522F39357B14AE47E17A843F0A54656B74726F6E6978200000000000
      F60673BECC420552454E44410C3032312F52454645522F393952B81E850B17D3
      400A54656C652050726573730000000000F60673BECC420552454E44410C3030
      372F52454645522F3030EC51B81E0569CA400B54656C65205072657373200000
      000000F60673BECC420552454E44410C3035312F52454645522F3937B81E85EB
      052DFD400B54656C65205072657373200000000000F60673BECC420552454E44
      410830303337382F30340AD7A3703DC27E401454656C657669733F6F20476175
      63686120532F410000000000F60673BECC420552454E44410830303434382F30
      310AD7A370BDD8B9401E546572657361204372697374696E61204D6564656972
      6F732053696C76610000000000F60673BECC420552454E44410830303437352F
      3034EC51B81E8518AA401F54484D20507265737461646F726120646520536572
      7669636F73204C7464610000000000F60673BECC420552454E44410C3031382F
      52454645522F39370000000018B9FE4003554E410000000000F60673BECC4205
      52454E44410C3034392F52454645522F3937AE47E17A14FB984014554E494C45
      5645522042524153494C204C5444410000000000F60673BECC420552454E4441
      0830303638302F303148E17A14C6CFE7400F56616E6465726C65692046617269
      610010000000F60673BECC420552454E44410000000000C082400F56616E6465
      726C65692046617269610000000000F60673BECC420552454E44410637303030
      30313E0AD7A31C71004114566574726F70617220566964726F73204C74646100
      00000000F60673BECC420552454E44410830303637382F3031F6285C8F1A6FF0
      401457616C646976696E6F20416C766573204D6169610000000000F60673BECC
      420552454E44410830303633312F3031EC51B81E8518AA401E576F726C642054
      757269736D6F206520526570726573656E7461633F65730000000000F60673BE
      CC420552454E44410830303337382F30313E0AD7A370EB9E401E5A65726F2048
      6F726120456469746F7261204A6F726E616C6973746963610000000000F60673
      BECC420552454E44410830303337382F30330AD7A3703DC27E40225A65726F20
      486F726120456469746F7261204A6F726E616C69737469636120532F41000000
      0000F60673BECC420552454E44410830303337382F30321F85EB5178D0C54022
      5A65726F20486F726120456469746F7261204A6F726E616C6973746963612053
      2F410000000000F60673BECC420553484F50500639303030303185EB51B86863
      034114434244202D20416C756775656C206D696E696D6F0000000000F60673BE
      CC420553484F5050063830303030317B14AE47E17A843F19434244202D20434F
      4E46495353414F204445204449564944410000000000F60673BECC420553484F
      505006393030303130E17A142E569031410E4D696E61732053686F7070696E67
      0000000000F60673BECC420553484F505006393030303131EC51B81E4F661B41
      0E4D696E61732053686F7070696E670000000000F60673BECC420553484F5050
      063930303031327B14AE478FBC08410E4E6F7274652053686F7070696E670000
      000000F60673BECC420553484F505006393030303133F6285C8F4BB710410E4E
      6F7274652053686F7070696E670000000000F60673BECC420553484F50500639
      303030313548E17A1444070641214E6F7274652053686F7070696E6720284573
      746163696F6E616D656E746F2049290000000000F60673BECC420553484F5050
      0639303030313615AE47E1BC460C41224E6F7274652053686F7070696E672028
      4573746163696F6E616D656E746F204949290000000000F60673BECC42055348
      4F505006393030303034C3F528DC5C4323410E53686F7070696E672042617272
      610000000000F60673BECC420553484F50500537303030351F85EB517480F540
      0E53686F7070696E672042617272610000000000F60673BECC420553484F5050
      063930303030350AD7A370AD0DF5400E53686F7070696E672042617272610000
      000000F60673BECC420553484F505006393030303038713D0AD719E81C411753
      686F7070696E67204967756174656D692042656C656D0000000000F60673BECC
      420553484F505006393030303039D7A3703DE288F5401753686F7070696E6720
      4967756174656D692042656C656D0000000000F60673BECC420553484F505006
      393030303037B81E85EB51B89E3F1853686F7070696E67204967756174656D69
      204D616365696F0000000000F60673BECC420553484F5050063930303030363E
      0AD723425D2E411853686F7070696E67204967756174656D69204D616365696F
      0000000000F60673BECC420553484F5050063930303030320000000080A9FC40
      10546175626174652053686F7070696E670000000000F60673BECC420553484F
      505006393030303033000000008001CF4010546175626174652053686F707069
      6E670000000000F60673BECC42045445525209616C69656E61E7E36F85EB51B8
      1E59C3401A74657272656E6F206A7572756A756261202D20676C656261206100
      00000000249A75BECC420450524F500C3032302F52454645522F3939AE47E17A
      14AEF73F07436F6D617061730000000000249A75BECC420552454E4441083030
      3636332F3031295C8FC2F528E43F234173736F63696163616F20646F73204170
      6F73656E7461646F732064612052464653410000000000249A75BECC42055245
      4E44410830303535362F3031C3F5285C8FC2E53F1C4175737472656E69657461
      204D61676E6F20646F732053616E746F730000000000249A75BECC420552454E
      44410830303539322F3031AE47E17A14AEE73F18417574656D6964696F20416E
      73656C6D6F204A756C69616F0000000000249A75BECC420552454E4441083030
      3433352F3033676666666666E63F2043616C65646F6E6561205365727669636F
      73205465636E69636F73204C7464610000000000249A75BECC420552454E4441
      0830303634332F3032E17A14AE47E1CA3F1A43616E616C20527572616C205072
      6F6475636F6573204C7464610000000000249A75BECC420552454E4441083030
      3437382F3032295C8FC2F528E43F1B436C617261204D617269612056656C6F73
      6F20436F72646569726F0000000000249A75BECC420552454E44410830303537
      302F3031EC51B81E85EB05402B45617469202D45737475646F73204176616E63
      61646F7320656D205465632E206520496E662E204C7464610000000000249A75
      BECC420552454E44410C3033372F52454645522F39397B14AE47E17A843F0A45
      4C4554524F425241530000000000249A75BECC420552454E4441083030333836
      2F3031AE47E17A14AEE73F0F466C6176696F2064652050696C6C610000000000
      249A75BECC420552454E44410830303536322F3032E17A14AE47E1E23F194672
      616E636973636F2041726D616E646F204D6F72656972610000000000249A75BE
      CC420552454E44410C3031332F52454645522F3030295C8FC2F528BC3F0D4675
      6E646163E36F20434F47450000000000249A75BECC420552454E44410C303033
      2F52454645522F3030CDCCCCCCCC5C5D4021474446202D20476F7665726E6F20
      646F20446973747269746F204665646572616C0000000000249A75BECC420552
      454E44410C3030392F52454645522F3030D7A3703D0AD7FB3F204744462D2047
      6F7665726E6F20646F20446973747269746F204665646572616C000000000024
      9A75BECC420552454E44410830303532372F30311F85EB51B81EF53F13496465
      6961732054757269736D6F204C7464610000000000249A75BECC420552454E44
      410830303634362F3031295C8FC2F528F43F134A43204275656E6F2026204369
      61204C7464610000000000249A75BECC420552454E44410830303536332F3032
      48E17A14AE47E13F124A6F616F20506564726F20506572656972610000000000
      249A75BECC420552454E44410830303537392F30317B14AE47E17A2240104A6F
      736520446F6368652046696C686F0000000000249A75BECC420552454E444108
      30303536342F3032295C8FC2F528F43F244D264D20436F6E73756C746F726961
      206520436F6E746162696C6964616465204C7464610000000000249A75BECC42
      0552454E44410830303339342F30310AD7A3703D0A0B40254D2E4B2E456D7072
      65656E64696D656E746F7320496D6F62696C696172696F73204C746461000000
      0000249A75BECC420552454E44410830303537362F3031AE47E17A14AEE73F1B
      4D61726320466F6D656E746F204D657263616E74696C204C7464610000000000
      249A75BECC420552454E44410830303539362F30337B14AE47E17AD43F144D61
      7263696F204D6573736961732043756E68610000000000249A75BECC42055245
      4E44410830303537372F303252B81E85EB51C83F0D4D656C6F20262053616E74
      6F730000000000249A75BECC420552454E44410830303630332F3032AE47E17A
      14AEE73F154E6579204665726E616E64657320506569786F746F000000000024
      9A75BECC420552454E44410830303630342F30310AD7A3703D0AF73F04504D44
      420000000000249A75BECC420552454E44410C3030322F52454645522F39358F
      C2F5285C6F46401150726F6374657220262047616D626C65200000000000249A
      75BECC420552454E44410830303532362F303185EB51B81E850B401C50726F2D
      53797374656D7320496E666F726D6174696361204C7464610000000000249A75
      BECC420552454E44410830303637322F3031C3F5285C8FC2C53F16526164696F
      20416E74656E61204E6F7665204C7464610000000000249A75BECC420552454E
      44410830303635362F303148E17A14AE47E13F1253616C6C7573204173732E20
      4D65646963610000000000249A75BECC420552454E44410830303439302F3034
      295C8FC2F528E43F2453616C6C7573204173736973742E204D65646963612065
      204F646F6E746F6C6F676963610000000000249A75BECC420552454E44410830
      303535332F3031AE47E17A14AEE73F1A53656C6D61204D61726961204C6F6261
      746F20506572656972610000000000249A75BECC420552454E44410C3030382F
      52454645522F303033333333332354402753696E64696361746F20646F732054
      726162616C6861646F72657320656D20456D7072657361730000000000249A75
      BECC420552454E44410830303539352F3031AE47E17A14AEE73F22536F6C7563
      616F20436F6E7461646F726573204173736F636961646F73204C746461000000
      0000249A75BECC420552454E44410C3032312F52454645522F39393E0AD7A370
      3D12400A54656C652050726573730000000000249A75BECC420552454E444108
      30303434382F3031713D0AD7A370F13F1E546572657361204372697374696E61
      204D65646569726F732053696C76610000000000249A75BECC420552454E4441
      0830303337382F3031295C8FC2F528CC3F1E5A65726F20486F72612045646974
      6F7261204A6F726E616C6973746963610000000000249A75BECC420553484F50
      50063930303030318FC2F5285C0F444014434244202D20416C756775656C206D
      696E696D6F0000000000522D78BECC420450524F500C3032302F52454645522F
      3939D7A3703D0AD7F73F07436F6D617061730000000000522D78BECC42055245
      4E44410830303636332F3031295C8FC2F528E43F234173736F63696163616F20
      646F732041706F73656E7461646F732064612052464653410000000000522D78
      BECC420552454E44410830303535362F303115AE47E17A14E63F1C4175737472
      656E69657461204D61676E6F20646F732053616E746F730000000000522D78BE
      CC420552454E44410830303539322F30310AD7A3703D0AE73F18417574656D69
      64696F20416E73656C6D6F204A756C69616F0000000000522D78BECC42055245
      4E44410830303433352F303315AE47E17A14E63F2043616C65646F6E65612053
      65727669636F73205465636E69636F73204C7464610000000000522D78BECC42
      0552454E44410830303634332F3032B81E85EB51B8CE3F1A43616E616C205275
      72616C2050726F6475636F6573204C7464610000000000522D78BECC42055245
      4E44410830303437382F3032295C8FC2F528E43F1B436C617261204D61726961
      2056656C6F736F20436F72646569726F0000000000522D78BECC420552454E44
      410830303537302F3031EC51B81E85EB05402B45617469202D45737475646F73
      204176616E6361646F7320656D205465632E206520496E662E204C7464610000
      000000522D78BECC420552454E44410830303338362F30310AD7A3703D0AE73F
      0F466C6176696F2064652050696C6C610000000000522D78BECC420552454E44
      410830303536322F30328FC2F5285C8FE23F194672616E636973636F2041726D
      616E646F204D6F72656972610000000000522D78BECC420552454E44410C3031
      332F52454645522F3030295C8FC2F528BC3F0D46756E646163E36F20434F4745
      0000000000522D78BECC420552454E44410C3030332F52454645522F30305C8F
      C2F5285C5D4021474446202D20476F7665726E6F20646F20446973747269746F
      204665646572616C0000000000522D78BECC420552454E44410C3030392F5245
      4645522F3030D7A3703D0AD7FB3F204744462D20476F7665726E6F20646F2044
      6973747269746F204665646572616C0000000000522D78BECC420552454E4441
      0830303532372F3031713D0AD7A370F53F134964656961732054757269736D6F
      204C7464610000000000522D78BECC420552454E44410830303634362F30317B
      14AE47E17AF43F134A43204275656E6F202620436961204C7464610000000000
      522D78BECC420552454E44410830303536332F3032F6285C8FC2F5E03F124A6F
      616F20506564726F20506572656972610000000000522D78BECC420552454E44
      410830303537392F3031F6285C8FC2752240104A6F736520446F636865204669
      6C686F0000000000522D78BECC420552454E44410830303536342F30327B14AE
      47E17AF43F244D264D20436F6E73756C746F726961206520436F6E746162696C
      6964616465204C7464610000000000522D78BECC420552454E44410830303339
      342F30313333333333330B40254D2E4B2E456D707265656E64696D656E746F73
      20496D6F62696C696172696F73204C7464610000000000522D78BECC42055245
      4E44410830303537362F30310AD7A3703D0AE73F1B4D61726320466F6D656E74
      6F204D657263616E74696C204C7464610000000000522D78BECC420552454E44
      410830303539362F30337B14AE47E17AD43F144D617263696F204D6573736961
      732043756E68610000000000522D78BECC420552454E44410830303537372F30
      320AD7A3703D0AC73F0D4D656C6F20262053616E746F730000000000522D78BE
      CC420552454E44410830303630332F30320AD7A3703D0AE73F154E6579204665
      726E616E64657320506569786F746F0000000000522D78BECC420552454E4441
      0830303630342F30315C8FC2F5285CF73F04504D44420000000000522D78BECC
      420552454E44410C3030322F52454645522F3935713D0AD7A37046401150726F
      6374657220262047616D626C65200000000000522D78BECC420552454E444108
      30303532362F30315C8FC2F5285C0B401C50726F2D53797374656D7320496E66
      6F726D6174696361204C7464610000000000522D78BECC420552454E44410830
      303637322F30319A9999999999C93F16526164696F20416E74656E61204E6F76
      65204C7464610000000000522D78BECC420552454E44410830303635362F3031
      F6285C8FC2F5E03F1253616C6C7573204173732E204D65646963610000000000
      522D78BECC420552454E44410830303439302F3034295C8FC2F528E43F245361
      6C6C7573204173736973742E204D65646963612065204F646F6E746F6C6F6769
      63610000000000522D78BECC420552454E44410830303535332F30310AD7A370
      3D0AE73F1A53656C6D61204D61726961204C6F6261746F205065726569726100
      00000000522D78BECC420552454E44410C3030382F52454645522F3030E17A14
      AE472154402753696E64696361746F20646F732054726162616C6861646F7265
      7320656D20456D7072657361730000000000522D78BECC420552454E44410830
      303539352F30310AD7A3703D0AE73F22536F6C7563616F20436F6E7461646F72
      6573204173736F636961646F73204C7464610000000000522D78BECC42055245
      4E44410C3032312F52454645522F3939295C8FC2F52812400A54656C65205072
      6573730000000000522D78BECC420552454E44410830303434382F30311F85EB
      51B81EF13F1E546572657361204372697374696E61204D65646569726F732053
      696C76610000000000522D78BECC420552454E44410830303337382F3031295C
      8FC2F528CC3F1E5A65726F20486F726120456469746F7261204A6F726E616C69
      73746963610000000000522D78BECC420553484F505006393030303031AE47E1
      7A140E444014434244202D20416C756775656C206D696E696D6F000000000080
      C07ABECC420450524F500C3032302F52454645522F3939AE47E17A14AEF73F07
      436F6D61706173000000000080C07ABECC420552454E44410830303636332F30
      31CDCCCCCCCCCCE43F234173736F63696163616F20646F732041706F73656E74
      61646F73206461205246465341000000000080C07ABECC420552454E44410830
      303535362F3031C3F5285C8FC2E53F1C4175737472656E69657461204D61676E
      6F20646F732053616E746F73000000000080C07ABECC420552454E4441083030
      3539322F30315C8FC2F5285CE73F18417574656D6964696F20416E73656C6D6F
      204A756C69616F000000000080C07ABECC420552454E44410830303433352F30
      33C3F5285C8FC2E53F2043616C65646F6E6561205365727669636F7320546563
      6E69636F73204C746461000000000080C07ABECC420552454E44410830303634
      332F3032295C8FC2F528CC3F1A43616E616C20527572616C2050726F6475636F
      6573204C746461000000000080C07ABECC420552454E44410830303437382F30
      32CDCCCCCCCCCCE43F1B436C617261204D617269612056656C6F736F20436F72
      646569726F000000000080C07ABECC420552454E44410830303537302F3031EC
      51B81E85EB05402B45617469202D45737475646F73204176616E6361646F7320
      656D205465632E206520496E662E204C746461000000000080C07ABECC420552
      454E44410C3033372F52454645522F39397B14AE47E17A843F0A454C4554524F
      42524153000000000080C07ABECC420552454E44410830303338362F30315C8F
      C2F5285CE73F0F466C6176696F2064652050696C6C61000000000080C07ABECC
      420552454E44410830303536322F3032E17A14AE47E1E23F194672616E636973
      636F2041726D616E646F204D6F7265697261000000000080C07ABECC42055245
      4E44410C3031332F52454645522F3030295C8FC2F528BC3F0D46756E646163E3
      6F20434F4745000000000080C07ABECC420552454E44410C3030332F52454645
      522F3030AE47E17A145E5D4021474446202D20476F7665726E6F20646F204469
      73747269746F204665646572616C000000000080C07ABECC420552454E44410C
      3030392F52454645522F3030D7A3703D0AD7FB3F204744462D20476F7665726E
      6F20646F20446973747269746F204665646572616C000000000080C07ABECC42
      0552454E44410830303532372F30311F85EB51B81EF53F134964656961732054
      757269736D6F204C746461000000000080C07ABECC420552454E444108303036
      34362F3031295C8FC2F528F43F134A43204275656E6F202620436961204C7464
      61000000000080C07ABECC420552454E44410830303536332F303248E17A14AE
      47E13F124A6F616F20506564726F2050657265697261000000000080C07ABECC
      420552454E44410830303537392F30310000000000802240104A6F736520446F
      6368652046696C686F000000000080C07ABECC420552454E4441083030353634
      2F3032295C8FC2F528F43F244D264D20436F6E73756C746F726961206520436F
      6E746162696C6964616465204C746461000000000080C07ABECC420552454E44
      410830303339342F3031F6285C8FC2F50A40254D2E4B2E456D707265656E6469
      6D656E746F7320496D6F62696C696172696F73204C746461000000000080C07A
      BECC420552454E44410830303537362F30315C8FC2F5285CE73F1B4D61726320
      466F6D656E746F204D657263616E74696C204C746461000000000080C07ABECC
      420552454E44410830303539362F3033D7A3703D0AD7D33F144D617263696F20
      4D6573736961732043756E6861000000000080C07ABECC420552454E44410830
      303537372F303252B81E85EB51C83F0D4D656C6F20262053616E746F73000000
      000080C07ABECC420552454E44410830303630332F30325C8FC2F5285CE73F15
      4E6579204665726E616E64657320506569786F746F000000000080C07ABECC42
      0552454E44410830303630342F3031E17A14AE47E1F63F04504D444200000000
      0080C07ABECC420552454E44410C3030322F52454645522F39358FC2F5285C6F
      46401150726F6374657220262047616D626C6520000000000080C07ABECC4205
      52454E44410830303532362F3031AE47E17A14AE0B401C50726F2D5379737465
      6D7320496E666F726D6174696361204C746461000000000080C07ABECC420552
      454E44410830303637322F30317B14AE47E17AC43F16526164696F20416E7465
      6E61204E6F7665204C746461000000000080C07ABECC420552454E4441083030
      3635362F303148E17A14AE47E13F1253616C6C7573204173732E204D65646963
      61000000000080C07ABECC420552454E44410830303439302F3034CDCCCCCCCC
      CCE43F2453616C6C7573204173736973742E204D65646963612065204F646F6E
      746F6C6F67696361000000000080C07ABECC420552454E44410830303535332F
      30315C8FC2F5285CE73F1A53656C6D61204D61726961204C6F6261746F205065
      7265697261000000000080C07ABECC420552454E44410C3030382F5245464552
      2F30303E0AD7A3701D54402753696E64696361746F20646F732054726162616C
      6861646F72657320656D20456D707265736173000000000080C07ABECC420552
      454E44410830303539352F30315C8FC2F5285CE73F22536F6C7563616F20436F
      6E7461646F726573204173736F636961646F73204C746461000000000080C07A
      BECC420552454E44410C3032312F52454645522F393948E17A14AE4712400A54
      656C65205072657373000000000080C07ABECC420552454E4441083030343438
      2F30319A9999999999F13F1E546572657361204372697374696E61204D656465
      69726F732053696C7661000000000080C07ABECC420552454E44410830303337
      382F3031295C8FC2F528CC3F1E5A65726F20486F726120456469746F7261204A
      6F726E616C697374696361000000000080C07ABECC420553484F505006393030
      303031713D0AD7A310444014434244202D20416C756775656C206D696E696D6F
      0000000000AE537DBECC420450524F500C3032302F52454645522F393948E17A
      14AE68A14007436F6D617061730000000000AE537DBECC420552454E44410830
      303636332F30319A99999999990540234173736F63696163616F20646F732041
      706F73656E7461646F732064612052464653410000000000AE537DBECC420552
      454E44410830303535362F3031713D0AD7A37007401C4175737472656E696574
      61204D61676E6F20646F732053616E746F730000000000AE537DBECC42055245
      4E44410830303539322F30310000000000000A4018417574656D6964696F2041
      6E73656C6D6F204A756C69616F0000000000AE537DBECC420552454E44410830
      303433352F3033295C8FC2F52806402043616C65646F6E656120536572766963
      6F73205465636E69636F73204C7464610000000000AE537DBECC420552454E44
      410830303634332F3032676666666666EE3F1A43616E616C20527572616C2050
      726F6475636F6573204C7464610000000000AE537DBECC420552454E44410830
      303437382F30329A999999999905401B436C617261204D617269612056656C6F
      736F20436F72646569726F0000000000AE537DBECC420552454E444108303035
      37302F3031EC51B81E85EB25402B45617469202D45737475646F73204176616E
      6361646F7320656D205465632E206520496E662E204C7464610000000000AE53
      7DBECC420552454E44410C3033372F52454645522F39397B14AE47E17A843F0A
      454C4554524F425241530000000000AE537DBECC420552454E44410830303338
      362F303190C2F5285C8F08400F466C6176696F2064652050696C6C6100000000
      00AE537DBECC420552454E44410830303536322F303215AE47E17A1404401946
      72616E636973636F2041726D616E646F204D6F72656972610000000000AE537D
      BECC420552454E44410C3031332F52454645522F30309A9999999999E13F0D46
      756E646163E36F20434F47450000000000AE537DBECC420552454E44410C3030
      332F52454645522F3030AE47E17A145A824021474446202D20476F7665726E6F
      20646F20446973747269746F204665646572616C0000000000AE537DBECC4205
      52454E44410C3030392F52454645522F30305C8FC2F5285C2140204744462D20
      476F7665726E6F20646F20446973747269746F204665646572616C0000000000
      AE537DBECC420552454E44410830303532372F30318FC2F5285C8F1640134964
      656961732054757269736D6F204C7464610000000000AE537DBECC420552454E
      44410830303634362F30318FC2F5285C8F1540134A43204275656E6F20262043
      6961204C7464610000000000AE537DBECC420552454E44410830303536332F30
      32713D0AD7A3700340124A6F616F20506564726F205065726569726100000000
      00AE537DBECC420552454E44410830303537392F3031D7A3703D0A974340104A
      6F736520446F6368652046696C686F0000000000AE537DBECC420552454E4441
      0830303536342F3032CDCCCCCCCCCC1640244D264D20436F6E73756C746F7269
      61206520436F6E746162696C6964616465204C7464610000000000AE537DBECC
      420552454E44410830303339342F3031D7A3703D0AD72B40254D2E4B2E456D70
      7265656E64696D656E746F7320496D6F62696C696172696F73204C7464610000
      000000AE537DBECC420552454E44410830303537362F30310000000000000A40
      1B4D61726320466F6D656E746F204D657263616E74696C204C74646100000000
      00AE537DBECC420552454E44410830303539362F303352B81E85EB51F43F144D
      617263696F204D6573736961732043756E68610000000000AE537DBECC420552
      454E44410C3035362F52454645522F3031B81E85EB51B89E3F264D6173746572
      20436F6220436F6272616EE761206520436F6E73756C746F726961204C746461
      0000000000AE537DBECC420552454E44410830303537372F30325C8FC2F5285C
      E73F0D4D656C6F20262053616E746F730000000000AE537DBECC420552454E44
      410830303630332F303290C2F5285C8F0840154E6579204665726E616E646573
      20506569786F746F0000000000AE537DBECC420552454E44410830303630342F
      3031A4703D0AD7A3184004504D44420000000000AE537DBECC420552454E4441
      0C3030322F52454645522F3935EC51B81E850B6C401150726F63746572202620
      47616D626C65200000000000AE537DBECC420552454E44410830303532362F30
      313333333333332D401C50726F2D53797374656D7320496E666F726D61746963
      61204C7464610000000000AE537DBECC420552454E44410830303637322F3031
      9A9999999999E93F16526164696F20416E74656E61204E6F7665204C74646100
      00000000AE537DBECC420552454E44410830303635362F303167666666666602
      401253616C6C7573204173732E204D65646963610000000000AE537DBECC4205
      52454E44410830303439302F30349A999999999905402453616C6C7573204173
      736973742E204D65646963612065204F646F6E746F6C6F676963610000000000
      AE537DBECC420552454E44410830303535332F30310000000000000A401A5365
      6C6D61204D61726961204C6F6261746F20506572656972610000000000AE537D
      BECC420552454E44410C3030382F52454645522F30305C8FC2F528CC77402753
      696E64696361746F20646F732054726162616C6861646F72657320656D20456D
      7072657361730000000000AE537DBECC420552454E44410830303539352F3031
      90C2F5285C8F084022536F6C7563616F20436F6E7461646F726573204173736F
      636961646F73204C7464610000000000AE537DBECC420552454E44410C303231
      2F52454645522F39397B14AE47E1BA36400A54656C6520507265737300000000
      00AE537DBECC420552454E44410830303434382F303167666666666612401E54
      6572657361204372697374696E61204D65646569726F732053696C7661000000
      0000AE537DBECC420552454E44410830303337382F3031B81E85EB51B8EE3F1E
      5A65726F20486F726120456469746F7261204A6F726E616C6973746963610000
      000000AE537DBECC420553484F505006393030303031A4703D0AD71369401443
      4244202D20416C756775656C206D696E696D6F00000000007A1397BECC420450
      524F500C3032302F52454645522F3939C3F5285C8F9CB14007436F6D61706173
      00000000007A1397BECC420552454E44410830303636332F303152B81E85EB51
      2940234173736F63696163616F20646F732041706F73656E7461646F73206461
      20524646534100000000007A1397BECC420552454E44410830303535362F3031
      85EB51B81E852B401C4175737472656E69657461204D61676E6F20646F732053
      616E746F7300000000007A1397BECC420552454E44410830303539322F3031F6
      285C8FC2F52C4018417574656D6964696F20416E73656C6D6F204A756C69616F
      00000000007A1397BECC420552454E44410830303433352F303385EB51B81E85
      2B402043616C65646F6E6561205365727669636F73205465636E69636F73204C
      74646100000000007A1397BECC420552454E44410830303634332F3032000000
      00000012401A43616E616C20527572616C2050726F6475636F6573204C746461
      00000000007A1397BECC420552454E44410830303437382F303252B81E85EB51
      29401B436C617261204D617269612056656C6F736F20436F72646569726F0000
      0000007A1397BECC420552454E44410830303537302F3031A4703D0AD7634B40
      2B45617469202D45737475646F73204176616E6361646F7320656D205465632E
      206520496E662E204C74646100000000007A1397BECC420552454E44410C3033
      372F52454645522F3939B81E85EB51B8BE3F0A454C4554524F42524153000000
      00007A1397BECC420552454E44410C3033362F52454645522F3031EC51B81E85
      8692400A454C4554524F4252C15300000000007A1397BECC420552454E444108
      30303338362F3031F6285C8FC2F52C400F466C6176696F2064652050696C6C61
      00000000007A1397BECC420552454E44410830303536322F30328FC2F5285C8F
      2740194672616E636973636F2041726D616E646F204D6F726569726100000000
      007A1397BECC420552454E44410C3031332F52454645522F303048E17A14AE47
      01400D46756E646163E36F20434F474500000000007A1397BECC420552454E44
      410C3030332F52454645522F3030295C8FC27594A24021474446202D20476F76
      65726E6F20646F20446973747269746F204665646572616C00000000007A1397
      BECC420552454E44410C3030392F52454645522F303000000000006041402047
      44462D20476F7665726E6F20646F20446973747269746F204665646572616C00
      000000007A1397BECC420552454E44410C3030332F52454645522F3937000000
      0000208C4015476572616C20646520436F6E637265746F20532F410000000000
      7A1397BECC420552454E44410830303532372F30310AD7A3703D8A3A40134964
      656961732054757269736D6F204C74646100000000007A1397BECC420552454E
      44410830303634362F3031D7A3703D0A573940134A43204275656E6F20262043
      6961204C74646100000000007A1397BECC420552454E44410830303536332F30
      32C3F5285C8FC22540124A6F616F20506564726F205065726569726100000000
      007A1397BECC420552454E44410830303537392F3031A4703D0AD7136740104A
      6F736520446F6368652046696C686F00000000007A1397BECC420552454E4441
      0830303536342F3032D7A3703D0A573940244D264D20436F6E73756C746F7269
      61206520436F6E746162696C6964616465204C74646100000000007A1397BECC
      420552454E44410830303339342F30318FC2F5285CEF5040254D2E4B2E456D70
      7265656E64696D656E746F7320496D6F62696C696172696F73204C7464610000
      0000007A1397BECC420552454E44410830303537362F3031F6285C8FC2F52C40
      1B4D61726320466F6D656E746F204D657263616E74696C204C74646100000000
      007A1397BECC420552454E44410830303539362F30335C8FC2F5285C1940144D
      617263696F204D6573736961732043756E686100000000007A1397BECC420552
      454E44410C3035362F52454645522F3031D7A3703D0ADF6B40264D6173746572
      20436F6220436F6272616EE761206520436F6E73756C746F726961204C746461
      00000000007A1397BECC420552454E44410830303537372F30329A9999999999
      0D400D4D656C6F20262053616E746F7300000000007A1397BECC420552454E44
      410830303637352F30310000000000002140244D696469612042726173696C20
      5075626C696369646164652065204D61726B6574696E6700000000007A1397BE
      CC420552454E44410830303630332F3032F6285C8FC2F52C40154E6579204665
      726E616E64657320506569786F746F00000000007A1397BECC420552454E4441
      0830303630342F3031F6285C8FC2F53C4004504D444200000000007A1397BECC
      420552454E44410C3030322F52454645522F3935A4703D0AD70B8C401150726F
      6374657220262047616D626C652000000000007A1397BECC420552454E444108
      30303532362F303133333333333351401C50726F2D53797374656D7320496E66
      6F726D6174696361204C74646100000000007A1397BECC420552454E44410830
      303637322F3031F6285C8FC2F50C4016526164696F20416E74656E61204E6F76
      65204C74646100000000007A1397BECC420552454E44410830303635362F3031
      C3F5285C8FC225401253616C6C7573204173732E204D65646963610000000000
      7A1397BECC420552454E44410830303439302F303452B81E85EB512940245361
      6C6C7573204173736973742E204D65646963612065204F646F6E746F6C6F6769
      636100000000007A1397BECC420552454E44410830303535332F3031F6285C8F
      C2F52C401A53656C6D61204D61726961204C6F6261746F205065726569726100
      000000007A1397BECC420552454E44410C3030382F52454645522F3030E17A14
      AE9BDE03412753696E64696361746F20646F732054726162616C6861646F7265
      7320656D20456D70726573617300000000007A1397BECC420552454E44410830
      303539352F3031F6285C8FC2F52C4022536F6C7563616F20436F6E7461646F72
      6573204173736F636961646F73204C74646100000000007A1397BECC42055245
      4E44410C3032312F52454645522F39390000000000C056400A54656C65205072
      65737300000000007A1397BECC420552454E44410830303434382F30313E0AD7
      A370BD35401E546572657361204372697374696E61204D65646569726F732053
      696C766100000000007A1397BECC420552454E44410830303337382F3031713D
      0AD7A37011401E5A65726F20486F726120456469746F7261204A6F726E616C69
      737469636100000000007A1397BECC420553484F505006393030303031AE47E1
      7AD431B0C014434244202D20416C756775656C206D696E696D6F00000000007A
      1397BECC420553484F5050063930303031329A999999217505410E4E6F727465
      2053686F7070696E670000000000A8A699BECC420450524F500C3032302F5245
      4645522F39391F85EB51B8B4874007436F6D617061730000000000A8A699BECC
      420552454E44410830303636332F3031295C8FC2F528F43F234173736F636961
      63616F20646F732041706F73656E7461646F7320646120524646534100000000
      00A8A699BECC420552454E44410830303535362F303115AE47E17A14F63F1C41
      75737472656E69657461204D61676E6F20646F732053616E746F730000000000
      A8A699BECC420552454E44410830303539322F30310AD7A3703D0AF73F184175
      74656D6964696F20416E73656C6D6F204A756C69616F0000000000A8A699BECC
      420552454E44410830303433352F3033676666666666F63F2043616C65646F6E
      6561205365727669636F73205465636E69636F73204C7464610000000000A8A6
      99BECC420552454E44410830303634332F3032295C8FC2F528DC3F1A43616E61
      6C20527572616C2050726F6475636F6573204C7464610000000000A8A699BECC
      420552454E44410830303437382F3032295C8FC2F528F43F1B436C617261204D
      617269612056656C6F736F20436F72646569726F0000000000A8A699BECC4205
      52454E44410830303537302F3031EC51B81E85EB15402B45617469202D457374
      75646F73204176616E6361646F7320656D205465632E206520496E662E204C74
      64610000000000A8A699BECC420552454E44410830303338362F30310AD7A370
      3D0AF73F0F466C6176696F2064652050696C6C610000000000A8A699BECC4205
      52454E44410830303536322F30328FC2F5285C8FF23F194672616E636973636F
      2041726D616E646F204D6F72656972610000000000A8A699BECC420552454E44
      410C3031332F52454645522F3030295C8FC2F528CC3F0D46756E646163E36F20
      434F47450000000000A8A699BECC420552454E44410C3030332F52454645522F
      303067666666665E6D4021474446202D20476F7665726E6F20646F2044697374
      7269746F204665646572616C0000000000A8A699BECC420552454E44410C3030
      392F52454645522F3030C3F5285C8FC20B40204744462D20476F7665726E6F20
      646F20446973747269746F204665646572616C0000000000A8A699BECC420552
      454E44410830303532372F303148E17A14AE4705401349646569617320547572
      69736D6F204C7464610000000000A8A699BECC420552454E4441083030363436
      2F30317B14AE47E17A0440134A43204275656E6F202620436961204C74646100
      00000000A8A699BECC420552454E44410830303536332F3032F6285C8FC2F5F0
      3F124A6F616F20506564726F20506572656972610000000000A8A699BECC4205
      52454E44410830303537392F3031F6285C8FC2753240104A6F736520446F6368
      652046696C686F0000000000A8A699BECC420552454E44410830303536342F30
      327B14AE47E17A0440244D264D20436F6E73756C746F726961206520436F6E74
      6162696C6964616465204C7464610000000000A8A699BECC420552454E444108
      30303339342F30311F85EB51B81E1B40254D2E4B2E456D707265656E64696D65
      6E746F7320496D6F62696C696172696F73204C7464610000000000A8A699BECC
      420552454E44410830303537362F30310AD7A3703D0AF73F1B4D61726320466F
      6D656E746F204D657263616E74696C204C7464610000000000A8A699BECC4205
      52454E44410830303539362F30337B14AE47E17AE43F144D617263696F204D65
      73736961732043756E68610000000000A8A699BECC420552454E44410C303536
      2F52454645522F30317B14AE47E17A943F264D617374657220436F6220436F62
      72616EE761206520436F6E73756C746F726961204C7464610000000000A8A699
      BECC420552454E44410830303537372F30320AD7A3703D0AD73F0D4D656C6F20
      262053616E746F730000000000A8A699BECC420552454E44410830303630332F
      30320AD7A3703D0AF73F154E6579204665726E616E64657320506569786F746F
      0000000000A8A699BECC420552454E44410830303630342F3031333333333333
      074004504D44420000000000A8A699BECC420552454E44410C3030322F524546
      45522F3935713D0AD7A37056401150726F6374657220262047616D626C652000
      00000000A8A699BECC420552454E44410830303532362F3031713D0AD7A3701B
      401C50726F2D53797374656D7320496E666F726D6174696361204C7464610000
      000000A8A699BECC420552454E44410830303637322F3031C3F5285C8FC2D53F
      16526164696F20416E74656E61204E6F7665204C7464610000000000A8A699BE
      CC420552454E44410830303635362F3031F6285C8FC2F5F03F1253616C6C7573
      204173732E204D65646963610000000000A8A699BECC420552454E4441083030
      3439302F3034295C8FC2F528F43F2453616C6C7573204173736973742E204D65
      646963612065204F646F6E746F6C6F676963610000000000A8A699BECC420552
      454E44410830303535332F30310AD7A3703D0AF73F1A53656C6D61204D617269
      61204C6F6261746F20506572656972610000000000A8A699BECC420552454E44
      410C3030382F52454645522F30303E0AD7A3708D75402753696E64696361746F
      20646F732054726162616C6861646F72657320656D20456D7072657361730000
      000000A8A699BECC420552454E44410830303539352F30310AD7A3703D0AF73F
      22536F6C7563616F20436F6E7461646F726573204173736F636961646F73204C
      7464610000000000A8A699BECC420552454E44410C3032312F52454645522F39
      393E0AD7A3703D22400A54656C652050726573730000000000A8A699BECC4205
      52454E44410830303434382F30311F85EB51B81E01401E546572657361204372
      697374696E61204D65646569726F732053696C76610000000000A8A699BECC42
      0552454E44410830303337382F3031295C8FC2F528DC3F1E5A65726F20486F72
      6120456469746F7261204A6F726E616C6973746963610000000000A8A699BECC
      420553484F5050063930303030316766666666A64C4014434244202D20416C75
      6775656C206D696E696D6F0000000000A8A699BECC42045445525209616C6965
      6E61E7E36F5C8FC2F528CCA9401A74657272656E6F206A7572756A756261202D
      20676C6562612061}
  end
  object dsContrato: TDataSource
    DataSet = cdsContrato
    Left = 331
    Top = 32
  end
  object pplContrato: TppBDEPipeline
    DataSource = dsContrato
    UserName = 'lContrato'
    Left = 332
    Top = 47
    object pplContratoppField1: TppField
      FieldAlias = 'DATAOPER'
      FieldName = 'DATAOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object pplContratoppField2: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 1
    end
    object pplContratoppField3: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object pplContratoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDIA'
      FieldName = 'VLRDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplContratoppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pfldContratoppField6: TppField
      FieldAlias = 'DESCR_SITCONTR'
      FieldName = 'DESCR_SITCONTR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
  end
end
