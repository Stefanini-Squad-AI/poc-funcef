inherited RptCAFMovPatGrpAxMov: TRptCAFMovPatGrpAxMov
  Left = 265
  Top = 171
  Width = 322
  Height = 245
  Caption = 'Movimento Patrimonial por Grupo Contábil x Tipo Movimento'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object sqlMovPatGrpAxMov: TCMSqlParams [0]
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       (0)  AS IDTIPOMOVIMENTACAO,'
      
        '       ('#39'                                        '#39') AS DESCTIPOM' +
        'OVIMENTACAO,'
      '       (0.00) AS SALDOANTERIOR,'
      '       (0.00) AS VALCUSTOANT,'
      '       (0.00) AS VALCUSTOENT,'
      '       (0.00) AS VALCUSTOSAI,'
      '       (0.00) AS VALCUSTOATUAL,'
      '       (0.00) AS VALDEPRECANT,'
      '       (0.00) AS VALDEPRECENT,'
      '       (0.00) AS VALDEPRECSAI,'
      '       (0.00) AS VALDEPRECATUAL,'
      '       (0.00) AS SALDOATUAL'
      'FROM GRUPO'
      'WHERE (IDGRUPO IS NULL)'
      'ORDER BY CLASSE, IDTIPOMOVIMENTACAO'
      ' '
      ' '
      ' ')
    ClientDataSet = cdsMovPatGrpAxMov
    Left = 232
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 354
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMovPatGrpAxMov
    LabelEmpresa = ppLabel70
    LabelSistema = ppLabel81
  end
  object cdsGrpAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 160
  end
  object sqlGrpAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, G.CLASSE,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0)        + NVL(SB.CMBEM,0)      ' +
        '  - NVL(SB.DEPLANC,0)        - NVL(SB.CMDEP,0) +'
      
        '                 NVL(SB.REAVVALORG,0)    + NVL(SB.REAVCMBEM,0)  ' +
        '  - NVL(SB.REAVDEPLANC,0)    - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') - NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,0)),2) AS VAL' +
        'CTB0,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.REAVVALORG,0) + NVL(S' +
        'B.ULTREAVVALORG,0) +'
      
        '                 NVL(SB.CMBEM,0)  + NVL(SB.REAVCMBEM,0)  + NVL(S' +
        'B.ULTREAVCMBEM,0)),2)     AS VALORG0,'
      
        '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.REAVDEPLANC,0) + NVL' +
        '(SB.ULTREAVDEPLANC,0) +'
      
        '                 NVL(SB.CMDEP,0)   + NVL(SB.REAVCMDEP,0)   + NVL' +
        '(SB.ULTREAVCMDEP,0)),2)   AS DEPLANC0'
      ''
      
        'FROM (SELECT SCB.IDGRUPO, SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBE' +
        'M,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '              AND (IDPESSOA = :PIDPESSOA)'
      '            GROUP BY IDBEM, IDPESSOA) DTAMAX'
      '      WHERE (SCB.IDBEM = DTAMAX.IDBEM)'
      '        AND (SCB.IDPESSOA = DTAMAX.IDPESSOA)'
      '        AND (SCB.DATASLDBEM = DTAMAX.DATA)) SB,'
      ''
      '     BEM B, GRUPO G'
      ''
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      ''
      ''
      ''
      ''
      '  AND ((B.FLGDEPREC = :PDEPREC) OR (B.FLGDEPREC = :PNOTDEPREC))'
      ''
      '  AND (SB.IDGRUPO  = G.IDGRUPO)'
      '  AND (SB.IDBEM    = B.IDBEM)'
      '  AND (SB.IDPESSOA = B.IDPESSOA)'
      'GROUP BY SB.IDGRUPO, G.CLASSE'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsGrpAnaliticos
    Left = 176
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
    Left = 96
    Top = 160
  end
  object sqlTransfPer: TCMSqlParams
    SQL.Strings = (
      'SELECT SC.IDGRUPO, G.CLASSE, G.NOME AS DESCGRUPO,'
      
        '       HM.IDGRUPANT, GA.CLASSE AS CLASSEANT, GA.NOME AS DESCGRUP' +
        'OANT,'
      '       (SC.VALORG + SC.REAVVALORG + SC.ULTREAVVALORG +'
      '        SC.CMBEM + SC.REAVCMBEM + SC.ULTREAVCMBEM) AS VALORG,'
      
        '       (SC.DEPLANC + SC.REAVDEPLANC + SC.ULTREAVDEPLANC - NVL(FE' +
        'C.VALOR,0) +'
      '        SC.CMDEP + SC.REAVCMDEP + SC.ULTREAVCMDEP) AS DEPLANC'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     SALDOCONTABBEM SC,'
      '     GRUPO G,'
      '     GRUPO GA,'
      
        '     (SELECT HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO, SUM(NVL' +
        '(HM.VALOFI,0)) AS VALOR'
      '      FROM HISTORICOMOVIMENTACAO HM'
      '      WHERE (HM.DATAMOVIMENTACAO >= :DATAINI)'
      '        AND (HM.DATAMOVIMENTACAO <= :DATAFIM)'
      
        '        AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTA' +
        'CAO = 18) OR (HM.IDTIPOMOVIMENTACAO = 35))'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.TIPDEPPRORATA = 2)'
      '      GROUP BY HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO) FEC'
      ''
      'WHERE (HM.DATAMOVIMENTACAO >= :DATAINI)'
      '  AND (HM.DATAMOVIMENTACAO <= :DATAFIM)'
      '  AND (HM.IDTIPOMOVIMENTACAO = 05)'
      '  AND (B.DATAINICIODEP <= :DATAFIM)'
      ''
      ''
      ''
      ''
      '  AND ((B.FLGDEPREC = :DEPREC) OR (B.FLGDEPREC = :NOTDEPREC))'
      ''
      '  AND (HM.IDPESSOA         = :IDPESSOA)'
      '  AND (SC.IDPESSOA         = :IDPESSOA)'
      '  AND (B.IDPESSOA          = :IDPESSOA)'
      '  AND (HM.IDBEM            = SC.IDBEM)'
      '  AND (HM.IDPESSOA         = SC.IDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO = SC.DATASLDBEM)'
      '  AND (HM.IDBEM            = B.IDBEM)'
      '  AND (HM.IDPESSOA         = B.IDPESSOA)'
      '  AND (SC.IDGRUPO          = G.IDGRUPO)'
      '  AND (HM.IDGRUPANT        = GA.IDGRUPO)'
      '  AND (HM.IDBEM            = FEC.IDBEM(+))'
      '  AND (HM.IDPESSOA         = FEC.IDPESSOA(+))'
      '  AND (HM.DATAMOVIMENTACAO = FEC.DATAMOVIMENTACAO(+))'
      'ORDER BY SC.IDGRUPO, HM.IDGRUPANT'
      ''
      ' ')
    ClientDataSet = cdsTransfPer
    Left = 96
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
      
        'WHERE ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (PG.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (PG.DATAULTFEC IS NOT NULL)'
      '  AND (PG.IDGRUPO  = G.IDGRUPO)'
      ' ')
    ClientDataSet = cdsVerUltFec
    Left = 112
    Top = 64
  end
  object cdsMovPatGrpAxMov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 49
  end
  object dsMovPatGrpAxMov: TwwDataSource
    DataSet = cdsMovPatGrpAxMov
    Left = 232
    Top = 35
  end
  object ppMovPatGrpAxMov: TppBDEPipeline
    DataSource = dsMovPatGrpAxMov
    UserName = 'MovPatGrpAxMov'
    Left = 232
    Top = 21
    object ppMovPatGrpAxMovppField1: TppField
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField3: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField4: TppField
      FieldAlias = 'IDTIPOMOVIMENTACAO'
      FieldName = 'IDTIPOMOVIMENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField5: TppField
      FieldAlias = 'DESCTIPOMOVIMENTACAO'
      FieldName = 'DESCTIPOMOVIMENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField6: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField7: TppField
      FieldAlias = 'VALCUSTOANT'
      FieldName = 'VALCUSTOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField8: TppField
      FieldAlias = 'VALCUSTOENT'
      FieldName = 'VALCUSTOENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField9: TppField
      FieldAlias = 'VALCUSTOSAI'
      FieldName = 'VALCUSTOSAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField10: TppField
      FieldAlias = 'VALCUSTOATUAL'
      FieldName = 'VALCUSTOATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField11: TppField
      FieldAlias = 'VALDEPRECANT'
      FieldName = 'VALDEPRECANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField12: TppField
      FieldAlias = 'VALDEPRECENT'
      FieldName = 'VALDEPRECENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField13: TppField
      FieldAlias = 'VALDEPRECSAI'
      FieldName = 'VALDEPRECSAI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField14: TppField
      FieldAlias = 'VALDEPRECATUAL'
      FieldName = 'VALDEPRECATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField15: TppField
      FieldAlias = 'SALDOATUAL'
      FieldName = 'SALDOATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField16: TppField
      FieldAlias = 'VALCUSTOENTPER'
      FieldName = 'VALCUSTOENTPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField17: TppField
      FieldAlias = 'VALCUSTOSAIPER'
      FieldName = 'VALCUSTOSAIPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField18: TppField
      FieldAlias = 'VALDEPRECENTPER'
      FieldName = 'VALDEPRECENTPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppMovPatGrpAxMovppField19: TppField
      FieldAlias = 'VALDEPRECSAIPER'
      FieldName = 'VALDEPRECSAIPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object rpMovPatGrpAxMov: TppReport
    AutoStop = False
    DataPipeline = ppMovPatGrpAxMov
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
    Left = 232
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
        Caption = 'Movimento Patrimonial por Grupo Contábil x Tipo Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 66411
        mmTop = 7408
        mmWidth = 151607
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
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175155
        mmTop = 26988
        mmWidth = 14023
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
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 227807
        mmTop = 26988
        mmWidth = 10848
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
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 168540
        mmTop = 32279
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'DEPRECIAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 183092
        mmTop = 32279
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 219605
        mmTop = 32279
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'DEPRECIAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 234157
        mmTop = 32279
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 127265
        mmTop = 27252
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 257969
        mmTop = 26988
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      BeforePrint = ppDetailBand10BeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCTIPOMOVIMENTACAO'
        DataPipeline = ppMovPatGrpAxMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 93927
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALCUSTOENT'
        DataPipeline = ppMovPatGrpAxMov
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154252
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALDEPRECENT'
        DataPipeline = ppMovPatGrpAxMov
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 179388
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VALCUSTOSAI'
        DataPipeline = ppMovPatGrpAxMov
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 205317
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VALDEPRECSAI'
        DataPipeline = ppMovPatGrpAxMov
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 230453
        mmTop = 0
        mmWidth = 24077
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
    object ppGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppMovPatGrpAxMov
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        AfterPrint = ppGroupHeaderBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rbdbeClasse: TppDBText
          UserName = 'rbdbeClasse'
          DataField = 'CLASSE'
          DataPipeline = ppMovPatGrpAxMov
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText48: TppDBText
          UserName = 'ppDBText48'
          DataField = 'DESCGRUPO'
          DataPipeline = ppMovPatGrpAxMov
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 0
          mmWidth = 87842
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4762
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALCUSTOENT'
          DataPipeline = ppMovPatGrpAxMov
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154252
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALCUSTOSAI'
          DataPipeline = ppMovPatGrpAxMov
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 205317
          mmTop = 265
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALDEPRECENT'
          DataPipeline = ppMovPatGrpAxMov
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 179388
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALDEPRECSAI'
          DataPipeline = ppMovPatGrpAxMov
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 230453
          mmTop = 265
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object rpedSaldoAtual: TppVariable
          UserName = 'rpedSaldoAtual'
          AutoSize = False
          CalcOrder = 0
          DataType = dtCurrency
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 257176
          mmTop = 265
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object rpedSaldoAnt: TppVariable
          UserName = 'rpedSaldoAnt'
          AutoSize = False
          CalcOrder = 1
          DataType = dtCurrency
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 126471
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4762
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsMovPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 160
  end
  object sqlMovPer: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, SB.IDGRUPO,'
      '       HM.IDTIPOMOVIMENTACAO,'
      '       TM.DESCTIPOMOVIMENTACAO,'
      '       ROUND(SUM(NVL(HM.VALOFI, 0)),2) AS SOMAVALOFI'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     SALDOCONTABBEM SB,'
      '     TIPOMOVIMENTACAO TM,'
      '     BEM B,'
      '     PLANOGRUPO PG,'
      '     GRUPO G'
      ''
      
        'WHERE ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DATAMOVIMENTACA' +
        'O <= :DATAFIM))'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 04)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 05)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 11)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 12)'
      ''
      ''
      ''
      ''
      '  AND ((B.FLGDEPREC = :DEPREC) OR (B.FLGDEPREC = :NOTDEPREC))'
      ''
      '  AND (HM.IDPESSOA = :IDPESSOA)'
      '  AND (SB.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (HM.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO)'
      '  AND (HM.IDBEM = SB.IDBEM)'
      '  AND (HM.IDPESSOA = SB.IDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO = SB.DATASLDBEM)'
      '  AND (SB.IDBEM = B.IDBEM)'
      '  AND (SB.IDPESSOA = B.IDPESSOA)'
      '  AND (SB.IDGRUPO = PG.IDGRUPO)'
      '  AND (SB.IDPESSOA = PG.IDPESSOA)'
      '  AND (PG.IDGRUPO = G.IDGRUPO)'
      ''
      
        'GROUP BY G.CLASSE, G.NOME, SB.IDGRUPO, HM.IDTIPOMOVIMENTACAO, TM' +
        '.DESCTIPOMOVIMENTACAO'
      
        'ORDER BY G.CLASSE, G.NOME, SB.IDGRUPO, HM.IDTIPOMOVIMENTACAO, TM' +
        '.DESCTIPOMOVIMENTACAO'
      ''
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsMovPer
    Left = 24
    Top = 144
  end
end
