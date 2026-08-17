inherited DmRelSaldosRFGrp: TDmRelSaldosRFGrp
  Left = 361
  Top = 183
  Width = 323
  Height = 293
  Caption = 'DmRelSaldosRFGrp'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 42
    Top = 8
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 42
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 42
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited DetailBand1: TppDetailBand
      PrintHeight = phDynamic
    end
  end
  object dsPlano: TwwDataSource
    AutoEdit = False
    DataSet = qryPlano
    Left = 63
    Top = 69
  end
  object desPlano: TDecisionSource
    DecisionCube = decPlano
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 52
    Top = 69
    DimensionCount = 1
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1)
  end
  object decPlano: TDecisionCube
    DataSet = deqPlano
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'GRUPO'
        Name = 'GRUPO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diActive
        Format = '###,###,###,###,##0.0'
        FieldType = ftFloat
        Fieldname = 'SALDOVLR'
        Name = 'SALDOVLR'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 16
    MaxSummaries = 50
    MaxCells = 50
    Left = 42
    Top = 69
  end
  object deqPlano: TDecisionQuery
    DatabaseName = 'BaseDados'
    Constraints = <
      item
        FromDictionary = False
      end>
    SQL.Strings = (
      'SELECT PP.PLANPRVCONTABPATRO AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV,'
      '       (SELECT PA.IDPLANPREVCTBPATR,'
      
        '               SUBSTR((PL.NOME ||'#39' - '#39'|| PE.NOME),1,60) AS PLANP' +
        'RVCONTABPATRO'
      
        '        FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL' +
        ' PL'
      '        WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '          AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV )) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY PLANPRVCONTABPATRO'
      '')
    Left = 33
    Top = 69
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.PLANPRVCONTABPATRO AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV,'
      '       (SELECT PA.IDPLANPREVCTBPATR,'
      
        '               SUBSTR((PL.NOME ||'#39' - '#39'|| PE.NOME),1,60) AS PLANP' +
        'RVCONTABPATRO'
      
        '        FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL' +
        ' PL'
      '        WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '          AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV )) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY PLANPRVCONTABPATRO'
      'ORDER BY SALDOVLR DESC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 21
    Top = 69
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
    object qryPlanoGRUPO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 75
      FieldName = 'GRUPO'
      Size = 60
    end
    object qryPlanoSALDOVLR: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 28
      FieldName = 'SALDOVLR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
  end
  object dsClasse: TwwDataSource
    AutoEdit = False
    DataSet = qryClasse
    Left = 56
    Top = 117
  end
  object desClasse: TDecisionSource
    DecisionCube = decClasse
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 48
    Top = 117
    DimensionCount = 1
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1)
  end
  object decClasse: TDecisionCube
    DataSet = deqClasse
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'GRUPO'
        Name = 'GRUPO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 8
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        Format = '###,###,###,###,##0.0'
        FieldType = ftFloat
        Fieldname = 'SALDOVLR'
        Name = 'SALDOVLR'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 16
    MaxSummaries = 50
    MaxCells = 50
    Left = 40
    Top = 117
  end
  object deqClasse: TDecisionQuery
    DatabaseName = 'BaseDados'
    Constraints = <
      item
        FromDictionary = False
      end>
    SQL.Strings = (
      'SELECT DESCCLASSETIT AS Grupo,'
      '       SUM(SALDOVLRHISTRENFI) AS SALDOVLR'
      'FROM ('
      ''
      'SELECT CT.DESCCLASSETIT,'
      
        '       HR.SALDOVLRHISTRENFI, HR.TIPMOVHISRENFIX, HR.IDINVESTIMEN' +
        'TO'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV,'
      '       CLASSETITRENFIX CT'
      'WHERE'
      
        '      ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV)) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (IV.IDCLASSETIT = CT.IDCLASSETIT(+))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      ''
      ')'
      'GROUP BY DESCCLASSETIT'
      ''
      'ORDER BY DESCCLASSETIT')
    Left = 32
    Top = 117
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
  end
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CT.DESCCLASSETIT AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV,'
      '       CLASSETITRENFIX CT'
      'WHERE'
      
        '      ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV)) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (IV.IDCLASSETIT = CT.IDCLASSETIT(+))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY DESCCLASSETIT'
      'ORDER BY SALDOVLR DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 21
    Top = 117
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
    object qryClasseGRUPO: TStringField
      DisplayLabel = 'Classe de Título'
      DisplayWidth = 71
      FieldName = 'GRUPO'
      Size = 30
    end
    object qryClasseSALDOVLR: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 32
      FieldName = 'SALDOVLR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
  end
  object dsRisco: TwwDataSource
    AutoEdit = False
    DataSet = qryRisco
    Left = 60
    Top = 165
  end
  object desRisco: TDecisionSource
    DecisionCube = decRisco
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 50
    Top = 165
    DimensionCount = 1
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1)
  end
  object decRisco: TDecisionCube
    DataSet = deqRisco
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        Format = '###,###,###,###,##0.00'
        FieldType = ftString
        Fieldname = 'GRUPO'
        Name = 'GRUPO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SALDOVLR'
        Name = 'SALDOVLR'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 16
    MaxSummaries = 50
    MaxCells = 50
    Left = 40
    Top = 165
  end
  object deqRisco: TDecisionQuery
    DatabaseName = 'BaseDados'
    Constraints = <
      item
        FromDictionary = False
      end>
    SQL.Strings = (
      
        'SELECT DECODE(NVL(CR.NOMECLASSRISCO,'#39'0'#39'),'#39'0'#39','#39'Sem Classificação'#39 +
        ',CR.NOMECLASSRISCO) AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, PARAMINVEST PV, CLASSRISCOR' +
        'ENFIX CR'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV)) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY CR.NOMECLASSRISCO'
      '')
    Left = 32
    Top = 165
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
  end
  object qryRisco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(NVL(CR.NOMECLASSRISCO,'#39'0'#39'),'#39'0'#39','#39'Sem Classificação'#39 +
        ',CR.NOMECLASSRISCO) AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, PARAMINVEST PV, CLASSRISCOR' +
        'ENFIX CR'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV)) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY CR.NOMECLASSRISCO'
      'ORDER BY SALDOVLR DESC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 21
    Top = 165
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
    object qryRiscoGRUPO: TStringField
      DisplayLabel = 'Classe de Risco'
      DisplayWidth = 71
      FieldName = 'GRUPO'
      Size = 60
    end
    object qryRiscoSALDOVLR: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 32
      FieldName = 'SALDOVLR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
  end
  object dsEmissor: TwwDataSource
    AutoEdit = False
    DataSet = qryEmissor
    Left = 60
    Top = 213
  end
  object desEmissor: TDecisionSource
    DecisionCube = decEmissor
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 50
    Top = 213
    DimensionCount = 1
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1)
  end
  object decEmissor: TDecisionCube
    DataSet = deqEmissor
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        Format = '###,###,###,###,##0.00'
        FieldType = ftString
        Fieldname = 'GRUPO'
        Name = 'GRUPO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 13
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        Format = '###,###,###,###,##0.00'
        FieldType = ftFloat
        Fieldname = 'SALDO'
        Name = 'SALDO'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 16
    MaxSummaries = 50
    MaxCells = 50
    Left = 40
    Top = 213
  end
  object deqEmissor: TDecisionQuery
    DatabaseName = 'BaseDados'
    Constraints = <
      item
        FromDictionary = False
      end>
    SQL.Strings = (
      'SELECT EM.SIGLAEMISSOR AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS Saldo'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV)) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY EM.SIGLAEMISSOR'
      '')
    Left = 32
    Top = 213
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EM.SIGLAEMISSOR AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS Saldo'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = :TIPMOV)) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = :TIPMOV)) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY EM.SIGLAEMISSOR'
      'ORDER BY SALDO DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 21
    Top = 213
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
    object qryEmissorGRUPO: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 71
      FieldName = 'GRUPO'
      Size = 15
    end
    object qryEmissorSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 32
      FieldName = 'SALDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
  end
  object rptSaldosRFGrupo: TppReport
    AutoStop = False
    DataPipeline = pplSaldosRFGrupo
    OnStartPage = rptSaldosRFGrupoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Títulos de Renda Fixa por Grupos'
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
    BeforePrint = rptSaldosRFGrupoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 234
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldosRFGrupo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldos de Títulos de Renda Fixa por Grupos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 75142
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object lblCarteira: TppLabel
        UserName = 'lblCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 12171
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblDataRef: TppLabel
        UserName = 'lblDataRef'
        Caption = 'Data: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppbDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'GRUPO'
        DataPipeline = pplSaldosRFGrupo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplSaldosRFGrupo'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 146315
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'SALDOVLR'
        DataPipeline = pplSaldosRFGrupo
        DisplayFormat = '###,###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldosRFGrupo'
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 265
        mmWidth = 66675
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel5: TppLabel
        OnPrint = LblSistemaPrint
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
        mmTop = 3175
        mmWidth = 283105
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
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
        mmLeft = 254794
        mmTop = 3175
        mmWidth = 28310
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = pplSaldosRFGrupo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldosRFGrupo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object shpCabGrupo: TppShape
          UserName = 'shpCabGrupo'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOMEGRUPO'
          DataPipeline = pplSaldosRFGrupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplSaldosRFGrupo'
          mmHeight = 4233
          mmLeft = 265
          mmTop = 265
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Saldos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 271463
          mmTop = 0
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object srptClasseRisco: TppSubReport
          UserName = 'srptClasseRisco'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          Visible = False
          DataPipelineName = 'pplSaldosRFGrpRisco'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object subReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplSaldosRFGrpRisco
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Saldos de Títulos de Renda Fixa por Grupos'
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
            Left = 320
            Top = 296
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplSaldosRFGrpRisco'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand4: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 91546
              mmPrintPosition = 0
              object ppRegion5: TppRegion
                UserName = 'Region5'
                Caption = 'Region5'
                Pen.Style = psClear
                mmHeight = 85197
                mmLeft = 795
                mmTop = 5819
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafRiscoBarra: TppDPTeeChart
                  UserName = 'gGrafRiscoBarra'
                  mmHeight = 84138
                  mmLeft = 1323
                  mmTop = 6350
                  mmWidth = 140229
                  BandType = 7
                  object ppDPTeeChartControl5: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    MarginLeft = 0
                    MarginRight = 1
                    Title.Text.Strings = (
                      'Chart')
                    Title.Visible = False
                    BottomAxis.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsRightPercent
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series4: TBarSeries
                      Tag = 3
                      ColorEachPoint = True
                      Marks.ArrowLength = 20
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpRisco
                      SeriesColor = clRed
                      Title = 'Classe de Risco'
                      XLabelsSource = 'GRUPO'
                      BarStyle = bsRectGradient
                      XValues.DateTime = False
                      XValues.Name = 'X'
                      XValues.Multiplier = 1
                      XValues.Order = loAscending
                      XValues.ValueSource = 'SALDOVLR'
                      YValues.DateTime = False
                      YValues.Name = 'Bar'
                      YValues.Multiplier = 1
                      YValues.Order = loNone
                      YValues.ValueSource = 'SALDOVLR'
                    end
                  end
                end
              end
              object ppRegion6: TppRegion
                UserName = 'Region6'
                Caption = 'Region6'
                Pen.Style = psClear
                mmHeight = 85196
                mmLeft = 141817
                mmTop = 5819
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafRiscoPizza: TppDPTeeChart
                  UserName = 'gGrafRiscoPizza'
                  mmHeight = 84138
                  mmLeft = 142346
                  mmTop = 6350
                  mmWidth = 140229
                  BandType = 7
                  object ppDPTeeChartControl6: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    Title.Text.Strings = (
                      'Chart')
                    Title.Visible = False
                    AxisVisible = False
                    BottomAxis.Visible = False
                    ClipPoints = False
                    Frame.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsPlain
                    View3DWalls = False
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series5: TPieSeries
                      Tag = 3
                      Marks.ArrowLength = 8
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpRisco
                      SeriesColor = clRed
                      Title = 'Classe de Risco'
                      XLabelsSource = 'GRUPO'
                      OtherSlice.Text = 'Other'
                      PieValues.DateTime = False
                      PieValues.Name = 'Pie'
                      PieValues.Multiplier = 1
                      PieValues.Order = loNone
                      PieValues.ValueSource = 'SALDOVLR'
                    end
                  end
                end
              end
            end
          end
        end
        object srptClasseTit: TppSubReport
          UserName = 'srptClasseTit'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          Visible = False
          DataPipelineName = 'pplSaldosRFGrpClasse'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = pplSaldosRFGrpClasse
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Saldos de Títulos de Renda Fixa por Grupos'
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
            Left = 272
            Top = 248
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplSaldosRFGrpClasse'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand3: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 91017
              mmPrintPosition = 0
              object ppRegion3: TppRegion
                UserName = 'Region3'
                Caption = 'Region3'
                Pen.Style = psClear
                mmHeight = 85197
                mmLeft = 795
                mmTop = 5819
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafClasseBarra: TppDPTeeChart
                  UserName = 'gGrafClasseBarra'
                  mmHeight = 83608
                  mmLeft = 1323
                  mmTop = 6350
                  mmWidth = 139700
                  BandType = 7
                  object ppDPTeeChartControl3: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    MarginLeft = 0
                    MarginRight = 1
                    Title.Text.Strings = (
                      'TppDPTeeChartControl')
                    Title.Visible = False
                    BottomAxis.ExactDateTime = False
                    BottomAxis.Increment = 1
                    BottomAxis.LabelsMultiLine = True
                    BottomAxis.LabelsSeparation = 50
                    BottomAxis.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsRightPercent
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series2: TBarSeries
                      Tag = 3
                      ColorEachPoint = True
                      Marks.ArrowLength = 20
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpClasse
                      SeriesColor = clRed
                      Title = 'Classe de Título'
                      XLabelsSource = 'GRUPO'
                      BarStyle = bsRectGradient
                      XValues.DateTime = False
                      XValues.Name = 'X'
                      XValues.Multiplier = 1
                      XValues.Order = loAscending
                      XValues.ValueSource = 'SALDOVLR'
                      YValues.DateTime = False
                      YValues.Name = 'Bar'
                      YValues.Multiplier = 1
                      YValues.Order = loNone
                      YValues.ValueSource = 'SALDOVLR'
                    end
                  end
                end
              end
              object ppRegion4: TppRegion
                UserName = 'Region4'
                Caption = 'Region4'
                Pen.Style = psClear
                mmHeight = 84931
                mmLeft = 141817
                mmTop = 5821
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafClassePizza: TppDPTeeChart
                  UserName = 'gGrafClassePizza'
                  mmHeight = 83608
                  mmLeft = 142875
                  mmTop = 6615
                  mmWidth = 139700
                  BandType = 7
                  object ppDPTeeChartControl4: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    Title.Text.Strings = (
                      'Chart')
                    AxisVisible = False
                    ClipPoints = False
                    Frame.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsPlain
                    View3DWalls = False
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series3: TPieSeries
                      Tag = 3
                      Marks.ArrowLength = 8
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpClasse
                      SeriesColor = clRed
                      Title = 'Classe de Título'
                      XLabelsSource = 'GRUPO'
                      OtherSlice.Text = 'Other'
                      PieValues.DateTime = False
                      PieValues.Name = 'Pie'
                      PieValues.Multiplier = 1
                      PieValues.Order = loNone
                      PieValues.ValueSource = 'SALDOVLR'
                    end
                  end
                end
              end
            end
          end
        end
        object srptPlanoPatro: TppSubReport
          UserName = 'srptPlanoPatro'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplSaldosRFGrpPlano'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplSaldosRFGrpPlano
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Saldos de Títulos de Renda Fixa por Grupos'
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
            Left = 152
            Top = 128
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplSaldosRFGrpPlano'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand2: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 91281
              mmPrintPosition = 0
              object ppRegion1: TppRegion
                UserName = 'Region1'
                Caption = 'Region1'
                Pen.Style = psClear
                mmHeight = 85196
                mmLeft = 0
                mmTop = 5821
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafPlanoBarra: TppDPTeeChart
                  UserName = 'gGrafPlanoBarra'
                  mmHeight = 83608
                  mmLeft = 794
                  mmTop = 6615
                  mmWidth = 139965
                  BandType = 7
                  object ppDPTeeChartControl1: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    MarginLeft = 0
                    MarginRight = 1
                    Title.Text.Strings = (
                      '')
                    Title.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsRightPercent
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series1: TBarSeries
                      Tag = 3
                      ColorEachPoint = True
                      Marks.ArrowLength = 20
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpPlano
                      SeriesColor = clRed
                      Title = 'Plano / Patrocinadora'
                      ValueFormat = 'R$ #,##0.###'
                      XLabelsSource = 'GRUPO'
                      BarStyle = bsRectGradient
                      XValues.DateTime = False
                      XValues.Name = 'X'
                      XValues.Multiplier = 1
                      XValues.Order = loAscending
                      XValues.ValueSource = 'SALDOVLR'
                      YValues.DateTime = False
                      YValues.Name = 'Bar'
                      YValues.Multiplier = 1
                      YValues.Order = loNone
                      YValues.ValueSource = 'SALDOVLR'
                    end
                  end
                end
              end
              object ppRegion2: TppRegion
                UserName = 'Region2'
                Caption = 'Region2'
                Pen.Style = psClear
                mmHeight = 85196
                mmLeft = 141023
                mmTop = 5821
                mmWidth = 143404
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafPlanoPizza: TppDPTeeChart
                  UserName = 'gGrafPlanoPizza'
                  mmHeight = 83608
                  mmLeft = 141817
                  mmTop = 6879
                  mmWidth = 139965
                  BandType = 7
                  object ppDPTeeChartControl2: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    Title.Text.Strings = (
                      '')
                    Title.Visible = False
                    AxisVisible = False
                    ClipPoints = False
                    Frame.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsPlain
                    View3DWalls = False
                    BevelOuter = bvNone
                    Color = clWhite
                    object BarSeries1: TPieSeries
                      Tag = 3
                      Marks.ArrowLength = 20
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpPlano
                      SeriesColor = clRed
                      Title = 'Plano / Patrocinadora'
                      ValueFormat = 'R$ #,##0.###'
                      XLabelsSource = 'GRUPO'
                      OtherSlice.Text = 'Other'
                      PieValues.DateTime = False
                      PieValues.Name = 'Pie'
                      PieValues.Multiplier = 1
                      PieValues.Order = loNone
                      PieValues.ValueSource = 'SALDOVLR'
                    end
                  end
                end
              end
            end
          end
        end
        object srptEmissor: TppSubReport
          UserName = 'srptEmissor'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          Visible = False
          DataPipelineName = 'pplSaldosRFGrpEmissor'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = pplSaldosRFGrpEmissor
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Saldos de Títulos de Renda Fixa por Grupos'
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
            Left = 368
            Top = 344
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplSaldosRFGrpEmissor'
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand5: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 91017
              mmPrintPosition = 0
              object ppRegion7: TppRegion
                UserName = 'Region7'
                Caption = 'Region7'
                Pen.Style = psClear
                mmHeight = 85196
                mmLeft = 795
                mmTop = 5819
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafEmissorBarra: TppDPTeeChart
                  UserName = 'gGrafEmissorBarra'
                  mmHeight = 83873
                  mmLeft = 1323
                  mmTop = 6350
                  mmWidth = 140229
                  BandType = 7
                  object ppDPTeeChartControl7: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    MarginLeft = 0
                    MarginRight = 1
                    Title.Text.Strings = (
                      'Chart')
                    Title.Visible = False
                    BottomAxis.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsRightPercent
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series6: TBarSeries
                      Tag = 3
                      ColorEachPoint = True
                      Marks.ArrowLength = 20
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpEmissor
                      SeriesColor = clRed
                      Title = 'Emissor'
                      XLabelsSource = 'GRUPO'
                      BarStyle = bsRectGradient
                      XValues.DateTime = False
                      XValues.Name = 'X'
                      XValues.Multiplier = 1
                      XValues.Order = loAscending
                      XValues.ValueSource = 'SALDO'
                      YValues.DateTime = False
                      YValues.Name = 'Bar'
                      YValues.Multiplier = 1
                      YValues.Order = loNone
                      YValues.ValueSource = 'SALDO'
                    end
                  end
                end
              end
              object ppRegion8: TppRegion
                UserName = 'Region8'
                Caption = 'Region8'
                Pen.Style = psClear
                mmHeight = 84931
                mmLeft = 141817
                mmTop = 5821
                mmWidth = 141288
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppgGrafEmissorPizza: TppDPTeeChart
                  UserName = 'gGrafEmissorPizza'
                  mmHeight = 83608
                  mmLeft = 142611
                  mmTop = 6350
                  mmWidth = 139700
                  BandType = 7
                  object ppDPTeeChartControl8: TppDPTeeChartControl
                    Left = 0
                    Top = 0
                    Width = 400
                    Height = 250
                    Title.Text.Strings = (
                      'Chart')
                    Title.Visible = False
                    AxisVisible = False
                    BottomAxis.Visible = False
                    ClipPoints = False
                    Frame.Visible = False
                    Legend.Alignment = laBottom
                    Legend.TextStyle = ltsPlain
                    View3DWalls = False
                    BevelOuter = bvNone
                    Color = clWhite
                    object Series7: TPieSeries
                      Tag = 3
                      Marks.ArrowLength = 8
                      Marks.Style = smsPercent
                      Marks.Visible = True
                      DataSource = pplSaldosRFGrpEmissor
                      SeriesColor = clRed
                      Title = 'Emissor'
                      XLabelsSource = 'GRUPO'
                      OtherSlice.Style = poBelowPercent
                      OtherSlice.Text = 'Outros Emissores'
                      OtherSlice.Value = 1
                      PieValues.DateTime = False
                      PieValues.Name = 'Pie'
                      PieValues.Multiplier = 1
                      PieValues.Order = loNone
                      PieValues.ValueSource = 'SALDO'
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object pplSaldosRFGrpPlano: TppBDEPipeline
    DataSource = dsPlano
    OpenDataSource = False
    UserName = 'lSaldosRFGrpPlano'
    Left = 117
    Top = 64
    object pplSaldosRFGrpPlanoppField1: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 60
      DisplayWidth = 75
      Position = 0
    end
    object pplSaldosRFGrpPlanoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLR'
      FieldName = 'SALDOVLR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 28
      Position = 1
    end
  end
  object pplSaldosRFGrpClasse: TppBDEPipeline
    DataSource = dsClasse
    OpenDataSource = False
    UserName = 'pplSaldosRFGrpClasse'
    Left = 117
    Top = 112
    object pplSaldosRFGrpClasseppField1: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSaldosRFGrpClasseppField2: TppField
      FieldAlias = 'SALDOVLR'
      FieldName = 'SALDOVLR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object pplSaldosRFGrpRisco: TppBDEPipeline
    DataSource = dsRisco
    OpenDataSource = False
    UserName = 'pplSaldosRFGrpRisco'
    Left = 117
    Top = 160
    object pplSaldosRFGrpRiscoppField1: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 60
      DisplayWidth = 71
      Position = 0
    end
    object pplSaldosRFGrpRiscoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLR'
      FieldName = 'SALDOVLR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 32
      Position = 1
    end
  end
  object pplSaldosRFGrpEmissor: TppBDEPipeline
    DataSource = dsEmissor
    OpenDataSource = False
    UserName = 'pplSaldosRFGrpEmissor'
    Left = 117
    Top = 208
    object pplSaldosRFGrpEmissorppField1: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 15
      DisplayWidth = 71
      Position = 0
    end
    object pplSaldosRFGrpEmissorppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 32
      Position = 1
    end
  end
  object qryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS ORDEM, '#39'Plano / Patrocinadora'#39' AS GRUPO FROM DUAL'
      'UNION'
      'SELECT 2 AS ORDEM, '#39'Classes de Títulos'#39' AS GRUPO FROM DUAL'
      'UNION'
      'SELECT 3 AS ORDEM, '#39'Classes de Risco'#39' AS GRUPO FROM DUAL'
      'UNION'
      'SELECT 4 AS ORDEM, '#39'Emissores'#39' AS GRUPO FROM DUAL'
      ''
      'ORDER BY ORDEM')
    ValidateWithMask = True
    Left = 72
    Top = 8
    object qryGruposORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryGruposGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 21
    end
  end
  object pplSaldosRFGrupos: TppBDEPipeline
    DataSource = dsGrupos
    OpenDataSource = False
    UserName = 'pplSaldosRFGrupos'
    Left = 128
    Top = 8
    object pplSaldosRFGruposppField1: TppField
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSaldosRFGruposppField2: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsGrupos: TwwDataSource
    AutoEdit = False
    DataSet = qryGrupos
    Left = 100
    Top = 8
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = False
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = False
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'TExtraDevices'
    PDF.Author = 'TExtraDevices'
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 264
    Top = 8
  end
  object qrySaldosRFGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS IDGRUPO, '#39'Plano / Patrocinadora'#39' AS NOMEGRUPO,'
      '       PP.PLANPRVCONTABPATRO AS GRUPO,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV,'
      '       (SELECT PA.IDPLANPREVCTBPATR,'
      
        '               SUBSTR((PL.NOME ||'#39' - '#39'|| PE.NOME),1,60) AS PLANP' +
        'RVCONTABPATRO'
      
        '        FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL' +
        ' PL'
      '        WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '          AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (((:TIPOMAIOR IS NOT NULL) AND (OP.DATAOPERACAO >= TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '       ((:TIPOMENOR IS NOT NULL) AND (OP.DATAOPERACAO  < TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '       ((:TIPOMAIOR IS NULL) AND (:TIPOMENOR IS NULL) ))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = '#39'ATU'#39' )) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY PLANPRVCONTABPATRO'
      ''
      'UNION ALL'
      ''
      'SELECT 2 AS IDGRUPO, '#39'Classe de Título'#39' AS NOMEGRUPO, '
      '       CT.DESCCLASSETIT AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV,'
      '       CLASSETITRENFIX CT'
      'WHERE'
      
        '      ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (IV.IDCLASSETIT = CT.IDCLASSETIT(+))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY DESCCLASSETIT'
      ''
      'UNION ALL'
      ''
      'SELECT 3 AS IDGRUPO, '#39'Classe de Risco'#39' AS NOMEGRUPO,'
      
        '       DECODE(NVL(CR.NOMECLASSRISCO,'#39'0'#39'),'#39'0'#39','#39'Sem Classificação'#39 +
        ',CR.NOMECLASSRISCO) AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, PARAMINVEST PV, CLASSRISCOR' +
        'ENFIX CR'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY CR.NOMECLASSRISCO'
      ''
      'UNION ALL'
      ''
      'SELECT 4 AS IDGRUPO, '#39'Emissor'#39' AS NOMEGRUPO,'
      '       EM.SIGLAEMISSOR AS Grupo,'
      '       SUM(HR.SALDOVLRHISTRENFI) AS SALDOVLR'
      
        'FROM   HISTRENFIX HR, OPERRENFIX OP, INVESTIMENTO IV, EMISSOR EM' +
        ', PARAMINVEST PV'
      
        'WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) OR (OP.V' +
        'ENCOPERACAO IS NULL))'
      
        '  AND (HR.IDHISTRENFIX IN (SELECT DECODE(:TIPMOV,'#39'ATU'#39', MIN(H1.I' +
        'DHISTRENFIX), MAX(H1.IDHISTRENFIX)) AS IDHISTRENFIX'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (((:TIPMOV IS NOT NULL) AND (H1' +
        '.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      '                                   (:TIPMOV IS NULL))'
      
        '                             AND (H1.DATAHISTRENFIX = TO_DATE(:D' +
        'ATA,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ( H2.DATAHISTREN' +
        'FIX = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))'
      
        '                                            AND (((:TIPMOV IS NO' +
        'T NULL) AND (H2.TIPMOVHISRENFIX = '#39'ATU'#39')) OR'
      
        '                                                  (:TIPMOV IS NU' +
        'LL))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      'GROUP BY EM.SIGLAEMISSOR'
      ''
      'ORDER BY IDGRUPO, SALDOVLR DESC '
      ' ')
    ValidateWithMask = True
    Left = 240
    Top = 71
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
        Value = '01/05/2004'
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
        Value = 'ATU'
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOV'
        ParamType = ptResult
      end>
    object qrySaldosRFGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySaldosRFGrupoNOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      Size = 21
    end
    object qrySaldosRFGrupoGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 60
    end
    object qrySaldosRFGrupoSALDOVLR: TFloatField
      FieldName = 'SALDOVLR'
    end
  end
  object dsSaldosRFGrupo: TwwDataSource
    AutoEdit = False
    DataSet = qrySaldosRFGrupo
    Left = 244
    Top = 122
  end
  object pplSaldosRFGrupo: TppBDEPipeline
    DataSource = dsSaldosRFGrupo
    OpenDataSource = False
    UserName = 'pplSaldosRFGrupo'
    Left = 245
    Top = 182
    object pplSaldosRFGrupoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplSaldosRFGrupoppField2: TppField
      FieldAlias = 'NOMEGRUPO'
      FieldName = 'NOMEGRUPO'
      FieldLength = 21
      DisplayWidth = 21
      Position = 1
    end
    object pplSaldosRFGrupoppField3: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplSaldosRFGrupoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLR'
      FieldName = 'SALDOVLR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
end
