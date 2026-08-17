inherited RptApGr2: TRptApGr2
  Left = 486
  Top = 69
  Width = 306
  Height = 415
  Caption = 'RptApGr2'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'numapgr'
        Controle = tcEdit
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
        Caption = 'CkbDocCancel'
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
    Left = 148
    Top = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 32
    Top = 16
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptApGr2
    LabelEmpresa = ppLabel6
    LabelSistema = ppLabel10
    Left = 91
    Top = 16
  end
  object PpApGr: TppBDEPipeline
    DataSource = DsApGr
    OpenDataSource = False
    UserName = 'PpApGr'
    Left = 201
    Top = 73
    object PpApGrppField1: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpApGrppField2: TppField
      FieldAlias = 'NOMEBANCO'
      FieldName = 'NOMEBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpApGrppField3: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpApGrppField4: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpApGrppField5: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpApGrppField6: TppField
      FieldAlias = 'TIPODOC'
      FieldName = 'TIPODOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpApGrppField7: TppField
      FieldAlias = 'FORCLI'
      FieldName = 'FORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpApGrppField8: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpApGrppField9: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpApGrppField10: TppField
      FieldAlias = 'CONTACONTABIL'
      FieldName = 'CONTACONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpApGrppField11: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpApGrppField12: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpApGrppField13: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpApGrppField14: TppField
      FieldAlias = 'VALORDOC'
      FieldName = 'VALORDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpApGrppField15: TppField
      FieldAlias = 'DATADOC'
      FieldName = 'DATADOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpApGrppField16: TppField
      FieldAlias = 'DESCNUMAPGR'
      FieldName = 'DESCNUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpApGrppField17: TppField
      FieldAlias = 'DESCESTORNO'
      FieldName = 'DESCESTORNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpApGrppField18: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpApGrppField19: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpApGrppField20: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpApGrppField21: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpApGrppField22: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object DsApGr: TwwDataSource
    DataSet = CdsAp
    Left = 148
    Top = 73
  end
  object DsContabLanc: TwwDataSource
    DataSet = CdsContabLanc
    Left = 148
    Top = 242
  end
  object PpContabLanc: TppBDEPipeline
    DataSource = DsContabLanc
    OpenDataSource = False
    UserName = 'PpContabLanc'
    Left = 201
    Top = 242
  end
  object DsContab3: TwwDataSource
    DataSet = CdsContab3
    Left = 148
    Top = 304
  end
  object PpContab3: TppBDEPipeline
    DataSource = DsContab3
    OpenDataSource = False
    UserName = 'PpContab3'
    Left = 201
    Top = 304
    object PpContab3ppField1: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpContab3ppField2: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpContab3ppField3: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpContab3ppField4: TppField
      FieldAlias = 'HISTLANCAMENTOCONTABIL'
      FieldName = 'HISTLANCAMENTOCONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object SqlAp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' ('#39'Nº '#39' || RTRIM(TO_CHAR(NUMAPGR))) AS DESCNUMAPGR,'
      '  NUMBANCO,'
      '  NOMEBANCO,'
      '  NUMAGENCIA,'
      '  NOCONTACORR,'
      '  DATALANCTO,'
      '  TIPODOC,'
      '  FORCLI,'
      '  CODDOCUMENTO,'
      '  NUMDOC,'
      '  NUMCHQBORDERO,'
      '  CONTACONTABIL,'
      '  HISTORICO,'
      '  DEBCRE,'
      '  VALOR,'
      '  VALORDOC,'
      '  DATADOC,'
      '  DESCESTORNO,'
      '  NUMAPGR'
      'FROM'
      '('
      'SELECT'
      '     D.NUMAPGR,'
      '     B.NUMBANCO,'
      '     PB.RAZAOSOCIAL AS NOMEBANCO,'
      '     AG.NUMAGENCIA,'
      '     PC.NOCONTACORR,'
      '     L.DATALANCTO,'
      '     TD.DESCRICAO AS TIPODOC,'
      '     PD.RAZAOSOCIAL AS FORCLI,'
      '     D.CODDOCUMENTO,'
      '     (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '     R.NUMCHQBORDERO,'
      '     PC.PLACONTA AS CONTACONTABIL,'
      
        '     ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUMENT' +
        'O) AS HISTORICO,'
      '     DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '     L.VALOR,'
      '     LANC.VALOR AS VALORDOC,'
      '     LANC.DATALANCTO AS DATADOC,'
      
        '     DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39') A' +
        'S DESCESTORNO'
      'FROM'
      ' DOCUMENTO D,'
      ' LANCTODOCUM L,'
      ' EMPRESAFORN E,'
      ' RECBTOPAGTO R,'
      ' PORTADORFORMA P,'
      ' PORTADORCONTA PC,'
      ' PLANILHA PL,'
      ' AGENCIABANCARIA AG,'
      ' BANCO B,'
      ' PESSOA PB,'
      ' TIPODOCRECPAG TD,'
      ' PESSOA PD,'
      ' (SELECT'
      '     VALOR,CODDOCUMENTO, DATALANCTO'
      '  FROM'
      
        '     LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39'10'#39 +
        ')) LANC'
      'WHERE'
      
        '((RTRIM(D.OPERACAO) = '#39'10'#39') OR (RTRIM(D.OPERACAO) = '#39'15'#39') OR (RT' +
        'RIM(D.STATUS) = '#39'2'#39') OR ((RTRIM(D.STATUS) = '#39'0'#39') AND (L.ESTORNO ' +
        '> 0))) AND'
      '(D.RECPAG = :PRECPAG)                AND'
      '(D.IDPESSOA = :PIDEMPRESA)           AND'
      '(D.NUMAPGR = :PNUMAPGR)              AND'
      '(D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '(D.IDFORCLI = PD.IDPESSOA)           AND'
      '(D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.NUMLANCTO = L.NUMLANCTO)          AND'
      '(R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ''
      '(R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      ''
      '(PC.IDBANCO = B.IDPESSOA)'#9'    AND'
      '(B.IDPESSOA = PB.IDPESSOA)           AND'
      '(D.IDFORCLI = E.IDFORCLI)            AND'
      '(D.IDPESSOA = E.IDPESSOA)            AND'
      ''
      '(P.CODPORTADOR = PC.CODPORTADOR)     AND'
      ''
      '(PL.PLNCODIGO(+) = L.PLNCODIGO)      AND'
      '(AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '(TD.CODTIPDOC = D.CODTIPDOC)'
      ''
      'UNION'
      ''
      'SELECT'
      '    D.NUMAPGR,'
      '    B.NUMBANCO,'
      '    PB.RAZAOSOCIAL AS NOMEBANCO,'
      '    AG.NUMAGENCIA,'
      '    PC.NOCONTACORR,'
      '    L.DATALANCTO,'
      '    TD.DESCRICAO AS TIPODOC,'
      '    PD.RAZAOSOCIAL AS FORCLI,'
      '    D.CODDOCUMENTO,'
      '    (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '    R.NUMCHQBORDERO,'
      
        '    DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTACONT' +
        'ABIL,'
      
        '    ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUMENTO' +
        ') AS HISTORICO,'
      '    L.DEBCRE,'
      '    L.VALOR,'
      '    LANC.VALOR AS VALORDOC,'
      '    LANC.DATALANCTO AS DATADOC,'
      
        '    DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39') AS' +
        ' DESCESTORNO'
      'FROM'
      ' DOCUMENTO D,'
      ' LANCTODOCUM L,'
      ' EMPRESAFORN E,'
      ' RECBTOPAGTO R,'
      ' PORTADORFORMA P,'
      ' PORTADORCONTA PC,'
      ' PLANILHA PL,'
      ' AGENCIABANCARIA AG,'
      ' BANCO B,'
      ' PESSOA PB,'
      ' TIPODOCRECPAG TD,'
      ' PESSOA PD,'
      ' (SELECT'
      '     VALOR,CODDOCUMENTO, DATALANCTO'
      '  FROM'
      
        '     LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39'10'#39 +
        ')) LANC'
      'WHERE'
      
        '((RTRIM(D.OPERACAO) = '#39'10'#39') OR (RTRIM(D.OPERACAO) = '#39'15'#39') OR (RT' +
        'RIM(D.STATUS) = '#39'2'#39') OR ((RTRIM(D.STATUS) = '#39'0'#39') AND (L.ESTORNO ' +
        '> 0))) AND'
      '(D.RECPAG = :PRECPAG)                AND'
      '(D.IDPESSOA = :PIDEMPRESA)           AND'
      '(D.NUMAPGR = :PNUMAPGR)              AND'
      '(D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '(D.IDFORCLI = PD.IDPESSOA)           AND'
      '(D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.NUMLANCTO = L.NUMLANCTO)          AND'
      '(R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '(PC.IDBANCO = B.IDPESSOA)'#9'     AND'
      '(B.IDPESSOA = PB.IDPESSOA)           AND'
      '(D.IDFORCLI = E.IDFORCLI)            AND'
      '(D.IDPESSOA = E.IDPESSOA)            AND'
      '(P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '(PL.PLNCODIGO(+) = L.PLNCODIGO)      AND'
      '(AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '(TD.CODTIPDOC = D.CODTIPDOC)'
      ')'
      'ORDER BY'
      'NUMBANCO,'
      'NOCONTACORR,'
      'NUMCHQBORDERO,'
      'CODDOCUMENTO,'
      'DATALANCTO,'
      'DEBCRE'
      '')
    ClientDataSet = CdsAp
    Left = 91
    Top = 73
  end
  object CdsAp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsApAfterScroll
    Left = 32
    Top = 73
  end
  object PpTotApGr: TppBDEPipeline
    DataSource = DsTotApGr
    OpenDataSource = False
    UserName = 'PpTotApGr'
    Left = 201
    Top = 184
  end
  object DsTotApGr: TwwDataSource
    DataSet = CdsTotApGr
    Left = 148
    Top = 184
  end
  object SqlTotApGr: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      ' D.NUMAPGR,'
      
        '  SUM( decode(l.operacao,'#39'10'#39',DECODE(D.RECPAG,'#39'R'#39',DECODE(DEBCRE,' +
        #39'D'#39',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1)),'
      
        '                                           DECODE(D.RECPAG,'#39'R'#39',D' +
        'ECODE(DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,'#39'D'#39',L.VALOR,L' +
        '.VALOR*-1)) ) ) AS VALOR'
      'FROM '
      '  DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R'
      'WHERE '
      '  D.CODDOCUMENTO = L.CODDOCUMENTO AND '
      '  L.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '  L.NUMLANCTO    = R.NUMLANCTO    AND'
      '  D.NUMAPGR      = :NUMAPGR             '
      'GROUP BY'
      'D.NUMAPGR')
    ClientDataSet = CdsTotApGr
    Left = 91
    Top = 184
  end
  object CdsTotApGr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 184
  end
  object SqlGr: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    ('#39'Nº '#39' || RTRIM(TO_CHAR(NUMAPGR))) AS DESCNUMAPGR,'
      '    NUMBANCO,'
      '    NOMEBANCO,'
      '    NUMAGENCIA,'
      '    NOCONTACORR,'
      '    DATALANCTO,'
      '    TIPODOC,'
      '    FORCLI,'
      '    CODDOCUMENTO,'
      '    NUMDOC,'
      '    NUMCHQBORDERO,'
      '    CONTACONTABIL,'
      '    HISTORICO,'
      '    DEBCRE,'
      '    VALOR,'
      '    VALORDOC,'
      '    DATADOC,'
      '    DESCESTORNO,'
      '    NUMAPGR    '
      'FROM'
      '('
      'SELECT'
      '       D.NUMAPGR,'
      '       B.NUMBANCO,'
      '       PB.RAZAOSOCIAL AS NOMEBANCO,'
      '       AG.NUMAGENCIA,'
      '       PC.NOCONTACORR,'
      '       L.DATALANCTO,'
      '       TD.DESCRICAO AS TIPODOC,'
      '       PD.RAZAOSOCIAL AS FORCLI,'
      '       D.CODDOCUMENTO,'
      '       (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '       R.NUMCHQBORDERO,'
      '       PC.PLACONTA AS CONTACONTABIL,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '       L.VALOR,'
      '       LANC.VALOR AS VALORDOC,'
      '       LANC.DATALANCTO AS DATADOC,'
      
        '       DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39')' +
        ' AS DESCESTORNO       '
      'FROM'
      '    DOCUMENTO D,'
      '    LANCTODOCUM L,'
      '    EMPRESACLIENTE E,'
      '    RECBTOPAGTO R,'
      '    PORTADORFORMA P,'
      '    PORTADORCONTA PC,'
      '    PLANILHA PL,'
      '    AGENCIABANCARIA AG,'
      '    BANCO B,'
      '    PESSOA PB,'
      '    TIPODOCRECPAG TD,'
      '    PESSOA PD,'
      '    (SELECT'
      '        VALOR,CODDOCUMENTO, DATALANCTO'
      '     FROM'
      
        '        LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39 +
        '10'#39')) LANC'
      ' WHERE'
      ' (D.RECPAG = :PRECPAG)                AND'
      ' (D.IDPESSOA = :PIDEMPRESA)           AND'
      ' (D.NUMAPGR = :PNUMAPGR)              AND'
      ' (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      ' (D.IDFORCLI = PD.IDPESSOA)           AND'
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.NUMLANCTO = L.NUMLANCTO)          AND'
      ' (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      ' (PC.IDBANCO = B.IDPESSOA)'#9'      AND'
      ' (B.IDPESSOA = PB.IDPESSOA)           AND'
      ' (D.IDFORCLI = E.IDFORCLI)            AND'
      ' (D.IDPESSOA = E.IDPESSOA)            AND'
      ' (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      ' (PL.PLNCODIGO(+) = L.PLNCODIGO)          AND'
      ' (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      ' (TD.CODTIPDOC = D.CODTIPDOC)'
      ''
      'UNION'
      ''
      'SELECT'
      '       D.NUMAPGR,'
      '       B.NUMBANCO,'
      '       PB.RAZAOSOCIAL AS NOMEBANCO,'
      '       AG.NUMAGENCIA,'
      '       PC.NOCONTACORR,'
      '       L.DATALANCTO,'
      '       TD.DESCRICAO AS TIPODOC,'
      '       PD.RAZAOSOCIAL AS FORCLI,'
      '       D.CODDOCUMENTO,'
      '       (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '       R.NUMCHQBORDERO,'
      
        '       DECODE(D.PLACONTA,NULL,E.CONTACCLIENTE,D.PLACONTA) AS CON' +
        'TACONTABIL,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       L.DEBCRE,'
      '       L.VALOR,'
      '       LANC.VALOR AS VALORDOC,'
      '       LANC.DATALANCTO AS DATADOC,'
      
        '       DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39')' +
        ' AS DESCESTORNO'
      'FROM'
      '    DOCUMENTO D,'
      '    LANCTODOCUM L,'
      '    EMPRESACLIENTE E,'
      '    RECBTOPAGTO R,'
      '    PORTADORFORMA P,'
      '    PORTADORCONTA PC,'
      '    PLANILHA PL,'
      '    AGENCIABANCARIA AG,'
      '    BANCO B,'
      '    PESSOA PB,'
      '    TIPODOCRECPAG TD,'
      '    PESSOA PD,'
      '    (SELECT'
      '        VALOR,CODDOCUMENTO, DATALANCTO'
      '     FROM'
      
        '        LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39 +
        '10'#39')) LANC'
      ' WHERE'
      ' (D.RECPAG = :PRECPAG)                AND'
      ' (D.IDPESSOA = :PIDEMPRESA)           AND'
      ' (D.NUMAPGR = :PNUMAPGR)              AND'
      ' (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      ' (D.IDFORCLI = PD.IDPESSOA)           AND'
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.NUMLANCTO = L.NUMLANCTO)          AND'
      ' (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      ' (PC.IDBANCO = B.IDPESSOA)'#9'      AND'
      ' (B.IDPESSOA = PB.IDPESSOA)           AND'
      ' (D.IDFORCLI = E.IDFORCLI)            AND'
      ' (D.IDPESSOA = E.IDPESSOA)            AND'
      ' (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      ' (PL.PLNCODIGO(+) = L.PLNCODIGO)          AND'
      ' (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      ' (TD.CODTIPDOC = D.CODTIPDOC)'
      ')'
      'ORDER BY'
      '  NUMBANCO,'
      '  NOCONTACORR,'
      '  NUMCHQBORDERO,'
      '  CODDOCUMENTO,'
      '  DATALANCTO,'
      '  DEBCRE'
      '')
    ClientDataSet = CdsGr
    Left = 91
    Top = 128
  end
  object CdsGr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 128
  end
  object CdsContab3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 304
  end
  object SqlContab3: TCMSqlParams
    SQL.Strings = (
      
        'SELECT Q2.LACDEBCRE, Q2.PLACONTA,  ((Q1.VALOR * Q2.LACVALOR)/ Q2' +
        '.VALOR) AS VALOR,'
      '  Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL'
      ' FROM'
      '(SELECT'
      
        '  LAN.VALOR, DOC.NUMFATURA, '#39'LANÇAMENTO DO DOCUMENTO '#39' || DOC.NO' +
        'DOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL AS HISTO' +
        'RICOCOMPL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  PESSOA P'
      'WHERE'
      '  (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (LAN.OPERACAO = '#39'3'#39') AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '  (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '(SELECT'
      
        '  DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, LAN.VA' +
        'LOR,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC'
      'WHERE'
      '  (LAN.OPERACAO = '#39'1'#39') AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '  (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2'
      ''
      'WHERE Q1.NUMFATURA = Q2.NUMFATURA'
      'ORDER BY Q2.LACDEBCRE')
    ClientDataSet = CdsContab3
    Left = 91
    Top = 304
  end
  object CdsContabLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 242
  end
  object SqlContabLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DOC.OPERACAO, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC'
      'WHERE'
      '  (DOC.CODDOCUMENTO = :CODDOCUMENTO)    AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '  (LAN.PLNCODIGO    = LC.PLNCODIGO)     AND'
      '  (LAN.OPERACAO     <> '#39'5'#39')             AND'
      '  (LAN.OPERACAO     <> '#39'15'#39')             AND'
      '  (LAN.OPERACAO     <> '#39'3'#39')             AND'
      '  ((DOC.OPERACAO    <> '#39'1'#39')             AND'
      '  ((DOC.NUMFATURA IS NULL) OR (DOC.NUMFATURA = 0)))'
      'ORDER BY'
      '  LC.LACDEBCRE,'
      '  LC.PLACONTA')
    ClientDataSet = CdsContabLanc
    Left = 91
    Top = 242
  end
  object RptApGr2: TppReport
    AutoStop = False
    DataPipeline = PpApGr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
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
    Left = 249
    Top = 73
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpApGr'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'CM Soluções Informática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 65881
        mmTop = 1058
        mmWidth = 57944
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Comprovante de Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 68527
        mmTop = 7144
        mmWidth = 55827
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 18256
        mmWidth = 190000
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        AutoSize = True
        DataField = 'DESCNUMAPGR'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 4233
        mmLeft = 81227
        mmTop = 13229
        mmWidth = 27781
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        AutoSize = True
        DataField = 'CONTACONTABIL'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 6350
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpApGr
        DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        AutoSize = True
        DataField = 'DEBCRE'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 178065
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'ppDBMemo1'
        CharWrap = True
        DataField = 'HISTORICO'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 0
        mmWidth = 98425
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 21431
        mmWidth = 27517
        BandType = 8
      end
      object ppShape3: TppShape
        UserName = 'ppShape3'
        mmHeight = 13229
        mmLeft = 1058
        mmTop = 5556
        mmWidth = 60590
        BandType = 8
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Vistos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 10319
        BandType = 8
      end
      object ppLabel41: TppLabel
        UserName = 'ppLabel41'
        AutoSize = False
        Caption = 'ppLabel41'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 6085
        mmWidth = 59531
        BandType = 8
      end
      object RptApGr2Shape1: TppShape
        UserName = 'RptApGr2Shape1'
        mmHeight = 13229
        mmLeft = 129382
        mmTop = 5556
        mmWidth = 60590
        BandType = 8
      end
      object RptApGr2Label1: TppLabel
        UserName = 'RptApGr2Label1'
        AutoSize = False
        Caption = 'RptApGr2Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 6085
        mmWidth = 59531
        BandType = 8
      end
      object RptApGr2Shape2: TppShape
        UserName = 'RptApGr2Shape2'
        mmHeight = 13229
        mmLeft = 65881
        mmTop = 5556
        mmWidth = 60590
        BandType = 8
      end
      object RptApGr2Label2: TppLabel
        UserName = 'RptApGr2Label2'
        AutoSize = False
        Caption = 'RptApGr2Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 66411
        mmTop = 6085
        mmWidth = 59531
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 21431
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 21431
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine57: TppLine
        UserName = 'ppLine57'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'Valor total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 2381
        mmWidth = 15610
        BandType = 7
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        DataField = 'VALOR'
        DataPipeline = PpTotApGr
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpTotApGr'
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 2381
        mmWidth = 43656
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 146315
        mmTop = 7144
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMBANCO'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel51: TppLabel
          UserName = 'ppLabel51'
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 529
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText47: TppDBText
          UserName = 'ppDBText47'
          AutoSize = True
          DataField = 'NUMBANCO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 10319
          mmTop = 529
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'ppDBText52'
          AutoSize = True
          DataField = 'NOMEBANCO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 529
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object ppLine58: TppLine
          UserName = 'ppLine58'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'NOCONTACORR'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel52: TppLabel
          UserName = 'ppLabel52'
          Caption = 'Agência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppDBText57: TppDBText
          UserName = 'ppDBText57'
          AutoSize = True
          DataField = 'NUMAGENCIA'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 1058
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppDBText58: TppDBText
          UserName = 'ppDBText58'
          AutoSize = True
          DataField = 'NOCONTACORR'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 68263
          mmTop = 1058
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppLine59: TppLine
          UserName = 'ppLine59'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 3
          GroupNo = 1
        end
        object ppLabel53: TppLabel
          UserName = 'ppLabel53'
          Caption = 'Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 44450
          mmTop = 1058
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'NUMCHQBORDERO'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLine61: TppLine
          UserName = 'ppLine61'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 3
          GroupNo = 2
        end
        object ppLabel54: TppLabel
          UserName = 'ppLabel54'
          Caption = 'Chq\Bord:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1852
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppDBText59: TppDBText
          UserName = 'ppDBText59'
          DataField = 'NUMCHQBORDERO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 15081
          mmTop = 1852
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
        object ppLabel69: TppLabel
          UserName = 'ppLabel69'
          Caption = 'Total do Chq\Bordeô:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 57150
          mmTop = 1852
          mmWidth = 30427
          BandType = 3
          GroupNo = 2
        end
        object ppDBText61: TppDBText
          UserName = 'ppDBText61'
          DataField = 'VALOR'
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 88636
          mmTop = 1852
          mmWidth = 43656
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppDBText64: TppDBText
          UserName = 'ppDBText64'
          DataField = 'FORCLI'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 70644
          mmTop = 5556
          mmWidth = 65088
          BandType = 3
          GroupNo = 3
        end
        object ppDBText65: TppDBText
          UserName = 'ppDBText65'
          DataField = 'NUMDOC'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 5556
          mmWidth = 28575
          BandType = 3
          GroupNo = 3
        end
        object ppDBText66: TppDBText
          UserName = 'ppDBText66'
          DataField = 'DATADOC'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel73: TppLabel
          UserName = 'ppLabel73'
          Caption = 'Conta Contábil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 12700
          mmWidth = 21960
          BandType = 3
          GroupNo = 3
        end
        object ppLabel78: TppLabel
          UserName = 'ppLabel78'
          ShiftWithParent = True
          Caption = 'Histórico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 40746
          mmTop = 12700
          mmWidth = 13758
          BandType = 3
          GroupNo = 3
        end
        object ppDBText67: TppDBText
          UserName = 'ppDBText67'
          DataField = 'TIPODOC'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 31221
          mmTop = 5556
          mmWidth = 38894
          BandType = 3
          GroupNo = 3
        end
        object ppLabel79: TppLabel
          UserName = 'ppLabel79'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 70644
          mmTop = 1323
          mmWidth = 16933
          BandType = 3
          GroupNo = 3
        end
        object ppLabel125: TppLabel
          UserName = 'ppLabel125'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 1323
          mmWidth = 16669
          BandType = 3
          GroupNo = 3
        end
        object ppLabel136: TppLabel
          UserName = 'ppLabel136'
          AutoSize = False
          Caption = 'Lancto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel137: TppLabel
          UserName = 'ppLabel137'
          Caption = 'Tipo de Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 31221
          mmTop = 1323
          mmWidth = 28310
          BandType = 3
          GroupNo = 3
        end
        object ppLabel139: TppLabel
          UserName = 'ppLabel139'
          Caption = 'DC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185473
          mmTop = 12435
          mmWidth = 3969
          BandType = 3
          GroupNo = 3
        end
        object ppLabel141: TppLabel
          UserName = 'ppLabel141'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175948
          mmTop = 12435
          mmWidth = 8467
          BandType = 3
          GroupNo = 3
        end
        object ppLabel142: TppLabel
          UserName = 'ppLabel142'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 181505
          mmTop = 1852
          mmWidth = 8467
          BandType = 3
          GroupNo = 3
        end
        object ppDBText68: TppDBText
          UserName = 'ppDBText68'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpApGr
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 5556
          mmWidth = 9525
          BandType = 3
          GroupNo = 3
        end
        object ppDBText69: TppDBText
          UserName = 'ppDBText69'
          DataField = 'DATALANCTO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel143: TppLabel
          UserName = 'ppLabel143'
          AutoSize = False
          Caption = 'Baixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppDBText70: TppDBText
          UserName = 'ppDBText70'
          AutoSize = True
          DataField = 'DESCESTORNO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 83079
          mmTop = 9525
          mmWidth = 24606
          BandType = 3
          GroupNo = 3
        end
        object ppLine62: TppLine
          UserName = 'ppLine62'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'ppSubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpContab3'
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 5
          GroupNo = 3
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = PpContab3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpContab3'
            object ppDetailBand30: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText71: TppDBText
                UserName = 'ppDBText71'
                AutoSize = True
                DataField = 'PLACONTA'
                DataPipeline = PpContab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3175
                mmLeft = 6350
                mmTop = 0
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText72: TppDBText
                UserName = 'ppDBText72'
                AutoSize = True
                DataField = 'LACDEBCRE'
                DataPipeline = PpContab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3175
                mmLeft = 172773
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText73: TppDBText
                UserName = 'ppDBText73'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = PpContab3
                DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3175
                mmLeft = 175419
                mmTop = 0
                mmWidth = 9525
                BandType = 4
              end
              object ppDBMemo2: TppDBMemo
                UserName = 'ppDBMemo2'
                CharWrap = True
                DataField = 'HISTLANCAMENTOCONTABIL'
                DataPipeline = PpContab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3704
                mmLeft = 40746
                mmTop = 0
                mmWidth = 98425
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
          end
        end
        object ppSubReport2: TppSubReport
          UserName = 'ppSubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpContabLanc'
          mmHeight = 794
          mmLeft = 0
          mmTop = 794
          mmWidth = 190000
          BandType = 5
          GroupNo = 3
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = PpContabLanc
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpContabLanc'
            object ppDetailBand31: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText74: TppDBText
                UserName = 'ppDBText74'
                AutoSize = True
                DataField = 'PLACONTA'
                DataPipeline = PpContabLanc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3175
                mmLeft = 6350
                mmTop = 0
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText75: TppDBText
                UserName = 'ppDBText75'
                AutoSize = True
                DataField = 'LACDEBCRE'
                DataPipeline = PpContabLanc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3175
                mmLeft = 172773
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText76: TppDBText
                UserName = 'ppDBText76'
                AutoSize = True
                DataField = 'LACVALOR'
                DataPipeline = PpContabLanc
                DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3175
                mmLeft = 169863
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppDBMemo3: TppDBMemo
                UserName = 'ppDBMemo3'
                CharWrap = True
                DataField = 'HISTLANCAMENTOCONTABIL'
                DataPipeline = PpContabLanc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3704
                mmLeft = 41275
                mmTop = 0
                mmWidth = 98425
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
          end
        end
      end
    end
  end
end
