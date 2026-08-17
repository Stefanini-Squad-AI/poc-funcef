inherited dtmRelSaldoImovel: TdtmRelSaldoImovel
  Left = 325
  Top = 234
  Caption = 'dtmRelSaldoImovel'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'idMestre'
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
        Caption = 'idImovel'
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
        Caption = 'dDataBase'
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
        Caption = 'iCorLinha'
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
    Report = ppSaldoImovel
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      190100009619E0BD01000000180000000800000000000300000019010B4E4F4D
      455F4D45535452450100490000000100055749445448020002003C0009494D4F
      434F4449474F0100490000000100055749445448020002000F000B4E4F4D455F
      494D4F56454C0100490000000100055749445448020002003C000E494D4F5645
      4C5F455854454E534F0100490000000100055749445448020002007B00064445
      5342454D010049000000010005574944544802000200C800084944494D4F5645
      4C08000400000000000E4944494D4F56454C4D45535452450800040000000000
      0953554D56414C435442080004000000000002000D44454641554C545F4F5244
      45520200820003000000040006000500044C4349440400010009080000}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      
        'SELECT VW.NOME_MESTRE, VW.IMOCODIGO,  VW.NOME_IMOVEL,      VW.IM' +
        'OVEL_EXTENSO,'
      
        '       VW.DESBEM,      VW.IDIMOVEL,   VW.IDIMOVELMESTRE,   VWT.S' +
        'UMVALCTB'
      'FROM'
      '   VWBEMXIMOVEL VW,'
      '   ('
      '   SELECT'
      '      SCB.IDBEM,          SCB.DATASLDBEM,    SCB.VALORG,       '
      '      SCB.CMBEM,          SCB.DEPLANC,       SCB.CMDEP,        '
      '      SCB.REAVVALORG,     SCB.REAVCMBEM,     SCB.REAVDEPLANC,  '
      '      SCB.REAVCMDEP,      SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM, '
      '      SCB.ULTREAVDEPLANC, SCB.ULTREAVCMDEP,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +     '
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -     '
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM - '
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +              '
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM   '
      '      ) AS SUMVALCTBIMOB'
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB, '
      '      ('
      '      SELECT'
      '         IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM'
      '         SALDOCONTABBEM'
      '      WHERE'
      '         1=2 --( DATASLDBEM <= -1)'
      '      GROUP BY'
      '         IDBEM '
      '      ) DTAMAX'
      '  WHERE'
      '      1=2'
      '      AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      '   ) VWT'
      'WHERE'
      '     1 = 2 AND'
      '     ( VW.IDBEM = VWT.IDBEM )'
      ''
      'ORDER BY VW.IMOVEL_EXTENSO, VW.IDIMOVEL, VW.DESBEM')
    ClientDataSet = nil
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 184
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'NOME_IMOVEL'
      FieldName = 'NOME_IMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'IMOVEL_EXTENSO'
      FieldName = 'IMOVEL_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALCTB'
      FieldName = 'SUMVALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object ppSaldoImovel: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 261
    Top = 64
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
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
        mmTop = 1852
        mmWidth = 197380
        BandType = 0
      end
      object lblTitulo: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Saldo Contábil de Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLine1: TppLine
        UserName = 'OrcamentoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 17198
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18256
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Valor Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 174096
        mmTop = 18256
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 18256
        mmWidth = 10583
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 23018
        mmWidth = 197300
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
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
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object pptImovel: TppDBText
        UserName = 'tImovel'
        DataField = 'IMOCODIGO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 265
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SUMVALCTB'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173832
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESBEM'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 265
        mmWidth = 134938
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
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
        mmTop = 2910
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
        mmTop = 2910
        mmWidth = 196850
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
        mmLeft = 170657
        mmTop = 2910
        mmWidth = 26194
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Saldo Total da Carteira Imobiliária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2910
        mmWidth = 50271
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SUMVALCTB'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 154252
        mmTop = 2910
        mmWidth = 41275
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 7408
        mmWidth = 197300
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDIMOVELMESTRE'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME_MESTRE'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 54769
          BandType = 3
          GroupNo = 0
        end
      end
      object gfbMestre: TppGroupFooterBand
        BeforePrint = gfbMestreBeforePrint
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'SUMVALCTB'
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
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 4498
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 1852
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 9260
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Saldo do Imóvel Mestre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4498
          mmWidth = 46831
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDIMOVEL'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object gfbImovel: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppsCorPrint
          UserName = 'sCor1'
          Brush.Color = clLime
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          StretchWithParent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SUMVALCTB'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 265
          mmWidth = 30163
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365064070726F6365647572652056
        61726961626C65733B0D0A7661720D0A20202073496D6F76656C203A20537472
        696E673B0D0A626567696E0D0A0D0A656E643B0D0A0001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D650613676662496D6F76656C41
        667465725072696E740B50726F6772616D54797065070B747450726F63656475
        726506536F75726365063F70726F63656475726520676662496D6F76656C4166
        7465725072696E743B0D0A626567696E0D0A202073496D6F76656C203A3D2027
        273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609676662496D6F
        76656C094576656E744E616D65060A41667465725072696E74074576656E7449
        4402170001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65061144657461696C4265666F72655072696E740B50726F6772616D547970
        65070B747450726F63656475726506536F75726365069B70726F636564757265
        2044657461696C4265666F72655072696E743B0D0A626567696E0D0A20206966
        2070706C5B27494D4F56454C5F455854454E534F275D203D2073496D6F76656C
        207468656E0D0A2020202020202074496D6F76656C2E56697369626C65203A3D
        2046616C73650D0A2020656C73652074496D6F76656C2E56697369626C65203A
        3D20547275653B2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060644657461696C094576656E744E616D65060B4265666F72655072696E7407
        4576656E74494402180001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65061044657461696C41667465725072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F75726365064F70726F63
        65647572652044657461696C41667465725072696E743B0D0A626567696E0D0A
        202073496D6F76656C203A3D2070706C5B27494D4F56454C5F455854454E534F
        275D3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506064465746169
        6C094576656E744E616D65060A41667465725072696E74074576656E74494402
        170001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        061B47726F757048656164657242616E64314265666F72655072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365064770
        726F6365647572652047726F757048656164657242616E64314265666F726550
        72696E743B0D0A626567696E0D0A202073496D6F76656C203A3D2027273B0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65061047726F75704865616465
        7242616E6431094576656E744E616D65060B4265666F72655072696E74074576
        656E74494402180000}
    end
  end
end
