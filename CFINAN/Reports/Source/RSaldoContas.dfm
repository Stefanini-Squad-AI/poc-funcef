inherited RptSaldoContas: TRptSaldoContas
  Left = 244
  Top = 211
  Width = 435
  Height = 367
  Caption = 'RptSaldoContas'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Saldo das Contas'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Saldo de Contas em'
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
        Caption = 'Status'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Só Conciliados'
          'Todos - na casa')
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
        Caption = 'Saldo por plano'
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
        Caption = 'Saldo por patrocinadora'
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
        Caption = 'Não exibir documentos em aberto'
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
        Caption = 'Conta'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  CODPORTADOR,DESCRICAO'
          'FROM PORTADORCONTA'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Conta'
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
        ComboBoxSettings.Style = csOwnerDrawFixed
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
    Formheight = 300
    FormWidth = 450
    Left = 216
  end
  inherited DevRptCM: TExtraOptions
    Left = 88
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = ppRelatorioGeral
    LabelSistema = lblSistema
    Left = 152
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 8
    Top = 288
  end
  object pplSaldo: TppBDEPipeline
    DataSource = dsSaldo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lSaldo'
    Left = 8
    Top = 216
    object pplSaldoppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSaldoppField2: TppField
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplSaldoppField3: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSaldoppField4: TppField
      FieldAlias = 'RECEBTOPAGTO'
      FieldName = 'RECEBTOPAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplSaldoppField5: TppField
      FieldAlias = 'SALDOATU'
      FieldName = 'SALDOATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsSaldo: TwwDataSource
    DataSet = cdsSaldo
    Left = 8
    Top = 256
  end
  object SqlSaldoPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   UN.DESCRICAO, /*Plano*/'
      '   UN.CODPORTADOR,'
      '   UN.IDPLANOPREV,'
      '   UN.NOME,'
      '   SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR,'
      '   SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO,'
      '   SUM(UN.SALDOATU) AS SALDOATU'
      'FROM'
      '   ((SELECT'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPLANOPREV,'
      '        P.NOME,'
      
        '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOANT' +
        'ERIOR,'
      '        0 AS RECTOPAGTO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOATU'
      '     FROM'
      '        PORTADORCONTA C,'
      '        MOVIMFINANC M,'
      '        RATEIOFINANC R,'
      '        PLANPREVCONTABIL P'
      '     WHERE'
      '       (M.DATALANCFINAN <= TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')) AND'
      '       (M.STATUSCONCILIA IN ('#39'P'#39','#39'X'#39','#39'I'#39','#39'N'#39','#39'C'#39','#39'J'#39')) AND'
      '       (M.IDPESSOA = :IDEmpresa) AND'
      '     '
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) AND'
      '       (M.CODLANCFINANC = R.CODLANCFINANC) AND'
      '       (C.CODPORTADOR = M.CODPORTADOR) AND'
      '       (R.IDPLANOPREV = P.IDPLANOPREV)'
      '     GROUP BY'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPLANOPREV,'
      '        P.NOME)'
      ''
      'UNION'
      ''
      '   (SELECT'
      
        '       DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       R.IDPLANOPREV,'
      '       PL.NOME,'
      '       0 AS SALDOANTERIOR,'
      '       SUM(S.SALDO) AS RECBTOPAGTO,'
      '       SUM(S.SALDO) AS SALDOATU'
      '    FROM'
      '       (SELECT'
      '           L.CODDOCUMENTO,'
      '           R.IDPLANOPREV,'
      '           SUM(DECODE(DEBCRE,'#39'D'#39',R.VALOR,-R.VALOR)) AS SALDO'
      '        FROM'
      '           LANCTODOCUM L ,'
      '           RATEIODOCUM R'
      '        WHERE'
      '           L.CODDOCUMENTO = R.CODDOCUMENTO'
      '        GROUP BY'
      '           L.CODDOCUMENTO,'
      '           R.IDPLANOPREV) S,'
      ''
      '        DOCUMENTO D,'
      '        LANCTODOCUM L,'
      '        PORTADORFORMA P,'
      '        PORTADORCONTA C,'
      '        RATEIODOCUM R,'
      '        PLANPREVCONTABIL PL,'
      '        PARAMFINANC PF'
      '    WHERE'
      '       ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '       ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACA' +
        'O = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '       (D.IDPESSOA = :IDEmpresa) AND'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECPAG =' +
        ' '#39'S'#39')) OR'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECPAG I' +
        'S NULL)) AND'
      
        '       ((D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))))) A' +
        'ND'
      '       (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.OPERACAO = L.OPERACAO) AND'
      '       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '       (R.IDPLANOPREV = PL.IDPLANOPREV) AND'
      '       (L.ESTORNO IS NULL) AND'
      '       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '       (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '       (D.IDPESSOA = PF.IDPESSOA) AND'
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) '
      '    GROUP BY'
      '       C.DESCRICAO,'
      '       C.CODPORTADOR,'
      '       R.IDPLANOPREV,'
      '       PL.NOME)) UN'
      'GROUP BY'
      '   UN.DESCRICAO,'
      '   UN.CODPORTADOR,'
      '   UN.IDPLANOPREV,'
      '   UN.NOME'
      'ORDER BY'
      '   UN.DESCRICAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 112
    Top = 40
  end
  object dsSaldoPlano: TwwDataSource
    Left = 168
    Top = 248
  end
  object CdsDadosEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 288
  end
  object SqlDadosEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  I.IMAGEM, P.RAZAOSOCIAL'
      'FROM'
      '  PESSOA P, IMAGENS I'
      'WHERE'
      '  (P.IDPESSOA = :IDPESSOA) AND'
      '  (I.IDIMAGEM = P.IDIMAGEM)')
    ClientDataSet = CdsDadosEmpresa
    Left = 280
    Top = 184
  end
  object dsDadosEmpresa: TwwDataSource
    DataSet = CdsDadosEmpresa
    Left = 280
    Top = 248
  end
  object ppLDadosEmpresa: TppDBPipeline
    DataSource = dsDadosEmpresa
    UserName = 'LDadosEmpresa'
    Left = 280
    Top = 216
  end
  object spSaldo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT UN.DESCRICAO, nvl(UN.CODPORTADOR,0) as CODPORTADOR, SUM(U' +
        'N.SALDOANTERIOR) AS SALDOANTERIOR,'
      
        '       SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO, SUM(UN.SALDOATU) AS S' +
        'ALDOATU'
      'FROM'
      '   ((SELECT C.DESCRICAO, C.CODPORTADOR,'
      
        '            SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',-M.VALORLANCFINAN,M.VA' +
        'LORLANCFINAN)) AS SALDOANTERIOR,'
      '            0 AS RECTOPAGTO,'
      
        '            SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',-M.VALORLANCFINAN,M.VA' +
        'LORLANCFINAN)) AS SALDOATU'
      '     FROM PORTADORCONTA C, MOVIMFINANC M'
      
        '     WHERE (M.DATALANCFINAN <= TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')) A' +
        'ND'
      '           (M.STATUSCONCILIA IN ('#39'N'#39')) AND'
      '           (M.IDPESSOA = :IDEmpresa) AND'
      '       '
      '           ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL))'
      ''
      '     GROUP BY C.DESCRICAO, C.CODPORTADOR)'
      '     UNION'
      
        '    (SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DE' +
        'SCRICAO) AS DESCRICAO, C.CODPORTADOR,'
      '            0 AS SALDOANTERIOR,'
      '            SUM(S.SALDO) AS RECBTOPAGTO,'
      '            SUM(S.SALDO) AS SALDOATU'
      '     FROM'
      
        '          (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'D'#39',VALOR,-VAL' +
        'OR)) AS SALDO'
      '           FROM LANCTODOCUM'
      '           GROUP BY CODDOCUMENTO) S,'
      '           DOCUMENTO D,'
      '           LANCTODOCUM L,'
      '           PORTADORFORMA P,'
      '           PORTADORCONTA C,'
      '           PARAMFINANC PF'
      '     WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '           ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPE' +
        'RACAO = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '           (D.IDPESSOA = :IDEmpresa) AND'
      
        '           (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECP' +
        'AG = '#39'S'#39')) OR'
      
        '           (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECP' +
        'AG IS NULL)) AND'
      
        '           ((D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')))' +
        ')) AND'
      '           (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '           (D.OPERACAO = L.OPERACAO) AND'
      '           (L.ESTORNO IS NULL) AND'
      '           (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '           (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '           (D.IDPESSOA = PF.IDPESSOA) AND'
      '           ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL))'
      '     GROUP BY C.DESCRICAO, C.CODPORTADOR)) UN'
      'GROUP BY  UN.DESCRICAO, UN.CODPORTADOR'
      'ORDER BY  UN.DESCRICAO'
      ''
      ' '
      ' ')
    Left = 112
    Top = 88
  end
  object sqlPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   UN.DESCRICAO, /*Patro*/'
      '   UN.NOME ,'
      '   UN.CODPORTADOR,'
      '   UN.IDPATRO,'
      '   SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR,'
      '   SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO,'
      '   SUM(UN.SALDOATU) AS SALDOATU'
      'FROM'
      '   ((SELECT'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPATRO,'
      
        '        DECODE (PA.NOME,NULL, '#39'Patrocinadora não encontrada'#39', PA' +
        '.NOME) AS NOME,'
      
        '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOANT' +
        'ERIOR,'
      '        0 AS RECTOPAGTO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOATU'
      '     FROM'
      '        PORTADORCONTA C,'
      '        MOVIMFINANC M,'
      '        RATEIOFINANC R,'
      '        PESSOA PA'
      ''
      '     WHERE'
      '       (R.IDPATRO = PA.IDPESSOA(+)) AND'
      '       (M.DATALANCFINAN <= TO_DATE(:dataref,'#39'DD/MM/YYYY'#39')) AND'
      '       (M.STATUSCONCILIA IN ('#39'P'#39','#39'X'#39','#39'I'#39','#39'N'#39','#39'C'#39','#39'J'#39')) AND'
      '       (M.IDPESSOA = :IDEmpresa) AND'
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) AND'
      '       (C.CODPORTADOR = M.CODPORTADOR) AND'
      '       (M.CODLANCFINANC = R.CODLANCFINANC)'
      ''
      '     GROUP BY'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPATRO,'
      '        PA.NOME)'
      ''
      'UNION'
      ''
      '   (SELECT'
      
        '       DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       R.IDPATRO,'
      '       PA.NOME,'
      '       0 AS SALDOANTERIOR,'
      '       SUM(S.SALDO) AS RECBTOPAGTO,'
      '       SUM(S.SALDO) AS SALDOATU'
      '    FROM'
      '       (SELECT'
      '           L.CODDOCUMENTO,'
      '           R.IDPATRO,'
      '           SUM(DECODE(DEBCRE,'#39'D'#39',R.VALOR,-R.VALOR)) AS SALDO'
      '        FROM'
      '           LANCTODOCUM L ,'
      '           RATEIODOCUM R'
      '        WHERE'
      '           L.CODDOCUMENTO = R.CODDOCUMENTO'
      '        GROUP BY'
      '           L.CODDOCUMENTO,'
      '           R.IDPATRO) S,'
      ''
      '        DOCUMENTO D,'
      '        LANCTODOCUM L,'
      '        PORTADORFORMA P,'
      '        PORTADORCONTA C,'
      '        RATEIODOCUM R,'
      '        PESSOA PA,'
      '        PARAMFINANC PF'
      '    WHERE'
      '       ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '       ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACA' +
        'O = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '       (D.IDPESSOA = :IDEmpresa) AND'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECPAG =' +
        ' '#39'S'#39')) OR'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECPAG I' +
        'S NULL)) AND'
      
        '       ((D.DATAPROGRAMADA = TO_DATE(:dataref,'#39'DD/MM/YYYY'#39'))))) A' +
        'ND'
      '       (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.OPERACAO = L.OPERACAO) AND'
      '       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '       (R.IDPATRO = PA.IDPESSOA) AND'
      '       (L.ESTORNO IS NULL) AND'
      '       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '       (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '       (D.IDPESSOA = PF.IDPESSOA) AND'
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) '
      '    GROUP BY'
      '      C.DESCRICAO,'
      '      C.CODPORTADOR,'
      '      R.IDPATRO,'
      '      PA.NOME'
      '       )) UN'
      'GROUP BY'
      '   UN.DESCRICAO,'
      '   UN.CODPORTADOR,'
      '   UN.IDPATRO,'
      '   UN.NOME'
      'ORDER BY'
      '   UN.DESCRICAO,'
      '   UN.NOME'
      ' '
      ' ')
    Left = 112
    Top = 168
  end
  object ppPatro: TppBDEPipeline
    DataSource = dsPatro
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Patro'
    Left = 112
    Top = 216
  end
  object dsPatro: TwwDataSource
    Left = 112
    Top = 248
  end
  object sqlPlanoPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   UN.DESCRICAO,   /* Plano Patro*/'
      '   un.NOMEPlano ||'#39' - '#39' || un.nome AS NOME,   '
      '   UN.CODPORTADOR,'
      '   UN.IDPATRO,'
      '   un.idplanoprev,'
      '   SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR,'
      '   SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO,'
      '   SUM(UN.SALDOATU) AS SALDOATU'
      'FROM'
      '   ((SELECT'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPATRO,'
      '        ppc.nome as NOMEPlano,'
      '        r.idplanoprev,'
      
        '        DECODE (PA.NOME,NULL, '#39'Plano - Patrocinadora não encontr' +
        'ada'#39', PA.NOME) AS NOME,'
      
        '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOANT' +
        'ERIOR,'
      '        0 AS RECTOPAGTO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOATU'
      '     FROM'
      '        PORTADORCONTA C,'
      '        MOVIMFINANC M,'
      '        RATEIOFINANC R,'
      '        PESSOA PA,'
      '        planprevcontabil ppc'
      ''
      '     WHERE'
      '       (R.IDPATRO = PA.IDPESSOA(+)) AND'
      '       (M.DATALANCFINAN <= TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')) AND'
      '       (M.STATUSCONCILIA IN ('#39'P'#39','#39'X'#39','#39'I'#39','#39'N'#39','#39'C'#39','#39'J'#39')) AND'
      '       (M.IDPESSOA = :IDEmpresa) AND'
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) AND'
      '       (C.CODPORTADOR = M.CODPORTADOR) AND'
      '       (M.CODLANCFINANC = R.CODLANCFINANC) and'
      '       (ppc.idplanoprev(+) = r.idplanoprev )'
      ''
      ''
      '     GROUP BY'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        r.idplanoprev,'
      '        ppc.nome,'
      '        R.IDPATRO,'
      '        PA.NOME)'
      ''
      'UNION'
      ''
      '   (SELECT'
      
        '       DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       R.IDPATRO,'
      '       ppc.nome ,'
      '       r.idplanoprev,'
      '       PA.NOME,'
      '       0 AS SALDOANTERIOR,'
      '       SUM(S.SALDO) AS RECBTOPAGTO,'
      '       SUM(S.SALDO) AS SALDOATU'
      '    FROM'
      '       (SELECT'
      '           L.CODDOCUMENTO,'
      '           R.IDPATRO,'
      '           r.idplanoprev,'
      '           SUM(DECODE(DEBCRE,'#39'D'#39',R.VALOR,-R.VALOR)) AS SALDO'
      '        FROM'
      '           LANCTODOCUM L ,'
      '           RATEIODOCUM R'
      '        WHERE'
      '           L.CODDOCUMENTO = R.CODDOCUMENTO'
      '        GROUP BY'
      '           L.CODDOCUMENTO,'
      '           R.IDPATRO,'
      '           r.idplanoprev) S,'
      ''
      '        DOCUMENTO D,'
      '        LANCTODOCUM L,'
      '        PORTADORFORMA P,'
      '        PORTADORCONTA C,'
      '        RATEIODOCUM R,'
      '        PESSOA PA,'
      '        PARAMFINANC PF,'
      '        planprevcontabil ppc'
      '    WHERE'
      '       ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '       ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACA' +
        'O = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '       (D.IDPESSOA = :IDEmpresa) AND'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECPAG =' +
        ' '#39'S'#39')) OR'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECPAG I' +
        'S NULL)) AND'
      
        '       ((D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))))) A' +
        'ND'
      '       (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.OPERACAO = L.OPERACAO) AND'
      '       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '       (R.IDPATRO = PA.IDPESSOA) AND'
      '       (L.ESTORNO IS NULL) AND'
      '       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '       (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '       (D.IDPESSOA = PF.IDPESSOA) AND'
      '       (ppc.idplanoprev(+) = r.idplanoprev) and'
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) '
      '       '
      '    GROUP BY'
      '      C.DESCRICAO,'
      '      C.CODPORTADOR,'
      '      ppc.nome,'
      '      R.IDPATRO,'
      '      r.idplanoprev,'
      '      PA.NOME'
      '       )) UN'
      'GROUP BY'
      '   UN.DESCRICAO,'
      '   UN.CODPORTADOR,'
      '   UN.IDPATRO,'
      'un.NOMEPlano,'
      '   UN.NOME,'
      '   un.idplanoprev'
      'ORDER BY'
      '   UN.DESCRICAO,'
      '   UN.NOME'
      ' ')
    Left = 112
    Top = 128
  end
  object ppRelatorioGeral: TppReport
    AutoStop = False
    DataPipeline = pplSaldo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 8
    Top = 176
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldo'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppTitulo: TppShape
        UserName = 'Titulo'
        Brush.Color = 13160660
        Pen.Color = 13160660
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 1588
        mmTop = 25929
        mmWidth = 195792
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 1588
        mmTop = 25929
        mmWidth = 195792
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'rpSaldoLabel1'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 26988
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'rpSaldoLabel2'
        Caption = 'Saldo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 123031
        mmTop = 27252
        mmWidth = 8467
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'rpSaldoLine1'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 31485
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'rpSaldoLabel3'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 26988
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'rpSaldoLabel5'
        Caption = 'Receb.-Pagto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 27252
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'rpSaldoLabel7'
        Caption = 'Saldo a Aplicar/Resg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 26988
        mmWidth = 32279
        BandType = 0
      end
      object dbLogo: TppDBImage
        UserName = 'DbLogo1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppLDadosEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppLDadosEmpresa'
        mmHeight = 15346
        mmLeft = 1323
        mmTop = 2646
        mmWidth = 17992
        BandType = 0
      end
      object lblSubTitulo: TppLabel
        UserName = 'lblSubTitulo'
        Caption = 'Saldo de contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 23019
        mmTop = 7673
        mmWidth = 26966
        BandType = 0
      end
      object lblStatus: TppLabel
        UserName = 'LbDescPerfil1'
        Caption = 'LbDescPerfil'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 12435
        mmWidth = 19579
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LbPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 16404
        mmWidth = 11906
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppLDadosEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppLDadosEmpresa'
        mmHeight = 4191
        mmLeft = 23019
        mmTop = 2646
        mmWidth = 25442
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        OnPrint = ppSubReport2Print
        UserName = 'SubReport2'
        DrillDownComponent = ppMaozinha
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppAux'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5292
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppAux
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 14000
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Left = 256
          Top = 216
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppAux'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2879
              mmLeft = 124090
              mmTop = 1588
              mmWidth = 6265
              BandType = 1
            end
            object lblPlanoPatro: TppLabel
              UserName = 'lblPlanoPatro'
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 23813
              mmTop = 1588
              mmWidth = 15081
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'Receb.-Pagto. em Aberto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2879
              mmLeft = 136790
              mmTop = 1588
              mmWidth = 27601
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'Saldo à Pagar/Receb.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2879
              mmLeft = 171874
              mmTop = 1588
              mmWidth = 23918
              BandType = 1
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 23813
              mmTop = 5291
              mmWidth = 173832
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppZebra: TppShape
              OnPrint = ppZebraPrint
              UserName = 'Zebra'
              Brush.Color = 13160660
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 23548
              mmTop = 264
              mmWidth = 173567
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'NOME'
              DataPipeline = ppAux
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAux'
              mmHeight = 2910
              mmLeft = 23813
              mmTop = 265
              mmWidth = 71173
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'SALDOANTERIOR'
              DataPipeline = ppAux
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppAux'
              mmHeight = 2910
              mmLeft = 107421
              mmTop = 265
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              AutoSize = True
              DataField = 'RECEBTOPAGTO'
              DataPipeline = ppAux
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppAux'
              mmHeight = 2879
              mmLeft = 143669
              mmTop = 265
              mmWidth = 20574
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              AutoSize = True
              DataField = 'SALDOATU'
              DataPipeline = ppAux
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppAux'
              mmHeight = 2879
              mmLeft = 182499
              mmTop = 265
              mmWidth = 13293
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppMaozinha: TppShape
        UserName = 'Maozinha'
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'DESCRICAO'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 265
        mmWidth = 77788
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'rpSaldoDBText1'
        DataField = 'CODPORTADOR'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'rpSaldoDBText2'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 139171
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'rpSaldoDBText3'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'rpSaldoDBText4'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 107156
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 1852
        mmWidth = 25665
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        Caption = 'lblSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 2117
        mmWidth = 14288
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 94986
        mmTop = 2117
        mmWidth = 14986
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object lblSaldoGeral: TppLabel
        UserName = 'rpSaldoLabel4'
        Caption = 'Saldo Geral das Contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 46038
        mmTop = 8731
        mmWidth = 40746
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'rpSaldoDBCalc1'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 4191
        mmLeft = 86931
        mmTop = 8731
        mmWidth = 43773
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'rpSaldoDBCalc2'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 4191
        mmLeft = 119751
        mmTop = 8731
        mmWidth = 42968
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'rpSaldoDBCalc3'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 4191
        mmLeft = 163947
        mmTop = 8731
        mmWidth = 32639
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 288
  end
  object ppAux: TppBDEPipeline
    DataSource = dsAux
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Aux'
    Left = 64
    Top = 216
    MasterDataPipelineName = 'pplSaldo'
    object ppAuxppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAuxppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAuxppField3: TppField
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAuxppField4: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAuxppField5: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAuxppField6: TppField
      FieldAlias = 'RECEBTOPAGTO'
      FieldName = 'RECEBTOPAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppAuxppField7: TppField
      FieldAlias = 'SALDOATU'
      FieldName = 'SALDOATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 64
    Top = 256
  end
  object sqlRelPrincipal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   '#39#39' as DESCRICAO,   '
      '   '#39#39' as NOME,   '
      '   0 as CODPORTADOR,'
      '   0 as IDPATRO,'
      '   0 as idplanoprev,'
      '   0 as SALDOANTERIOR,'
      '   0 as RECEBTOPAGTO,'
      '   0 as SALDOATU'
      'from '
      'dual'
      'where'
      '1=2')
    ClientDataSet = cdsAux
    Left = 64
    Top = 176
  end
end
