inherited dtmRelMovimContabil: TdtmRelMovimContabil
  Left = 514
  Top = 259
  Width = 401
  Height = 246
  Caption = ']'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Segmento'
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
        Name = 'Segmento'
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
        Caption = 'Contrato'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Name = 'Contrato'
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
        Caption = 'Data'
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
        Name = 'Data'
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
        Caption = 'bSeparador'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Name = 'bSeparador'
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
        Caption = 'bCorLinha'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Name = 'bCorLinha'
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
        Caption = 'iPosCor'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Name = 'iPosCor'
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
        Caption = 'iTipoRelat'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Name = 'iTipoRelat'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptMovimContabil
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    FieldDefs = <
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'CONNUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONNOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SEGMENTO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'SALDOINICIAL'
        DataType = ftFloat
      end
      item
        Name = 'CORR_INAD'
        DataType = ftFloat
      end
      item
        Name = 'JUROS_INAD'
        DataType = ftFloat
      end
      item
        Name = 'MULTA_INAD'
        DataType = ftFloat
      end
      item
        Name = 'RESIDUO'
        DataType = ftFloat
      end
      item
        Name = 'JUROS_MES'
        DataType = ftFloat
      end
      item
        Name = 'CORRRESID_MES'
        DataType = ftFloat
      end
      item
        Name = 'CORRSALDO_MES'
        DataType = ftFloat
      end
      item
        Name = 'RECEBIMENTOS'
        DataType = ftFloat
      end
      item
        Name = 'SALDOFINAL'
        DataType = ftFloat
      end>
    IndexFieldNames = 'SEGMENTO;CONNUMERO'
    StoreDefs = True
    Left = 40
    Top = 88
    Data = {
      A20100009619E0BD010000001800000010000000000003000000A20110494443
      4F4E545241544F494D4F56454C080004000000000009434F4E4E554D45524F01
      0049000000010005574944544802000200140007434F4E4E4F4D450100490000
      000100055749445448020002003C000B52415A414F534F4349414C0100490000
      000100055749445448020002003C00085345474D454E544F0100490000000100
      0557494454480200020005000556414C4F5208000400000000000C53414C444F
      494E494349414C080004000000000009434F52525F494E414408000400000000
      000A4A55524F535F494E414408000400000000000A4D554C54415F494E414408
      00040000000000075245534944554F0800040000000000094A55524F535F4D45
      5308000400000000000D434F525252455349445F4D455308000400000000000D
      434F525253414C444F5F4D455308000400000000000C5245434542494D454E54
      4F5308000400000000000A53414C444F46494E414C080004000000000002000D
      44454641554C545F4F52444552020082000200000005000200044C4349440400
      010009080000}
    object cdsIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object cdsSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      Size = 5
    end
    object cdsVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsSALDOINICIAL: TFloatField
      FieldName = 'SALDOINICIAL'
    end
    object cdsCORR_INAD: TFloatField
      FieldName = 'CORR_INAD'
    end
    object cdsJUROS_INAD: TFloatField
      FieldName = 'JUROS_INAD'
    end
    object cdsMULTA_INAD: TFloatField
      FieldName = 'MULTA_INAD'
    end
    object cdsRESIDUO: TFloatField
      FieldName = 'RESIDUO'
    end
    object cdsJUROS_MES: TFloatField
      FieldName = 'JUROS_MES'
    end
    object cdsCORRRESID_MES: TFloatField
      FieldName = 'CORRRESID_MES'
    end
    object cdsCORRSALDO_MES: TFloatField
      FieldName = 'CORRSALDO_MES'
    end
    object cdsRECEBIMENTOS: TFloatField
      FieldName = 'RECEBIMENTOS'
    end
    object cdsSALDOFINAL: TFloatField
      FieldName = 'SALDOFINAL'
    end
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '          CI.IDCONTRATOIMOVEL,'
      '          CI.CONNUMERO,'
      '          CI.CONNOME,'
      '          P.RAZAOSOCIAL,'
      '          IM.SEGMENTO,'
      '          0 AS VALOR,'
      '          0 AS SALDOINICIAL,'
      '          0 AS CORR_INAD,'
      '          0 AS JUROS_INAD,'
      '          0 AS MULTA_INAD,'
      '          0 AS RESIDUO,'
      '          0 AS JUROS_MES,'
      '          0 AS CORRRESID_MES,'
      '          0 AS CORRSALDO_MES,'
      '          0 AS RECEBIMENTOS,'
      '          0 AS SALDOFINAL'
      '  FROM'
      '       CONTRATOIMOVEL CI,'
      '       PESSOA P,'
      '       '
      '       ( SELECT DISTINCT'
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '                M.IMONOME            AS NOMEMESTRE,'
      '                M.IDIMOVEL           AS IDIMOVEL,'
      '                I.CODTIPIMOVEL       AS SEGMENTO'
      '           FROM CONTRATOXIMOVEL CXI,'
      '                IMOVEL I,'
      '                IMOVEL M'
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '            AND I.IDIMOVELMESTRE = M.IDIMOVEL'
      '       ) IM'
      ' WHERE  (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      '    AND ( CI.IDCONTRATOIMOVEL = 2181 )'
      ''
      '  ORDER BY IM.SEGMENTO, CI.CONNUMERO'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 172
    Top = 88
  end
  inherited ds: TDataSource
    Top = 88
  end
  object rptMovimContabil: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 300
    Top = 88
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19579
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
        mmLeft = 43392
        mmTop = 794
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Movimentação Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 197380
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 14288
        mmWidth = 10583
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clWindow
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CONNUMERO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3260
        mmLeft = 794
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CONNOME'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 0
        mmWidth = 53181
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDOINICIAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 74083
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CORR_INAD'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'JUROS_INAD'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MULTA_INAD'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RESIDUO'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'JUROS_MES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 186532
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CORRRESID_MES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 204523
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CORRSALDO_MES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 221721
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'RECEBIMENTOS'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 239184
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'SALDOFINAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 259292
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
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
        mmWidth = 287338
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
        mmWidth = 285751
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
        mmLeft = 255323
        mmTop = 3175
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 54843
        mmTop = 529
        mmWidth = 17653
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDOINICIAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 74877
        mmTop = 794
        mmWidth = 26458
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'CORR_INAD'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 794
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'JUROS_INAD'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 125148
        mmTop = 794
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'MULTA_INAD'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 146579
        mmTop = 794
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'RESIDUO'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 169334
        mmTop = 794
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'JUROS_MES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 186532
        mmTop = 794
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'CORRRESID_MES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 204523
        mmTop = 794
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc102'
        DataField = 'CORRSALDO_MES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 221721
        mmTop = 794
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'RECEBIMENTOS'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 239184
        mmTop = 794
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'SALDOFINAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 259292
        mmTop = 794
        mmWidth = 24342
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'SEGMENTO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 187325
          mmTop = 5027
          mmWidth = 71173
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 104775
          mmTop = 9525
          mmWidth = 60590
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 105304
          mmTop = 5027
          mmWidth = 79111
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'SEGMENTO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3704
          mmLeft = 18785
          mmTop = 0
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 11642
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 11377
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object pplblSaldoIni: TppLabel
          UserName = 'lblSaldoIni'
          Caption = 'Saldo em 99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 74348
          mmTop = 11377
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 15346
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'CM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 119063
          mmTop = 11377
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 137319
          mmTop = 11377
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 156369
          mmTop = 11377
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          AutoSize = False
          Caption = 'Inadimplência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 124619
          mmTop = 7673
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 169863
          mmTop = 11377
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label12'
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 196321
          mmTop = 11377
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label13'
          Caption = 'Corr. Residuo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 205317
          mmTop = 7408
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label14'
          Caption = 'Corr. Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 226219
          mmTop = 7408
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label15'
          Caption = 'Recebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 239184
          mmTop = 11377
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label16'
          Caption = 'Saldo Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 260880
          mmTop = 11377
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Movimentação no mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 204523
          mmTop = 3704
          mmWidth = 38100
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Atualização Diária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 132557
          mmTop = 3704
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 2117
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDOFINAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 259292
          mmTop = 4233
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Total do Segmento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3810
          mmLeft = 42778
          mmTop = 4233
          mmWidth = 29718
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SALDOINICIAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 74877
          mmTop = 4233
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'CORR_INAD'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 103717
          mmTop = 4233
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'JUROS_INAD'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 125148
          mmTop = 4233
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'MULTA_INAD'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 146579
          mmTop = 4233
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'RESIDUO'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 169334
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'JUROS_MES'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 186532
          mmTop = 4233
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'CORRRESID_MES'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 204523
          mmTop = 4233
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'CORRSALDO_MES'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 221721
          mmTop = 4233
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'RECEBIMENTOS'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 239184
          mmTop = 4233
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 222
    Top = 80
    object pplppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'SEGMENTO'
      FieldName = 'SEGMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOINICIAL'
      FieldName = 'SALDOINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORR_INAD'
      FieldName = 'CORR_INAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUROS_INAD'
      FieldName = 'JUROS_INAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MULTA_INAD'
      FieldName = 'MULTA_INAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESIDUO'
      FieldName = 'RESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUROS_MES'
      FieldName = 'JUROS_MES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORRRESID_MES'
      FieldName = 'CORRRESID_MES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORRSALDO_MES'
      FieldName = 'CORRSALDO_MES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEBIMENTOS'
      FieldName = 'RECEBIMENTOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOFINAL'
      FieldName = 'SALDOFINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object cdsParc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 144
  end
  object dsParc: TDataSource
    DataSet = cdsParc
    Left = 80
    Top = 144
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '   SELECT PF.IDPARCFINANCIMOV,'
      '         PF.IDCONDPAGIMOVEL,'
      '         PF.CODDOCUMENTO,'
      '          CP.IDCONTRATOIMOVEL,'
      '          CI.CONNUMERO,'
      '          CI.CONNOME,'
      '          IM.SEGMENTO,'
      '          '#39'                       '#39' AS CAL_TIPO,'
      '          (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '          P.RAZAOSOCIAL,'
      
        '          DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ' +
        #39'/'#39' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '          DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIM' +
        'ENTO) AS DATAVENCIMENTO,'
      
        '          DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTA' +
        'CAO) AS VLRPRESTACAO,'
      '          PF.DATALIMITE,'
      '          PF.FLGTIPOLANC,'
      '          PF.FLGLANCINTEGRA,'
      '          PP.DATAPAGAMENTO,'
      '          ALT.TOT_ALTERADOR,'
      '          ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO,'
      '          PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF,'
      ''
      '          CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,'
      '          MA.VLRMULTAATRASO AS VLRMULTAATRASO,'
      '          JA.VLRMORAATRASO AS VLRMORAATRASO,'
      ''
      '          CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,   '
      '          MS.VLRMULTASALDO    AS VLRMULTACORRIG,   '
      '          JS.VLRMORASALDO AS VLRJUROSCORRIG,   '
      ''
      
        '          NVL(CMA.VLRCORRIGIDOATRASO,0) + NVL(CMS.VLRCORRIGIDOSA' +
        'LDO,0) AS TOT_CORRECAO, '
      
        '          NVL(MA.VLRMULTAATRASO,0) + NVL(MS.VLRMULTASALDO,0)   A' +
        'S TOT_MULTA,   '
      
        '          NVL(JA.VLRMORAATRASO,0) + NVL(JS.VLRMORASALDO,0) AS TO' +
        'T_JUROS,   '
      ''
      '             '
      '          NVL(PF.VLRPRESTACAO,0) +'
      '          NVL(CMA.VLRCORRIGIDOATRASO, 0 ) +'
      '          NVL(MA.VLRMULTAATRASO, 0 ) +'
      '          NVL(JA.VLRMORAATRASO, 0 ) +'
      '          NVL(CMS.VLRCORRIGIDOSALDO,0) +'
      '          NVL(MS.VLRMULTASALDO,0) +'
      '          NVL(JS.VLRMORASALDO,0) +'
      '          NVL(ALT.TOT_ALTERADOR,0) AS VLRDEVIDO,'
      ''
      '          NVL(PF.VLRPRESTACAO,0) +'
      '          NVL(CMA.VLRCORRIGIDOATRASO, 0 ) +'
      '          NVL(MA.VLRMULTAATRASO, 0 ) +'
      '          NVL(JA.VLRMORAATRASO, 0 ) -'
      '          NVL(PP.VLRPAGO, 0 ) +'
      '          NVL(CMS.VLRCORRIGIDOSALDO,0) +'
      '          NVL(MS.VLRMULTASALDO,0) +'
      '          NVL(JS.VLRMORASALDO,0) +'
      '          NVL(ALT.TOT_ALTERADOR,0) AS VLRDIF'
      '          '
      '               '
      '     FROM PARCFINANCIMOV PF,  '
      '          CONDPAGIMOVEL  CP,  '
      '          CONTRATOIMOVEL CI,  '
      '          PESSOA P,           '
      '                  ( SELECT /*+ INDEX(D) INDEX(LD)*/           '
      '                           LD.CODDOCUMENTO, T.CODTIPIMOVEL,   '
      
        '                           SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, ' +
        '(LD.VALOR * -1)) ) AS TOT_ALTERADOR '
      
        '                      FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALI' +
        'ENACAO PA,          '
      
        '                           PARCFINANCIMOV P, CONDPAGIMOVEL C,  T' +
        'IPOIMOVEL T,        '
      
        '                           ( SELECT DISTINCT C.IDCONTRATOIMOVEL,' +
        ' I.CODTIPIMOVEL     '
      
        '                               FROM CONTRATOIMOVEL C, CONTRATOXI' +
        'MOVEL CXI, IMOVEL I '
      
        '                              WHERE CXI.IDIMOVEL = I.IDIMOVEL   ' +
        '                    '
      
        '                                AND CXI.IDCONTRATOIMOVEL = C.IDC' +
        'ONTRATOIMOVEL       '
      
        '                                AND C.FLGTIPOCONTRATO = '#39'C'#39' ) TC' +
        '                  '
      '                     WHERE RTRIM(LD.OPERACAO) = '#39'4'#39' '
      '                       AND LD.CODALTERADOR <> 215'
      '                       AND LD.CODALTERADOR <> 216'
      '                       AND PA.IDPESSOA = 1'
      '                       AND LD.CODDOCUMENTO = D.CODDOCUMENTO '
      '                       AND D.CODDOCUMENTO = P.CODDOCUMENTO  '
      
        '                       AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL' +
        ' '
      
        '                       AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMO' +
        'VEL '
      
        '                       AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL     ' +
        '    '
      '                       AND LD.DATALANCTO <= '#39'31/08/2005'#39
      
        '                       AND ( PA.IDOPERATUALCM IS NULL OR        ' +
        '      '
      
        '                             ( LD.CODALTERADOR <> T.CODALTCMAL A' +
        'ND    '
      
        '                               LD.CODALTERADOR <> T.CODALTJRAL A' +
        'ND    '
      
        '                               LD.CODALTERADOR <> T.CODALTMTAL )' +
        ' )    '
      
        '                       AND D.IDMODULO = 135                     ' +
        '      '
      
        '                     GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )' +
        '  ALT,'
      ''
      ''
      '          (  '
      '            SELECT /*+ INDEX(LD) INDEX(RP)*/    '
      '                   IDPARCFINANCIMOV,  '
      
        '                   DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAME' +
        'NTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO,  '
      
        '                   DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), ' +
        'SUM(LD.VALOR) ) AS VLRPAGO  '
      
        '              FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO' +
        ' RP  '
      '             WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)  '
      '               AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)  '
      '               AND LD.NUMLANCTO    = RP.NUMLANCTO(+)     '
      
        '               AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENT' +
        'O <= '#39'31/08/2005'#39' ) OR  '
      
        '                    (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.O' +
        'PERACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 )  '
      
        '                                                AND LD.ESTORNO I' +
        'S NULL             '
      
        '                                                AND LD.DATALANCT' +
        'O <= '#39'31/08/2005'#39' ) )  '
      
        '             GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO          ' +
        '                   '
      '          ) PP,  '
      ''
      '          ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,  '
      '                   A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                   A.DATAINI,                         '
      '                   A.IDCONDPAGIMOVEL                  '
      '              FROM CONDPAGIMOVEL A,                   '
      '                   (SELECT IDCONDINICIAL,             '
      '                           MAX(DATAINI) AS DATAINI    '
      '                      FROM CONDPAGIMOVEL              '
      '                     GROUP BY IDCONDINICIAL) B        '
      '             WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '               AND B.DATAINI       = A.DATAINI ) CPFINAL,    '
      ''
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMULT' +
        'AATRASO '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '        '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '        '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2       '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALMULT' +
        'A)      '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39') ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NOT NULL  '
      '               AND P.IDPESSOA  = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) MA,                                         '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMORA' +
        'ATRASO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALJURO' +
        'S)    '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39' ) ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NOT NULL  '
      '               AND P.IDPESSOA = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) JA,                                          '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRCORR' +
        'IGIDOATRASO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALCM) ' +
        '   '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39') ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NOT NULL  '
      '               AND P.IDPESSOA = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALCM )     '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) CMA,                                          '
      ''
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMULT' +
        'ASALDO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '        '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '        '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2       '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALMULT' +
        'A)      '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39')  ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NULL  '
      '               AND P.IDPESSOA = 1   '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) MS,                                         '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMORA' +
        'SALDO '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1   '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALJURO' +
        'S)    '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39')  ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NULL  '
      '               AND P.IDPESSOA = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) JS,                                          '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRCORR' +
        'IGIDOSALDO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALCM) ' +
        '   '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39')  ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NULL  '
      '               AND P.IDPESSOA = 1   '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALCM )     '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) CMS,                                          '
      '          ( SELECT DISTINCT                                  '
      '                   CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,  '
      '                   M.IMONOME   AS NOMEMESTRE,                '
      '                   M.IDIMOVEL  AS IDIMOVELMESTRE,            '
      '                   C.UF        AS UF,    '
      '                   I.CODTIPIMOVEL       AS SEGMENTO           '
      '              FROM CONTRATOXIMOVEL CXI,  '
      '                   IMOVEL I,  '
      '                   IMOVEL M,  '
      '                   CIDADES C  '
      '             WHERE CXI.IDIMOVEL = I.IDIMOVEL              '
      '              AND  M.IDCIDADES = C.IDCIDADES(+)           '
      '              AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM     '
      '     WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))          '
      '       AND (NVL(PF.FLGCONCILIADO,'#39'N'#39') = '#39'N'#39')          '
      '       AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '
      '       AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '
      '       AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '
      '       AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)  '
      '       AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))  '
      '       AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)        '
      '       AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '
      '       AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '
      '       AND ( CI.IDCONTRATOIMOVEL = 2181) '
      ''
      
        '     ORDER BY IM.SEGMENTO, CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DAT' +
        'AVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA '
      ''
      ' ')
    ClientDataSet = cdsParc
    Left = 212
    Top = 144
  end
  object cdsDadosParcela: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 24
  end
  object cdsDadosInadimp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 136
  end
end
