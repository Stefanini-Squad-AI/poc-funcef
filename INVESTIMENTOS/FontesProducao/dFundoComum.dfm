object DmFundoComum: TDmFundoComum
  OldCreateOrder = False
  Left = 378
  Top = 17
  Height = 673
  Width = 895
  object QryMontaMascaraDecQtd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT QTDDECQTD, QTDDECVALOR'
      'FROM'
      '       FUNDOINVEST'
      'WHERE'
      '       IDFUNDOINVEST =:IDFUNDOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object QryMontaMascaraDecQtdQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
    end
    object QryMontaMascaraDecQtdQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
    end
  end
  object QrySaldoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      '   SUM(H1.VLRAPLICADO)        AS VLRAPLICADO,'
      '   SUM(NVL(H1.VLRIRPROV,0))   AS VLRIRPROV,'
      '   SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV,'
      '   SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO,'
      '   SUM(H1.COTASMOVFUNDO)      AS COTASMOVFUNDO,'
      '   SUM(H1.VLRMOVFUNDO)        AS VLRMOVFUNDO,'
      '   SUM(H1.SALDOQTDCOTAS)      AS SALDOQTDCOTAS,'
      '   SUM(H1.SALDOVLRFUNDO)      AS SALDOVLRFUNDO,'
      '   SUM(H1.VLRCUSTOATUAL)      AS VLRCUSTOATUAL,'
      
        '   SUM((H1.SALDOVLRFUNDO-(NVL(H1.VLRIOFPROV,0)+NVL(H1.VLRIRPROV,' +
        '0)))) AS  SALDOLIQUIDO,'
      '   DESCFUNDOINVEST'
      'FROM'
      '   HISTFUNDO H1, FUNDOINVEST FI'
      'WHERE'
      
        '     (H1.IDHISTFUNDO IN (SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ MAX' +
        '(H.IDHISTFUNDO) AS IDHISTFUNDO'
      '                         FROM HISTFUNDO H,'
      
        '                              (SELECT IDTIPOINVEST, IDTIPOOPERAC' +
        'AO'
      '                               FROM TIPOOPERACAO'
      
        '                               WHERE (IDTIPOINVEST = :IDTIPOINVE' +
        'ST) AND (NATUREZAOPERACAO <> '#39'R'#39')) TP'
      '                         WHERE'
      
        '                                (H.IDTIPOINVEST      = :IDTIPOIN' +
        'VEST)'
      
        '                           AND  (H.IDPLANPREVCTBPATR = :IDPLANPR' +
        'EVCTBPATR)'
      
        '                           AND  (H.IDFUNDOINVEST     = :IDFUNDOI' +
        'NVEST)'
      
        '                           AND (((:TIPOMAIOR IS NOT NULL) AND (H' +
        '.DATAAPLICACAO >= TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '                                ((:TIPOMENOR IS NOT NULL) AND (H' +
        '.DATAAPLICACAO <  TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '                                ((:TIPOMAIOR IS NULL)     AND (:' +
        'TIPOMENOR IS NULL) ))'
      
        '                           AND  (H.DATAMOVFUNDO      = TO_DATE(:' +
        'DATAMOVFUNDO,'#39'DD/MM/YYYY'#39'))'
      
        '                           AND ((H.DATAMOVFUNDO      < TO_DATE(:' +
        'DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')) OR H.IDHISTFUNDO < 999999999)'
      
        '                           AND  ((:IDTIPOCOTA IS NULL)        OR' +
        ' (H.IDTIPOCOTA        = :IDTIPOCOTA))'
      
        '                           AND  ((:IDCOMPOSICAOFUNDO IS NULL) OR' +
        ' (H.IDCOMPOSICAOFUNDO = :IDCOMPOSICAOFUNDO))'
      '                           AND  (H.TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '                           AND (TP.IDTIPOINVEST      = H.IDTIPOI' +
        'NVEST)'
      
        '                           AND (TP.IDTIPOOPERACAO    = H.IDTIPOO' +
        'PERACAO)'
      
        '                         GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCT' +
        'BPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO))'
      ' AND (H1.SALDOQTDCOTAS > 0)'
      ' AND (H1.IDFUNDOINVEST = FI.IDFUNDOINVEST)'
      'GROUP BY FI.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 130
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryVlrCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRCOTA'
      'FROM   COTAFUNDO'
      'WHERE'
      '       IDFUNDOINVEST =:IDFUNDOINVEST     AND'
      '       DATACOTA      = (SELECT MAX(DATACOTA)'
      '                        FROM   COTAFUNDO'
      '                        WHERE'
      
        '                               IDFUNDOINVEST  =:IDFUNDOINVEST   ' +
        ' AND'
      
        '                               DATACOTA       =:DATACOTA        ' +
        ' AND'
      
        '                           (((:IDTIPOCOTA IS NOT NULL)          ' +
        ' AND'
      
        '                              (IDTIPOCOTA        = :IDTIPOCOTA))' +
        ' OR'
      
        '                             (:IDTIPOCOTA IS NULL)))            ' +
        ' AND'
      '   (((:IDTIPOCOTA IS NOT NULL)           AND'
      '      (IDTIPOCOTA    =:IDTIPOCOTA))      OR'
      '     (:IDTIPOCOTA IS NULL))                   '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryVlrCotaVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.COTAFUNDO.VLRCOTA'
    end
  end
  object QryInsertHistFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTFUNDO ('
      
        '  IDHISTFUNDO,       CODDOCUMENTO,     PLNCODIGO,        PLANO, ' +
        '            IDTIPOINVEST,'
      
        '  DATAULTPGTOIR,     IDTIPOOPERACAO,   IDCARTEIRAINVEST, IDFUNDO' +
        'INVEST,     DATAAPLICACAO,'
      
        '  DATAMOVFUNDO,      COTAAPLICACAO,    HISTMOVFUNDO,     NATURMO' +
        'VFUNDO,     TIPMOVFUNDO,'
      
        '  VLRAPLICADO,       VLRIRPROV,        VLRIOFPROV,       VLRVARI' +
        'ACAO,       COTASMOVFUNDO,'
      
        '  VLRMOVFUNDO,       FLGCALCSALDO,     SALDOQTDCOTAS,    SALDOVL' +
        'RFUNDO,     IDOPERACAOFUNDO,'
      
        '  IDPLANPREVCTBPATR, IDOPERACAOINVEST, VLRCUSTOATUAL,    IDCOMPO' +
        'SICAOFUNDO, IDTIPOCOTA,'
      '  SALDOQTDCOTASBLQ)'
      'VALUES'
      
        '(:IDHISTFUNDO,       :CODDOCUMENTO,     :PLNCODIGO,        :PLAN' +
        'O,             :IDTIPOINVEST,'
      
        ' :DATAULTPGTOIR,     :IDTIPOOPERACAO,   :IDCARTEIRAINVEST, :IDFU' +
        'NDOINVEST,     :DATAAPLICACAO,'
      
        ' :DATAMOVFUNDO,      :COTAAPLICACAO,    :HISTMOVFUNDO,     :NATU' +
        'RMOVFUNDO,     :TIPMOVFUNDO,'
      
        ' :VLRAPLICADO,       :VLRIRPROV,        :VLRIOFPROV,       :VLRV' +
        'ARIACAO,       :COTASMOVFUNDO,'
      
        ' :VLRMOVFUNDO,       :FLGCALCSALDO,     :SALDOQTDCOTAS,    :SALD' +
        'OVLRFUNDO,     :IDOPERACAOFUNDO,'
      
        ' :IDPLANPREVCTBPATR, :IDOPERACAOINVEST, :VLRCUSTOATUAL,    :IDCO' +
        'MPOSICAOFUNDO, :IDTIPOCOTA,'
      ' :SALDOQTDCOTASBLQ)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTPGTOIR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COTAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATURMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRAPLICADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRIRPROV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFPROV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRVARIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COTASMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCALCSALDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDOQTDCOTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDOVLRFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCUSTOATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDOQTDCOTASBLQ'
        ParamType = ptInput
      end>
  end
  object QryResgateFACFIF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (HISTFUNDO.XPKHISTFUNDO)*/'
      'HISTFUNDO.IDTIPOINVEST,'
      'HISTFUNDO.IDFUNDOINVEST,'
      'HISTFUNDO.IDOPERACAOFUNDO,'
      'HISTFUNDO.DATAAPLICACAO,'
      'HISTFUNDO.SALDOQTDCOTAS,'
      'HISTFUNDO.SALDOQTDCOTASBLQ,'
      'HISTFUNDO.DATAULTPGTOIR,'
      'HISTFUNDO.COTAAPLICACAO,'
      'FUNDOINVEST.QTDDECQTD,'
      'FUNDOINVEST.STAPROVISIONAIR,'
      'FUNDOINVEST.STAPROVISIONAIOF'
      'FROM'
      '     HISTFUNDO,'
      ''
      
        '    (SELECT /*+INDEX (HISTFUNDO.XIE1HISTFUNDO)*/ MAX(IDHISTFUNDO' +
        ') AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                      (IDTIPOINVEST      = :IDTIPOINVEST)       ' +
        '                  AND'
      ''
      
        '                      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)  ' +
        '                  AND'
      ''
      
        '                      (IDFUNDOINVEST     = :IDFUNDOINVEST)      ' +
        '                  AND'
      ''
      
        '       ( ((:TIPOMAIOR IS NOT NULL) AND (DATAAPLICACAO >= TO_DATE' +
        '(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '         ((:TIPOMENOR IS NOT NULL) AND (DATAAPLICACAO <  TO_DATE' +
        '(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '         ((:TIPOIGUAL IS NOT NULL) AND (DATAAPLICACAO =  TO_DATE' +
        '(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '        (((:TIPOMAIOR IS NULL)     AND (:TIPOMENOR IS NULL) AND ' +
        '(:TIPOIGUAL IS NULL)) AND'
      
        '           (DATAAPLICACAO    <= TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYY' +
        'Y'#39'))) )  AND'
      ''
      
        '           (DATAMOVFUNDO     <= TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YY' +
        'YY'#39'))  AND'
      ''
      
        '                   (((:IDTIPOCOTA IS NOT NULL)                  ' +
        '                  AND'
      
        '                      (IDTIPOCOTA = :IDTIPOCOTA))               ' +
        '                  OR'
      
        '                     (:IDTIPOCOTA IS NULL))                     ' +
        '                  AND'
      ''
      
        '                    (((:IDCOMPOSICAOFUNDO IS NOT NULL)          ' +
        '                  AND'
      
        '                      (IDCOMPOSICAOFUNDO = :IDCOMPOSICAOFUNDO)) ' +
        '                  OR'
      
        '                      (:IDCOMPOSICAOFUNDO IS NULL))             ' +
        '                  AND'
      ''
      '                      (TIPMOVFUNDO <> '#39'PIR'#39')'
      ''
      
        '     GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST, DA' +
        'TAAPLICACAO, IDTIPOCOTA) HMAX,'
      ''
      
        '    (SELECT IDFUNDOINVEST, IDTIPOFUNDOINVEST, IDCARTEIRAINVEST, ' +
        'QTDDECQTD, STAPROVISIONAIR, STAPROVISIONAIOF'
      '     FROM   HISTFUNDOINVEST'
      
        '     WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39') IN'
      
        '             (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39 +
        'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST'
      
        '              WHERE (((:DATAMOVFUNDO IS NOT NULL) AND (TRUNC(DTA' +
        'VIGENCIA) < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')+1)) OR'
      '                      (:DATAMOVFUNDO IS NULL))'
      '              GROUP BY IDFUNDOINVEST))) FUNDOINVEST,'
      '     TIPOFUNDOINVEST, CARTEIRAINVEST, TIPOCOTA'
      ''
      'WHERE'
      
        '(HISTFUNDO.IDHISTFUNDO              = HMAX.IDHISTFUNDO)        A' +
        'ND'
      
        '(HISTFUNDO.SALDOQTDCOTAS            > 0)                       A' +
        'ND'
      
        '(FUNDOINVEST.IDFUNDOINVEST          = HISTFUNDO.IDFUNDOINVEST) A' +
        'ND'
      
        '(FUNDOINVEST.IDTIPOFUNDOINVEST      = TIPOFUNDOINVEST.IDTIPOFUND' +
        'OINVEST) AND'
      
        '(CARTEIRAINVEST.IDCARTEIRAINVEST(+) = FUNDOINVEST.IDCARTEIRAINVE' +
        'ST) AND'
      '(TIPOCOTA.IDTIPOCOTA(+) '#9'    = HISTFUNDO.IDTIPOCOTA)'
      
        'ORDER BY HISTFUNDO.IDFUNDOINVEST, HISTFUNDO.IDTIPOCOTA, HISTFUND' +
        'O.DATAAPLICACAO,'
      '         HISTFUNDO.DATAMOVFUNDO, HISTFUNDO.IDHISTFUNDO  DESC ')
    ValidateWithMask = True
    Left = 130
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOIGUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOIGUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select * from dual')
    ValidateWithMask = True
    Left = 48
    Top = 226
  end
  object QryInsertOperacaoFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO,     IDTIPOI' +
        'NVEST,'
      
        '   IDTIPOOPERACAO,  IDFUNDOINVEST,    IDCOMPOSICAOFUNDO, DATACOT' +
        'IZACAO,'
      
        '   DATAOPERACAO,    DATALIQUIDACAO,   QTDOPERACAO,       VLROPER' +
        'ACAO,'
      
        '   VLRCOTA,         VLRIR,            VLRIOF,            VLRREND' +
        'IMENTO,'
      
        '   STACONFIRMA,     IDOPERACAOORIGEM, IDPLANPREVCTBPATR, IDTIPOC' +
        'OTA,'
      '   IDLOTE,          DATAVENCIMENTO)'
      'values'
      
        '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO,     :IDT' +
        'IPOINVEST,'
      
        '   :IDTIPOOPERACAO,  :IDFUNDOINVEST,    :IDCOMPOSICAOFUNDO, :DAT' +
        'ACOTIZACAO,'
      
        '   :DATAOPERACAO,    :DATALIQUIDACAO,   :QTDOPERACAO,       :VLR' +
        'OPERACAO,'
      
        '   :VLRCOTA,         :VLRIR,            :VLRIOF,            :VLR' +
        'RENDIMENTO,'
      
        '   :STACONFIRMA,     :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR, :IDT' +
        'IPOCOTA,'
      '   :IDLOTE,          :DATAVENCIMENTO)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPOSICAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATALIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRIOF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRRENDIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STACONFIRMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCIMENTO'
        ParamType = ptInput
      end>
  end
  object QryBuscaAplOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      '       H1.IDHISTFUNDO, H1.IDFUNDOINVEST, H1.DATAMOVFUNDO,'
      '       H1.SALDOQTDCOTAS, H1.SALDOQTDCOTASBLQ, H1.SALDOVLRFUNDO,'
      
        '       H1.VLRIRPROV, H1.VLRIOFPROV, H1.VLRAPLICADO, H1.VLRCUSTOA' +
        'TUAL, H1.VLRVARIACAO,'
      '       H1.DATAAPLICACAO, H1.DATAULTPGTOIR,'
      '       H1.COTAAPLICACAO,'
      '       H1.IDOPERACAOFUNDO'
      'FROM'
      '   HISTFUNDO H1'
      'WHERE'
      '   (H1.IDHISTFUNDO IN'
      
        '          (SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ MAX(H.IDHISTFUNDO' +
        ') AS IDHISTFUNDO'
      '           FROM'
      '              HISTFUNDO H'
      '           WHERE'
      '              (H.IDTIPOINVEST      = :IDTIPOINVEST)      AND'
      '              (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '              (H.IDFUNDOINVEST     = :IDFUNDOINVEST)     AND'
      
        '              ((:DATAAPLICACAO IS NULL) OR (H.DATAAPLICACAO = TO' +
        '_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39'))) AND'
      
        '              (H.DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD/M' +
        'M/YYYY'#39'))  AND'
      
        '             ((H.DATAMOVFUNDO      < TO_DATE(:DATAMOVFUNDO,'#39'DD/M' +
        'M/YYYY'#39')) OR H.IDHISTFUNDO < 999999999) AND'
      
        '              ((:IDTIPOCOTA IS NULL) OR (H.IDTIPOCOTA = :IDTIPOC' +
        'OTA))      AND'
      
        '              ((:IDOPERACAOFUNDO IS NULL) OR (H.IDOPERACAOFUNDO ' +
        '= :IDOPERACAOFUNDO))'
      
        '          GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUND' +
        'OINVEST, H.DATAAPLICACAO, IDTIPOCOTA)) AND'
      '   (H1.SALDOQTDCOTAS > 0)'
      
        'ORDER BY H1.IDFUNDOINVEST, H1.DATAAPLICACAO, H1.DATAMOVFUNDO, H1' +
        '.IDHISTFUNDO  DESC')
    ValidateWithMask = True
    Left = 204
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryVerificaTipoOper: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      
        '   TIPOOPERACAO.FLGTRATAIR, TIPOOPERACAO.FLGGERACONTAB, TIPOOPER' +
        'ACAO.FLGGERACAPCAR,'
      
        '   TIPOOPERACAO.CODTIPDOC, TIPOOPERACAO.DESCTIPOOPERACAO, TIPOOP' +
        'ERACAO.RECPAG,'
      '   TIPOOPERACAO.FLGCONTAINVEST'
      'FROM'
      '    TIPOOPERACAO'
      'WHERE'
      '    TIPOOPERACAO.IDTIPOINVEST    =:IDTIPOINVEST    AND'
      '    TIPOOPERACAO.IDTIPOOPERACAO  =:IDTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryUpdHistFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE HISTFUNDO SET'
      '       PLANO             =:PLANO,'
      '       PLNCODIGO         =:PLNCODIGO,'
      '       CODDOCUMENTO      =:CODDOCUMENTO'
      'WHERE'
      '       IDTIPOINVEST      =:IDTIPOINVEST       AND'
      '       IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR  AND'
      '       IDFUNDOINVEST     =:IDFUNDOINVEST      AND'
      '       DATAMOVFUNDO      =:DATAMOVFUNDO       AND'
      '       IDTIPOOPERACAO    =:IDTIPOOPERACAO     AND'
      '   (((:IDTIPOCOTA IS NOT NULL)                AND'
      '      (IDTIPOCOTA        =:IDTIPOCOTA))       OR'
      '     (:IDTIPOCOTA IS NULL))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryUpdIrLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      IRLITIGIO'
      'SET '
      '      PLANO = :PLANO,'
      '      PLNCODIGO = :PLNCODIGO'
      'WHERE'
      '      IDOPERACAOFUNDO =:IDOPERACAOFUNDO)')
    ValidateWithMask = True
    Left = 390
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryVariacaoFundos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(HF1.VLRVARIACAO) AS VLRVARIACAO, FI.DESCFUNDOINVEST, ' +
        'FI.DESCTIPOFUNDOINV, FI.IDTIPOINVEST,'
      
        '       FI.IDCARTEIRAINVEST, PL.IDPLANOPREV, PL.IDPATRO, PL.PLANP' +
        'RVCONTABPATRO, FI.IDFUNDOINVEST, '
      '       FI.IDTIPOFUNDOINVEST, FI.IDFUNDOINVEST'
      'FROM'
      '       HISTFUNDO HF1, VWPLANPREVCTBPATR PL, '
      ''
      
        '      (SELECT HF4.IDFUNDOINVEST, HF4.DESCFUNDOINVEST, TF2.DESCTI' +
        'POFUNDOINV, TF2.IDTIPOINVEST, TF2.IDTIPOFUNDOINVEST,'
      '              HF4.IDCARTEIRAINVEST'
      '       FROM HISTFUNDOINVEST HF4, TIPOFUNDOINVEST TF2'
      
        '       WHERE (HF4.IDTIPOFUNDOINVEST || HF4.IDFUNDOINVEST || TO_C' +
        'HAR(HF4.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF3.IDTIPOFUNDOINVEST || HF3.IDFUNDOINVEST ' +
        '|| TO_CHAR(MAX(HF3.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF3, TIPOFUNDOINVEST TF1'
      '              WHERE'
      '                  (TF1.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '              AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (HF3.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '              AND (TRUNC(HF3.DTAVIGENCIA) < TO_DATE(:DATAMOVFUND' +
        'O,'#39'DD/MM/YYYY'#39')+1)'
      
        '              AND (HF3.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST' +
        ')'
      
        '              GROUP BY HF3.IDTIPOFUNDOINVEST, HF3.IDFUNDOINVEST)' +
        ')'
      
        '       AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (HF4.IDTIPOFUNDOI' +
        'NVEST = :IDTIPOFUNDOINVEST))'
      
        '       AND  (HF4.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDOINVEST)  ) F' +
        'I'
      ''
      'WHERE'
      
        '      (HF1.IDHISTFUNDO  IN (SELECT MAX(HF2.IDHISTFUNDO) AS IDHIS' +
        'TFUNDO'
      '                           FROM   HISTFUNDO HF2'
      '                           WHERE'
      
        '                                 (HF2.IDTIPOINVEST      = :IDTIP' +
        'OINVEST) AND'
      
        '                                 (HF2.IDPLANPREVCTBPATR > 0)    ' +
        '         AND'
      
        '                                 (HF2.IDFUNDOINVEST     > 0)    ' +
        '         AND'
      
        '                                 (HF2.DATAAPLICACAO    <= TO_DAT' +
        'E(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                 (HF2.DATAMOVFUNDO      = TO_DAT' +
        'E(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')) AND'
      '                                 (HF2.TIPMOVFUNDO       = '#39'ATU'#39')'
      
        '                           GROUP BY HF2.IDTIPOINVEST, HF2.IDPLAN' +
        'PREVCTBPATR, HF2.IDFUNDOINVEST, HF2.DATAAPLICACAO,'
      
        '                                    HF2.DATAMOVFUNDO, HF2.IDTIPO' +
        'COTA)) AND'
      '       HF1.IDFUNDOINVEST    = FI.IDFUNDOINVEST       AND'
      '       PL.IDPLANPREVCTBPATR = HF1.IDPLANPREVCTBPATR  '
      
        'GROUP BY PL.IDPLANOPREV, PL.IDPATRO, FI.IDFUNDOINVEST, FI.DESCFU' +
        'NDOINVEST, FI.DESCTIPOFUNDOINV, FI.IDTIPOINVEST, FI.IDCARTEIRAIN' +
        'VEST,'
      
        '         PL.PLANPRVCONTABPATRO, FI.IDTIPOFUNDOINVEST, FI.IDFUNDO' +
        'INVEST'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryProvIOF: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT SUM(HF.VLRIOFPROV) AS VLRIOFPROV'
      ''
      'FROM  HISTFUNDO HF, FUNDOINVEST FI'
      ''
      'WHERE'
      '(HF.IDHISTFUNDO  IN ('
      '                 SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                 FROM HISTFUNDO'
      '                 WHERE'
      
        '                     (IDTIPOINVEST      = :IDTIPOINVEST)        ' +
        '      AND'
      
        '                     (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)   ' +
        '      AND'
      
        '                     (IDFUNDOINVEST     > 0)                    ' +
        '      AND'
      
        '                     (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,' +
        ' '#39'DD/MM/YYYY'#39')) AND'
      
        '                    ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFUNDO,' +
        ' '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999) AND'
      '                     (TIPMOVFUNDO       <> '#39'PIR'#39')'
      
        '                GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUND' +
        'OINVEST, DATAAPLICACAO, DATAMOVFUNDO)) AND'
      '(HF.SALDOQTDCOTAS > 0)                      AND'
      ' FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST  AND'
      ' FI.IDFUNDOINVEST     = HF.IDFUNDOINVEST')
    ValidateWithMask = True
    Left = 130
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryTipoFundos: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAUL' +
        'TFECH'
      'FROM   TIPOFUNDOINVEST'
      'WHERE  IDTIPOINVEST      =:IDTIPOINVEST'
      'AND    IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST')
    ValidateWithMask = True
    Left = 130
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryProvIRRF: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT SUM(HF.VLRIRPROV) AS VLRIRPROV, FI.IDCARTEIRAINVEST, PL.I' +
        'DPLANOPREV,'
      
        '       PL.IDPATRO, PL.IDPLANPREVCTBPATR, (PC.NOME ||'#39' - '#39'|| PE.N' +
        'OME) AS PLANPRVCONTABPATRO,'
      '       FI.IDFUNDOINVEST'
      ''
      
        'FROM  HISTFUNDO HF, PESSOA PE, FUNDOINVEST FI, PLANPREVCONTABPAT' +
        'RO PL, PLANPREVCONTABIL PC'
      ''
      'WHERE'
      '     HF.DATAMOVFUNDO      = :DATAMOVFUNDO        AND'
      '     HF.TIPMOVFUNDO       = '#39'ATU'#39'                AND'
      '     FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST   AND'
      '     FI.IDFUNDOINVEST     = HF.IDFUNDOINVEST     AND'
      '     PL.IDPLANPREVCTBPATR = HF.IDPLANPREVCTBPATR AND'
      '     PL.IDPATRO           = PE.IDPESSOA          AND'
      '     PL.IDPLANOPREV       = PC.IDPLANOPREV'
      
        'GROUP BY PL.IDPLANOPREV, PL.IDPATRO, PL.IDPLANPREVCTBPATR,FI.IDF' +
        'UNDOINVEST,FI.IDCARTEIRAINVEST,'
      '        (PC.NOME ||'#39' - '#39'|| PE.NOME)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 50
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryUpdHistFundoAtu: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE HISTFUNDO SET'
      '       PLANO        =:PLANO,'
      '       PLNCODIGO    =:PLNCODIGO,'
      '       CODDOCUMENTO =:CODDOCUMENTO'
      'WHERE'
      '       IDTIPOINVEST       > 0            AND'
      '       IDPLANPREVCTBPATR  > 0            AND'
      '       IDFUNDOINVEST IN (SELECT'
      '    HF1.IDFUNDOINVEST'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDFUNDOINVEST))) AND'
      
        '       DATAMOVFUNDO    =TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')     ' +
        'AND'
      '       TIPMOVFUNDO     = '#39'ATU'#39)
    ValidateWithMask = True
    Left = 390
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryPgtoIrLitigio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRIRLITIGIO) AS VLRIRPROV'
      'FROM'
      '   IRLITIGIO'
      'WHERE'
      '   DATAFATOGERADOR  = :DATAMOVFUNDO AND'
      '   IDOPERACAOFUNDO IN'
      '      (SELECT'
      '          IDOPERACAOFUNDO'
      '       FROM'
      '           HISTFUNDO HF, FUNDOINVEST FI'
      '       WHERE'
      '           HF.DATAMOVFUNDO      =:DATAMOVFUNDO      AND'
      '           FI.IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST AND'
      '           HF.TIPMOVFUNDO       = '#39'ATU'#39'             AND'
      '           FI.IDFUNDOINVEST     = HF.IDFUNDOINVEST)'
      ''
      '           '
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 314
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryPlanoPrevContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV,'
      '   IDPATRO'
      'FROM'
      '   PLANPREVCONTABPATRO'
      'WHERE'
      '   (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end>
  end
  object QryBuscaIofAnterior: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT VLRIOF'
      'FROM'
      '  OPERACAOFUNDO'
      'WHERE'
      '  IDFUNDOINVEST    = :IDFUNDOINVEST AND'
      '  DATAOPERACAO     = :DATAOPERACAO  AND'
      '  IDTIPOOPERACAO   = -47            AND'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end>
  end
  object QryTotalIRLitigioMes: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT SUM(NVL(VLRIR,0)) AS VLRIR'
      'FROM'
      '  OPERACAOFUNDO'
      'WHERE'
      '  IDFUNDOINVEST    IN (SELECT IDFUNDOINVEST'
      
        '                       FROM FUNDOINVEST WHERE IDTIPOFUNDOINVEST ' +
        '= :IDTIPOFUNDOINVEST) AND'
      '  DATAOPERACAO     = :DATAOPERACAO      AND'
      '  IDTIPOOPERACAO   = -46 '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryTotalIOFLitigioMes: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT SUM(VLRIOF) AS VLRIOF'
      'FROM'
      '  OPERACAOFUNDO'
      'WHERE'
      '  IDFUNDOINVEST    IN (SELECT IDFUNDOINVEST'
      
        '                       FROM FUNDOINVEST WHERE IDTIPOFUNDOINVEST ' +
        '= :IDTIPOFUNDOINVEST) AND'
      '  DATAOPERACAO     = :DATAOPERACAO  AND'
      '  IDTIPOOPERACAO   = -46              '
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryCotizaAplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OP.*, TP.*, FI.*, VWP.*'
      'FROM  OPERACAOFUNDO OP, TIPOOPERACAO TP,'
      ''
      '      (SELECT'
      '        HF1.*'
      '      FROM HISTFUNDOINVEST HF1'
      
        '      WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM' +
        '/YYYY, HH24:MI:SS'#39') IN'
      
        '            (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST HF'
      '             WHERE'
      '                 (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '             AND (HF.DTAVIGENCIA   < TO_DATE(:DATACOTIZACAO,'#39'DD/' +
        'MM/YYYY'#39')+1)'
      '             GROUP BY HF.IDFUNDOINVEST))'
      '       ) FI,'
      '       '
      '       VWPLANPREVCTBPATR VWP'
      'WHERE'
      '  OP.IDTIPOINVEST     > 0                         AND'
      ''
      '(((:IDPLANPREVCTBPATR IS NOT NULL)                AND'
      ' (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))     OR'
      '  (:IDPLANPREVCTBPATR IS NULL) )                  AND'
      ''
      '(((:IDFUNDOINVEST IS NOT NULL)                    AND'
      ' (OP.IDFUNDOINVEST     = :IDFUNDOINVEST))         OR'
      '  (:IDFUNDOINVEST IS NULL) )                      AND'
      ''
      
        '   OP.DATACOTIZACAO     = TO_DATE(:DATACOTIZACAO,'#39'DD/MM/YYYY'#39')  ' +
        'AND'
      '   OP.DATACOTIZACAO    <> OP.DATAOPERACAO         AND'
      '--//   OP.QTDOPERACAO       = 0                       AND'
      ''
      '   TP.IDTIPOINVEST      = OP.IDTIPOINVEST         AND'
      ' ((TP.IDTIPOOPERACAO    > 0) OR (TP.IDTIPOOPERACAO = -34)) AND'
      '   TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO       AND'
      ''
      '   FI.IDFUNDOINVEST     = OP.IDFUNDOINVEST        AND'
      ''
      '  VWP.IDPLANPREVCTBPATR =  OP.IDPLANPREVCTBPATR'
      'ORDER BY OP.IDOPERACAOFUNDO  ')
    ValidateWithMask = True
    Left = 204
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end>
  end
  object QryUpdOperFundoQtCot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE OPERACAOFUNDO SET QTDOPERACAO = :QTDOPERACAO , VLRCOTA = ' +
        ':VLRCOTA'
      'WHERE  IDOPERACAOFUNDO = :IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 390
    Top = 314
    ParamData = <
      item
        DataType = ftFloat
        Name = 'QTDOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryUpdHistFundoQtCot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE HISTFUNDO SET SALDOQTDCOTAS = :QTDOPERACAO , COTASMOVFUND' +
        'O = :VLRCOTA'
      'WHERE  IDHISTFUNDO = :IDHISTFUNDO'
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 94
    ParamData = <
      item
        DataType = ftFloat
        Name = 'QTDOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTFUNDO'
        ParamType = ptInput
      end>
  end
  object QryCotizaResgate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.*, FI.*, PL.*'
      'FROM PEDIDOFUNDO PF,'
      '  (SELECT'
      '    HF1.*'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATACOTIZACAO,'#39'DD/MM/Y' +
        'YYY'#39')+1)'
      '         GROUP BY HF.IDFUNDOINVEST))'
      '   ) FI,'
      '   VWPLANPREVCTBPATR PL'
      'WHERE'
      '(PF.IDTIPOINVEST        > 0)                    AND'
      '(((:IDPLANPREVCTBPATR IS NOT NULL)              AND'
      '  (PF.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)) OR'
      '  (:IDPLANPREVCTBPATR IS NULL) )                AND'
      '(((:IDFUNDOINVEST IS NOT NULL)                  AND'
      '  (PF.IDFUNDOINVEST      = :IDFUNDOINVEST))     OR'
      '  (:IDFUNDOINVEST IS NULL) )                    AND'
      
        '    PF.DATAPEDIDO        = TO_DATE(:DATACOTIZACAO,'#39'DD/MM/YYYY'#39') ' +
        ' AND'
      '    PF.DATACOTIZACAO    <> PF.DATAPEDIDO        AND'
      ' FI.IDFUNDOINVEST     = PF.IDFUNDOINVEST        AND'
      ' PL.IDPLANPREVCTBPATR = PF.IDPLANPREVCTBPATR'
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end>
  end
  object QryBuscaTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      'FROM TIPOOPERACAO'
      'WHERE'
      '     IDTIPOINVEST   = :IDTIPOINVEST   AND'
      '     IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
    object QryBuscaTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"TIPOOPERACAO".IDTIPOINVEST'
    end
    object QryBuscaTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"TIPOOPERACAO".IDTIPOOPERACAO'
    end
    object QryBuscaTipoOperIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = '"TIPOOPERACAO".IDMERCADO'
    end
    object QryBuscaTipoOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = '"TIPOOPERACAO".DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = '"TIPOOPERACAO".NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaTipoOperTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = '"TIPOOPERACAO".TIPOCUSTODIA'
      Size = 1
    end
    object QryBuscaTipoOperVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = '"TIPOOPERACAO".VENCIMENTO'
    end
    object QryBuscaTipoOperTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = '"TIPOOPERACAO".TIPCREDOR'
      Size = 2
    end
    object QryBuscaTipoOperFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = '"TIPOOPERACAO".FLGTRANSF'
      Size = 1
    end
    object QryBuscaTipoOperFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaTipoOperFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object QryBuscaTipoOperFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Size = 1
    end
  end
  object QryConfirmacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     , OPE.IDTIPOINVEST      ,'
      
        '  OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINVEST     , OPE.DATAOPERAC' +
        'AO      , OPE.DATALIQUIDACAO    ,'
      
        '  OPE.QTDOPERACAO       , (OPE.VLROPERACAO + (NVL(OPE.VLRIOF,0)+' +
        'NVL(OPE.VLRIR,0)) ) AS VLROPERACAO            ,'
      
        '  OPE.VLRCOTA           , OPE.VLRIR             , OPE.DATACOTIZA' +
        'CAO     ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      
        '  OPE.VLROPERACAO AS VLRLIQUIDO                 , OPE.IDOPERACAO' +
        'ORIGEM  ,'
      
        '  OPE.IDCOMPOSICAOFUNDO , OPE.IDPLANPREVCTBPATR , OPE.IDTIPOCOTA' +
        '        ,'
      ''
      
        '/*  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D999999999999'#39')AS ' +
        'QTDMOSTRA , */'
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      ''
      '  TCO.DESCTIPOCOTA      ,'
      ''
      '  TPO.DESCTIPOOPERACAO  , CAR.IDPATROCINADORA   ,'
      
        '  DECODE(IDPEDIDOFUNDO  , NULL,IDOPERACAOFUNDO  , IDPEDIDOFUNDO)' +
        ' AS IDBOLETA ,'
      '  TPO.NATUREZAOPERACAO  , TPO.RECPAG,'
      ''
      '  PLANO.PLANPRVCONTABPATRO, PLANO.IDPLANOPREV'
      ''
      'FROM'
      '  OPERACAOFUNDO OPE,'
      '  (SELECT'
      
        '    HF1.IDFUNDOINVEST     , HF1.DESCFUNDOINVEST   , HF1.IDGESTOR' +
        'CARTEIRA  ,'
      
        '    HF1.TRGDTINCLUSAO     , HF1.TRGUSERINCLUSAO   , HF1.MOECODIG' +
        'O         ,'
      
        '    HF1.IDCARTEIRAINVEST  , HF1.IDTIPOFUNDOINVEST , HF1.CNPJFUND' +
        'O         ,'
      
        '    HF1.STAEXCLUSIVO      , HF1.PZOCARENCIA       , HF1.PZOANIVE' +
        'RSARIO    ,'
      
        '    HF1.PZOLIQAPLIC       , HF1.PZOLIQRESG        , HF1.QTDDECQT' +
        'D         ,'
      
        '    HF1.QTDDECVALOR       , HF1.STAFUNDO          , HF1.PZOAMORT' +
        'IZACAO    ,'
      
        '    HF1.PERCTXPERFORM     , HF1.PERCTXADM         , HF1.CODFUNCE' +
        'TIP       ,'
      
        '    HF1.STAPROVISIONAIR   , HF1.STAPROVISIONAIOF  , HF1.CONTRCET' +
        'IP        ,'
      '    HF1.PZOCOTAPLIC'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDFUNDOINVEST))'
      '   ) FUN,'
      ''
      '   TIPOOPERACAO TPO, CARTEIRAINVEST CAR, TIPOCOTA TCO,'
      ''
      '  (SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO'
      ''
      'WHERE'
      
        '  (OPE.IDTIPOINVEST      > 0)                                   ' +
        '  AND'
      ''
      
        '  (OPE.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        '  AND'
      ''
      
        '  (OPE.IDFUNDOINVEST     = :IDFUNDOINVEST)                      ' +
        '  AND'
      ''
      
        '  (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )' +
        '  AND'
      ''
      
        '  (OPE.IDTIPOOPERACAO    = :IDTIPOOPERACAO)                     ' +
        '  AND'
      ''
      
        '  (OPE.IDPEDIDOFUNDO     = :IDPEDIDOFUNDO)                      ' +
        '  AND'
      ''
      
        '  (OPE.DATACOTIZACAO     = TO_DATE(:DATACOTIZACAO,'#39'DD/MM/YYYY'#39') ' +
        ') AND'
      ''
      
        '   (((:IDTIPOCOTA IS NOT NULL)                                  ' +
        '  AND'
      
        '  (OPE.IDTIPOCOTA        = :IDTIPOCOTA))                        ' +
        '  OR'
      
        '     (:IDTIPOCOTA IS NULL))                                     ' +
        '  AND'
      ''
      
        ' ((OPE.STACONFIRMA       = '#39'N'#39') OR (OPE.STACONFIRMA IS NULL))   ' +
        '  AND'
      ''
      
        '  (OPE.IDTIPOINVEST      = TPO.IDTIPOINVEST(+))                 ' +
        '  AND'
      
        '  (OPE.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO(+))               ' +
        '  AND'
      
        '  (FUN.IDCARTEIRAINVEST  = CAR.IDCARTEIRAINVEST(+))             ' +
        '  AND'
      
        '  (FUN.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)                   ' +
        '  AND'
      
        '  (OPE.IDTIPOCOTA        = TCO.IDTIPOCOTA(+))                   ' +
        '  AND'
      '  (PLANO.IDPLANPREVCTBPATR = OPE.IDPLANPREVCTBPATR)'
      ''
      
        'ORDER BY OPE.IDOPERACAOFUNDO, FUN.DESCFUNDOINVEST, TPO.DESCTIPOO' +
        'PERACAO'
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 204
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryConfirmacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo '
      DisplayWidth = 25
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryConfirmacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 15
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryConfirmacaoSTACONFIRMA: TStringField
      DisplayLabel = 'Confirma'
      DisplayWidth = 7
      FieldName = 'STACONFIRMA'
      Size = 1
    end
    object QryConfirmacaoIDBOLETA: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 14
      FieldName = 'IDBOLETA'
    end
    object QryConfirmacaoDATALIQUIDACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Liquidação'
      DisplayWidth = 11
      FieldName = 'DATALIQUIDACAO'
    end
    object QryConfirmacaoVLRCOTA: TFloatField
      DisplayLabel = 'Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTA'
    end
    object QryConfirmacaoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 20
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConfirmacaoQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object QryConfirmacaoVLRIR: TFloatField
      DisplayLabel = 'IRRF'
      DisplayWidth = 17
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '############0.00'
    end
    object QryConfirmacaoVLRIOF: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 14
      FieldName = 'VLRIOF'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '############0.00'
    end
    object QryConfirmacaoDATAOPERACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Operação'
      DisplayWidth = 11
      FieldName = 'DATAOPERACAO'
    end
    object QryConfirmacaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 21
      FieldName = 'VLROPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '############0.00'
    end
    object QryConfirmacaoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryConfirmacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryConfirmacaoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryConfirmacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryConfirmacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryConfirmacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryConfirmacaoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Visible = False
    end
    object QryConfirmacaoIDFUNDOINVEST_1: TFloatField
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryConfirmacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryConfirmacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryConfirmacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryConfirmacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryConfirmacaoIDCARTEIRAINVEST_1: TFloatField
      FieldName = 'IDCARTEIRAINVEST_1'
      Visible = False
    end
    object QryConfirmacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryConfirmacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryConfirmacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object QryConfirmacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryConfirmacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryConfirmacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryConfirmacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryConfirmacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryConfirmacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryConfirmacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      Size = 1
    end
    object QryConfirmacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryConfirmacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryConfirmacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryConfirmacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryConfirmacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object QryConfirmacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object QryConfirmacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryConfirmacaoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object QryConfirmacaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryConfirmacaoIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryConfirmacaoDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
    end
    object QryConfirmacaoIDCOMPOSICAOFUNDO: TFloatField
      FieldName = 'IDCOMPOSICAOFUNDO'
    end
    object QryConfirmacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryConfirmacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object QryConfirmacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryConfirmacaoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
    object QryConfirmacaoDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QryConfirmacaoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object QryPlnCodigoHistFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT PLANO, PLNCODIGO'
      'FROM HISTFUNDO HF, FUNDOINVEST FI'
      'WHERE'
      
        '   HF.IDTIPOINVEST      = :IDTIPOINVEST                       AN' +
        'D'
      
        '   HF.IDPLANPREVCTBPATR  > 0                                  AN' +
        'D'
      
        '   HF.IDFUNDOINVEST      > 0                                  AN' +
        'D'
      
        '   HF.DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39') AN' +
        'D'
      
        '   HF.TIPMOVFUNDO       = '#39'ATU'#39'                               AN' +
        'D'
      
        '   FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST                  AN' +
        'D'
      '   FI.IDFUNDOINVEST     = HF.IDFUNDOINVEST'
      'GROUP BY PLANO, PLNCODIGO')
    ValidateWithMask = True
    Left = 328
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryAuxiliar: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select * from dual')
    ValidateWithMask = True
    Left = 48
    Top = 272
  end
  object QryDelIrLitigio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE FROM IRLITIGIO WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 328
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryPatroPlanPrevContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANPREVCTBPATR,'
      '   IDPLANOPREV,'
      '   IDPATRO,'
      '   PLANPRVCONTABPATRO,'
      '   PLANOCONTABIL,'
      '   PATROCINADORA'
      'FROM'
      '   VWPLANPREVCTBPATR')
    ValidateWithMask = True
    Left = 328
    Top = 184
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
    end
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 113
    end
  end
  object QryCotaIntegrFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI.DESCFUNDOINVEST, CT.VLRCOTA, MO.MOESIGLA, FI.IDREGRA,'
      '       CT.IDTIPOCOTA'
      'FROM   COTAINTEGRFUNDO CT, FUNDOINVEST FI, MOEDA MO'
      'WHERE  CT.IDFUNDOINVEST = :IDFUNDOINVEST   AND'
      '       CT.DATACOTA      = (SELECT MAX(DATACOTA)'
      #9#9#9'   FROM   COTAINTEGRFUNDO'
      #9#9#9'   WHERE  IDFUNDOINVEST = :IDFUNDOINVEST   AND'
      
        '                              (((:IDTIPOCOTA IS NOT NULL)       ' +
        '   AND (IDTIPOCOTA    =:IDTIPOCOTA))    OR'
      
        '                                (:IDTIPOCOTA IS NULL))          ' +
        '   AND'
      
        #9#9'                  DATACOTA     <= TO_DATE(:DATACOTA,'#39'DD/MM/YYY' +
        'Y'#39')) AND'
      
        '      (((:IDTIPOCOTA IS NOT NULL)          AND (CT.IDTIPOCOTA   ' +
        ' =:IDTIPOCOTA))    OR'
      '        (:IDTIPOCOTA IS NULL))             AND'
      '       CT.IDFUNDOINVEST = FI.IDFUNDOINVEST AND'
      '       FI.MOECORCOTA    = MO.MOECODIGO(+) ')
    ValidateWithMask = True
    Left = 204
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end>
    object QryCotaIntegrFundoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryCotaIntegrFundoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object QryCotaIntegrFundoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object QryCotaIntegrFundoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object QryCotaIntegrFundoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
  end
  object QryAplPgtoIR: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      ''
      '    *'
      ''
      'FROM HISTFUNDO H1'
      ''
      'WHERE'
      ''
      
        '(H1.IDHISTFUNDO  IN (SELECT  /*+INDEX (H.XIE1HISTFUNDO)*/ MAX(H.' +
        'IDHISTFUNDO) AS IDHISTFUNDO'
      '                     FROM HISTFUNDO H'
      '                        WHERE'
      
        '                         (H.IDTIPOINVEST      = :IDTIPOINVEST)  ' +
        '    AND'
      
        '                         (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPA' +
        'TR) AND'
      
        '                         (H.IDFUNDOINVEST     = :IDFUNDOINVEST) ' +
        '     AND'
      
        '                         (H.DATAAPLICACAO     = TO_DATE(:DATAAPL' +
        'ICACAO,'#39'DD/MM/YYYY'#39')) AND'
      
        '                         (H.DATAMOVFUNDO      < TO_DATE(:DATAMOV' +
        'FUNDO,'#39'DD/MM/YYYY'#39'))  AND'
      '                         (H.SALDOQTDCOTAS     > 0)'
      
        '                     GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPAT' +
        'R, H.IDFUNDOINVEST, H.DATAAPLICACAO))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdHistFundoRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE HISTFUNDO SET CODDOCUMENTO = NULL, PLNCODIGO = NULL, PLAN' +
        'O = NULL'
      'WHERE'
      '       IDTIPOINVEST       =:IDTIPOINVEST        AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (IDPLANPREVCTBPATR > 0' +
        ')) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))) AND'
      ''
      '       IDFUNDOINVEST      =:IDFUNDOINVEST       AND'
      ''
      '       DATAMOVFUNDO      >=:DATAMOVFUNDO        AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                  AND'
      '      (IDTIPOCOTA        = :IDTIPOCOTA))        OR'
      '     (:IDTIPOCOTA IS NULL))'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryDelHistFundoRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM HISTFUNDO'
      'WHERE'
      '      (HISTFUNDO.IDTIPOINVEST       =:IDTIPOINVEST)        AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (HISTFUNDO.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HISTFUNDO.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))) AND'
      ''
      '      (HISTFUNDO.IDFUNDOINVEST      =:IDFUNDOINVEST)       AND'
      ''
      '      (HISTFUNDO.DATAMOVFUNDO      >=:DATAMOVFUNDO)        AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                   AND'
      '      (HISTFUNDO.IDTIPOCOTA         = :IDTIPOCOTA))        OR'
      '     (:IDTIPOCOTA IS NULL))                      AND'
      ''
      '      (HISTFUNDO.IDTIPOOPERACAO    <> -161)')
    ValidateWithMask = True
    Left = 269
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryDelIrLitigioRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM IRLITIGIO'
      'WHERE  IDOPERACAOFUNDO IN (SELECT OP.IDOPERACAOFUNDO'
      '                           FROM   OPERACAOFUNDO OP'
      '                           WHERE  '
      
        '                               OP.IDTIPOINVEST       = :IDTIPOIN' +
        'VEST  AND'
      
        '                              (((:IDPLANPREVCTBPATR IS NULL)    ' +
        ' AND (OP.IDPLANPREVCTBPATR > 0)) OR'
      
        '                               ((:IDPLANPREVCTBPATR IS NOT NULL)' +
        ' AND (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) AND'
      
        '                               OP.IDFUNDOINVEST      = :IDFUNDOI' +
        'NVEST AND'
      
        '                               OP.DATAOPERACAO      >= :DATAPEDI' +
        'DO    AND'
      
        '                               OP.IDPEDIDOFUNDO IS NOT NULL     ' +
        '      AND'
      
        '                              (((:IDTIPOCOTA IS NOT NULL)       ' +
        '      AND'
      '                              (OP.IDTIPOCOTA  = :IDTIPOCOTA)) OR'
      '                                (:IDTIPOCOTA IS NULL)) )'
      '')
    ValidateWithMask = True
    Left = 269
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryDelResgOperFundoRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERACAOFUNDO'
      'WHERE'
      '       (IDPEDIDOFUNDO IN (SELECT IDPEDIDOFUNDO'
      '                         FROM    PEDIDOFUNDO'
      '                         WHERE'
      
        '                                 IDTIPOINVEST      =:IDTIPOINVES' +
        'T         AND'
      ''
      
        '                             (((:IDPLANPREVCTBPATR IS NULL)     ' +
        'AND (IDPLANPREVCTBPATR > 0)) OR'
      
        '                              ((:IDPLANPREVCTBPATR IS NOT NULL) ' +
        'AND (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) AND'
      ''
      
        '                                 IDFUNDOINVEST     =:IDFUNDOINVE' +
        'ST        AND'
      ''
      
        '                                 DATAPEDIDO       >=:DATAPEDIDO ' +
        '          AND'
      
        '                             (((:IDTIPOCOTA IS NOT NULL)        ' +
        '          AND'
      
        '                                (IDTIPOCOTA         = :IDTIPOCOT' +
        'A))       OR'
      '                               (:IDTIPOCOTA IS NULL)) ) )'
      'AND  (IDTIPOOPERACAO <> -177) ')
    ValidateWithMask = True
    Left = 269
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryAplFundosRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       OP.IDTIPOINVEST,'
      '       OP.IDTIPOOPERACAO,'
      '       OP.IDCARTEIRAINVEST,'
      '       OP.IDFUNDOINVEST,'
      '       OP.DATAOPERACAO,'
      '       OP.DATALIQUIDACAO,'
      '       OP.IDPLANPREVCTBPATR,'
      '       OP.IDTIPOCOTA,'
      '       TP.CODTIPDOC,'
      '       OP.VLRCOTA,'
      '       OP.DATACOTIZACAO'
      ''
      'FROM OPERACAOFUNDO OP, TIPOOPERACAO TP'
      'WHERE'
      ''
      '   OP.IDTIPOINVEST      =:IDTIPOINVEST            AND'
      ''
      
        '  (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR >' +
        ' 0)) OR'
      
        '   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))) AND'
      ''
      '   OP.IDFUNDOINVEST     =:IDFUNDOINVEST           AND'
      ''
      '   OP.DATAOPERACAO      =:DATAOPERACAO            AND'
      ''
      '  (((:IDTIPOCOTA IS NOT NULL)                     AND'
      '  (OP.IDTIPOCOTA         = :IDTIPOCOTA))          OR'
      '    (:IDTIPOCOTA IS NULL))                        AND'
      ''
      '   OP.IDTIPOOPERACAO NOT IN (-43,-100,-105,-108,-119,-143) AND'
      ''
      '   OP.DATAOPERACAO      = OP.DATACOTIZACAO        AND'
      ''
      '   TP.NATUREZAOPERACAO  = '#39'A'#39'                     AND'
      '   TP.IDTIPOINVEST      = OP.IDTIPOINVEST         AND   '
      '   TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO'
      'ORDER BY IDTIPOOPERACAO DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryUpdOperacaoFundoContab: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET PLANO = NULL, PLNCODIGO = NULL'
      'WHERE'
      '     IDTIPOINVEST      =:IDTIPOINVEST        AND'
      '     IDFUNDOINVEST     > 0                   AND     '
      '     IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR   AND'
      '     DATAOPERACAO      =TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AND'
      '     PLNCODIGO         =:PLNCODIGO')
    ValidateWithMask = True
    Left = 269
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end>
  end
  object QryUpdTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TIPOFUNDOINVEST SET DATAULTFECH=:DATAULTFECH WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 50
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECH'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryUpdParaminvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST  '
      'SET DATAULTFECHFDO=:DATAULTFECHFDO')
    ValidateWithMask = True
    Left = 328
    Top = 226
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECHFDO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object FloatField19: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object FloatField20: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField21: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object StringField4: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object FloatField24: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object FloatField26: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object FloatField27: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object FloatField28: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object FloatField29: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      Size = 1
    end
    object FloatField30: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object FloatField31: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object FloatField32: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
  end
  object QryOperAjusteCert: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERACAOFUNDO, OP.IDOPERACAOORIGEM, OP.PLNCODIGO, OP' +
        '.PLANO, FI.DESCFUNDOINVEST,'
      
        '       FI.IDCARTEIRAINVEST, OP.IDTIPOOPERACAO, OP.IDFUNDOINVEST,' +
        ' OP.QTDOPERACAO,'
      '       OP.DATAOPERACAO, OP.DATACOTIZACAO, OP.IDPLANPREVCTBPATR,'
      '       TP.DESCTIPOOPERACAO, TP.NATUREZAOPERACAO'
      'FROM   OPERACAOFUNDO OP,'
      ''
      '  (SELECT'
      
        '       HF1.DESCFUNDOINVEST, HF1.IDCARTEIRAINVEST, HF1.IDTIPOFUND' +
        'OINVEST, HF1.IDFUNDOINVEST'
      '   FROM HISTFUNDOINVEST HF1'
      
        '   WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YY' +
        'YY, HH24:MI:SS'#39') IN'
      
        '         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '          FROM HISTFUNDOINVEST HF'
      '          WHERE'
      '              (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '          AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/Y' +
        'YYY'#39')+1)'
      '          GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      
        '   AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) FI, TIPOOPERA' +
        'CAO TP'
      'WHERE'
      '    OP.IDTIPOINVEST      = :IDTIPOINVEST           AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR ' +
        '> 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))) AND'
      ''
      '    OP.IDFUNDOINVEST     = :IDFUNDOINVEST          AND'
      ''
      
        '    OP.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')  ' +
        'AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                     AND'
      '   (OP.IDTIPOCOTA    = :IDTIPOCOTA))               OR'
      '     (:IDTIPOCOTA IS NULL) )                       AND'
      ''
      '    FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST      AND'
      ''
      '    OP.IDTIPOOPERACAO    IN (-36,-37,-66,-144)     AND'
      ''
      '    TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO       AND'
      '    TP.IDTIPOINVEST      = OP.IDTIPOINVEST         AND'
      '    FI.IDFUNDOINVEST     = OP.IDFUNDOINVEST'
      '    '
      'ORDER BY OP.IDOPERACAOFUNDO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryHistAtuAjusteCert: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  HISTFUNDO'
      'WHERE'
      '      IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO)'
      '                      FROM   HISTFUNDO'
      '                      WHERE'
      
        '                             IDTIPOINVEST      = :IDTIPOINVEST  ' +
        '         AND'
      ''
      
        '                             IDPLANPREVCTBPATR = :IDPLANPREVCTBP' +
        'ATR      AND'
      ''
      
        '                             IDFUNDOINVEST     = :IDFUNDOINVEST ' +
        '         AND'
      ''
      
        '                         (((:DATAAPLICACAO IS NULL)     AND (DAT' +
        'AAPLICACAO IS NOT NULL)) OR'
      
        '                          ((:DATAAPLICACAO IS NOT NULL) AND (DAT' +
        'AAPLICACAO = :DATAAPLICACAO))) AND'
      ''
      
        '                             DATAMOVFUNDO     <= :DATAMOVFUNDO  ' +
        '         AND'
      ''
      '                         (((:IDTIPOCOTA IS NOT NULL)        AND'
      '                            (IDTIPOCOTA    = :IDTIPOCOTA))  OR'
      
        '                           (:IDTIPOCOTA IS NULL))               ' +
        '         )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryVlrCotaAux: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select * from dual')
    ValidateWithMask = True
    Left = 328
    Top = 404
  end
  object DsAplicacaoRetr: TwwDataSource
    DataSet = QryAplicacaoRetr
    Left = 48
    Top = 93
  end
  object UpdAplicacaoRetr: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  IDTIPOCOTA = :IDTIPOCOTA'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, IDTIPOOPERACAO, '
      
        '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, VLR' +
        'OPERACAO, '
      
        '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, IDPLANPRE' +
        'VCTBPATR, '
      '   DATACOTIZACAO, IDTIPOCOTA)'
      'values'
      
        '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, :IDTIPOI' +
        'NVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, :QTDOPERACAO, '
      
        '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, :STA' +
        'CONFIRMA, '
      '   :IDPLANPREVCTBPATR, :DATACOTIZACAO, :IDTIPOCOTA)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 48
    Top = 93
  end
  object QryDelIncorporacaoFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'DELETE FROM INCORPORACAOFUNDO WHERE IDOPERACAOFUNDO   = :IDOPERA' +
        'CAOFUNDO')
    ValidateWithMask = True
    Left = 269
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryAtuAplicacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  /*+INDEX (H.XPKHISTFUNDO)*/'
      ''
      '     O.DATACOTIZACAO AS DATACOTIZA,'
      ''
      '     T.DESCTIPOFUNDOINV,'
      ''
      '     P.PLANPRVCONTABPATRO,'
      ''
      '     F.DESCFUNDOINVEST, F.IDFUNDOINVEST, F.IDCARTEIRAINVEST,'
      '     F.STAPROVISIONAIOF, F.STAPROVISIONAIR,'
      ''
      
        '     H.IDCOMPOSICAOFUNDO, H.IDPLANPREVCTBPATR, H.IDTIPOINVEST,  ' +
        '   H.IDTIPOOPERACAO,'
      
        '     H.IDOPERACAOFUNDO,   H.IDTIPOCOTA,        H.DATAMOVFUNDO,  ' +
        '   H.DATAAPLICACAO,'
      
        '     H.DATAULTPGTOIR,     H.COTAAPLICACAO,     H.VLRAPLICADO,   ' +
        '   H.VLRCUSTOATUAL,'
      
        '     H.SALDOQTDCOTAS,     H.SALDOVLRFUNDO,     H.SALDOQTDCOTASBL' +
        'Q, H.TIPMOVFUNDO,'
      '     H.NATURMOVFUNDO'
      ''
      'FROM HISTFUNDO H, OPERACAOFUNDO O,'
      '    (SELECT TF1.IDTIPOFUNDOINVEST, TF1.DESCTIPOFUNDOINV'
      '     FROM   TIPOFUNDOINVEST TF1'
      '     WHERE'
      '         (TF1.IDTIPOINVEST = :IDTIPOINVEST)'
      '     AND (TF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)  ) T,'
      ''
      
        '    (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFU' +
        'NDOINVEST, HF1.IDCARTEIRAINVEST,'
      '            HF1.STAPROVISIONAIOF, HF1.STAPROVISIONAIR'
      '     FROM HISTFUNDOINVEST HF1'
      
        '     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/' +
        'YYYY, HH24:MI:SS'#39') IN'
      
        '           (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCI' +
        'A),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '            FROM HISTFUNDOINVEST HF'
      '            WHERE'
      '                (HF.IDTIPOFUNDOINVEST    = :IDTIPOFUNDOINVEST)'
      
        '            AND (((:IDFUNDOINVEST IS NULL)     AND (HF.IDFUNDOIN' +
        'VEST > 0)) OR'
      
        '                 ((:IDFUNDOINVEST IS NOT NULL) AND (HF.IDFUNDOIN' +
        'VEST = :IDFUNDOINVEST)))'
      
        '            AND (TRUNC(HF.DTAVIGENCIA)   < TO_DATE(:DATAMOVFUNDO' +
        ','#39'DD/MM/YYYY'#39')+1)'
      '            GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '     AND (HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) ) F,'
      ''
      '     VWPLANPREVCTBPATR  P'
      'WHERE'
      ''
      
        '(H.IDHISTFUNDO  IN (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/ MAX(HI.' +
        'IDHISTFUNDO) AS IDHISTFUNDO'
      '                    FROM   HISTFUNDO HI,'
      '                          (SELECT /*+INDEX (HI2.XIE1HISTFUNDO)*/'
      
        '                               HI2.IDTIPOINVEST, HI2.IDPLANPREVC' +
        'TBPATR, HI2.IDFUNDOINVEST,'
      
        '                               HI2.DATAAPLICACAO, MAX(HI2.DATAMO' +
        'VFUNDO) AS DATAMOVFUNDO,'
      '                               HI2.IDTIPOCOTA'
      '                            FROM HISTFUNDO HI2'
      '                            WHERE'
      
        '                              (HI2.IDTIPOINVEST       = :IDTIPOI' +
        'NVEST)  AND'
      ''
      
        '                                (((:IDPLANPREVCTBPATR IS NULL)  ' +
        '   AND (HI2.IDPLANPREVCTBPATR > 0)) OR'
      
        '                                ((:IDPLANPREVCTBPATR IS NOT NULL' +
        ') AND (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))  AND'
      ''
      
        '                                (((:IDFUNDOINVEST IS NULL)      ' +
        '   AND (HI2.IDFUNDOINVEST > 0)) OR'
      
        '                                 ((:IDFUNDOINVEST IS NOT NULL)  ' +
        '   AND (HI2.IDFUNDOINVEST = :IDFUNDOINVEST)))          AND'
      ''
      
        '                              (HI2.DATAAPLICACAO     <= TO_DATE(' +
        ':DATAMOVFUNDO, '#39'DD/MM/YYYY'#39')) AND'
      ''
      
        '                              (HI2.DATAMOVFUNDO      <= TO_DATE(' +
        ':DATAMOVFUNDO, '#39'DD/MM/YYYY'#39')) AND'
      ''
      
        '                                (((:IDTIPOCOTA IS NOT NULL)     ' +
        '   AND (HI2.IDTIPOCOTA     = :IDTIPOCOTA)) OR'
      
        '                                  (:IDTIPOCOTA IS NULL))        ' +
        '   AND'
      ''
      
        '                            (((HI2.IDTIPOINVEST IN (9,10))     A' +
        'ND (HI2.IDTIPOCOTA > 0)) OR'
      
        '                             ((HI2.IDTIPOINVEST NOT IN (9,10)) A' +
        'ND (HI2.IDTIPOCOTA IS NULL))) AND'
      ''
      '                               (HI2.TIPMOVFUNDO       <> '#39'PIR'#39')'
      ''
      
        '                           GROUP BY HI2.IDTIPOINVEST, HI2.IDPLAN' +
        'PREVCTBPATR, HI2.IDFUNDOINVEST, HI2.DATAAPLICACAO,'
      '                                    HI2.IDTIPOCOTA) HI3'
      '                    WHERE'
      
        '                           HI.IDTIPOINVEST      = HI3.IDTIPOINVE' +
        'ST'
      
        '                    AND    HI.IDPLANPREVCTBPATR = HI3.IDPLANPREV' +
        'CTBPATR'
      
        '                    AND    HI.IDFUNDOINVEST     = HI3.IDFUNDOINV' +
        'EST'
      
        '                    AND    HI.DATAAPLICACAO     = HI3.DATAAPLICA' +
        'CAO'
      
        '                    AND    HI.DATAMOVFUNDO      = HI3.DATAMOVFUN' +
        'DO'
      ''
      
        '                    AND   (((:IDTIPOCOTA IS NOT NULL)  AND (HI.I' +
        'DTIPOCOTA = HI3.IDTIPOCOTA)) OR'
      '                            (:IDTIPOCOTA IS NULL))     AND'
      ''
      
        '                     (((HI.IDTIPOINVEST IN (9,10))     AND (HI.I' +
        'DTIPOCOTA > 0)) OR'
      
        '                      ((HI.IDTIPOINVEST NOT IN (9,10)) AND (HI.I' +
        'DTIPOCOTA IS NULL))) AND'
      ''
      '                       (HI.TIPMOVFUNDO     <> '#39'PIR'#39')'
      ''
      
        '                    GROUP BY HI.IDTIPOINVEST,  HI.IDPLANPREVCTBP' +
        'ATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO,'
      
        '                             HI.DATAMOVFUNDO, HI.IDTIPOCOTA) )  ' +
        '    AND'
      ''
      '(H.SALDOQTDCOTAS              > 0)              AND'
      ''
      '(F.IDFUNDOINVEST        = H.IDFUNDOINVEST)      AND'
      ''
      '(T.IDTIPOFUNDOINVEST    = F.IDTIPOFUNDOINVEST)  AND'
      ''
      '(P.IDPLANPREVCTBPATR    = H.IDPLANPREVCTBPATR)  AND'
      ''
      '(O.IDOPERACAOFUNDO(+)   = H.IDOPERACAOFUNDO)'
      ''
      
        'ORDER BY H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO, ' +
        'H.IDTIPOCOTA,  H.DATAMOVFUNDO, H.IDHISTFUNDO DESC')
    ValidateWithMask = True
    Left = 48
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryVerDelResgate: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT DISTINCT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAPEDIDO AS DATAMOVFUNDO,'
      'IDPLANPREVCTBPATR'
      'FROM'
      '   PEDIDOFUNDO'
      'WHERE'
      '   (IDPEDIDOFUNDO =:IDPEDIDOFUNDO) '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryUpdPedidoFundo: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'UPDATE PEDIDOFUNDO'
      '       SET PLANO    = NULL,'
      '       PLNCODIGO    = NULL,'
      '       CODDOCUMENTO = NULL'
      'WHERE IDPEDIDOFUNDO = :IDPEDIDOFUNDO')
    ValidateWithMask = True
    Left = 456
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDelIrLitigioPedido: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'DELETE FROM IRLITIGIO'
      'WHERE'
      '    IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO'
      '                        FROM   OPERACAOFUNDO'
      '                        WHERE'
      
        '                            IDTIPOINVEST      = :IDTIPOINVEST   ' +
        '    AND'
      
        '                            IDPLANPREVCTBPATR = :IDPLANPREVCTBPA' +
        'TR  AND'
      
        '                            DATAOPERACAO      = TO_DATE(:DATAMOV' +
        'FUNDO,'#39'DD/MM/YYYY'#39') AND'
      '                            IDPEDIDOFUNDO     = :IDPEDIDOFUNDO)')
    ValidateWithMask = True
    Left = 269
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDelHistFundoResg: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'DELETE FROM HISTFUNDO'
      'WHERE'
      '    IDTIPOINVEST      = :IDTIPOINVEST      AND'
      '    IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '    DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39') AND'
      '    IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO'
      '                        FROM   OPERACAOFUNDO'
      '                        WHERE'
      
        '                            IDTIPOINVEST      = :IDTIPOINVEST   ' +
        '    AND'
      
        '                            IDPLANPREVCTBPATR = :IDPLANPREVCTBPA' +
        'TR  AND'
      
        '                            DATAOPERACAO      = TO_DATE(:DATAMOV' +
        'FUNDO,'#39'DD/MM/YYYY'#39') AND'
      
        '                            IDPEDIDOFUNDO     = :IDPEDIDOFUNDO) ' +
        '    AND'
      '    IDTIPOOPERACAO NOT IN (-12,-13)'
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDelOperacaoFundoResg: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'DELETE FROM OPERACAOFUNDO'
      'WHERE'
      '    IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO'
      '                        FROM   OPERACAOFUNDO'
      '                        WHERE'
      
        '                            IDTIPOINVEST      = :IDTIPOINVEST   ' +
        '    AND'
      
        '                            IDPLANPREVCTBPATR = :IDPLANPREVCTBPA' +
        'TR  AND'
      
        '                            DATAOPERACAO      = TO_DATE(:DATAMOV' +
        'FUNDO,'#39'DD/MM/YYYY'#39') AND'
      '                            IDPEDIDOFUNDO     = :IDPEDIDOFUNDO)')
    ValidateWithMask = True
    Left = 269
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryDelPedidoFundoResg: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'DELETE FROM PEDIDOFUNDO WHERE IDPEDIDOFUNDO = :IDPEDIDOFUNDO')
    ValidateWithMask = True
    Left = 204
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryUpdOperacaoFundoResg: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO'
      '       SET PLANO    = NULL,'
      '       PLNCODIGO    = NULL,'
      '       CODDOCUMENTO = NULL'
      'WHERE IDPEDIDOFUNDO = :IDPEDIDOFUNDO'
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryAmortizacaoFundoRetr: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT OP.*, FI.*, TP.*, PLANO.*'
      'FROM   OPERACAOFUNDO OP,'
      ''
      '  (SELECT'
      '    HF1.*'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDFUNDOINVEST)) ) FI,'
      ''
      '   TIPOOPERACAO TP,'
      '   '
      '  (SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO'
      'WHERE'
      '   OP.IDTIPOINVEST      = :IDTIPOINVEST           AND'
      ''
      
        '  (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR >' +
        ' 0)) OR'
      
        '   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR)))  AND'
      ''
      '   OP.IDFUNDOINVEST     = :IDFUNDOINVEST          AND'
      ''
      
        '   OP.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AN' +
        'D'
      ''
      '   OP.IDTIPOOPERACAO    IN (-43, -143)            AND   '
      ''
      '  (((:IDTIPOCOTA IS NOT NULL)                     AND'
      '  (OP.IDTIPOCOTA         = :IDTIPOCOTA))          OR'
      '    (:IDTIPOCOTA IS NULL))                        AND'
      ''
      '   TP.IDTIPOINVEST      = OP.IDTIPOINVEST         AND'
      '   TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO       AND'
      '   FI.IDFUNDOINVEST     = OP.IDFUNDOINVEST        AND'
      '   PLANO.IDPLANPREVCTBPATR = OP.IDPLANPREVCTBPATR '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryUpdOperFundoIrLitigio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'UPDATE OPERACAOFUNDO SET VLRIR = :VLRIR WHERE IDOPERACAOFUNDO = ' +
        ':IDOPERACAOFUNDO'
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QrySaldoTotalAmort: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      'SUM(NVL(H1.VLRAPLICADO,0)) AS VLRTOTAPL,'
      'SUM(NVL(H1.VLRCUSTOATUAL,0)) AS VLRTOTCUST,'
      'SUM(NVL(DECODE(H1.SALDOVLRFUNDO-H1.VLRAPLICADO,'
      '              (ABS(H1.SALDOVLRFUNDO-H1.VLRAPLICADO)*-1),0,'
      
        '                      H1.SALDOVLRFUNDO-H1.VLRAPLICADO),0)) AS VL' +
        'RTOTREND,'
      
        'SUM(NVL(H1.VLRAPLICADO,0)+(NVL(H1.SALDOVLRFUNDO,0)-NVL(H1.VLRAPL' +
        'ICADO,0))) AS SLDTOTFUNDO'
      ''
      'FROM HISTFUNDO H1'
      ''
      'WHERE'
      ''
      
        '(H1.IDHISTFUNDO IN (SELECT /*+INDEX (H.XIE1HISTFUNDO)*/  MAX(H.I' +
        'DHISTFUNDO) AS IDHISTFUNDO'
      '                    FROM   HISTFUNDO H'
      
        '                    WHERE (H.IDTIPOINVEST       = :IDTIPOINVEST)' +
        '       AND'
      
        '                          (H.IDPLANPREVCTBPATR  = :IDPLANPREVCTB' +
        'PATR)  AND'
      
        '                          (H.IDFUNDOINVEST      = :IDFUNDOINVEST' +
        ')      AND'
      
        '                          (H.DATAAPLICACAO     <= :DATAMOVFUNDO)' +
        '       AND'
      '                          (H.DATAMOVFUNDO      <= :DATAMOVFUNDO)'
      
        '                    GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR' +
        ', H.IDFUNDOINVEST, H.DATAAPLICACAO)) AND'
      '(H1.SALDOQTDCOTAS > 0)')
    PictureMasks.Strings = (
      'DATAAPLICACAO'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 130
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDetalheAplAmortizacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (HISTFUNDO.XPKHISTFUNDO)*/'
      'HISTFUNDO.DATAAPLICACAO,'
      'HISTFUNDO.DATAMOVFUNDO,'
      'HISTFUNDO.VLRAPLICADO,'
      'HISTFUNDO.VLRCUSTOATUAL,'
      'DECODE(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRAPLICADO,'
      
        '              (ABS(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRAPLICADO' +
        ')*-1),0,'
      
        '                       HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRAPLI' +
        'CADO) AS VLRRENDIMENTO,'
      
        '     (HISTFUNDO.VLRAPLICADO+(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.V' +
        'LRAPLICADO)) AS SALDOVLRFUNDO,'
      'HISTFUNDO.IDFUNDOINVEST,'
      'HISTFUNDO.IDHISTFUNDO,'
      'HISTFUNDO.IDTIPOOPERACAO,'
      'HISTFUNDO.IDCARTEIRAINVEST,'
      'HISTFUNDO.IDOPERACAOFUNDO,'
      'HISTFUNDO.DATAULTPGTOIR,'
      'HISTFUNDO.VLRMOVFUNDO,'
      'HISTFUNDO.VLRIRPROV,'
      'HISTFUNDO.VLRIOFPROV,'
      'HISTFUNDO.COTASMOVFUNDO,'
      'HISTFUNDO.SALDOQTDCOTAS,'
      'HISTFUNDO.SALDOQTDCOTASBLQ,'
      'HISTFUNDO.COTAAPLICACAO,'
      'HISTFUNDO.CODDOCUMENTO,'
      'HISTFUNDO.PLNCODIGO,'
      'HISTFUNDO.PLANO,'
      'HISTFUNDO.IDTIPOINVEST,'
      'FUN.IDFUNDOINVEST,'
      'FUN.DESCFUNDOINVEST'
      ''
      'FROM HISTFUNDO,'
      '  (SELECT'
      '    HF1.IDFUNDOINVEST, HF1.DESCFUNDOINVEST'
      '   FROM HISTFUNDOINVEST HF1'
      
        '   WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YY' +
        'YY, HH24:MI:SS'#39') IN'
      
        '         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '          FROM HISTFUNDOINVEST HF'
      '          WHERE'
      '              (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '          AND (HF.DTAVIGENCIA   < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/Y' +
        'YYY'#39')+1)'
      '          GROUP BY HF.IDFUNDOINVEST)) ) FUN'
      'WHERE'
      ''
      
        '(HISTFUNDO.IDHISTFUNDO IN (SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ M' +
        'AX(H.IDHISTFUNDO) AS IDHISTFUNDO'
      '                           FROM'
      '                              HISTFUNDO H'
      '                           WHERE'
      
        '                             (H.IDTIPOINVEST         = :IDTIPOIN' +
        'VEST)       AND'
      
        '                             (H.IDPLANPREVCTBPATR    = :IDPLANPR' +
        'EVCTBPATR)  AND'
      
        '                             (H.IDFUNDOINVEST        = :IDFUNDOI' +
        'NVEST)      AND'
      
        '                             (H.DATAAPLICACAO       <= TO_DATE(:' +
        'DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')) AND'
      
        '                             (H.DATAMOVFUNDO        <= TO_DATE(:' +
        'DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')) AND'
      
        '                             (H.IDTIPOOPERACAO      <> -43)     ' +
        '            AND'
      '                             (H.NATURMOVFUNDO       <> '#39'R'#39')'
      
        '                          GROUP BY H.IDTIPOINVEST, H.IDPLANPREVC' +
        'TBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO)) AND'
      
        '(HISTFUNDO.SALDOQTDCOTAS    > 0)                                ' +
        '          AND'
      ''
      '(FUN.IDFUNDOINVEST  = HISTFUNDO.IDFUNDOINVEST)'
      ''
      'ORDER BY HISTFUNDO.IDFUNDOINVEST, HISTFUNDO.DATAAPLICACAO,'
      '         HISTFUNDO.DATAMOVFUNDO, HISTFUNDO.IDHISTFUNDO  DESC'
      ' ')
    PictureMasks.Strings = (
      'DATAAPLICACAO'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLRAPLICADO'#9'###,###,###,###0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 328
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryHistFundoRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HISTFUNDO.PLANO, HISTFUNDO.PLNCODIGO'
      'FROM   HISTFUNDO'
      'WHERE'
      '       HISTFUNDO.IDTIPOINVEST       =:IDTIPOINVEST        AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (HISTFUNDO.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HISTFUNDO.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))  AND'
      ''
      '       HISTFUNDO.IDFUNDOINVEST      =:IDFUNDOINVEST       AND'
      ''
      '       HISTFUNDO.DATAMOVFUNDO      >=:DATAMOVFUNDO        AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                  AND'
      '      (HISTFUNDO.IDTIPOCOTA         = :IDTIPOCOTA))       OR'
      '     (:IDTIPOCOTA IS NULL))                     AND'
      ''
      '       HISTFUNDO.TIPMOVFUNDO        = '#39'ATU'#39'               AND'
      ''
      '      (HISTFUNDO.PLNCODIGO IS NOT NULL)'
      '      '
      'GROUP BY HISTFUNDO.PLANO, HISTFUNDO.PLNCODIGO')
    ValidateWithMask = True
    Left = 456
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryAplicacaoRetr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     ,'
      
        '  OPE.IDTIPOINVEST      , OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINV' +
        'EST     ,'
      
        '  OPE.DATAOPERACAO      , OPE.DATALIQUIDACAO    , OPE.QTDOPERACA' +
        'O       ,'
      
        '  OPE.VLROPERACAO       , OPE.VLRCOTA           , OPE.VLRIR     ' +
        '        ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      
        '  OPE.IDPLANPREVCTBPATR , OPE.DATACOTIZACAO     , OPE.PLNCODIGO ' +
        '        ,'
      
        '  OPE.CODDOCUMENTO      , OPE.PLANO             , OPE.IDTIPOCOTA' +
        '        ,'
      ''
      
        '  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D009999999999'#39') AS Q' +
        'TDMOSTRA,'
      '  OPE.IDCOMPOSICAOFUNDO ,'
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.PZOCOTAPLIC       ,'
      ''
      '  TCO.DESCTIPOCOTA      ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      '  TPO.NATUREZAOPERACAO  , CAR.IDPATROCINADORA   ,'
      
        '  DECODE(OPE.STACONFIRMA, '#39'S'#39', '#39'Confirmada'#39','#39'Pendente'#39') As STATU' +
        'S,'
      ''
      '  PLANO.PLANPRVCONTABPATRO, PLANO.IDPLANOPREV'
      ''
      'FROM'
      '  OPERACAOFUNDO OPE,'
      '  (SELECT'
      
        '    HF1.IDFUNDOINVEST     , HF1.DESCFUNDOINVEST   , HF1.IDGESTOR' +
        'CARTEIRA  ,'
      
        '    HF1.TRGDTINCLUSAO     , HF1.TRGUSERINCLUSAO   , HF1.MOECODIG' +
        'O         ,'
      
        '    HF1.IDCARTEIRAINVEST  , HF1.IDTIPOFUNDOINVEST , HF1.CNPJFUND' +
        'O         ,'
      
        '    HF1.STAEXCLUSIVO      , HF1.PZOCARENCIA       , HF1.PZOANIVE' +
        'RSARIO    ,'
      
        '    HF1.PZOLIQAPLIC       , HF1.PZOLIQRESG        , HF1.QTDDECQT' +
        'D         ,'
      
        '    HF1.QTDDECVALOR       , HF1.STAFUNDO          , HF1.PZOAMORT' +
        'IZACAO    ,'
      
        '    HF1.PERCTXPERFORM     , HF1.PERCTXADM         , HF1.CODFUNCE' +
        'TIP       ,'
      
        '    HF1.STAPROVISIONAIR   , HF1.STAPROVISIONAIOF  , HF1.CONTRCET' +
        'IP        ,'
      '    HF1.PZOCOTAPLIC'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '   AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) FUN,'
      ''
      '   TIPOOPERACAO TPO, CARTEIRAINVEST CAR, TIPOCOTA TCO,'
      ''
      '  (SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO'
      ''
      'WHERE'
      
        '  (OPE.IDTIPOINVEST      = :IDTIPOINVEST)                       ' +
        'AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBPATR' +
        ' > 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR)))  AND'
      ''
      
        '  (OPE.IDFUNDOINVEST     = :IDFUNDOINVEST)                      ' +
        'AND'
      ''
      
        '  (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOOPERACAO    = :IDTIPOOPERACAO)                     ' +
        'AND'
      ''
      
        '   (((:IDTIPOCOTA IS NOT NULL)                                  ' +
        'AND'
      
        '  (OPE.IDTIPOCOTA        = :IDTIPOCOTA))                        ' +
        'OR'
      
        '     (:IDTIPOCOTA IS NULL))                                     ' +
        'AND'
      ''
      
        '  (FUN.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)                   ' +
        'AND'
      ''
      
        '  (CAR.IDCARTEIRAINVEST(+)= FUN.IDCARTEIRAINVEST)               ' +
        'AND'
      ''
      
        '  (TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST)                    ' +
        'AND'
      
        '  (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)                  ' +
        'AND'
      ''
      
        '  (TCO.IDTIPOCOTA(+)     = OPE.IDTIPOCOTA)                      ' +
        'AND'
      ''
      '  (PLANO.IDPLANPREVCTBPATR = OPE.IDPLANPREVCTBPATR)'
      ''
      'ORDER BY  FUN.DESCFUNDOINVEST, OPE.DATAOPERACAO')
    UpdateObject = UpdAplicacaoRetr
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 48
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryCancelamentoSubsCotasRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OPE.IDOPERACAOORIGEM,'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     ,'
      
        '  OPE.IDTIPOINVEST      , OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINV' +
        'EST     ,'
      
        '  OPE.DATAOPERACAO      , OPE.DATALIQUIDACAO    , OPE.QTDOPERACA' +
        'O       ,'
      
        '  OPE.VLROPERACAO       , OPE.VLRCOTA           , OPE.VLRIR     ' +
        '        ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      
        '  OPE.IDPLANPREVCTBPATR , OPE.DATACOTIZACAO     , OPE.PLNCODIGO ' +
        '        ,'
      
        '  OPE.CODDOCUMENTO      , OPE.PLANO             , OPE.IDTIPOCOTA' +
        '        ,'
      ''
      
        '  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D009999999999'#39') AS Q' +
        'TDMOSTRA ,'
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.PZOCOTAPLIC       ,'
      ''
      '  TCO.DESCTIPOCOTA      ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      '  TPO.NATUREZAOPERACAO  , CAR.IDPATROCINADORA   ,'
      
        '  DECODE(OPE.STACONFIRMA, '#39'S'#39', '#39'Confirmada'#39','#39'Pendente'#39') As STATU' +
        'S,'
      ''
      '  PLANO.PLANPRVCONTABPATRO, PLANO.IDPLANOPREV'
      ''
      'FROM'
      '  OPERACAOFUNDO OPE,'
      '    (SELECT'
      
        '    HF1.IDFUNDOINVEST     , HF1.DESCFUNDOINVEST   , HF1.IDGESTOR' +
        'CARTEIRA  ,'
      
        '    HF1.TRGDTINCLUSAO     , HF1.TRGUSERINCLUSAO   , HF1.MOECODIG' +
        'O         ,'
      
        '    HF1.IDCARTEIRAINVEST  , HF1.IDTIPOFUNDOINVEST , HF1.CNPJFUND' +
        'O         ,'
      
        '    HF1.STAEXCLUSIVO      , HF1.PZOCARENCIA       , HF1.PZOANIVE' +
        'RSARIO    ,'
      
        '    HF1.PZOLIQAPLIC       , HF1.PZOLIQRESG        , HF1.QTDDECQT' +
        'D         ,'
      
        '    HF1.QTDDECVALOR       , HF1.STAFUNDO          , HF1.PZOAMORT' +
        'IZACAO    ,'
      
        '    HF1.PERCTXPERFORM     , HF1.PERCTXADM         , HF1.CODFUNCE' +
        'TIP       ,'
      
        '    HF1.STAPROVISIONAIR   , HF1.STAPROVISIONAIOF  , HF1.CONTRCET' +
        'IP        ,'
      '    HF1.PZOCOTAPLIC'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '   AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) FUN,'
      ''
      '  TIPOOPERACAO TPO, CARTEIRAINVEST CAR, TIPOCOTA TCO,'
      '  '
      '  (SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO'
      ''
      'WHERE'
      
        '  (OPE.IDTIPOINVEST      = :IDTIPOINVEST)                       ' +
        'AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTBPATR' +
        ' > 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR)))  AND'
      ''
      
        '  (OPE.IDFUNDOINVEST     = :IDFUNDOINVEST)                      ' +
        'AND'
      ''
      
        '  (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOOPERACAO    = :IDTIPOOPERACAO)                     ' +
        'AND'
      ''
      
        '  (OPE.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '   (((:IDTIPOCOTA IS NOT NULL)                                  ' +
        'AND'
      
        '  (OPE.IDTIPOCOTA        = :IDTIPOCOTA))                        ' +
        'OR'
      
        '     (:IDTIPOCOTA IS NULL))                                     ' +
        'AND'
      ''
      
        '  (OPE.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)                   ' +
        'AND'
      
        '  (CAR.IDCARTEIRAINVEST  = FUN.IDCARTEIRAINVEST)                ' +
        'AND'
      
        '  (OPE.IDTIPOINVEST      = TPO.IDTIPOINVEST)                    ' +
        'AND'
      
        '  (OPE.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO)                  ' +
        'AND'
      
        '  (OPE.IDTIPOCOTA        = TCO.IDTIPOCOTA(+))                   ' +
        'AND'
      '  (PLANO.IDPLANPREVCTBPATR = OPE.IDPLANPREVCTBPATR)'
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST, OPE.DATAOPERACAO'
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 456
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryRecebimentosRetr: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      
        '  OP.IDOPERACAOFUNDO, OP.IDCARTEIRAINVEST,  OP.IDPEDIDOFUNDO, OP' +
        '.IDTIPOINVEST,'
      
        '  OP.IDTIPOOPERACAO,  OP.IDFUNDOINVEST,     OP.DATAOPERACAO,  OP' +
        '.DATALIQUIDACAO,'
      
        '  OP.QTDOPERACAO,     OP.VLROPERACAO,       OP.VLRCOTA,       OP' +
        '.VLRIR,'
      
        '  OP.VLRIOF,          OP.VLRRENDIMENTO,     OP.VLROPERACAO AS VL' +
        'RLIQUIDO,'
      
        '  OP.STACONFIRMA,     OP.IDOPERACAOORIGEM,  OP.IDPLANPREVCTBPATR' +
        ','
      '  OP.DATACOTIZACAO,   OP.VLRDESCONTO,       OP.QTDUSUFRUTO,'
      '  TP.DESCTIPOOPERACAO,'
      
        '  FUN.IDGESTORCARTEIRA, FUN.QTDDECQTD, FUN.IDTIPOFUNDOINVEST, FU' +
        'N.DESCFUNDOINVEST,'
      '  OP.CODDOCUMENTO,    OP.PLNCODIGO'
      'FROM'
      '   OPERACAOFUNDO OP, TIPOOPERACAO TP,'
      '  (SELECT'
      
        '      HF1.IDGESTORCARTEIRA, HF1.QTDDECQTD, HF1.IDTIPOFUNDOINVEST' +
        ','
      '      HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST'
      '   FROM HISTFUNDOINVEST HF1'
      
        '   WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YY' +
        'YY, HH24:MI:SS'#39') IN'
      
        '         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '          FROM HISTFUNDOINVEST HF'
      '          WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '          AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/Y' +
        'YYY'#39')+1)'
      
        '          GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST)) ) FU' +
        'N'
      'WHERE'
      '   (OP.IDTIPOINVEST  = :IDTIPOINVEST) AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR ' +
        '> 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR)))  AND'
      ''
      '   (OP.IDFUNDOINVEST = :IDFUNDOINVEST) AND'
      ''
      '   (OP.DATAOPERACAO  = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) AND'
      ''
      '   ((:IDTIPOCOTA IS NULL)  OR (OP.IDTIPOCOTA = :IDTIPOCOTA)) AND'
      ''
      '   (TP.NATUREZAOPERACAO = '#39'R'#39') AND'
      ''
      '   (OP.IDTIPOINVEST   = TP.IDTIPOINVEST) AND'
      '   (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (OP.IDFUNDOINVEST = FUN.IDFUNDOINVEST)'
      ''
      'ORDER BY OP.DATAOPERACAO DESC'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryTransfPlanosRetr: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      
        '  OP.IDOPERACAOFUNDO, OP.IDCARTEIRAINVEST,  OP.IDTIPOINVEST,    ' +
        '  OP.IDTIPOOPERACAO,'
      
        '  OP.IDFUNDOINVEST,   OP.DATAOPERACAO,      OP.DATALIQUIDACAO,  ' +
        '  OP.QTDOPERACAO,'
      
        '  OP.VLROPERACAO,     OP.IDOPERACAOORIGEM,  OP.IDPLANPREVCTBPATR' +
        ', OP.VLRIR,'
      '  OP.VLRIOF,'
      '  TP.DESCTIPOOPERACAO, TP.NATUREZAOPERACAO,'
      
        '  FUN.IDGESTORCARTEIRA, FUN.QTDDECQTD, FUN.IDTIPOFUNDOINVEST, FU' +
        'N.DESCFUNDOINVEST,'
      '  OP2.IDOPERACAODEST,  OP2.IDPLANDEST, OP2.DATACOTIZACAO'
      'FROM'
      '   OPERACAOFUNDO OP, TIPOOPERACAO TP, FUNDOINVEST FUN,'
      ''
      '   (SELECT (OP1.IDOPERACAOFUNDO) AS IDOPERACAODEST,'
      '            OP1.IDPLANPREVCTBPATR AS IDPLANDEST,'
      '            OP1.IDOPERACAOORIGEM, OP1.DATACOTIZACAO'
      '    FROM OPERACAOFUNDO OP1'
      '    WHERE'
      '    (OP1.IDTIPOINVEST    = :IDTIPOINVEST)  AND'
      ''
      
        '     (((:IDPLANPREVCTBPATR IS NULL)     AND (OP1.IDPLANPREVCTBPA' +
        'TR > 0)) OR'
      
        '      ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP1.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR))) AND'
      ''
      
        '    (OP1.DATAOPERACAO  >= TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39'))  ' +
        '       AND'
      
        '    (OP1.IDTIPOOPERACAO = -108)                                 ' +
        '       AND'
      ''
      '      ((:IDTIPOCOTA IS NULL) OR (OP1.IDTIPOCOTA = :IDTIPOCOTA))'
      ''
      '      ORDER BY OP1.IDOPERACAOFUNDO DESC ) OP2'
      'WHERE'
      '   (OP.IDTIPOINVEST  = :IDTIPOINVEST) AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR ' +
        '> 0)) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))) AND'
      ''
      '   (OP.IDFUNDOINVEST   = :IDFUNDOINVEST)    AND'
      ''
      
        '   (OP.DATAOPERACAO    = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      ''
      '   (OP.IDTIPOOPERACAO  = -107)              AND'
      ''
      '    ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA)) AND'
      ''
      '   (OP.IDFUNDOINVEST    = FUN.IDFUNDOINVEST) AND'
      '   (OP.IDTIPOINVEST     = TP.IDTIPOINVEST)   AND'
      '   (OP.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO) AND'
      '   (OP.IDOPERACAOORIGEM = OP2.IDOPERACAOORIGEM(+))'
      ''
      'ORDER BY OP.DATAOPERACAO DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryUpdOpeFinCtb: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET'
      '       PLANO = DECODE(SIGN(:PLANO), -1, NULL, :PLANO),'
      
        '       PLNCODIGO = DECODE(SIGN(:PLNCODIGO), -1, NULL, :PLNCODIGO' +
        '),'
      
        '       CODDOCUMENTO = DECODE(SIGN(:CODDOCUMENTO), -1, NULL, :COD' +
        'DOCUMENTO)'
      'WHERE'
      '       IDOPERACAOFUNDO =:IDOPERACAOFUNDO ')
    ValidateWithMask = True
    Left = 390
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDespOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPODESPINVEST, FLGGERACONTAB, FLGGERACAPCAR, CODTIPDOC,'
      '   RECPAG'
      'FROM'
      '   DESPESASXTIPOOPER'
      'WHERE'
      '   ( IDTIPOINVEST     =:IDTIPOINVEST )        AND'
      '   ( IDTIPOOPERACAO   =:IDTIPOOPERACAO )       AND'
      '   ( IDTIPODESPINVEST =:IDTIPODESPINVEST ) ')
    ValidateWithMask = True
    Left = 130
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptInput
      end>
    object FloatField48: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'DESPESASXTIPOOPER.FLGGERACONTAB'
    end
    object FloatField49: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'DESPESASXTIPOOPER.FLGGERACAPCAR'
    end
    object FloatField50: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'DESPESASXTIPOOPER.CODTIPDOC'
    end
    object StringField10: TStringField
      FieldName = 'RECPAG'
      Origin = 'DESPESASXTIPOOPER.RECPAG'
      Size = 1
    end
    object FloatField51: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'DESPESASXTIPOOPER.IDTIPODESPINVEST'
    end
  end
  object QryInsHistCotaIntegraliza: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTCOTAINTEGRALIZA'
      
        '(IDHISTCOTAINTEGR,  IDTIPOINVEST,      IDFUNDOINVEST,     IDTIPO' +
        'COTA, IDCOTAINTEGRALIZA,'
      
        ' DATAHISTCOTAINTEG, VLRHISTCOTAINTEGR, QTDHISTCOTAINTEGR, QTDMOV' +
        'COTAINTEGR, VLRCOTAINTEGR,'
      
        ' VLRVARIACAODIA,    PLANO,             PLNCODIGO,         IDPLAN' +
        'PREVCTBPATR, TIPMOVCOTAINTEGR,'
      ' IDOPERACAOFUNDO,   DATAAPLICACAO)'
      'VALUES'
      
        '(:IDHISTCOTAINTEGR,  :IDTIPOINVEST,      :IDFUNDOINVEST,     :ID' +
        'TIPOCOTA, :IDCOTAINTEGRALIZA,'
      
        ' :DATAHISTCOTAINTEG, :VLRHISTCOTAINTEGR, :QTDHISTCOTAINTEGR, :QT' +
        'DMOVCOTAINTEGR, :VLRCOTAINTEGR,'
      
        ' :VLRVARIACAODIA,    :PLANO,             :PLNCODIGO,         :ID' +
        'PLANPREVCTBPATR, :TIPMOVCOTAINTEGR,'
      ' :IDOPERACAOFUNDO,   :DATAAPLICACAO)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCOTAINTEGR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCOTAINTEGRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTCOTAINTEGR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDHISTCOTAINTEGR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDMOVCOTAINTEGR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTAINTEGR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRVARIACAODIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVCOTAINTEGR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end>
  end
  object QryAtuHistCotaInteg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    HC.IDHISTCOTAINTEGR,  HC.IDTIPOINVEST, HC.IDFUNDOINVEST, HC.' +
        'IDTIPOCOTA, HC.IDOPERACAOFUNDO,'
      
        '    HC.DATAHISTCOTAINTEG, HC.VLRHISTCOTAINTEGR, HC.QTDHISTCOTAIN' +
        'TEGR, HC.VLRCOTAINTEGR,'
      
        '    HC.VLRVARIACAODIA,    HC.PLANO, HC.PLNCODIGO, HC.IDPLANPREVC' +
        'TBPATR, HC.QTDMOVCOTAINTEGR,'
      '    HC.TIPMOVCOTAINTEGR,  HC.DATAAPLICACAO,'
      ''
      
        '    FI.DESCFUNDOINVEST,   FI.IDCARTEIRAINVEST, FI.DATAINICIOFUND' +
        'O,'
      ''
      '    TF.DESCTIPOFUNDOINV,'
      ''
      '    PLANO.IDPLANOPREV, PLANO.IDPATRO, PLANO.PLANPRVCONTABPATRO'
      'FROM'
      '    HISTCOTAINTEGRALIZA HC, TIPOFUNDOINVEST TF,'
      ''
      
        '      (SELECT DESCFUNDOINVEST,  IDCARTEIRAINVEST, IDTIPOFUNDOINV' +
        'EST, IDFUNDOINVEST, DATAINICIOFUNDO'
      '       FROM   HISTFUNDOINVEST HF1'
      
        '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/M' +
        'M/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGEN' +
        'CIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF'
      '              WHERE'
      
        '                  (((:IDFUNDOINVEST IS NOT NULL)     AND (HF.IDF' +
        'UNDOINVEST =:IDFUNDOINVEST)) OR'
      '                    (:IDFUNDOINVEST IS NULL))'
      
        '              AND (HF.DTAVIGENCIA   < TO_DATE(:DATAHISTCOTAINTEG' +
        ','#39'DD/MM/YYYY'#39')+1)'
      '              GROUP BY HF.IDFUNDOINVEST, HF.IDTIPOFUNDOINVEST))'
      
        '       AND (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFUNDOIN' +
        'VEST =:IDTIPOFUNDOINVEST)) OR'
      '           (:IDTIPOFUNDOINVEST IS NULL)) ) FI,'
      ''
      '      (SELECT'
      '          PA.IDPLANPREVCTBPATR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '         (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '       FROM'
      '          PESSOA PE,'
      '          PLANPREVCONTABPATRO PA,'
      '          PLANPREVCONTABIL PL'
      '       WHERE'
      '         (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '         (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO'
      'WHERE'
      ''
      '    (HC.IDHISTCOTAINTEGR IN (SELECT MAX(HC1.IDHISTCOTAINTEGR)'
      '                             FROM   HISTCOTAINTEGRALIZA HC1,'
      
        '                                   (SELECT IDFUNDOINVEST FROM   ' +
        'HISTFUNDOINVEST HF1'
      
        '                                    WHERE (HF1.IDFUNDOINVEST || ' +
        'TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                                          (SELECT HF.IDFUNDOINVE' +
        'ST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      
        '                                           FROM HISTFUNDOINVEST ' +
        'HF'
      '                                           WHERE'
      
        '                                               (((:IDFUNDOINVEST' +
        ' IS NOT NULL)     AND (HF.IDFUNDOINVEST =:IDFUNDOINVEST)) OR'
      
        '                                                 (:IDFUNDOINVEST' +
        ' IS NULL))'
      
        '                                           AND (HF.DTAVIGENCIA  ' +
        ' < TO_DATE(:DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39')+1)'
      
        '                                           GROUP BY HF.IDFUNDOIN' +
        'VEST, HF.IDTIPOFUNDOINVEST))'
      
        '                                    AND (((:IDTIPOFUNDOINVEST IS' +
        ' NOT NULL) AND (IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST)) OR'
      
        '                                        (:IDTIPOFUNDOINVEST IS N' +
        'ULL)) ) FI1'
      '                             WHERE'
      
        '                                  (HC1.IDTIPOINVEST       =:IDTI' +
        'POINVEST)'
      
        '                             AND   (((:IDPLANPREVCTBPATR IS NOT ' +
        'NULL) AND (HC1.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR)) OR'
      
        '                                     (:IDPLANPREVCTBPATR IS NULL' +
        '))'
      ''
      
        '                             AND   (((:IDFUNDOINVEST IS NOT NULL' +
        ')     AND (HC1.IDFUNDOINVEST =:IDFUNDOINVEST)) OR'
      '                                     (:IDFUNDOINVEST IS NULL))'
      ''
      
        '                             AND  (HC1.DATAHISTCOTAINTEG <= TO_D' +
        'ATE(:DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '                             AND   (((:IDTIPOCOTA IS NOT NULL)  ' +
        '      AND (HC1.IDTIPOCOTA    =:IDTIPOCOTA))    OR'
      '                                     (:IDTIPOCOTA IS NULL))'
      
        '                             AND  (FI1.IDFUNDOINVEST    = HC1.ID' +
        'FUNDOINVEST)'
      
        '                             GROUP BY HC1.IDTIPOINVEST, HC1.IDPL' +
        'ANPREVCTBPATR, HC1.IDFUNDOINVEST, HC1.DATAAPLICACAO,'
      '                                      HC1.IDTIPOCOTA))'
      'AND  HC.QTDHISTCOTAINTEGR    > 0'
      'AND  FI.IDFUNDOINVEST        = HC.IDFUNDOINVEST'
      'AND  TF.IDTIPOFUNDOINVEST    = FI.IDTIPOFUNDOINVEST'
      'AND  PLANO.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR'
      ''
      
        'ORDER BY HC.IDPLANPREVCTBPATR, HC.IDTIPOINVEST, HC.IDFUNDOINVEST' +
        ', HC.IDTIPOCOTA,'
      
        '         HC.DATAHISTCOTAINTEG, HC.DATAAPLICACAO, HC.IDHISTCOTAIN' +
        'TEGR'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryHistCotaIntegRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO, PLNCODIGO, DATAHISTCOTAINTEG, IDHISTCOTAINTEGR'
      'FROM   HISTCOTAINTEGRALIZA'
      'WHERE'
      ''
      '       IDTIPOINVEST       =:IDTIPOINVEST        AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (IDPLANPREVCTBPATR > 0' +
        ')) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR)))  AND'
      ''
      '       IDFUNDOINVEST      =:IDFUNDOINVEST       AND'
      ''
      
        '       DATAHISTCOTAINTEG  >=TO_DATE(:DATAHISTCOTA,'#39'DD/MM/YYYY'#39') ' +
        ' AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                  AND'
      '      (IDTIPOCOTA        = :IDTIPOCOTA))        OR'
      '     (:IDTIPOCOTA IS NULL))                     AND'
      '     '
      '       TIPMOVCOTAINTEGR <> '#39'TRP'#39
      ''
      'ORDER BY DATAHISTCOTAINTEG DESC, IDHISTCOTAINTEGR DESC'
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryUpdHistCtIntRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCOTAINTEGRALIZA SET PLANO = NULL, PLNCODIGO = NULL'
      'WHERE'
      '       IDTIPOINVEST       =:IDTIPOINVEST        AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (IDPLANPREVCTBPATR > 0' +
        ')) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))) AND'
      ''
      '       IDFUNDOINVEST      =:IDFUNDOINVEST       AND'
      ''
      
        '       DATAHISTCOTAINTEG  >=TO_DATE(:DATAHISTCOTA,'#39'DD/MM/YYYY'#39') ' +
        ' AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                  AND'
      '      (IDTIPOCOTA        = :IDTIPOCOTA))        OR'
      '     (:IDTIPOCOTA IS NULL))'
      ' '
      '')
    ValidateWithMask = True
    Left = 390
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryDelHistCtIntRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCOTAINTEGRALIZA'
      'WHERE'
      '       IDTIPOINVEST       =:IDTIPOINVEST         AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NULL)     AND (IDPLANPREVCTBPATR > 0' +
        ')) OR'
      
        '    ((:IDPLANPREVCTBPATR IS NOT NULL) AND (IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))) AND'
      ''
      '       IDFUNDOINVEST      =:IDFUNDOINVEST        AND'
      ''
      
        '       DATAHISTCOTAINTEG  >=TO_DATE(:DATAHISTCOTA,'#39'DD/MM/YYYY'#39') ' +
        ' AND'
      ''
      '   (((:IDTIPOCOTA IS NOT NULL)                   AND'
      '      (IDTIPOCOTA         =:IDTIPOCOTA))         OR'
      '     (:IDTIPOCOTA IS NULL))     ')
    ValidateWithMask = True
    Left = 390
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end>
  end
  object QryBuscaRegCotaIntegraliza: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FI.DESCFUNDOINVEST, FI.IDFUNDOINVEST, FI.IDCARTEIRAINVEST' +
        ', FI.QTDDECQTD,'
      '       FI.IDTIPOFUNDOINVEST,'
      '       OP.IDTIPOCOTA, OP.IDPLANPREVCTBPATR,'
      
        '       OP.VLROPERACAO, OP.VLRDESCONTO, OP.QTDOPERACAO, OP.VLRCOT' +
        'A, OP.IDOPERACAOORIGEM,'
      '       OP.IDOPERACAOFUNDO, OP.DATAOPERACAO, OP.DATALIQUIDACAO,'
      '       HC.DATAAPLICACAO, OP.IDTIPOCOTA'
      'FROM'
      '    OPERACAOFUNDO OP,'
      '    (SELECT'
      
        '      HF1.IDFUNDOINVEST     , HF1.DESCFUNDOINVEST   , HF1.IDGEST' +
        'ORCARTEIRA  ,'
      
        '      HF1.IDCARTEIRAINVEST  , HF1.IDTIPOFUNDOINVEST , HF1.QTDDEC' +
        'QTD         ,'
      '      HF1.QTDDECVALOR        '
      '    FROM HISTFUNDOINVEST HF1'
      
        '    WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/Y' +
        'YYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HF'
      '           WHERE'
      '               (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '           AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/' +
        'YYYY'#39')+1)'
      '           GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '     AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)  FI,'
      '   (SELECT'
      '         H1.DATAAPLICACAO,'
      '         H1.IDTIPOINVEST,'
      '         H1.IDPLANPREVCTBPATR,'
      '         H1.IDFUNDOINVEST,'
      '         H1.DATAHISTCOTAINTEG,'
      '         H1.IDOPERACAOFUNDO,'
      '         H1.IDTIPOCOTA'
      '    FROM HISTCOTAINTEGRALIZA H1,'
      '            (SELECT MAX(H2.IDHISTCOTAINTEGR) AS IDHISTCOTAINTEGR'
      '             FROM   HISTCOTAINTEGRALIZA  H2'
      '             WHERE'
      
        '                      (H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2' +
        '.IDFUNDOINVEST||H2.DATAAPLICACAO||H2.DATAHISTCOTAINTEG||H2.IDTIP' +
        'OCOTA IN'
      
        '              (SELECT  HI.IDTIPOINVEST||HI.IDPLANPREVCTBPATR||HI' +
        '.IDFUNDOINVEST||HI.DATAAPLICACAO||MAX(HI.DATAHISTCOTAINTEG)||HI.' +
        'IDTIPOCOTA'
      '               FROM HISTCOTAINTEGRALIZA HI'
      '               WHERE'
      '                       (HI.IDTIPOINVEST       = :IDTIPOINVEST)'
      ''
      
        '                AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.I' +
        'DPLANPREVCTBPATR =:IDPLANPREVCTBPATR)) OR'
      '                       (:IDPLANPREVCTBPATR IS NULL))'
      ''
      '                AND   (HI.IDFUNDOINVEST      = :IDFUNDOINVEST)'
      ''
      
        '                AND   (HI.DATAAPLICACAO     <= TO_DATE(:DATAOPER' +
        'ACAO,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '                AND   (HI.DATAHISTCOTAINTEG <= TO_DATE(:DATAOPER' +
        'ACAO,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '                AND   (((:IDTIPOCOTA IS NOT NULL)      AND (HI.I' +
        'DTIPOCOTA     = :IDTIPOCOTA)) OR'
      '                         (:IDTIPOCOTA IS NULL))'
      ''
      
        '                AND (((HI.IDTIPOINVEST IN (9,10))      AND (HI.I' +
        'DTIPOCOTA > 0)) OR'
      
        '                      ((HI.IDTIPOINVEST NOT IN (9,10))  AND (HI.' +
        'IDTIPOCOTA IS NULL)))'
      ''
      
        '             GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.' +
        'IDFUNDOINVEST,'
      '                       HI.DATAAPLICACAO, HI.IDTIPOCOTA) )'
      ''
      
        '           GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.ID' +
        'FUNDOINVEST,'
      
        '                     H2.DATAAPLICACAO, H2.DATAHISTCOTAINTEG, H2.' +
        'IDTIPOCOTA) H3'
      '    WHERE'
      '        (H1.IDHISTCOTAINTEGR = H3.IDHISTCOTAINTEGR)'
      '    AND (H1.QTDHISTCOTAINTEGR > 0) ) HC'
      ''
      'WHERE'
      
        '    (((:IDTIPOINVEST IS NOT NULL)      AND (OP.IDTIPOINVEST    =' +
        ':IDTIPOINVEST))    OR'
      '      (:IDTIPOINVEST IS NULL))'
      ''
      
        'AND (((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR' +
        ' =:IDPLANPREVCTBPATR)) OR'
      '      (:IDPLANPREVCTBPATR IS NULL))'
      ''
      
        'AND (((:IDFUNDOINVEST IS NOT NULL)     AND (OP.IDFUNDOINVEST =:I' +
        'DFUNDOINVEST)) OR'
      '      (:IDFUNDOINVEST IS NULL))'
      ''
      'AND (OP.DATAOPERACAO    = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39'))'
      ''
      'AND (OP.IDTIPOOPERACAO  =:IDTIPOOPERACAO)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)        AND (OP.IDTIPOCOTA    =:I' +
        'DTIPOCOTA))    OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      'AND (HC.IDTIPOINVEST      = OP.IDTIPOINVEST)'
      'AND (HC.IDPLANPREVCTBPATR = OP.IDPLANPREVCTBPATR)'
      'AND (HC.IDFUNDOINVEST     = OP.IDFUNDOINVEST)'
      'AND (HC.DATAHISTCOTAINTEG = OP.DATAOPERACAO)'
      'AND (HC.IDOPERACAOFUNDO   = OP.IDOPERACAOORIGEM)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)        AND (HC.IDTIPOCOTA = OP.I' +
        'DTIPOCOTA))    OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      'AND (FI.IDFUNDOINVEST    = OP.IDFUNDOINVEST)'
      ''
      
        'ORDER BY OP.IDPLANPREVCTBPATR, OP.IDTIPOINVEST, OP.IDFUNDOINVEST' +
        ', OP.DATAOPERACAO, OP.IDCOTAINTEGRALIZA'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryIntegralizacaoCotasRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     ,'
      
        '  OPE.IDTIPOINVEST      , OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINV' +
        'EST     ,'
      
        '  OPE.DATAOPERACAO      , OPE.DATALIQUIDACAO    , OPE.QTDOPERACA' +
        'O       ,'
      
        '  OPE.VLROPERACAO       , OPE.VLRCOTA           , OPE.VLRIR     ' +
        '        ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      
        '  OPE.IDPLANPREVCTBPATR , OPE.DATACOTIZACAO     , OPE.PLNCODIGO ' +
        '        ,'
      
        '  OPE.CODDOCUMENTO      , OPE.PLANO             , OPE.IDTIPOCOTA' +
        '        ,'
      '  OPE.IDCOTAINTEGRALIZA , OPE.VLRDESCONTO       ,'
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.PZOCOTAPLIC       ,'
      ''
      '  TCO.DESCTIPOCOTA      ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      '  TPO.NATUREZAOPERACAO  , CAR.IDPATROCINADORA   ,'
      ''
      '  PLANO.PLANPRVCONTABPATRO, PLANO.IDPLANOPREV, PLANO.IDPATRO'
      ''
      'FROM'
      '  OPERACAOFUNDO OPE,'
      '  (SELECT'
      
        '    HF1.IDFUNDOINVEST     , HF1.DESCFUNDOINVEST   , HF1.IDGESTOR' +
        'CARTEIRA  ,'
      
        '    HF1.TRGDTINCLUSAO     , HF1.TRGUSERINCLUSAO   , HF1.MOECODIG' +
        'O         ,'
      
        '    HF1.IDCARTEIRAINVEST  , HF1.IDTIPOFUNDOINVEST , HF1.CNPJFUND' +
        'O         ,'
      
        '    HF1.STAEXCLUSIVO      , HF1.PZOCARENCIA       , HF1.PZOANIVE' +
        'RSARIO    ,'
      
        '    HF1.PZOLIQAPLIC       , HF1.PZOLIQRESG        , HF1.QTDDECQT' +
        'D         ,'
      
        '    HF1.QTDDECVALOR       , HF1.STAFUNDO          , HF1.PZOAMORT' +
        'IZACAO    ,'
      
        '    HF1.PERCTXPERFORM     , HF1.PERCTXADM         , HF1.CODFUNCE' +
        'TIP       ,'
      
        '    HF1.STAPROVISIONAIR   , HF1.STAPROVISIONAIOF  , HF1.CONTRCET' +
        'IP        ,'
      '    HF1.PZOCOTAPLIC'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '   AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) FUN,'
      ''
      '   TIPOOPERACAO TPO, CARTEIRAINVEST CAR, TIPOCOTA TCO,'
      '   '
      '  (SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANO'
      ''
      'WHERE'
      
        '  (OPE.IDTIPOINVEST      = :IDTIPOINVEST)                       ' +
        'AND'
      ''
      
        '   (((:IDPLANPREVCTBPATR IS NOT NULL)                           ' +
        'AND'
      
        '  (OPE.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))                 ' +
        'OR'
      
        '     (:IDPLANPREVCTBPATR IS NULL))                              ' +
        'AND'
      ''
      
        '  (OPE.IDFUNDOINVEST     = :IDFUNDOINVEST)                      ' +
        'AND'
      ''
      
        '  (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOOPERACAO    = :IDTIPOOPERACAO)                     ' +
        'AND'
      ''
      
        '  (OPE.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '   (((:IDTIPOCOTA IS NOT NULL)                                  ' +
        'AND'
      
        '  (OPE.IDTIPOCOTA        = :IDTIPOCOTA))                        ' +
        'OR'
      
        '     (:IDTIPOCOTA IS NULL))                                     ' +
        'AND'
      ''
      
        '  (OPE.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)                   ' +
        'AND'
      
        '  (CAR.IDCARTEIRAINVEST  = FUN.IDCARTEIRAINVEST)                ' +
        'AND'
      
        '  (OPE.IDTIPOINVEST      = TPO.IDTIPOINVEST)                    ' +
        'AND'
      
        '  (OPE.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO)                  ' +
        'AND'
      
        '  (OPE.IDTIPOCOTA        = TCO.IDTIPOCOTA(+))                   ' +
        'AND'
      '(PLANO.IDPLANPREVCTBPATR = OPE.IDPLANPREVCTBPATR)'
      'ORDER BY FUN.DESCFUNDOINVEST, OPE.DATAOPERACAO'
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 456
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryBuscaRegHistCotaInteg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTCOTAINTEGR'
      'FROM   HISTCOTAINTEGRALIZA'
      'WHERE'
      '      IDHISTCOTAINTEGR = (SELECT MAX(IDHISTCOTAINTEGR)'
      '                          FROM   HISTCOTAINTEGRALIZA'
      '                          WHERE'
      
        '                              IDOPERACAOFUNDO   =:IDOPERACAOFUND' +
        'O'
      '                          AND IDTIPOINVEST =:IDTIPOINVEST'
      
        '                          AND DATAHISTCOTAINTEG = TO_DATE(:DATAH' +
        'ISTCOTAINTEG,'#39'DD/MM/YYYY'#39')'
      '                          AND QTDHISTCOTAINTEGR > 0'
      '                          AND QTDMOVCOTAINTEGR  = 0)')
    ValidateWithMask = True
    Left = 456
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end>
  end
  object QryCotasIntegraliza: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDTIPOCOTA, H.IDFUNDOINVEST, H.IDTIPOINVEST, H.IDCOTAIN' +
        'TEGRALIZA, H.IDPLANPREVCTBPATR,'
      '       H.DATAHISTCOTAINTEG, H.QTDHISTCOTAINTEGR'
      'FROM HISTCOTAINTEGRALIZA H'
      'WHERE'
      '     H.IDHISTCOTAINTEGR IN (SELECT MAX(IDHISTCOTAINTEGR)'
      '                            FROM   HISTCOTAINTEGRALIZA'
      '                            WHERE'
      
        '                                  (IDOPERACAOFUNDO    =:IDOPERAC' +
        'AOFUNDO)'
      
        '                            AND   (DATAHISTCOTAINTEG <= TO_DATE(' +
        ':DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39'))'
      '                            AND   (TIPMOVCOTAINTEGR   = '#39'ATU'#39'))'
      ''
      '')
    ValidateWithMask = True
    Left = 48
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end>
  end
  object QrySubscricaoCotasIntegRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERACAOFUNDO, OP.IDPLANPREVCTBPATR, FI.IDFUNDOINVES' +
        'T,'
      '       OP.QTDOPERACAO    , OP.VLRCOTA, OP.VLROPERACAO,'
      '       OP.DATAOPERACAO   , OP.IDTIPOINVEST, OP.IDTIPOCOTA'
      'FROM   OPERACAOFUNDO OP,'
      '  (SELECT'
      
        '    HF1.IDFUNDOINVEST     , HF1.DESCFUNDOINVEST   , HF1.IDGESTOR' +
        'CARTEIRA  ,'
      
        '    HF1.IDCARTEIRAINVEST  , HF1.IDTIPOFUNDOINVEST , HF1.QTDDECQT' +
        'D         ,'
      '    HF1.QTDDECVALOR       '
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '         GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '   AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) FI'
      'WHERE'
      ''
      '    (OP.IDTIPOINVEST     = :IDTIPOINVEST)'
      ''
      
        'AND (((:IDPLANPREVCTBPATR IS NULL)     AND (OP.IDPLANPREVCTBPATR' +
        ' > 0)) OR'
      
        '     ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OP.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR)))'
      ''
      'AND (OP.IDFUNDOINVEST   = :IDFUNDOINVEST)'
      ''
      'AND (OP.DATAOPERACAO    = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39'))'
      ''
      'AND (OP.IDTIPOOPERACAO  =:IDTIPOOPERACAO)'
      ''
      
        'AND (((:IDTIPOCOTA IS NOT NULL)        AND (OP.IDTIPOCOTA       ' +
        ' =:IDTIPOCOTA))    OR'
      '      (:IDTIPOCOTA IS NULL))'
      ''
      'AND (FI.IDFUNDOINVEST   = OP.IDFUNDOINVEST)'
      ''
      'AND (OP.IDOPERACAOFUNDO NOT IN'
      '                          (SELECT IDOPERACAOFUNDO'
      '                           FROM   HISTCOTAINTEGRALIZA H'
      '                           WHERE'
      
        '                                  (H.IDTIPOINVEST      =:IDTIPOI' +
        'NVEST)'
      ''
      
        '                             AND (((:IDPLANPREVCTBPATR IS NULL) ' +
        '    AND (H.IDPLANPREVCTBPATR > 0)) OR'
      
        '                                  ((:IDPLANPREVCTBPATR IS NOT NU' +
        'LL) AND (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '                             AND  (H.IDFUNDOINVEST     =:IDFUNDO' +
        'INVEST)'
      ''
      
        '                             AND   H.DATAHISTCOTAINTEG = TO_DATE' +
        '(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      ''
      
        '                             AND   H.IDOPERACAOFUNDO   = OP.IDOP' +
        'ERACAOFUNDO))'
      ''
      
        'ORDER BY OP.IDPLANPREVCTBPATR, OP.IDTIPOINVEST, OP.IDFUNDOINVEST' +
        ', OP.DATAOPERACAO,'
      '         OP.IDOPERACAOFUNDO')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 456
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryBloqueioCotasRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.*, FI.*'
      'FROM   PEDIDOFUNDO PF,'
      '  (SELECT HF1.*'
      '  FROM HISTFUNDOINVEST HF1'
      
        '  WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '        (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST HF'
      '         WHERE'
      '             (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      
        '         AND (HF.DTAVIGENCIA   < TO_DATE(:DATAPEDIDO,'#39'DD/MM/YYYY' +
        #39')+1)'
      '         GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST))'
      '   AND HF1.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST) FI,'
      ''
      '   TIPOOPERACAO TP'
      ''
      'WHERE'
      '   PF.IDTIPOINVEST      = :IDTIPOINVEST           AND'
      ''
      
        '  (((:IDPLANPREVCTBPATR IS NULL)     AND (PF.IDPLANPREVCTBPATR >' +
        ' 0)) OR'
      
        '   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (PF.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR)))  AND'
      ''
      '   PF.IDFUNDOINVEST     = :IDFUNDOINVEST          AND'
      ''
      '   PF.DATAPEDIDO        = TO_DATE(:DATAPEDIDO,'#39'DD/MM/YYYY'#39') AND'
      ''
      '  (((:IDTIPOCOTA IS NOT NULL)                     AND'
      '  (PF.IDTIPOCOTA         = :IDTIPOCOTA))          OR'
      '    (:IDTIPOCOTA IS NULL))                        AND'
      ''
      '   FI.IDFUNDOINVEST     = PF.IDFUNDOINVEST        AND'
      '   TP.IDTIPOINVEST      = PF.IDTIPOINVEST         AND'
      '   TP.IDTIPOOPERACAO    = PF.IDTIPOOPERACAO       AND'
      '   TP.TIPOMOVTO         = '#39'BLQ'#39
      'ORDER BY PF.IDPEDIDOFUNDO'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryVerPrimeiraMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (HISTFUNDO.XPKHISTFUNDO)*/'
      '   IDHISTFUNDO,'
      '   DATAMOVFUNDO,'
      '   IDCARTEIRAINVEST,'
      '   SALDOQTDCOTAS,'
      '   SALDOVLRFUNDO'
      'FROM'
      '    HISTFUNDO'
      'WHERE'
      
        '    IDHISTFUNDO IN (SELECT /*+INDEX (HISTFUNDO.XIE1HISTFUNDO)*/ ' +
        'MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                    FROM'
      '                        HISTFUNDO'
      '                    WHERE'
      
        '                         (IDTIPOINVEST      =:IDTIPOINVEST)     ' +
        '  AND'
      
        '                         (IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR)' +
        '  AND'
      
        '                         (IDFUNDOINVEST     =:IDFUNDOINVEST)    ' +
        '  AND'
      ''
      
        '                         (DATAAPLICACAO    <= TO_DATE(:DATAMOVFU' +
        'NDO,'#39'DD/MM/YYYY'#39'))     AND'
      ''
      
        '                       (((DATAMOVFUNDO      < TO_DATE(:DATAMOVFU' +
        'NDO,'#39'DD/MM/YYYY'#39')))    OR'
      
        '                        ((DATAMOVFUNDO      = TO_DATE(:DATAMOVFU' +
        'NDO,'#39'DD/MM/YYYY'#39'))))   AND'
      ''
      '                      (((:IDTIPOCOTA IS NOT NULL)           AND'
      '                         (IDTIPOCOTA        = :IDTIPOCOTA)) OR'
      '                        (:IDTIPOCOTA IS NULL))'
      
        '                    GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, ID' +
        'FUNDOINVEST, DATAAPLICACAO) AND'
      ''
      '     (SALDOVLRFUNDO IS NOT NULL)'
      ''
      'ORDER BY DATAMOVFUNDO DESC, IDHISTFUNDO DESC'
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryVerPrimeiraMovIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.IDHISTFUNDO'
    end
    object QryVerPrimeiraMovDATAMOVFUNDO: TDateTimeField
      FieldName = 'DATAMOVFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.DATAMOVFUNDO'
    end
    object QryVerPrimeiraMovIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.HISTFUNDO.IDCARTEIRAINVEST'
    end
    object QryVerPrimeiraMovSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      Origin = 'BASEDADOS.HISTFUNDO.SALDOQTDCOTAS'
    end
    object QryVerPrimeiraMovSALDOVLRFUNDO: TFloatField
      FieldName = 'SALDOVLRFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.SALDOVLRFUNDO'
    end
  end
  object QryDelHistFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE FROM HISTFUNDO'
      'WHERE'
      
        '    (IDTIPOINVEST      =:IDTIPOINVEST)                          ' +
        '   AND'
      
        '    (IDPLANPREVCTBPATR > 0)                                     ' +
        '   AND'
      
        '    (IDFUNDOINVEST     > 0)                                     ' +
        '   AND'
      
        '    (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39'))   ' +
        '   AND    '
      '    (PLNCODIGO         =:PLNCODIGO)')
    ValidateWithMask = True
    Left = 130
    Top = 359
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end>
  end
  object QryPedidoFundosRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.*, FI.* , VW.PLANPRVCONTABPATRO, VW.IDPLANPREVCTBPATR'
      'FROM   PEDIDOFUNDO PF, TIPOOPERACAO TP,'
      
        '      (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESC' +
        'FUNDOINVEST, HF1.IDGESTORCARTEIRA, HF1.IDCARTEIRAINVEST'
      '       FROM   HISTFUNDOINVEST HF1'
      
        '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/M' +
        'M/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIG' +
        'ENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF'
      '              WHERE'
      
        '                (TF.IDTIPOINVEST       = :IDTIPOINVEST)         ' +
        '          AND'
      ''
      
        '                (TF.IDTIPOFUNDOINVEST  = :IDTIPOFUNDOINVEST)    ' +
        '          AND'
      ''
      
        '                (((:IDFUNDOINVEST IS NOT NULL)                  ' +
        '          AND'
      
        '                (HF2.IDFUNDOINVEST = :IDFUNDOINVEST))           ' +
        '          OR'
      
        '                  (:IDFUNDOINVEST IS NULL) )                    ' +
        '          AND'
      ''
      
        '                (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAPEDIDO,'#39'D' +
        'D/MM/YYYY'#39')+1) AND'
      ''
      '                (HF2.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      ''
      
        '              GROUP BY HF2.IDFUNDOINVEST, HF2.IDTIPOFUNDOINVEST)' +
        ' ) ) FI,'
      ''
      '       VWPLANPREVCTBPATR VW'
      'WHERE'
      '   PF.IDTIPOINVEST      = :IDTIPOINVEST           AND'
      ''
      
        '  (((:IDPLANPREVCTBPATR IS NULL)     AND (PF.IDPLANPREVCTBPATR >' +
        ' 0)) OR'
      
        '   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (PF.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR)))  AND'
      ''
      '  (((:IDFUNDOINVEST IS NULL)     AND (PF.IDFUNDOINVEST > 0)) OR'
      
        '   ((:IDFUNDOINVEST IS NOT NULL) AND (PF.IDFUNDOINVEST = :IDFUND' +
        'OINVEST)))  AND'
      ''
      '   PF.DATAPEDIDO        = TO_DATE(:DATAPEDIDO,'#39'DD/MM/YYYY'#39') AND'
      ''
      '  (((:IDTIPOCOTA IS NOT NULL)                     AND'
      '  (PF.IDTIPOCOTA         = :IDTIPOCOTA))          OR'
      '    (:IDTIPOCOTA IS NULL))                        AND'
      ''
      '   PF.DATAPEDIDO        = PF.DATACOTIZACAO        AND    '
      ''
      '   FI.IDFUNDOINVEST     = PF.IDFUNDOINVEST        AND'
      '   '
      '   TP.IDTIPOINVEST      = PF.IDTIPOINVEST         AND'
      '   TP.IDTIPOOPERACAO    = PF.IDTIPOOPERACAO       AND'
      '   TP.TIPOMOVTO         <> '#39'BLQ'#39'                  AND'
      ''
      '   PF.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR'
      ' '
      'ORDER BY PF.IDPLANPREVCTBPATR, PF.IDPEDIDOFUNDO'
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryPesqAplicMesmoDia: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      
        'IDHISTFUNDO,CODDOCUMENTO,PLNCODIGO,PLANO,IDTIPOINVEST,IDTIPOOPER' +
        'ACAO,IDCARTEIRAINVEST,IDFUNDOINVEST,'
      
        'DATAAPLICACAO,DATAMOVFUNDO,HISTMOVFUNDO,NATURMOVFUNDO,TIPMOVFUND' +
        'O,VLRAPLICADO,VLRIRPROV,VLRIOFPROV,'
      
        'VLRVARIACAO,COTASMOVFUNDO,VLRMOVFUNDO,FLGCALCSALDO,SALDOQTDCOTAS' +
        ',SALDOVLRFUNDO,IDOPERACAOFUNDO,'
      
        'DATAULTPGTOIR,COTAAPLICACAO,IDPLANPREVCTBPATR,IDOPERACAOINVEST,V' +
        'LRCUSTOATUAL,IDCOMPOSICAOFUNDO,'
      'DTACOTA,VLRCOTA,IDTIPOCOTA,SALDOQTDCOTASBLQ, COTAAPLICACAO'
      ''
      'FROM HISTFUNDO'
      ''
      'WHERE  IDTIPOINVEST      = :IDTIPOINVEST'
      '   AND IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '   AND IDFUNDOINVEST     = :IDFUNDOINVEST'
      '   AND DATAAPLICACAO     = :DATAAPLICACAO'
      '   AND DATAMOVFUNDO      = :DATAMOVFUNDO'
      
        '   AND (((:IDTIPOCOTA IS NOT NULL) AND (IDTIPOCOTA = :IDTIPOCOTA' +
        ')) OR'
      '         (:IDTIPOCOTA IS NULL))'
      '   AND NOT (TIPMOVFUNDO  = '#39'ATU'#39')'
      '   AND IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '   AND NATURMOVFUNDO     = :NATURMOVFUNDO   '
      'ORDER BY IDHISTFUNDO')
    ValidateWithMask = True
    Left = 48
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATURMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryUpdOperacaoFundoFinanc: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET PLANO = NULL, CODDOCUMENTO = NULL'
      'WHERE'
      '     IDTIPOINVEST      =:IDTIPOINVEST        AND'
      '     IDFUNDOINVEST     > 0                   AND'
      '     IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR   AND'
      '     DATAOPERACAO      =TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AND'
      '     CODDOCUMENTO      =:CODDOCUMENTO')
    ValidateWithMask = True
    Left = 48
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object QryBuscaTransfUnif: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FI.IDCARTEIRAINVEST,'
      '   HF.IDTIPOINVEST,'
      '   HF.IDPLANPREVCTBPATR,'
      '   HF.IDFUNDOINVEST,'
      '   HF.DATAAPLICACAO,'
      '   HF.DATAMOVFUNDO,'
      '   HF.IDTIPOCOTA,'
      '   HF.TIPMOVFUNDO,'
      '   HF.NATURMOVFUNDO'
      ''
      'FROM HISTFUNDO HF,'
      
        '      (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.IDCA' +
        'RTEIRAINVEST'
      '       FROM   HISTFUNDOINVEST HF1'
      
        '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/M' +
        'M/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIG' +
        'ENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF'
      '              WHERE'
      
        '                  (TF.IDTIPOINVEST       = :IDTIPOINVEST)       ' +
        '            AND'
      ''
      
        '                  (((:IDTIPOFUNDOINVEST IS NOT NULL)            ' +
        '            AND'
      
        '                  (TF.IDTIPOFUNDOINVEST  = :IDTIPOFUNDOINVEST)) ' +
        '            OR'
      
        '                    (:IDTIPOFUNDOINVEST IS NULL) )              ' +
        '            AND'
      ''
      
        '                  (((:IDFUNDOINVEST IS NOT NULL)                ' +
        '            AND'
      
        '                 (HF2.IDFUNDOINVEST = :IDFUNDOINVEST))          ' +
        '           OR'
      
        '                    (:IDFUNDOINVEST IS NULL) )                  ' +
        '            AND'
      ''
      
        '                 (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAMOVFUNDO' +
        ','#39'DD/MM/YYYY'#39')+1) AND'
      ''
      '                 (HF2.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      ''
      
        '              GROUP BY HF2.IDFUNDOINVEST, HF2.IDTIPOFUNDOINVEST)' +
        ' ) ) FI'
      'WHERE'
      ''
      '   HF.IDTIPOINVEST      = :IDTIPOINVEST            AND'
      ''
      
        '  (((:IDPLANPREVCTBPATR IS NULL)     AND (HF.IDPLANPREVCTBPATR >' +
        ' 0)) OR'
      
        '   ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HF.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))) AND'
      ''
      '  (((:IDFUNDOINVEST IS NULL)     AND (HF.IDFUNDOINVEST > 0)) OR'
      
        '   ((:IDFUNDOINVEST IS NOT NULL) AND (HF.IDFUNDOINVEST = :IDFUND' +
        'OINVEST))) AND'
      ''
      
        '   HF.DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39') AN' +
        'D'
      ''
      '  (((:IDTIPOCOTA IS NOT NULL)                     AND'
      '  (HF.IDTIPOCOTA         = :IDTIPOCOTA))          OR'
      '    (:IDTIPOCOTA IS NULL))                        AND'
      ''
      '   HF.IDTIPOOPERACAO    = -108                    AND'
      ''
      '   HF.IDFUNDOINVEST     = FI.IDFUNDOINVEST'
      ''
      
        'GROUP BY FI.IDCARTEIRAINVEST, HF.IDTIPOINVEST, HF.IDPLANPREVCTBP' +
        'ATR, HF.IDFUNDOINVEST, HF.DATAAPLICACAO,'
      
        '         HF.DATAMOVFUNDO, HF.IDTIPOCOTA, HF.TIPMOVFUNDO, HF.NATU' +
        'RMOVFUNDO')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 48
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryDelResgOperCotizarRetr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERACAOFUNDO'
      'WHERE'
      '       (IDPEDIDOFUNDO IN (SELECT IDPEDIDOFUNDO'
      '                         FROM    PEDIDOFUNDO'
      '                         WHERE'
      
        '                                 IDTIPOINVEST      =:IDTIPOINVES' +
        'T         AND'
      ''
      
        '                             (((:IDPLANPREVCTBPATR IS NULL)     ' +
        'AND (IDPLANPREVCTBPATR > 0)) OR'
      
        '                              ((:IDPLANPREVCTBPATR IS NOT NULL) ' +
        'AND (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))) AND'
      ''
      
        '                                 IDFUNDOINVEST     =:IDFUNDOINVE' +
        'ST        AND'
      ''
      
        '                                 DATACOTIZACAO    >=:DATAPEDIDO ' +
        '          AND'
      
        '                             (((:IDTIPOCOTA IS NOT NULL)        ' +
        '          AND'
      
        '                                (IDTIPOCOTA         = :IDTIPOCOT' +
        'A))       OR'
      '                               (:IDTIPOCOTA IS NULL)) ) )'
      'AND  (IDTIPOOPERACAO <> -177)                                '
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryDelOperInvXoperFdo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERINVXOPERFDO'
      'WHERE'
      
        '       IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOF' +
        'UNDO'
      '                           WHERE'
      
        '                          (IDPEDIDOFUNDO IN (SELECT IDPEDIDOFUND' +
        'O'
      '                                            FROM    PEDIDOFUNDO'
      '                                            WHERE'
      
        '                                                    IDTIPOINVEST' +
        '      =:IDTIPOINVEST         AND'
      ''
      
        '                                                (((:IDPLANPREVCT' +
        'BPATR IS NULL)     AND (IDPLANPREVCTBPATR > 0)) OR'
      
        '                                                 ((:IDPLANPREVCT' +
        'BPATR IS NOT NULL) AND (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))' +
        ') AND'
      ''
      
        '                                                    IDFUNDOINVES' +
        'T     =:IDFUNDOINVEST        AND'
      ''
      
        '                                                    DATAPEDIDO  ' +
        '     >=:DATAPEDIDO           AND'
      
        '                                                (((:IDTIPOCOTA I' +
        'S NOT NULL)                  AND'
      
        '                                                   (IDTIPOCOTA  ' +
        '       = :IDTIPOCOTA))       OR'
      
        '                                                  (:IDTIPOCOTA I' +
        'S NULL)) ) ) )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryMontaMascaraDecQtdHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT    IDFUNDOINVEST,QTDDECQTD, QTDDECVALOR'
      'FROM HISTFUNDOINVEST'
      
        'WHERE DTAVIGENCIA  < TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') +1  AND' +
        ' '
      '               IDFUNDOINVEST =  :IDFUNDOINVEST'
      'GROUP BY IDFUNDOINVEST,QTDDECQTD, QTDDECVALOR'
      ''
      ' ')
    ValidateWithMask = True
    Left = 130
    Top = 492
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryMontaMascaraDecQtdHistIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object QryMontaMascaraDecQtdHistQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
    end
    object QryMontaMascaraDecQtdHistQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
    end
  end
  object QryBuscaTransfFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       O.DATAOPERACAO,'
      '       H.DATAAPLICACAO,'
      '       O.IDOPERACAOFUNDO AS IDOPERACAOFUNDO_O,'
      '       O.IDOPERACAOORIGEM AS IDOPERACAOORIGEM_O,'
      
        '       DECODE(O.IDTIPOOPERACAO,-42,DECODE(O.IDTIPOINVEST,5,-39, ' +
        '6,-41), O.IDTIPOOPERACAO) AS IDTIPOOPERACAO_O ,'
      '       TPO.DESCTIPOOPERACAO AS DESCTIPOOPERACAO_O,'
      '       TPO.NATUREZAOPERACAO AS NATUREZAOPERACAO_O,'
      '       O.IDFUNDOINVEST AS IDFUNDOINVEST_O,'
      '       FIO.QTDDECVALOR AS QTDDECVALOR_O,'
      '       FIO.IDCARTEIRAINVEST AS IDCARTEIRAINVEST_O,'
      '       O.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR_O,'
      '       PLO.PLANPRVCONTABPATRO AS PLANPRVCONTABPATRO_O,'
      '       PLO.IDPLANOPREV AS IDPLANOPREV_O,'
      '       PLO.IDPATRO AS IDPATRO_O,'
      '       O.VLROPERACAO AS VLROPERACAO_O,'
      '       O.QTDOPERACAO AS QTDOPERACAO_O,'
      '       O.VLRCOTA AS VLRCOTA_O,'
      '       FIO.DESCFUNDOINVEST AS DESCFUNDOINVEST_O,'
      '       D.IDOPERACAOFUNDO AS IDOPERACAOFUNDO_D,'
      '       D.IDTIPOOPERACAO AS IDTIPOOPERACAO_D,'
      '       TPD.DESCTIPOOPERACAO AS DESCTIPOOPERACAO_D,'
      '       TPD.NATUREZAOPERACAO AS NATUREZAOPERACAO_D,'
      '       D.IDOPERACAOORIGEM AS IDOPERACAOORIGEM_D,'
      '       D.IDFUNDOINVEST AS IDFUNDOINVEST_D,'
      '       FID.QTDDECVALOR AS QTDDECVALOR_D,'
      '       FID.IDCARTEIRAINVEST AS IDCARTEIRAINVEST_D,'
      '       D.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR_D,'
      '       PLD.PLANPRVCONTABPATRO AS PLANPRVCONTABPATRO_D,'
      '       PLD.IDPLANOPREV AS IDPLANOPREV_D,'
      '       PLD.IDPATRO AS IDPATRO_D,'
      '       D.VLROPERACAO AS VLROPERACAO_D,'
      '       D.QTDOPERACAO AS QTDOPERACAO_D,'
      '       D.VLRCOTA AS VLRCOTA_D,'
      '       FID.DESCFUNDOINVEST AS DESCFUNDOINVEST_D'
      ''
      
        'FROM OPERACAOFUNDO O, OPERACAOFUNDO D, HISTFUNDO H, VWPLANPREVCT' +
        'BPATR PLO,VWPLANPREVCTBPATR PLD,'
      
        '     (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.IDCAR' +
        'TEIRAINVEST,HF1.QTDDECVALOR,HF1.DESCFUNDOINVEST'
      '       FROM   HISTFUNDOINVEST HF1'
      
        '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/M' +
        'M/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIG' +
        'ENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF'
      '              WHERE'
      
        '                  (TF.IDTIPOINVEST       = :IDTIPOINVEST)       ' +
        '            AND'
      ''
      
        '                  (((:IDTIPOFUNDOINVEST IS NOT NULL)            ' +
        '            AND'
      
        '                  (TF.IDTIPOFUNDOINVEST  = :IDTIPOFUNDOINVEST)) ' +
        '            OR'
      
        '                    (:IDTIPOFUNDOINVEST IS NULL) )              ' +
        '            AND'
      ''
      
        '                 (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAOPERACAO' +
        ','#39'DD/MM/YYYY'#39')+1) AND'
      ''
      '                 (HF2.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      ''
      
        '              GROUP BY HF2.IDFUNDOINVEST, HF2.IDTIPOFUNDOINVEST)' +
        ' ) ) FIO,'
      ''
      
        '      (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.IDCA' +
        'RTEIRAINVEST,HF1.QTDDECVALOR,HF1.DESCFUNDOINVEST'
      '       FROM   HISTFUNDOINVEST HF1'
      
        '       WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/M' +
        'M/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIG' +
        'ENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF'
      '              WHERE'
      
        '                  (TF.IDTIPOINVEST       = :IDTIPOINVEST)       ' +
        '            AND'
      ''
      
        '                  (((:IDTIPOFUNDOINVEST IS NOT NULL)            ' +
        '            AND'
      
        '                  (TF.IDTIPOFUNDOINVEST  = :IDTIPOFUNDOINVEST)) ' +
        '            OR'
      
        '                    (:IDTIPOFUNDOINVEST IS NULL) )              ' +
        '            AND'
      ''
      
        '                 (TRUNC(HF2.DTAVIGENCIA) < TO_DATE(:DATAOPERACAO' +
        ','#39'DD/MM/YYYY'#39')+1) AND'
      ''
      '                 (HF2.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      ''
      
        '              GROUP BY HF2.IDFUNDOINVEST, HF2.IDTIPOFUNDOINVEST)' +
        ' ) ) FID,'
      '     TIPOOPERACAO TPO,TIPOOPERACAO TPD'
      ''
      'WHERE'
      '    O.IDTIPOINVEST = :IDTIPOINVEST'
      'AND O.IDTIPOOPERACAO IN (-40,-42,-39,-38,-40)'
      'AND O.DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      ''
      
        'AND( ((:IDFUNDOINVEST IS NOT NULL) AND (O.IDFUNDOINVEST = :IDFUN' +
        'DOINVEST)) OR  ((:IDFUNDOINVEST IS NOT NULL) AND (D.IDFUNDOINVES' +
        'T = :IDFUNDOINVEST)) )'
      ''
      'AND D.IDOPERACAOORIGEM   = O.IDOPERACAOFUNDO'
      'AND H.IDFUNDOINVEST = O.IDFUNDOINVEST'
      'AND H.IDOPERACAOFUNDO = O.IDOPERACAOORIGEM'
      'AND O.IDPLANPREVCTBPATR = PLO.IDPLANPREVCTBPATR'
      'AND D.IDPLANPREVCTBPATR = PLD.IDPLANPREVCTBPATR'
      'AND O.IDTIPOOPERACAO = TPO.IDTIPOOPERACAO'
      'AND D.IDTIPOOPERACAO = TPD.IDTIPOOPERACAO'
      'AND O.IDFUNDOINVEST = FIO.IDFUNDOINVEST'
      'AND D.IDFUNDOINVEST = FID.IDFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 390
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryVerificaHaTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOFUNDO,IDTIPOOPERACAO'
      'FROM OPERACAOFUNDO '
      'WHERE  IDTIPOINVEST = :IDTIPOINVEST'
      '       AND IDTIPOOPERACAO IN (-40,-42,-39,-38)'
      '       AND DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      
        '       AND( ((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST = :' +
        'IDFUNDOINVEST)) )'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 328
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryVerTransfPlanosLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OPERACAOFUNDO.IDLOTE'
      'FROM OPERACAOFUNDO '
      'WHERE'
      '     OPERACAOFUNDO.IDTIPOINVEST = :IDTIPOINVEST'
      'AND  OPERACAOFUNDO.IDPLANPREVCTBPATR > 0'
      
        'AND ( ((:IDFUNDOINVEST IS NOT NULL) AND (OPERACAOFUNDO.IDFUNDOIN' +
        'VEST = :IDFUNDOINVEST)) )'
      
        'AND  OPERACAOFUNDO.DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/Y' +
        'YYY'#39')'
      'AND  OPERACAOFUNDO.IDTIPOOPERACAO IN (-107,-108)'
      
        'AND ( ((:IDTIPOCOTA IS NULL) OR (OPERACAOFUNDO.IDTIPOCOTA = :IDT' +
        'IPOCOTA)) )'
      'GROUP BY OPERACAOFUNDO.IDLOTE'
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 456
    Top = 491
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryBuscaTransfTipoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      OP.IDTIPOINVEST,'
      '      OP.IDTIPOOPERACAO,'
      '      OP.IDCARTEIRAINVEST,'
      '      OP.IDFUNDOINVEST,'
      '      OP.IDOPERACAOFUNDO,'
      '      OP.IDOPERACAOORIGEM,'
      '      OP.QTDOPERACAO,'
      '      OP.VLROPERACAO,'
      '      OP.IDPLANPREVCTBPATR,'
      '      H.DATAAPLICACAO,'
      '      FI.DESCFUNDOINVEST, FI.QTDDECVALOR, FI.IDTIPOFUNDOINVEST,'
      '      TP.NATUREZAOPERACAO, TP.DESCTIPOOPERACAO'
      'FROM OPERACAOFUNDO OP, HISTFUNDO H,'
      '    (SELECT'
      
        '         HF.QTDDECVALOR, HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST,' +
        ' HF.DESCFUNDOINVEST'
      '    FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      
        '    WHERE (HF.IDFUNDOINVEST || TO_CHAR(HF.DTAVIGENCIA,'#39'DD/MM/YYY' +
        'Y, HH24:MI:SS'#39') IN'
      
        '          (SELECT HF1.IDFUNDOINVEST || TO_CHAR(MAX(HF1.DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TF1'
      '           WHERE'
      '               (TF1.IDTIPOINVEST  = :IDTIPOINVEST)   AND'
      '               (HF1.IDFUNDOINVEST = :IDFUNDOINVEST)  AND'
      
        '               (TRUNC(HF1.DTAVIGENCIA) < TO_DATE(:DATAOPERACAO,'#39 +
        'DD/MM/YYYY'#39')+1) AND'
      '               (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST)'
      '           GROUP BY HF1.IDFUNDOINVEST)) AND'
      '          (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)) FI,'
      '    TIPOOPERACAO TP         '
      'WHERE'
      '    (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      'AND (OP.IDPLANPREVCTBPATR > 0)'
      'AND (OP.IDFUNDOINVEST  = :IDFUNDOINVEST)'
      'AND (OP.DATAOPERACAO   = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39'))'
      'AND (OP.IDTIPOOPERACAO = -160)'
      'AND ( ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA)) )'
      'AND (FI.IDFUNDOINVEST  = OP.IDFUNDOINVEST)'
      'AND (TP.IDTIPOINVEST   = OP.IDTIPOINVEST)'
      'AND (TP.IDTIPOOPERACAO = OP.IDTIPOOPERACAO)'
      'AND (OP.DATAOPERACAO   = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39'))'
      'AND (H.IDOPERACAOFUNDO = OP.IDOPERACAOORIGEM)'
      'AND (H.DATAMOVFUNDO    = OP.DATAOPERACAO)'
      'ORDER BY OP.IDOPERACAOFUNDO'
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 392
    Top = 538
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryAjustaAplicIntegr: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      
        '    HC.IDHISTCOTAINTEGR,  HC.IDTIPOINVEST, HC.IDFUNDOINVEST, HC.' +
        'IDTIPOCOTA,'
      '    HC.IDOPERACAOFUNDO,   HC.IDPLANPREVCTBPATR,'
      '    HC.DATAAPLICACAO,     HC.DATAHISTCOTAINTEG,'
      
        '    HC.VLRHISTCOTAINTEGR, HC.QTDHISTCOTAINTEGR, HC.VLRCOTAINTEGR' +
        ','
      '    HC.VLRVARIACAODIA,    HC.QTDMOVCOTAINTEGR,'
      '    HC.TIPMOVCOTAINTEGR'
      'FROM'
      '    HISTCOTAINTEGRALIZA HC,'
      '        (SELECT MAX(H2.IDHISTCOTAINTEGR) AS IDHISTCOTAINTEGR'
      '         FROM   HISTCOTAINTEGRALIZA  H2'
      'WHERE'
      
        '                  (H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDF' +
        'UNDOINVEST||H2.DATAAPLICACAO||H2.DATAHISTCOTAINTEG||H2.IDTIPOCOT' +
        'A IN'
      
        '          (SELECT  HI.IDTIPOINVEST||HI.IDPLANPREVCTBPATR||HI.IDF' +
        'UNDOINVEST||HI.DATAAPLICACAO||MAX(HI.DATAHISTCOTAINTEG)||HI.IDTI' +
        'POCOTA'
      '           FROM HISTCOTAINTEGRALIZA HI'
      '           WHERE'
      '                   (HI.IDTIPOINVEST       = :IDTIPOINVEST)'
      ''
      '             AND   (HI.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)'
      ''
      '             AND   (HI.IDFUNDOINVEST      = :IDFUNDOINVEST)'
      ''
      
        '             AND   (HI.DATAAPLICACAO      = TO_DATE(:DATAAPLICAC' +
        'AO,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '             AND   (HI.DATAHISTCOTAINTEG <= TO_DATE(:DATAHISTCOT' +
        'AINTEG,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '             AND   (((:IDTIPOCOTA IS NOT NULL)      AND (HI.IDTI' +
        'POCOTA     = :IDTIPOCOTA)) OR'
      '      (:IDTIPOCOTA IS NULL))'
      ' '
      
        '             AND (((HI.IDTIPOINVEST IN (9,10))      AND (HI.IDTI' +
        'POCOTA > 0)) OR'
      
        '                  ((HI.IDTIPOINVEST NOT IN (9,10))  AND (HI.IDTI' +
        'POCOTA IS NULL)))'
      ''
      '             AND   (HI.TIPMOVCOTAINTEGR   = '#39'ATU'#39')'
      ' '
      
        '          GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDF' +
        'UNDOINVEST,'
      '                   HI.DATAAPLICACAO, HI.IDTIPOCOTA) )'
      ''
      
        '          AND   (H2.TIPMOVCOTAINTEGR   = '#39'ATU'#39')                 ' +
        '  '
      
        '        GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUN' +
        'DOINVEST,'
      
        '                 H2.DATAAPLICACAO, H2.DATAHISTCOTAINTEG, H2.IDTI' +
        'POCOTA) H3'
      'WHERE'
      '      (HC.IDHISTCOTAINTEGR  = H3.IDHISTCOTAINTEGR)'
      '  AND (HC.QTDHISTCOTAINTEGR > 0)'
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 538
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object QryBuscaSaldoCotaIntegr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     SUM(H1.QTDHISTCOTAINTEGR) AS SALDOQTDCOTAS,'
      '     SUM(H1.VLRHISTCOTAINTEGR) AS SALDOVLRFUNDO,'
      '     H1.VLRCOTAINTEGR,'
      '     H1.DATAAPLICACAO,'
      '     H1.VLRVARIACAODIA'
      ''
      'FROM HISTCOTAINTEGRALIZA H1,'
      '        (SELECT MAX(H2.IDHISTCOTAINTEGR) AS IDHISTCOTAINTEGR'
      '         FROM   HISTCOTAINTEGRALIZA  H2'
      '         WHERE'
      
        '                  (H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDF' +
        'UNDOINVEST||H2.DATAAPLICACAO||H2.DATAHISTCOTAINTEG||H2.IDTIPOCOT' +
        'A IN'
      
        '          (SELECT  HI.IDTIPOINVEST||HI.IDPLANPREVCTBPATR||HI.IDF' +
        'UNDOINVEST||HI.DATAAPLICACAO||MAX(HI.DATAHISTCOTAINTEG)||HI.IDTI' +
        'POCOTA'
      '           FROM HISTCOTAINTEGRALIZA HI'
      '           WHERE'
      '                   (HI.IDTIPOINVEST       = :IDTIPOINVEST)'
      ''
      '             AND   (HI.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)'
      ''
      '             AND   (HI.IDFUNDOINVEST      = :IDFUNDOINVEST)'
      ''
      
        '             AND   (((:DATAAPLICACAO IS NULL) AND  (HI.DATAAPLIC' +
        'ACAO < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39'))) OR'
      
        '                   (HI.DATAAPLICACAO      = TO_DATE(:DATAAPLICAC' +
        'AO,'#39'DD/MM/YYYY'#39')))'
      ''
      
        '             AND   (HI.DATAHISTCOTAINTEG <= TO_DATE(:DATAMOVFUND' +
        'O,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '             AND   (((:IDTIPOCOTA IS NOT NULL)      AND (HI.IDTI' +
        'POCOTA     = :IDTIPOCOTA)) OR'
      '                     (:IDTIPOCOTA IS NULL))'
      ''
      
        '             AND (((HI.IDTIPOINVEST IN (9,10))      AND (HI.IDTI' +
        'POCOTA > 0)) OR'
      
        '                  ((HI.IDTIPOINVEST NOT IN (9,10))  AND (HI.IDTI' +
        'POCOTA IS NULL)))'
      ''
      
        '           AND   (((:IDOPERACAOFUNDO IS NOT NULL)   AND (Hi.IDOP' +
        'ERACAOFUNDO     = :IDOPERACAOFUNDO)) OR'
      '                   (:IDOPERACAOFUNDO IS NULL))'
      ''
      
        '          GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDF' +
        'UNDOINVEST,'
      '                   HI.DATAAPLICACAO, HI.IDTIPOCOTA) )'
      ''
      
        '        GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUN' +
        'DOINVEST,'
      
        '                 H2.DATAAPLICACAO, H2.DATAHISTCOTAINTEG, H2.IDTI' +
        'POCOTA) H3'
      'WHERE'
      '      (H1.IDHISTCOTAINTEGR = H3.IDHISTCOTAINTEGR)'
      '  AND (H1.QTDHISTCOTAINTEGR > 0)'
      'GROUP BY H1.VLRCOTAINTEGR, H1.DATAAPLICACAO, H1.VLRVARIACAODIA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 538
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryBuscaTransfCotaIntegr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      OP.IDTIPOINVEST,'
      '      OP.IDTIPOOPERACAO,'
      '      OP.IDCARTEIRAINVEST,'
      '      OP.IDFUNDOINVEST,'
      '      OP.IDOPERACAOFUNDO,'
      '      OP.IDOPERACAOORIGEM,'
      '      OP.QTDOPERACAO,'
      '      OP.VLROPERACAO,'
      '      OP.VLRCOTA,'
      '      OP.IDPLANPREVCTBPATR'
      'FROM OPERACAOFUNDO OP'
      'WHERE'
      '     (OP.IDTIPOINVEST   = :IDTIPOINVEST)'
      'AND  (OP.IDPLANPREVCTBPATR > 0)'
      'AND  (OP.IDFUNDOINVEST  = :IDFUNDOINVEST)'
      'AND  (OP.DATAOPERACAO   = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39'))'
      
        'AND ((OP.IDTIPOOPERACAO = -165) OR (OP.IDTIPOOPERACAO = -173) OR' +
        ' (OP.IDTIPOOPERACAO = -191) OR (OP.IDTIPOOPERACAO = -190))'
      'AND ( ((:IDTIPOCOTA IS NULL) OR (OP.IDTIPOCOTA = :IDTIPOCOTA)) )'
      'ORDER BY OP.IDOPERACAOFUNDO'
      ' '
      ' ')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 204
    Top = 538
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
end
