inherited dtmRelAbono: TdtmRelAbono
  Left = 300
  Top = 208
  Width = 327
  Height = 165
  Caption = 'dtmRelAbono'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
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
        Caption = 'idGrpApuracao'
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
        Caption = 'dtIni'
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
        TextDefault = 'dtIni'
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
        Caption = 'dtFim'
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
    Report = ppAbono
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      970700009619E0BD01000000180000000E000B00000003000000C3010944545F
      494E4943494F01004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A000A44545F5445524D494E4F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000A0007494D4F4E4F4D45010049000000010005574944544802
      0002003C00094453435F475255504F0100490000000100055749445448020002
      003C00054C4F4A415301004900000001000557494454480200020014000B4E4F
      4D434F4E545241544F0100490000000100055749445448020002003C000E4D45
      53434F4D504554454E43494108000400000000000E414E4F434F4D504554454E
      43494108000400000000000A4441545F56454E43544F08000800000000000944
      41545F504147544F08000800000000000C564C525F464154555241444F080004
      000000000006564C525F434D080004000000000009564C525F4D554C54410800
      04000000000009564C525F504147544F080004000000000002000D4445464155
      4C545F4F52444552020082000500000003000400060008000700044C43494404
      0001000908000000000000000A30312F30312F323030320A33312F30312F3230
      30320E4E6F7274652053686F7070696E6708414C554755C9495303322F331743
      414958412045434F4E4F4D494341204645444552414C00000000000028400000
      000000449F400000F0CFD5B6CC420000D6AFE2B6CC42E17A14AE47B2B140F628
      5C8FC2F500403E0AD7A370E17C40E17A14AE47B2B14000000000000A30312F30
      312F323030320A33312F30312F323030320E4E6F7274652053686F7070696E67
      08414C554755C9495301350E4341534120444F204D555349434F000000000000
      28400000000000449F400000F0CFD5B6CC420000D6AFE2B6CC42000000008083
      A54085EB51B81E85EB3FEC51B81E857F7140000000008083A54000000000000A
      30312F30312F323030320A33312F30312F323030320E4E6F7274652053686F70
      70696E6708414C554755C94953013406454E4C41434500000000000026400000
      000000449F4000008C9088B6CC420000727095B6CC42713D0AD723EAA240295C
      8FC2F528F83FB91E85EB51F86E40713D0AD723EAA24000000000000A30312F30
      312F323030320A33312F30312F323030320E4E6F7274652053686F7070696E67
      08414C554755C94953013406454E4C4143450000000000002840000000000044
      9F400000F0CFD5B6CC420000D6AFE2B6CC42B81E85EB51929140F6285C8FC2F5
      E03F85EB51B81E955C40B81E85EB5192914000000000000A30312F30312F3230
      30320A33312F30312F323030320E4E6F7274652053686F7070696E6708414C55
      4755C9495303313031104C4F4A415320414D45524943414E4153000000000000
      28400000000000449F400000F0CFD5B6CC420000D6AFE2B6CC423E0AD7A3B0BF
      C940713D0AD7A37010400AD7A3703DF194403E0AD7A3B0BFC94000000000000A
      30312F30312F323030320A33312F30312F323030320E4E6F7274652053686F70
      70696E6708454E434152474F5303322F331743414958412045434F4E4F4D4943
      41204645444552414C00000000000028400000000000449F400000F0CFD5B6CC
      420000D6AFE2B6CC423333333333CAA440D7A3703D0AD7F33F7B14AE47E1F670
      403333333333CAA44000000000000A30312F30312F323030320A33312F30312F
      323030320E4E6F7274652053686F7070696E6708454E434152474F5301340645
      4E4C41434500000000000028400000000000449F400000F0CFD5B6CC420000D6
      AFE2B6CC4267666666669C9240AE47E17A14AEE73F295C8FC2F5785E40676666
      66669C924000000000000A30312F30312F323030320A33312F30312F32303032
      0E4E6F7274652053686F7070696E6708454E434152474F5303313031104C4F4A
      415320414D45524943414E415300000000000028400000000000449F400000F0
      CFD5B6CC420000D6AFE2B6CC4215AE47E17AE87C40EC51B81E85EBC13FC3F528
      5C8F82474015AE47E17AE87C4000000000000A30312F30312F323030320A3331
      2F30312F323030320E4E6F7274652053686F7070696E671146554E444F204445
      2050524F4D4FC7C34F03322F331743414958412045434F4E4F4D494341204645
      444552414C00000000000028400000000000449F400000F0CFD5B6CC420000D6
      AFE2B6CC42E17A14AE47B29140F6285C8FC2F5E03F52B81E85EBE15C40E17A14
      AE47B2914000000000000A30312F30312F323030320A33312F30312F32303032
      0E4E6F7274652053686F7070696E671146554E444F2044452050524F4D4FC7C3
      4F013406454E4C41434500000000000028400000000000449F400000F0CFD5B6
      CC420000D6AFE2B6CC425C8FC2F528EA824052B81E85EB51D83FB91E85EB51F8
      4E405C8FC2F528EA824000000000000A30312F30312F323030320A33312F3031
      2F323030320E4E6F7274652053686F7070696E671146554E444F204445205052
      4F4D4FC7C34F03313031104C4F4A415320414D45524943414E41530000000000
      0028400000000000449F400000F0CFD5B6CC420000D6AFE2B6CC4233333333B3
      BFA9407B14AE47E17AF03FE17A14AE47F1744033333333B3BFA940}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      '/* SELECT ABONOS */'
      ''
      'SELECT '#39'01/01/2002'#39' AS DT_INICIO,'
      '       '#39'31/01/2002'#39' AS DT_TERMINO,'
      '       IM.IMONOME,'
      '       GA.DESCRICAO AS DSC_GRUPO,'
      '       CL.LOJAS,'
      '       CL.NOMCONTRATO,'
      '       GI.MESCOMPETENCIA,'
      '       GI.ANOCOMPETENCIA,'
      '       APDTVEN.VLRAPURACAODAT AS DAT_VENCTO,'
      '       APDTPGT.VLRAPURACAODAT AS DAT_PAGTO,'
      '       NVL(APFAT.VLRAPURACAONUM,0) AS VLR_FATURADO,'
      '       NVL(APCM.VLRAPURACAONUM ,0) AS VLR_CM,'
      '       NVL(APMJ.VLRAPURACAONUM ,0) AS VLR_MULTA,'
      '       NVL(APPAG.VLRAPURACAONUM,0) AS VLR_PAGTO'
      '  FROM IMOVEL IM,'
      '       INDCONTRATOLOJA CL,'
      '       INDGRPAPURACAO GA,'
      '      ('
      
        '       SELECT DISTINCT AP.IDIMOVEL, AP.IDGRPAPURACAO, AP.IDCONTR' +
        'ATO,'
      '                       AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA'
      '         FROM INDGRPINDICADOR GI,'
      '              INDAPURACAO AP'
      '        WHERE GI.IDSUBTIPO = 8'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '          AND GI.IDINDICADOR = AP.IDINDICADOR'
      '      ) GI,'
      '      ('
      
        '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENC' +
        'IA, IDGRPAPURACAO, VLRAPURACAODAT'
      '         FROM INDAPURACAO AP'
      
        '        WHERE AP.IDINDICADOR = 23             /* Data de Vencime' +
        'nto */'
      '          AND AP.IDIMOVEL    = 1227'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '       ) APDTVEN,'
      '      ('
      
        '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENC' +
        'IA, IDGRPAPURACAO, VLRAPURACAODAT'
      '         FROM INDAPURACAO AP'
      
        '        WHERE AP.IDINDICADOR = 24             /* Data de Pagamen' +
        'to */'
      '          AND AP.IDIMOVEL    = 1227'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '       ) APDTPGT,'
      '      ('
      
        '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENC' +
        'IA, IDGRPAPURACAO, VLRAPURACAONUM'
      '         FROM INDAPURACAO AP'
      
        '        WHERE AP.IDINDICADOR = 25             /* Valor Faturado ' +
        '*/'
      '          AND AP.IDIMOVEL = 1227'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '       ) APFAT,'
      '      ('
      
        '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENC' +
        'IA, IDGRPAPURACAO, VLRAPURACAONUM'
      '         FROM INDAPURACAO AP'
      
        '        WHERE AP.IDINDICADOR = 26             /* Correção Monetá' +
        'ria */'
      '          AND AP.IDIMOVEL    = 1227'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '       ) APCM,'
      '      ('
      
        '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENC' +
        'IA, IDGRPAPURACAO, VLRAPURACAONUM'
      '         FROM INDAPURACAO AP'
      
        '        WHERE AP.IDINDICADOR = 27             /* Multa e Juros *' +
        '/'
      '          AND AP.IDIMOVEL    = 1227'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '       ) APMJ,'
      '      ('
      
        '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENC' +
        'IA, IDGRPAPURACAO, VLRAPURACAONUM'
      '         FROM INDAPURACAO AP'
      '        WHERE AP.IDINDICADOR = 28             /* Valor Pago */'
      '          AND AP.IDIMOVEL    = 1227'
      '          AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2002'#39')'
      '          AND AP.DATAAPURACAO <= TO_DATE('#39'31/01/2002'#39')'
      '       ) APPAG'
      ''
      ' WHERE GI.IDIMOVEL       = IM.IDIMOVEL'
      '   AND GI.IDCONTRATO     = CL.IDCONTRATO'
      '   AND GI.IDGRPAPURACAO  = GA.IDGRPAPURACAO'
      '   AND GI.IDIMOVEL       = APDTVEN.IDIMOVEL(+)'
      '   AND GI.IDGRPAPURACAO  = APDTVEN.IDGRPAPURACAO(+)'
      '   AND GI.IDCONTRATO     = APDTVEN.IDCONTRATO(+)'
      '   AND GI.MESCOMPETENCIA = APDTVEN.MESCOMPETENCIA(+)'
      '   AND GI.ANOCOMPETENCIA = APDTVEN.ANOCOMPETENCIA(+)'
      '   AND GI.IDIMOVEL       = APDTPGT.IDIMOVEL(+)'
      '   AND GI.IDGRPAPURACAO  = APDTPGT.IDGRPAPURACAO(+)'
      '   AND GI.IDCONTRATO     = APDTPGT.IDCONTRATO(+)'
      '   AND GI.MESCOMPETENCIA = APDTPGT.MESCOMPETENCIA(+)'
      '   AND GI.ANOCOMPETENCIA = APDTPGT.ANOCOMPETENCIA(+)'
      '   AND GI.IDIMOVEL       = APFAT.IDIMOVEL(+)'
      '   AND GI.IDGRPAPURACAO  = APFAT.IDGRPAPURACAO(+)'
      '   AND GI.IDCONTRATO     = APFAT.IDCONTRATO(+)'
      '   AND GI.MESCOMPETENCIA = APFAT.MESCOMPETENCIA(+)'
      '   AND GI.ANOCOMPETENCIA = APFAT.ANOCOMPETENCIA(+)'
      '   AND GI.IDIMOVEL       = APCM.IDIMOVEL(+)'
      '   AND GI.IDGRPAPURACAO  = APCM.IDGRPAPURACAO(+)'
      '   AND GI.IDCONTRATO     = APCM.IDCONTRATO(+)'
      '   AND GI.MESCOMPETENCIA = APCM.MESCOMPETENCIA(+)'
      '   AND GI.ANOCOMPETENCIA = APCM.ANOCOMPETENCIA(+)'
      '   AND GI.IDIMOVEL       = APMJ.IDIMOVEL(+)'
      '   AND GI.IDGRPAPURACAO  = APMJ.IDGRPAPURACAO(+)'
      '   AND GI.IDCONTRATO     = APMJ.IDCONTRATO(+)'
      '   AND GI.MESCOMPETENCIA = APMJ.MESCOMPETENCIA(+)'
      '   AND GI.ANOCOMPETENCIA = APMJ.ANOCOMPETENCIA(+)'
      '   AND GI.IDIMOVEL       = APPAG.IDIMOVEL(+)'
      '   AND GI.IDGRPAPURACAO  = APPAG.IDGRPAPURACAO(+)'
      '   AND GI.IDCONTRATO     = APPAG.IDCONTRATO(+)'
      '   AND GI.MESCOMPETENCIA = APPAG.MESCOMPETENCIA(+)'
      '   AND GI.ANOCOMPETENCIA = APPAG.ANOCOMPETENCIA(+)'
      ''
      
        'ORDER BY IMONOME, DSC_GRUPO, NOMCONTRATO, ANOCOMPETENCIA, MESCOM' +
        'PETENCIA'
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = nil
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 182
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'DT_INICIO'
      FieldName = 'DT_INICIO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'DT_TERMINO'
      FieldName = 'DT_TERMINO'
      FieldLength = 10
      DisplayWidth = 10
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
      FieldAlias = 'DSC_GRUPO'
      FieldName = 'DSC_GRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'LOJAS'
      FieldName = 'LOJAS'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object pplppField6: TppField
      FieldAlias = 'NOMCONTRATO'
      FieldName = 'NOMCONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      FieldAlias = 'DAT_VENCTO'
      FieldName = 'DAT_VENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplppField10: TppField
      FieldAlias = 'DAT_PAGTO'
      FieldName = 'DAT_PAGTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_FATURADO'
      FieldName = 'VLR_FATURADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CM'
      FieldName = 'VLR_CM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_MULTA'
      FieldName = 'VLR_MULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PAGTO'
      FieldName = 'VLR_PAGTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object ppAbono: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 261
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13758
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
        mmWidth = 284428
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Abonos e Sanções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8466
        mmWidth = 284163
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
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'LOJAS'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOMCONTRATO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 18521
        mmTop = 265
        mmWidth = 52917
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DAT_VENCTO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DAT_PAGTO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 114300
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_FATURADO'
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
        mmLeft = 135732
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_CM'
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
        mmLeft = 156104
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLR_MULTA'
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
        mmLeft = 176477
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 76994
        mmTop = 265
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 84402
        mmTop = 265
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLR_PAGTO'
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
        mmLeft = 224367
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object vTotDev: TppVariable
        UserName = 'vTotDev'
        AutoSize = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 201613
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object vTotAbono: TppVariable
        UserName = 'vTotAbono'
        AutoSize = False
        CalcOrder = 1
        DataType = dtExtended
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 246857
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object vPerda: TppVariable
        UserName = 'vPerda'
        AutoSize = False
        CalcOrder = 2
        DataType = dtExtended
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 267759
        mmTop = 0
        mmWidth = 12700
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
        mmWidth = 283369
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
        mmTop = 3175
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
        mmLeft = 255588
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
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IMONOME'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IMONOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3175
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label15'
          Caption = 'Total Geral do Shopping'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 18521
          mmTop = 4498
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object dbcFaturadoG: TppDBCalc
          UserName = 'dbcFaturadoG'
          DataField = 'VLR_FATURADO'
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
          mmHeight = 3175
          mmLeft = 135732
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbcCMG: TppDBCalc
          UserName = 'dbcCMG'
          DataField = 'VLR_CM'
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
          mmHeight = 3175
          mmLeft = 156104
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbcMultaG: TppDBCalc
          UserName = 'dbcMultaG'
          DataField = 'VLR_MULTA'
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
          mmHeight = 3175
          mmLeft = 176477
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbcPagoG: TppDBCalc
          UserName = 'dbcPagoG'
          DataField = 'VLR_PAGTO'
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
          mmHeight = 3175
          mmLeft = 224367
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object vTotGeralDev: TppVariable
          UserName = 'vTotGeralDev'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 201613
          mmTop = 4498
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object vTotGeralAbono: TppVariable
          UserName = 'vTotGeralAbono'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 246857
          mmTop = 4498
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object vPerdaGeral: TppVariable
          UserName = 'vPerdaGeral'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 267759
          mmTop = 4498
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DSC_GRUPO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 10319
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Loja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6085
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppOrcamentoLabel1: TppLabel
          UserName = 'OrcamentoLabel1'
          AutoSize = False
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 93134
          mmTop = 6085
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Faturado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 138113
          mmTop = 6085
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 153459
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Nome Fantasia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 18521
          mmTop = 6085
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 113506
          mmTop = 6085
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Multa Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DSC_GRUPO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 69056
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 76994
          mmTop = 6085
          mmWidth = 6085
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 84402
          mmTop = 6085
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Total Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 198702
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Total Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 225161
          mmTop = 6085
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Total Abono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 244740
          mmTop = 6085
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Perda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 269082
          mmTop = 6085
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 207434
          mmTop = 265
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'DT_TERMINO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4233
          mmLeft = 263790
          mmTop = 265
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'DT_INICIO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4233
          mmLeft = 237596
          mmTop = 265
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label16'
          Caption = 'à'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 260351
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 1588
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label13'
          Caption = 'Total do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 18521
          mmTop = 2910
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 7408
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object dbcFaturado: TppDBCalc
          UserName = 'dbcFaturado'
          DataField = 'VLR_FATURADO'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 135732
          mmTop = 2910
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object dbcCM: TppDBCalc
          UserName = 'dbcCM'
          DataField = 'VLR_CM'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 156104
          mmTop = 2910
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object dbcMulta: TppDBCalc
          UserName = 'dbcMulta'
          DataField = 'VLR_MULTA'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 176477
          mmTop = 2910
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object dbcPago: TppDBCalc
          UserName = 'dbcPago'
          DataField = 'VLR_PAGTO'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 224367
          mmTop = 2910
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object vTotGrpDev: TppVariable
          UserName = 'vTotGrpDev'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 201613
          mmTop = 2910
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
        end
        object vTotGrpAbono: TppVariable
          UserName = 'vTotGrpAbono'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 246857
          mmTop = 2910
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
        end
        object vPerdaGrp: TppVariable
          UserName = 'vPerdaGrp'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 267759
          mmTop = 2910
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C4301000070726F63656475726520
        44657461696C4265666F72655072696E743B0D0A626567696E0D0A2020207654
        6F744465762E4173457874656E646564203A3D2070706C5B27564C525F464154
        555241444F275D202B2070706C5B27564C525F434D275D202B200D0A20202020
        20202020202020202020202020202020202020202070706C5B27564C525F4D55
        4C5441275D3B0D0A20202076546F7441626F6E6F2E4173457874656E64656420
        3A3D2076546F744465762E4173457874656E646564202D2070706C5B27564C52
        5F504147544F275D3B2020202020202020202020202020202020202020202020
        20200D0A2020207650657264612E4173457874656E646564203A3D202876546F
        7441626F6E6F2E4173457874656E646564202A2031303029202F2076546F7444
        65762E4173457874656E6465643B2020200D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060644657461696C094576656E744E616D65060B4265666F72
        655072696E74074576656E74494402180001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65061B47726F7570466F6F74657242616E64
        324265666F72655072696E740B50726F6772616D54797065070B747450726F63
        656475726506536F757263650C8401000070726F6365647572652047726F7570
        466F6F74657242616E64324265666F72655072696E743B0D0A626567696E0D0A
        20202076546F744772704465762E4173457874656E6465642020203A3D206462
        63466174757261646F2E56616C7565202B20646263434D2E56616C7565202B0D
        0A20202020202020202020202020202020202020202020202020202020202064
        62634D756C74612E56616C75653B0D0A20202076546F7447727041626F6E6F2E
        4173457874656E646564203A3D2076546F744772704465762E4173457874656E
        646564202D200D0A202020202020202020202020202020202020202020202020
        2020202020206462635061676F2E56616C75653B0D0A20202076506572646147
        72702E4173457874656E646564202020203A3D202876546F7447727041626F6E
        6F2E4173457874656E646564202A2031303029202F2076546F74477270446576
        2E4173457874656E6465643B2020202020202020202020202020202020202020
        202020202020202020202020200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65061047726F7570466F6F74657242616E6432094576656E744E616D6506
        0B4265666F72655072696E74074576656E74494402180001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65061B47726F7570466F6F74
        657242616E64314265666F72655072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650CB801000070726F636564757265
        2047726F7570466F6F74657242616E64314265666F72655072696E743B0D0A62
        6567696E0D0A20202076546F74476572616C4465762E4173457874656E646564
        2020203A3D20646263466174757261646F472E56616C7565202B20646263434D
        472E56616C7565202B0D0A202020202020202020202020202020202020202020
        20202020202020202020206462634D756C7461472E56616C75653B0D0A202020
        76546F74476572616C41626F6E6F2E4173457874656E646564203A3D2076546F
        74476572616C4465762E4173457874656E646564202D200D0A20202020202020
        202020202020202020202020202020202020202020202020206462635061676F
        472E56616C75653B0D0A202020765065726461476572616C2E4173457874656E
        646564202020203A3D202876546F74476572616C41626F6E6F2E417345787465
        6E646564202A2031303029202F2076546F74476572616C4465762E4173457874
        656E6465643B2020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        202020202020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65061047
        726F7570466F6F74657242616E6431094576656E744E616D65060B4265666F72
        655072696E74074576656E74494402180000}
    end
  end
end
