inherited RptCAFRazaoPatAux: TRptCAFRazaoPatAux
  Left = 361
  Top = 119
  Width = 377
  Height = 245
  Caption = 'Razão Auxiliar Patrimonial'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sqlRazaoPatAux: TCMSqlParams [0]
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       (0.00) AS VALCUSTOANT,'
      '       (0.00) AS VALCUSTOCMANT,'
      '       (0.00) AS VALDEPRECANT,'
      '       (0.00) AS VALCUSTOCMANT2,'
      '       (0.00) AS VALDEPRECANT2,'
      ''
      '       (0.00) AS VALCUSTOAQUIS,'
      '       (0.00) AS VALCUSTOCMAQUIS,'
      '       (0.00) AS VALDEPRECAQUIS,'
      '       (0.00) AS VALCUSTOCMAQUIS2,'
      '       (0.00) AS VALDEPRECAQUIS2,'
      ''
      '       (0.00) AS VALCUSTOBX,'
      '       (0.00) AS VALCUSTOCMBX,'
      '       (0.00) AS VALDEPRECBX,'
      '       (0.00) AS VALCUSTOCMBX2,'
      '       (0.00) AS VALDEPRECBX2,'
      ''
      '       (0.00) AS VALCUSTOENT,'
      '       (0.00) AS VALCUSTOCMENT,'
      '       (0.00) AS VALDEPRECENT,'
      '       (0.00) AS VALCUSTOCMENT2,'
      '       (0.00) AS VALDEPRECENT2,'
      ''
      '       (0.00) AS VALCUSTOSAI,'
      '       (0.00) AS VALCUSTOCMSAI,'
      '       (0.00) AS VALDEPRECSAI,'
      '       (0.00) AS VALCUSTOCMSAI2,'
      '       (0.00) AS VALDEPRECSAI2,'
      ''
      '       (0.00) AS VALDEPRECPER,'
      '       (0.00) AS VALDEPRECPER2,'
      ''
      '       (0.00) AS VALCUSTOATUAL,'
      '       (0.00) AS VALCUSTOCMATUAL,'
      '       (0.00) AS VALDEPRECATUAL,'
      '       (0.00) AS VALCUSTOCMATUAL2,'
      '       (0.00) AS VALDEPRECATUAL2'
      'FROM GRUPO'
      'WHERE IDGRUPO IS NULL'
      'ORDER BY CLASSE'
      ''
      ''
      '')
    ClientDataSet = cdsRazaoPatAux
    Left = 216
    Top = 63
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Razão Auxiliar Patrimonial'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Data Incial'
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
        MostraComboCompara = False
        Required = True
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
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Required = True
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
        Caption = 'Segunda Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC'
          'FROM CAFMOEDAS CM,'
          '      MOEDA M'
          'WHERE CM.IDPESSOA = 1'
          '  AND CM.MOECODIGO = M.MOECODIGO'
          'ORDER BY CM.IDTIPOMOEDA')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Caption = 'País'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS'
          'FROM CAFPAISES CP,'
          '     PAIS P'
          'WHERE CP.IDPESSOA = 1'
          '  AND CP.IDPAIS = P.IDPAIS'
          'ORDER BY P.NOMEPAIS')
        LookupSettings.Chave = 'IDCAFPAISES'
        LookupSettings.Display = 'NOMEPAIS'
        LookupSettings.Descricao = 'País'
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
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|8'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = ' Bens '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Investimentos Imobiliários')
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
        MostraComboCompara = False
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
        Caption = 'Incluir Bens com Controle Físico'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 265
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpRazaoPatAux
    LabelEmpresa = ppLabel70
    LabelSistema = ppLabel81
  end
  object cdsRazaoPatAux: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 49
    Data = {
      4C0300009619E0BD0100000018000000230000000000030000004C0307494447
      5255504F080004000000000006434C4153534501004900000001000557494454
      48020002000F000944455343475255504F010049000000010005574944544802
      0002003C000B56414C435553544F414E5408000400000000000D56414C435553
      544F434D414E5408000400000000000C56414C444550524543414E5408000400
      000000000E56414C435553544F434D414E543208000400000000000D56414C44
      4550524543414E543208000400000000000D56414C435553544F415155495308
      000400000000000F56414C435553544F434D415155495308000400000000000E
      56414C444550524543415155495308000400000000001056414C435553544F43
      4D41515549533208000400000000000F56414C44455052454341515549533208
      000400000000000A56414C435553544F425808000400000000000C56414C4355
      53544F434D425808000400000000000B56414C44455052454342580800040000
      0000000D56414C435553544F434D42583208000400000000000C56414C444550
      52454342583208000400000000000B56414C435553544F454E54080004000000
      00000D56414C435553544F434D454E5408000400000000000C56414C44455052
      4543454E5408000400000000000E56414C435553544F434D454E543208000400
      000000000D56414C444550524543454E543208000400000000000B56414C4355
      53544F53414908000400000000000D56414C435553544F434D53414908000400
      000000000C56414C44455052454353414908000400000000000E56414C435553
      544F434D5341493208000400000000000D56414C444550524543534149320800
      0400000000000C56414C44455052454350455208000400000000000D56414C44
      45505245435045523208000400000000000D56414C435553544F415455414C08
      000400000000000F56414C435553544F434D415455414C08000400000000000E
      56414C444550524543415455414C08000400000000001056414C435553544F43
      4D415455414C3208000400000000000F56414C444550524543415455414C3208
      0004000000000002000D44454641554C545F4F52444552040082000100000002
      000000044C4349440400010000000000}
  end
  object dsRazaoPatAux: TwwDataSource
    DataSet = cdsRazaoPatAux
    Left = 216
    Top = 35
  end
  object ppRazaoPatAux: TppBDEPipeline
    DataSource = dsRazaoPatAux
    UserName = 'RazaoPatAux'
    Left = 216
    Top = 21
    object ppRazaoPatAuxppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppRazaoPatAuxppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppRazaoPatAuxppField3: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppRazaoPatAuxppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOANT'
      FieldName = 'VALCUSTOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRazaoPatAuxppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMANT'
      FieldName = 'VALCUSTOCMANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppRazaoPatAuxppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECANT'
      FieldName = 'VALDEPRECANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppRazaoPatAuxppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMANT2'
      FieldName = 'VALCUSTOCMANT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppRazaoPatAuxppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECANT2'
      FieldName = 'VALDEPRECANT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppRazaoPatAuxppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOAQUIS'
      FieldName = 'VALCUSTOAQUIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppRazaoPatAuxppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMAQUIS'
      FieldName = 'VALCUSTOCMAQUIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppRazaoPatAuxppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECAQUIS'
      FieldName = 'VALDEPRECAQUIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppRazaoPatAuxppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMAQUIS2'
      FieldName = 'VALCUSTOCMAQUIS2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppRazaoPatAuxppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECAQUIS2'
      FieldName = 'VALDEPRECAQUIS2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppRazaoPatAuxppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOBX'
      FieldName = 'VALCUSTOBX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppRazaoPatAuxppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMBX'
      FieldName = 'VALCUSTOCMBX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppRazaoPatAuxppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECBX'
      FieldName = 'VALDEPRECBX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppRazaoPatAuxppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMBX2'
      FieldName = 'VALCUSTOCMBX2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppRazaoPatAuxppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECBX2'
      FieldName = 'VALDEPRECBX2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppRazaoPatAuxppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOENT'
      FieldName = 'VALCUSTOENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppRazaoPatAuxppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMENT'
      FieldName = 'VALCUSTOCMENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppRazaoPatAuxppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECENT'
      FieldName = 'VALDEPRECENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppRazaoPatAuxppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMENT2'
      FieldName = 'VALCUSTOCMENT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppRazaoPatAuxppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECENT2'
      FieldName = 'VALDEPRECENT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppRazaoPatAuxppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOSAI'
      FieldName = 'VALCUSTOSAI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppRazaoPatAuxppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMSAI'
      FieldName = 'VALCUSTOCMSAI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppRazaoPatAuxppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECSAI'
      FieldName = 'VALDEPRECSAI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppRazaoPatAuxppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMSAI2'
      FieldName = 'VALCUSTOCMSAI2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppRazaoPatAuxppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECSAI2'
      FieldName = 'VALDEPRECSAI2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppRazaoPatAuxppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECPER'
      FieldName = 'VALDEPRECPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppRazaoPatAuxppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECPER2'
      FieldName = 'VALDEPRECPER2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppRazaoPatAuxppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOATUAL'
      FieldName = 'VALCUSTOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppRazaoPatAuxppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMATUAL'
      FieldName = 'VALCUSTOCMATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppRazaoPatAuxppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECATUAL'
      FieldName = 'VALDEPRECATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppRazaoPatAuxppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTOCMATUAL2'
      FieldName = 'VALCUSTOCMATUAL2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppRazaoPatAuxppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEPRECATUAL2'
      FieldName = 'VALDEPRECATUAL2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
  end
  object rpRazaoPatAux: TppReport
    AutoStop = False
    DataPipeline = ppRazaoPatAux
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        Caption = 'Razão Auxiliar Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 65617
        mmTop = 7144
        mmWidth = 65881
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83079
        mmTop = 529
        mmWidth = 30956
        BandType = 0
      end
      object pplbldata1: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 13758
        mmWidth = 31750
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'lblDataIni'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 91281
        mmTop = 13758
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLine1: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 20637
        mmWidth = 197379
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataFim'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117211
        mmTop = 13758
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLabel1: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 13758
        mmWidth = 2117
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32014
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 46567
        mmTop = 27517
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Valor Orig. Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 70908
        mmTop = 27517
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 104246
        mmTop = 27781
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 143404
        mmTop = 27517
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 27517
        mmWidth = 28840
        BandType = 0
      end
      object lblVlrMoeda2: TppLabel
        UserName = 'lblVlrMoeda2'
        AutoSize = False
        Caption = 'Moeda : XXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 153459
        mmTop = 21960
        mmWidth = 31750
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      BeforePrint = ppDetailBand10BeforePrint
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object rbdbeClasse: TppDBText
        UserName = 'rbdbeClasse'
        DataField = 'CLASSE'
        DataPipeline = ppRazaoPatAux
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 33073
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        AutoSize = True
        DataField = 'DESCGRUPO'
        DataPipeline = ppRazaoPatAux
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4149
        mmLeft = 61383
        mmTop = 0
        mmWidth = 22648
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMANT'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 6615
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMAQUIS'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 10054
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMENT'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 16933
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText502'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMSAI'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 20373
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMBX'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 13494
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMATUAL'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 28310
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText501'
        BlankWhenZero = True
        DataField = 'VALDEPRECANT'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 6615
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VALDEPRECAQUIS'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 10054
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VALDEPRECENT'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 16933
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VALDEPRECSAI'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 20373
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'VALDEPRECBX'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 13494
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VALDEPRECATUAL'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 28310
        mmWidth = 24077
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 33337
        mmWidth = 197379
        BandType = 4
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        AutoSize = False
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 529
        mmTop = 6615
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Aquisições no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 529
        mmTop = 10054
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Baixas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 13494
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Transf. p/ este Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 16933
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Transf. deste Grupo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 20373
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Depreciação no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 23813
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 529
        mmTop = 28310
        mmWidth = 36248
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 5027
        mmWidth = 197379
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VALDEPRECPER'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 23813
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText503'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMANT2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 6615
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMAQUIS2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 10054
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMBX2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 13494
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMENT2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 16933
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMSAI2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 20373
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        BlankWhenZero = True
        DataField = 'VALCUSTOCMATUAL2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 28310
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        BlankWhenZero = True
        DataField = 'VALDEPRECANT2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 6615
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        BlankWhenZero = True
        DataField = 'VALDEPRECAQUIS2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 10054
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        BlankWhenZero = True
        DataField = 'VALDEPRECBX2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 13494
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        BlankWhenZero = True
        DataField = 'VALDEPRECENT2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 16933
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        BlankWhenZero = True
        DataField = 'VALDEPRECSAI2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 20373
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        BlankWhenZero = True
        DataField = 'VALDEPRECPER2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 23813
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText101'
        BlankWhenZero = True
        DataField = 'VALDEPRECATUAL2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 28310
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText504'
        BlankWhenZero = True
        DataField = 'VALCUSTOANT'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 6615
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'VALCUSTOAQUIS'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 10054
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        BlankWhenZero = True
        DataField = 'VALCUSTOBX'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 13494
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        BlankWhenZero = True
        DataField = 'VALCUSTOENT'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 16933
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        BlankWhenZero = True
        DataField = 'VALCUSTOSAI'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 20373
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        BlankWhenZero = True
        DataField = 'VALCUSTOATUAL'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 28310
        mmWidth = 24077
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'GRUPO CONTÁBIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 32427
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 794
        mmWidth = 26458
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 794
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
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
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Saldo Atual da Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 529
        mmTop = 529
        mmWidth = 36777
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 5291
        mmWidth = 197379
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALCUSTOATUAL'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 529
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALCUSTOCMATUAL'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 529
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VALDEPRECATUAL'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 529
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VALCUSTOCMATUAL2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 529
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VALDEPRECATUAL2'
        DataPipeline = ppRazaoPatAux
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 529
        mmWidth = 24077
        BandType = 7
      end
    end
  end
  object cdsMovPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 22
  end
  object sqlMovPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       (0.00) AS VALCUSTOANT,'
      '       (0.00) AS VALCUSTOCMANT,'
      '       (0.00) AS VALDEPRECANT,'
      '       (0.00) AS VALCUSTOCMANT2,'
      '       (0.00) AS VALDEPRECANT2,'
      ''
      '       (0.00) AS VALCUSTOAQUIS,'
      '       (0.00) AS VALCUSTOCMAQUIS,'
      '       (0.00) AS VALDEPRECAQUIS,'
      '       (0.00) AS VALCUSTOCMAQUIS2,'
      '       (0.00) AS VALDEPRECAQUIS2,'
      ''
      '       (0.00) AS VALCUSTOBX,'
      '       (0.00) AS VALCUSTOCMBX,'
      '       (0.00) AS VALDEPRECBX,'
      '       (0.00) AS VALCUSTOCMBX2,'
      '       (0.00) AS VALDEPRECBX2,'
      ''
      '       (0.00) AS VALCUSTOENT,'
      '       (0.00) AS VALCUSTOCMENT,'
      '       (0.00) AS VALDEPRECENT,'
      '       (0.00) AS VALCUSTOCMENT2,'
      '       (0.00) AS VALDEPRECENT2,'
      ''
      '       (0.00) AS VALCUSTOSAI,'
      '       (0.00) AS VALCUSTOCMSAI,'
      '       (0.00) AS VALDEPRECSAI,'
      '       (0.00) AS VALCUSTOCMSAI2,'
      '       (0.00) AS VALDEPRECSAI2,'
      ''
      '       (0.00) AS VALDEPRECPER,'
      '       (0.00) AS VALDEPRECPER2,'
      ''
      '       (0.00) AS VALCUSTOATUAL,'
      '       (0.00) AS VALCUSTOCMATUAL,'
      '       (0.00) AS VALDEPRECATUAL,'
      '       (0.00) AS VALCUSTOCMATUAL2,'
      '       (0.00) AS VALDEPRECATUAL2'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE PG.IDPESSOA = :IDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsMovPatAux
    Left = 304
    Top = 8
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 48
    Top = 64
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 80
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 128
    Top = 64
  end
  object cdsGrpAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 160
  end
  object sqlGrpAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ SCB1.IDGRUPO,'
      
        '       ROUND(SUM(NVL(SCB1.VALORG, 0) + NVL(SCB1.REAVVALORG, 0) +' +
        ' NVL(SCB1.ULTREAVVALORG, 0)), 2) AS VALORG0,'
      
        '       ROUND(SUM(NVL(SCB1.VALORG, 0) + NVL(SCB1.REAVVALORG, 0) +' +
        ' NVL(SCB1.ULTREAVVALORG, 0) +'
      
        '                 NVL(SCB1.CMBEM, 0) + NVL(SCB1.REAVCMBEM, 0) + N' +
        'VL(SCB1.ULTREAVCMBEM, 0)), 2) AS VALORGCM0,'
      
        '       ROUND(SUM(NVL(SCD1.DEPLANC, 0) + NVL(SCD1.REAVDEPLANC, 0)' +
        ' + NVL(SCD1.ULTREAVDEPLANC, 0) +'
      
        '                 NVL(SCD1.CMDEP, 0) + NVL(SCD1.REAVCMDEP, 0) + N' +
        'VL(SCD1.ULTREAVCMDEP, 0)), 2) AS DEPLANC0'
      'FROM SALDOCONTABBEM SCB1,'
      '     SLDCTBBEMXDEP SCD1,'
      '     GRUPO G,'
      '     BEM B,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE DATASLDBEM <= :DATASLD'
      '        AND MOECODIGO = :MOECODIGO'
      '        AND IDPESSOA = :IDPESSOA'
      '        AND SALDOCONTABBEM."IDBEM" >= -1E38'
      '      GROUP BY IDBEM) DTAMAX'
      'WHERE B.IDPESSOA = :IDPESSOA'
      ''
      '  AND SCB1.IDPESSOA = :IDPESSOA'
      '  AND SCB1.MOECODIGO = :MOECODIGO'
      '  AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '  AND SCD1.MOECODIGO = :MOECODIGO'
      '  AND SCD1.IDPESSOA = :IDPESSOA'
      ''
      ''
      ''
      '  AND SCB1.IDBEM = DTAMAX.IDBEM'
      '  AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '  AND SCB1.IDBEM = SCD1.IDBEM'
      '  AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '  AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '  AND SCB1.DATASLDBEM = SCD1.DATASLDBEM'
      '  AND SCB1.IDGRUPO = G.IDGRUPO'
      '  AND SCB1.IDBEM = B.IDBEM'
      '  AND SCB1.IDPESSOA = B.IDPESSOA'
      'GROUP BY SCB1.IDGRUPO'
      '')
    ClientDataSet = cdsGrpAnaliticos
    Left = 40
    Top = 144
  end
  object cdsTransfPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 160
  end
  object sqlTransfPer: TCMSqlParams
    SQL.Strings = (
      'SELECT SC.IDGRUPO, HM.IDGRUPANT,'
      '       (SC.VALORG + SC.REAVVALORG + SC.ULTREAVVALORG) AS VALORG,'
      '       (SC.VALORG + SC.REAVVALORG + SC.ULTREAVVALORG +'
      '        SC.CMBEM + SC.REAVCMBEM + SC.ULTREAVCMBEM) AS VALORGCM,'
      
        '       (SD.DEPLANC + SD.REAVDEPLANC + SD.ULTREAVDEPLANC - NVL(FE' +
        'C.VALOR,0) +'
      '        SD.CMDEP + SD.REAVCMDEP + SD.ULTREAVCMDEP) AS DEPLANC'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     SALDOCONTABBEM SC,'
      '     SLDCTBBEMXDEP SD,'
      '     GRUPO G,'
      
        '     (SELECT /*+ RULE */ HM1.IDBEM, HM1.DATAMOVIMENTACAO, SUM(NV' +
        'L(VM.VALOR,0)) AS VALOR'
      '      FROM HISTORICOMOVIMENTACAO HM1, VLRHISTMOVBEM VM'
      '      WHERE HM1.DATAMOVIMENTACAO >= :DATAINI'
      '        AND HM1.DATAMOVIMENTACAO <= :DATAFIM'
      
        '        AND (HM1.IDTIPOMOVIMENTACAO = 14 OR HM1.IDTIPOMOVIMENTAC' +
        'AO = 18 OR HM1.IDTIPOMOVIMENTACAO = 35)'
      '        AND HM1.IDPESSOA = :IDPESSOA'
      '        AND HM1.TIPDEPPRORATA = 2'
      '        AND VM.MOECODIGO = :MOECODIGO'
      '        AND VM.IDTAXADEP = :IDTAXADEP'
      '        AND HM1.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      '      GROUP BY HM1.IDBEM, HM1.DATAMOVIMENTACAO) FEC'
      ''
      'WHERE HM.DATAMOVIMENTACAO >= :DATAINI'
      '  AND HM.DATAMOVIMENTACAO <= :DATAFIM'
      '  AND HM.IDTIPOMOVIMENTACAO = 05'
      ''
      ''
      ''
      ''
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND SC.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND SC.MOECODIGO = :MOECODIGO'
      '  AND SD.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '  AND SD.MOECODIGO = :MOECODIGO'
      '  AND HM.IDBEM = SC.IDBEM'
      '  AND HM.IDPESSOA = SC.IDPESSOA'
      '  AND HM.DATAMOVIMENTACAO = SC.DATASLDBEM'
      '  AND SC.IDBEM = SD.IDBEM'
      '  AND SC.IDPESSOA = SD.IDPESSOA'
      '  AND SC.DATASLDBEM = SD.DATASLDBEM'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '  AND SC.IDGRUPO = G.IDGRUPO'
      '  AND HM.IDBEM = FEC.IDBEM(+)'
      '  AND HM.DATAMOVIMENTACAO = FEC.DATAMOVIMENTACAO(+)'
      'ORDER BY SC.IDGRUPO, HM.IDGRUPANT'
      '')
    ClientDataSet = cdsTransfPer
    Left = 216
    Top = 144
  end
  object cdsMovPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 160
  end
  object sqlMovPer: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, HM.IDTIPOMOVIMENTACAO,'
      '       ROUND(SUM(NVL(VM.VALOR,0)), 2) AS SOMAVALOFI,'
      '       ROUND(SUM(NVL(VM2.VALOR,0)), 2) AS SOMAVALOFI2'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM,'
      '     VLRHISTMOVBEM VM2,'
      '     SALDOCONTABBEM SB,'
      '     BEM B,'
      '     PLANOGRUPO PG,'
      '     GRUPO G'
      ''
      
        'WHERE HM.DATAMOVIMENTACAO >= :DATAINI AND HM.DATAMOVIMENTACAO <=' +
        ' :DATAFIM'
      '  AND HM.IDTIPOMOVIMENTACAO <> 04'
      '  AND HM.IDTIPOMOVIMENTACAO <> 05'
      '  AND HM.IDTIPOMOVIMENTACAO <> 11'
      '  AND HM.IDTIPOMOVIMENTACAO <> 12'
      ''
      ''
      ''
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND VM.IDTAXADEP = :IDTAXADEP'
      '  AND VM2.MOECODIGO = :MOECODIGO2'
      '  AND VM2.IDTAXADEP = :IDTAXADEP'
      '  AND SB.MOECODIGO = :MOECODIGO'
      '  AND SB.IDPESSOA = :IDPESSOA'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      '  AND HM.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+)'
      '  AND HM.IDBEM = SB.IDBEM'
      '  AND HM.IDPESSOA = SB.IDPESSOA'
      '  AND HM.DATAMOVIMENTACAO = SB.DATASLDBEM'
      '  AND SB.IDBEM = B.IDBEM'
      '  AND SB.IDPESSOA = B.IDPESSOA'
      '  AND SB.IDGRUPO = PG.IDGRUPO'
      '  AND SB.IDPESSOA = PG.IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      ''
      'GROUP BY SB.IDGRUPO, HM.IDTIPOMOVIMENTACAO'
      'ORDER BY SB.IDGRUPO, HM.IDTIPOMOVIMENTACAO'
      '')
    ClientDataSet = cdsMovPer
    Left = 128
    Top = 144
  end
end
