inherited RptAprovaDocs: TRptAprovaDocs
  Left = 412
  Top = 152
  Width = 612
  Height = 396
  Caption = 'RptAprovaDocs'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = ' Numero Lotes'
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
    Formheight = 190
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptAprovaDoc
    LabelEmpresa = ppLabel48
    LabelSistema = ppLabel50
  end
  object PpAprovaDoc: TppBDEPipeline
    DataSource = DsAprovaDoc
    CloseDataSource = True
    RefreshAfterPost = True
    UserName = 'PpAprovaDoc'
    Left = 217
    Top = 69
    object PpAprovaDocppField1: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField2: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField3: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField4: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField5: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField6: TppField
      FieldAlias = 'NUMSLIP'
      FieldName = 'NUMSLIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField7: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField8: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField10: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField11: TppField
      FieldAlias = 'DESCRICAO_1'
      FieldName = 'DESCRICAO_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField12: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField13: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField14: TppField
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField15: TppField
      FieldAlias = 'HISTLANCAMENTOCONTABIL'
      FieldName = 'HISTLANCAMENTOCONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField16: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField17: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField18: TppField
      FieldAlias = 'DESCRICAO_2'
      FieldName = 'DESCRICAO_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField19: TppField
      FieldAlias = 'SVALOR'
      FieldName = 'SVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField20: TppField
      FieldAlias = 'SVALOROUTRAMOEDA'
      FieldName = 'SVALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField21: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField22: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField23: TppField
      FieldAlias = 'NOMEBANCO'
      FieldName = 'NOMEBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField24: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField25: TppField
      FieldAlias = 'FLAGEMISSAO'
      FieldName = 'FLAGEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField26: TppField
      FieldAlias = 'FLAGCANCEL'
      FieldName = 'FLAGCANCEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField27: TppField
      FieldAlias = 'DESCRIAUX'
      FieldName = 'DESCRIAUX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object PpAprovaDocppField28: TppField
      FieldAlias = 'VALORAUX'
      FieldName = 'VALORAUX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
  end
  object DsAprovaDoc: TwwDataSource
    DataSet = QryAprovaDoc
    Left = 206
    Top = 124
  end
  object SqlContLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DOC.OPERACAO, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,'
      '  CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '  P.PLNPLANIL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC,'
      '  SUBCONTA SC,'
      '  CENTCUST CC,'
      '  UNIDNEGOCIO AP,'
      '  PLANILHA P'
      'WHERE'
      '  (DOC.CODDOCUMENTO  = :CODDOCUMENTO)        AND'
      '  (LAN.CODDOCUMENTO  = DOC.CODDOCUMENTO)     AND'
      '  (LAN.PLNCODIGO     = LC.PLNCODIGO)         AND'
      '  (LC.PLNCODIGO      = P.PLNCODIGO)          AND'
      '  (AP.UNIDNEGOC(+)   = LC.UNIDNEGOC)         AND'
      '  (AP.IDPESSOA(+)    = LC.IDPESSOA)          AND'
      '  (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND'
      '  (SC.IDPESSOA(+)    = LC.IDPESSOA)          AND'
      '  (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '  (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND'
      '  (LAN.OPERACAO     <> '#39'5'#39')                  AND'
      '  (LAN.OPERACAO     <> '#39'3'#39')                  AND'
      '  (LAN.OPERACAO     <> '#39'13'#39')                  '
      'ORDER BY'
      '  LC.LACDEBCRE DESC '
      ''
      ' ')
    ClientDataSet = CdsContLanc
    Left = 129
    Top = 141
  end
  object SqlContabParc: TCMSqlParams
    SQL.Strings = (
      'SELECT  DISTINCT'
      
        '       Q2.LACDEBCRE, Q2.PLACONTA,  ((Q1.VALOR * Q2.LACVALOR)/ Q3' +
        '.VALOR) AS VALOR,'
      '       Q2.NOMECC, Q2.NOMEAP, Q2.NOMESUBCONTA,'
      '       Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL,'
      '       Q2.PLNPLANIL'
      'FROM'
      '   (SELECT'
      
        '       LAN.VALOR, DOC.CODDOCUMENTO, DOC.NUMFATURA, '#39'LANÇAMENTO D' +
        'O DOCUMENTO '#39' || DOC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO ||' +
        ' P.RAZAOSOCIAL AS HISTORICOCOMPL'
      '    FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LAN,'
      '       PESSOA P'
      '    WHERE'
      '      (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '      ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '      (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '   (SELECT'
      
        '       DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, L' +
        'AN.VALOR,'
      '       CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA,'
      
        '       LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 ' +
        '|| LC.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '       P.PLNPLANIL'
      '    FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LAN,'
      '       LANCAMENTO LC,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       UNIDNEGOCIO AP,'
      '       PLANILHA P'
      '    WHERE'
      '       ((LAN.OPERACAO = '#39'1'#39') OR (LAN.OPERACAO = '#39'11'#39')) AND'
      '       (DOC.NUMFATURA IS NOT NULL)                AND'
      '       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)      AND'
      '       (AP.UNIDNEGOC(+) = LC.UNIDNEGOC)           AND'
      '       (AP.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '       (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND'
      '       (SC.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '       (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND'
      '       (LC.PLNCODIGO = P.PLNCODIGO)               AND'
      '       (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2,'
      
        '      (SELECT D.NUMFATURA, SUM(L.VALOR) AS VALOR FROM LANCTODOCU' +
        'M L, DOCUMENTO D'
      '       WHERE ((L.OPERACAO = '#39'1'#39') OR (L.OPERACAO = '#39'11'#39')) AND'
      '             (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '             (D.OPERACAO = L.OPERACAO) AND'
      '             (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'ORDER BY Q2.LACDEBCRE DESC'
      ' ')
    ClientDataSet = CdsContabParc
    Left = 124
    Top = 200
  end
  object SqlContabBaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    CONTACONTABIL,'
      '    NOMECC,'
      '    NOMESUBCONTA,'
      '    NOMEAP,'
      '    HISTORICO,'
      '    DEBCRE,'
      '    VALOR,'
      '    PLNPLANIL'
      'FROM'
      '   (SELECT'
      '       PC.PLACONTA AS CONTACONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       '#39#39' AS NOMESUBCONTA,'
      '       '#39#39' AS NOMEAP,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNPLANIL'
      '    FROM'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       PESSOA PB,'
      '       TIPODOCRECPAG TD,'
      '       PESSOA PD,'
      '       CENTCUST CC,'
      '      (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '       FROM'
      '           LANCTODOCUM'
      '       WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.STATUS = '#39'2'#39') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))' +
        ') AND'
      '       (D.CODDOCUMENTO = :CODDOCUMENTO)           AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO)       AND'
      '       (D.IDFORCLI = PD.IDPESSOA)                 AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)                AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)          AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'          AND'
      '       (B.IDPESSOA = PB.IDPESSOA)                 AND'
      '       (D.IDFORCLI = E.IDFORCLI)                  AND'
      '       (D.IDPESSOA = E.IDPESSOA)                  AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)           AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)               AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)               AND'
      '       (CC.CODCENTROCUSTO(+) = PC.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = PC.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      ''
      'UNION'
      '    SELECT'
      
        '       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTAC' +
        'ONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       SC.NOMESUBCONTA,'
      '       '#39#39' AS NOMEAP,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       L.DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNPLANIL'
      '    FROM'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       PESSOA PB,'
      '       TIPODOCRECPAG TD,'
      '       PESSOA PD,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '        FROM'
      '           LANCTODOCUM'
      '        WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.STATUS = '#39'2'#39') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))' +
        ') AND'
      '       (D.CODDOCUMENTO = :CODDOCUMENTO)     AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '       (D.IDFORCLI = PD.IDPESSOA)           AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)          AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'    AND'
      '       (B.IDPESSOA = PB.IDPESSOA)           AND'
      '       (D.IDFORCLI = E.IDFORCLI)            AND'
      '       (D.IDPESSOA = E.IDPESSOA)            AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)         AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '       (SC.CODSUBCONTA(+) = D.CODSUBCONTA)       AND'
      '       (SC.IDPESSOA(+) = D.IDPESSOA)             AND'
      '       (CC.CODCENTROCUSTO(+) = D.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = D.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      '     )'
      'ORDER BY'
      '  DEBCRE DESC'
      ' ')
    ClientDataSet = CdsContabBaixa
    Left = 119
    Top = 261
  end
  object CdsContLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 136
  end
  object CdsContabParc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 200
  end
  object CdsContabBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 256
  end
  object SqlContabPagtos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LP.NUMLOTE, LP.DATAEMISSAO,'
      '  DOC.CODDOCUMENTO,'
      '  PFORCLI.RAZAOSOCIAL AS FORNECEDOR,'
      '  DOC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO AS NUMDOC,'
      '  DOC.NUMSLIP,'
      '  LAN.DATALANCTO,'
      '  DOC.DATAVENCTO,'
      '  LAN.VALOR,'
      '  PF.DESCRICAO,'
      '  FRP.DESCRICAO,'
      '  LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '  P.PLNPLANIL ,'
      '  LAN.HISTORICOCOMPL,'
      '  CODDOC.DESCRICAO,'
      '  SALDO.SVALOR,'
      '  SALDO.SVALOROUTRAMOEDA,'
      '  LP.NUMCHQBORDERO,'
      '  B.NUMBANCO,'
      '  PB.RAZAOSOCIAL AS NOMEBANCO,'
      '  PC.NOCONTACORR,'
      '  LP.FLAGEMISSAO,'
      '  LP.FLAGCANCEL'
      'FROM'
      ' '
      '  LOTEPAGTO LP,'
      '  PESSOA PEMP,'
      '  PESSOA PFORCLI,'
      '  DOCUMENTO DOC,'
      '  LOTEXDOCUM LX,'
      '  LANCTODOCUM LAN,'
      '  PORTADORFORMA PF,'
      '  FORMARECPAG FRP,'
      '  TIPODOCRECPAG CODDOC,'
      '  LANCAMENTO LC,'
      '  PORTADORCONTA PC,'
      '  BANCO B,'
      '  PESSOA PB,'
      '  PLANILHA P,'
      
        '  (SELECT SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1)) AS SVAL' +
        'OR,'
      
        '          SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALOROUTRA' +
        'MOEDA * -1)) AS SVALOROUTRAMOEDA,'
      '          L.CODDOCUMENTO'
      '          FROM LANCTODOCUM L ,DOCUMENTO D'
      '          WHERE 1=2 GROUP BY L.CODDOCUMENTO) SALDO'
      ' WHERE  1 = 2'
      '')
    ClientDataSet = CdsContabPagtos
    Left = 129
    Top = 75
  end
  object CdsContabPagtos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 29
    Top = 75
  end
  object dsAuxAprovaDoc: TwwDataSource
    DataSet = QryAuxAprovaDoc
    Left = 301
    Top = 126
  end
  object ppAuxAprovaDoc: TppBDEPipeline
    DataSource = dsAuxAprovaDoc
    CloseDataSource = True
    RefreshAfterPost = True
    SkipWhenNoRecords = False
    UserName = 'PpAprovaDoc1'
    Left = 317
    Top = 71
    object ppAuxAprovaDocppField1: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAuxAprovaDocppField2: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAuxAprovaDocppField3: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAuxAprovaDocppField4: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAuxAprovaDocppField5: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAuxAprovaDocppField6: TppField
      FieldAlias = 'DESCRICAOTIPO'
      FieldName = 'DESCRICAOTIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object SqlTeste: TCMSqlParams
    ClientDataSet = CdsTeste
    Left = 124
    Top = 317
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 26
    Top = 312
  end
  object QryAprovaDoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LP.NUMLOTE, LP.DATAEMISSAO,'
      '  DOC.CODDOCUMENTO,'
      '  PFORCLI.RAZAOSOCIAL AS FORNECEDOR,'
      '  DOC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO AS NUMDOC,'
      '  DOC.NUMSLIP,'
      '  LAN.DATALANCTO,'
      '  DOC.DATAVENCTO,'
      '  LAN.VALOR,'
      '  PF.DESCRICAO,'
      '  FRP.DESCRICAO,'
      '  LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '  P.PLNPLANIL ,'
      '  LAN.HISTORICOCOMPL,'
      '  CODDOC.DESCRICAO,'
      '  0 as SVALOR,'
      '  0 as SVALOROUTRAMOEDA,'
      '  LP.NUMCHQBORDERO,'
      '  B.NUMBANCO,'
      '  PB.RAZAOSOCIAL AS NOMEBANCO,'
      '  PC.NOCONTACORR,'
      '  LP.FLAGEMISSAO,'
      '  LP.FLAGCANCEL,'
      
        '  '#39'                                               '#39' AS DESCRIAUX' +
        ','
      '  0.00 AS VALORAUX'
      'FROM'
      '  LOTEPAGTO LP,'
      '  PESSOA PEMP,'
      '  PESSOA PFORCLI,'
      '  DOCUMENTO DOC,'
      '  LOTEXDOCUM LX,'
      '  LANCTODOCUM LAN,'
      '  PORTADORFORMA PF,'
      '  FORMARECPAG FRP,'
      '  TIPODOCRECPAG CODDOC,'
      '  LANCAMENTO LC,'
      '  PORTADORCONTA PC,'
      '  BANCO B,'
      '  PESSOA PB,'
      '  PLANILHA P'
      'WHERE  (1 = 2)'
      'ORDER BY LP.NUMLOTE, DOC.CODDOCUMENTO')
    UpdateObject = UpdAprovaDoc
    ValidateWithMask = True
    Left = 267
    Top = 191
  end
  object UpdAprovaDoc: TUpdateSQL
    Left = 264
    Top = 239
  end
  object QryAuxAprovaDoc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsAprovaDoc
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '('
      'SELECT'
      '  D.CODDOCUMENTO,'
      '  R.CODCENTROCUSTO,'
      '  R.CODTIPRECDES,'
      '  R.VALOR,'
      
        '  DECODE(RTRIM(CC.NOME),'#39#39','#39'Centro de Custo não Informado'#39',CC.NO' +
        'ME) AS DESCRICAO,'
      
        '  DECODE(RTRIM(TD.DESCRICAO),'#39#39','#39'Tipo Desembolso não Informado'#39',' +
        'TD.DESCRICAO) AS DESCRICAOTIPO'
      'FROM'
      '  RATEIODOCUM R,'
      '  DOCUMENTO D,'
      '  CENTCUST CC ,'
      '  TIPORECEBDESEMB TD'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO'
      '  AND R.CODDOCUMENTO = D.CODDOCUMENTO'
      '  AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      '  AND R.IDEMPRESA = CC.IDEMPRESA(+)'
      '  AND R.CODTIPRECDES   = TD.CODTIPRECDES'
      '  AND R.RECPAG = TD.RECPAG'
      '  AND R.IDPESSOA = TD.IDPESSOA'
      'UNION ALL'
      'SELECT'
      '  VW.CODDOCUMENTO,'
      '  VW.CODCENTROCUSTO,'
      '  VW.CODTIPRECDES,'
      '  VW.VALOR,'
      
        '  DECODE(RTRIM(VW.RATEIO_NOMECC),'#39#39','#39'Centro de Custo não Informa' +
        'do'#39',VW.RATEIO_NOMECC) AS DESCRICAO,'
      
        '  DECODE(RTRIM(VW.DESCTDR),'#39#39','#39'Tipo Desembolso não Informado'#39',VW' +
        '.DESCTDR) AS DESCRICAOTIPO'
      'FROM'
      '  VWRATEIOPARCELADO VW'
      'WHERE'
      '  VW.CODDOCUMENTO = :CODDOCUMENTO'
      '  AND VW.RECPAG = '#39'P'#39
      ')'
      'ORDER BY'
      '  CODCENTROCUSTO, CODTIPRECDES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 359
    Top = 196
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object RptAprovaDoc: TppReport
    AutoStop = False
    DataPipeline = PpAprovaDoc
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 250
    Top = 10
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpAprovaDoc'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'CM Soluções Informática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 106363
        mmTop = 1058
        mmWidth = 59002
        BandType = 0
      end
      object LblAprovaDoc: TppLabel
        UserName = 'LblAprovaDoc'
        Caption = 'Aprovação de Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 103981
        mmTop = 8731
        mmWidth = 66675
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptAprovaDocDBText6: TppDBText
        UserName = 'RptAprovaDocDBText6'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = PpAprovaDoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAprovaDoc'
        mmHeight = 3175
        mmLeft = 13229
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object RptAprovaDocDBText7: TppDBText
        UserName = 'RptAprovaDocDBText7'
        DataField = 'HISTLANCAMENTOCONTABIL'
        DataPipeline = PpAprovaDoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAprovaDoc'
        mmHeight = 3704
        mmLeft = 58208
        mmTop = 0
        mmWidth = 148961
        BandType = 4
      end
      object RptAprovaDocDBText8: TppDBText
        UserName = 'RptAprovaDocDBText8'
        AutoSize = True
        DataField = 'PLNPLANIL'
        DataPipeline = PpAprovaDoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAprovaDoc'
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object RptAprovaDocDBText9: TppDBText
        UserName = 'RptAprovaDocDBText9'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = PpAprovaDoc
        DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAprovaDoc'
        mmHeight = 3175
        mmLeft = 229923
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object RptAprovaDocDBText10: TppDBText
        UserName = 'RptAprovaDocDBText10'
        AutoSize = True
        DataField = 'LACDEBCRE'
        DataPipeline = PpAprovaDoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAprovaDoc'
        mmHeight = 3175
        mmLeft = 256117
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        UserName = 'ppLabel50'
        AutoSize = False
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 16404
        mmWidth = 227807
        BandType = 8
      end
      object RptAprovaDocShape4: TppShape
        UserName = 'RptAprovaDocShape4'
        mmHeight = 11377
        mmLeft = 139436
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object RptAprovaDocShape3: TppShape
        UserName = 'RptAprovaDocShape3'
        mmHeight = 11377
        mmLeft = 206905
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object RptAprovaDocShape2: TppShape
        UserName = 'RptAprovaDocShape2'
        mmHeight = 11377
        mmLeft = 71967
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object RptAprovaDocShape1: TppShape
        UserName = 'RptAprovaDocShape1'
        mmHeight = 11377
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 13229
        mmWidth = 284300
        BandType = 8
      end
      object Lbla2: TppLabel
        UserName = 'Lbla2'
        Caption = 'Lbla2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 72761
        mmTop = 1588
        mmWidth = 7144
        BandType = 8
      end
      object Lbla3: TppLabel
        UserName = 'Lbla3'
        Caption = 'Lbla3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 139965
        mmTop = 1588
        mmWidth = 7144
        BandType = 8
      end
      object Lbla1: TppLabel
        UserName = 'Lbla1'
        Caption = 'Lbla1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 1588
        mmWidth = 7144
        BandType = 8
      end
      object ppLabel55: TppLabel
        UserName = 'ppLabel55'
        Caption = 'LblUsuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 5292
        mmTop = 7408
        mmWidth = 12965
        BandType = 8
      end
      object RptAprovaDocLine3: TppLine
        UserName = 'RptAprovaDocLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object lbla4: TppLabel
        UserName = 'lbla4'
        Caption = 'lbla4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 1588
        mmWidth = 6350
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 16140
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 16140
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMCHQBORDERO'
      DataPipeline = PpAprovaDoc
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpAprovaDoc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17727
        mmPrintPosition = 0
        object RptAprovaDocLabel2: TppLabel
          UserName = 'RptAprovaDocLabel2'
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 7938
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocDBText2: TppDBText
          UserName = 'RptAprovaDocDBText2'
          DataField = 'NUMBANCO'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3704
          mmLeft = 13494
          mmTop = 7938
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocDBText3: TppDBText
          UserName = 'RptAprovaDocDBText3'
          AutoSize = True
          DataField = 'NOMEBANCO'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3175
          mmLeft = 31221
          mmTop = 7938
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocLabel1: TppLabel
          UserName = 'RptAprovaDocLabel1'
          Caption = 'Num Chq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 2381
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocDBText1: TppDBText
          UserName = 'RptAprovaDocDBText1'
          DataField = 'NUMCHQBORDERO'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3969
          mmLeft = 17198
          mmTop = 2381
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'ppLabel67'
          Caption = 'Tipo Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 122502
          mmTop = 2381
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'ppDBText23'
          DataField = 'DESCRICAO_1'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 2381
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocLabel4: TppLabel
          UserName = 'RptAprovaDocLabel4'
          Caption = 'Conta Bancária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 144992
          mmTop = 7938
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocDBText4: TppDBText
          UserName = 'RptAprovaDocDBText4'
          AutoSize = True
          DataField = 'NOCONTACORR'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3175
          mmLeft = 167482
          mmTop = 7938
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocLabel5: TppLabel
          UserName = 'RptAprovaDocLabel5'
          Caption = 'Lote Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 42598
          mmTop = 2381
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocLabel6: TppLabel
          UserName = 'RptAprovaDocLabel6'
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 71438
          mmTop = 2381
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocDBText5: TppDBText
          UserName = 'RptAprovaDocDBText5'
          DataField = 'NUMLOTE'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3969
          mmLeft = 54240
          mmTop = 2381
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object LblStatus: TppLabel
          OnPrint = LblStatusPrint
          UserName = 'LblStatus'
          Caption = 'LblStatus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 82286
          mmTop = 2381
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'ppLine37'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel62: TppLabel
          UserName = 'ppLabel62'
          Caption = 'Valor do Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 215371
          mmTop = 12965
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'ppLabel81'
          Caption = 'Valor a Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 252413
          mmTop = 12965
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'ppLabel60'
          AutoSize = False
          Caption = 'Data do Lan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 156369
          mmTop = 13229
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'ppLabel61'
          AutoSize = False
          Caption = 'Data do Venc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 176742
          mmTop = 13229
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'ppLabel80'
          Caption = 'Tipo de Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 101071
          mmTop = 13229
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 13229
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel58: TppLabel
          UserName = 'ppLabel58'
          Caption = 'Num Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 68792
          mmTop = 13229
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocLine1: TppLine
          UserName = 'RptAprovaDocLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 2117
          mmTop = 12435
          mmWidth = 268553
          BandType = 3
          GroupNo = 0
        end
        object RptAprovaDocLabel7: TppLabel
          UserName = 'RptAprovaDocLabel7'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 212461
          mmTop = 2381
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object LblTotLote: TppLabel
          OnPrint = LblTotLotePrint
          UserName = 'LblTotLote'
          Caption = 'R$ 9.999.9999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 245534
          mmTop = 2381
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = PpAprovaDoc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpAprovaDoc'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText17: TppDBText
          UserName = 'ppDBText17'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3175
          mmLeft = 156898
          mmTop = 529
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppDBText18: TppDBText
          UserName = 'ppDBText18'
          AutoSize = True
          DataField = 'DATAVENCTO'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3175
          mmLeft = 177007
          mmTop = 529
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppDBText19: TppDBText
          UserName = 'ppDBText19'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpAprovaDoc
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3175
          mmLeft = 235480
          mmTop = 529
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppDBText24: TppDBText
          UserName = 'ppDBText24'
          DataField = 'DESCRICAO_2'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3704
          mmLeft = 101600
          mmTop = 529
          mmWidth = 54769
          BandType = 3
          GroupNo = 1
        end
        object ppDBText25: TppDBText
          UserName = 'ppDBText25'
          AutoSize = True
          DataField = 'SVALOR'
          DataPipeline = PpAprovaDoc
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3175
          mmLeft = 260086
          mmTop = 529
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'ppDBText14'
          DataField = 'FORNECEDOR'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 529
          mmWidth = 65617
          BandType = 3
          GroupNo = 1
        end
        object ppDBText15: TppDBText
          UserName = 'ppDBText15'
          DataField = 'NUMDOC'
          DataPipeline = PpAprovaDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpAprovaDoc'
          mmHeight = 3704
          mmLeft = 69056
          mmTop = 529
          mmWidth = 32015
          BandType = 3
          GroupNo = 1
        end
        object RptAprovaDocLine4: TppLine
          UserName = 'RptAprovaDocLine4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 2117
          mmTop = 0
          mmWidth = 268553
          BandType = 3
          GroupNo = 1
        end
        object RptAprovaDocLine2: TppLine
          UserName = 'RptAprovaDocLine2'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 794
          mmLeft = 13229
          mmTop = 5027
          mmWidth = 255059
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppAuxAprovaDoc'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppAuxAprovaDoc
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
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
            Left = 410
            Top = 290
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppAuxAprovaDoc'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppLabel163: TppLabel
                UserName = 'Label163'
                AutoSize = False
                Caption = 'Centro de Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 15346
                mmTop = 1058
                mmWidth = 33867
                BandType = 1
              end
              object ppLabel164: TppLabel
                UserName = 'Label164'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 251090
                mmTop = 1058
                mmWidth = 8467
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                Caption = 'Tipo Desembolso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 146315
                mmTop = 529
                mmWidth = 23019
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = ppAuxAprovaDoc
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppAuxAprovaDoc'
                mmHeight = 3175
                mmLeft = 249767
                mmTop = 0
                mmWidth = 9525
                BandType = 4
              end
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'DESCRICAO'
                DataPipeline = ppAuxAprovaDoc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppAuxAprovaDoc'
                mmHeight = 3175
                mmLeft = 15610
                mmTop = 0
                mmWidth = 125677
                BandType = 4
              end
              object ppDBText3: TppDBText
                UserName = 'DBText3'
                AutoSize = True
                DataField = 'DESCRICAOTIPO'
                DataPipeline = ppAuxAprovaDoc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppAuxAprovaDoc'
                mmHeight = 3175
                mmLeft = 146050
                mmTop = 0
                mmWidth = 23283
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
end
