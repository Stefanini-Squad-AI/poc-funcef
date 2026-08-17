inherited RptOrdemDePago: TRptOrdemDePago
  Left = 148
  Top = 75
  Width = 526
  Height = 566
  Caption = 'RptOrdemDePago'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Listas'
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
        Caption = 'CodALterador'
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
    Report = RptOrdemPago
    LabelEmpresa = ppLabel25
    LabelSistema = ppLabel30
  end
  object PpOrdemPago: TppBDEPipeline
    DataSource = DsOredemPago
    CloseDataSource = True
    UserName = 'PpOrdemPago'
    Left = 238
    Top = 87
    object PpOrdemPagoppField1: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField2: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField3: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField4: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField5: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField6: TppField
      FieldAlias = 'DATADIFERIDO'
      FieldName = 'DATADIFERIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField7: TppField
      FieldAlias = 'VALORLOTE'
      FieldName = 'VALORLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField8: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField9: TppField
      FieldAlias = 'CODARQUIVOREMESSA'
      FieldName = 'CODARQUIVOREMESSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField10: TppField
      FieldAlias = 'IDTEMPLCHEQUE'
      FieldName = 'IDTEMPLCHEQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField11: TppField
      FieldAlias = 'NUMSLIP'
      FieldName = 'NUMSLIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField12: TppField
      FieldAlias = 'VALORRETENCAO'
      FieldName = 'VALORRETENCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField13: TppField
      FieldAlias = 'VALOTTOTAL'
      FieldName = 'VALOTTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField14: TppField
      FieldAlias = 'CANCELADO'
      FieldName = 'CANCELADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField15: TppField
      FieldAlias = 'EXTENSO'
      FieldName = 'EXTENSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpOrdemPagoppField16: TppField
      FieldAlias = 'CODALTERADOR'
      FieldName = 'CODALTERADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object DsOredemPago: TwwDataSource
    DataSet = CdsOrdemPago
    Left = 179
    Top = 87
  end
  object DsQryContabLancLote: TwwDataSource
    DataSet = CdsContabLancLote
    Left = 179
    Top = 302
  end
  object PpQryContabLancLote: TppBDEPipeline
    DataSource = DsQryContabLancLote
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PpQryContabLancLote'
    Left = 238
    Top = 302
  end
  object DsQryContab3Lote: TwwDataSource
    DataSet = CdsContab3Lote
    Left = 179
    Top = 351
  end
  object PpQryContab3Lote: TppBDEPipeline
    DataSource = DsQryContab3Lote
    CloseDataSource = True
    UserName = 'PpQryContab3Lote'
    Left = 238
    Top = 351
  end
  object PpQryContabBaixaLote: TppBDEPipeline
    DataSource = DsQryContabBaixaLote
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PpQryContabBaixaLote'
    Left = 238
    Top = 406
  end
  object PpQryAltLote: TppBDEPipeline
    DataSource = DsQryAltLote
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PpQryAltLote'
    Left = 238
    Top = 467
    object PpQryAltLoteppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpQryAltLoteppField2: TppField
      FieldAlias = 'ACRESDECRES'
      FieldName = 'ACRESDECRES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpQryAltLoteppField3: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpQryAltLoteppField4: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpQryAltLoteppField5: TppField
      FieldAlias = 'CODALTERADOR'
      FieldName = 'CODALTERADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object DsQryAltLote: TwwDataSource
    DataSet = CdsAltLote
    Left = 179
    Top = 467
  end
  object PpQryRateiParcPago: TppBDEPipeline
    DataSource = DsQryRateiParcPago
    UserName = 'PpQryRateiParcPago'
    Left = 238
    Top = 249
  end
  object DsQryRateiParcPago: TwwDataSource
    DataSet = CdsRateiParcPago
    Left = 179
    Top = 249
  end
  object DsQryContabBaixaLote: TwwDataSource
    DataSet = CdsContabBaixaLote
    Left = 179
    Top = 406
  end
  object PpQryDocsLote: TppBDEPipeline
    DataSource = DsQryDocsLote
    CloseDataSource = True
    UserName = 'PpQryDocsLote'
    Left = 238
    Top = 142
  end
  object DsQryDocsLote: TwwDataSource
    DataSet = CdsDocsLote
    Left = 179
    Top = 142
  end
  object PpQryRateioLote: TppBDEPipeline
    DataSource = DsQryRateioLote
    CloseDataSource = True
    UserName = 'PpQryRateioLote'
    Left = 238
    Top = 195
  end
  object DsQryRateioLote: TwwDataSource
    DataSet = CdsRateioLote
    Left = 179
    Top = 195
  end
  object Extenso: TExtensoCM
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 206
    Top = 34
  end
  object CdsAltLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 466
  end
  object SqlAltLote: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */ '
      '  TA.DESCRICAO, TA.ACRESDECRES, L.HISTORICOCOMPL,'
      
        '  DECODE(L.DEBCRE,'#39'D'#39',DECODE(D.RECPAG,'#39'P'#39',L.VALOR ,L.VALOR * -1)' +
        ',DECODE(D.RECPAG,'#39'R'#39',L.VALOR ,L.VALOR * -1)) AS VALOR,'
      '  TA.CODALTERADOR'
      'FROM'
      '  TIPOALTERADOR TA, LANCTODOCUM L, LOTEXDOCUM LX, DOCUMENTO D'
      'WHERE'
      '  (LX.NUMLOTE = :NUMLOTE)            AND'
      '  (L.CODDOCUMENTO = D.CODDOCUMENTO)  AND'
      '  (L.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      '  (L.OPERACAO = '#39'4'#39')                 AND'
      '  (L.CODALTERADOR = TA.CODALTERADOR)'
      'ORDER BY'
      '  TA.DESCRICAO'
      '')
    ClientDataSet = CdsAltLote
    Left = 93
    Top = 466
  end
  object CdsOrdemPago: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsOrdemPagoAfterScroll
    OnCalcFields = CdsOrdemPagoCalcFields
    Left = 37
    Top = 88
  end
  object SqlOrdemPago: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '   LP.NUMLOTE,'
      '   LP.DATAEMISSAO,'
      '   LP.NUMCHQBORDERO,'
      '   LP.FAVORECIDO,'
      '   LP.OBSERVACAO,'
      '   LP.DATADIFERIDO,'
      '   VL.VALORLOTE,  vlret.valorretencao  ,'
      
        '   (DECODE(VL.VALORLOTE,NULL,0,VL.VALORLOTE) + (DECODE(vlret.val' +
        'orretencao,NULL,0,vlret.valorretencao) * -1)) as valottotal,'
      '   PBANCO.RAZAOSOCIAL,'
      '   PF.CODARQUIVOREMESSA,'
      '   PF.IDTEMPLCHEQUE,'
      '   LP.NUMSLIP,'
      
        '   decode(lp.flagcancel,'#39'C'#39','#39'Cancelada'#39',decode(lp.flagcancel,'#39'R'#39 +
        ','#39'Cancelada'#39','#39#39')) as cancelado,'
      '   0 as CODALTERADOR'
      'FROM'
      '  LOTEPAGTO LP,'
      '  PORTADORFORMA PF,'
      '  PORTADORCONTA PC,'
      '  PESSOA PBANCO,'
      
        '  (SELECT NUMLOTE, SUM(VALOR) AS VALORLOTE FROM LOTEXDOCUM GROUP' +
        ' BY NUMLOTE) VL,'
      
        '  (select l.numlote,sum(decode(lanc.debcre,'#39'C'#39',lanc.valor,-1*lan' +
        'c.valor)) as valorretencao'
      '   from lotexdocum l , lanctodocum lanc ,altximposto a'
      '   where 1=2  group by l.numlote) vlret'
      'WHERE'
      '  1=2'
      ''
      '')
    ClientDataSet = CdsOrdemPago
    Left = 93
    Top = 88
  end
  object CdsContabBaixaLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 410
  end
  object SqlContabBaixaLote: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */ '
      '    DISTINCT'
      '    CONTACONTABIL,'
      '    NOMECC,'
      '    NOMESUBCONTA,'
      '    NOMEAP,'
      '    HISTORICO,'
      '    DEBCRE,'
      '    VALOR,'
      '    PLNPLANIL,'
      '    PLANOME,'
      '    PLAREDUZ,'
      '    placoncorresp'
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
      '       PL.PLNPLANIL,'
      '       PCONTA.PLANOME, PCONTA.PLAREDUZ ,pconta.placoncorresp'
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
      '       PLANOCONTA  PCONTA,'
      '       LOTEXDOCUM LX,'
      '      (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '       FROM'
      '           LANCTODOCUM'
      '       WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.OPERACAO = '#39'15'#39') OR (D.STATUS = '#39'2'#39') OR ((D.STATUS = ' +
        '0) AND (L.ESTORNO > 0))) AND'
      '       (PCONTA.PLANO(+) = PC.PLANO)               AND'
      '       (PCONTA.PLACONTA(+) = PC.PLACONTA)         AND'
      '       (LX.NUMLOTE = :NUMLOTE)                    AND'
      '       (D.CODDOCUMENTO = LX.CODDOCUMENTO)           AND'
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
      '       PL.PLNPLANIL,'
      '       PCONTA.PLANOME, PCONTA.PLAREDUZ, pconta.placoncorresp'
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
      '       PLANOCONTA  PCONTA,'
      '       LOTEXDOCUM LX,'
      '       (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '        FROM'
      '           LANCTODOCUM'
      '        WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.OPERACAO = '#39'15'#39') OR (D.STATUS = '#39'2'#39') OR ((D.STATUS = ' +
        '0) AND (L.ESTORNO > 0))) AND'
      '       (LX.NUMLOTE = :NUMLOTE)              AND'
      '       (D.CODDOCUMENTO = LX.CODDOCUMENTO)   AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '       (D.IDFORCLI = PD.IDPESSOA)           AND'
      '       (PCONTA.PLANO(+) = D.PLANO)          AND'
      '       (PCONTA.PLACONTA(+) = D.PLACONTA)    AND'
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
      '')
    ClientDataSet = CdsContabBaixaLote
    Left = 101
    Top = 410
  end
  object CdsContab3Lote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 356
  end
  object SqlContab3Lote: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */  DISTINCT'
      
        '       Q2.LACDEBCRE, Q2.PLACONTA,  ((Q1.VALOR * Q2.LACVALOR)/ Q3' +
        '.VALOR) AS VALOR,'
      '       Q2.NOMECC, Q2.NOMEAP, Q2.NOMESUBCONTA,  q2.placoncorresp,'
      '       Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL,'
      '       Q2.PLNPLANIL, Q2.PLANOME, Q2.PLAREDUZ'
      'FROM'
      '   (SELECT'
      
        '       LAN.VALOR, DOC.NUMFATURA, '#39'LANÇAMENTO DO DOCUMENTO '#39' || D' +
        'OC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL AS ' +
        'HISTORICOCOMPL'
      '    FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LAN,'
      '       PESSOA P,'
      '       LOTEXDOCUM LX'
      '    WHERE'
      '      (LX.NUMLOTE = :NUMLOTE) AND'
      '      (DOC.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      '      ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '      (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '   (SELECT'
      
        '       DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, L' +
        'AN.VALOR,'
      
        '       CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA, pc' +
        '.placoncorresp,'
      
        '       LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 ' +
        '|| LC.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '       P.PLNPLANIL, PC.PLANOME, PC.PLAREDUZ'
      '    FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LAN,'
      '       LANCAMENTO LC,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       UNIDNEGOCIO AP,'
      '       PLANILHA P,'
      '       PLANOCONTA PC'
      '    WHERE'
      '       ((LAN.OPERACAO = '#39'1'#39') OR (LAN.OPERACAO = '#39'11'#39')) AND'
      '       (DOC.NUMFATURA IS NOT NULL)                AND'
      '       (PC.PLANO = LC.PLANO)                      AND'
      '       (PC.PLACONTA = LC.PLACONTA)                AND'
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
      '')
    ClientDataSet = CdsContab3Lote
    Left = 93
    Top = 356
  end
  object CdsContabLancLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 307
  end
  object SqlContabLancLote: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */ '
      '  DISTINCT'
      
        '  DOC.OPERACAO, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,  pc.pla' +
        'concorresp,'
      '  CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '  P.PLNPLANIL, PC.PLANOME, PC.PLAREDUZ'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC,'
      '  SUBCONTA SC,'
      '  CENTCUST CC,'
      '  UNIDNEGOCIO AP,'
      '  PLANILHA P,'
      '  PLANOCONTA PC,'
      '  LOTEXDOCUM LX'
      'WHERE'
      '  (LX.NUMLOTE = :NUMLOTE)                    AND'
      '  (DOC.CODDOCUMENTO  = LX.CODDOCUMENTO)      AND'
      '  (LAN.CODDOCUMENTO  = DOC.CODDOCUMENTO)     AND'
      '  (PC.PLANO = LC.PLANO)                      AND'
      '  (PC.PLACONTA = LC.PLACONTA)                AND'
      '  (LAN.PLNCODIGO     = LC.PLNCODIGO)         AND'
      '  (LC.PLNCODIGO      = P.PLNCODIGO)          AND'
      '  (AP.UNIDNEGOC(+)   = LC.UNIDNEGOC)         AND'
      '  (AP.IDPESSOA(+)    = LC.IDPESSOA)          AND'
      '  (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND'
      '  (SC.IDPESSOA(+)    = LC.IDPESSOA)          AND'
      '  (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '  (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND'
      '  (LAN.OPERACAO     <> '#39'5'#39')                  AND'
      '  (LAN.OPERACAO     <> '#39'15'#39')                 AND  '
      '  (LAN.OPERACAO     <> '#39'3'#39')                  AND'
      '  (LAN.OPERACAO     <> '#39'13'#39')                  '
      'ORDER BY'
      '  LC.LACDEBCRE DESC'
      '')
    ClientDataSet = CdsContabLancLote
    Left = 93
    Top = 307
  end
  object CdsRateiParcPago: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 251
  end
  object SqlRateiParcPago: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */ '
      
        '  Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, SUM(((Q1.VALOR * Q2.VALOR)/ ' +
        'Q3.VALOR)) AS VALOR'
      'FROM'
      '  (SELECT'
      '     DOC.NUMFATURA,'
      '     LAN.VALOR'
      '  FROM'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN,'
      '     LOTEXDOCUM LX'
      '  WHERE'
      '    (LX.NUMLOTE = :NUMLOTE) AND'
      '    (DOC.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      '    ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      ' (SELECT'
      '   D.NUMFATURA,'
      '   RD.VALOR,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   AP.NOME AS NOMEAP,'
      '   CR.NOME AS NOMECR'
      '  FROM'
      '   RATEIODOCUM RD,'
      
        '   UNIDNEGOCIO AP, CENTRESPON CR, TIPORECEBDESEMB TDR, DOCUMENTO' +
        ' D'
      '  WHERE'
      '   (D.NUMFATURA IS NOT NULL)                    AND'
      '   (D.CODDOCUMENTO        = RD.CODDOCUMENTO)    AND'
      '   (TDR.CODTIPRECDES(+)   = RD.CODTIPRECDES)    AND'
      '   (TDR.RECPAG(+)         = RD.RECPAG)          AND'
      '   (TDR.IDPESSOA(+)       = RD.IDPESSOA)        AND'
      '   (AP.UNIDNEGOC(+)       = RD.UNIDNEGOC)       AND'
      '   (AP.IDPESSOA(+)        = RD.IDPESSOA)        AND'
      '   (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '   (CR.IDPESSOA(+)        = RD.IDPESSOA)) Q2,'
      '  (SELECT'
      '    D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '   FROM'
      '    LANCTODOCUM L, DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'GROUP BY'
      '   Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR'
      'ORDER BY'
      '   Q2.NOMEAP, Q2.NOMECR'
      ''
      '')
    ClientDataSet = CdsRateiParcPago
    Left = 93
    Top = 251
  end
  object CdsDocsLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 145
  end
  object SqlDocsLote: TCMSqlParams
    SQL.Strings = (
      
        '-- O PARAMETRO CODALTERADOR É ULTILIZADO PARA EXIBIR O VALOR DO ' +
        'DOCUMENTO NO MOMENTO'
      
        '-- CRIACAO DO LOTE SEM A RETENCAO DE GANANCIA ( ALTERADOR INDICA' +
        'DO NA TELA DE FILTRO )'
      'SELECT  /*+ RULE */ '
      ' D.CODDOCUMENTO, D.NUMSLIP,'
      ' D.NODOCUMENTO, D.COMPLDOCUMENTO,'
      ' D.DATAEMISSAO, D.DATAVENCTO, D.DATAPROGRAMADA,'
      ' DECODE(D.STATUS,'#39'2'#39','#39'DOCUMENTO BAIXADO'#39','#39#39') AS STATUSDOC,'
      
        ' DECODE(L.PLNCODIGO,NULL,'#39'NÃO INTEGRADO COM A CONTABILIDADE'#39','#39'IN' +
        'TEGRADO COM A CONTABILIDADE'#39') AS STATUSCONTAB,'
      ' L.DATALANCTO,'
      ' LX.VALOR,'
      
        '(DECODE(LX.VALOR,NULL,0,LX.VALOR) + (DECODE(VLRET.VALORRETENCAO,' +
        'NULL,0,VLRET.VALORRETENCAO) * - 1)) AS VALORTOTRET,'
      ' L.VALOR AS VALORIGINAL,'
      ' L.HISTORICOCOMPL,'
      ' P.RAZAOSOCIAL,'
      ' F.DESCRICAO,'
      ' TD.DESCRICAO AS DESCTIPODOC,'
      ' PF.DESCRICAO AS DESCPORTFORMA,'
      ' DECODE(D.NUMLEITCODBARRAS,NULL,DECODE(D.NUMDIGCODBARRAS,NULL,'
      
        ' CONTA.DESCCONTA,D.NUMDIGCODBARRAS),D.NUMLEITCODBARRAS) AS TIPOD' +
        'OCBAIXA,'
      ' D.OPERACAO,'
      ' D.PLACONTA'
      'FROM'
      ' DOCUMENTO D, LANCTODOCUM L, FORMARECPAG F,'
      ' PESSOA P, TIPODOCRECPAG TD, PORTADORFORMA PF, LOTEXDOCUM LX,'
      ' -- BUSCA O VALOR DO DOCUMENTO NO MOMENTO DA CRIACAO DO LOTE'
      '   (SELECT'
      
        '      L.NUMLOTE,L.CODDOCUMENTO,SUM(DECODE(LANC.DEBCRE,'#39'C'#39',LANC.V' +
        'ALOR,-1*LANC.VALOR)) AS VALORRETENCAO'
      '    FROM'
      '      LOTEXDOCUM L , LANCTODOCUM LANC'
      '    WHERE'
      '      L.NUMLOTE=:NUMLOTE AND'
      '      L.CODDOCUMENTO=LANC.CODDOCUMENTO AND'
      '     (LANC.CODALTERADOR = :CODALTERADOR)'
      '    GROUP BY L.NUMLOTE,L.CODDOCUMENTO ) VLRET,'
      ' -- BUSCA DADOS BANCÁRIOS'
      '   (SELECT DISTINCT'
      '      C.IDPESSOA,'
      
        '      '#39' BANCO '#39' || RTRIM(B.NUMBANCO) || '#39' AGÊNCIA '#39'  || RTRIM(A.' +
        'NUMAGENCIA) || '#39' CONTA: '#39' || RTRIM(C.CONTACORRENTE) AS DESCCONTA'
      '    FROM'
      '      CONTABANCARIA C, AGENCIABANCARIA A, BANCO B'
      '    WHERE'
      '     (C.FLGCONTAPREF = 1) AND'
      '     (C.IDAGENCIA(+) = A.IDPESSOA) AND'
      '     (A.IDBANCO(+)   = B.IDPESSOA)) CONTA'
      'WHERE'
      ' (LX.NUMLOTE = :NUMLOTE) AND'
      ' (D.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      ' (LX.NUMLOTE=VLRET.NUMLOTE(+)) AND'
      ' (LX.CODDOCUMENTO=VLRET.CODDOCUMENTO(+)) AND'
      ' (CONTA.IDPESSOA(+)   = D.IDFORCLI) AND'
      ' (D.CODPORTFORMA      = PF.CODPORTFORMA(+)) AND'
      ' (D.CODDOCUMENTO      = L.CODDOCUMENTO) AND'
      ' (D.OPERACAO          = L.OPERACAO) AND'
      ' (P.IDPESSOA          = D.IDFORCLI) AND'
      ' (D.CODFORMA          = F.CODFORMA(+)) AND'
      ' (TD.CODTIPDOC        = D.CODTIPDOC)'
      'ORDER BY'
      '  D.CODDOCUMENTO'
      ''
      ''
      ' ')
    ClientDataSet = CdsDocsLote
    Left = 93
    Top = 145
  end
  object CdsRateioLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 201
  end
  object SqlRateioLote: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */ '
      ' RD.UNIDNEGOC,'
      ' RD.CODCENTRORESPON,'
      ' RD.CODTIPRECDES,'
      ' RD.VALOR AS VALORRATEIO,'
      ' TDR.DESCRICAO AS DESCTDR,'
      ' AP.NOME AS NOMEAP,'
      ' CR.NOME AS NOMECR,'
      ' AP.NOME,'
      ' CR.NOME'
      'FROM'
      ' RATEIODOCUM RD, LOTEXDOCUM LX,'
      ' UNIDNEGOCIO AP, CENTRESPON CR, TIPORECEBDESEMB TDR'
      'WHERE'
      ' (LX.NUMLOTE = :NUMLOTE)                      AND '
      ' (LX.CODDOCUMENTO = RD.CODDOCUMENTO) '#9'    AND'
      ' (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES)      AND'
      ' (TDR.RECPAG(+)       = RD.RECPAG)            AND'
      ' (TDR.IDPESSOA(+)     = RD.IDPESSOA)          AND'
      ' (AP.UNIDNEGOC(+)       = RD.UNIDNEGOC)       AND'
      ' (AP.IDPESSOA(+)        = RD.IDPESSOA)        AND'
      ' (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      ' (CR.IDPESSOA(+)        = RD.IDPESSOA)'
      'ORDER BY'
      '  AP.NOME,'
      '  CR.NOME'
      ''
      ' ')
    ClientDataSet = CdsRateioLote
    Left = 93
    Top = 201
  end
  object RptOrdemPago: TppReport
    AutoStop = False
    DataPipeline = PpOrdemPago
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 326
    Top = 95
    Version = '5.5'
    mmColumnWidth = 0
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ppShape1'
        mmHeight = 13229
        mmLeft = 152136
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object ppShape2: TppShape
        UserName = 'ppShape2'
        mmHeight = 13229
        mmLeft = 114565
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object ppShape3: TppShape
        UserName = 'ppShape3'
        mmHeight = 13229
        mmLeft = 76994
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'ppShape4'
        mmHeight = 13229
        mmLeft = 39158
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object ppShape5: TppShape
        UserName = 'ppShape5'
        mmHeight = 13229
        mmLeft = 1323
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 27781
        mmWidth = 20373
        BandType = 8
      end
      object ppLabel31: TppLabel
        UserName = 'ppLabel31'
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
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        AutoSize = False
        Caption = 'ppLabel32'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 6350
        mmWidth = 35454
        BandType = 8
      end
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        AutoSize = False
        Caption = 'ppLabel33'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        AutoSize = False
        Caption = 'ppLabel34'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 77523
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        AutoSize = False
        Caption = 'ppLabel35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        AutoSize = False
        Caption = 'ppLabel36'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        Caption = 'LblAutentica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 20902
        mmWidth = 21431
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
        mmLeft = 85461
        mmTop = 27781
        mmWidth = 18785
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
        mmLeft = 163777
        mmTop = 27781
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptOrdemPagoSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object RptOrdemPagoRegion1: TppRegion
        UserName = 'RptOrdemPagoRegion1'
        Brush.Style = bsClear
        Caption = 'RptOrdemPagoRegion1'
        Pen.Style = psClear
        Stretch = True
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 6350
        mmWidth = 189971
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object MemObsOp: TppMemo
          UserName = 'MemObsOp'
          Caption = 'MemObsOp'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Stretch = True
          Transparent = True
          mmHeight = 1852
          mmLeft = 0
          mmTop = 7938
          mmWidth = 188384
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object RptOrdemPagoLabel5: TppLabel
        UserName = 'RptOrdemPagoLabel5'
        Caption = 'Obs.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1323
        mmWidth = 8467
        BandType = 7
      end
      object RptOrdemPagoLine1: TppLine
        UserName = 'RptOrdemPagoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NUMLOTE'
      DataPipeline = PpOrdemPago
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 32544
        mmPrintPosition = 0
        object ppDBText15: TppDBText
          UserName = 'ppDBText15'
          DataField = 'FAVORECIDO'
          DataPipeline = PpOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          mmHeight = 4498
          mmLeft = 23548
          mmTop = 25929
          mmWidth = 164571
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'ppLabel38'
          Caption = 'Favorecido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 25929
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'ppLabel39'
          Caption = 'Data Emissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 132821
          mmTop = 13229
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'ppDBText16'
          AutoSize = True
          DataField = 'DATAEMISSAO'
          DataPipeline = PpOrdemPago
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          mmHeight = 4498
          mmLeft = 160338
          mmTop = 13229
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          Caption = 'Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 151871
          mmTop = 7408
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object RptOrdemPagoDBText3: TppDBText
          UserName = 'RptOrdemPagoDBText3'
          DataField = 'VALORLOTE'
          DataPipeline = PpOrdemPago
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          mmHeight = 4498
          mmLeft = 156898
          mmTop = 18785
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object RptOrdemPagoLabel3: TppLabel
          UserName = 'RptOrdemPagoLabel3'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 4763
          mmLeft = 146844
          mmTop = 18785
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object RptOrdemPagoDBText5: TppDBText
          UserName = 'RptOrdemPagoDBText5'
          DataField = 'NUMSLIP'
          DataPipeline = PpOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 157957
          mmTop = 7408
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ImgLogo: TppImage
          UserName = 'Imgem'
          MaintainAspectRatio = False
          mmHeight = 23548
          mmLeft = 0
          mmTop = 0
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'ppLabel25'
          Caption = 'CM Soluções Informática'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5821
          mmLeft = 27252
          mmTop = 529
          mmWidth = 59002
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'ppLabel28'
          Caption = 'Ordem de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 142875
          mmTop = 1058
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'ppLine18'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 25135
          mmWidth = 190000
          BandType = 3
          GroupNo = 0
        end
        object RptOrdemPagoDBText6: TppDBText
          UserName = 'RptOrdemPagoDBText6'
          AutoSize = True
          DataField = 'CANCELADO'
          DataPipeline = PpOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 115359
          mmTop = 1058
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 30956
          mmWidth = 190000
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'ppSubReport1'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = ppSubReport2
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 9260
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = PpQryContabBaixaLote
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object ppDetailBand7: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText29: TppDBText
                UserName = 'ppDBText29'
                DataField = 'CONTACONTABIL'
                DataPipeline = PpQryContabBaixaLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 17727
                mmTop = 0
                mmWidth = 23019
                BandType = 4
              end
              object ppDBText30: TppDBText
                UserName = 'ppDBText30'
                DataField = 'NOMESUBCONTA'
                DataPipeline = PpQryContabBaixaLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 43127
                mmTop = 0
                mmWidth = 37042
                BandType = 4
              end
              object ppDBText31: TppDBText
                UserName = 'ppDBText31'
                AutoSize = True
                DataField = 'DEBCRE'
                DataPipeline = PpQryContabBaixaLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 178065
                mmTop = 0
                mmWidth = 11906
                BandType = 4
              end
              object ppDBText32: TppDBText
                UserName = 'ppDBText32'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = PpQryContabBaixaLote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 175419
                mmTop = 0
                mmWidth = 9525
                BandType = 4
              end
              object ppDBText33: TppDBText
                UserName = 'ppDBText33'
                DataField = 'NOMECC'
                DataPipeline = PpQryContabBaixaLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 80963
                mmTop = 0
                mmWidth = 36777
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'ppDBText34'
                DataField = 'PLNPLANIL'
                DataPipeline = PpQryContabBaixaLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
            end
          end
        end
        object ppSubReport2: TppSubReport
          UserName = 'ppSubReport2'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = ppSubReport3
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 7408
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = PpQryContab3Lote
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object ppDetailBand8: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText35: TppDBText
                UserName = 'ppDBText35'
                DataField = 'PLACONTA'
                DataPipeline = PpQryContab3Lote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 14817
                mmTop = 0
                mmWidth = 27781
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'ppDBText36'
                DataField = 'NOMESUBCONTA'
                DataPipeline = PpQryContab3Lote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 43127
                mmTop = 0
                mmWidth = 37042
                BandType = 4
              end
              object ppDBText37: TppDBText
                UserName = 'ppDBText37'
                AutoSize = True
                DataField = 'LACDEBCRE'
                DataPipeline = PpQryContab3Lote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 172509
                mmTop = 0
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText38: TppDBText
                UserName = 'ppDBText38'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = PpQryContab3Lote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 175419
                mmTop = 0
                mmWidth = 9525
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'ppDBText39'
                DataField = 'NOMECC'
                DataPipeline = PpQryContab3Lote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 80963
                mmTop = 0
                mmWidth = 36777
                BandType = 4
              end
              object ppDBText40: TppDBText
                UserName = 'ppDBText40'
                DataField = 'NOMEAP'
                DataPipeline = PpQryContab3Lote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 119063
                mmTop = 0
                mmWidth = 34131
                BandType = 4
              end
              object ppDBText41: TppDBText
                UserName = 'ppDBText41'
                DataField = 'PLNPLANIL'
                DataPipeline = PpQryContab3Lote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 0
                mmWidth = 14288
                BandType = 4
              end
            end
          end
        end
        object ppSubReport3: TppSubReport
          UserName = 'ppSubReport3'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = ppSubReport5
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 5556
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = PpQryContabLancLote
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object ppHeaderBand8: TppHeaderBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 12965
              mmPrintPosition = 0
              object ppLabel59: TppLabel
                UserName = 'ppLabel59'
                Caption = 'Contabilização'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 2117
                mmWidth = 25135
                BandType = 0
              end
              object ppLabel60: TppLabel
                UserName = 'ppLabel60'
                Caption = 'Conta Contábil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 14817
                mmTop = 8996
                mmWidth = 21167
                BandType = 0
              end
              object ppLabel61: TppLabel
                UserName = 'ppLabel61'
                Caption = 'Sub-conta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 43127
                mmTop = 8996
                mmWidth = 14552
                BandType = 0
              end
              object ppLabel62: TppLabel
                UserName = 'ppLabel62'
                Caption = 'D/C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 185473
                mmTop = 8996
                mmWidth = 4763
                BandType = 0
              end
              object ppLabel63: TppLabel
                UserName = 'ppLabel63'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 177271
                mmTop = 8996
                mmWidth = 7673
                BandType = 0
              end
              object ppLine22: TppLine
                UserName = 'ppLine22'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 794
                mmWidth = 190000
                BandType = 0
              end
              object ppLabel64: TppLabel
                UserName = 'ppLabel64'
                Caption = 'Centro de Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 80963
                mmTop = 8996
                mmWidth = 24077
                BandType = 0
              end
              object ppLabel65: TppLabel
                UserName = 'ppLabel65'
                Caption = 'Atividade/Projeto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 119063
                mmTop = 8996
                mmWidth = 24871
                BandType = 0
              end
              object ppLabel66: TppLabel
                UserName = 'ppLabel66'
                Caption = 'Planilha'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 8996
                mmWidth = 11113
                BandType = 0
              end
            end
            object ppDetailBand9: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText42: TppDBText
                UserName = 'ppDBText42'
                DataField = 'PLACONTA'
                DataPipeline = PpQryContabLancLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 14817
                mmTop = 0
                mmWidth = 27252
                BandType = 4
              end
              object ppDBText43: TppDBText
                UserName = 'ppDBText43'
                AutoSize = True
                DataField = 'LACDEBCRE'
                DataPipeline = PpQryContabLancLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 172773
                mmTop = 0
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText44: TppDBText
                UserName = 'ppDBText44'
                AutoSize = True
                DataField = 'LACVALOR'
                DataPipeline = PpQryContabLancLote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 169863
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppDBText45: TppDBText
                UserName = 'ppDBText45'
                DataField = 'NOMESUBCONTA'
                DataPipeline = PpQryContabLancLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 43127
                mmTop = 0
                mmWidth = 37042
                BandType = 4
              end
              object ppDBText46: TppDBText
                UserName = 'ppDBText46'
                DataField = 'NOMECC'
                DataPipeline = PpQryContabLancLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 80963
                mmTop = 0
                mmWidth = 36777
                BandType = 4
              end
              object ppDBText47: TppDBText
                UserName = 'ppDBText47'
                DataField = 'NOMEAP'
                DataPipeline = PpQryContabLancLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 119063
                mmTop = 0
                mmWidth = 34131
                BandType = 4
              end
              object ppDBText48: TppDBText
                UserName = 'ppDBText48'
                DataField = 'PLNPLANIL'
                DataPipeline = PpQryContabLancLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 0
                mmWidth = 14288
                BandType = 4
              end
            end
          end
        end
        object ppSubReport4: TppSubReport
          UserName = 'ppSubReport4'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = ppSubReport1
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 11113
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = PpQryAltLote
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand1: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 12965
              mmPrintPosition = 0
              object ppLabel67: TppLabel
                UserName = 'ppLabel67'
                Caption = 'Alteradores'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 2117
                mmWidth = 19315
                BandType = 1
              end
              object ppLabel68: TppLabel
                UserName = 'ppLabel68'
                Caption = 'Alterador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 6350
                mmTop = 9260
                mmWidth = 13758
                BandType = 1
              end
              object ppLabel69: TppLabel
                UserName = 'ppLabel69'
                Caption = 'Observação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 62177
                mmTop = 9260
                mmWidth = 17198
                BandType = 1
              end
              object ppLabel70: TppLabel
                UserName = 'ppLabel70'
                Caption = 'D/C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 185473
                mmTop = 9260
                mmWidth = 4763
                BandType = 1
              end
              object ppLabel71: TppLabel
                UserName = 'ppLabel71'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 177536
                mmTop = 9260
                mmWidth = 7673
                BandType = 1
              end
              object ppLine23: TppLine
                UserName = 'ppLine23'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 794
                mmWidth = 190000
                BandType = 1
              end
            end
            object ppDetailBand10: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText49: TppDBText
                UserName = 'ppDBText49'
                DataField = 'DESCRICAO'
                DataPipeline = PpQryAltLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 6350
                mmTop = 0
                mmWidth = 54769
                BandType = 4
              end
              object ppDBText50: TppDBText
                UserName = 'ppDBText50'
                DataField = 'HISTORICOCOMPL'
                DataPipeline = PpQryAltLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 62442
                mmTop = 0
                mmWidth = 84138
                BandType = 4
              end
              object ppDBText51: TppDBText
                UserName = 'ppDBText51'
                DataField = 'ACRESDECRES'
                DataPipeline = PpQryAltLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 185738
                mmTop = 0
                mmWidth = 4763
                BandType = 4
              end
              object ppDBText52: TppDBText
                UserName = 'ppDBText52'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = PpQryAltLote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 175684
                mmTop = 0
                mmWidth = 9525
                BandType = 4
              end
            end
            object ppChildReport4SummaryBand1: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 30163
              mmPrintPosition = 0
              object ppChildReport4Label1: TppLabel
                UserName = 'ppChildReport4Label1'
                Caption = 'Total Alterador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 125677
                mmTop = 4763
                mmWidth = 21696
                BandType = 7
              end
              object ppChildReport4Label2: TppLabel
                UserName = 'ppChildReport4Label2'
                Caption = 'Valor Lote'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 132292
                mmTop = 529
                mmWidth = 15081
                BandType = 7
              end
              object ppChildReport4Label3: TppLabel
                UserName = 'ppChildReport4Label3'
                Caption = 'Valor Líquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 128059
                mmTop = 9525
                mmWidth = 19315
                BandType = 7
              end
              object LblValorLote: TppDBText
                UserName = 'LblValorLote'
                DataField = 'VALORLOTE'
                DataPipeline = PpOrdemPago
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 158221
                mmTop = 265
                mmWidth = 27517
                BandType = 7
              end
              object LblTotalLiq: TppLabel
                OnPrint = LblTotalLiqPrint
                UserName = 'LblTotalLiq'
                Caption = 'LblTotalLiq'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 170657
                mmTop = 9525
                mmWidth = 15081
                BandType = 7
              end
              object ppChildReport4Line1: TppLine
                UserName = 'ppChildReport4Line1'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 120915
                mmTop = 8731
                mmWidth = 64029
                BandType = 7
              end
              object lbltotalalt: TppLabel
                OnPrint = lbltotalaltPrint
                UserName = 'lbltotalalt'
                Caption = 'LblTotalalt'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 171715
                mmTop = 4498
                mmWidth = 14023
                BandType = 7
              end
              object ppRegion3: TppRegion
                UserName = 'ppRegion3'
                Brush.Style = bsClear
                Caption = 'ppRegion3'
                Pen.Color = clNone
                Pen.Style = psClear
                Stretch = True
                Transparent = True
                mmHeight = 6879
                mmLeft = 265
                mmTop = 19315
                mmWidth = 189971
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object LblCalcValor: TppDBCalc
                  UserName = 'LblCalcValor'
                  AutoSize = True
                  DataField = 'VALOR'
                  DataPipeline = PpQryAltLote
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  Visible = False
                  mmHeight = 3440
                  mmLeft = 167217
                  mmTop = 20902
                  mmWidth = 20373
                  BandType = 7
                end
                object RptOrdemPagoDBMemo1: TppDBMemo
                  UserName = 'RptOrdemPagoDBMemo1'
                  CharWrap = True
                  DataField = 'EXTENSO'
                  DataPipeline = PpOrdemPago
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Stretch = True
                  Transparent = True
                  mmHeight = 4763
                  mmLeft = 33867
                  mmTop = 20373
                  mmWidth = 153723
                  BandType = 7
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
                object ppLabel58: TppLabel
                  UserName = 'ppLabel58'
                  Caption = 'Valor Por Extenso:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 1588
                  mmTop = 20638
                  mmWidth = 31750
                  BandType = 7
                end
              end
              object RptOrdemPagoLabel1: TppLabel
                UserName = 'RptOrdemPagoLabel1'
                Caption = 'Data Diferido:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 65088
                mmTop = 14552
                mmWidth = 23283
                BandType = 7
              end
              object RptOrdemPagoDBText1: TppDBText
                UserName = 'RptOrdemPagoDBText1'
                AutoSize = True
                DataField = 'DATADIFERIDO'
                DataPipeline = PpOrdemPago
                DisplayFormat = 'dd/mm/yyyy'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 88900
                mmTop = 14552
                mmWidth = 26194
                BandType = 7
              end
              object RptOrdemPagoLabel2: TppLabel
                UserName = 'RptOrdemPagoLabel2'
                Caption = 'Nº Cheque:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 265
                mmTop = 14552
                mmWidth = 19050
                BandType = 7
              end
              object RptOrdemPagoDBText2: TppDBText
                UserName = 'RptOrdemPagoDBText2'
                AutoSize = True
                DataField = 'NUMCHQBORDERO'
                DataPipeline = PpOrdemPago
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 21167
                mmTop = 14552
                mmWidth = 33602
                BandType = 7
              end
              object RptOrdemPagoLabel4: TppLabel
                UserName = 'RptOrdemPagoLabel4'
                Caption = 'Banco:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 265
                mmTop = 8731
                mmWidth = 11906
                BandType = 7
              end
              object RptOrdemPagoDBText4: TppDBText
                UserName = 'RptOrdemPagoDBText4'
                DataField = 'RAZAOSOCIAL'
                DataPipeline = PpOrdemPago
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 13494
                mmTop = 8731
                mmWidth = 104775
                BandType = 7
              end
            end
          end
        end
        object ppSubReport5: TppSubReport
          UserName = 'ppSubReport5'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = RptRateioLote
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 3969
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = PpQryRateiParcPago
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object ppDetailBand11: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText53: TppDBText
                UserName = 'ppDBText53'
                DataField = 'NOMEAP'
                DataPipeline = PpQryRateiParcPago
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 8467
                mmTop = 0
                mmWidth = 46567
                BandType = 4
              end
              object ppDBText54: TppDBText
                UserName = 'ppDBText54'
                DataField = 'NOMECR'
                DataPipeline = PpQryRateiParcPago
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 55563
                mmTop = 0
                mmWidth = 39952
                BandType = 4
              end
              object ppDBText57: TppDBText
                UserName = 'ppDBText57'
                DataField = 'DESCTDR'
                DataPipeline = PpQryRateiParcPago
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 96044
                mmTop = 0
                mmWidth = 63500
                BandType = 4
              end
              object ppDBText58: TppDBText
                UserName = 'ppDBText58'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = PpQryRateiParcPago
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 177536
                mmTop = 0
                mmWidth = 9525
                BandType = 4
              end
            end
          end
        end
        object RptRateioLote: TppSubReport
          UserName = 'RptRateioLote'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = RptDocumentosLote
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 2117
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptOrdemPagoChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = PpQryRateioLote
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object RptOrdemPagoChildReport1DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText10: TppDBText
                UserName = 'ppDBText10'
                DataField = 'NOMEAP'
                DataPipeline = PpQryRateioLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 8467
                mmTop = 0
                mmWidth = 46567
                BandType = 4
              end
              object ppDBText11: TppDBText
                UserName = 'ppDBText11'
                DataField = 'NOMECR'
                DataPipeline = PpQryRateioLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 55563
                mmTop = 0
                mmWidth = 39952
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'ppDBText12'
                DataField = 'DESCTDR'
                DataPipeline = PpQryRateioLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 96044
                mmTop = 0
                mmWidth = 63500
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'ppDBText13'
                AutoSize = True
                DataField = 'VALORRATEIO'
                DataPipeline = PpQryRateioLote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 166952
                mmTop = 0
                mmWidth = 20108
                BandType = 4
              end
            end
          end
        end
        object RptDocumentosLote: TppSubReport
          UserName = 'RptDocumentosLote'
          ExpandAll = False
          NewPrintJob = False
          TraverseAllData = False
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptOrdemPagoChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = PpQryDocsLote
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4 297 x 210 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object RptOrdemPagoChildReport2HeaderBand1: TppHeaderBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 10848
              mmPrintPosition = 0
              object RptOrdemPagoChildReport2Label1: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label1'
                Caption = 'Num Doc'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 6879
                mmWidth = 12700
                BandType = 0
              end
              object RptOrdemPagoChildReport2Label2: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label2'
                Caption = 'Favorecido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 23283
                mmTop = 6879
                mmWidth = 15875
                BandType = 0
              end
              object RptOrdemPagoChildReport2Label3: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label3'
                Caption = 'Data Prog'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 75671
                mmTop = 6879
                mmWidth = 13758
                BandType = 0
              end
              object RptOrdemPagoChildReport2Label4: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label4'
                Caption = 'Histórico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 93663
                mmTop = 6879
                mmWidth = 12965
                BandType = 0
              end
              object RptOrdemPagoChildReport2Label5: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label5'
                Caption = 'Val. Original'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 146050
                mmTop = 6879
                mmWidth = 17198
                BandType = 0
              end
              object RptOrdemPagoChildReport2Label6: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label6'
                Caption = 'Val. Pago'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 176742
                mmTop = 6879
                mmWidth = 13229
                BandType = 0
              end
              object RptOrdemPagoChildReport2Label7: TppLabel
                UserName = 'RptOrdemPagoChildReport2Label7'
                Caption = 'Documentos Pagos Com Este Cheque'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 794
                mmWidth = 62706
                BandType = 0
              end
              object RptOrdemPagoChildReport2Line1: TppLine
                UserName = 'RptOrdemPagoChildReport2Line1'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 0
                mmWidth = 190000
                BandType = 0
              end
            end
            object RptOrdemPagoChildReport2DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object RptOrdemPagoChildReport2DBText1: TppDBText
                UserName = 'RptOrdemPagoChildReport2DBText1'
                DataField = 'NODOCUMENTO'
                DataPipeline = PpQryDocsLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 265
                mmTop = 0
                mmWidth = 22754
                BandType = 4
              end
              object RptOrdemPagoChildReport2DBText5: TppDBText
                UserName = 'RptOrdemPagoChildReport2DBText5'
                DataField = 'DATAPROGRAMADA'
                DataPipeline = PpQryDocsLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 75936
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object RptOrdemPagoChildReport2DBText7: TppDBText
                UserName = 'RptOrdemPagoChildReport2DBText7'
                DataField = 'HISTORICOCOMPL'
                DataPipeline = PpQryDocsLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 93927
                mmTop = 0
                mmWidth = 44715
                BandType = 4
              end
              object RptOrdemPagoChildReport2DBText8: TppDBText
                UserName = 'RptOrdemPagoChildReport2DBText8'
                DataField = 'VALOR'
                DataPipeline = PpQryDocsLote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 173038
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object RptOrdemPagoChildReport2DBText9: TppDBText
                UserName = 'RptOrdemPagoChildReport2DBText9'
                DataField = 'VALORIGINAL'
                DataPipeline = PpQryDocsLote
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 146315
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object RptOrdemPagoChildReport2DBText10: TppDBText
                UserName = 'RptOrdemPagoChildReport2DBText10'
                DataField = 'RAZAOSOCIAL'
                DataPipeline = PpQryDocsLote
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 23548
                mmTop = 0
                mmWidth = 51594
                BandType = 4
              end
            end
            object RptOrdemPagoChildReport2SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 10054
              mmPrintPosition = 0
              object ppLabel40: TppLabel
                UserName = 'ppLabel40'
                Caption = 'Rateios'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 4233
                mmTop = 1588
                mmWidth = 12435
                BandType = 7
              end
              object ppLabel41: TppLabel
                UserName = 'ppLabel41'
                Caption = 'Atividade\Projeto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 8731
                mmTop = 6350
                mmWidth = 24871
                BandType = 7
              end
              object ppLabel42: TppLabel
                UserName = 'ppLabel42'
                Caption = 'Centro Resp.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 55827
                mmTop = 6350
                mmWidth = 19050
                BandType = 7
              end
              object ppLabel43: TppLabel
                UserName = 'ppLabel43'
                Caption = 'Tipo de Desembolso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 96309
                mmTop = 6350
                mmWidth = 30163
                BandType = 7
              end
              object ppLabel44: TppLabel
                UserName = 'ppLabel44'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 178594
                mmTop = 6350
                mmWidth = 7673
                BandType = 7
              end
              object ppLine20: TppLine
                UserName = 'ppLine20'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 1058
                mmWidth = 190000
                BandType = 7
              end
            end
          end
        end
      end
    end
  end
  object CdsAltLotetot: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 232
  end
  object SqlAltLotetot: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */ '
      
        '  DECODE(L.DEBCRE,'#39'D'#39',DECODE(D.RECPAG,'#39'P'#39',L.VALOR ,L.VALOR * -1)' +
        ',DECODE(D.RECPAG,'#39'R'#39',L.VALOR ,L.VALOR * -1)) AS VALOR'
      'FROM'
      '  TIPOALTERADOR TA, LANCTODOCUM L, LOTEXDOCUM LX, DOCUMENTO D'
      'WHERE'
      '  (LX.NUMLOTE = :NUMLOTE)            AND'
      '  (L.CODDOCUMENTO = D.CODDOCUMENTO)  AND'
      '  (L.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      '  (L.OPERACAO = '#39'4'#39')                 AND'
      '  (L.CODALTERADOR = TA.CODALTERADOR)'
      '')
    ClientDataSet = CdsAltLotetot
    Left = 368
    Top = 288
  end
  object SqlTeste: TCMSqlParams
    ClientDataSet = CdsTeste
    Left = 428
    Top = 429
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 330
    Top = 424
  end
end
