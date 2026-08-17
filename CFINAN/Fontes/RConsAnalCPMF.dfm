inherited RptConsAnalCPMF: TRptConsAnalCPMF
  Left = 274
  Top = 201
  Width = 249
  Height = 211
  Caption = 'Relatório de Consulta Analítica de CPMF'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Consulta Analítica de CPMF'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data de Retenção'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
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
        Name = 'Data de Retenção'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end
      item
        Caption = 'Número do Lote'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Número do Lote'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end>
    Formheight = 120
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = RptConsCpmf
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    ConnectionType = cntBDE
  end
  object PpConsCPMF: TppBDEPipeline
    DataSource = DsConsCPMF
    SkipWhenNoRecords = False
    UserName = 'PpConsCPMF'
    Left = 72
    Top = 71
    object PpConsCPMFppField1: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField3: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField4: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField5: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField6: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField7: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField8: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField9: TppField
      FieldAlias = 'VLRPREVISTO'
      FieldName = 'VLRPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField10: TppField
      FieldAlias = 'VLREFETIVO'
      FieldName = 'VLREFETIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField11: TppField
      FieldAlias = 'TIPOLOTE'
      FieldName = 'TIPOLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpConsCPMFppField12: TppField
      FieldAlias = 'DATARETENCAO'
      FieldName = 'DATARETENCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object DsConsCPMF: TwwDataSource
    AutoEdit = False
    DataSet = QryConsCPMF
    Left = 127
    Top = 71
  end
  object QryConsCPMF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAPROGRAMADA,'
      '   RAZAOSOCIAL,'
      '   IDPESSOA,'
      '   CODDOCUMENTO,'
      '   NODOCUMENTO,'
      '   COMPLDOCUMENTO,'
      '   NUMLOTE,'
      '   VALOR,'
      '   VLRPREVISTO,'
      '   VLREFETIVO,'
      '   TIPOLOTE,'
      '   DATARETENCAO'
      'FROM'
      '('
      '-- Pagamento Lote'
      '  SELECT'
      '     D.CODDOCUMENTO,'
      '     D.NODOCUMENTO,'
      '     D.COMPLDOCUMENTO,'
      '     D.DATAPROGRAMADA,'
      '     P.RAZAOSOCIAL,'
      '     P.IDPESSOA,'
      '     LP.NUMLOTE,'
      '     SUM(ROUND((R.VALOR * LX.VALOR/L.VALOR),2)) AS VALOR,'
      
        '     SUM(ROUND((((R.VALOR * LX.VALOR/L.VALOR) * 0.38)/100),2)) A' +
        'S VLRPREVISTO,'
      
        '     SUM(ROUND((((R.VALOR * LX.VALOR/L.VALOR)* DECODE(F.PERCCUST' +
        'AGREG,NULL,0,F.PERCCUSTAGREG)) /100),2)) AS VLREFETIVO,'
      '     ('#39'L'#39') AS TIPOLOTE,'
      '     I.DATARETENCAO'
      '  FROM'
      
        '     RATEIODOCUM R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIXATIPOA' +
        'GREG F,'
      '     DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LX, LOTEPAGTO LP,'
      
        '     TIPORECEBDESEMB, CENTCUST, PROGRAMA, PESSOA P, IMPOSTORETID' +
        'O I'
      '  WHERE'
      '-- #INSERENUMLOTE'
      ''
      '--     I.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     I.NUMLOTE = LP.NUMLOTE AND'
      ''
      '     LP.NUMLOTE = LX.NUMLOTE AND'
      '     D.IDFORCLI = P.IDPESSOA AND'
      '     D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '     D.OPERACAO = L.OPERACAO AND'
      '     LX.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '     R.RECPAG = T.RECPAG(+) AND'
      '     R.IDPESSOA = T.IDPESSOA(+) AND'
      ''
      '     R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '     R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '     R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '     R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '     R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      '     R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = T.IDEMPRESA(+) AND'
      
        '     DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROG' +
        'RAMA(+),NULL,-1,T.IDPROGRAMA(+)) AND'
      '     T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '     TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '     TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      '  GROUP BY'
      '     D.DATAPROGRAMADA,'
      '     D.CODDOCUMENTO,'
      '     D.NODOCUMENTO,'
      '     D.COMPLDOCUMENTO,'
      '     P.RAZAOSOCIAL,'
      '     P.IDPESSOA,'
      '     LP.NUMLOTE,'
      '     '#39'L'#39','
      '     I.DATARETENCAO'
      ''
      '  UNION'
      ''
      '  SELECT'
      '     D.CODDOCUMENTO,'
      '     D.NODOCUMENTO,'
      '     D.COMPLDOCUMENTO,'
      '     D.DATAPROGRAMADA,'
      '     P.RAZAOSOCIAL,'
      '     P.IDPESSOA,'
      '     LP.NUMLOTE,'
      '     SUM(ROUND((R.VALOR * LX.VALOR/L.VALOR),2)) AS VALOR,'
      
        '     SUM(ROUND((((R.VALOR * LX.VALOR/L.VALOR) * 0.38)/100),2)) A' +
        'S VLRPREVISTO,'
      
        '     SUM(ROUND((((R.VALOR * LX.VALOR/L.VALOR)* DECODE(F.PERCCUST' +
        'AGREG,NULL,0,F.PERCCUSTAGREG)) /100),2)) AS VLREFETIVO,'
      '     ('#39'L'#39') AS TIPOLOTE,'
      '     I.DATARETENCAO'
      '  FROM'
      
        '     VWRATEIOPARCELADO  R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAI' +
        'XATIPOAGREG F,'
      '     DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LX, LOTEPAGTO LP,'
      
        '     TIPORECEBDESEMB, CENTCUST, PROGRAMA, PESSOA P, IMPOSTORETID' +
        'O I'
      '  WHERE'
      '-- #INSERENUMLOTE'
      ''
      '--     I.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     I.NUMLOTE = LP.NUMLOTE AND'
      ''
      '     LP.NUMLOTE = LX.NUMLOTE AND'
      '     D.IDFORCLI = P.IDPESSOA AND'
      '     D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '     D.OPERACAO = L.OPERACAO AND'
      '     LX.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '     R.RECPAG = T.RECPAG(+) AND'
      '     R.IDPESSOA = T.IDPESSOA(+) AND'
      ''
      '     R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '     R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '     R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '     R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '     R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      '     R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = T.IDEMPRESA(+) AND'
      
        '     DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROG' +
        'RAMA(+),NULL,-1,T.IDPROGRAMA(+)) AND'
      '     T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '     TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '     TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      '  GROUP BY'
      '     D.DATAPROGRAMADA,'
      '     D.CODDOCUMENTO,'
      '     D.NODOCUMENTO,'
      '     D.COMPLDOCUMENTO,'
      '     P.RAZAOSOCIAL,'
      '     P.IDPESSOA,'
      '     LP.NUMLOTE,'
      '     '#39'L'#39','
      '     I.DATARETENCAO'
      ''
      '-- Pagamento Manual'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    D.CODDOCUMENTO,'
      '    D.NODOCUMENTO,'
      '    D.COMPLDOCUMENTO,'
      '    D.DATAPROGRAMADA,'
      '    P.RAZAOSOCIAL,'
      '    P.IDPESSOA,'
      '    LB.NUMLOTEMANUAL AS NUMLOTE,'
      '    SUM(ROUND((R.VALOR * LB.VALOR/L.VALOR),2)) AS VALOR,'
      
        '    SUM(ROUND((((R.VALOR * LB.VALOR/L.VALOR) * 0.38)/100),2)) AS' +
        ' VLRPREVISTO,'
      
        '    SUM(ROUND((((R.VALOR * LB.VALOR/L.VALOR)* DECODE(F.PERCCUSTA' +
        'GREG,NULL,0,F.PERCCUSTAGREG)) /100),2)) AS VLREFETIVO,'
      '    ('#39'M'#39') AS TIPOLOTE,'
      '    I.DATARETENCAO'
      '  FROM'
      
        '     RATEIODOCUM R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIXATIPOA' +
        'GREG F,'
      '     LANCTODOCUM LB, DOCUMENTO D, LANCTODOCUM L,'
      
        '     TIPORECEBDESEMB, CENTCUST, PROGRAMA, PESSOA P, IMPOSTORETID' +
        'O I'
      '  WHERE'
      '-- #INSERENUMLOTEMANUAL'
      ''
      '--     I.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     I.NUMLOTEMANUAL = LB.NUMLOTEMANUAL AND'
      ''
      '     RTRIM(LB.OPERACAO) = '#39'5'#39' AND'
      '     D.IDFORCLI = P.IDPESSOA AND'
      '     R.CODDOCUMENTO = LB.CODDOCUMENTO AND'
      '     R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '     R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '     D.OPERACAO = L.OPERACAO AND'
      '     R.RECPAG = T.RECPAG(+) AND'
      '     R.IDPESSOA = T.IDPESSOA(+) AND'
      '     R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = T.IDEMPRESA(+) AND'
      ''
      '     R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '     R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '     R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '     R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '     R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      
        '     DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROG' +
        'RAMA,NULL,-1,T.IDPROGRAMA) AND'
      '     T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '     TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '     TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      '  GROUP BY'
      '    D.CODDOCUMENTO,'
      '    D.NODOCUMENTO,'
      '    D.COMPLDOCUMENTO,'
      '    D.DATAPROGRAMADA,'
      '    P.RAZAOSOCIAL,'
      '    P.IDPESSOA,'
      '    LB.NUMLOTEMANUAL,'
      '    '#39'M'#39','
      '    I.DATARETENCAO'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    D.CODDOCUMENTO,'
      '    D.NODOCUMENTO,'
      '    D.COMPLDOCUMENTO,'
      '    D.DATAPROGRAMADA,'
      '    P.RAZAOSOCIAL,'
      '    P.IDPESSOA,'
      '    LB.NUMLOTEMANUAL AS NUMLOTE,'
      '    SUM(ROUND((R.VALOR * LB.VALOR/L.VALOR),2)) AS VALOR,'
      
        '    SUM(ROUND((((R.VALOR * LB.VALOR/L.VALOR) * 0.38)/100),2)) AS' +
        ' VLRPREVISTO,'
      
        '    SUM(ROUND((((R.VALOR * LB.VALOR/L.VALOR)* DECODE(F.PERCCUSTA' +
        'GREG,NULL,0,F.PERCCUSTAGREG)) /100),2)) AS VLREFETIVO,'
      '    ('#39'M'#39') AS TIPOLOTE,'
      '    I.DATARETENCAO'
      '  FROM'
      
        '     VWRATEIOPARCELADO R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIX' +
        'ATIPOAGREG F,'
      '     LANCTODOCUM LB, DOCUMENTO D, LANCTODOCUM L,'
      
        '     TIPORECEBDESEMB, CENTCUST, PROGRAMA, PESSOA P, IMPOSTORETID' +
        'O I'
      '  WHERE'
      '-- #INSERENUMLOTEMANUAL'
      ''
      '--     I.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     I.NUMLOTEMANUAL = LB.NUMLOTEMANUAL AND'
      ''
      '     RTRIM(LB.OPERACAO) = '#39'5'#39' AND'
      '     R.CODDOCUMENTO = LB.CODDOCUMENTO AND'
      '     R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '     R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '     D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '     D.OPERACAO = L.OPERACAO AND'
      '     R.RECPAG = T.RECPAG(+) AND'
      '     R.IDPESSOA = T.IDPESSOA(+) AND'
      '     R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = T.IDEMPRESA(+) AND'
      ''
      '     R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '     R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '     R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '     R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '     R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '     R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      
        '     DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROG' +
        'RAMA,NULL,-1,T.IDPROGRAMA) AND'
      '     T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '     TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '     TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      '  GROUP BY'
      '    D.CODDOCUMENTO,'
      '    D.NODOCUMENTO,'
      '    D.COMPLDOCUMENTO,'
      '    D.DATAPROGRAMADA,'
      '    P.RAZAOSOCIAL,'
      '    P.IDPESSOA,'
      '    LB.NUMLOTEMANUAL,'
      '    '#39'M'#39','
      '    I.DATARETENCAO'
      ')'
      'ORDER BY'
      '   DATARETENCAO,'
      '   DATAPROGRAMADA,'
      '   RAZAOSOCIAL,'
      '   IDPESSOA,'
      '   CODDOCUMENTO,'
      '   NODOCUMENTO,'
      '   COMPLDOCUMENTO,'
      '   NUMLOTE'
      ''
      '')
    ControlType.Strings = (
      'FLGCONFIRMARECPAG;CheckBox;S;N'
      'RECALCULA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 182
    Top = 71
    object QryConsCPMFDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object QryConsCPMFRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object QryConsCPMFIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryConsCPMFCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryConsCPMFNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object QryConsCPMFCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object QryConsCPMFNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object QryConsCPMFVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryConsCPMFVLRPREVISTO: TFloatField
      FieldName = 'VLRPREVISTO'
    end
    object QryConsCPMFVLREFETIVO: TFloatField
      FieldName = 'VLREFETIVO'
    end
    object QryConsCPMFTIPOLOTE: TStringField
      FieldName = 'TIPOLOTE'
      FixedChar = True
      Size = 1
    end
    object QryConsCPMFDATARETENCAO: TDateTimeField
      FieldName = 'DATARETENCAO'
    end
  end
  object RptConsCpmf: TppReport
    AutoStop = False
    DataPipeline = PpConsCPMF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listagem de CPMF'
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
    CachePages = True
    DeviceType = 'Screen'
    Left = 24
    Top = 71
    Version = '5.5'
    mmColumnWidth = 197300
    object HeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'Funcef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 134144
        mmTop = 1588
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'LblEmpresa1'
        Caption = 'Consulta Analítica de CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 109802
        mmTop = 9525
        mmWidth = 64823
        BandType = 0
      end
    end
    object DetRateio: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpConsCPMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 0
        mmWidth = 34660
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NUMLOTE'
        DataPipeline = PpConsCPMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'TIPOLOTE'
        DataPipeline = PpConsCPMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68527
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpConsCPMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 89959
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpConsCPMF
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 201084
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'VLRPREVISTO'
        DataPipeline = PpConsCPMF
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 223309
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'VLREFETIVO'
        DataPipeline = PpConsCPMF
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261409
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2646
        mmWidth = 59002
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 119327
        mmTop = 2646
        mmWidth = 45508
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label102'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 265
        mmWidth = 8731
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpConsCPMF
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 187325
        mmTop = 265
        mmWidth = 25665
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        AutoSize = True
        DataField = 'VLRPREVISTO'
        DataPipeline = PpConsCPMF
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 209815
        mmTop = 265
        mmWidth = 38100
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        AutoSize = True
        DataField = 'VLREFETIVO'
        DataPipeline = PpConsCPMF
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 247915
        mmTop = 265
        mmWidth = 35454
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATARETENCAO'
      DataPipeline = PpConsCPMF
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label1'
          Caption = 'Data Programada da CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 1058
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'DATARETENCAO'
          DataPipeline = PpConsCPMF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 46831
          mmTop = 1058
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Sub-total da Data de Retenção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 93134
          mmTop = 0
          mmWidth = 51329
          BandType = 5
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'DATARETENCAO'
          DataPipeline = PpConsCPMF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 0
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpConsCPMF
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 187325
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'VLRPREVISTO'
          DataPipeline = PpConsCPMF
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 209815
          mmTop = 0
          mmWidth = 38100
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'VLREFETIVO'
          DataPipeline = PpConsCPMF
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 247915
          mmTop = 0
          mmWidth = 35454
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATAPROGRAMADA'
      DataPipeline = PpConsCPMF
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label2'
          Caption = 'Dt. Prog. Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 0
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label3'
          Caption = 'Número do Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 37835
          mmTop = 0
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label4'
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 89694
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label5'
          Caption = 'Valor do Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 180711
          mmTop = 0
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'CPMF Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 223838
          mmTop = 0
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'CPMF Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 261144
          mmTop = 0
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 68263
          mmTop = 0
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Sub-total do dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 117475
          mmTop = 265
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'DATAPROGRAMADA'
          DataPipeline = PpConsCPMF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 265
          mmWidth = 35719
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpConsCPMF
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 187325
          mmTop = 265
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'VLRPREVISTO'
          DataPipeline = PpConsCPMF
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 209815
          mmTop = 265
          mmWidth = 38100
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'VLREFETIVO'
          DataPipeline = PpConsCPMF
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 247915
          mmTop = 265
          mmWidth = 35454
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
