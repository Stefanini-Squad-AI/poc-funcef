inherited RptCAFMovPatGrpA: TRptCAFMovPatGrpA
  Left = 224
  Top = 149
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
      'WHERE IDGRUPO IS NULL'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 290
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
      'SELECT /*+ RULE */ SB1.IDGRUPO, SB1.IDPESSOA, COUNT(*) AS QUANT,'
      
        '       ROUND(SUM(NVL(SB1.VALORG,0)  + NVL(SB1.REAVVALORG,0)  + N' +
        'VL(SB1.ULTREAVVALORG,0) +'
      
        '                 NVL(SB1.CMBEM,0)   + NVL(SB1.REAVCMBEM,0)   + N' +
        'VL(SB1.ULTREAVCMBEM,0)),2) AS VALORG0,'
      
        '       ROUND(SUM(NVL(SD1.DEPLANC,0) + NVL(SD1.REAVDEPLANC,0) + N' +
        'VL(SD1.ULTREAVDEPLANC,0) +'
      
        '                 NVL(SD1.CMDEP,0)   + NVL(SD1.REAVCMDEP,0)   + N' +
        'VL(SD1.ULTREAVCMDEP,0)),2) AS DEPLANC0,'
      '       ROUND(SUM(NVL(SB1.VALORG,0) + NVL(SB1.CMBEM,0) -'
      '                 NVL(SD1.DEPLANC,0) - NVL(SD1.CMDEP,0) +'
      '                 NVL(SB1.REAVVALORG,0) + NVL(SB1.REAVCMBEM,0) -'
      '                 NVL(SD1.REAVDEPLANC,0) - NVL(SD1.REAVCMDEP,0) +'
      
        '                 NVL(SB1.ULTREAVVALORG,0) + NVL(SB1.ULTREAVCMBEM' +
        ',0) -'
      
        '                 NVL(SD1.ULTREAVDEPLANC,0) - NVL(SD1.ULTREAVCMDE' +
        'P,0) ),2) AS VALCTB0'
      ''
      'FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '     (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE DATASLDBEM <= :DATASLD'
      '        AND MOECODIGO = :MOECODIGO'
      '        AND IDPESSOA = :IDPESSOA'
      '      GROUP BY IDBEM, IDPESSOA) MAX1,'
      '     BEM B1, GRUPO G1'
      'WHERE B1.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      '  AND SB1.MOECODIGO = :MOECODIGO'
      '  AND SB1.IDPESSOA = :IDPESSOA'
      '  AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '  AND B1.IDPESSOA = :IDPESSOA'
      '  AND SB1.IDBEM = MAX1.IDBEM'
      '  AND SB1.IDPESSOA = MAX1.IDPESSOA'
      '  AND SB1.DATASLDBEM = MAX1.DATA'
      '  AND SB1.IDBEM = SD1.IDBEM'
      '  AND SB1.IDPESSOA = SD1.IDPESSOA'
      '  AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '  AND SB1.MOECODIGO = SD1.MOECODIGO'
      '  AND SB1.IDBEM = B1.IDBEM'
      '  AND SB1.IDPESSOA = B1.IDPESSOA'
      '  AND SB1.IDGRUPO = G1.IDGRUPO'
      'GROUP BY SB1.IDGRUPO, SB1.IDPESSOA'
      '')
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
      'WHERE G.TIPO = '#39'S'#39
      ''
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      '')
    ClientDataSet = cdsGrpSinteticos
    Left = 272
    Top = 144
  end
  object cdsTransfPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 160
  end
  object sqlTransfPer: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, HM.IDGRUPANT,'
      '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG +'
      '        SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM) AS VALORG,'
      
        '       (SD.DEPLANC + SD.REAVDEPLANC + SD.ULTREAVDEPLANC - NVL(FE' +
        'C.VALOR,0) +'
      '        SD.CMDEP + SD.REAVCMDEP + SD.ULTREAVCMDEP) AS DEPLANC'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     SALDOCONTABBEM SB, SLDCTBBEMXDEP SD,'
      '     BEM B,'
      '     GRUPO G, GRUPO GA,'
      
        '     (SELECT /*+ RULE */ HM1.IDBEM, HM1.IDPESSOA, HM1.DATAMOVIME' +
        'NTACAO, SUM(NVL(VM1.VALOR,0)) AS VALOR'
      '      FROM HISTORICOMOVIMENTACAO HM1,'
      '           VLRHISTMOVBEM VM1'
      
        '      WHERE (HM1.DATAMOVIMENTACAO >= :DATAINI AND HM1.DATAMOVIME' +
        'NTACAO <= :DATASLD)'
      
        '        AND (HM1.IDTIPOMOVIMENTACAO = 14 OR HM1.IDTIPOMOVIMENTAC' +
        'AO = 18 OR HM1.IDTIPOMOVIMENTACAO = 35)'
      '        AND (HM1.TIPDEPPRORATA = 2)'
      '        AND (HM1.IDPESSOA = :IDPESSOA)'
      '        AND (VM1.IDTAXADEP = :IDTAXADEP)'
      '        AND (VM1.MOECODIGO = :MOECODIGO)'
      '        AND (HM1.IDMOVIMENTACAO = VM1.IDMOVIMENTACAO(+))'
      
        '      GROUP BY HM1.IDBEM, HM1.IDPESSOA, HM1.DATAMOVIMENTACAO) FE' +
        'C'
      ''
      
        'WHERE HM.DATAMOVIMENTACAO >= :DATAINI AND HM.DATAMOVIMENTACAO <=' +
        ' :DATASLD'
      '  AND HM.IDTIPOMOVIMENTACAO = 05'
      '  AND B.DATAINICIODEP <= :DATASLD'
      '  AND SB.MOECODIGO = :MOECODIGO'
      '  AND SD.MOECODIGO = :MOECODIGO'
      '  AND SD.IDSLDCTBBEMXDEP = :IDTAXADEP'
      ''
      ''
      ''
      ''
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND SB.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = SB.IDBEM'
      '  AND HM.IDPESSOA = SB.IDPESSOA'
      '  AND HM.DATAMOVIMENTACAO = SB.DATASLDBEM'
      '  AND SB.IDBEM = SD.IDBEM'
      '  AND SB.IDPESSOA = SD.IDPESSOA'
      '  AND SB.DATASLDBEM = SD.DATASLDBEM'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '  AND SB.IDGRUPO = G.IDGRUPO'
      '  AND HM.IDGRUPANT = GA.IDGRUPO'
      '  AND HM.IDBEM = FEC.IDBEM(+)'
      '  AND HM.IDPESSOA = FEC.IDPESSOA(+)'
      '  AND HM.DATAMOVIMENTACAO = FEC.DATAMOVIMENTACAO(+)'
      ''
      'ORDER BY SB.IDGRUPO, HM.IDGRUPANT'
      '')
    ClientDataSet = cdsTransfPer
    Left = 184
    Top = 144
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
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
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
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
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
    Left = 304
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
      'WHERE PG.IDPESSOA = :IDPESSOA'
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
  object cdsMovPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 160
  end
  object sqlMovPer: TCMSqlParams
    SQL.Strings = (
      'SELECT MOV.IDGRUPO, MOV.IDPESSOA,'
      
        '       SUM(MOV.VALCUSTOAQUIS) AS VALCUSTOAQUIS, SUM(MOV.VALCUSTO' +
        'ENT) AS VALCUSTOENT,'
      
        '       SUM(MOV.VALCUSTOSAI) AS VALCUSTOSAI, SUM(MOV.VALCUSTOBX) ' +
        'AS VALCUSTOBX,'
      
        '       SUM(MOV.VALDEPRECPER) AS VALDEPRECPER, SUM(MOV.VALDEPRECE' +
        'NT) AS VALDEPRECENT,'
      
        '       SUM(MOV.VALDEPRECSAI) AS VALDEPRECSAI, SUM(MOV.VALDEPRECB' +
        'X) AS VALDEPRECBX'
      ''
      'FROM  (SELECT /*+ RULE */ SB1.IDGRUPO, SB1.IDPESSOA,'
      
        '              SUM(DECODE(HM1.IDTIPOMOVIMENTACAO,01,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                03,NVL(VM1.VALOR' +
        ',0),0)) AS VALCUSTOAQUIS,'
      
        '              SUM(DECODE(HM1.IDTIPOMOVIMENTACAO,08,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                32,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                53,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                54,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                09,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                07,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                10,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                15,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                22,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                34,NVL(VM1.VALOR' +
        ',0),0)) AS VALCUSTOENT,'
      
        '              SUM(DECODE(HM1.IDTIPOMOVIMENTACAO,23,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                13,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                16,NVL(VM1.VALOR' +
        ',0),0)) AS VALCUSTOSAI,'
      
        '              SUM(DECODE(HM1.IDTIPOMOVIMENTACAO,06,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                20,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                70,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                37,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                25,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                28,NVL(VM1.VALOR' +
        ',0),'
      
        '                                                38,NVL(VM1.VALOR' +
        ',0),0)) AS VALCUSTOBX,'
      '              (0) AS VALDEPRECPER,'
      '              (0) AS VALDEPRECENT,'
      '              (0) AS VALDEPRECSAI,'
      '              (0) AS VALDEPRECBX'
      '       FROM HISTORICOMOVIMENTACAO HM1,'
      '            VLRHISTMOVBEM VM1,'
      '            GRUPO G1,'
      '            SALDOCONTABBEM SB1,'
      '            BEM B1'
      
        '       WHERE (HM1.DATAMOVIMENTACAO >= :DATAINI AND HM1.DATAMOVIM' +
        'ENTACAO <= :DATASLD)'
      '         AND (HM1.IDPESSOA = :IDPESSOA)'
      '         AND (VM1.MOECODIGO = :MOECODIGO)'
      '         AND (SB1.MOECODIGO = :MOECODIGO)'
      '         AND (SB1.IDPESSOA = :IDPESSOA)'
      '         AND (B1.DATAINICIODEP <= :DATASLD)'
      ''
      ''
      ''
      ''
      '         AND (HM1.IDMOVIMENTACAO = VM1.IDMOVIMENTACAO(+))'
      '         AND (HM1.IDBEM = SB1.IDBEM)'
      '         AND (HM1.IDPESSOA = SB1.IDPESSOA)'
      '         AND (HM1.DATAMOVIMENTACAO = SB1.DATASLDBEM)'
      '         AND (SB1.IDBEM = B1.IDBEM)'
      '         AND (SB1.IDPESSOA = B1.IDPESSOA)'
      '         AND (SB1.IDGRUPO = G1.IDGRUPO)'
      '       GROUP BY SB1.IDGRUPO, SB1.IDPESSOA UNION'
      ''
      '       SELECT /*+ RULE */ SB2.IDGRUPO, SB2.IDPESSOA,'
      '              (0) AS VALCUSTOAQUIS,'
      '              (0) AS VALCUSTOENT,'
      '              (0) AS VALCUSTOSAI,'
      '              (0) AS VALCUSTOBX,'
      
        '              SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,14,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                43,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                35,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                51,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                18,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                33,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                47,NVL(VM2.VALOR' +
        ',0),0)) AS VALDEPRECPER,'
      
        '              SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,17,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                21,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                19,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                36,NVL(VM2.VALOR' +
        ',0),0)) AS VALDEPRECENT,'
      
        '              (0)                                               ' +
        '         AS VALDEPRECSAI,'
      
        '              SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,24,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                27,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                71,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                39,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                26,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                29,NVL(VM2.VALOR' +
        ',0),'
      
        '                                                40,NVL(VM2.VALOR' +
        ',0),0)) AS VALDEPRECBX'
      '       FROM HISTORICOMOVIMENTACAO HM2,'
      '            VLRHISTMOVBEM VM2,'
      '            GRUPO G2,'
      '            SALDOCONTABBEM SB2,'
      '            BEM B2'
      
        '       WHERE (HM2.DATAMOVIMENTACAO >= :DATAINI AND HM2.DATAMOVIM' +
        'ENTACAO <= :DATASLD)'
      '         AND (HM2.IDPESSOA = :IDPESSOA)'
      '         AND (VM2.IDTAXADEP = :IDTAXADEP)'
      '         AND (VM2.MOECODIGO = :MOECODIGO)'
      '         AND (SB2.MOECODIGO = :MOECODIGO)'
      '         AND (SB2.IDPESSOA = :IDPESSOA)'
      '         AND (B2.DATAINICIODEP <= :DATASLD)'
      ''
      ''
      ''
      ''
      '         AND (HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+))'
      '         AND (HM2.IDBEM = SB2.IDBEM)'
      '         AND (HM2.IDPESSOA = SB2.IDPESSOA)'
      '         AND (HM2.DATAMOVIMENTACAO = SB2.DATASLDBEM)'
      '         AND (SB2.IDBEM = B2.IDBEM)'
      '         AND (SB2.IDPESSOA = B2.IDPESSOA)'
      '         AND (SB2.IDGRUPO = G2.IDGRUPO)'
      '       GROUP BY SB2.IDGRUPO, SB2.IDPESSOA ) MOV'
      ''
      'GROUP BY MOV.IDGRUPO, MOV.IDPESSOA'
      'ORDER BY MOV.IDGRUPO, MOV.IDPESSOA'
      '')
    ClientDataSet = cdsMovPer
    Left = 112
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
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '')
    ClientDataSet = cdsVerUltFec
    Left = 112
    Top = 64
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 80
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
        'IARIO,'
      '       G.MASCARACC'
      'FROM PARAMETROSCAFMANUT C,'
      '     PARAMIMOVEL I,'
      '     PARAMCONTAB PC,'
      '     PARAMGLOBAL G'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)'
      '  AND C.IDPESSOA = G.IDPESSOA(+)'
      '  ')
    ClientDataSet = cdsParamCaf
    Left = 25
    Top = 64
  end
end
