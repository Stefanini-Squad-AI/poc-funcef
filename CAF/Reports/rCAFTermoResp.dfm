inherited RptCAFTermoResp: TRptCAFTermoResp
  Left = 510
  Top = 171
  Width = 281
  Height = 216
  Caption = 'Termo de Responsabilidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Termo de Responsabilidade'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = ' Bens Ordenados por '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Placa Tombamento'
          'Descrição')
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
        Caption = ' Exibir Valores ? '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Não'
          'Sim')
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
        Caption = 'Localização'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, IDLOCALIZACAO'
          'FROM LOCALIZACAO'
          'ORDER BY NOME'
          '')
        LookupSettings.Chave = 'IDLOCALIZACAO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '45'
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
        Caption = 'Responsável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME'
          '')
        LookupSettings.Chave = 'IDRESPONSAVEL'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Nome'
        LookupSettings.Tamanho = '60'
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
        Caption = 'Conjunto'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCCONJUNTO, IDCONJUNTO'
          'FROM CONJUNTO'
          'ORDER BY DESCCONJUNTO')
        LookupSettings.Chave = 'IDCONJUNTO'
        LookupSettings.Display = 'DESCCONJUNTO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '60'
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
        Caption = 'Placa de Tombamento'
        Controle = tcMontaSelect
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
        MontaSelect = MSBem
        Width = 0
      end
      item
        Caption = 'Individual'
        Controle = tcCheckBox
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
        Caption = 'NumeroTermo'
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
    Formheight = 280
    FormWidth = 440
    Left = 20
    Top = 12
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpTermoResp
    LabelEmpresa = ppLabel7
    LabelSistema = ppLabel79
  end
  object sqlTermoResp: TCMSqlParams
    SQL.Strings = (
      'SELECT L.NOME AS DESCLOCAL,P.NOME AS NOMERESP,'
      
        '       TA.DESCTIPOAREA,B.PLACA,B.DESBEM,C.IDRESPONSAVEL, C.IDLOC' +
        'ALIZACAO,'
      '       SB.VALORG, SB.SALDOCONTAB'
      'FROM BEM         B, CLASSEDEBEM CL,'
      '     CONJUNTO    C,'
      '     LOCALIZACAO L,'
      '     TIPOAREA    TA,'
      '     RESPONSAVEL R,'
      '     PESSOA      P,'
      
        '     (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG,'
      
        '             (SCB1.VALORG  + SCB1.REAVVALORG  + SCB1.ULTREAVVALO' +
        'RG +'
      
        '              SCB1.CMBEM   + SCB1.REAVCMBEM   + SCB1.ULTREAVCMBE' +
        'M -'
      
        '              SCD1.DEPLANC - SCD1.REAVDEPLANC - SCD1.ULTREAVDEPL' +
        'ANC -'
      
        '              SCD1.CMDEP   - SCD1.REAVCMDEP   - SCD1.ULTREAVCMDE' +
        'P) AS SALDOCONTAB'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND :MOECODIGO = MOECODIGO'
      '              AND :IDPESSOA = IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE :IDTAXADEP = SCD1.IDSLDCTBBEMXDEP'
      '        AND :MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND :IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '        AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCD1.IDBEM = DTAMAX.IDBEM) SB'
      ''
      'WHERE B.BAIXATOTAL <> '#39'S'#39
      ''
      ''
      ''
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND C.IDPESSOA = B.IDPESSOA'
      '  AND C.IDCONJUNTO = B.IDCONJUNTO'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      '  AND L.IDTIPOAREA = TA.IDTIPOAREA'
      '  AND C.IDRESPONSAVEL = R.IDRESPONSAVEL'
      '  AND P.IDPESSOA = R.IDRESPONSAVEL'
      '  AND B.IDBEM = SB.IDBEM'
      '  AND B.IDPESSOA = SB.IDPESSOA'
      '  AND CL.IDCLASSEBEM = B.IDCLASSEBEM'
      '  AND CL.FLGINVENTARIOTI = :FLGINVENTARIOTI'
      'ORDER BY C.IDRESPONSAVEL, C.IDLOCALIZACAO, B.PLACA, B.DESBEM')
    ClientDataSet = cdsTermoResp
    Left = 216
    Top = 61
  end
  object cdsTermoResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 48
  end
  object dsTermoResp: TwwDataSource
    DataSet = cdsTermoResp
    Left = 216
    Top = 35
  end
  object ppTermoResp: TppBDEPipeline
    DataSource = dsTermoResp
    UserName = 'TermoResp'
    Left = 215
    Top = 22
    object ppTermoppField1: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppTermoppField2: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppTermoppField3: TppField
      FieldAlias = 'DESCTIPOAREA'
      FieldName = 'DESCTIPOAREA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppTermoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppTermoppField5: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 4
    end
    object ppTermoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppTermoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCONTAB'
      FieldName = 'SALDOCONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object rpTermoResp: TppReport
    AutoStop = False
    DataPipeline = ppTermoResp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 10
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTermoResp'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        AutoSize = False
        Caption = 'Termo de Responsabilidade / Ítens de Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
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
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpTermoDBText4: TppDBText
        UserName = 'rpTermoDBText4'
        DataField = 'PLACA'
        DataPipeline = ppTermoResp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppTermoResp'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'ppDBText57'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppTermoResp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTermoResp'
        mmHeight = 4233
        mmLeft = 143669
        mmTop = 1058
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        BlankWhenZero = True
        DataField = 'SALDOCONTAB'
        DataPipeline = ppTermoResp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTermoResp'
        mmHeight = 4233
        mmLeft = 170921
        mmTop = 1058
        mmWidth = 25929
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'ppDBMemo3'
        KeepTogether = True
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppTermoResp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppTermoResp'
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 1058
        mmWidth = 117475
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'ppLine22'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel79: TppLabel
        UserName = 'ppLabel79'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 80963
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 81756
        mmTop = 1588
        mmWidth = 33867
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 1588
        mmWidth = 35454
        BandType = 8
      end
    end
    object rpTermoGroup1: TppGroup
      BreakName = 'DESCLOCAL'
      DataPipeline = ppTermoResp
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'rpTermoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTermoResp'
      object rpTermoGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 107421
        mmPrintPosition = 0
        object rpTermoLabel1: TppLabel
          UserName = 'rpTermoLabel1'
          Caption = 'Localização dos Bens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 21431
          mmWidth = 44715
          BandType = 3
          GroupNo = 0
        end
        object rpTermoDBText1: TppDBText
          UserName = 'rpTermoDBText1'
          DataField = 'DESCLOCAL'
          DataPipeline = ppTermoResp
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTermoResp'
          mmHeight = 4763
          mmLeft = 4498
          mmTop = 26194
          mmWidth = 188119
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLabel2: TppLabel
          UserName = 'rpTermoLabel2'
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 35190
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpTermoDBText3: TppDBText
          UserName = 'rpTermoDBText3'
          DataField = 'DESCTIPOAREA'
          DataPipeline = ppTermoResp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTermoResp'
          mmHeight = 4763
          mmLeft = 4498
          mmTop = 39952
          mmWidth = 188119
          BandType = 3
          GroupNo = 0
        end
        object rpTextodoTermo: TppMemo
          UserName = 'rpTextodoTermo'
          Caption = 'rpTextodoTermo'
          CharWrap = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Lines.Strings = (
            
              'Declaro para os devidos fins de direito que os bens abaixo relac' +
              'ionados,  encontram-se  em  plenas condições de uso, responsabil' +
              'izando-me pela guarda e manuseio dos mesmos, sendo que em caso d' +
              'e perdas ou extravios, ocasionado por mau uso ou imprudência, se' +
              'rá submetido a apreciação para as providências cabíveis.'
            
              'Comprometo-me também que qualquer movimentação dos bens será com' +
              'unicada imediatamente ao Departamento de Patrimônio através de d' +
              'ocumento próprio.')
          Stretch = True
          TextAlignment = taFullJustified
          Transparent = True
          mmHeight = 33338
          mmLeft = 4498
          mmTop = 51594
          mmWidth = 188119
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpTermoLine1: TppLine
          UserName = 'rpTermoLine1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 2117
          mmLeft = 0
          mmTop = 99484
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLine2: TppLine
          UserName = 'rpTermoLine2'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 106363
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLabel4: TppLabel
          UserName = 'rpTermoLabel4'
          Caption = 'Tombamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 101071
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLabel5: TppLabel
          UserName = 'rpTermoLabel5'
          Caption = 'Descrição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 24606
          mmTop = 101071
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel126: TppLabel
          UserName = 'ppLabel126'
          Caption = 'Aquisição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 152665
          mmTop = 101071
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel127: TppLabel
          UserName = 'ppLabel127'
          Caption = 'Saldo Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 171980
          mmTop = 101071
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLblNumeroTermo: TppLabel
          UserName = 'LblNumeroTermo'
          Caption = 'Número do Termo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4995
          mmLeft = 4763
          mmTop = 9525
          mmWidth = 39116
          BandType = 3
          GroupNo = 0
        end
        object ppNumeroTermo: TppLabel
          UserName = 'NumeroTermo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5038
          mmLeft = 43656
          mmTop = 9525
          mmWidth = 44704
          BandType = 3
          GroupNo = 0
        end
      end
      object rpTermoGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 47096
        mmPrintPosition = 0
        object rpTermoLine3: TppLine
          UserName = 'rpTermoLine3'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLabel3: TppLabel
          UserName = 'rpTermoLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 8996
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpTermoDBText2: TppDBText
          UserName = 'rpTermoDBText2'
          DataField = 'NOMERESP'
          DataPipeline = ppTermoResp
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTermoResp'
          mmHeight = 4763
          mmLeft = 4498
          mmTop = 13758
          mmWidth = 190500
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLabel6: TppLabel
          UserName = 'rpTermoLabel6'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 22490
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLine4: TppLine
          UserName = 'rpTermoLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 4498
          mmTop = 35719
          mmWidth = 93927
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLabel7: TppLabel
          UserName = 'rpTermoLabel7'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 106363
          mmTop = 22490
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLine5: TppLine
          UserName = 'rpTermoLine5'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 106363
          mmTop = 35719
          mmWidth = 45244
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 72
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 24
    Top = 56
  end
  object MSBem: TMontaSelect
    Tag = 5
    Template.IdConsulta = 0
    Caption = 'Selecione o Termo'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.DESBEM')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Nr. Tombamento'
      'Descrição do Bem')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'BEM')
    CamposChave.Strings = (
      'BEM.PLACA'
      'BEM.IDBEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 104
    Top = 64
  end
end
