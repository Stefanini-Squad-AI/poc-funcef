inherited RptLancFinanc: TRptLancFinanc
  Left = 345
  Top = 256
  Width = 354
  Height = 221
  Caption = 'RptLancFinanc'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Lançamento Financeiro'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
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
        Caption = 'Sistema de Origem'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT M.IDMODULO, M.NOMEMODULO '
          'FROM MODULO M,  MOVIMFINANC V '
          'WHERE M.IDMODULO = V.IDMODULO '
          'ORDER BY M.NOMEMODULO ')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Módulo'
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
        Caption = 'Tipo Recebimento / Desembolso'
        Controle = tcMontaSelect
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODTIPRECDES, DESCRICAO, RECPAG  FROM TIPORECEBDESEMB '
          ''
          ' ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODTIPRECDES'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Tipo Recebimento'
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
        MontaSelect = MontaSelect1
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 200
    FormWidth = 500
    Left = 284
  end
  inherited DevRptCM: TExtraOptions
    Left = 136
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpLancamento
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 219
  end
  object spLancFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   M.CODLANCTRANSF,'
      
        '   DECODE(M.CODLANCTRANSF, NULL, DECODE(M.ENTRADASAIDA, '#39'S'#39', '#39'Sa' +
        'ídas'#39', '#39'Entradas'#39'), '#39'Transferencias'#39') AS ES,'
      '   M.DATALANCFINAN AS DATA,'
      '   M.CODLANCFINANC AS LANC,'
      
        '   DECODE(M.CODLANCTRANSF, NULL, PO.NOCONTACORR, DECODE(M.ENTRAD' +
        'ASAIDA, '#39'E'#39', '#39#39', PO.NOCONTACORR)) AS CODDEB,'
      
        '   DECODE(M.CODLANCTRANSF, NULL, PO.DESCRICAO,   DECODE(M.ENTRAD' +
        'ASAIDA, '#39'E'#39', '#39#39', PO.DESCRICAO))   AS DESCDEB,'
      
        '   DECODE(M.CODLANCTRANSF, NULL, R.CODTIPRECDES, DECODE(M.ENTRAD' +
        'ASAIDA, '#39'S'#39', '#39#39', PO.NOCONTACORR)) AS CODCRE,'
      
        '   DECODE(M.CODLANCTRANSF, NULL, T.DESCRICAO,    DECODE(M.ENTRAD' +
        'ASAIDA, '#39'S'#39', '#39#39', PO.DESCRICAO))   AS DESCCRE,'
      '   M.HISTORICO,'
      
        '   DECODE(R.VALOR, NULL, DECODE(M.ENTRADASAIDA, '#39'E'#39', M.VALORLANC' +
        'FINAN, (M.VALORLANCFINAN *(-1))), R.VALOR) AS VALOR,'
      '   DECODE(ANT.VLRANT, '#39#39', 0.00, ANT.VLRANT) AS VALORANT,'
      '   DECODE(PER.VLRPER, '#39#39', 0.00, PER.VLRPER) AS VALORPER,'
      '   D.NOMEMODULO,'
      
        '   DECODE(PER.VLRPER + ANT.VLRANT, '#39#39', 0.00, PER.VLRPER + ANT.VL' +
        'RANT) AS VALORATUAL,'
      ''
      '   PRG.CODPROGRAMA, PRG.DESCPROGRAMA,'
      '   PTR.NOME AS NOME_PATRO, PLP.NOME AS NOME_PLANO'
      'FROM'
      '   MOVIMFINANC     M,'
      '   RATEIOFINANC    R,'
      '   PORTADORCONTA   PO,'
      '   TIPORECEBDESEMB T,'
      '   MODULO          D,'
      ''
      '   PESSOA          PTR,'
      '   PLANPREV        PLP,'
      '   PROGRAMA        PRG,'
      ''
      '   ('
      '   SELECT'
      
        '      SUM(DECODE(ENTRADASAIDA, '#39'S'#39', VALORLANCFINAN *(-1), VALORL' +
        'ANCFINAN)) AS VLRANT'
      '   FROM'
      '      MOVIMFINANC'
      '   WHERE'
      '          ( STATUSCONCILIA <> '#39'J'#39' )'
      '      AND ( IDPESSOA       =:IDPESSOA)'
      '      AND ( DATALANCFINAN  < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   ) ANT,'
      ''
      '   ('
      '   SELECT'
      
        '      SUM(DECODE(ENTRADASAIDA, '#39'S'#39', VALORLANCFINAN *(-1), VALORL' +
        'ANCFINAN)) AS VLRPER'
      '   FROM'
      '      MOVIMFINANC'
      '   WHERE'
      '          ( STATUSCONCILIA <> '#39'J'#39' )'
      '      AND ( IDPESSOA       =:IDPESSOA)'
      '      AND ( DATALANCFINAN  >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '      AND ( DATALANCFINAN  <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   ) PER'
      ''
      'WHERE'
      '       ( M.IDPESSOA        =:IDPESSOA )'
      '   AND ( (:IDMODULO IS NULL ) OR ( M.IDMODULO =:IDMODULO ) )'
      '   AND ( M.IDPESSOA        = T.IDPESSOA )'
      '   AND ( M.DATALANCFINAN   >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') )'
      '   AND ( M.DATALANCFINAN   <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') )'
      '   AND ( M.CODLANCFINANC   = R.CODLANCFINANC(+) )'
      '   AND ( M.CODPORTADOR     = PO.CODPORTADOR )'
      '   AND ( R.CODTIPRECDES    = T.CODTIPRECDES(+) )'
      '   AND ( R.RECPAG          = T.RECPAG(+) )'
      '   AND ( R.IDPESSOA        = T.IDPESSOA(+) )'
      '   AND ( M.IDMODULO        = D.IDMODULO )'
      '   AND ( R.IDPROGRAMA      = PRG.IDPROGRAMA(+) )'
      '   AND ( R.IDPLANOPREV     = PLP.IDPLANOPREV(+) )'
      '   AND ( R.IDPATRO         = PTR.IDPESSOA(+) )'
      '   :CODTIPRECDES'
      '   :RECPAG'
      ''
      'ORDER BY'
      '  ES, DATA, CODCRE'
      ' ')
    OnFormartParam = spLancFinancFormartParam
    ClientDataSet = cdsLancFinanc
    Left = 48
    Top = 8
  end
  object cdsLancFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 48
    Top = 64
  end
  object cdsPrevisao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 128
    Top = 128
  end
  object spPrevisao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(U.VALORRMHOJE) AS VALORRMHOJE,'
      '   SUM(U.VALORPMHOJE) AS VALORPMHOJE,'
      '   SUM(U.VALORPHOJE) AS VALORPHOJE,'
      '   SUM(U.VALORRHOJE) AS VALORRHOJE,'
      '   SUM(U.VALORPNHOJE) AS VALORPNHOJE,'
      '   SUM(U.VALORRNHOJE) AS VALORRNHOJE'
      'FROM'
      '-- 1'
      '   (SELECT'
      
        '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRMHOJE' +
        ','
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 2'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPMHOJE' +
        ','
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 3'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 4'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 5'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPNHOJE' +
        ','
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 6'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)) U'
      ' ')
    ClientDataSet = cdsPrevisao
    Left = 64
    Top = 128
  end
  object pplPrevisao: TppBDEPipeline
    DataSource = dsPrevisao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lPrevisao'
    Left = 256
    Top = 128
    object pplPrevisaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRMHOJE'
      FieldName = 'VALORRMHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplPrevisaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPMHOJE'
      FieldName = 'VALORPMHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplPrevisaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPHOJE'
      FieldName = 'VALORPHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplPrevisaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRHOJE'
      FieldName = 'VALORRHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplPrevisaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPNHOJE'
      FieldName = 'VALORPNHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplPrevisaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRNHOJE'
      FieldName = 'VALORRNHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsPrevisao: TwwDataSource
    DataSet = cdsPrevisao
    Left = 192
    Top = 128
  end
  object rpLancamento: TppReport
    AutoStop = False
    DataPipeline = pplLancFinanc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 288
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplLancFinanc'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object rpLancamentoLabel2: TppLabel
        UserName = 'rpLancamentoLabel2'
        Caption = 'Lançamentos do Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 114300
        mmTop = 6879
        mmWidth = 56356
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'CM Soluções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127529
        mmTop = 529
        mmWidth = 30692
        BandType = 0
      end
      object lblDataLancamento: TppLabel
        UserName = 'lblDataLancamento'
        Caption = '27/08/1998 à 27/08/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 12435
        mmWidth = 30427
        BandType = 0
      end
      object rpLancamentoLabel4: TppLabel
        UserName = 'rpLancamentoLabel4'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 221721
        mmTop = 12435
        mmWidth = 11113
        BandType = 0
      end
      object rpLancamentoLabel15: TppLabel
        UserName = 'rpLancamentoLabel15'
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 212725
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpLancamentoDBText6: TppDBText
        UserName = 'rpLancamentoDBText6'
        AutoSize = True
        DataField = 'VALORANT'
        DataPipeline = pplLancFinanc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 17198
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Sistema de Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 200555
        mmTop = 22490
        mmWidth = 32544
        BandType = 0
      end
      object ppLblModulo: TppLabel
        OnPrint = ppLblModuloPrint
        UserName = 'LblModulo'
        Caption = 'LblModulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 22490
        mmWidth = 12435
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpLancamentoDBText9: TppDBText
        UserName = 'rpLancamentoDBText9'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplLancFinanc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 258763
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object rpLancamentoDBText2: TppDBText
        UserName = 'rpLancamentoDBText2'
        AutoSize = True
        DataField = 'LANC'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 21960
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object rpLancamentoDBText4: TppDBText
        UserName = 'rpLancamentoDBText4'
        DataField = 'CODDEB'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object rpLancamentoDBText5: TppDBText
        UserName = 'rpLancamentoDBText5'
        DataField = 'HISTORICO'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 0
        mmWidth = 91811
        BandType = 4
      end
      object rpLancamentoDBText10: TppDBText
        UserName = 'rpLancamentoDBText10'
        DataField = 'DESCDEB'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 0
        mmWidth = 45773
        BandType = 4
      end
      object rpLancamentoDBText3: TppDBText
        UserName = 'rpLancamentoDBText3'
        DataField = 'CODCRE'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3704
        mmLeft = 100013
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object rpLancamentoDBText7: TppDBText
        UserName = 'rpLancamentoDBText7'
        DataField = 'DESCCRE'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 0
        mmWidth = 45773
        BandType = 4
      end
      object rpLancamentoDBText1: TppDBText
        UserName = 'rpLancamentoDBText1'
        AutoSize = True
        DataField = 'DATA'
        DataPipeline = pplLancFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object pplblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 275167
        BandType = 8
      end
      object rpLancamentoLine1: TppLine
        UserName = 'rpLancamentoLine1'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1323
        mmWidth = 277019
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 276490
        BandType = 8
      end
      object rpLancamentoCalc2: TppSystemVariable
        UserName = 'rpLancamentoCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 249503
        mmTop = 3175
        mmWidth = 25929
        BandType = 8
      end
    end
    object rpLancamentoSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object rpLancamentoShape1: TppShape
        UserName = 'rpLancamentoShape1'
        mmHeight = 17727
        mmLeft = 265
        mmTop = 265
        mmWidth = 275696
        BandType = 7
      end
      object rpLancamentoLabel7: TppLabel
        UserName = 'rpLancamentoLabel7'
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 224896
        mmTop = 2117
        mmWidth = 21696
        BandType = 7
      end
      object rpLancamentoDBText8: TppDBText
        UserName = 'rpLancamentoDBText8'
        AutoSize = True
        DataField = 'VALORANT'
        DataPipeline = pplLancFinanc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 2117
        mmWidth = 15346
        BandType = 7
      end
      object rpLancamentoDBText12: TppDBText
        UserName = 'rpLancamentoDBText12'
        AutoSize = True
        DataField = 'VALORPER'
        DataPipeline = pplLancFinanc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 7408
        mmWidth = 15346
        BandType = 7
      end
      object rpLancamentoDBText13: TppDBText
        UserName = 'rpLancamentoDBText13'
        AutoSize = True
        DataField = 'VALORATUAL'
        DataPipeline = pplLancFinanc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancFinanc'
        mmHeight = 3175
        mmLeft = 253207
        mmTop = 12700
        mmWidth = 19050
        BandType = 7
      end
      object rpLancamentoLabel12: TppLabel
        UserName = 'rpLancamentoLabel12'
        Caption = 'Saldo Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 12700
        mmWidth = 16933
        BandType = 7
      end
      object rpLancamentoLabel16: TppLabel
        UserName = 'rpLancamentoLabel16'
        Caption = 'Movimento do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 7408
        mmWidth = 33867
        BandType = 7
      end
      object rpLancamentoSubReport1: TppSubReport
        UserName = 'rpLancamentoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplPrevisao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpLancamentoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplPrevisao
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 14000
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplPrevisao'
          object rpLancamentoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 21696
            mmPrintPosition = 0
            object rpLancamentoChildReport1Shape1: TppShape
              UserName = 'rpLancamentoChildReport1Shape1'
              mmHeight = 19050
              mmLeft = 265
              mmTop = 794
              mmWidth = 275696
              BandType = 4
            end
            object rpLancamentoChildReport1Label1: TppLabel
              UserName = 'rpLancamentoChildReport1Label1'
              Caption = 'Recebimentos em Atraso:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 3175
              mmTop = 2910
              mmWidth = 38100
              BandType = 4
            end
            object rpLancamentoChildReport1Label2: TppLabel
              UserName = 'rpLancamentoChildReport1Label2'
              Caption = 'Pagamentos em Atraso:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 6085
              mmTop = 8202
              mmWidth = 35190
              BandType = 4
            end
            object rpLancamentoChildReport1DBText1: TppDBText
              UserName = 'rpLancamentoChildReport1DBText1'
              AutoSize = True
              DataField = 'VALORRNHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 49477
              mmTop = 2910
              mmWidth = 21167
              BandType = 4
            end
            object rpLancamentoChildReport1DBText2: TppDBText
              UserName = 'rpLancamentoChildReport1DBText2'
              AutoSize = True
              DataField = 'VALORPNHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 49742
              mmTop = 8202
              mmWidth = 20902
              BandType = 4
            end
            object rpLancamentoChildReport1Label3: TppLabel
              UserName = 'rpLancamentoChildReport1Label3'
              Caption = 'Recebimentos para Hoje:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 103717
              mmTop = 2910
              mmWidth = 36248
              BandType = 4
            end
            object rpLancamentoChildReport1Label4: TppLabel
              UserName = 'rpLancamentoChildReport1Label4'
              Caption = 'Pagamentos para Hoje:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 106627
              mmTop = 8202
              mmWidth = 33338
              BandType = 4
            end
            object dbtValorRHoje1: TppDBText
              UserName = 'dbtValorRHoje1'
              AutoSize = True
              DataField = 'VALORRHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 148432
              mmTop = 2910
              mmWidth = 19050
              BandType = 4
            end
            object dbtValorPHoje1: TppDBText
              UserName = 'dbtValorPHoje1'
              AutoSize = True
              DataField = 'VALORPHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 148696
              mmTop = 8202
              mmWidth = 18785
              BandType = 4
            end
            object rpLancamentoChildReport1Label5: TppLabel
              UserName = 'rpLancamentoChildReport1Label5'
              Caption = 'Recebimentos Futuros:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 190236
              mmTop = 2910
              mmWidth = 34131
              BandType = 4
            end
            object rpLancamentoChildReport1Label6: TppLabel
              UserName = 'rpLancamentoChildReport1Label6'
              Caption = 'Pagamentos Futuros:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 193146
              mmTop = 8202
              mmWidth = 31221
              BandType = 4
            end
            object rpLancamentoChildReport1DBText5: TppDBText
              UserName = 'rpLancamentoChildReport1DBText5'
              AutoSize = True
              DataField = 'VALORRMHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 225955
              mmTop = 2910
              mmWidth = 21696
              BandType = 4
            end
            object rpLancamentoChildReport1DBText6: TppDBText
              UserName = 'rpLancamentoChildReport1DBText6'
              AutoSize = True
              DataField = 'VALORPMHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 226484
              mmTop = 8202
              mmWidth = 21431
              BandType = 4
            end
            object rpLancamentoChildReport1Label7: TppLabel
              UserName = 'rpLancamentoChildReport1Label7'
              Caption = 'Disponibilidade Prevista:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 104246
              mmTop = 13758
              mmWidth = 32808
              BandType = 4
            end
            object pplblTotal: TppLabel
              OnPrint = pplblTotalPrint
              UserName = 'pplblTotal'
              Caption = 'pplblTotal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 154252
              mmTop = 13494
              mmWidth = 13229
              BandType = 4
            end
            object dbtValorAtual: TppDBText
              UserName = 'dbtValorAtual'
              AutoSize = True
              DataField = 'VALORATUAL'
              DataPipeline = pplLancFinanc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplLancFinanc'
              mmHeight = 3175
              mmLeft = 251884
              mmTop = 14817
              mmWidth = 19050
              BandType = 4
            end
            object dbtValorPHoje: TppDBText
              UserName = 'dbtValorPHoje'
              AutoSize = True
              DataField = 'VALORPHOJE'
              DataPipeline = pplPrevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 229130
              mmTop = 15081
              mmWidth = 18785
              BandType = 4
            end
            object dbtValorRHoje: TppDBText
              UserName = 'dbtValorRHoje'
              AutoSize = True
              DataField = 'VALORRHOJE'
              DataPipeline = pplPrevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 206375
              mmTop = 15081
              mmWidth = 19050
              BandType = 4
            end
          end
        end
      end
    end
    object rpLancamentoGroup4: TppGroup
      BreakName = 'ES'
      DataPipeline = pplLancFinanc
      OutlineSettings.CreateNode = True
      UserName = 'rpLancamentoGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplLancFinanc'
      object rpLancamentoGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpLancamentoShape3: TppShape
          UserName = 'rpLancamentoShape3'
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 275696
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoDBText11: TppDBText
          UserName = 'rpLancamentoDBText11'
          AutoSize = True
          DataField = 'ES'
          DataPipeline = pplLancFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplLancFinanc'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 1323
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel11: TppLabel
          UserName = 'rpLancamentoLabel11'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 165365
          mmTop = 8731
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel13: TppLabel
          UserName = 'rpLancamentoLabel13'
          Caption = 'Descrição Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 116417
          mmTop = 8731
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel8: TppLabel
          UserName = 'rpLancamentoLabel8'
          Caption = 'N.Lanc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 19050
          mmTop = 8731
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel10: TppLabel
          UserName = 'rpLancamentoLabel10'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 41540
          mmTop = 8731
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel14: TppLabel
          UserName = 'rpLancamentoLabel14'
          Caption = 'Descrição Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 51858
          mmTop = 8731
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel9: TppLabel
          UserName = 'rpLancamentoLabel9'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 8731
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel6: TppLabel
          UserName = 'rpLancamentoLabel6'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 5292
          mmTop = 8731
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object Label9: TppLabel
          UserName = 'Label9'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 265113
          mmTop = 8731
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
      end
      object rpLancamentoGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpLancamentoDBCalc2: TppDBCalc
          UserName = 'rpLancamentoDBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pplLancFinanc
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpLancamentoGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLancFinanc'
          mmHeight = 3387
          mmLeft = 251767
          mmTop = 1852
          mmWidth = 20489
          BandType = 5
          GroupNo = 2
        end
        object rpLancamentoLabel5: TppLabel
          UserName = 'rpLancamentoLabel5'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 238655
          mmTop = 1852
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object dsLancFinanc: TwwDataSource
    DataSet = cdsLancFinanc
    Left = 128
    Top = 64
  end
  object pplLancFinanc: TppBDEPipeline
    DataSource = dsLancFinanc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lLancFinanc'
    Left = 208
    Top = 64
  end
  object MontaSelect1: TMontaSelect
    Tag = 3
    Template.IdConsulta = 0
    Caption = 'Seleciona Tipo de Desembolso'
    Colunas.Strings = (
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código do Desembolso'
      'Recebimento / Pagamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.CODTIPRECDES')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '10'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 304
    Top = 128
  end
end
