object DMOpcoes: TDMOpcoes
  OldCreateOrder = False
  Left = 66
  Top = 114
  Height = 480
  Width = 696
  object qryBuscaSaldosOpcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   HI.IDHISTCARTINV,    HI.DATAMOVCARTINV,   HI.IDINVESTIMENTO,'
      '   HI.IDCARTEIRAINVEST, HI.SALDOQTDEINVCART, HI.SALDOPREMIO,'
      '   HI.SALDOVLRINVCART,  HI.IDOPERACAOINVEST,'
      
        '   HI.IDCORRETVALORES,  HI.IDCARTEIRAGERENC, HI.IDPLANPREVCTBPAT' +
        'R,'
      '   HI.IDLOTE,'
      '   IV.DESCINVESTIMENTO, IV.IDEMISSOR,'
      '   TP.DESCTIPOOPERACAO,'
      '   OP.DTAVENCTO, OP.VLRPRECOEX, OP.IDINVESTBASE,'
      '   BO.IDBOLSAVALORES, AB.QTDELOTE'
      'FROM'
      
        '   HISTCARTINV HI, INVESTIMENTO IV, OPCOES OP, BOLSAVALORES BO, ' +
        'ACOESXBOLSA AB,'
      
        '   (SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO WHERE IDTIPOOPERAC' +
        'AO = -69) TP'
      'WHERE'
      '   (HI.IDHISTCARTINV  IN (SELECT MAX(H2.IDHISTCARTINV)'
      '                          FROM HISTCARTINV H2, INVESTIMENTO I2'
      '                          WHERE'
      
        '                            (H2.IDINVESTIMENTO = I2.IDINVESTIMEN' +
        'TO) AND'
      '                            (I2.STAOPCAO = '#39'S'#39') AND'
      
        '                            (((:IDCARTEIRAGERENC IS NOT NULL)  A' +
        'ND (H2.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR (:IDCARTEIRA' +
        'GERENC IS NULL))  AND'
      
        '                            (((:IDCARTEIRAINVEST IS NOT NULL)  A' +
        'ND (H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))    OR (:IDCARTEIRA' +
        'INVEST IS NULL))  AND'
      
        '                            (((:IDPLANPREVCTBPATR IS NOT NULL) A' +
        'ND (H2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR )) OR (:IDPLANPREV' +
        'CTBPATR IS NULL)) AND'
      
        '                            (((:IDINVESTIMENTO IS NOT NULL)    A' +
        'ND (H2.IDINVESTIMENTO = :IDINVESTIMENTO ))       OR (:IDINVESTIM' +
        'ENTO IS NULL))    AND'
      
        '                            (((:IDLOTE IS NOT NULL)            A' +
        'ND (H2.IDLOTE = :IDLOTE))                        OR (:IDLOTE IS ' +
        'NULL))            AND'
      '                            (H2.IDTIPOINVEST = 2) AND'
      
        '                            ((H2.DATAMOVCARTINV || H2.IDINVESTIM' +
        'ENTO) IN (SELECT (MAX(H3.DATAMOVCARTINV) || H3.IDINVESTIMENTO)'
      
        '                                                                ' +
        '          FROM HISTCARTINV H3, INVESTIMENTO I3'
      
        '                                                                ' +
        '          WHERE'
      
        '                                                                ' +
        '             (H3.IDINVESTIMENTO = I3.IDINVESTIMENTO) AND'
      
        '                                                                ' +
        '             (I3.STAOPCAO = '#39'S'#39') AND'
      
        '                                                                ' +
        '             (H3.IDTIPOINVEST = 2)         AND'
      
        '                                                                ' +
        '             (((:IDCARTEIRAGERENC IS NOT NULL)  AND (H3.IDCARTEI' +
        'RAGERENC = :IDCARTEIRAGERENC))   OR (:IDCARTEIRAGERENC IS NULL))' +
        '  AND'
      
        '                                                                ' +
        '             (((:IDCARTEIRAINVEST IS NOT NULL)  AND (H3.IDCARTEI' +
        'RAINVEST = :IDCARTEIRAINVEST))   OR (:IDCARTEIRAINVEST IS NULL))' +
        '  AND'
      
        '                                                                ' +
        '             (((:IDPLANPREVCTBPATR IS NOT NULL) AND (H3.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR)) OR (:IDPLANPREVCTBPATR IS NULL)' +
        ') AND'
      
        '                                                                ' +
        '             (((:IDINVESTIMENTO IS NOT NULL)    AND (H3.IDINVEST' +
        'IMENTO = :IDINVESTIMENTO))       OR (:IDINVESTIMENTO IS NULL))  ' +
        '  AND'
      
        '                                                                ' +
        '             (((:IDLOTE IS NOT NULL)            AND (H2.IDLOTE =' +
        ' :IDLOTE))                       OR (:IDLOTE IS NULL))          ' +
        '  AND                                                           ' +
        '                  '
      
        '                                                                ' +
        '             (H3.DATAMOVCARTINV <= TO_DATE(:DDATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      
        '                                                                ' +
        '          GROUP BY H3.IDINVESTIMENTO,H3.IDPLANPREVCTBPATR,H3.IDC' +
        'ARTEIRAINVEST ))'
      
        '                          GROUP BY H2.IDINVESTIMENTO,H2.IDPLANPR' +
        'EVCTBPATR,H2.IDCARTEIRAINVEST)'
      '                         ) AND'
      '   (NVL(HI.SALDOQTDEINVCART,0) <> 0)        AND'
      '   (HI.IDINVESTIMENTO = AB.IDACAO)         AND'
      '   (HI.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDINVESTIMENTO = OP.IDINVESTIMENTO) AND'
      '   (OP.IDBOLSAVALORES = BO.IDBOLSAVALORES) AND'
      '   (OP.DTAVENCTO >= TO_DATE(:DDATAREF,'#39'DD/MM/YYYY'#39'))'
      ''
      'ORDER BY HI.IDHISTCARTINV')
    ValidateWithMask = True
    Left = 61
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAREF'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DDATAREF'
        ParamType = ptOutput
      end>
    object qryBuscaSaldosOpcoesIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaSaldosOpcoesDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryBuscaSaldosOpcoesIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaSaldosOpcoesIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaSaldosOpcoesSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryBuscaSaldosOpcoesSALDOPREMIO: TFloatField
      FieldName = 'SALDOPREMIO'
    end
    object qryBuscaSaldosOpcoesIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaSaldosOpcoesIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaSaldosOpcoesIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaSaldosOpcoesDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaSaldosOpcoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaSaldosOpcoesDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
    end
    object qryBuscaSaldosOpcoesVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
    end
    object qryBuscaSaldosOpcoesIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object qryBuscaSaldosOpcoesIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaSaldosOpcoesQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
    end
    object qryBuscaSaldosOpcoesIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaSaldosOpcoesSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qryBuscaSaldosOpcoesIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaSaldosOpcoesIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
    end
  end
  object qryVerificaVenctoOpcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.IDOPCAO, OP.IDINVESTIMENTO, OP.DTAVENCTO,'
      '   OP.VLRPRECOEX, OP.IDBOLSAVALORES, OP.IDINVESTBASE,'
      '   IV.DESCINVESTIMENTO, IV.IDEMISSOR'
      'FROM'
      '   OPCOES OP, INVESTIMENTO IV'
      'WHERE'
      '   (OP.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '   AND (OP.DTAVENCTO >= TO_DATE(:DDATAREF,'#39'DD/MM/YYYY'#39'))'
      '   AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 185
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAREF'
        ParamType = ptUnknown
      end>
    object qryVerificaVenctoOpcaoIDOPCAO: TFloatField
      FieldName = 'IDOPCAO'
      Origin = 'BASEDADOS.OPCOES.IDOPCAO'
    end
    object qryVerificaVenctoOpcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPCOES.IDINVESTIMENTO'
    end
    object qryVerificaVenctoOpcaoDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
      Origin = 'BASEDADOS.OPCOES.DTAVENCTO'
    end
    object qryVerificaVenctoOpcaoVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
      Origin = 'BASEDADOS.OPCOES.VLRPRECOEX'
    end
    object qryVerificaVenctoOpcaoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.OPCOES.IDBOLSAVALORES'
    end
    object qryVerificaVenctoOpcaoIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
      Origin = 'BASEDADOS.OPCOES.IDINVESTBASE'
    end
    object qryVerificaVenctoOpcaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryVerificaVenctoOpcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
    end
  end
  object qryInsOrdMovInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ORDMOVINV'
      
        '  (IDORDMOVINV,   IDCORRETVALORES, IDINVESTIMENTO, PUORDMOVINV,O' +
        'BSMOVINV,'
      
        '   DATAORDMOVINV, QTDEORDMOVINV,   NUMDOCMOVINV,   STATMOVINV,ID' +
        'USUARIO,'
      '   IDTIPOINVEST,    IDTIPOOPERACAO,  OBSAUTMOV,'
      '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDLOTE, IDBOLSAVALORES,'
      '   QTDEORDENADA, IDPLANPREVCTBPATR)'
      'VALUES'
      
        '  (:IDORDMOVINV, :IDCORRETVALORES, :IDINVESTIMENTO, :PUORDMOVINV' +
        ',:OBSMOVINV,'
      
        '   :DATAORDMOVINV, :QTDEORDMOVINV, :NUMDOCMOVINV, :STATMOVINV,:I' +
        'DUSUARIO,'
      '   :IDTIPOINVEST,:IDTIPOOPERACAO,   :OBSAUTMOV,'
      
        '   :IDCARTEIRAINVEST, :IDCARTEIRAGERENC, :IDLOTE,:IDBOLSAVALORES' +
        ','
      '   :QTDEORDENADA, :IDPLANPREVCTBPATR)'
      ''
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 321
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PUORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDOCMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSAUTMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEORDENADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
  end
  object qryInsOperacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      
        '(IDOPERACAOINVEST,  IDCORRETVALORES,    MOECODIGO,         IDMOD' +
        'ULO,'
      
        ' EMPRESAPROP,       IDINVESTIMENTO,     IDCARTEIRAINVEST,  IDCAR' +
        'TEIRAGERENC,'
      
        ' IDTIPOINVEST,      IDTIPOOPERACAO,     DATAOPERACAO,      NUMDO' +
        'CUMENTO,     '
      
        ' QTDEOPERACAO,      PRECOUNITOPERACAO,  VLROPERACAO,       DATAV' +
        'ENCOPER,     '
      
        ' IDFORCLI,          IDLOTE,             IDCUSTODIANTE,     VLRIR' +
        ',            '
      
        ' FLGSTATUSFECHBOL,  FLGSTATUSORDMOV,    IDPLANPREVCTBPATR)      ' +
        '    '
      'VALUES'
      
        '(:IDOPERACAOINVEST, :IDCORRETVALORES,   :MOECODIGO,        :IDMO' +
        'DULO,'
      
        ' :EMPRESAPROP,      :IDINVESTIMENTO,    :IDCARTEIRAINVEST, :IDCA' +
        'RTEIRAGERENC,'
      
        ' :IDTIPOINVEST,     :IDTIPOOPERACAO,    :DATAOPERACAO,     :NUMD' +
        'OCUMENTO,'
      
        ' :QTDEOPERACAO,     :PRECOUNITOPERACAO, :VLROPERACAO,      :DATA' +
        'VENCOPER,'
      
        ' :IDFORCLI,         :IDLOTE,            :IDCUSTODIANTE,    :VLRI' +
        'R,'
      ' :FLGSTATUSFECHBOL, :FLGSTATUSORDMOV,   :IDPLANPREVCTBPATR)'
      ''
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 321
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSORDMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
  end
  object qryInsOpracao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPRACAO'
      '   (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR)'
      'VALUES'
      '   (:IDOPERACAOINVEST, :IDBOLSAVALORES, :IDACAO, :IDEMISSOR)')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 321
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
  end
  object qryInsBoleta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BOLETA'
      '   (IDBOLETA, DATABOLETA, STATUS, IDFORCLI)'
      'VALUES'
      '   (:IDBOLETA, :DATABOLETA, :STATUS, :IDFORCLI)')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 321
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATABOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
  end
  object qryCorretoraXLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT IDCORRETVALORES,IDCUSTODIANTE'
      'FROM'
      '   ORDMOVINV'
      'WHERE'
      '   (IDTIPOINVEST = 2) AND'
      '   (IDLOTE = :IDLOTE)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 185
    Top = 69
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
    object qryCorretoraXLoteIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.ORDMOVINV.IDCORRETVALORES'
    end
    object qryCorretoraXLoteIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.ORDMOVINV.IDCUSTODIANTE'
    end
  end
  object qryBuscaBaixaOpc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV,H.IDOPERACAOINVEST,H.PLNCODIGO,H.IDLOTE,'
      '   O.NUMDOCUMENTO'
      'FROM'
      '   HISTCARTINV H, OPERACAOINVEST O'
      'WHERE'
      '   (H.DATAMOVCARTINV = TO_DATE(:DDATAREF,'#39'DD/MM/YYYY'#39')) AND'
      '   (H.IDTIPOOPERACAO = -69) AND'
      '   (H.IDOPERACAOINVEST = O.IDOPERACAOINVEST)'
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 61
    Top = 21
    ParamData = <
      item
        DataType = ftString
        Name = 'DDATAREF'
        ParamType = ptUnknown
      end>
    object qryBuscaBaixaOpcIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaBaixaOpcIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBaixaOpcPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaBaixaOpcIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBaixaOpcNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 185
    Top = 21
  end
  object qryBuscaLoteInvestBase: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SALDOQTDEINVCART'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDLOTE = :IDLOTE) AND'
      '   (IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO)'
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 61
    Top = 119
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryBuscaLoteInvestBaseSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'BASEDADOS.HISTCARTINV.SALDOQTDEINVCART'
    end
  end
end
