inherited DtmRel2ViaCChequeMT: TDtmRel2ViaCChequeMT
  Left = 293
  Top = 128
  Width = 374
  Height = 355
  Caption = 'DtmRel2ViaCChequeMT'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'pRecebedor'
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
        Caption = 'pIdHastFolhaBenef'
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
        Caption = 'pIdTitular'
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
        Caption = 'pIdListaFOlha'
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
        Caption = 'pMesReferenciaIni'
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
        Name = 'pMesReferenciaIni'
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
        Caption = 'pMesReferenciaFim'
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
        Name = 'pMesReferenciaFim'
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
    Left = 204
    Top = 32
  end
  object CdsFundacao: TCMClientDataSet [2]
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 72
  end
  object cdsDemonstpag: TCMClientDataSet [3]
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 72
    Data = {
      400500009619E0BD01000000180000002E00000000000300000040050F494448
      5354464F4C484142454E454608000400000000000D4944524553504F4E534156
      454C08000400000000000B4944504C414E4F5052455608000400000000000949
      44504553534A555208000400000000000B4D4553434F4252414E434101004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020007000850415243454C415308000400000000000A494450524F56
      454E544F080004000000000007544954554C4152010049000000010005574944
      5448020002003C00044E4F4D450100490000000100055749445448020002003C
      000D504154524F43494E41444F52410100490000000100055749445448020002
      003C0006434F4449474F08000400000000000944455343524943414F01004900
      00000100055749445448020002008200094D4154524943554C41010049000000
      0100055749445448020002000D000F494E5343524943414F4E554D45524F0800
      04000000000008444154414E41534308000800000000000B464C47444553434F
      4E544F080004000000000005504C414E4F010049000000010005574944544802
      00020032000B4E554D50524F43494E5353010049000000010005574944544802
      0002000F000A4953454E544F4952524601004900000001000557494454480200
      020003000A4E554D4445504952524608000400000000000A4E554D4147454E43
      494101004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000F000D434F4E5441434F5252454E544501004900
      00000100055749445448020002000F000B464C47455350454349414C08000400
      00000000084944504553534F4108000400000000000A4944454E44455245434F
      08000400000000000A4C4F475241444F55524F01004900000001000557494454
      48020002003C0003434550010049000000010005574944544802000200080009
      434F4445535441444F01004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000300064E554D45524F01004900
      000001000557494454480200020008000B434F4D504C454D454E544F01004900
      000001000557494454480200020014000642414952524F010049000000010005
      5749445448020002001400064349444144450100490000000100055749445448
      0200020032000C5449504F454E44455245434F01004900000002000753554254
      595045020049000A004669786564436861720005574944544802000200050006
      4E4F4D455F310100490000000100055749445448020002002800074147454E43
      49410100490000000100055749445448020002003C0002504401004900000001
      00055749445448020002000B0009545052554252494341010049000000010005
      57494454480200020001000542414E434F010049000000010005574944544802
      0002003C00034D455301004900000001000557494454480200020007000D4D45
      53434F4252414E43415F3101004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020007000B4441544143524544
      49544F08000800000000000D56414C4F5250524F56454E544F08000400000000
      000B494E464F524D415449564F0100490000000100055749445448020002002C
      000A564C50524F56454E544F08000400000000000A564C444553434F4E544F08
      00040000000000075245534944554F080004000000000002000D44454641554C
      545F4F5244455202008200040000000580090010000B00044C43494404000100
      09080000}
  end
  object dsFundacao: TwwDataSource [4]
    DataSet = CdsFundacao
    Left = 34
    Top = 131
  end
  object dsdemonstpag: TwwDataSource [5]
    DataSet = cdsDemonstpag
    Left = 122
    Top = 133
  end
  object ppFundacao: TppBDEPipeline [6]
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 28
    Top = 179
  end
  object ppdemonstpag: TppBDEPipeline [7]
    DataSource = dsdemonstpag
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'demonstpag'
    Left = 124
    Top = 194
    object ppdemonstpagppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHSTFOLHABENEF'
      FieldName = 'IDHSTFOLHABENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppdemonstpagppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppdemonstpagppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppdemonstpagppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppdemonstpagppField5: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
    object ppdemonstpagppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS'
      FieldName = 'PARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppdemonstpagppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROVENTO'
      FieldName = 'IDPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppdemonstpagppField8: TppField
      FieldAlias = 'TITULAR'
      FieldName = 'TITULAR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppdemonstpagppField9: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppdemonstpagppField10: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppdemonstpagppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppdemonstpagppField12: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 11
    end
    object ppdemonstpagppField13: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 12
    end
    object ppdemonstpagppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppdemonstpagppField15: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object ppdemonstpagppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDESCONTO'
      FieldName = 'FLGDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppdemonstpagppField17: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 16
    end
    object ppdemonstpagppField18: TppField
      FieldAlias = 'NUMPROCINSS'
      FieldName = 'NUMPROCINSS'
      FieldLength = 15
      DisplayWidth = 15
      Position = 17
    end
    object ppdemonstpagppField19: TppField
      FieldAlias = 'ISENTOIRRF'
      FieldName = 'ISENTOIRRF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 18
    end
    object ppdemonstpagppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDEPIRRF'
      FieldName = 'NUMDEPIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppdemonstpagppField21: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object ppdemonstpagppField22: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 21
    end
    object ppdemonstpagppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGESPECIAL'
      FieldName = 'FLGESPECIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppdemonstpagppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppdemonstpagppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppdemonstpagppField26: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 25
    end
    object ppdemonstpagppField27: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 26
    end
    object ppdemonstpagppField28: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 27
    end
    object ppdemonstpagppField29: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 28
    end
    object ppdemonstpagppField30: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 29
    end
    object ppdemonstpagppField31: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 30
    end
    object ppdemonstpagppField32: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 31
    end
    object ppdemonstpagppField33: TppField
      FieldAlias = 'TIPOENDERECO'
      FieldName = 'TIPOENDERECO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 32
    end
    object ppdemonstpagppField34: TppField
      FieldAlias = 'NOME_1'
      FieldName = 'NOME_1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 33
    end
    object ppdemonstpagppField35: TppField
      FieldAlias = 'AGENCIA'
      FieldName = 'AGENCIA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 34
    end
    object ppdemonstpagppField36: TppField
      FieldAlias = 'PD'
      FieldName = 'PD'
      FieldLength = 11
      DisplayWidth = 11
      Position = 35
    end
    object ppdemonstpagppField37: TppField
      FieldAlias = 'TPRUBRICA'
      FieldName = 'TPRUBRICA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 36
    end
    object ppdemonstpagppField38: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 37
    end
    object ppdemonstpagppField39: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 38
    end
    object ppdemonstpagppField40: TppField
      FieldAlias = 'MESCOBRANCA_1'
      FieldName = 'MESCOBRANCA_1'
      FieldLength = 7
      DisplayWidth = 7
      Position = 39
    end
    object ppdemonstpagppField41: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 40
    end
    object ppdemonstpagppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object ppdemonstpagppField43: TppField
      FieldAlias = 'INFORMATIVO'
      FieldName = 'INFORMATIVO'
      FieldLength = 44
      DisplayWidth = 44
      Position = 42
    end
    object ppdemonstpagppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLPROVENTO'
      FieldName = 'VLPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object ppdemonstpagppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLDESCONTO'
      FieldName = 'VLDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object ppdemonstpagppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESIDUO'
      FieldName = 'RESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
  end
  object rpdemonstpag: TppReport [8]
    AutoStop = False
    DataPipeline = ppdemonstpag
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 207
    Top = 102
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppdemonstpag'
    object ppHeaderBandRel: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppdbNomeFundacao: TppDBText
        UserName = 'rpCredBenefDBText101'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppdbCepFund: TppDBText
        UserName = 'dbCepFund'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppdbRazaoSocial: TppDBText
        UserName = 'dbRazaoSocial'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4191
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 81534
        BandType = 0
      end
      object ppdbImagem: TppDBImage
        UserName = 'dbImagem'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppdbEnderecoFund: TppDBText
        UserName = 'dbEnderecoFund'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 43730
        BandType = 0
      end
      object ppdbBarIDUF: TppDBText
        UserName = 'dbBarIDUF'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 44154
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppRectRubricas: TppShape
        UserName = 'RectRubricas'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppdbDescricaoRub: TppDBText
        UserName = 'dbDescricaoRub'
        DataField = 'DESCRICAO'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3175
        mmLeft = 47096
        mmTop = 529
        mmWidth = 91811
        BandType = 4
      end
      object ppdbValorRubrica: TppDBText
        UserName = 'dbValorRubrica'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppdemonstpag
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3175
        mmLeft = 140759
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object ppdbCodigoRub: TppDBText
        UserName = 'dbCodigoRub'
        DataField = 'CODIGO'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3440
        mmLeft = 33602
        mmTop = 529
        mmWidth = 12436
        BandType = 4
      end
      object ppdbMesRub: TppDBText
        UserName = 'dbMesRub'
        DataField = 'MES'
        DataPipeline = ppdemonstpag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdemonstpag'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 12964
        BandType = 4
      end
      object ppLabelDataInicio: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 15610
        mmTop = 529
        mmWidth = 16403
        BandType = 4
      end
      object VarResiduo: TppVariable
        UserName = 'VarResiduo'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 163513
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'VarResiduo1'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 187325
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 1058
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
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
    end
    object rpdemonstpagSummaryBand1: TppSummaryBand
      AfterPrint = rpdemonstpagSummaryBand1AfterPrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
    end
    object ppGroup5: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 68527
        mmPrintPosition = 0
        object ppRectDados: TppShape
          UserName = 'RectDados'
          mmHeight = 45773
          mmLeft = 0
          mmTop = 22754
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object pplNome: TppLabel
          UserName = 'lNome'
          Caption = 'TITULAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 24606
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object pplDataNasc: TppLabel
          UserName = 'lDataNasc'
          Caption = 'Data Nasc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 116152
          mmTop = 45508
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object pplMatricula: TppLabel
          UserName = 'lMatricula'
          Caption = 'MATRICULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 34131
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object pplEndereco: TppLabel
          UserName = 'lEndereco'
          Caption = 'ENDEREÇO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 56356
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object pplInscricao: TppLabel
          UserName = 'lInscricao'
          Caption = 'INSCRIÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 27781
          mmTop = 34131
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppdbNome: TppDBText
          UserName = 'dbNome'
          DataField = 'NOME'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 50800
          mmWidth = 112184
          BandType = 3
          GroupNo = 0
        end
        object ppdbLogra: TppDBText
          UserName = 'dbLogra'
          DataField = 'LOGRADOURO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 61119
          mmWidth = 76200
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText44'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3969
          mmLeft = 27781
          mmTop = 38894
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object pplBairro: TppLabel
          UserName = 'lBairro'
          Caption = 'BAIRRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 81227
          mmTop = 56356
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppdbBairro: TppDBText
          UserName = 'dbBairro'
          DataField = 'BAIRRO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 81227
          mmTop = 61119
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object pplCidade: TppLabel
          UserName = 'lCidade'
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 109802
          mmTop = 56356
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object pplNumDep: TppLabel
          UserName = 'lNumDep'
          Caption = 'Número de Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 135732
          mmTop = 45244
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppdbCidade: TppDBText
          UserName = 'dbCidade'
          DataField = 'CIDADE'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 109802
          mmTop = 61119
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppdbDatanasc: TppDBText
          UserName = 'dbDatanasc'
          DataField = 'DATANASC'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3969
          mmLeft = 116152
          mmTop = 50536
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbNumDep: TppDBText
          UserName = 'dbNumDep'
          DataField = 'NUMDEPIRRF'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3969
          mmLeft = 135732
          mmTop = 50536
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object pplEstado: TppLabel
          UserName = 'lEstado'
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134673
          mmTop = 56356
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppdbEstado: TppDBText
          UserName = 'dbEstado'
          DataField = 'CODESTADO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 134938
          mmTop = 61119
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object pplCEP: TppLabel
          UserName = 'lCEP'
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 158750
          mmTop = 56356
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppdbCep: TppDBText
          UserName = 'dbCep'
          DataField = 'CEP'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 158750
          mmTop = 61119
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'ppDBText52'
          DataField = 'MATRICULA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 38894
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbmespag: TppDBText
          UserName = 'dbmespag'
          DataField = 'MESCOBRANCA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3440
          mmLeft = 165365
          mmTop = 29369
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object pplMesPagto: TppLabel
          UserName = 'lMesPagto'
          AutoSize = False
          Caption = 'Mês Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 165365
          mmTop = 24871
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'lNumDep1'
          Caption = 'Isento IR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 176477
          mmTop = 45244
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'dbNumDep1'
          DataField = 'ISENTOIRRF'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3969
          mmLeft = 176477
          mmTop = 50536
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'lDataInicio1'
          Caption = 'Nº Benef. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 55827
          mmTop = 34131
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'NUMPROCINSS'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3969
          mmLeft = 56092
          mmTop = 38894
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'lNome2'
          Caption = 'RECEBEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 46038
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'dbNome2'
          DataField = 'TITULAR'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 29369
          mmWidth = 129117
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'ppShape1'
          mmHeight = 21696
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'lNome1'
          Caption = 'PATROCINADORA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 10054
          mmWidth = 28310
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'dbNome1'
          DataField = 'PATROCINADORA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 14288
          mmWidth = 79111
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'PLANO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 14288
          mmWidth = 92340
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'PLANO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 88900
          mmTop = 10054
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object pplTituloRelat: TppLabel
          UserName = 'lTituloRelat'
          Caption = 'DEMONSTRATIVO DE PAGAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Transparent = True
          mmHeight = 5821
          mmLeft = 52917
          mmTop = 1588
          mmWidth = 92075
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBandTotal: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDRESPONSAVEL'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MESCOBRANCA'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDHSTFOLHABENEF'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 28046
        mmPrintPosition = 0
        object pplTotalProvento: TppLabel
          UserName = 'lTotalProvento'
          AutoSize = False
          Caption = 'TOTAL DE PROVENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 3969
          mmTop = 4763
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
        object pplTotalDesconto: TppLabel
          UserName = 'lTotalDesconto'
          AutoSize = False
          Caption = 'TOTAL DE DESCONTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 45508
          mmTop = 4763
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
        object ppdbDesconto: TppDBCalc
          UserName = 'dbDesconto'
          DataField = 'VLDESCONTO'
          DataPipeline = ppdemonstpag
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 45508
          mmTop = 9790
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
        object ppdbProvento: TppDBCalc
          UserName = 'dbProvento'
          DataField = 'VLPROVENTO'
          DataPipeline = ppdemonstpag
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 9790
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
        object pplLiquido: TppLabel
          UserName = 'lLiquido'
          AutoSize = False
          Caption = 'LÍQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 98954
          mmTop = 4763
          mmWidth = 14288
          BandType = 5
          GroupNo = 2
        end
        object ppLbTotalResiduo: TppLabel
          UserName = 'lLiquido1'
          AutoSize = False
          Caption = 'TOTAL RESÍDUO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 130969
          mmTop = 5027
          mmWidth = 26723
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalcTotalResiduo: TppDBCalc
          UserName = 'DBCalcTotalResiduo'
          DataField = 'RESIDUO'
          DataPipeline = ppdemonstpag
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 131234
          mmTop = 10054
          mmWidth = 26723
          BandType = 5
          GroupNo = 2
        end
        object pplValorLiquido: TppLabel
          OnPrint = pplValorLiquidoPrint
          UserName = 'lValorLiquido'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 88371
          mmTop = 9790
          mmWidth = 24606
          BandType = 5
          GroupNo = 2
        end
        object ppRectTotal: TppShape
          UserName = 'RectTotal'
          Brush.Style = bsClear
          mmHeight = 26988
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 2
        end
        object pplAgencia: TppLabel
          UserName = 'lAgencia'
          Caption = 'AGÊNCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 68792
          mmTop = 16404
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
        object pplBanco: TppLabel
          UserName = 'lBanco'
          Caption = 'BANCO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 16404
          mmWidth = 12171
          BandType = 5
          GroupNo = 2
        end
        object pplContaCorrente: TppLabel
          UserName = 'lContaCorrente'
          Caption = 'CONTA CORRENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 114829
          mmTop = 16669
          mmWidth = 27781
          BandType = 5
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'DATA DE CRÉDITO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 151871
          mmTop = 16669
          mmWidth = 26988
          BandType = 5
          GroupNo = 2
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATACREDITO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 21167
          mmWidth = 16404
          BandType = 5
          GroupNo = 2
        end
        object ppdbContaCorrente: TppDBText
          UserName = 'dbContaCorrente'
          DataField = 'CONTACORRENTE'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 115094
          mmTop = 21167
          mmWidth = 23813
          BandType = 5
          GroupNo = 2
        end
        object ppdbAgencia: TppDBText
          UserName = 'dbAgencia'
          DataField = 'AGENCIA'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 68527
          mmTop = 21167
          mmWidth = 43392
          BandType = 5
          GroupNo = 2
        end
        object ppdbBanco: TppDBText
          UserName = 'dbBanco'
          DataField = 'BANCO'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 21167
          mmWidth = 62177
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PD'
      DataPipeline = ppdemonstpag
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdemonstpag'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppRectCabecRubricas: TppShape
          UserName = 'RectCabecRubricas'
          Brush.Style = bsClear
          mmHeight = 11642
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object ppDbTextPD: TppDBText
          UserName = 'DbTextPD'
          DataField = 'PD'
          DataPipeline = ppdemonstpag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdemonstpag'
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object pplCodigoRub: TppLabel
          UserName = 'lCodigoRub'
          AutoSize = False
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 7144
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object pplDescricaoRub: TppLabel
          UserName = 'lDescricaoRub'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 47096
          mmTop = 7144
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object pplValorRubrica: TppLabel
          UserName = 'lValorRubrica'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 150548
          mmTop = 7144
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object pplMesRub: TppLabel
          UserName = 'lMesRub'
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 7144
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLbDataInicio: TppLabel
          UserName = 'lCodigoRub1'
          AutoSize = False
          Caption = 'Data Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 15875
          mmTop = 7144
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabelResiduo: TppLabel
          UserName = 'lValorRubrica1'
          AutoSize = False
          Caption = 'Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 173302
          mmTop = 7144
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Prazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 187325
          mmTop = 7144
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        5661725265736964756F4F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365066470726F6365647572652056617252
        65736964756F4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D64656D6F6E7374706167
        5B275245534944554F275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060A5661725265736964756F094576656E744E616D6506064F6E4361
        6C63074576656E74494402210000}
    end
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BASEDados'
    Report = rpdemonstpag
    Left = 115
    Top = 16
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      HST.IDHSTFOLHABENEF,'
      '      HST.IDRESPONSAVEL,'
      '      HST.IDPLANOPREV,'
      '      HST.IDPESSJUR,'
      '      HST.MESCOBRANCA, HST.PARCELAS,'
      '      PVD.IDPROVENTO,'
      '      TIT.NOME AS TITULAR,'
      '      BEN.NOME,'
      '      PT.NOME AS PATROCINADORA,'
      '      PVD.IDPROVENTO AS CODIGO,'
      '      PVD.DESCRICAO AS DESCRICAO,'
      '      ELP.MATRICULA,'
      '      PPP.INSCRICAONUMERO,'
      '      PFI.DATANASC,'
      '      PVD.FLGDESCONTO,'
      '      PL.NOME AS PLANO,'
      '      HST.NUMPROCINSS,'
      '      DECODE(PFI.FLGISENTOIRRF,'
      '      1,'
      '      '#39'SIM'#39','
      '      '#39'NÃO'#39') ISENTOIRRF,'
      '      PFI.NUMDEPIRRF,'
      '      AG.NUMAGENCIA,'
      '      HST.CONTACORRENTE,'
      '      PVD.FLGESPECIAL,'
      '      EP.IDPESSOA,'
      '      EP.IDENDERECO,'
      '      EP.LOGRADOURO,'
      '      EP.CEP,'
      '      EST.CODESTADO,'
      '      EP.NUMERO,'
      '      EP.COMPLEMENTO,'
      '      EP.BAIRRO,'
      '      CID.NOME AS CIDADE,'
      '      EP.TIPOENDERECO,'
      '      EP.NOME,'
      '      AGN.NOME AS AGENCIA,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      0,'
      '      '#39'PROVENTO'#39','
      '      1,'
      '      '#39'DESCONTO'#39','
      '      '#39'INFORMATIVA'#39') AS PD,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      1,'
      '      '#39'D'#39','
      '      0,'
      '      '#39'P'#39','
      '      '#39'I'#39') AS TPRUBRICA,'
      '      BC.NOME AS BANCO,'
      '      SUBSTR(HST.MES,'
      '      6,'
      '      2)||'#39'/'#39'||SUBSTR(HST.MES,'
      '      1,'
      '      4) AS MES,'
      '      HST.MESCOBRANCA,'
      '      HST.DATAPAGAMENTO AS DATACREDITO,'
      '      SUM(HST.VALORPROVENTO) VALORPROVENTO,'
      '      DECODE(PVD.FLGDESCONTO,'
      '      2,'
      '      SUM(HST.VALORINFO)||'#39' (I)'#39','
      '      0,'
      '      NULL,'
      '      1,'
      '      DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),'
      '      0,'
      '      DECODE(SUM(HST.VALORINFO),'
      '      0,'
      '      NULL,'
      '      SUM(HST.VALORINFO)||'#39' (I)'#39'),'
      
        '      SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'#39' (R)'#39')) INFORMA' +
        'TIVO,'
      '      SUM(DECODE(PVD.FLGDESCONTO,'
      '      0,'
      '      HST.VALORPROVENTO,'
      '      0.0)) AS VLPROVENTO,'
      '      SUM(DECODE(PVD.FLGDESCONTO,'
      '      1,'
      '      HST.VALORPROVENTO,'
      '      0.0)) AS VLDESCONTO,'
      '      SUM(HST.VALORPROVENTO - HST.VALORRECEBIDO) AS RESIDUO  '
      'FROM'
      '      HISTRUBSAL HST,'
      '      ELEGPATRO ELP,'
      '      PARTPREVPLAN PPP,'
      '      PLANPREV PL,'
      '      PESSOA TIT,'
      '      PESSOA BEN,'
      '      PESSOAFISICA PFI,'
      '      PROVDESC PVD,'
      '      ENDPESS EP,'
      '      PESSOA BC,'
      '      PESSOA AGN ,'
      '      PESSOA PT,'
      '      BANCO BCO,'
      '      AGENCIABANCARIA AG,'
      '      CIDADES CID,'
      '    ESTADO EST  '
      '    WHERE HST.IDHSTFOLHABENEF IN (594,'
      '575) '
      'AND HST.IDTITULAR = 11 '
      'AND HST.IDRESPONSAVEL = 8766 '
      'AND HST.IDPLANOPREV = PL.IDPLANOPREV  '
      'AND PVD.IDPROVENTO = HST.IDRUBRICA  '
      'AND ELP.IDPESSOA = HST.IDTITULAR  '
      'AND ELP.IDPESSJUR = HST.IDPATRO  '
      'AND PPP.IDPESSJUR = HST.IDPATRO  '
      'AND PPP.IDPLANOPREV = HST.IDPLANOPREV  '
      'AND PPP.IDPESSOA = HST.IDTITULAR  '
      'AND PPP.IDPESSJUR = PT.IDPESSOA  '
      'AND PPP.IDPESSOA  = TIT.IDPESSOA  '
      'AND PFI.IDPESSOA = HST.IDRESPONSAVEL  '
      'AND  BEN.IDPESSOA     = EP.IDPESSOA(+)    '
      'AND  BEN.IDENDCORRESP = EP.IDENDERECO(+)  '
      'AND EP.IDCIDADES = CID.IDCIDADES(+)  '
      'AND EST.IDESTADO(+) = CID.IDESTADO  '
      'AND BEN.IDPESSOA = HST.IDRESPONSAVEL  '
      'AND RTRIM(HST.NUMBANCO) = BCO.NUMBANCO(+)  '
      'AND HST.NUMAGENCIA = AG.NUMAGENCIA(+)  '
      'AND AGN.IDPESSOA(+) = AG.IDPESSOA  '
      'AND BC.IDPESSOA(+) = BCO.IDPESSOA  '
      'AND ((AG.IDBANCO = BCO.IDPESSOA)'
      '    OR (AG.IDBANCO IS NULL))'
      '    GROUP BY'
      '    HST.IDHSTFOLHABENEF,'
      '    HST.MESCOBRANCA,  HST.PARCELAS,'
      '    PVD.IDPROVENTO,'
      '    PVD.FLGESPECIAL,'
      '    HST.IDRESPONSAVEL,'
      '    HST.IDPLANOPREV,'
      '    HST.IDPESSJUR,'
      '    TIT.NOME,'
      '    BEN.NOME,'
      '    PT.NOME,'
      '    PVD.IDPROVENTO,'
      '    PVD.DESCRICAO,'
      '    ELP.MATRICULA,'
      '    PPP.INSCRICAONUMERO,'
      '    PFI.DATANASC,'
      '    PVD.FLGDESCONTO,'
      '    PL.NOME,'
      '    HST.NUMPROCINSS,'
      '    PFI.FLGISENTOIRRF,'
      '    PFI.NUMDEPIRRF,'
      '    AG.NUMAGENCIA,'
      '    HST.CONTACORRENTE,'
      '    BC.NOME,'
      '    HST.MES,'
      '    HST.MESCOBRANCA,'
      '    HST.DATAPAGAMENTO,'
      '    EP.IDPESSOA,'
      '    EP.IDENDERECO,'
      '    EP.LOGRADOURO,'
      '    EP.CEP,'
      '    EST.CODESTADO,'
      '    EP.NUMERO,'
      '    EP.COMPLEMENTO,'
      '    EP.BAIRRO,'
      '    CID.NOME,'
      '    EP.TIPOENDERECO,'
      '    EP.NOME,'
      '    AGN.NOME,'
      '    DECODE(PVD.FLGDESCONTO,'
      '    1,'
      '    '#39'D'#39','
      '    0,'
      '    '#39'P'#39','
      #39'I'#39')  '
      'ORDER BY '
      'HST.MESCOBRANCA DESC, '
      'BEN.NOME ASC,'
      'PVD.FLGDESCONTO ASC,'
      'CODIGO'
      ' ')
    ClientDataSet = cdsDemonstpag
    Left = 280
    Top = 40
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,                    ' +
        '          '
      
        '       E.NUMERO , E.COMPLEMENTO, E.BAIRRO,                      ' +
        '          '
      
        '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM, I.IDIMAGE' +
        'M,        '
      
        '      (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO,               ' +
        '       '
      
        '      (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF ' +
        '     '
      
        'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C                  ' +
        '          '
      'WHERE (P.IDPESSOA = 1) AND                     '
      
        '(E.IDPESSOA(+) = P.IDPESSOA) AND                                ' +
        '    '
      
        '(E.IDCIDADES   = C.IDCIDADES(+))  AND                           ' +
        '    '
      '(I.IDIMAGEM(+) = P.IDIMAGEM)')
    ClientDataSet = CdsFundacao
    Left = 272
    Top = 176
  end
end
