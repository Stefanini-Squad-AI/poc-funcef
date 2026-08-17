inherited rptAtivGestor: TrptAtivGestor
  Left = 345
  Top = 316
  Width = 295
  Height = 178
  Caption = 'rptAtivGestor'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conferência de Saldo por Grupo Orçamentário'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT EXERCICIO'
          'FROM  PERIODOORCAMEN          '
          'WHERE IDPESSOA = :IDPESSOA         '
          'ORDER BY EXERCICIO         ')
        LookupSettings.Chave = 'EXERCICIO'
        LookupSettings.Display = 'EXERCICIO'
        LookupSettings.Descricao = 'Exercício'
        LookupSettings.Tamanho = '10'
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
        Name = 'Exercicio'
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
        Width = 185
      end
      item
        Caption = 'Período Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PERIODO, NOMEPERIODO '
          'FROM PERIODOORCAMEN'
          'WHERE IDPESSOA = :IDPESSOA '
          'ORDER BY PERIODO')
        LookupSettings.Chave = 'PERIODO'
        LookupSettings.Display = 'NOMEPERIODO'
        LookupSettings.Descricao = 'Perído Inicial'
        LookupSettings.Tamanho = '15'
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
        Name = 'PeriodoIni'
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
        Width = 185
      end
      item
        Caption = 'Período Final'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PERIODO, NOMEPERIODO '
          'FROM PERIODOORCAMEN'
          'WHERE IDPESSOA = :IDPESSOA '
          'ORDER BY PERIODO')
        LookupSettings.Chave = 'PERIODO'
        LookupSettings.Display = 'NOMEPERIODO'
        LookupSettings.Descricao = 'Período Final'
        LookupSettings.Tamanho = '15'
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
        Name = 'PeriodoFim'
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
        Width = 185
      end
      item
        Caption = 'Centro de Responsabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTRORESPON, NOME AS NOME'
          'FROM CENTRESPON'
          'ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTRORESPON'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Responsabilidade'
        LookupSettings.Tamanho = '43'
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
        Name = 'CodCentroResp'
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
        Width = 185
      end
      item
        Caption = 'Ordenar por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Código do Grupo Orçamentário'
          'Nome do Grupo Orçamentário')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 70
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
        Name = 'Ordenacao'
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
        Width = 357
      end
      item
        Caption = 'Valores por'
        Controle = tcEdit
        TipodeDado = tdReal
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
        TextDefault = '0'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ValorDiv'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        MaskEditSettings.EditMask = '9999999,99'
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
        Width = 185
      end
      item
        Caption = 'Somente Contas com Movimento'
        Controle = tcEdit
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
        Caption = 'Plano Orçamentário'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   IDPLANOORCAMEN,'
          '   NOMEPLANOORC'
          'FROM'
          '  PLANOORCAMENTARIO'
          'ORDER BY'
          '  NOMEPLANOORC  ')
        LookupSettings.Chave = 'IDPLANOORCAMEN'
        LookupSettings.Display = 'NOMEPLANOORC'
        LookupSettings.Descricao = 'Plano'
        LookupSettings.Tamanho = '40'
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
        Caption = 'Grupo Orçamentário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   G.CODGRUPOORC,'
          '   G.NOMEGRUPOORCAMEN || '#39' - '#39' ||  P.NOMEPLANOORC AS PLANO'
          ''
          'FROM'
          '   GRUPOORCAMEN G,'
          '   PLANOORCAMENTARIO P'
          'WHERE'
          '   G.IDPLANOORCAMEN = P.IDPLANOORCAMEN'
          'ORDER BY'
          '   2   ')
        LookupSettings.Chave = 'CODGRUPOORC'
        LookupSettings.Display = 'PLANO'
        LookupSettings.Descricao = 'Grupo(s) orçamentário(s)'
        LookupSettings.Tamanho = '40'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 380
    FormWidth = 505
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpAtivGestor
    LabelEmpresa = ppLabel124
    LabelSistema = ppLabel125
  end
  object sqlAtivGestor: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   C.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, G.CODGRUPOORC, G.NOMEGR' +
        'UPOORCAMEN,'
      
        '   C.CODCENTRORESPON, CR.NOME,                                  ' +
        '                                                '
      '   VA.VLRORCACUM / :VALORDIV AS VLRORCADO,'
      '   VA.VLRREALACUM / :VALORDIV AS VLRREALIZADO,'
      '   VRA.VLRRES / :VALORDIV AS VLRRESERVADO,'
      '   VCA.VLRCOM / :VALORDIV AS VLRCOMPROMETIDO,'
      '   VCE.VLRCOMP / :VALORDIV AS VLREFETCOMP,'
      
        '   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM) -                ' +
        '                                                '
      
        '    DECODE(VA.VLRREALACUM,NULL,0,VA.VLRREALACUM)) / :VALORDIV AS' +
        ' SALDO1,'
      
        '   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)-                 ' +
        '                                                '
      
        '    DECODE(VRA.VLRRES,NULL,0,VRA.VLRRES)+                       ' +
        '                                                '
      '    DECODE(VCA.VLRCOM,NULL,0,VCA.VLRCOM)-'
      
        '    DECODE(VCE.VLRCOMP,NULL,0,VCE.VLRCOMP)) / :VALORDIV AS SALDO' +
        '2'
      'FROM'
      '   CONTASORCAMEN C,'
      '   GRUPOORCAMEN G,'
      '   CENTRESPON CR,'
      '   (SELECT'
      
        '       SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)) AS VLRORCACUM,   ' +
        '                                                '
      
        '       SUM(DECODE(VLRREALIZADO,NULL,0,VLRREALIZADO)) AS VLRREALA' +
        'CUM,'
      '       IDCONTAORCAMEN'
      
        '    FROM                                                        ' +
        '                '
      
        '       SALDOORCADO                                              ' +
        '                '
      
        '    WHERE                                                       ' +
        '                '
      '       (EXERCICIO = :EXERCICIO) AND'
      
        '       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND        ' +
        '                '
      
        '       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                   ' +
        '                '
      
        '       (IDPESSOA = :IDPESSOA)                                   ' +
        '                '
      '    GROUP BY'
      
        '       IDCONTAORCAMEN) VA,                                      ' +
        '                '
      
        '                                                                ' +
        '                '
      '   (SELECT'
      '       SUM(DECODE(VLRDEVOLVIDO,NULL,'
      
        '           DECODE(VLRCOMPROMISSO,NULL,VLRRESERVA,(VLRRESERVA-VLR' +
        'COMPROMISSO)),'
      
        '           DECODE(VLRCOMPROMISSO,NULL,(VLRRESERVA-VLRDEVOLVIDO),' +
        '                '
      
        '           (VLRRESERVA-VLRCOMPROMISSO-VLRDEVOLVIDO)))) AS VLRRES' +
        ', IDCONTAORCAMEN'
      '    FROM'
      '       RESERVAORCAMEN'
      '    WHERE'
      '       (EXERCICIO = :EXERCICIO) AND'
      '       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '       (IDPESSOA = :IDPESSOA) AND'
      '       (FLGRESCOMP = '#39'R'#39') AND (FLGRESERVA = '#39'A'#39')'
      ''
      '    GROUP BY'
      
        '       IDCONTAORCAMEN) VRA,                                     ' +
        '                '
      
        '                                                                ' +
        '                '
      
        '   (SELECT                                                      ' +
        '                '
      '       SUM(DECODE(VLRDEVOLVIDO,NULL,'
      
        '           DECODE(VLRCOMPROMISSO,NULL,VLRRESERVA,(VLRRESERVA-VLR' +
        'COMPROMISSO)),'
      '           DECODE(VLRCOMPROMISSO,NULL,(VLRRESERVA-VLRDEVOLVIDO),'
      
        '           (VLRRESERVA-VLRCOMPROMISSO-VLRDEVOLVIDO)))) AS VLRCOM' +
        ', IDCONTAORCAMEN'
      '    FROM'
      
        '       RESERVAORCAMEN                                           ' +
        '                '
      
        '    WHERE                                                       ' +
        '                '
      '       (EXERCICIO = :EXERCICIO) AND'
      '       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      
        '       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                   ' +
        '                '
      '       (IDPESSOA = :IDPESSOA) AND'
      '       (FLGRESCOMP = '#39'C'#39') AND'
      '       (FLGRESERVA = '#39'A'#39')'
      '    GROUP BY'
      '       IDCONTAORCAMEN) VCA,'
      ''
      '   (SELECT'
      
        '       SUM(DECODE(VLRCOMPROMISSO,NULL,0,VLRCOMPROMISSO)) AS VLRC' +
        'OMP,'
      '       IDCONTAORCAMEN'
      '    FROM'
      '       RESERVAORCAMEN'
      '    WHERE'
      '       (EXERCICIO = :EXERCICIO) AND'
      '       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '       (IDPESSOA = :IDPESSOA)'
      '    GROUP BY'
      '       IDCONTAORCAMEN) VCE'
      'WHERE'
      '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND'
      ''
      '   (C.IDCONTAORCAMEN = VCE.IDCONTAORCAMEN(+)) AND'
      '   (C.IDCONTAORCAMEN = VCA.IDCONTAORCAMEN(+)) AND'
      '   (C.IDCONTAORCAMEN = VRA.IDCONTAORCAMEN(+)) AND'
      '   (C.IDCONTAORCAMEN = VA.IDCONTAORCAMEN(+)) AND'
      '   (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '   :CODCENTRORESPON'
      '   ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '   (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND'
      '   (C.IDPESSOA = CR.IDPESSOA(+))'
      'ORDER BY'
      '   :ORDENACAO'
      '   C.IDCONTAORCAMEN'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnFormartParam = sqlAtivGestorFormartParam
    ClientDataSet = cdsAtivGestor
    Left = 16
    Top = 48
  end
  object cdsAtivGestor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 48
  end
  object dsAtivGestor: TwwDataSource
    DataSet = cdsAtivGestor
    Left = 93
    Top = 49
  end
  object pplAtivGestor: TppBDEPipeline
    DataSource = dsAtivGestor
    UserName = 'lAtivGestor'
    Left = 133
    Top = 49
  end
  object rpAtivGestor: TppReport
    AutoStop = False
    DataPipeline = pplAtivGestor
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 173
    Top = 49
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAtivGestor'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel123: TppLabel
        UserName = 'ppLabel123'
        Caption = 'Distribuição de Saldos por Grupos Orçamentários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 92075
        mmTop = 8731
        mmWidth = 100277
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'ppLabel124'
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
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rptAtivGestorLabel2: TppLabel
        UserName = 'rptAtivGestorLabel2'
        Caption = 'Conta Orcamentária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 22225
        mmWidth = 28840
        BandType = 0
      end
      object rptAtivGestorLabel3: TppLabel
        UserName = 'rptAtivGestorLabel3'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 100806
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel10: TppLabel
        UserName = 'rptAtivGestorLabel10'
        AutoSize = False
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 100806
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel4: TppLabel
        UserName = 'rptAtivGestorLabel4'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel11: TppLabel
        UserName = 'rptAtivGestorLabel11'
        AutoSize = False
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel5: TppLabel
        UserName = 'rptAtivGestorLabel5'
        AutoSize = False
        Caption = 'Reservas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel12: TppLabel
        UserName = 'rptAtivGestorLabel12'
        AutoSize = False
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel6: TppLabel
        UserName = 'rptAtivGestorLabel6'
        AutoSize = False
        Caption = 'Compromissos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel13: TppLabel
        UserName = 'rptAtivGestorLabel13'
        AutoSize = False
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel7: TppLabel
        UserName = 'rptAtivGestorLabel7'
        AutoSize = False
        Caption = 'Efetivados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel14: TppLabel
        UserName = 'rptAtivGestorLabel14'
        AutoSize = False
        Caption = 'Compromissos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel8: TppLabel
        UserName = 'rptAtivGestorLabel8'
        AutoSize = False
        Caption = 'Realizado )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 231511
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel9: TppLabel
        UserName = 'rptAtivGestorLabel9'
        AutoSize = False
        Caption = '( Orçado -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 231511
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel15: TppLabel
        UserName = 'rptAtivGestorLabel15'
        AutoSize = False
        Caption = '( Orçado -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLabel16: TppLabel
        UserName = 'rptAtivGestorLabel16'
        AutoSize = False
        Caption = 'Efetivado )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptAtivGestorLine2: TppLine
        UserName = 'rptAtivGestorLine2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 284300
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 3440
        mmWidth = 12171
        BandType = 0
      end
      object rptAtivGestorLabel17: TppLabel
        UserName = 'rptAtivGestorLabel17'
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 8731
        mmWidth = 13758
        BandType = 0
      end
      object rptAtivGestorLabel18: TppLabel
        UserName = 'rptAtivGestorLabel18'
        Caption = 'rptAtivGestorLabel18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 8731
        mmWidth = 28310
        BandType = 0
      end
      object rptAtivGestorLabel19: TppLabel
        UserName = 'rptAtivGestorLabel19'
        Caption = 'rptAtivGestorLabel19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 3440
        mmWidth = 28310
        BandType = 0
      end
      object rptAtivGestorLabel20: TppLabel
        UserName = 'rptAtivGestorLabel20'
        Caption = 'rptAtivGestorLabel20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 257440
        mmTop = 11377
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5292
        mmLeft = 266436
        mmTop = 3969
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rptAtivGestorDBText3: TppDBText
        UserName = 'rptAtivGestorDBText3'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplAtivGestor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 529
        mmWidth = 21696
        BandType = 4
      end
      object rptAtivGestorDBText4: TppDBText
        UserName = 'rptAtivGestorDBText4'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplAtivGestor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 529
        mmWidth = 61913
        BandType = 4
      end
      object rptAtivGestorDBText5: TppDBText
        UserName = 'rptAtivGestorDBText5'
        DataField = 'VLRORCADO'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestorDBText6: TppDBText
        UserName = 'rptAtivGestorDBText6'
        DataField = 'VLRREALIZADO'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestorDBText7: TppDBText
        UserName = 'rptAtivGestorDBText7'
        DataField = 'VLRCOMPROMETIDO'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestorDBText8: TppDBText
        UserName = 'rptAtivGestorDBText8'
        DataField = 'VLRRESERVADO'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestorDBText9: TppDBText
        UserName = 'rptAtivGestorDBText9'
        DataField = 'SALDO2'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestorDBText10: TppDBText
        UserName = 'rptAtivGestorDBText10'
        DataField = 'SALDO1'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 231511
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptAtivGestorDBText11: TppDBText
        UserName = 'rptAtivGestorDBText11'
        DataField = 'VLREFETCOMP'
        DataPipeline = pplAtivGestor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor'
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel125: TppLabel
        UserName = 'ppLabel125'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 3175
        mmWidth = 70644
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 3175
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rptAtivGestorGroup1: TppGroup
      BreakName = 'CODGRUPOORC'
      DataPipeline = pplAtivGestor
      OutlineSettings.CreateNode = True
      UserName = 'rptAtivGestorGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAtivGestor'
      object rptAtivGestorGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rptAtivGestorDBText1: TppDBText
          UserName = 'rptAtivGestorDBText1'
          DataField = 'CODGRUPOORC'
          DataPipeline = pplAtivGestor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAtivGestor'
          mmHeight = 4233
          mmLeft = 16140
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rptAtivGestorDBText2: TppDBText
          UserName = 'rptAtivGestorDBText2'
          DataField = 'NOMEGRUPOORCAMEN'
          DataPipeline = pplAtivGestor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAtivGestor'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 529
          mmWidth = 70379
          BandType = 3
          GroupNo = 0
        end
        object rptAtivGestorLabel1: TppLabel
          UserName = 'rptAtivGestorLabel1'
          Caption = 'Grupo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 529
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object rptAtivGestorLine3: TppLine
          UserName = 'rptAtivGestorLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object rptAtivGestorGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
        object rptAtivGestorLine1: TppLine
          UserName = 'rptAtivGestorLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
