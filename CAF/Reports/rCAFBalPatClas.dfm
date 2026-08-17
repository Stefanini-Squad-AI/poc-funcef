inherited RptCAFBalPatClas: TRptCAFBalPatClas
  Left = 259
  Top = 189
  Width = 305
  Height = 220
  Caption = 'Balancete Patrimonial por Classe'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Classe'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Periodo Atualizado até'
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
        Caption = 'Classe'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODHIERARQ,DESCRICAO,IDCLASSEBEM'
          'FROM CLASSEDEBEM'
          'WHERE ANASINT = '#39'A'#39
          'ORDER BY CODHIERARQ')
        LookupSettings.Chave = 'IDCLASSEBEM'
        LookupSettings.Display = 'DESCRICAO|CODHIERARQ'
        LookupSettings.Descricao = 'Descrição|Código'
        LookupSettings.Tamanho = '40|15'
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
      end
      item
        Caption = 'Incluir Centros de Custo sem Valor'
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
        Caption = 'Somente Centros de Custo Sintéticos'
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
    FormWidth = 480
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBalPatClas
    LabelEmpresa = ppLabel5
    LabelSistema = ppLabel86
  end
  object cdsAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 144
  end
  object sqlAnaliticos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.CODHIERARQ, SB.IDCLASSEBEM, SB.DESCRICAO, SB.ANASINT, ' +
        'SUM(SB.QUANT) AS QUANT,'
      '       SUM(SB.VALORG0) AS VALORG0, SUM(SB.CMBEM0) AS CMBEM0,'
      
        '       SUM(SB.DEPLANC0) AS DEPLANC0, SUM(SB.DEPLANCATU0) AS DEPL' +
        'ANCATU0,'
      
        '       SUM(SB.CMDEP0) AS CMDEP0, SUM(SB.VALORG0 + SB.CMBEM0 - SB' +
        '.DEPLANC0 - SB.CMDEP0) AS VALCTB0'
      ''
      
        'FROM (SELECT /*+ RULE */ CB1.CODHIERARQ, CB1.IDCLASSEBEM, CB1.DE' +
        'SCRICAO, CB1.ANASINT, COUNT(*) AS QUANT,'
      '             ROUND(SUM(NVL(SB1.VALORG,0) +'
      '                       NVL(SB1.REAVVALORG,0) +'
      '                       NVL(SB1.ULTREAVVALORG,0)), 2) AS VALORG0,'
      '             ROUND(SUM(NVL(SB1.CMBEM,0) +'
      '                       NVL(SB1.REAVCMBEM,0) +'
      '                       NVL(SB1.ULTREAVCMBEM,0)), 2) AS CMBEM0,'
      '             ROUND(SUM(NVL(SD1.DEPLANC,0) +'
      '                       NVL(SD1.REAVDEPLANC,0) +'
      
        '                       NVL(SD1.ULTREAVDEPLANC,0)), 2) AS DEPLANC' +
        '0,'
      '             ROUND(SUM(NVL(SD1.CMDEP,0) +'
      '                       NVL(SD1.REAVCMDEP,0) +'
      '                       NVL(SD1.ULTREAVCMDEP,0)), 2) AS CMDEP0,'
      '             (0) AS DEPLANCATU0'
      '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM, IDPESSOA) MAX1,'
      '           BEM B1, GRUPO G1, CLASSEDEBEM CB1'
      '      WHERE B1.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      '        AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = MAX1.IDBEM'
      '        AND SB1.IDPESSOA = MAX1.IDPESSOA'
      '        AND SB1.DATASLDBEM = MAX1.DATA'
      '        AND SB1.IDBEM = SD1.IDBEM'
      '        AND SB1.IDPESSOA = SD1.IDPESSOA'
      '        AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '        AND SB1.MOECODIGO = SD1.MOECODIGO'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND B1.IDCLASSEBEM = CB1.IDCLASSEBEM'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      
        '      GROUP BY CB1.CODHIERARQ, CB1.IDCLASSEBEM, CB1.DESCRICAO, C' +
        'B1.ANASINT UNION'
      ''
      
        '      SELECT /*+ RULE */ CB2.CODHIERARQ, CB2.IDCLASSEBEM, CB2.DE' +
        'SCRICAO, CB2.ANASINT, (0) AS QUANT,'
      '             (0) AS VALORG0,'
      '             (0) AS CMBEM0,'
      '             (0) AS DEPLANC0,'
      '             (0) AS CMDEP0,'
      
        '             ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,14,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     17,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     43,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     35,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     51,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     18,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     33,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     47,NVL(VM2.' +
        'VALOR,0),0)),2) AS DEPLANCATU0'
      '      FROM HISTORICOMOVIMENTACAO HM2,'
      '           VLRHISTMOVBEM VM2,'
      '           GRUPO G2,'
      '           SALDOCONTABBEM SB2,'
      '           BEM B2,'
      '           CLASSEDEBEM CB2'
      '      WHERE B2.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      
        '        AND HM2.DATAMOVIMENTACAO >= :DATAINI AND HM2.DATAMOVIMEN' +
        'TACAO <= :DATASLD'
      
        '        AND SB2.DATASLDBEM >= :DATAINI AND SB2.DATASLDBEM <= :DA' +
        'TASLD'
      '        AND SB2.MOECODIGO = :MOECODIGO'
      '        AND SB2.IDPESSOA = :IDPESSOA'
      '        AND HM2.IDPESSOA = :IDPESSOA'
      '        AND B2.IDPESSOA = :IDPESSOA'
      '        AND VM2.MOECODIGO = :MOECODIGO'
      '        AND VM2.IDTAXADEP = :IDTAXADEP'
      '        AND HM2.IDBEM = SB2.IDBEM'
      '        AND HM2.IDPESSOA = SB2.IDPESSOA'
      '        AND HM2.DATAMOVIMENTACAO = SB2.DATASLDBEM'
      '        AND SB2.IDBEM = B2.IDBEM'
      '        AND SB2.IDPESSOA = B2.IDPESSOA'
      '        AND B2.IDCLASSEBEM = CB2.IDCLASSEBEM'
      '        AND G2.IDGRUPO = SB2.IDGRUPO'
      '        AND HM2.IDPESSOA = B2.IDPESSOA'
      '        AND HM2.IDBEM = B2.IDBEM'
      '        AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+)'
      
        '      GROUP BY CB2.CODHIERARQ, CB2.IDCLASSEBEM, CB2.DESCRICAO, C' +
        'B2.ANASINT) SB'
      ''
      'GROUP BY SB.CODHIERARQ, SB.IDCLASSEBEM, SB.DESCRICAO, SB.ANASINT'
      'ORDER BY SB.CODHIERARQ, SB.IDCLASSEBEM, SB.DESCRICAO, SB.ANASINT'
      '')
    ClientDataSet = cdsAnaliticos
    Left = 32
    Top = 128
  end
  object cdsSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 144
  end
  object sqlSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCLASSEBEM, CODHIERARQ, DESCRICAO'
      'FROM CLASSEDEBEM'
      'WHERE ANASINT = '#39'S'#39
      'ORDER BY CODHIERARQ')
    ClientDataSet = cdsSinteticos
    Left = 120
    Top = 128
  end
  object cdsBalPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 72
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
        'IARIO,'
      '       G.MASCARACC'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC,'
      '       PARAMGLOBAL G'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)'
      '  AND C.IDPESSOA = G.IDPESSOA(+)'
      '')
    ClientDataSet = cdsParamCaf
    Left = 24
    Top = 56
  end
  object sqlBalPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       IDCLASSEBEM,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       (0)  AS QUANT, '
      '       (0.00)  AS VALORG,'
      '       (0.00)  AS CMBEM,'
      '       (0.00)  AS DEPLANC,'
      '       (0.00)  AS CMDEP,'
      '       (0.00)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'ORDER BY CODHIERARQ'
      '')
    ClientDataSet = cdsBalPatAux
    Left = 168
    Top = 57
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 72
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
      '  AND PG.IDGRUPO  = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 96
    Top = 56
  end
  object sqlBalPatClas: TCMSqlParams
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       (0) AS QUANT, '
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB'
      'FROM CLASSEDEBEM'
      'WHERE IDCLASSEBEM IS NULL'
      'ORDER BY CODHIERARQ')
    ClientDataSet = cdsBalPatClas
    Left = 245
    Top = 57
  end
  object cdsBalPatClas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 245
    Top = 44
  end
  object dsBalPatClas: TwwDataSource
    DataSet = cdsBalPatClas
    Left = 244
    Top = 32
  end
  object ppBalPatClas: TppBDEPipeline
    DataSource = dsBalPatClas
    UserName = 'BalPatClas'
    Left = 244
    Top = 20
    object ppBalPatClasppField1: TppField
      FieldAlias = 'CODHIERARQ'
      FieldName = 'CODHIERARQ'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBalPatClasppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBalPatClasppField3: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppBalPatClasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBalPatClasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBalPatClasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBalPatClasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatClasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBalPatClasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object rpBalPatClas: TppReport
    AutoStop = False
    DataPipeline = ppBalPatClas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 244
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Balancete Patrimonial por Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 96573
        mmTop = 8731
        mmWidth = 81227
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27781
        mmWidth = 274267
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 122238
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 22754
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 22754
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 22754
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 138377
        mmTop = 22754
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 160073
        mmTop = 22754
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'ppLabel80'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 194998
        mmTop = 22754
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'ppLabel82'
        Caption = 'C.M.Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 218282
        mmTop = 22754
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 246857
        mmTop = 22754
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel84'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 224103
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatClasLabelData: TppLabel
        UserName = 'rpBalPatClasLabelData'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 254001
        mmTop = 9525
        mmWidth = 20108
        BandType = 0
      end
      object rpBalPatClasLabel1: TppLabel
        UserName = 'rpBalPatClasLabel1'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111125
        mmTop = 22754
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5080
        mmLeft = 125345
        mmTop = 15081
        mmWidth = 23424
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      AfterPrint = ppDetailBand2AfterPrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpBalPatClasDBText1: TppDBText
        OnPrint = rpBalPatClasDBText1Print
        UserName = 'rpBalPatClasDBText1'
        DataField = 'CODHIERARQ'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBalPatClasDBText2: TppDBText
        UserName = 'rpBalPatClasDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 0
        mmWidth = 80963
        BandType = 4
      end
      object rpBalPatClasDBText5: TppDBText
        UserName = 'rpBalPatClasDBText5'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object rpBalPatClasDBText7: TppDBText
        UserName = 'rpBalPatClasDBText7'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 184944
        mmTop = 0
        mmWidth = 29898
        BandType = 4
      end
      object rpBalPatClasDBText8: TppDBText
        UserName = 'rpBalPatClasDBText8'
        BlankWhenZero = True
        DataField = 'CMDEP'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215900
        mmTop = 0
        mmWidth = 29633
        BandType = 4
      end
      object rpBalPatClasDBText9: TppDBText
        UserName = 'rpBalPatClasDBText9'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 246328
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object rpBalPatClasDBText3: TppDBText
        UserName = 'rpBalPatClasDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object rpBalPatClasDBText6: TppDBText
        UserName = 'rpBalPatClasDBText6'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154782
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object rpBalPatClasDBText4: TppDBText
        UserName = 'rpBalPatClasDBText4'
        DataField = 'QUANT'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#0;(#0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 274267
        BandType = 8
      end
      object ppLabel86: TppLabel
        UserName = 'ppLabel86'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 31750
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
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
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSoma1: TppVariable
        UserName = 'ppSoma1'
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
        mmLeft = 107950
        mmTop = 794
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel75: TppLabel
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
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 274267
        BandType = 7
      end
      object ppSoma2: TppVariable
        UserName = 'ppSoma2'
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
        mmLeft = 120386
        mmTop = 794
        mmWidth = 33073
        BandType = 7
      end
      object ppSoma3: TppVariable
        UserName = 'ppSoma3'
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
        mmLeft = 154252
        mmTop = 794
        mmWidth = 29369
        BandType = 7
      end
      object ppSoma4: TppVariable
        UserName = 'ppSoma4'
        AutoSize = False
        CalcOrder = 3
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
        mmLeft = 184415
        mmTop = 794
        mmWidth = 30427
        BandType = 7
      end
      object ppSoma5: TppVariable
        UserName = 'ppSoma5'
        AutoSize = False
        CalcOrder = 4
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
        mmLeft = 215636
        mmTop = 794
        mmWidth = 29898
        BandType = 7
      end
      object ppSoma6: TppVariable
        UserName = 'ppSoma6'
        AutoSize = False
        CalcOrder = 5
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
        mmLeft = 246328
        mmTop = 794
        mmWidth = 28310
        BandType = 7
      end
    end
  end
end
