inherited dtmRelVacancia: TdtmRelVacancia
  Left = 456
  Top = 178
  Height = 150
  Caption = 'dtmRelVacancia'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'iMes'
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
        Name = 'iMes'
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
        Caption = 'iAno'
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
        Name = 'iAno'
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
        Caption = 'CodTipImovel'
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
        Name = 'CodTipImovel'
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
        Name = 'iCorLinha'
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
    Report = ppVacancia
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    FieldDefs = <
      item
        Name = 'IDIMOVELMESTRE'
        DataType = ftFloat
      end
      item
        Name = 'IMOCODIGO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IMONOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'AREATOTAL'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA'
        DataType = ftFloat
      end
      item
        Name = 'AREAOCUPADA'
        DataType = ftFloat
      end
      item
        Name = 'VLRTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'VLROCUPADO'
        DataType = ftFloat
      end
      item
        Name = 'VLRVAGO'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'NOME'
        Fields = 'IMONOME'
      end
      item
        Name = 'TOTAL'
        Fields = 'VLRTOTAL'
        Options = [ixDescending]
      end>
    IndexName = 'NOME'
    StoreDefs = True
    Data = {
      BF0300009619E0BD01000000180000000A00090000000300000010010E494449
      4D4F56454C4D4553545245080004000000000009494D4F434F4449474F010049
      0000000100055749445448020002000F0007494D4F4E4F4D4501004900000001
      00055749445448020002003C000941524541544F54414C080004000000000008
      415245415641474108000400000000000B415245414F43555041444108000400
      0000000008564C52544F54414C08000400000000000A564C524F43555041444F
      080004000000000007564C525641474F08000400000000000C50455243564143
      414E434941080004000000000002000D44454641554C545F4F52444552020082
      00010000000300044C4349440400010009080000000001050000000000A06740
      054142502D441E416D657269636120427573696E657373205061726B202D2044
      616C6C617300000000001DBF4000000000001DBF40AE47E1B65E187141AE47E1
      B65E18714100000105000000000080674007414250202D204D1D416D65726963
      6120427573696E657373205061726B202D204D69616D69000000008075C44000
      0000008075C440AE47E16A6E757641AE47E16A6E757641000001050000000000
      003440044345434E1E43656E74726F20456D70726573617269616C2043696461
      6465204E6F766100000000E019ED4000000000E019ED40EC51B87C90219841EC
      51B87C90219841000001050000000000003F400343454D1B43656E74726F2045
      6D70726573617269616C204D6F75726973636F0000000000F0B6400000000000
      F0B640D7A370A1F4307041D7A370A1F4307041000001050000000000003D4003
      45424D1645646966ED63696F20426172E36F206465204D6175E100000000807A
      E04000000000807AE040333333B3EAE28341333333B3EAE28341000001050000
      000000003E400343414E1D45646966ED63696F2043616E64656CE17269612043
      6F72706F726174650000000000C2C0400000000000C2C0409A999949BDDC6E41
      9A999949BDDC6E410004010500000000000040401648697065726D6572636164
      6F204361727265666F757200000000005FDB4000000000005FDB40000000605A
      655C41000000605A655C41000001050000000000804040035344521053686F70
      70696E672044656C20526579000000000024F140000000000024F1408FC2F5F8
      65697F418FC2F5F865697F4100040000000000000000414012576F726C642054
      726164652043656E7465720000000098D800410000000000C8A7400000000078
      790041295C8FDE2D63704185EB51E0A4067041F6285C8F3F221741AE47E17A14
      AE0140}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT VM.IDIMOVELMESTRE,'
      '       VM.IMOCODIGO,'
      '       VM.IMONOME,'
      '       VM.AREATOTAL,'
      '       AV.AREAVAGA,       '
      '       NVL(VM.AREATOTAL,0) - NVL(AV.AREAVAGA,0) AS AREAOCUPADA,'
      '       VM.VLRCONTABIL AS VLRTOTAL,'
      
        '       VM.VLRCONTABIL - ROUND( (VM.VLRCONTABIL/VM.AREATOTAL) * N' +
        'VL(AV.AREAVAGA,0),2) AS VLROCUPADO,'
      
        '       ROUND( (VM.VLRCONTABIL/VM.AREATOTAL) * AV.AREAVAGA,2) AS ' +
        'VLRVAGO,'
      
        '       ROUND( ((VM.VLRCONTABIL/VM.AREATOTAL) * AV.AREAVAGA * 100' +
        ') / VM.VLRCONTABIL, 2) AS PERCVACANCIA'
      ''
      '  FROM (  /* Valor total por imóvel mestre */'
      '        SELECT I.IDIMOVELMESTRE, IM.IMOCODIGO, IM.IMONOME,'
      '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL,'
      
        '               SUM( (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDE' +
        'P + SB.REAVVALORG +'
      
        '                     SB.REAVCMBEM - SB.REAVDEPLANC - SB.REAVCMDE' +
        'P + SB.ULTREAVVALORG +'
      
        '                     SB.ULTREAVCMBEM - SB.ULTREAVDEPLANC - SB.UL' +
        'TREAVCMDEP)  )  AS VLRCONTABIL'
      
        '          FROM IMOVEL I, IMOVEL IM, IMOVELXBEM IXB, BEM B, GRUPO' +
        ' G,'
      '               (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      
        '                       SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAV' +
        'VALORG,'
      
        '                       SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAV' +
        'CMBEM,'
      
        '                       SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAV' +
        'DEPLANC,'
      
        '                       SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAV' +
        'CMDEP'
      '                  FROM SALDOCONTABBEM SCB,'
      '                       ( SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '                           FROM SALDOCONTABBEM'
      
        '                          WHERE (DATASLDBEM <= TO_DATE('#39'31/08/20' +
        '04'#39','#39'DD/MM/YYYY'#39'))'
      '                          GROUP BY IDBEM) DTAMAX'
      '                 WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '                   AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB'
      
        '         WHERE (B.DATAINICIODEP <= TO_DATE('#39'31/08/2004'#39','#39'DD/MM/Y' +
        'YYY'#39'))'
      '           AND (G.FLGIMOVEL = 1)'
      
        '           AND (ABS(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.' +
        'DEPLANC,0) - NVL(SB.CMDEP,0) +'
      
        '                NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) - NVL' +
        '(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0)' +
        ' - NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,0)) >= 0.01)'
      '           AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '           AND (I.IDIMOVEL = IXB.IDIMOVEL)'
      '           AND (IXB.IDBEM = B.IDBEM)'
      '           AND (IXB.IDPESSOA = B.IDPESSOA)'
      '           AND (B.IDGRUPO = G.IDGRUPO)'
      '           AND (IXB.IDBEM = SB.IDBEM)'
      '         GROUP BY I.IDIMOVELMESTRE, IM.IMOCODIGO, IM.IMONOME'
      '       ) VM,'
      ''
      '       ( /* Area vaga de Participações - Indicadores */'
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,'
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA'
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM'
      '         WHERE A.IDINDICADOR = I.IDINDICADOR'
      '           AND A.IDIMOVEL    = IM.IDIMOVEL'
      '           AND A.TIPOLANCA      = '#39'R'#39
      '           AND I.TIPOINDICADOR  = 23  /* Area Vaga - Vacância */'
      '           AND A.MESCOMPETENCIA = 1'
      '           AND A.ANOCOMPETENCIA = 2003'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)'
      '        ) AV'
      ''
      ' WHERE VM.IDIMOVELMESTRE = AV.IDIMOVELMESTRE(+)'
      ' ORDER BY IMONOME')
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 184
    Top = 64
    object pplppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
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
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREATOTAL'
      FieldName = 'AREATOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA'
      FieldName = 'AREAVAGA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAOCUPADA'
      FieldName = 'AREAOCUPADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTOTAL'
      FieldName = 'VLRTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROCUPADO'
      FieldName = 'VLROCUPADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVAGO'
      FieldName = 'VLRVAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA'
      FieldName = 'PERCVACANCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object ppVacancia: TppReport
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
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 89165
        mmTop = 24871
        mmWidth = 50536
        BandType = 0
      end
      object ppOrcamentoLabel2: TppLabel
        UserName = 'OrcamentoLabel2'
        AutoSize = False
        Caption = 'Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3440
        mmLeft = 108744
        mmTop = 23283
        mmWidth = 11113
        BandType = 0
      end
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
        mmWidth = 284428
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Vacância por Empreendimento'
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
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Competência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17992
        mmWidth = 26723
        BandType = 0
      end
      object ppOrcamentoLine1: TppLine
        UserName = 'OrcamentoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 22490
        mmWidth = 284300
        BandType = 0
      end
      object ppOrcamentoLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 31485
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22490
        mmTop = 25665
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Ocupada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 89165
        mmTop = 27252
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 229659
        mmTop = 23813
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'de Vacância'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 229659
        mmTop = 27252
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 25665
        mmWidth = 9790
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
      object pplCompetencia: TppLabel
        UserName = 'lCompetencia'
        AutoSize = False
        Caption = 'Janeiro / 2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 17992
        mmWidth = 55563
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Vaga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 106363
        mmTop = 27252
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 123825
        mmTop = 27252
        mmWidth = 15081
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 149754
        mmTop = 24871
        mmWidth = 72761
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Valor Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3440
        mmLeft = 175419
        mmTop = 23283
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Ocupado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 154517
        mmTop = 26988
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Vago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 180711
        mmTop = 26988
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 207169
        mmTop = 26988
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IMONOME'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 22490
        mmTop = 265
        mmWidth = 57415
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'AREAOCUPADA'
        DataPipeline = ppl
        DisplayFormat = '#,0.##;-#,0.##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 88106
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLROCUPADO'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 144727
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IMOCODIGO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'AREAVAGA'
        DataPipeline = ppl
        DisplayFormat = '#,0.##;-#,0.##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AREATOTAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.##;-#,0.##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLRVAGO'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRTOTAL'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 197380
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PERCVACANCIA'
        DataPipeline = ppl
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 230982
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
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
        mmWidth = 283105
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
        mmLeft = 529
        mmTop = 2910
        mmWidth = 283898
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
        mmLeft = 256911
        mmTop = 3175
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
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppl'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
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
          Left = 216
          Top = 56
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppl'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 110596
            mmPrintPosition = 0
            object ppTeeChart1: TppTeeChart
              UserName = 'TeeChart1'
              mmHeight = 98954
              mmLeft = 0
              mmTop = 3440
              mmWidth = 282576
              BandType = 1
              object ppTeeChartControl1: TppTeeChartControl
                Left = 0
                Top = 0
                Width = 400
                Height = 250
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -13
                Title.Font.Name = 'Arial'
                Title.Font.Style = [fsBold]
                Title.Text.Strings = (
                  'Demonstrativo de Vacância')
                BackColor = clWhite
                BottomAxis.LabelsSize = 8
                BottomAxis.LabelStyle = talText
                BottomAxis.TitleSize = 8
                LeftAxis.TitleSize = 8
                Legend.Alignment = laBottom
                Legend.TopPos = 0
                RightAxis.AxisValuesFormat = '#,##0.#'
                BevelOuter = bvNone
                Color = clWhite
                object BarSeries2: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = True
                  SeriesColor = clBlue
                  Title = 'ValorVago'
                  ValueFormat = '#,###.#'
                  BarStyle = bsRectGradient
                  MultiBar = mbStacked
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                end
                object BarSeries1: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = True
                  SeriesColor = clRed
                  Title = 'ValorTotal'
                  ValueFormat = '#,###.#'
                  BarStyle = bsRectGradient
                  MultiBar = mbStacked
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                end
              end
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 1323
              mmWidth = 284300
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
  end
end
