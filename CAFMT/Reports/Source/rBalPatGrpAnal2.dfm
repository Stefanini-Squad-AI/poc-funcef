inherited RptBalPatGrpAnal2: TRptBalPatGrpAnal2
  Left = 258
  Top = 142
  Width = 452
  Height = 461
  Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Periodo Atualizado até'
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
        Caption = 'Grupo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE'
          '')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
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
        Caption = 'Incluir Bens com Controle Físico'
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
        Caption = 'Exclui Grupos Contábeis Analíticos'
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
        Caption = 'Incluir Bens Baixados'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBalPatGrpAnal2
    LabelEmpresa = LblEmpresa
    LabelSistema = LBLSISTEMA
  end
  object cdsClasAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 96
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 168
  end
  object sqlClasAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME,'
      '       G.TIPO,'
      '       CB.CODHIERARQ,'
      '       CB.DESCRICAO,'
      '       CB.ANASINT,'
      '       COUNT(*) AS QUANT,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.REAVVALORG,0) + NVL(S' +
        'B.ULTREAVVALORG,0)),2)      AS VALORG0,'
      
        '       ROUND(SUM(NVL(SB.CMBEM,0) + NVL(SB.REAVCMBEM,0) + NVL(SB.' +
        'ULTREAVCMBEM,0)),2)         AS CMBEM0,'
      
        '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.REAVDEPLANC,0) + NVL' +
        '(SB.ULTREAVDEPLANC,0)),2)   AS DEPLANC0,'
      
        '       ROUND(SUM(NVL(SB.CMDEP,0) + NVL(SB.REAVCMDEP,0) + NVL(SB.' +
        'ULTREAVCMDEP,0)),2)         AS CMDEP0,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEP' +
        'LANC,0) - NVL(SB.CMDEP,0) +'
      '                 NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) -'
      '                 NVL(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') -'
      
        '                 NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,' +
        '0)),2)                      AS VALCTB0'
      ''
      'FROM (SELECT SCB.IDPESSOA, SCB.IDBEM,       SCB.DATASLDBEM,'
      '             SCB.VALORG,   SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,    SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC,  SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,    SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM, IDPESSOA) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      
        '        AND (SCB.IDBEM = DTAMAX.IDBEM) AND (SCB.IDPESSOA = DTAMA' +
        'X.IDPESSOA) ) SB,'
      ''
      '     BEM B, CLASSEDEBEM CB, GRUPO G'
      ''
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (G.FLGIMOVEL = 0)'
      ''
      ''
      ''
      '  AND (B.IDCLASSEBEM = CB.IDCLASSEBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (B.IDPESSOA = SB.IDPESSOA)'
      
        'GROUP BY G.IDGRUPO, G.CLASSE, G.NOME, G.TIPO, CB.CODHIERARQ, CB.' +
        'DESCRICAO, CB.ANASINT'
      '')
    ClientDataSet = cdsClasAnaliticos
    Left = 104
    Top = 96
  end
  object sqlGrpSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO, CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'S'#39')'
      'ORDER BY CLASSE')
    ClientDataSet = cdsGrpSinteticos
    Left = 112
    Top = 168
  end
  object cdsBalPatClas1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLASSE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODHIERARQ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 59
      end
      item
        Name = 'ANASINT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
      end
      item
        Name = 'VALORG'
        DataType = ftFloat
      end
      item
        Name = 'CMBEM'
        DataType = ftFloat
      end
      item
        Name = 'DEPLANC'
        DataType = ftFloat
      end
      item
        Name = 'CMDEP'
        DataType = ftFloat
      end
      item
        Name = 'VALCTB'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'CLASSE;CODHIERARQ'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CLASSE;CODHIERARQ'
    Params = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 280
    Top = 16
  end
  object sqlBalPatClas1: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME,'
      '       G.TIPO,'
      '       C.CODHIERARQ,'
      '       C.DESCRICAO,'
      '       C.ANASINT,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE (G.IDGRUPO = -1)'
      'ORDER BY G.CLASSE, C.CODHIERARQ'
      ''
      ' ')
    ClientDataSet = cdsBalPatClas1
    Left = 368
    Top = 16
  end
  object sqlBalPatClas2: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME,'
      '       G.TIPO,'
      '       C.CODHIERARQ,'
      '       C.DESCRICAO,'
      '       C.ANASINT,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE (G.IDGRUPO = -1)'
      'ORDER BY G.CLASSE, C.CODHIERARQ'
      ''
      ' ')
    ClientDataSet = cdsBalPatClas2
    Left = 368
    Top = 72
  end
  object sqlBalPatClas3: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME,'
      '       G.TIPO,'
      '       C.CODHIERARQ,'
      '       C.DESCRICAO,'
      '       C.ANASINT,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE (G.IDGRUPO = -1)'
      'ORDER BY G.CLASSE, C.CODHIERARQ')
    ClientDataSet = cdsBalPatClas3
    Left = 368
    Top = 120
  end
  object sqlBalPatClas: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME,'
      '       G.TIPO,'
      '       C.CODHIERARQ,'
      '       C.DESCRICAO,'
      '       C.ANASINT,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE (G.IDGRUPO = -1)'
      'ORDER BY G.CLASSE, C.CODHIERARQ')
    ClientDataSet = cdsBalPatClas
    Left = 368
    Top = 168
  end
  object cdsBalPatClas: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLASSE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODHIERARQ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 59
      end
      item
        Name = 'ANASINT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
      end
      item
        Name = 'VALORG'
        DataType = ftFloat
      end
      item
        Name = 'CMBEM'
        DataType = ftFloat
      end
      item
        Name = 'DEPLANC'
        DataType = ftFloat
      end
      item
        Name = 'CMDEP'
        DataType = ftFloat
      end
      item
        Name = 'VALCTB'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'CLASSE;CODHIERARQ'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CLASSE;CODHIERARQ'
    Params = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 280
    Top = 168
  end
  object cdsBalPatClas3: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLASSE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODHIERARQ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 59
      end
      item
        Name = 'ANASINT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
      end
      item
        Name = 'VALORG'
        DataType = ftFloat
      end
      item
        Name = 'CMBEM'
        DataType = ftFloat
      end
      item
        Name = 'DEPLANC'
        DataType = ftFloat
      end
      item
        Name = 'CMDEP'
        DataType = ftFloat
      end
      item
        Name = 'VALCTB'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'CLASSE;CODHIERARQ'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CLASSE;CODHIERARQ'
    Params = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 280
    Top = 120
  end
  object cdsBalPatClas2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLASSE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODHIERARQ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 59
      end
      item
        Name = 'ANASINT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
      end
      item
        Name = 'VALORG'
        DataType = ftFloat
      end
      item
        Name = 'CMBEM'
        DataType = ftFloat
      end
      item
        Name = 'DEPLANC'
        DataType = ftFloat
      end
      item
        Name = 'CMDEP'
        DataType = ftFloat
      end
      item
        Name = 'VALCTB'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'CLASSE;CODHIERARQ'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CLASSE;CODHIERARQ'
    Params = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 280
    Top = 72
  end
  object sqlParamCaf: TCMSqlParams
    ClientDataSet = cdsParamCaf
    Left = 120
    Top = 232
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 232
  end
  object cdsBalPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 278
    Top = 232
  end
  object sqlContaSemCC: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACONTA, CODCENTROCUSTO, IDEMPRESA'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO              = :IDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO   = :IDTIPOMOVIMENTACAO)'
      '  AND (TIPOLANCAMENTO       = :TIPOLANCAMENTO)'
      '  AND (PLANO                = :PLANO)'
      '  AND (IDPESSOA             = :IDPESSOA)'
      '')
    ClientDataSet = cdsContaSemCC
    Left = 192
    Top = 96
  end
  object cdsContaSemCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 168
  end
  object sqlBalPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       ('#39'                  '#39') AS PLACONTA,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'WHERE (CODHIERARQ IS NULL)'
      '')
    ClientDataSet = cdsBalPatAux
    Left = 368
    Top = 232
  end
  object rpBalPatGrpAnal2: TppReport
    AutoStop = False
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 3810
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBalPatGrpAnal2BeforePrint
    DeviceType = 'Screen'
    Left = 220
    Top = 3
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel76: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78581
        mmTop = 8467
        mmWidth = 129646
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 286967
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127794
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 19315
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Descrição Grupo / Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 19315
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 19315
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 236273
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'rpBalPatClasLabel1'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 251884
        mmTop = 19315
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174096
        mmTop = 19315
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 227542
        mmTop = 9525
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 258763
        mmTop = 9525
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      BeforePrint = ppDetailBand4BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText101: TppDBText
        UserName = 'ppDBText101'
        DataField = 'CODHIERARQ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'ppDBText102'
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 0
        mmWidth = 117475
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'ppDBText106'
        BlankWhenZero = True
        DataField = 'VALORG'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 214313
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'ppDBText103'
        DataField = 'S_A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'ppDBText104'
        DataField = 'QUANT'
        DisplayFormat = '#0;(#0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156104
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'ppDBText107'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 247915
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'ppDBText105'
        DataField = 'PLACONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174096
        mmTop = 0
        mmWidth = 36513
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine21: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 286967
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1058
        mmWidth = 23548
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc3'
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
        mmTop = 1058
        mmWidth = 39158
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSoma11: TppVariable
        UserName = 'ppSoma11'
        AutoSize = False
        CalcOrder = 0
        DataType = dtInteger
        DisplayFormat = '#0;(#0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156104
        mmTop = 1058
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel110: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
      object ppLine22: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 286967
        BandType = 7
      end
      object ppSoma12: TppVariable
        UserName = 'ppSoma12'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 216165
        mmTop = 1058
        mmWidth = 29369
        BandType = 7
      end
      object ppSoma13: TppVariable
        UserName = 'ppSoma13'
        AutoSize = False
        CalcOrder = 2
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 248709
        mmTop = 1058
        mmWidth = 30427
        BandType = 7
      end
    end
  end
  object ppBalPatGrpAnal2: TppBDEPipeline
    DataSource = dsBalPatGrpAnal2
    UserName = 'BalPatClas1'
    Left = 60
    Top = 47
    object ppBalPatGrpAnal2ppField1: TppField
      FieldAlias = 'CODHIERARQ'
      FieldName = 'CODHIERARQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField3: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField4: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField5: TppField
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField6: TppField
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField7: TppField
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField8: TppField
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 8
    end
    object ppBalPatGrpAnal2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object dsBalPatGrpAnal2: TwwDataSource
    DataSet = cdsBalPatGrpAnal2
    Left = 52
    Top = 371
  end
  object sqlBalPatGrpAnal2: TCMSqlParams
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       ('#39'                  '#39') AS PLACONTA,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'WHERE (CODHIERARQ IS NULL)'
      '')
    ClientDataSet = cdsBalPatGrpAnal2
    Left = 152
    Top = 376
  end
  object cdsBalPatGrpAnal2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 376
  end
end
