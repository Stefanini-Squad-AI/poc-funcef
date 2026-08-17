inherited RptCAFMovPatGrpA: TRptCAFMovPatGrpA
  Left = 238
  Top = 195
  Width = 370
  Height = 245
  Caption = 'Movimento Patrimonial por Grupo Contábil - Analítico'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sqlMovPatGrpA: TCMSqlParams [0]
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0.00) AS SALDOANTERIOR,'
      '       (0.00) AS VALCUSTOANT,'
      '       (0.00) AS VALCUSTOAQUIS,'
      '       (0.00) AS VALCUSTOENT,'
      '       (0.00) AS VALCUSTOSAI,'
      '       (0.00) AS VALCUSTOBX,'
      '       (0.00) AS VALCUSTOATUAL,'
      '       (0.00) AS VALDEPRECANT,'
      '       (0.00) AS VALDEPRECAQUIS,'
      '       (0.00) AS VALDEPRECENT,'
      '       (0.00) AS VALDEPRECSAI,'
      '       (0.00) AS VALDEPRECBX,'
      '       (0.00) AS VALDEPRECATUAL,'
      '       (0.00) AS SALDOATUAL'
      'FROM GRUPO'
      'WHERE (IDGRUPO IS NULL)'
      'ORDER BY CLASSE'
      ''
      ' '
      ' ')
    ClientDataSet = cdsMovPatGrpA
    Left = 216
    Top = 63
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimentação Patrimonial por Grupo Contábil - Analítico'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Data Inicial'
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
      end
      item
        Caption = 'Exibe Bens Baixados'
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
        Caption = 'Exibe os Grupos sem Valor'
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
      end
      item
        Caption = 'Somente Grupos Sintéticos'
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
      end
      item
        Caption = ' Processar '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Não Depreciáveis'
          'Parcialmente Depreciados'
          'Totalmente Depreciados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 56
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
    Formheight = 354
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMovPatGrpA
    LabelEmpresa = ppLabel70
    LabelSistema = ppLabel81
  end
  object cdsGrpAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 160
  end
  object sqlGrpAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT SCB.IDGRUPO, SCB.IDPESSOA,'
      
        '       ROUND(SUM(NVL(SCB.VALORG,0) + NVL(SCB.REAVVALORG,0) + NVL' +
        '(SCB.ULTREAVVALORG,0) +'
      
        '                 NVL(SCB.CMBEM,0) + NVL(SCB.REAVCMBEM,0) + NVL(S' +
        'CB.ULTREAVCMBEM,0) ),2) AS VALORG0,'
      
        '       ROUND(SUM(NVL(SCB.DEPLANC,0) + NVL(SCB.REAVDEPLANC,0) + N' +
        'VL(SCB.ULTREAVDEPLANC,0) +'
      
        '                 NVL(SCB.CMDEP,0) + NVL(SCB.REAVCMDEP,0) + NVL(S' +
        'CB.ULTREAVCMDEP,0) ),2) AS DEPLANC0,'
      '       ROUND(SUM(NVL(SCB.VALORG,0) + NVL(SCB.CMBEM,0) -'
      '                 NVL(SCB.DEPLANC,0) - NVL(SCB.CMDEP,0) +'
      '                 NVL(SCB.REAVVALORG,0) + NVL(SCB.REAVCMBEM,0) -'
      '                 NVL(SCB.REAVDEPLANC,0) - NVL(SCB.REAVCMDEP,0) +'
      
        '                 NVL(SCB.ULTREAVVALORG,0) + NVL(SCB.ULTREAVCMBEM' +
        ',0) -'
      
        '                 NVL(SCB.ULTREAVDEPLANC,0) - NVL(SCB.ULTREAVCMDE' +
        'P,0) ),2) AS VALCTB0'
      'FROM GRUPO G,'
      '     (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE DATASLDBEM <= :DATASLD'
      '        AND :IDPESSOA = IDPESSOA'
      '        AND 1E38 >= -SALDOCONTABBEM."IDBEM"'
      '      GROUP BY IDBEM, IDPESSOA) MAX1,'
      '     SALDOCONTABBEM SCB, BEM B'
      'WHERE B.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      '  AND (B.FLGDEPREC = :PDEPREC OR B.FLGDEPREC = :PNOTDEPREC)'
      ''
      '  AND SCB.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND MAX1.DATA = SCB.DATASLDBEM'
      '  AND MAX1.IDBEM = SCB.IDBEM'
      '  AND MAX1.IDPESSOA = SCB.IDPESSOA'
      '  AND SCB.IDBEM = B.IDBEM'
      '  AND SCB.IDPESSOA = B.IDPESSOA'
      '  AND SCB.IDGRUPO = G.IDGRUPO'
      '  AND MAX1.IDPESSOA = :IDPESSOA'
      '  AND MAX1.IDBEM = B.IDBEM'
      '  AND MAX1.IDPESSOA = B.IDPESSOA'
      'GROUP BY SCB.IDGRUPO, SCB.IDPESSOA'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsGrpAnaliticos
    Left = 32
    Top = 144
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 160
  end
  object sqlGrpSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, G.IDGRUPO, PG.IDPESSOA'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.TIPO = '#39'S'#39')'
      ''
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDGRUPO = G.IDGRUPO)'
      'ORDER BY G.CLASSE'
      ''
      ' ')
    ClientDataSet = cdsGrpSinteticos
    Left = 272
    Top = 144
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA,SISTEMAS'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ClientDataSet = cdsParamCaf
    Left = 24
    Top = 64
  end
  object cdsTransfPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 160
  end
  object sqlTransfPer: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO,'
      '       HM.IDGRUPANT,'
      '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG +'
      '        SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM) AS VALORG,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC - NVL(FE' +
        'C.VALOR,0) +'
      '        SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP) AS DEPLANC'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     SALDOCONTABBEM SB,'
      '     GRUPO G, GRUPO GA,'
      
        '     (SELECT HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO, SUM(NVL' +
        '(HM.VALOFI,0)) AS VALOR'
      '      FROM HISTORICOMOVIMENTACAO HM'
      '      WHERE (HM.DATAMOVIMENTACAO >= :PDATAINI)'
      '        AND (HM.DATAMOVIMENTACAO <= :PDATAFIM)'
      
        '        AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTA' +
        'CAO = 18) OR (HM.IDTIPOMOVIMENTACAO = 35))'
      '        AND (HM.IDPESSOA  = :PIDPESSOA)'
      '        AND (HM.TIPDEPPRORATA = 2)'
      '      GROUP BY HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO) FEC'
      ''
      'WHERE (HM.DATAMOVIMENTACAO >= :PDATAINI)'
      '  AND (HM.DATAMOVIMENTACAO <= :PDATAFIM)'
      '  AND (HM.IDTIPOMOVIMENTACAO = 05)'
      '  AND (B.DATAINICIODEP <= :PDATAFIM)'
      ''
      ''
      ''
      ''
      '  AND ((B.FLGDEPREC = :PDEPREC) OR (B.FLGDEPREC = :PNOTDEPREC))'
      ''
      '  AND (HM.IDPESSOA         = :PIDPESSOA)'
      '  AND (SB.IDPESSOA         = :PIDPESSOA)'
      '  AND (B.IDPESSOA          = :PIDPESSOA)'
      '  AND (HM.IDBEM            = SB.IDBEM)'
      '  AND (HM.IDPESSOA         = SB.IDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO = SB.DATASLDBEM)'
      '  AND (HM.IDBEM            = B.IDBEM)'
      '  AND (HM.IDPESSOA         = B.IDPESSOA)'
      '  AND (SB.IDGRUPO          = G.IDGRUPO)'
      '  AND (HM.IDGRUPANT        = GA.IDGRUPO)'
      '  AND (HM.IDBEM            = FEC.IDBEM(+))'
      '  AND (HM.IDPESSOA         = FEC.IDPESSOA(+))'
      '  AND (HM.DATAMOVIMENTACAO = FEC.DATAMOVIMENTACAO(+))'
      'ORDER BY SB.IDGRUPO, HM.IDGRUPANT'
      ''
      ' ')
    ClientDataSet = cdsTransfPer
    Left = 184
    Top = 144
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND (PG.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (PG.DATAULTFEC IS NOT NULL)'
      '  AND (PG.IDGRUPO  = G.IDGRUPO)'
      ' ')
    ClientDataSet = cdsVerUltFec
    Left = 112
    Top = 64
  end
  object cdsMovPatGrpA: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 49
  end
  object dsMovPatGrpA: TwwDataSource
    DataSet = cdsMovPatGrpA
    Left = 216
    Top = 35
  end
  object ppMovPatGrpA: TppBDEPipeline
    DataSource = dsMovPatGrpA
    UserName = 'MovPatGrpA'
    Left = 216
    Top = 21
    object ppMovPatGrpAppField1: TppField
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField3: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField4: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField5: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField6: TppField
      FieldAlias = 'VALCUSTOANT'
      FieldName = 'VALCUSTOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField7: TppField
      FieldAlias = 'VALCUSTOAQUIS'
      FieldName = 'VALCUSTOAQUIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField8: TppField
      FieldAlias = 'VALCUSTOENT'
      FieldName = 'VALCUSTOENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField9: TppField
      FieldAlias = 'VALCUSTOSAI'
      FieldName = 'VALCUSTOSAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField10: TppField
      FieldAlias = 'VALCUSTOBX'
      FieldName = 'VALCUSTOBX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField11: TppField
      FieldAlias = 'VALCUSTOATUAL'
      FieldName = 'VALCUSTOATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField12: TppField
      FieldAlias = 'VALDEPRECANT'
      FieldName = 'VALDEPRECANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField13: TppField
      FieldAlias = 'VALDEPRECAQUIS'
      FieldName = 'VALDEPRECAQUIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField14: TppField
      FieldAlias = 'VALDEPRECENT'
      FieldName = 'VALDEPRECENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField15: TppField
      FieldAlias = 'VALDEPRECSAI'
      FieldName = 'VALDEPRECSAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField16: TppField
      FieldAlias = 'VALDEPRECBX'
      FieldName = 'VALDEPRECBX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField17: TppField
      FieldAlias = 'VALDEPRECATUAL'
      FieldName = 'VALDEPRECATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAppField18: TppField
      FieldAlias = 'SALDOATUAL'
      FieldName = 'SALDOATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object rpMovPatGrpA: TppReport
    AutoStop = False
    DataPipeline = ppMovPatGrpA
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
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
      mmHeight = 36777
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'Movimento Patrimonial por Grupo Contábil - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 75936
        mmTop = 7408
        mmWidth = 132292
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
        mmLeft = 128059
        mmTop = 794
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 27517
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 27517
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 75142
        mmTop = 27517
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 27517
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Custo Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120915
        mmTop = 27517
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Aquisição Per.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 140759
        mmTop = 27517
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171980
        mmTop = 27781
        mmWidth = 11113
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
        mmLeft = 104511
        mmTop = 20108
        mmWidth = 31750
        BandType = 0
      end
      object rbLabel80: TppLabel
        UserName = 'rbLabel80'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 137319
        mmTop = 20108
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLine1: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 36512
        mmWidth = 284427
        BandType = 0
      end
      object rbLabel82: TppLabel
        UserName = 'rbLabel82'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 163248
        mmTop = 20108
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
        mmLeft = 159809
        mmTop = 20108
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Saídas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 27781
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Baixas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 224103
        mmTop = 27781
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 269876
        mmTop = 27781
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Custo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 242623
        mmTop = 27781
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Depreciação Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112448
        mmTop = 32279
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Deprec. Per.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 32279
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Deprec. Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 239978
        mmTop = 32544
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        AutoSize = False
        Caption = 'INVESTIMENTOS IMOBILIÁRIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 109538
        mmTop = 14023
        mmWidth = 65352
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284427
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      BeforePrint = ppDetailBand10BeforePrint
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object rbdbeClasse: TppDBText
        UserName = 'rbdbeClasse'
        DataField = 'CLASSE'
        DataPipeline = ppMovPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'DESCGRUPO'
        DataPipeline = ppMovPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 17992
        mmTop = 529
        mmWidth = 55298
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        BlankWhenZero = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 82286
        mmTop = 529
        mmWidth = 27000
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'VALCUSTOANT'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 529
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        BlankWhenZero = True
        DataField = 'VALCUSTOAQUIS'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        BlankWhenZero = True
        DataField = 'VALCUSTOENT'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 529
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'ppDBText54'
        DataField = 'S_A'
        DataPipeline = ppMovPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText502'
        BlankWhenZero = True
        DataField = 'VALCUSTOSAI'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 183621
        mmTop = 529
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'VALCUSTOBX'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 208227
        mmTop = 529
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VALCUSTOATUAL'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 232834
        mmTop = 529
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'SALDOATUAL'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 257176
        mmTop = 529
        mmWidth = 27000
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText501'
        BlankWhenZero = True
        DataField = 'VALDEPRECANT'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VALDEPRECAQUIS'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VALDEPRECENT'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VALDEPRECSAI'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 183621
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'VALDEPRECBX'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 208227
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VALDEPRECATUAL'
        DataPipeline = ppMovPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 232834
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284427
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
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
        mmTop = 1852
        mmWidth = 23548
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
        mmLeft = 122502
        mmTop = 1852
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
        mmLeft = 258498
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsMovPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 24
  end
  object sqlMovPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       G.TIPO AS S_A,'
      '       (0.00) AS SALDOANTERIOR,'
      '       (0.00) AS VALCUSTOANT,'
      '       (0.00) AS VALCUSTOAQUIS,'
      '       (0.00) AS VALCUSTOENT,'
      '       (0.00) AS VALCUSTOSAI,'
      '       (0.00) AS VALCUSTOBX,'
      '       (0.00) AS VALCUSTOATUAL,'
      '       (0.00) AS VALDEPRECANT,'
      '       (0.00) AS VALDEPRECAQUIS,'
      '       (0.00) AS VALDEPRECENT,'
      '       (0.00) AS VALDEPRECSAI,'
      '       (0.00) AS VALDEPRECBX,'
      '       (0.00) AS VALDEPRECATUAL,'
      '       (0.00) AS SALDOATUAL'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (PG.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDGRUPO = G.IDGRUPO)'
      'ORDER BY G.CLASSE'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsMovPatAux
    Left = 296
    Top = 8
  end
  object cdsMovPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 160
  end
  object sqlMovPer: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, SB.IDPESSOA,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(HM.VALOFI,0),'
      
        '                                        03,NVL(HM.VALOFI,0),0)) ' +
        'AS VALCUSTOAQUIS,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0),'
      '                                        32,NVL(HM.VALOFI,0),'
      '                                        53,NVL(HM.VALOFI,0),'
      '                                        54,NVL(HM.VALOFI,0),'
      '                                        09,NVL(HM.VALOFI,0),'
      '                                        07,NVL(HM.VALOFI,0),'
      '                                        10,NVL(HM.VALOFI,0),'
      '                                        15,NVL(HM.VALOFI,0),'
      '                                        22,NVL(HM.VALOFI,0),'
      
        '                                        34,NVL(HM.VALOFI,0),0)) ' +
        'AS VALCUSTOENT,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,23,NVL(HM.VALOFI,0),'
      '                                        13,NVL(HM.VALOFI,0),'
      
        '                                        16,NVL(HM.VALOFI,0),0)) ' +
        'AS VALCUSTOSAI,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(HM.VALOFI,0),'
      '                                        20,NVL(HM.VALOFI,0),'
      '                                        70,NVL(HM.VALOFI,0),'
      '                                        37,NVL(HM.VALOFI,0),'
      '                                        25,NVL(HM.VALOFI,0),'
      '                                        28,NVL(HM.VALOFI,0),'
      
        '                                        38,NVL(HM.VALOFI,0),0)) ' +
        'AS VALCUSTOBX,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.VALOFI,0),'
      '                                        43,NVL(HM.VALOFI,0),'
      '                                        35,NVL(HM.VALOFI,0),'
      '                                        51,NVL(HM.VALOFI,0),'
      '                                        18,NVL(HM.VALOFI,0),'
      '                                        33,NVL(HM.VALOFI,0),'
      
        '                                        47,NVL(HM.VALOFI,0),0)) ' +
        'AS VALDEPRECPER,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,17,NVL(HM.VALOFI,0),'
      '                                        21,NVL(HM.VALOFI,0),'
      '                                        19,NVL(HM.VALOFI,0),'
      
        '                                        36,NVL(HM.VALOFI,0),0)) ' +
        'AS VALDEPRECENT,'
      
        '       (0)                                                      ' +
        'AS VALDEPRECSAI,'
      '       SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(HM.VALOFI,0),'
      '                                        27,NVL(HM.VALOFI,0),'
      '                                        71,NVL(HM.VALOFI,0),'
      '                                        39,NVL(HM.VALOFI,0),'
      '                                        26,NVL(HM.VALOFI,0),'
      '                                        29,NVL(HM.VALOFI,0),'
      
        '                                        40,NVL(HM.VALOFI,0),0)) ' +
        'AS VALDEPRECBX'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     GRUPO G,'
      '     SALDOCONTABBEM SB,'
      '     BEM B'
      
        'WHERE (HM.DATAMOVIMENTACAO >= :DATAINI AND HM.DATAMOVIMENTACAO <' +
        '= :DATASLD)'
      '  AND (HM.IDPESSOA = :IDPESSOA)'
      '  AND (SB.IDPESSOA = :IDPESSOA)'
      '  AND (B.DATAINICIODEP <= :DATASLD)'
      ''
      ''
      ''
      ''
      '  AND (B.FLGDEPREC = :PDEPREC OR B.FLGDEPREC = :PNOTDEPREC)'
      ''
      '  AND (HM.IDBEM = SB.IDBEM)'
      '  AND (HM.IDPESSOA = SB.IDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO = SB.DATASLDBEM)'
      '  AND (SB.IDBEM = B.IDBEM)'
      '  AND (SB.IDPESSOA = B.IDPESSOA)'
      '  AND (SB.IDGRUPO = G.IDGRUPO)'
      'GROUP BY SB.IDGRUPO, SB.IDPESSOA'
      ''
      ' '
      ' ')
    ClientDataSet = cdsMovPer
    Left = 112
    Top = 144
  end
end
