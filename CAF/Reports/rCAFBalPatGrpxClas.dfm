inherited RptCAFBalPatGrpxClas: TRptCAFBalPatGrpxClas
  Left = 318
  Top = 109
  Width = 361
  Height = 316
  Caption = 'Balancete Patrimonial por Grupo x Classe'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Grupo x Classe'
    DataBaseName = 'Basedados'
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
        LookupSettings.Descricao = 'Descrição|Código'
        LookupSettings.Tamanho = '40|15'
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
        Caption = 'Incluir Bens em Controle Físico'
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
        Caption = 'Incluir Bens Baixados'
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
    Formheight = 197
    FormWidth = 480
    Left = 28
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpBalPatGrpxClas
    LabelEmpresa = ppLabel81
    LabelSistema = ppLabel109
    Left = 91
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
    Left = 104
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
    Left = 104
    Top = 64
  end
  object cdsClasAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 152
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
      
        '       ROUND(SUM(SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG),2' +
        ') AS VALORG0,'
      
        '       ROUND(SUM(SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM),2) A' +
        'S CMBEM0,'
      
        '       ROUND(SUM(SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC' +
        '),2) AS DEPLANC0,'
      
        '       ROUND(SUM(SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP),2) A' +
        'S CMDEP0,'
      '       ROUND(SUM(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '                 SB.REAVVALORG + SB.REAVCMBEM -'
      '                 SB.REAVDEPLANC - SB.REAVCMDEP +'
      '                 SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '                 SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP),2) AS VALC' +
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
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCB1.IDBEM = DTAMAX.IDBEM'
      '        AND SCB1.IDBEM = SCD1.IDBEM'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM) SB,'
      ''
      '     BEM B, CLASSEDEBEM CB, GRUPO G'
      ''
      'WHERE B.DATAINICIODEP <= :DATASLD'
      '  AND G.FLGIMOVEL = 0'
      ''
      ''
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      '  AND B.IDBEM = SB.IDBEM'
      '  AND B.IDPESSOA = SB.IDPESSOA'
      '  AND SB.IDGRUPO = G.IDGRUPO'
      
        'GROUP BY G.IDGRUPO, G.CLASSE, G.NOME, G.TIPO, CB.CODHIERARQ, CB.' +
        'DESCRICAO, CB.ANASINT'
      '')
    ClientDataSet = cdsClasAnaliticos
    Left = 32
    Top = 136
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 152
  end
  object sqlGrpSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, G.IDGRUPO, PG.IDPESSOA'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE G.TIPO = '#39'S'#39
      '  AND G.FLGIMOVEL = 0'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      ' '
      ''
      ' '
      ' ')
    ClientDataSet = cdsGrpSinteticos
    Left = 144
    Top = 136
  end
  object cdsBalPatClas1: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDGRUPO'
        DataType = ftFloat
      end
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
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
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
    Left = 32
    Top = 224
    Data = {
      AF0100009619E0BD01000000180000000D000000000003000000AF0107494447
      5255504F080004000000000006434C4153534501004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000F0004
      4E4F4D450100490000000100055749445448020002003C00045449504F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020001000A434F4448494552415251010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000F00
      0944455343524943414F0100490000000100055749445448020002003C000741
      4E4153494E5401004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000100055155414E540800040000000000
      0656414C4F5247080004000000000005434D42454D0800040000000000074445
      504C414E43080004000000000005434D44455008000400000000000656414C43
      5442080004000000000002000D44454641554C545F4F52444552020082000200
      000002000500044C4349440400010009080000}
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
    Left = 120
    Top = 224
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
    Left = 208
    Top = 224
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
    Left = 296
    Top = 224
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
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE G.IDGRUPO = -1'
      'ORDER BY G.CLASSE, C.CODHIERARQ'
      ''
      ' ')
    ClientDataSet = cdsBalPatClas1
    Left = 32
    Top = 208
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
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE G.IDGRUPO = -1'
      'ORDER BY G.CLASSE, C.CODHIERARQ'
      ''
      ' ')
    ClientDataSet = cdsBalPatClas2
    Left = 120
    Top = 208
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
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE G.IDGRUPO = -1'
      'ORDER BY G.CLASSE, C.CODHIERARQ')
    ClientDataSet = cdsBalPatClas3
    Left = 208
    Top = 208
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
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB'
      'FROM GRUPO G,'
      '     CLASSEDEBEM C'
      'WHERE G.IDGRUPO = -1'
      'ORDER BY G.CLASSE, C.CODHIERARQ')
    ClientDataSet = cdsBalPatClas
    Left = 296
    Top = 208
  end
  object sqlBalPatGrpxClas: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCLASSEBEM,'
      '       CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       ('#39'                  '#39') AS PLACONTA,'
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB'
      'FROM CLASSEDEBEM'
      'WHERE IDCLASSEBEM IS NULL'
      '')
    ClientDataSet = cdsBalPatGrpxClas
    Left = 259
    Top = 60
  end
  object cdsBalPatGrpxClas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 260
    Top = 47
  end
  object dsBalPatGrpxClas: TwwDataSource
    DataSet = cdsBalPatGrpxClas
    Left = 260
    Top = 35
  end
  object ppBalPatGrpxClas: TppBDEPipeline
    DataSource = dsBalPatGrpxClas
    UserName = 'BalPatClas1'
    Left = 260
    Top = 23
  end
  object rpBalPatGrpxClas: TppReport
    AutoStop = False
    DataPipeline = ppBalPatGrpxClas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    DeviceType = 'Screen'
    Left = 261
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel76: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Balancete Patrimonial por Grupo Contábil x Classe'
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
        mmHeight = 265
        mmLeft = 0
        mmTop = 24341
        mmWidth = 286967
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
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
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpDBText1: TppDBText
        OnPrint = rpDBText1Print
        UserName = 'rpDBText1'
        DataField = 'CODHIERARQ'
        DataPipeline = ppBalPatGrpxClas
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
      object rpDBText2: TppDBText
        UserName = 'rpDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = ppBalPatGrpxClas
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
      object rpDBText6: TppDBText
        UserName = 'rpDBText6'
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrpxClas
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
      object rpDBText3: TppDBText
        UserName = 'rpDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatGrpxClas
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
      object rpDBText4: TppDBText
        UserName = 'rpDBText4'
        DataField = 'QUANT'
        DataPipeline = ppBalPatGrpxClas
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
      object rpDBText7: TppDBText
        UserName = 'rpDBText7'
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrpxClas
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
      object rpDBText5: TppDBText
        UserName = 'rpDBText5'
        DataField = 'PLACONTA'
        DataPipeline = ppBalPatGrpxClas
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
      object ppLabel109: TppLabel
        UserName = 'ppLabel109'
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4304
        mmLeft = 0
        mmTop = 0
        mmWidth = 19473
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'QUANT'
        DataPipeline = ppBalPatGrpxClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 0
        mmWidth = 14288
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrpxClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 213519
        mmTop = 0
        mmWidth = 32015
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrpxClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 0
        mmWidth = 31485
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 286967
        BandType = 7
      end
    end
  end
  object cdsContaSemCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 152
  end
  object sqlContaSemCC: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACONTA, CODCENTROCUSTO, IDEMPRESA'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE IDGRUPO = :IDGRUPO'
      '  AND IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO'
      '  AND TIPOLANCAMENTO = :TIPOLANCAMENTO'
      '  AND PLANO = :PLANO'
      '  AND IDPESSOA = :IDPESSOA'
      ''
      '')
    ClientDataSet = cdsContaSemCC
    Left = 256
    Top = 136
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 80
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO,MASCARA'
      'FROM PLANO'
      'WHERE PLANO = :PPLANO')
    ClientDataSet = cdsPlano
    Left = 168
    Top = 64
  end
end
