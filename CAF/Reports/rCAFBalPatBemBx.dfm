inherited rptCAFBalPatBemBx: TrptCAFBalPatBemBx
  Height = 237
  Caption = 'Balancete Patrimonial por Bem - Bens Baixados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Bem - Bens Baixados'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Movimento Atualizado até'
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
        Caption = 'Seleção'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Completo'
          'Totalmente Depreciados'
          'Parcialmente Depreciados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
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
        Caption = 'Incluir os Bens com Controle Físico'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 231
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBalPatBemBx
    LabelEmpresa = ppLabel61
    LabelSistema = ppLabel62
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
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
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 32
    Top = 64
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
      '  AND PG.IDGRUPO = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 112
    Top = 64
  end
  object cdsSomaGrupoBx: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 152
  end
  object sqlSomaGrupoBx: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, SB.IDPESSOA,'
      '       SUM(SB.VALORG0) AS VALORG0, SUM(SB.CMBEM0) AS CMBEM0,'
      
        '       SUM(SB.DEPLANC0) AS DEPLANC0, SUM(SB.DEPLANCATU0) AS DEPL' +
        'ANCATU0,'
      
        '       SUM(SB.CMDEP0) AS CMDEP0, SUM(SB.VALORG0 + SB.CMBEM0 - SB' +
        '.DEPLANC0 - SB.CMDEP0) AS VALCTB0'
      ''
      
        'FROM (SELECT /*+ RULE */ SB1.IDGRUPO, SB1.IDPESSOA, COUNT(*) AS ' +
        'QUANT,'
      
        '             ROUND(SUM(NVL(SB1.VALORG,0)  + NVL(SB1.REAVVALORG,0' +
        ')  + NVL(SB1.ULTREAVVALORG,0)) ,2) AS VALORG0,'
      
        '             ROUND(SUM(NVL(SB1.CMBEM,0)   + NVL(SB1.REAVCMBEM,0)' +
        '   + NVL(SB1.ULTREAVCMBEM,0))  ,2) AS CMBEM0,'
      
        '             ROUND(SUM(NVL(SD1.DEPLANC,0) + NVL(SD1.REAVDEPLANC,' +
        '0) + NVL(SD1.ULTREAVDEPLANC,0)),2) AS DEPLANC0,'
      
        '             ROUND(SUM(NVL(SD1.CMDEP,0)   + NVL(SD1.REAVCMDEP,0)' +
        '   + NVL(SD1.ULTREAVCMDEP,0))  ,2) AS CMDEP0,'
      '             (0) AS DEPLANCATU0'
      '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '           (SELECT SCB2.IDBEM, MAX(SCB2.DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM SCB2,'
      '                 SLDCTBBEMXDEP  SCD2'
      '            WHERE SCB2.DATASLDBEM <= :DATASLD'
      
        '              AND (NOT ((ABS(SCB2.VALORG) < 0.01) AND (ABS(SCB2.' +
        'CMBEM) < 0.01) AND'
      
        '                        (ABS(SCD2.DEPLANC) < 0.01) AND (ABS(SCD2' +
        '.CMDEP) < 0.01) AND'
      
        '                        (ABS(SCB2.REAVVALORG) < 0.01) AND (ABS(S' +
        'CB2.REAVCMBEM) < 0.01) AND'
      
        '                        (ABS(SCD2.REAVDEPLANC) < 0.01) AND (ABS(' +
        'SCD2.REAVCMDEP) < 0.01) AND'
      
        '                        (ABS(SCB2.ULTREAVVALORG) < 0.01) AND (AB' +
        'S(SCB2.ULTREAVCMBEM) < 0.01) AND'
      
        '                        (ABS(SCD2.ULTREAVDEPLANC) < 0.01) AND (A' +
        'BS(SCD2.ULTREAVCMDEP) < 0.01)))'
      '              AND SCB2.MOECODIGO = :MOECODIGO'
      '              AND SCB2.IDPESSOA = :IDPESSOA'
      '              AND SCD2.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '              AND SCB2.IDBEM = SCD2.IDBEM'
      '              AND SCB2.IDPESSOA = SCD2.IDPESSOA'
      '              AND SCB2.MOECODIGO = SCD2.MOECODIGO'
      '              AND SCB2.DATASLDBEM = SCD2.DATASLDBEM'
      '            GROUP BY SCB2.IDBEM) MAX1,'
      '           (SELECT DISTINCT IDBEM'
      '            FROM HISTORICOMOVIMENTACAO'
      
        '            WHERE DATAMOVIMENTACAO >= :DATAINI AND DATAMOVIMENTA' +
        'CAO <= :DATASLD'
      '              AND IDTIPOMOVIMENTACAO = 06'
      '              AND IDPESSOA = :IDPESSOA) BBX1,'
      '           BEM B1, GRUPO G1'
      
        '      WHERE ( ( B1.FLGDEPREC = :PDEPREC AND B1.DATAULTDEP <= :PD' +
        'ATASLD ))'
      ''
      ''
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      '        AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = BBX1.IDBEM'
      '        AND SB1.IDBEM = MAX1.IDBEM'
      '        AND SB1.DATASLDBEM = MAX1.DATA'
      '        AND SB1.IDBEM = SD1.IDBEM'
      '        AND SB1.IDPESSOA = SD1.IDPESSOA'
      '        AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '        AND SB1.MOECODIGO = SD1.MOECODIGO'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      '      GROUP BY SB1.IDGRUPO, SB1.IDPESSOA UNION'
      ''
      
        '      SELECT /*+ RULE */ SB2.IDGRUPO, SB2.IDPESSOA, (0) AS QUANT' +
        ','
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
      '           (SELECT DISTINCT IDBEM'
      '            FROM HISTORICOMOVIMENTACAO'
      
        '            WHERE DATAMOVIMENTACAO >= :DATAINI AND DATAMOVIMENTA' +
        'CAO <= :DATASLD'
      '              AND IDTIPOMOVIMENTACAO = 06'
      '              AND IDPESSOA = :IDPESSOA) BBX2,'
      '           BEM B2'
      
        '      WHERE ( ( B2.FLGDEPREC = :PDEPREC AND B2.DATAULTDEP <= :PD' +
        'ATASLD ))'
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
      '        AND HM2.IDBEM = BBX2.IDBEM'
      '        AND HM2.IDBEM = SB2.IDBEM'
      '        AND HM2.IDPESSOA = SB2.IDPESSOA'
      '        AND HM2.DATAMOVIMENTACAO = SB2.DATASLDBEM'
      '        AND SB2.IDBEM = B2.IDBEM'
      '        AND SB2.IDPESSOA = B2.IDPESSOA'
      '        AND G2.IDGRUPO = SB2.IDGRUPO'
      '        AND HM2.IDPESSOA = B2.IDPESSOA'
      '        AND HM2.IDBEM = B2.IDBEM'
      '        AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+)'
      '      GROUP BY SB2.IDGRUPO, SB2.IDPESSOA) SB'
      ''
      'GROUP BY SB.IDGRUPO, SB.IDPESSOA'
      ''
      ' '
      ' ')
    ClientDataSet = cdsSomaGrupoBx
    Left = 72
    Top = 136
  end
  object sqlBalPatBemBx: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SB.IDGRUPO, G.CLASSE, G.NOME, B.PLACA, B.DESB' +
        'EM, B.DTAINCLUSAO, B.TAXADEP,'
      
        '       B.DATAINICIODEP, B.DATAULTDEP, B.VALHISTORICO, B.FLGDEPRE' +
        'C, C.DESCCONJUNTO,'
      '       B.IDNOTA, B.COMPLNOTA, F.NOME AS NOMEFORN,'
      '       L.NOME AS DESCLOCALIZACAO, R.NOME AS NOMERESP,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALO' +
        'RG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBE' +
        'M0,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                        AS DEPL' +
        'ANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPL' +
        'ANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDE' +
        'P0,'
      '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALC' +
        'TB0'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP SCD1, GRUPO G1,'
      '           (SELECT SCB2.IDBEM, MAX(SCB2.DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM SCB2,'
      '                 SLDCTBBEMXDEP  SCD2'
      '            WHERE SCB2.DATASLDBEM <= :DATASLD'
      
        '              AND (NOT ((ABS(SCB2.VALORG) < 0.01) AND (ABS(SCB2.' +
        'CMBEM) < 0.01) AND'
      
        '                        (ABS(SCD2.DEPLANC) < 0.01) AND (ABS(SCD2' +
        '.CMDEP) < 0.01) AND'
      
        '                        (ABS(SCB2.REAVVALORG) < 0.01) AND (ABS(S' +
        'CB2.REAVCMBEM) < 0.01) AND'
      
        '                        (ABS(SCD2.REAVDEPLANC) < 0.01) AND (ABS(' +
        'SCD2.REAVCMDEP) < 0.01) AND'
      
        '                        (ABS(SCB2.ULTREAVVALORG) < 0.01) AND (AB' +
        'S(SCB2.ULTREAVCMBEM) < 0.01) AND'
      
        '                        (ABS(SCD2.ULTREAVDEPLANC) < 0.01) AND (A' +
        'BS(SCD2.ULTREAVCMDEP) < 0.01)))'
      '              AND SCB2.MOECODIGO = :MOECODIGO'
      '              AND SCB2.IDPESSOA = :IDPESSOA'
      '              AND SCD2.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '              AND SCB2.IDBEM = SCD2.IDBEM'
      '              AND SCB2.IDPESSOA = SCD2.IDPESSOA'
      '              AND SCB2.MOECODIGO = SCD2.MOECODIGO'
      '              AND SCB2.DATASLDBEM = SCD2.DATASLDBEM'
      '            GROUP BY SCB2.IDBEM) DTAMAX,'
      '           (SELECT DISTINCT IDBEM'
      '            FROM HISTORICOMOVIMENTACAO'
      
        '            WHERE DATAMOVIMENTACAO >= :DATAINI AND DATAMOVIMENTA' +
        'CAO <= :DATASLD'
      '              AND IDTIPOMOVIMENTACAO = 06'
      '              AND IDPESSOA = :IDPESSOA) BBX'
      '      WHERE :MOECODIGO = SCB1.MOECODIGO'
      ''
      '        AND :IDPESSOA = SCB1.IDPESSOA'
      '        AND :IDTAXADEP = SCD1.IDSLDCTBBEMXDEP'
      '        AND BBX.IDBEM = SCB1.IDBEM'
      '        AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCD1.IDBEM = DTAMAX.IDBEM'
      '        AND SCB1.IDGRUPO = G1.IDGRUPO) SB,'
      ''
      '     (SELECT ATX.IDBEM,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ RULE */ HM.IDBEM,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     34,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     50,NVL(VM.V' +
        'ALOR,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLCMREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM'
      
        '             WHERE (HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DAT' +
        'AMOVIMENTACAO <= :DATASLD)'
      '               AND (VM.MOECODIGO = :MOECODIGO)'
      '               AND (HM.IDPESSOA = :IDPESSOA)'
      '               AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '             GROUP BY HM.IDBEM) UNION'
      ''
      '            (SELECT /*+ RULE */ HM.IDBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     17,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     35,NVL(VM.V' +
        'ALOR,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM'
      
        '             WHERE (HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DAT' +
        'AMOVIMENTACAO <= :DATASLD)'
      '               AND (VM.MOECODIGO = :MOECODIGO)'
      '               AND (VM.IDTAXADEP = :IDTAXADEP)'
      '               AND (HM.IDPESSOA = :IDPESSOA)'
      '               AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '             GROUP BY HM.IDBEM) UNION'
      ''
      '            (SELECT /*+ RULE */ HM.IDBEM,'
      
        '                    (0)                                         ' +
        '            AS  VALCMBEM,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.V' +
        'ALOR,0),0)) AS  VALCMREAV,'
      
        '                    (0)                                         ' +
        '            AS  VALDEPBEM,'
      
        '                    (0)                                         ' +
        '            AS  VALDEPREAV,'
      
        '                    (0)                                         ' +
        '            AS  VALCMULTREAV,'
      
        '                    (0)                                         ' +
        '            AS  VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      
        '             WHERE (HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DAT' +
        'AMOVIMENTACAO <= :DATASLD)'
      '               AND (VM.MOECODIGO = :MOECODIGO)'
      '               AND (R.FLGULTREAVAL = 0)'
      '               AND (HM.IDPESSOA = :IDPESSOA)'
      '               AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM) UNION'
      ''
      '            (SELECT /*+ RULE */ HM.IDBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPBEM,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     33,NVL(VM.V' +
        'ALOR,0),0))  AS VALDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS VALCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      
        '             WHERE (HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DAT' +
        'AMOVIMENTACAO <= :DATASLD)'
      '               AND (VM.MOECODIGO = :MOECODIGO)'
      '               AND (VM.IDTAXADEP = :IDTAXADEP)'
      '               AND (R.FLGULTREAVAL = 0)'
      '               AND (HM.IDPESSOA = :IDPESSOA)'
      '               AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM) UNION'
      ''
      '            (SELECT /*+ RULE */ HM.IDBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS VALDEPREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.V' +
        'ALOR,0),0))  AS VALCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPULTREAV'
      ''
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      '             WHERE (HM.IDPESSOA = :IDPESSOA)'
      
        '               AND (HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DAT' +
        'AMOVIMENTACAO <= :DATASLD)'
      '               AND (VM.MOECODIGO = :MOECODIGO)'
      '               AND (R.FLGULTREAVAL = 1)'
      '               AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM) UNION'
      ''
      '            (SELECT /*+ RULE */ HM.IDBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS VALDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS VALCMULTREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     33,NVL(VM.V' +
        'ALOR,0),0))  AS VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND (HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DAT' +
        'AMOVIMENTACAO <= :DATASLD)'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (VM.IDTAXADEP        = :IDTAXADEP)'
      '               AND (R.FLGULTREAVAL      = 1)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC   = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM) ) ATX'
      ''
      '      GROUP BY ATX.IDBEM) ATU,'
      ''
      
        '     PESSOA F, PESSOA R, BEM B, CONJUNTO C, PLANOGRUPO PG, GRUPO' +
        ' G, LOCALIZACAO L'
      ''
      'WHERE'
      '      B.IDPESSOA = :IDPESSOA'
      ''
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND SB.IDPESSOA = L.IDPESSOA'
      '  AND SB.IDRESPONSAVEL = R.IDPESSOA'
      '  AND SB.IDGRUPO = PG.IDGRUPO'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND SB.IDBEM = B.IDBEM'
      '  AND SB.IDPESSOA = B.IDPESSOA'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND B.IDBEM = ATU.IDBEM(+)'
      '  AND B.IDFORNSERV = F.IDPESSOA(+)'
      
        '  AND ( (B.FLGDEPREC = :PDEPREC AND B.DATAULTDEP <= :PDATASLD) O' +
        'R'
      
        '        (BD.FLGDEPREC = :PDEPREC AND BD.DATAULTDEP <= :PDATASLD)' +
        '  )'
      'ORDER BY G.CLASSE, B.PLACA'
      ''
      ' '
      ' ')
    ClientDataSet = cdsBalPatBemBx
    Left = 224
    Top = 61
  end
  object cdsBalPatBemBx: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 48
    Data = {
      410200009619E0BD020000001800000017000000000003000000410207494447
      5255504F080004000000000006434C4153534501004900000001000557494454
      48020002000F00044E4F4D450100490000000100055749445448020002003C00
      05504C41434108000400000000000644455342454D0200490000000100055749
      4454480200020090010B445441494E434C5553414F1000110000000000075441
      584144455008000400000000000D44415441494E4943494F4445501000110000
      0000000A44415441554C5444455010001100000000000C56414C484953544F52
      49434F080004000000000009464C4744455052454304000100000000000C4445
      5343434F4E4A554E544F010049000000010005574944544802000200C8000649
      444E4F5441010049000000010005574944544802000200120009434F4D504C4E
      4F54410100490000000100055749445448020002000500084E4F4D45464F524E
      0100490000000100055749445448020002003C000F444553434C4F43414C495A
      4143414F0100490000000100055749445448020002003C00084E4F4D45524553
      500100490000000100055749445448020002003C000756414C4F524730080004
      000000000006434D42454D3008000400000000000B4445504C414E4341545530
      0800040000000000084445504C414E4330080004000000000006434D44455030
      08000400000000000756414C43544230080004000000000002000D4445464155
      4C545F4F5244455204008200020000000200000004000000044C434944040001
      0000000000}
  end
  object dsBalPatBemBx: TwwDataSource
    DataSet = cdsBalPatBemBx
    Left = 223
    Top = 35
  end
  object ppBalPatBemBx: TppBDEPipeline
    DataSource = dsBalPatBemBx
    UserName = 'BalPatBemBx'
    Left = 223
    Top = 21
    object ppBalPatBemppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBalPatBemppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppBalPatBemppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBalPatBemppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBalPatBemppField5: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 400
      DisplayWidth = 400
      Position = 4
    end
    object ppBalPatBemppField6: TppField
      FieldAlias = 'DTAINCLUSAO'
      FieldName = 'DTAINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 5
    end
    object ppBalPatBemppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatBemppField8: TppField
      FieldAlias = 'DATAINICIODEP'
      FieldName = 'DATAINICIODEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 7
    end
    object ppBalPatBemppField9: TppField
      FieldAlias = 'DATAULTDEP'
      FieldName = 'DATAULTDEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 8
    end
    object ppBalPatBemppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALHISTORICO'
      FieldName = 'VALHISTORICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBalPatBemppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDEPREC'
      FieldName = 'FLGDEPREC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppBalPatBemppField12: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 11
    end
    object ppBalPatBemppField13: TppField
      FieldAlias = 'IDNOTA'
      FieldName = 'IDNOTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 12
    end
    object ppBalPatBemppField14: TppField
      FieldAlias = 'COMPLNOTA'
      FieldName = 'COMPLNOTA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 13
    end
    object ppBalPatBemppField15: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppBalPatBemppField16: TppField
      FieldAlias = 'DESCLOCALIZACAO'
      FieldName = 'DESCLOCALIZACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object ppBalPatBemppField17: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object ppBalPatBemppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG0'
      FieldName = 'VALORG0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppBalPatBemppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM0'
      FieldName = 'CMBEM0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppBalPatBemppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANCATU0'
      FieldName = 'DEPLANCATU0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppBalPatBemppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC0'
      FieldName = 'DEPLANC0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppBalPatBemppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP0'
      FieldName = 'CMDEP0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppBalPatBemppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
  end
  object rpBalPatBemBx: TppReport
    AutoStop = False
    DataPipeline = ppBalPatBemBx
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBalPatBemBxBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 223
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBalPatBemBx'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        Caption = 'Balancete Patrimonial por Bem - Bens Baixados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5080
        mmLeft = 50264
        mmTop = 8731
        mmWidth = 96591
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpBalPatBemLabel2: TppLabel
        UserName = 'rpBalPatBemLabel2'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 15081
        mmWidth = 30163
        BandType = 0
      end
      object rpBalPatBemLabel3: TppLabel
        UserName = 'rpBalPatBemLabel3'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 15081
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object rpBemResumLabel2: TppLabel
        UserName = 'rpBemResumLabel2'
        AutoSize = False
        Caption = 'Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object rpBemResumLabel3: TppLabel
        UserName = 'rpBemResumLabel3'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 10319
        mmWidth = 16669
        BandType = 4
      end
      object rpBemResumLabel4: TppLabel
        UserName = 'rpBemResumLabel4'
        AutoSize = False
        Caption = 'Ultima Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 6879
        mmWidth = 27517
        BandType = 4
      end
      object rpBemResumLabel5: TppLabel
        UserName = 'rpBemResumLabel5'
        AutoSize = False
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3440
        mmWidth = 15346
        BandType = 4
      end
      object rpBemResumLabel6: TppLabel
        UserName = 'rpBemResumLabel6'
        AutoSize = False
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 60325
        mmTop = 6879
        mmWidth = 6615
        BandType = 4
      end
      object rpBemResumLabel7: TppLabel
        UserName = 'rpBemResumLabel7'
        AutoSize = False
        Caption = 'Valor  Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object rpBemResumLabel8: TppLabel
        UserName = 'rpBemResumLabel8'
        AutoSize = False
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 3440
        mmWidth = 19844
        BandType = 4
      end
      object rpBemResumLabel9: TppLabel
        UserName = 'rpBemResumLabel9'
        AutoSize = False
        Caption = 'Depr.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 6879
        mmWidth = 20108
        BandType = 4
      end
      object rpBemResumLabel10: TppLabel
        UserName = 'rpBemResumLabel10'
        AutoSize = False
        Caption = 'C.M.Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpBemResumLabel11: TppLabel
        UserName = 'rpBemResumLabel11'
        AutoSize = False
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 3440
        mmWidth = 19315
        BandType = 4
      end
      object rpBemResumLabel12: TppLabel
        UserName = 'rpBemResumLabel12'
        AutoSize = False
        Caption = 'Vl Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 6879
        mmWidth = 19050
        BandType = 4
      end
      object rpBemResumDBText2: TppDBText
        UserName = 'rpBemResumDBText2'
        DataField = 'PLACA'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object rpBemResumDBText4: TppDBText
        UserName = 'rpBemResumDBText4'
        DataField = 'DATAULTDEP'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 6879
        mmWidth = 19315
        BandType = 4
      end
      object rpBemResumDBText5: TppDBText
        UserName = 'rpBemResumDBText5'
        AutoSize = True
        DataField = 'DTAINCLUSAO'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3316
        mmLeft = 18785
        mmTop = 3440
        mmWidth = 20179
        BandType = 4
      end
      object rpBemResumDBText6: TppDBText
        UserName = 'rpBemResumDBText6'
        DataField = 'TAXADEP'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '0.000000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 6879
        mmWidth = 21960
        BandType = 4
      end
      object rpBemResumDBText7: TppDBText
        UserName = 'rpBemResumDBText7'
        DataField = 'VALORG0'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText8: TppDBText
        UserName = 'rpBemResumDBText8'
        DataField = 'DEPLANC0'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 3440
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText9: TppDBText
        UserName = 'rpBemResumDBText9'
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 6879
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText10: TppDBText
        UserName = 'rpBemResumDBText10'
        DataField = 'CMBEM0'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText11: TppDBText
        UserName = 'rpBemResumDBText11'
        DataField = 'CMDEP0'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 3440
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText12: TppDBText
        UserName = 'rpBemResumDBText12'
        DataField = 'VALCTB0'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 6879
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText3: TppDBText
        UserName = 'rpBemResumDBText3'
        DataField = 'DESBEM'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 10319
        mmWidth = 178330
        BandType = 4
      end
      object rpBemResumLine1: TppLine
        UserName = 'rpBemResumLine1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197115
        BandType = 4
      end
      object rpBemResumLabel27: TppLabel
        UserName = 'rpBemResumLabel27'
        AutoSize = False
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 13758
        mmWidth = 16933
        BandType = 4
      end
      object rpBemResumLabel28: TppLabel
        UserName = 'rpBemResumLabel28'
        Caption = 'a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 6879
        mmWidth = 4763
        BandType = 4
      end
      object rpBalPatBemLabel1: TppLabel
        UserName = 'rpBalPatBemLabel1'
        AutoSize = False
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBalPatBemDBText1: TppDBText
        UserName = 'rpBalPatBemDBText1'
        DataField = 'VALHISTORICO'
        DataPipeline = ppBalPatBemBx
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object rpBalPatBemLabel4: TppLabel
        UserName = 'rpBalPatBemLabel4'
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17198
        mmWidth = 17198
        BandType = 4
      end
      object rpBalPatBemDBText2: TppDBText
        UserName = 'rpBalPatBemDBText2'
        DataField = 'NOMEFORN'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 17198
        mmWidth = 79904
        BandType = 4
      end
      object rpBalPatBemLabel5: TppLabel
        UserName = 'rpBalPatBemLabel5'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 17198
        mmWidth = 16669
        BandType = 4
      end
      object rpBalPatBemDBText3: TppDBText
        UserName = 'rpBalPatBemDBText3'
        DataField = 'IDNOTA'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 17198
        mmWidth = 26458
        BandType = 4
      end
      object rpBalPatBemDBText4: TppDBText
        UserName = 'rpBalPatBemDBText4'
        DataField = 'COMPLNOTA'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 17198
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCLOCALIZACAO'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 13758
        mmWidth = 79904
        BandType = 4
      end
      object ppLabel106: TppLabel
        UserName = 'Label106'
        AutoSize = False
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 13758
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOMERESP'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 13758
        mmWidth = 76729
        BandType = 4
      end
      object ppLabel107: TppLabel
        UserName = 'Label107'
        AutoSize = False
        Caption = 'Conjunto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 20638
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCCONJUNTO'
        DataPipeline = ppBalPatBemBx
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 20638
        mmWidth = 178330
        BandType = 4
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        AutoSize = False
        Caption = 'Inicio Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 3440
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'DATAINICIODEP'
        DataPipeline = ppBalPatBemBx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBalPatBemBx'
        mmHeight = 3316
        mmLeft = 71438
        mmTop = 3440
        mmWidth = 21802
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel62: TppLabel
        UserName = 'ppLabel62'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 75406
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 794
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBemResumSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object rpBemResumLabel20: TppLabel
        UserName = 'rpBemResumLabel20'
        Caption = 'Totalização do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 34396
        BandType = 7
      end
      object rpBemResumLabel21: TppLabel
        UserName = 'rpBemResumLabel21'
        Caption = 'Vl Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 1588
        mmWidth = 17463
        BandType = 7
      end
      object rpBemResumLabel22: TppLabel
        UserName = 'rpBemResumLabel22'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 5027
        mmWidth = 17727
        BandType = 7
      end
      object rpBemResumLabel23: TppLabel
        UserName = 'rpBemResumLabel23'
        Caption = 'Depr.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 8467
        mmWidth = 19050
        BandType = 7
      end
      object rpBemResumLabel24: TppLabel
        UserName = 'rpBemResumLabel24'
        Caption = 'C.M.Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 1588
        mmWidth = 12965
        BandType = 7
      end
      object rpBemResumLabel25: TppLabel
        UserName = 'rpBemResumLabel25'
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 5027
        mmWidth = 18256
        BandType = 7
      end
      object rpBemResumLabel26: TppLabel
        UserName = 'rpBemResumLabel26'
        Caption = 'Vl Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 8467
        mmWidth = 15610
        BandType = 7
      end
      object rpBemResumLine4: TppLine
        UserName = 'rpBemResumLine4'
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 14288
        mmWidth = 197300
        BandType = 7
      end
      object varSomaCusto1: TppVariable
        UserName = 'varSomaCusto1'
        AutoSize = False
        CalcOrder = 0
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 117211
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object varSomaDeprec1: TppVariable
        UserName = 'varSomaDeprec1'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 117211
        mmTop = 5027
        mmWidth = 29633
        BandType = 7
      end
      object varSomaDeprecAtu1: TppVariable
        UserName = 'varSomaDeprecAtu1'
        AutoSize = False
        CalcOrder = 2
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 117211
        mmTop = 8467
        mmWidth = 29633
        BandType = 7
      end
      object varSomaCMCusto1: TppVariable
        UserName = 'varSomaCMCusto1'
        AutoSize = False
        CalcOrder = 3
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object varSomaCMDeprec1: TppVariable
        UserName = 'varSomaCMDeprec1'
        AutoSize = False
        CalcOrder = 4
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 5027
        mmWidth = 29633
        BandType = 7
      end
      object varSomaSldContab1: TppVariable
        UserName = 'varSomaSldContab1'
        AutoSize = False
        CalcOrder = 5
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 8467
        mmWidth = 29633
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppBalPatBemBx
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBalPatBemBx'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME'
          DataPipeline = ppBalPatBemBx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBalPatBemBx'
          mmHeight = 5292
          mmLeft = 32808
          mmTop = 0
          mmWidth = 129117
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CLASSE'
          DataPipeline = ppBalPatBemBx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBalPatBemBx'
          mmHeight = 5292
          mmLeft = 162454
          mmTop = 0
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object rpBemResumLabel13: TppLabel
          UserName = 'rpBemResumLabel13'
          Caption = 'Totalização do Grupo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 265
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBText13: TppDBText
          UserName = 'rpBemResumDBText13'
          DataField = 'NOME'
          DataPipeline = ppBalPatBemBx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'ppBalPatBemBx'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3704
          mmWidth = 96044
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLine3: TppLine
          UserName = 'rpBemResumLine3'
          ParentWidth = True
          Position = lpBottom
          Style = lsDouble
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 12170
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel14: TppLabel
          UserName = 'rpBemResumLabel14'
          Caption = 'Vl Corrigido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 96838
          mmTop = 265
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel15: TppLabel
          UserName = 'rpBemResumLabel15'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 96838
          mmTop = 3704
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel16: TppLabel
          UserName = 'rpBemResumLabel16'
          Caption = 'Depr.Periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 96838
          mmTop = 7144
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel19: TppLabel
          UserName = 'rpBemResumLabel19'
          Caption = 'Vl Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147638
          mmTop = 7144
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel18: TppLabel
          UserName = 'rpBemResumLabel18'
          Caption = 'C.M. Deprec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147638
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel17: TppLabel
          UserName = 'rpBemResumLabel17'
          Caption = 'C.M.Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147638
          mmTop = 265
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object varSomaCusto: TppVariable
          UserName = 'varSomaCusto'
          AutoSize = False
          CalcOrder = 0
          DataType = dtCurrency
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 117211
          mmTop = 265
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object varSomaDeprec: TppVariable
          UserName = 'varSomaDeprec'
          AutoSize = False
          CalcOrder = 1
          DataType = dtCurrency
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 117211
          mmTop = 3704
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object varSomaDeprecAtu: TppVariable
          UserName = 'varSomaDeprecAtu'
          AutoSize = False
          CalcOrder = 2
          DataType = dtCurrency
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 117211
          mmTop = 7144
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object varSomaCMCusto: TppVariable
          UserName = 'varSomaCMCusto'
          AutoSize = False
          CalcOrder = 3
          DataType = dtCurrency
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167482
          mmTop = 0
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object varSomaCMDeprec: TppVariable
          UserName = 'varSomaCMDeprec'
          AutoSize = False
          CalcOrder = 4
          DataType = dtCurrency
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167482
          mmTop = 3440
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object varSomaSldContab: TppVariable
          UserName = 'varSomaSldContab'
          AutoSize = False
          CalcOrder = 5
          DataType = dtCurrency
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167482
          mmTop = 6879
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
