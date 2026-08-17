object DMRendaVariavel: TDMRendaVariavel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 42
  Top = 44
  Height = 645
  Width = 1156
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 574
    Top = 192
  end
  object qryMarcaFlagReprocMenor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV'
      'SET HISTCARTINV.FLGCALCSALDO = '#39'5'#39
      'WHERE (HISTCARTINV.IDHISTCARTINV  IN'
      '           (SELECT MAX(H2.IDHISTCARTINV)'
      '            FROM HISTCARTINV H2'
      '            WHERE'
      
        '                  ((H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.ID' +
        'CARTEIRAINVEST, H2.IDINVESTIMENTO, H2.DATAMOVCARTINV) IN'
      
        '                          (SELECT H3.IDTIPOINVEST, H3.IDPLANPREV' +
        'CTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO, MAX(H3.DATAMOVC' +
        'ARTINV)'
      '                           FROM HISTCARTINV H3'
      '                           WHERE (H3.IDTIPOINVEST = 2)'
      
        '                             AND ((:IDPLANPREVCTBPATR IS NULL) O' +
        'R (H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                             AND ((:IDCARTEIRAINVEST IS NULL) OR' +
        ' (H3.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      
        '                             AND ((:IDINVESTIMENTO IS NULL) OR (' +
        'H3.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                             AND (H3.DATAMOVCARTINV < TO_DATE(:D' +
        'ATAATU,'#39'DD/MM/YYYY'#39') )'
      '                             AND (H3.IDCARTEIRAGERENC IS NULL)'
      
        '                           GROUP BY H3.IDTIPOINVEST, H3.IDPLANPR' +
        'EVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO))'
      '              AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '            GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.I' +
        'DCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.DATAMOVCARTINV))'
      
        '  AND ((NVL(HISTCARTINV.SALDOQTDEINVCART,0) > 0) OR ((NVL(HISTCA' +
        'RTINV.SALDOQTDEINVCART,0) = 0) AND (HISTCARTINV.TIPMOVCARTINV IN' +
        ' ('#39'INI'#39','#39'REP'#39'))))'
      
        '  AND (HISTCARTINV.DATAMOVCARTINV >= LEAST(TO_DATE('#39'31/12/2003'#39',' +
        #39'DD/MM/YYYY'#39'), TO_DATE(:DATAATU,'#39'DD/MM/YYYY'#39')))')
    ValidateWithMask = True
    Left = 56
    Top = 52
    ParamData = <
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptInput
      end>
  end
  object qryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BOLETA.PLANO, BOLETA.PLNCODIGO, BOLETA.CODDOCUMENTO, BOLE' +
        'TA.DATABOLETA, BOLETA.TIPMOVBOLETA'
      'FROM   BOLETA'
      'WHERE  BOLETA.IDBOLETA = :IDBOLETA'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end>
    object qryBoletaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBoletaPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBoletaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBoletaDATABOLETA: TDateTimeField
      FieldName = 'DATABOLETA'
      Origin = 'BASEDADOS.BOLETA.DATABOLETA'
    end
    object qryBoletaTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Origin = 'BASEDADOS.BOLETA.TIPMOVBOLETA'
      Size = 3
    end
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 574
    Top = 285
  end
  object qryBuscaHistDelecao: TwwQuery
    BeforeOpen = qryBuscaHistDelecaoBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HI.IDHISTCARTINV, HI.DATAMOVCARTINV, HI.TIPMOVCARTINV,'
      
        '       DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.PLANO, BO.PLANO) AS PLA' +
        'NO,'
      
        '       DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.PLNCODIGO, BO.PLNCODIGO' +
        ') AS PLNCODIGO,'
      
        '       HI.IDCARTEIRAGERENC, HI.IDCARTEIRAINVEST, HI.IDOPERACAOIN' +
        'VEST,'
      
        '       OC.IDOPERCUSTODIA, BO.IDBOLETA, HI.FLGCALCSALDO, BO.TIPMO' +
        'VBOLETA, OI.IDOPERACAODIREITO,'
      '       HI.IDINVESTIMENTO, HI.IDPLANPREVCTBPATR'
      
        'FROM HISTCARTINV HI, OPERACAOINVEST OI, BOLETA BO, OPERCUSTODIA ' +
        'OC'
      'WHERE'
      '     (HI.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR) OR (HI.IDPLANPREVCTBPATR IS NULL))'
      
        '  AND ((:IDCARTEIRAINVEST  IS NULL) OR (HI.IDCARTEIRAINVEST  = :' +
        'IDCARTEIRAINVEST))'
      
        '  AND ((:IDINVESTIMENTO    IS NULL) OR (HI.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ( (HI.DATAMOVCARTINV > TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY' +
        #39')) OR'
      
        '        ((TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39') = TO_DATE(:DATAI' +
        'NI,'#39'DD/MM/YYYY'#39')) AND'
      
        '         (HI.DATAMOVCARTINV = TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) ) ' +
        ')'
      
        '  AND ((:IDCARTEIRAGERENC  IS NULL) OR (HI.IDCARTEIRAGERENC  = :' +
        'IDCARTEIRAGERENC))'
      
        '  AND ((:IDHISTCARTINV     IS NULL) OR (HI.IDHISTCARTINV > :IDHI' +
        'STCARTINV))'
      '  AND (HI.TIPMOVCARTINV   <> '#39'TRC'#39')'
      ''
      '  AND (HI.IDINVESTIMENTO = OI.IDINVESTIMENTO(+))'
      '  AND (HI.IDOPERACAOINVEST = OI.IDOPERACAOINVEST(+))'
      ''
      
        '  AND ((OI.IDOPERCUSTODIA = OC.IDOPERCUSTODIA) OR (OC.IDOPERCUST' +
        'ODIA IS NULL))'
      ''
      '  AND ('
      
        '       ((OC.IDTIPOOPERORIG IS NULL) OR (OI.IDTIPOOPERACAO = OC.I' +
        'DTIPOOPERORIG))'
      '       OR '
      
        '       ((OC.IDTIPOOPERDEST IS NULL) OR (OI.IDTIPOOPERACAO = OC.I' +
        'DTIPOOPERDEST))'
      '      )'
      '  AND (OI.NUMDOCUMENTO     = BO.IDBOLETA(+))'
      '  AND (OC.IDBOLETA(+)      = BO.IDBOLETA)'
      ''
      'UNION'
      ''
      'SELECT HI.IDHISTCARTINV, HI.DATAMOVCARTINV, HI.TIPMOVCARTINV,'
      
        '       DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.PLANO, BO.PLANO) AS PLA' +
        'NO,'
      
        '       DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.PLNCODIGO, BO.PLNCODIGO' +
        ') AS PLNCODIGO,'
      
        '       HI.IDCARTEIRAGERENC, HI.IDCARTEIRAINVEST, HI.IDOPERACAOIN' +
        'VEST,'
      
        '       OC.IDOPERCUSTODIA, BO.IDBOLETA, HI.FLGCALCSALDO, BO.TIPMO' +
        'VBOLETA, NULL AS IDOPERACAODIREITO,'
      '       HI.IDINVESTIMENTO, HI.IDPLANPREVCTBPATR'
      'FROM HISTCARTINV HI, OPERCUSTODIA OC, BOLETA BO,'
      '     (SELECT IDHISTCARTINV'
      '      FROM HISTCARTINV H2'
      '      WHERE'
      '           (H2.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR) OR (H2.IDPLANPREVCTBPATR IS NULL))'
      
        '        AND ((:IDCARTEIRAINVEST  IS NULL) OR (H2.IDCARTEIRAINVES' +
        'T  = :IDCARTEIRAINVEST))'
      
        '        AND ((:IDINVESTIMENTO    IS NULL) OR (H2.IDINVESTIMENTO ' +
        '   = :IDINVESTIMENTO))'
      
        '        AND (H2.DATAMOVCARTINV > TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '        AND ((:IDCARTEIRAGERENC  IS NULL) OR (H2.IDCARTEIRAGEREN' +
        'C  = :IDCARTEIRAGERENC))'
      
        '        AND ((:IDHISTCARTINV     IS NULL) OR (H2.IDHISTCARTINV >' +
        ' :IDHISTCARTINV))'
      '        AND (H2.TIPMOVCARTINV  = '#39'TRC'#39')) HT'
      ''
      'WHERE ((OC.IDHISTCARTINVORIG  = HT.IDHISTCARTINV) OR'
      '       (OC.IDHISTCARTINVDEST  = HT.IDHISTCARTINV))'
      '  AND ((OC.IDHISTCARTINVORIG  = HI.IDHISTCARTINV) OR'
      '       (OC.IDHISTCARTINVDEST  = HI.IDHISTCARTINV))'
      '  AND  (OC.IDBOLETA           = BO.IDBOLETA)'
      
        '  AND (((HI.IDCARTEIRAINVEST <> :IDCARTEIRAINVEST) AND (HI.FLGCA' +
        'LCSALDO IS NULL)) OR'
      '       (HI.IDCARTEIRAINVEST   = :IDCARTEIRAINVEST))'
      ''
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 56
    Top = 329
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end>
    object qryBuscaHistDelecaoIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaHistDelecaoDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryBuscaHistDelecaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaHistDelecaoPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBuscaHistDelecaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaHistDelecaoTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryBuscaHistDelecaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaHistDelecaoIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaHistDelecaoIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
    object qryBuscaHistDelecaoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaHistDelecaoFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaHistDelecaoTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Size = 3
    end
    object qryBuscaHistDelecaoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaHistDelecaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaHistDelecaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object qryLocalAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 574
    Top = 329
  end
  object qryUpdFinContBoleta: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET PLANO = DECODE(NVL(:PLNCODIGO,0), 0, PLANO, NULL),'
      '    PLNCODIGO = DECODE(NVL(:PLNCODIGO,0), 0, PLNCODIGO, NULL),'
      
        '    CODDOCUMENTO = DECODE(NVL(:CODDOCUMENTO,0), 0, CODDOCUMENTO,' +
        ' NULL)'
      'WHERE ('
      '       ('
      
        '        ((:PLNCODIGO IS NOT NULL) AND (:CODDOCUMENTO IS NOT NULL' +
        ')) '
      '         AND'
      
        '        ((PLNCODIGO = :PLNCODIGO) AND (CODDOCUMENTO = :CODDOCUME' +
        'NTO))'
      '       ) '
      '       OR'
      '       ('
      '        ((:PLNCODIGO IS NOT NULL) AND (:CODDOCUMENTO IS NULL))'
      '         AND'
      '        (PLNCODIGO = :PLNCODIGO)'
      '       ) '
      '       OR'
      '       ('
      '        ((:PLNCODIGO IS NULL) AND (:CODDOCUMENTO IS NOT NULL))'
      '         AND'
      '        (CODDOCUMENTO = :CODDOCUMENTO)'
      '       )'
      '      )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryHistPlnCodigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT H.PLANO, H.PLNCODIGO, H.CODDOCUMENTO'
      'FROM HISTCARTINV H, OPERACAOINVEST O, BOLETA B'
      'WHERE B.IDBOLETA = :IDBOLETA'
      '  AND B.IDBOLETA = O.NUMDOCUMENTO'
      '  AND O.IDOPERACAOINVEST = H.IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 252
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
    object qryHistPlnCodigoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.HISTCARTINV.PLANO'
    end
    object qryHistPlnCodigoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTCARTINV.PLNCODIGO'
    end
    object qryHistPlnCodigoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTCARTINV.CODDOCUMENTO'
    end
  end
  object qryOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   O.IDOPERACAOINVEST,'
      '   O.IDINVESTIMENTO,'
      '   O.IDCUSTODIANTE,'
      '   O.IDCARTEIRAINVEST,'
      '   O.IDCARTEIRAGERENC,'
      '   O.DATAOPERACAO,'
      '   O.IDPLANPREVCTBPATR,'
      '   B.CODDOCUMENTO,'
      '   O.IDOPERCUSTODIA,'
      '   O.IDOPERACAODIREITO,'
      '   B.TIPMOVBOLETA,'
      '   O.CODDOCUMENTO AS CODDOCUMOPER'
      'FROM'
      '   OPERACAOINVEST O, BOLETA B'
      'WHERE'
      '   O.NUMDOCUMENTO  = :NUMDOCUMENTO  AND'
      '   B.IDBOLETA      = O.NUMDOCUMENTO '
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
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptResult
      end>
    object qryOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object qryOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryOperacaoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
    end
    object qryOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryOperacaoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAGERENC'
    end
    object qryOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object qryOperacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDPLANPREVCTBPATR'
    end
    object qryOperacaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.BOLETA.CODDOCUMENTO'
    end
    object qryOperacaoIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERCUSTODIA'
    end
    object qryOperacaoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERACAODIREITO'
    end
    object qryOperacaoTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Origin = 'BASEDADOS.BOLETA.TIPMOVBOLETA'
      Size = 3
    end
    object qryOperacaoCODDOCUMOPER: TFloatField
      FieldName = 'CODDOCUMOPER'
      Origin = 'BASEDADOS.OPERACAOINVEST.CODDOCUMENTO'
    end
  end
  object qryBuscaBoletas: TwwQuery
    BeforeOpen = qryBuscaBoletasBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BO.IDBOLETA, BO.DATABOLETA, BO.TIPMOVBOLETA, BO.PLANO, BO' +
        '.PLNCODIGO, BO.CODDOCUMENTO,'
      
        '       DECODE(BO.TIPMOVBOLETA, '#39'TRP'#39', 0, DECODE(BO.TIPMOVBOLETA,' +
        #39'TPD'#39', 0, 1)) AS SEQ, BO.SEQBOLETA'
      
        'FROM (SELECT B.IDBOLETA, B.DATABOLETA, B.SEQBOLETA, B.TIPMOVBOLE' +
        'TA, B.PLANO, B.PLNCODIGO,'
      '             B.CODDOCUMENTO, B.STATUS'
      '      FROM   BOLETA B, OPERACAOINVEST O'
      
        '      WHERE  (B.DATABOLETA      = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39 +
        '))'
      '        AND (O.IDINVESTIMENTO   = :IDINVESTIMENTO)'
      '        AND (O.IDCARTEIRAINVEST = :IDCARTEIRAINVEST)'
      
        '        AND ((O.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) OR (B.TI' +
        'PMOVBOLETA = '#39'TRP'#39'))'
      '        AND (B.IDBOLETA         = O.NUMDOCUMENTO)'
      '      UNION'
      
        '      SELECT B.IDBOLETA, B.DATABOLETA, B.SEQBOLETA, B.TIPMOVBOLE' +
        'TA, B.PLANO, B.PLNCODIGO,'
      '             B.CODDOCUMENTO, B.STATUS'
      '      FROM   BOLETA B, OPERCUSTODIA O'
      
        '      WHERE  (B.DATABOLETA     = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')' +
        ')'
      '        AND (O.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '        AND ((O.IDCARTEIRAORIG = :IDCARTEIRAINVEST) OR'
      '             (O.IDCARTEIRADEST = :IDCARTEIRAINVEST) )'
      
        '        AND ((O.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) OR (B.TI' +
        'PMOVBOLETA = '#39'TRP'#39'))'
      '        AND  (B.IDBOLETA          = O.IDBOLETA)      ) BO'
      
        'WHERE ((BO.TIPMOVBOLETA = '#39'OPE'#39') AND (BO.STATUS = '#39'F'#39')) OR (BO.T' +
        'IPMOVBOLETA <> '#39'OPE'#39')'
      'ORDER BY SEQ, BO.SEQBOLETA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'DATABOLETA'
      Origin = 'BASEDADOS.BOLETA.DATABOLETA'
    end
    object qryBuscaBoletasIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletasSEQBOLETA: TFloatField
      FieldName = 'SEQBOLETA'
    end
    object qryBuscaBoletasTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Size = 3
    end
    object qryBuscaBoletasPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaBoletasPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBuscaBoletasCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object qryBuscaBoletaOPE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,     OP.IDCORRETVALORE' +
        'S,'
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,          OP.IDCARTEIRAINVE' +
        'ST,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,    OP.DATAOPERACAO,'
      '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,'
      '   OP.PRECOUNITOPERACAO, OP.DATAVENCOPER,      OP.IDFORCLI,'
      
        '   OP.FLGSTATUSFECHBOL,  OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERE' +
        'NC,'
      '   OP.VLROPERACAO,       OP.IDPLANPREVCTBPATR, OP.VLRIR,'
      '   OP.IDLOTE,            OP.IDOPERACAOORIGEM,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.DESCTIPOOPERACAO,  TP.FLGCONTAINVEST,'
      
        '   IV.DESCINVESTIMENTO,  PP.PLANPRVCONTABPATRO, CA.DESCCARTINVES' +
        'T'
      'FROM'
      
        '   OPERACAOINVEST OP, TIPOOPERACAO TP, INVESTIMENTO IV, VWPLANPR' +
        'EVCTBPATR PP, VWCARTEIRASRV CA'
      
        'WHERE (OP.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39 +
        '))'
      '  AND (OP.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST)'
      '  AND (OP.IDINVESTIMENTO    = :IDINVESTIMENTO)'
      '  AND (OP.NUMDOCUMENTO      = :IDBOLETA)'
      
        '  AND  ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR))'
      '  AND (OP.IDTIPOINVEST      = 2)'
      
        '  AND  ((:IDTIPOOPERACAO IS NULL) OR (OP.IDTIPOOPERACAO   <> :ID' +
        'TIPOOPERACAO))'
      '  AND (TP.IDTIPOINVEST      = 2)'
      '  AND (TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO)'
      '  AND (TP.TIPOMOVTO         = '#39'OPE'#39')'
      '  AND (OP.IDINVESTIMENTO    = IV.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT HI.IDOPERACAOINVEST'
      '                  FROM HISTCARTINV HI'
      
        '                  WHERE HI.IDOPERACAOINVEST = OP.IDOPERACAOINVES' +
        'T))'
      'ORDER BY OP.IDOPERACAOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
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
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
    object qryBuscaBoletaOPEIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object qryBuscaBoletaOPEIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
    end
    object qryBuscaBoletaOPEIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCORRETVALORES'
    end
    object qryBuscaBoletaOPEEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'BASEDADOS.OPERACAOINVEST.EMPRESAPROP'
    end
    object qryBuscaBoletaOPEIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDMODULO'
    end
    object qryBuscaBoletaOPEIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaOPEIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryBuscaBoletaOPEIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object qryBuscaBoletaOPEDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object qryBuscaBoletaOPENUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaOPEQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.QTDEOPERACAO'
    end
    object qryBuscaBoletaOPEPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaOPEDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAVENCOPER'
    end
    object qryBuscaBoletaOPEIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDFORCLI'
    end
    object qryBuscaBoletaOPEFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Origin = 'BASEDADOS.OPERACAOINVEST.FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaOPEFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Origin = 'BASEDADOS.OPERACAOINVEST.FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaOPEIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaOPETIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaOPENATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaOPEIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.OPERACAOINVESTIDCARTEIRAGERENC'
    end
    object qryBuscaBoletaOPEVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
    end
    object qryBuscaBoletaOPEVLRIR: TFloatField
      FieldName = 'VLRIR'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLRIR'
    end
    object qryBuscaBoletaOPEDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaOPETIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaOPEDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaOPEIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaOPEIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaOPEFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaOPEPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaOPEDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object QryDespesasOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DOP.IDDESPOPERINVEST, DOP.IDFORCLI,         DOP.IDOPERACAOINV' +
        'EST,'
      
        '   DOP.IDTIPOINVEST,     DOP.IDTIPOOPERACAO,   DOP.IDREGRAVENCUS' +
        'ADA,'
      
        '   DOP.IDTIPODESPINVEST, DOP.DATAVENCDESPOPER, DOP.IDREGRACALCUS' +
        'ADA,'
      '   NVL(DOP.VLRDESPOPER,0) AS VLRDESPOPER,'
      
        '   OI.DATAOPERACAO,      OI.NUMDOCUMENTO,      OI.IDINVESTIMENTO' +
        ','
      
        '   OI.IDCORRETVALORES,   OI.IDCARTEIRAINVEST,  OI.IDCARTEIRAGERE' +
        'NC,'
      '   OI.VLROPERACAO,       OI.QTDEOPERACAO,      OI.MOECODIGO,'
      
        '   OI.IDLOTE, DECODE(DOP.FLGCALCDIARIO,0, '#39'N'#39', '#39'S'#39') AS FLGCALCDI' +
        'ARIO,'
      '   OI.IDPLANPREVCTBPATR,'
      '   TP.DESCTIPOOPERACAO,  TP.NATUREZAOPERACAO,'
      '   PE.NOME,'
      '   TD.DESCTIPODESPINV,   TD.NATUREZAOPERACAO AS NATOPERDESP,'
      '   IV.DESCINVESTIMENTO'
      'FROM'
      '   PESSOA PE, DESPOPERINVEST DOP, OPERACAOINVEST OI,'
      '   TIPOOPERACAO TP, INVESTIMENTO IV, ACAO AC, TIPODESPINVEST TD'
      'WHERE'
      '   (DOP.IDOPERACAOINVEST = :IDOPERACAOINVEST)   AND'
      '   (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '   (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      '   (DOP.IDFORCLI         = PE.IDPESSOA)         AND'
      '   (OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO)   AND'
      '   (OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO)   AND'
      '   (IV.IDINVESTIMENTO    = AC.IDACAO(+))       '
      'ORDER BY OI.NUMDOCUMENTO, TD.DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 154
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryDespesasOperacaoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryDespesasOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryDespesasOperacaoIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryDespesasOperacaoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryDespesasOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryDespesasOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryDespesasOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryDespesasOperacaoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      Size = 1
    end
    object QryDespesasOperacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryDespesasOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryDespesasOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryDespesasOperacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryDespesasOperacaoDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryDespesasOperacaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDespesasOperacaoNATOPERDESP: TStringField
      FieldName = 'NATOPERDESP'
      FixedChar = True
      Size = 1
    end
  end
  object qryBuscaFlgContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   U.IDINVESTIMENTO,    U.IDCARTEIRAINVEST,  U.DATAMOVCARTINV,'
      '   U.IDPLANPREVCTBPATR, U.IDHISTCARTINV,     U.VLRTOTLIQUIDAR,'
      '   U.IDTIPOOPERACAO,    U.IDOPERACAOINVEST,  U.IDCORRETVALORES,'
      '   U.IDLOTE,            ABS(U.VLRMOVCARTINV) AS VLRMOVCARTINV,'
      '   U.DATAVENCOPER,      U.MOECODIGO,         U.IDFORCLI,'
      '   U.NUMDOCUMENTO,      U.CODTIPOACAO,       U.TIPMOVCARTINV,'
      
        '   U.IDBOLETA,          U.CODDOCUMENTO,      U.PLANO,           ' +
        'U.PLNCODIGO,'
      '   I.DESCINVESTIMENTO,  T.DESCTIPOOPERACAO'
      ''
      'FROM INVESTIMENTO I, TIPOOPERACAO T,'
      '   ('
      '      (SELECT'
      
        '         HI.IDINVESTIMENTO,    HI.IDCARTEIRAINVEST, HI.DATAMOVCA' +
        'RTINV,'
      
        '         HI.IDPLANPREVCTBPATR, HI.IDHISTCARTINV,    HI.VLRTOTLIQ' +
        'UIDAR,'
      
        '         HI.IDTIPOOPERACAO,    HI.IDOPERACAOINVEST, HI.IDCORRETV' +
        'ALORES,'
      
        '         HI.IDLOTE,            HI.VLRMOVCARTINV,    HI.TIPMOVCAR' +
        'TINV,'
      '         OP.DATAVENCOPER,      OP.MOECODIGO,        OP.IDFORCLI,'
      '         OP.NUMDOCUMENTO,'
      
        '         BO.IDBOLETA,          BO.CODDOCUMENTO,     BO.PLANO,   ' +
        '        BO.PLNCODIGO,'
      '         AC.CODTIPOACAO'
      '      FROM'
      '         HISTCARTINV HI, OPERACAOINVEST OP, BOLETA BO, ACAO AC'
      '      WHERE (HI.FLGCALCSALDO = '#39'6'#39')'
      '        AND (HI.TIPMOVCARTINV = '#39'OPE'#39')'
      '        AND (HI.IDTIPOINVEST = 2)'
      '        AND (HI.IDOPERACAOINVEST = OP.IDOPERACAOINVEST)'
      '        AND (OP.NUMDOCUMENTO = BO.IDBOLETA)'
      '        AND (HI.IDINVESTIMENTO = AC.IDACAO)'
      '      )'
      ''
      '      UNION ALL'
      ''
      '      (SELECT'
      
        '         HI.IDINVESTIMENTO,    HI.IDCARTEIRAINVEST,  HI.DATAMOVC' +
        'ARTINV,'
      
        '         HI.IDPLANPREVCTBPATR, HI.IDHISTCARTINV,     HI.VLRTOTLI' +
        'QUIDAR,'
      
        '         HI.IDTIPOOPERACAO,    HI.IDOPERACAOINVEST,  HI.IDCORRET' +
        'VALORES,'
      
        '         HI.IDLOTE,            HI.VLRMOVCARTINV,     HI.TIPMOVCA' +
        'RTINV,'
      '         HI.DATAMOVCARTINV AS DATAVENCOPER,'
      '         PA.MOECODIGO,'
      '         IV.IDEMISSOR,'
      '         '#39#39' AS NUMDOCUMENTO,'
      
        '         BO.IDBOLETA,          BO.CODDOCUMENTO,      BO.PLANO,  ' +
        '         BO.PLNCODIGO,'
      '         '#39#39' AS CODTIPOACAO'
      '      FROM'
      
        '         HISTCARTINV HI, OPERCUSTODIA OP, BOLETA BO, PARAMINVEST' +
        ' PA, INVESTIMENTO IV'
      '      WHERE (HI.FLGCALCSALDO = '#39'6'#39')'
      '        AND (HI.TIPMOVCARTINV = '#39'TRC'#39')'
      '        AND (HI.IDTIPOOPERACAO IN (-68,-63,-4))'
      '        AND (HI.IDTIPOINVEST = 2)'
      '        AND (HI.IDHISTCARTINV = OP.IDHISTCARTINVORIG)'
      '        AND (OP.IDBOLETA = BO.IDBOLETA)'
      '        AND (HI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '      )'
      ''
      '      UNION ALL'
      ''
      '      (SELECT'
      
        '         HI.IDINVESTIMENTO,    HI.IDCARTEIRAINVEST,  HI.DATAMOVC' +
        'ARTINV,'
      
        '         HI.IDPLANPREVCTBPATR, HI.IDHISTCARTINV,     HI.VLRTOTLI' +
        'QUIDAR,'
      
        '         HI.IDTIPOOPERACAO,    HI.IDOPERACAOINVEST,  HI.IDCORRET' +
        'VALORES,'
      
        '         HI.IDLOTE,            HI.VLRMOVCARTINV,     HI.TIPMOVCA' +
        'RTINV,'
      '         HI.DATAMOVCARTINV AS DATAVENCOPER,'
      '         PA.MOECODIGO,'
      '         IV.IDEMISSOR,'
      '         '#39#39' AS NUMDOCUMENTO,'
      
        '         BO.IDBOLETA,          BO.CODDOCUMENTO,      BO.PLANO,  ' +
        '         BO.PLNCODIGO,'
      '         '#39#39' AS CODTIPOACAO'
      '      FROM'
      
        '         HISTCARTINV HI, OPERCUSTODIA OP, BOLETA BO, PARAMINVEST' +
        ' PA, INVESTIMENTO IV'
      '      WHERE (HI.FLGCALCSALDO = '#39'6'#39')'
      '        AND (HI.TIPMOVCARTINV = '#39'TRC'#39')'
      '        AND (HI.IDTIPOOPERACAO IN (-67,-64,-6))'
      '        AND (HI.IDTIPOINVEST = 2)'
      '        AND (HI.IDHISTCARTINV = OP.IDHISTCARTINVORIG)'
      '        AND (OP.IDBOLETA = BO.IDBOLETA)'
      '        AND (HI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '      )'
      '   )U'
      'WHERE U.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '  AND U.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      'ORDER BY U.DATAMOVCARTINV, U.NUMDOCUMENTO')
    ValidateWithMask = True
    Left = 56
    Top = 285
    object qryBuscaFlgContabIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaFlgContabIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaFlgContabDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryBuscaFlgContabIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaFlgContabIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaFlgContabVLRTOTLIQUIDAR: TFloatField
      FieldName = 'VLRTOTLIQUIDAR'
    end
    object qryBuscaFlgContabIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaFlgContabIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaFlgContabIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaFlgContabIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaFlgContabDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaFlgContabMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryBuscaFlgContabIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaFlgContabCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object qryBuscaFlgContabVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object qryBuscaFlgContabIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaFlgContabNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaFlgContabCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBuscaFlgContabPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBuscaFlgContabPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaFlgContabTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryBuscaFlgContabDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaFlgContabDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
  end
  object qryBuscaFlgReproc: TwwQuery
    BeforeOpen = qryBuscaFlgReprocBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.DATAMOVCARTINV, I.DESCINVESTIMENTO, PP.PLANPRVCONTABPAT' +
        'RO, CI.DESCCARTINVEST,'
      
        '       H.IDHISTCARTINV, H.IDPLANPREVCTBPATR, H.IDCARTEIRAINVEST,' +
        ' H.IDCARTEIRAGERENC, H.IDINVESTIMENTO,'
      '       H.TIPMOVCARTINV, MIN(H.DATAMOVCARTINV) OVER ( ) MENORDATA'
      
        'FROM   HISTCARTINV H, INVESTIMENTO I, CARTEIRAINVEST CI, VWPLANP' +
        'REVCTBPATR PP'
      'WHERE (H.IDHISTCARTINV  IN'
      '           (SELECT MAX(H2.IDHISTCARTINV)'
      '            FROM HISTCARTINV H2,'
      
        '                (SELECT H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, H' +
        '3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO, MIN(H3.DATAMOVCARTINV) DA' +
        'TAMOVCARTINV'
      '                   FROM HISTCARTINV H3'
      '                  WHERE (H3.FLGCALCSALDO = '#39'5'#39')'
      '                    AND (H3.IDTIPOINVEST = 2)'
      
        '                    AND ((:IDPLANPREVCTBPATR IS NULL)  OR (H3.ID' +
        'PLANPREVCTBPATR  = :IDPLANPREVCTBPATR))'
      
        '                    AND ((:IDCARTEIRAINVEST IS NULL)  OR (H3.IDC' +
        'ARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      
        '                    AND ((:IDINVESTIMENTO IS NULL)    OR (H3.IDI' +
        'NVESTIMENTO = :IDINVESTIMENTO))'
      '                    AND (H3.IDCARTEIRAGERENC IS NULL)'
      
        '                  GROUP BY H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR' +
        ', H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO) HMAX'
      '            WHERE (H2.FLGCALCSALDO = '#39'5'#39')'
      '              AND (H2.IDTIPOINVEST = 2)'
      
        '              AND ((:IDPLANPREVCTBPATR IS NULL)  OR (H2.IDPLANPR' +
        'EVCTBPATR  = :IDPLANPREVCTBPATR))'
      
        '              AND ((:IDCARTEIRAINVEST IS NULL)   OR (H2.IDCARTEI' +
        'RAINVEST  = :IDCARTEIRAINVEST))'
      
        '              AND ((:IDINVESTIMENTO IS NULL)     OR (H2.IDINVEST' +
        'IMENTO = :IDINVESTIMENTO))'
      '              AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '              AND (H2.IDPLANPREVCTBPATR = HMAX.IDPLANPREVCTBPATR' +
        ')'
      '              AND (H2.IDCARTEIRAINVEST  = HMAX.IDCARTEIRAINVEST)'
      '              AND (H2.IDINVESTIMENTO    = HMAX.IDINVESTIMENTO)'
      '              AND (H2.DATAMOVCARTINV    = HMAX.DATAMOVCARTINV)'
      
        '            GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.I' +
        'DCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.DATAMOVCARTINV))'
      '  AND (H.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (H.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      '  AND (H.IDINVESTIMENTO = I.IDINVESTIMENTO)'
      
        '  AND ((NVL(H.SALDOQTDEINVCART,0) > 0) OR ((NVL(H.SALDOQTDEINVCA' +
        'RT,0) = 0) AND (H.TIPMOVCARTINV IN ('#39'INI'#39','#39'REP'#39'))))'
      
        'ORDER BY  H.DATAMOVCARTINV, CI.FLGCARTPROP DESC, I.DESCINVESTIME' +
        'NTO, H.IDCARTEIRAINVEST,'
      '          H.IDPLANPREVCTBPATR, H.TIPMOVCARTINV, H.IDHISTCARTINV')
    ValidateWithMask = True
    Left = 56
    Top = 236
    ParamData = <
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryBuscaFlgReprocIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaFlgReprocIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaFlgReprocIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaFlgReprocDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryBuscaFlgReprocIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaFlgReprocTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryBuscaFlgReprocDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaFlgReprocIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaFlgReprocDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaFlgReprocMENORDATA: TDateTimeField
      FieldName = 'MENORDATA'
    end
    object qryBuscaFlgReprocPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object qryAtuSldInvRV: TwwQuery
    BeforeOpen = qryAtuSldInvRVBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMEN' +
        'TO,'
      
        '       HC.IDLOTE, IV.DESCINVESTIMENTO,IV.IDTIPOINVEST, CI.FLGCAL' +
        'CDIARIO,'
      
        '       AC.FLGPROVISIONAIR AS FLGIRRVA, IV.IDEMISSOR, HC.IDPLANPR' +
        'EVCTBPATR,'
      '       PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST'
      ''
      
        'FROM HISTCARTINV HC, INVESTIMENTO IV, CARTEIRAINVEST CI, ACAO AC' +
        ','
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (HC.IDTIPOINVEST     = 2 )'
      
        '  AND ((:PLANPREVCTBPATR  IS NULL) OR (HC.IDPLANPREVCTBPATR = :P' +
        'LANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (HC.IDCARTEIRAINVEST  = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND ((:IDINVESTIMENTO   IS NULL) OR (HC.IDINVESTIMENTO    = :I' +
        'DINVESTIMENTO))'
      '  AND (HC.DATAMOVCARTINV  <= TO_DATE(:DATAPROC,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (((HC.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '        (HC.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))  '
      '  AND (IV.FLGATIVO         = '#39'S'#39')'
      '  AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      '  AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST)'
      '  AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)'
      '  AND (HC.IDINVESTIMENTO   = AC.IDACAO(+))'
      '  AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      ''
      'GROUP BY'
      '   HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO,'
      
        '   HC.IDLOTE, IV.DESCINVESTIMENTO,IV.IDTIPOINVEST, CI.FLGCALCDIA' +
        'RIO,'
      '   AC.FLGPROVISIONAIR, IV.IDEMISSOR, HC.IDPLANPREVCTBPATR,'
      '   PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST'
      ''
      
        'ORDER BY IV.DESCINVESTIMENTO, PP.PLANPRVCONTABPATRO, HC.IDCARTEI' +
        'RAINVEST, HC.IDCARTEIRAGERENC NULLS FIRST')
    ValidateWithMask = True
    Left = 56
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAPROC'
        ParamType = ptInput
      end>
    object qryAtuSldInvRVIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryAtuSldInvRVIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryAtuSldInvRVIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryAtuSldInvRVIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryAtuSldInvRVDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAtuSldInvRVIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryAtuSldInvRVFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      FixedChar = True
      Size = 1
    end
    object qryAtuSldInvRVFLGIRRVA: TStringField
      FieldName = 'FLGIRRVA'
      FixedChar = True
      Size = 1
    end
    object qryAtuSldInvRVIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryAtuSldInvRVIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryAtuSldInvRVPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryAtuSldInvRVDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryBuscaBoletaTRC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERCUSTODIA,    OP.IDMOTIVOBLOQDEST,  OP.IDMOTIVOBLOQOR' +
        'IG,'
      
        '   OP.IDCUSTODIANTEDEST, OP.IDCUSTODIANTEORIG, OP.IDINVESTIMENTO' +
        ','
      
        '   OP.IDCARTEIRADEST,    OP.IDCARTEIRAORIG,    OP.IDHISTCARTINVD' +
        'EST,'
      
        '   OP.IDHISTCARTINVORIG, OP.IDCUSTODIAORIG,    OP.IDCUSTODIADEST' +
        ','
      '   OP.DATAMOVCUSTOD,     OP.IDLOTE,            OP.QUANTIDADE,'
      
        '   OP.IDTIPOOPERACAO,    OP.IDTIPOOPERORIG,    OP.IDTIPOOPERDEST' +
        ','
      
        '   OP.IDBOLETA,          IV.IDEMISSOR,         IV.DESCINVESTIMEN' +
        'TO,'
      
        '   TP.FLGCONTAINVEST,    OP.IDPLANPREVCTBPATR, PP.PLANPRVCONTABP' +
        'ATRO,'
      '   CA.DESCCARTINVEST'
      ''
      'FROM'
      
        '   OPERCUSTODIA OP, INVESTIMENTO IV, TIPOOPERACAO TP, VWPLANPREV' +
        'CTBPATR PP,VWCARTEIRASRV CA'
      'WHERE (OP.IDBOLETA = :IDBOLETA)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAORIG IS NULL) OR (OP.IDCARTEIRAORIG = :IDCART' +
        'EIRAORIG))'
      '  AND (OP.IDINVESTIMENTO  = IV.IDINVESTIMENTO)'
      '  AND (OP.IDTIPOOPERORIG = TP.IDTIPOOPERACAO)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAORIG = CA.IDCARTEIRAINVEST)'
      '  AND (NOT EXISTS (SELECT IDHISTCARTINV'
      '                   FROM HISTCARTINV'
      
        '                   WHERE IDHISTCARTINV IN (OP.IDHISTCARTINVORIG,' +
        ' OP.IDHISTCARTINVDEST)))'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 100
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAORIG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAORIG'
        ParamType = ptResult
      end>
    object qryBuscaBoletaTRCIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDOPERCUSTODIA'
    end
    object qryBuscaBoletaTRCIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaTRCIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaTRCIDCUSTODIANTEDEST: TFloatField
      FieldName = 'IDCUSTODIANTEDEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDCUSTODIANTEDEST'
    end
    object qryBuscaBoletaTRCIDCUSTODIANTEORIG: TFloatField
      FieldName = 'IDCUSTODIANTEORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDCUSTODIANTEORIG'
    end
    object qryBuscaBoletaTRCIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDINVESTIMENTO'
    end
    object qryBuscaBoletaTRCIDCARTEIRADEST: TFloatField
      FieldName = 'IDCARTEIRADEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDCARTEIRADEST'
    end
    object qryBuscaBoletaTRCIDCARTEIRAORIG: TFloatField
      FieldName = 'IDCARTEIRAORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDCARTEIRAORIG'
    end
    object qryBuscaBoletaTRCIDHISTCARTINVDEST: TFloatField
      FieldName = 'IDHISTCARTINVDEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDHISTCARTINVDEST'
    end
    object qryBuscaBoletaTRCIDHISTCARTINVORIG: TFloatField
      FieldName = 'IDHISTCARTINVORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDHISTCARTINVORIG'
    end
    object qryBuscaBoletaTRCIDCUSTODIAORIG: TFloatField
      FieldName = 'IDCUSTODIAORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDCUSTODIAORIG'
    end
    object qryBuscaBoletaTRCIDCUSTODIADEST: TFloatField
      FieldName = 'IDCUSTODIADEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDCUSTODIADEST'
    end
    object qryBuscaBoletaTRCDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'BASEDADOS.OPERCUSTODIA.DATAMOVCUSTOD'
    end
    object qryBuscaBoletaTRCIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaTRCQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS.OPERCUSTODIA.QUANTIDADE'
    end
    object qryBuscaBoletaTRCIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletaTRCDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaTRCIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaBoletaTRCIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaTRCIDTIPOOPERORIG: TFloatField
      FieldName = 'IDTIPOOPERORIG'
    end
    object qryBuscaBoletaTRCIDTIPOOPERDEST: TFloatField
      FieldName = 'IDTIPOOPERDEST'
    end
    object qryBuscaBoletaTRCFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaTRCIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaTRCPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaTRCDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryMarcaFlgReprocTRC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV'
      'SET FLGCALCSALDO = '#39'5'#39
      'WHERE IDHISTCARTINV = ('
      '   SELECT MAX(H3.IDHISTCARTINV)'
      '   FROM HISTCARTINV H3,'
      
        '        (SELECT H4.IDCARTEIRAINVEST, H4.IDINVESTIMENTO, H4.IDPLA' +
        'NPREVCTBPATR, H4.DATAMOVCARTINV'
      '         FROM HISTCARTINV H4'
      '         WHERE H4.IDHISTCARTINV ='
      '           (SELECT MIN(H6.IDHISTCARTINV)'
      '            FROM HISTCARTINV H6,'
      
        '                 (SELECT H8.IDHISTCARTINV,  H8.IDINVESTIMENTO,  ' +
        '  H8.IDCARTEIRAINVEST,'
      
        '                         H8.DATAMOVCARTINV, H8.IDPLANPREVCTBPATR' +
        ', H8.TIPMOVCARTINV'
      '                  FROM   HISTCARTINV H8'
      '                  WHERE (H8.IDHISTCARTINV  IN'
      '                             (SELECT MAX(H9.IDHISTCARTINV)'
      '                              FROM HISTCARTINV H9'
      
        '                              WHERE ((:IDCARTEIRAINVEST IS NULL)' +
        ' OR (H9.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                                AND (H9.IDCARTEIRAGERENC IS NULL' +
        ')'
      
        '                                AND ((:IDINVESTIMENTO IS NULL) O' +
        'R (H9.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                AND ((H9.DATAMOVCARTINV || H9.ID' +
        'INVESTIMENTO || H9.IDCARTEIRAINVEST) IN'
      
        '                                       (SELECT (MIN(H10.DATAMOVC' +
        'ARTINV) || H10.IDINVESTIMENTO || H10.IDCARTEIRAINVEST)'
      '                                        FROM HISTCARTINV H10'
      
        '                                        WHERE ((:IDCARTEIRAINVES' +
        'T IS NULL) OR (H10.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      
        '                                          AND (H10.IDCARTEIRAGER' +
        'ENC IS NULL)'
      
        '                                          AND ((:IDINVESTIMENTO ' +
        'IS NULL) OR (H10.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                          AND (H10.FLGCALCSALDO ' +
        '= '#39'5'#39')'
      
        '                                          AND (H10.IDTIPOINVEST ' +
        '= 2)'
      
        '                                          AND ((H10.SALDOQTDEINV' +
        'CART > 0) OR ( (H10.SALDOQTDEINVCART = 0) AND (H10.TIPMOVCARTINV' +
        ' IN ('#39'INI'#39', '#39'REP'#39')) ) )'
      
        '                                        GROUP BY H10.IDINVESTIME' +
        'NTO,H10.IDCARTEIRAINVEST) )'
      '                                AND (H9.FLGCALCSALDO = '#39'5'#39')'
      '                                AND (H9.IDTIPOINVEST = 2)'
      
        '                                AND ((H9.SALDOQTDEINVCART > 0) O' +
        'R ( (H9.SALDOQTDEINVCART = 0) AND (H9.TIPMOVCARTINV IN ('#39'INI'#39', '#39 +
        'REP'#39')) ) )'
      
        '                              GROUP BY H9.IDINVESTIMENTO,H9.IDCA' +
        'RTEIRAINVEST))'
      
        '                      AND ((H8.SALDOQTDEINVCART > 0) OR ( (H8.SA' +
        'LDOQTDEINVCART = 0) AND (H8.TIPMOVCARTINV IN ('#39'INI'#39', '#39'REP'#39')) ) )'
      '                 ) H7'
      ''
      '            WHERE H6.IDPLANPREVCTBPATR = H7.IDPLANPREVCTBPATR'
      '              AND H6.IDCARTEIRAINVEST <> H7.IDCARTEIRAINVEST'
      '              AND H6.IDCARTEIRAGERENC IS NULL'
      '              AND H6.IDINVESTIMENTO = H7.IDINVESTIMENTO'
      '              AND H6.DATAMOVCARTINV >= H7.DATAMOVCARTINV'
      '              AND H6.TIPMOVCARTINV = '#39'TRC'#39') )H5'
      ''
      '   WHERE H3.IDPLANPREVCTBPATR = H5.IDPLANPREVCTBPATR'
      '     AND H3.IDCARTEIRAINVEST = H5.IDCARTEIRAINVEST'
      '     AND H3.IDCARTEIRAGERENC IS NULL'
      '     AND H3.IDINVESTIMENTO = H5.IDINVESTIMENTO'
      '     AND H3.DATAMOVCARTINV < H5.DATAMOVCARTINV)')
    ValidateWithMask = True
    Left = 56
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
  object qryBuscaBoletaDTO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.IDINVESTIMENTO,    OI.IDOPERACAOINVEST,  OI.IDTIPOOPER' +
        'ACAO, OI.IDCARTEIRAINVEST,'
      
        '       OI.IDCARTEIRAGERENC,  OI.DATAOPERACAO, OI.QTDEOPERACAO, O' +
        'I.IDOPERACAOORIGEM,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLROPERACAO,'
      '       VLROPERACAOOM, OI.VLRREMUNERACAO, '
      
        '       OI.IDPLANPREVCTBPATR, OI.IDOPERACAODIREITO, OI.NUMDOCUMEN' +
        'TO,   OI.VLRIR,'
      '       OI.IDLOTE,            OI.DATAVENCOPER,'
      '       TP.NATUREZAOPERACAO,  TP.DESCTIPOOPERACAO,  TP.RECPAG,'
      
        '       IV.DESCINVESTIMENTO,  OD.IDTIPOOPERACAO AS IDTIPOOPERACAO' +
        'AGE,'
      '       PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST,'
      '       OD.DATAAGE'
      ''
      
        'FROM OPERACAODIREITO OD, OPERACAOINVEST OI, TIPOOPERACAO TP, INV' +
        'ESTIMENTO IV,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE OI.NUMDOCUMENTO      = :IDBOLETA'
      '  AND OI.IDINVESTIMENTO    = :IDINVESTIMENTO'
      '  AND OI.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '  AND OI.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      
        '  AND ((:IDPLANPREVCTBPATR IS NOT NULL) OR (OI.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR)) '
      '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      '  AND (OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OI.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OI.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OI.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OI.IDOPERACAOINVEST))'
      'ORDER BY IDCARTEIRAINVEST, NVL(IDCARTEIRAGERENC,0)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 146
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
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
      end>
    object qryBuscaBoletaDTOIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTOIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTOIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTOIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTOIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTODATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTOQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTOIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDTOVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTOIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTOIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDTONUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTOVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTOIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTODATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTONATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTODESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTORECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTODESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTOVLROPERACAOOM: TFloatField
      FieldName = 'VLROPERACAOOM'
    end
    object qryBuscaBoletaDTOIDTIPOOPERACAOAGE: TFloatField
      FieldName = 'IDTIPOOPERACAOAGE'
    end
    object qryBuscaBoletaDTOVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
    end
    object qryBuscaBoletaDTOPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTODESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaDTODATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
  end
  object qryBuscaBoletaAJQ: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'C'#39' AS TIPREG,'
      
        '   OP.IDINVESTIMENTO,     IV.DESCINVESTIMENTO,   OP.IDLOTE,     ' +
        ' OP.IDPLANPREVCTBPATR,'
      
        '   OP.IDBOLETA,           OP.IDCARTEIRAORIG AS IDCARTEIRAINVEST,' +
        ' OP.DATAMOVCUSTOD AS DATAOPERACAO,'
      '   OP.QUANTIDADE,         OP.IDOPERCUSTODIA AS IDOPERACAO,'
      ''
      
        '   OP.IDMOTIVOBLOQDEST,   OP.IDMOTIVOBLOQORIG,   OP.IDCUSTODIANT' +
        'EDEST, OP.IDCUSTODIANTEORIG,'
      
        '   OP.IDHISTCARTINVDEST,  OP.IDHISTCARTINVORIG,  OP.IDCUSTODIAOR' +
        'IG,    OP.IDCUSTODIADEST,'
      '   IV.IDEMISSOR,'
      ''
      '   OI.IDOPERACAOINVEST,'
      '   OI.IDCUSTODIANTE,         OI.EMPRESAPROP,        OI.IDMODULO,'
      '   OI.IDTIPOOPERACAO,        OI.PRECOUNITOPERACAO,  OI.IDFORCLI,'
      
        '   OI.FLGSTATUSFECHBOL,      OI.FLGSTATUSORDMOV,    OI.IDCARTEIR' +
        'AGERENC,'
      
        '   OI.VLROPERACAO,           OI.VLRIR,              NULL AS TIPO' +
        'MOVTO,'
      
        '   NULL AS NATUREZAOPERACAO, NULL AS TIPOCUSTODIA,  NULL AS DESC' +
        'TIPOOPERACAO,'
      
        '   TP.FLGCONTAINVEST,        PP.PLANPRVCONTABPATRO, CA.DESCCARTI' +
        'NVEST'
      'FROM'
      
        '   OPERCUSTODIA OP, OPERACAOINVEST OI, INVESTIMENTO IV, TIPOOPER' +
        'ACAO TP, VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      'WHERE (OP.IDBOLETA = :IDBOLETA)'
      '  AND (OI.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (OP.IDCARTEIRAORIG = :IDC' +
        'ARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (OP.IDINVESTIMENTO  = IV.IDINVESTIMENTO)'
      '  AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '  AND (OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OI.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OI.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OI.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      ''
      'UNION'
      ''
      'SELECT'
      '   '#39'H'#39' AS TIPREG,'
      
        '   OP.IDINVESTIMENTO,     IV.DESCINVESTIMENTO,           OP.IDLO' +
        'TE,'
      
        '   OP.IDPLANPREVCTBPATR,  OP.NUMDOCUMENTO AS IDBOLETA,   OP.IDCA' +
        'RTEIRAINVEST,'
      
        '   OP.DATAOPERACAO,       OP.QTDEOPERACAO AS QUANTIDADE, OP.IDOP' +
        'ERACAOINVEST AS IDOPERACAO,'
      ''
      
        '   NULL AS IDMOTIVOBLOQDEST,  NULL AS IDMOTIVOBLOQORIG,  NULL AS' +
        ' IDCUSTODIANTEDEST,'
      
        '   NULL AS IDCUSTODIANTEORIG, NULL AS IDHISTCARTINVDEST, NULL AS' +
        ' IDHISTCARTINVORIG,'
      
        '   NULL AS IDCUSTODIAORIG,    NULL AS IDCUSTODIADEST,    NULL AS' +
        ' IDEMISSOR,'
      ''
      '   OP.IDOPERACAOINVEST,'
      
        '   OP.IDCUSTODIANTE,          OP.EMPRESAPROP,            OP.IDMO' +
        'DULO,'
      
        '   OP.IDTIPOOPERACAO,         OP.PRECOUNITOPERACAO,      OP.IDFO' +
        'RCLI,'
      
        '   OP.FLGSTATUSFECHBOL,       OP.FLGSTATUSORDMOV,        OP.IDCA' +
        'RTEIRAGERENC,'
      
        '   OP.VLROPERACAO,            OP.VLRIR,                  TP.TIPO' +
        'MOVTO,'
      
        '   TP.NATUREZAOPERACAO,       TP.TIPOCUSTODIA,           TP.DESC' +
        'TIPOOPERACAO,'
      
        '   TP.FLGCONTAINVEST,         PP.PLANPRVCONTABPATRO,     CA.DESC' +
        'CARTINVEST'
      'FROM'
      
        '   OPERACAOINVEST OP, TIPOOPERACAO TP, INVESTIMENTO IV, VWPLANPR' +
        'EVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.IDTIPOINVEST      = 2)'
      '  AND (OP.NUMDOCUMENTO      = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (OP.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (OP.IDTIPOOPERACAO IN (-93,-94,-124,-125))'
      '  AND (OP.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO)'
      '  AND (OP.IDINVESTIMENTO    = IV.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY TIPREG'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaAJQTIPREG: TStringField
      FieldName = 'TIPREG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaAJQIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaAJQDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaAJQIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaAJQIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaAJQIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletaAJQIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaAJQDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaAJQQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryBuscaBoletaAJQIDOPERACAO: TFloatField
      FieldName = 'IDOPERACAO'
    end
    object qryBuscaBoletaAJQIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaAJQIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaAJQIDCUSTODIANTEDEST: TFloatField
      FieldName = 'IDCUSTODIANTEDEST'
    end
    object qryBuscaBoletaAJQIDCUSTODIANTEORIG: TFloatField
      FieldName = 'IDCUSTODIANTEORIG'
    end
    object qryBuscaBoletaAJQIDHISTCARTINVDEST: TFloatField
      FieldName = 'IDHISTCARTINVDEST'
    end
    object qryBuscaBoletaAJQIDHISTCARTINVORIG: TFloatField
      FieldName = 'IDHISTCARTINVORIG'
    end
    object qryBuscaBoletaAJQIDCUSTODIAORIG: TFloatField
      FieldName = 'IDCUSTODIAORIG'
    end
    object qryBuscaBoletaAJQIDCUSTODIADEST: TFloatField
      FieldName = 'IDCUSTODIADEST'
    end
    object qryBuscaBoletaAJQIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaBoletaAJQIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaAJQEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaAJQIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaAJQIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaAJQPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaAJQIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaAJQFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaAJQFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaAJQIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaAJQVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaAJQVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaAJQTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaAJQNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaAJQTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaAJQDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaAJQIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaAJQFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaAJQPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaAJQDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryMarcaFlgContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV SET FLGCALCSALDO = '#39'6'#39
      'WHERE ('
      
        '       ((:IDBOLETA IS NULL) AND (:IDHISTCARTINV IS NOT NULL) AND' +
        ' (IDHISTCARTINV = :IDHISTCARTINV)) OR'
      
        '       ((:IDBOLETA IS NULL) AND (:IDHISTCARTINV IS NULL) AND (ID' +
        'OPERACAOINVEST = :IDOPERACAOINVEST)) OR'
      
        '       ((:IDBOLETA IS NOT NULL) AND (IDOPERACAOINVEST IN (SELECT' +
        ' OPERACAOINVEST.IDOPERACAOINVEST'
      
        '                                                          FROM O' +
        'PERACAOINVEST'
      
        '                                                          WHERE ' +
        'OPERACAOINVEST.NUMDOCUMENTO = :IDBOLETA)))'
      '      )'
      '      AND IDCARTEIRAGERENC IS NULL      '
      ''
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
  end
  object qryInsBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BOLETA'
      
        '(IDBOLETA,STATUS,DATABOLETA,IDFORCLI,PLANO, PLNCODIGO,CODDOCUMEN' +
        'TO,TIPMOVBOLETA)'
      'VALUES'
      
        '(:IDBOLETA,:STATUS,:DATABOLETA,:IDFORCLI,:PLANO,:PLNCODIGO,:CODD' +
        'OCUMENTO,:TIPMOVBOLETA)'
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATABOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
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
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end>
  end
  object qryVerCotacaoPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PC.VLRCONTABIL AS PRIMCOT, C.DATACOTACAO, C.VLRCONTABIL A' +
        'S COTACAO'
      'FROM COTACAOINVEST C,'
      '     (SELECT IDINVESTIMENTO, DATACOTACAO, VLRCONTABIL'
      '      FROM COTACAOINVEST'
      '      WHERE DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                           FROM COTACAOINVEST'
      
        '                           WHERE DATACOTACAO < TO_DATE(:DATACOTA' +
        'CAO,'#39'DD/MM/YYYY'#39')'
      
        '                             AND IDINVESTIMENTO = :IDINVESTIMENT' +
        'O)'
      '      AND IDINVESTIMENTO = :IDINVESTIMENTO) PC'
      'WHERE C.IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND C.DATACOTACAO >= TO_DATE(:DATACOTACAO,'#39'DD/MM/YYYY'#39')'
      '  AND C.IDINVESTIMENTO = PC.IDINVESTIMENTO(+)'
      'ORDER BY C.DATACOTACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 252
    Top = 146
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptResult
      end>
    object qryVerCotacaoPeriodoPRIMCOT: TFloatField
      FieldName = 'PRIMCOT'
    end
    object qryVerCotacaoPeriodoDATACOTACAO: TDateTimeField
      FieldName = 'DATACOTACAO'
    end
    object qryVerCotacaoPeriodoCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
  end
  object qryVerOperPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDOCUMENTO AS BOLETAS'
      'FROM OPERACAOINVEST'
      'WHERE IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '  AND IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      '  AND (IDCARTEIRAGERENC IS NULL)'
      '  AND IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND DATAOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      'GROUP BY NUMDOCUMENTO'
      ''
      'UNION'
      ''
      'SELECT IDBOLETA AS BOLETAS'
      'FROM OPERCUSTODIA'
      'WHERE IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      
        '  AND ((IDCARTEIRAORIG = :IDCARTEIRAINVEST) OR (IDCARTEIRADEST =' +
        ' :IDCARTEIRAINVEST))'
      '  AND IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND DATAMOVCUSTOD >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      'GROUP BY IDBOLETA')
    ValidateWithMask = True
    Left = 252
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end>
    object qryVerOperPeriodoBOLETAS: TStringField
      FieldName = 'BOLETAS'
      Size = 30
    end
  end
  object qryBuscaDatasReproc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAOPERACAO AS DATA'
      'FROM OPERACAOINVEST'
      'WHERE IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '  AND IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '  AND IDINVESTIMENTO    = :IDINVESTIMENTO'
      '  AND DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      'GROUP BY NUMDOCUMENTO, DATAOPERACAO'
      ''
      'UNION'
      ''
      'SELECT DATAMOVCUSTOD AS DATA'
      'FROM OPERCUSTODIA'
      'WHERE IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      
        '  AND ((IDCARTEIRAORIG  = :IDCARTEIRAINVEST) OR (IDCARTEIRADEST ' +
        '= :IDCARTEIRAINVEST))'
      '  AND IDINVESTIMENTO    = :IDINVESTIMENTO'
      '  AND DATAMOVCUSTOD BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                            TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      'GROUP BY IDBOLETA, DATAMOVCUSTOD'
      ''
      'UNION'
      ''
      'SELECT C.DATACOTAACAO  AS DATA'
      'FROM COTACAOACAO  C'
      'WHERE C.IDACAO        = :IDINVESTIMENTO'
      '  AND C.DATACOTAACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                             TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      ' ')
    ValidateWithMask = True
    Left = 252
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object qryBuscaDatasReprocDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object QryBuscaOperPendentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT QTDEPENDENTE AS QTDEOPERACAO'
      'FROM   OPERACAOPENDENTE'
      'WHERE  IDOPERACAOINVEST = :IDOPERACAOORIGEM')
    ValidateWithMask = True
    Left = 252
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptInput
      end>
  end
  object qryBuscaBoletaDTG: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVALORES' +
        ','
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAINVES' +
        'T,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOPERAC' +
        'AO,'
      
        '   OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFECHBO' +
        'L,'
      '   OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,  OP.IDOPERACAODIREITO,OP.IDOPERCUSTODIA,'
      '   OP.ORIGDEST,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.DESCTIPOOPERACAO,'
      
        '   IV.DESCINVESTIMENTO,  OC.IDMOTIVOBLOQDEST, OC.IDMOTIVOBLOQORI' +
        'G,'
      
        '   TP.FLGCONTAINVEST,    CA.DESCCARTINVEST,   PP.PLANPRVCONTABPA' +
        'TRO'
      'FROM'
      
        '   OPERACAOINVEST OP, OPERCUSTODIA OC, TIPOOPERACAO TP, OPERDIRE' +
        'ITOXINV OD, INVESTIMENTO IV,'
      '   VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      'WHERE (OP.NUMDOCUMENTO      = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND ((:IDCARTEIRAINVEST IS NULL) OR'
      '       (OC.IDCARTEIRAORIG = :IDCARTEIRAINVEST) OR'
      '       (OC.IDCARTEIRADEST = :IDCARTEIRAINVEST))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST))'
      '  AND (TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAODIREITO = OP.IDOPERACAODIREITO)'
      '  AND (OD.ORIGDEST          = OP.ORIGDEST)'
      '  AND (IV.IDINVESTIMENTO    = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA    = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST'
      ''
      '')
    ValidateWithMask = True
    Left = 360
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end>
    object qryBuscaBoletaDTGIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTGIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDTGIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDTGEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDTGIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDTGIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTGIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTGIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTGDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTGNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTGQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTGPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDTGDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTGIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDTGFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTGFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTGIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTGVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTGIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTGVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTGIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTGIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDTGORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTGTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDTGNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTGTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTGDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTGDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTGIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDTGIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDTGIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDTGFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDTGDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaDTGPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTGIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
  end
  object qryBuscaBoletaDTS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,   OP.IDCUSTODIANTE,     OP.IDCORRETVALOR' +
        'ES,'
      
        '   OP.EMPRESAPROP,        OP.IDMODULO,          OP.IDCARTEIRAINV' +
        'EST,'
      '   OP.IDINVESTIMENTO,     OP.IDTIPOOPERACAO,    OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,       OP.QTDEOPERACAO,      OP.PRECOUNITOPER' +
        'ACAO,'
      
        '   OP.DATAVENCOPER,       OP.IDFORCLI,          OP.FLGSTATUSFECH' +
        'BOL,'
      '   OP.FLGSTATUSORDMOV,    OP.IDCARTEIRAGERENC,  OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR,  OP.VLRIR,             OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,   OP.IDOPERACAODIREITO, OP.ORIGDEST,'
      '   TP.TIPOMOVTO,          TP.NATUREZAOPERACAO,  TP.TIPOCUSTODIA,'
      
        '   TP.RECPAG,             TP.DESCTIPOOPERACAO,  IV.DESCINVESTIME' +
        'NTO,'
      
        '   OC.IDMOTIVOBLOQDEST,   OC.IDMOTIVOBLOQORIG,  TP.FLGCONTAINVES' +
        'T,'
      
        '   PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST,    OC.IDOPERCUSTODI' +
        'A'
      'FROM'
      
        '   OPERACAOINVEST OP, TIPOOPERACAO TP, OPERDIREITOXINV OD, INVES' +
        'TIMENTO IV, OPERCUSTODIA OC,'
      '   VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      'WHERE (OP.NUMDOCUMENTO '#9'      =:IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR= :I' +
        'DPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA      = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR   = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      'ORDER BY IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 360
    Top = 285
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDTSIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTSIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDTSIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDTSEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDTSIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDTSIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTSIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTSIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTSDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTSNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTSQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTSPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDTSDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTSIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDTSFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTSFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTSIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTSVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTSIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTSVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTSIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTSIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDTSIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDTSORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTSTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDTSNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTSTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTSRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTSDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTSDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTSIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDTSIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDTSFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDTSPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTSDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaDTSIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
  end
  object qryBuscaBoletaDTI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,   OP.IDCUSTODIANTE,    OP.IDCORRETVALORE' +
        'S,'
      
        '   OP.EMPRESAPROP,        OP.IDMODULO,         OP.IDCARTEIRAINVE' +
        'ST,'
      '   OP.IDINVESTIMENTO,     OP.IDTIPOOPERACAO,   OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,       OP.QTDEOPERACAO,     OP.PRECOUNITOPERA' +
        'CAO,'
      
        '   OP.DATAVENCOPER,       OP.IDFORCLI,         OP.FLGSTATUSFECHB' +
        'OL,'
      '   OP.FLGSTATUSORDMOV,    OP.IDCARTEIRAGERENC, OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR,  OP.VLRIR,            OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,   OP.ORIGDEST,         OP.PERCENTUAL,'
      '   OP.IDOPERACAODIREITO,'
      '   TP.TIPOMOVTO,          TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.RECPAG,             TP.DESCTIPOOPERACAO,'
      
        '   IV.DESCINVESTIMENTO,   OC.IDMOTIVOBLOQDEST, OC.IDMOTIVOBLOQOR' +
        'IG,'
      
        '   TP.FLGCONTAINVEST,     OP.VLRCUSTOATUAL,    OP.VLRVARIACAOATU' +
        'AL,'
      '   PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST'
      ''
      'FROM'
      
        '   OPERACAOINVEST OP, OPERCUSTODIA OC, TIPOOPERACAO TP, OPERDIRE' +
        'ITOXINV OD, INVESTIMENTO IV,'
      '   VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA, PARAMINVEST PA'
      ''
      'WHERE'
      
        '      (OP.DATAOPERACAO        = TO_DATE(:DATAOPERACAO, '#39'DD/MM/YY' +
        'YY'#39'))'
      
        '  AND (OP.IDTIPOOPERACAO IN (PA.Idtipooperdiralt, PA.Idtipooperd' +
        'iralt + 10000,'
      
        '                             PA.IdTipoOperDirInc, PA.IdTipoOperD' +
        'irInc + 10000))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA      = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR   = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '        (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      ''
      '  AND (NOT EXISTS(SELECT DISTINCT HISTCARTINV.IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      
        '                  WHERE HISTCARTINV.IDOPERACAOINVEST = OP.IDOPER' +
        'ACAOINVEST))'
      ''
      'ORDER BY OP.IDOPERACAOINVEST'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
    object qryBuscaBoletaDTIIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTIIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDTIIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDTIEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDTIIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDTIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTIIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTIDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTINUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTIQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTIPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDTIDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDTIFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTIFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTIIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTIVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTIIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTIVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTIIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTIIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDTIORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTIPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryBuscaBoletaDTIIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDTITIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDTINATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTITIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTIRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTIDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTIDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTIIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDTIIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDTIFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDTIVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object qryBuscaBoletaDTIVLRVARIACAOATUAL: TFloatField
      FieldName = 'VLRVARIACAOATUAL'
    end
    object qryBuscaBoletaDTIPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTIDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryBuscaBoletaTCG: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAOINVEST OP, INVESTIMENTO IV, TIPOOPERACAO TP'
      'WHERE (OP.NUMDOCUMENTO   = :NUMDOCUMENTO)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '  AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (TP.IDTIPOOPERACAO = OP.IDTIPOOPERACAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 329
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
  object qryDesmarcaFlgReproc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV'
      'SET HISTCARTINV.FLGCALCSALDO = NULL'
      'WHERE'
      '      (HISTCARTINV.FLGCALCSALDO = '#39'5'#39')'
      '  AND (HISTCARTINV.IDTIPOINVEST = 2)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (HISTCARTINV.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (HISTCARTINV.IDCARTEIRAIN' +
        'VEST = :IDCARTEIRAINVEST))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (HISTCARTINV.IDINVESTIMEN' +
        'TO = :IDINVESTIMENTO))'
      
        '  AND ((:DATAMOVCARTINV IS NULL)    OR (HISTCARTINV.DATAMOVCARTI' +
        'NV >= TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39') ))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 428
    ParamData = <
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end>
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 574
    Top = 236
  end
  object qryBuscaATU: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HISTCARTINV.IDHISTCARTINV, HISTCARTINV.PLNCODIGO, HISTCAR' +
        'TINV.PLANO'
      'FROM HISTCARTINV'
      'WHERE HISTCARTINV.IDTIPOINVEST = 2'
      '  AND HISTCARTINV.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '  AND HISTCARTINV.IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      '  AND HISTCARTINV.IDINVESTIMENTO = :IDINVESTIMENTO'
      
        '  AND HISTCARTINV.DATAMOVCARTINV = TO_DATE(:DATAMOVCARTINV,'#39'DD/M' +
        'M/YYYY'#39')'
      
        '  AND (((:IDCARTEIRAGERENC IS NULL) AND (HISTCARTINV.IDCARTEIRAG' +
        'ERENC IS NULL)) OR'
      
        '       ((:IDCARTEIRAGERENC IS NOT NULL) AND (HISTCARTINV.IDCARTE' +
        'IRAGERENC  = :IDCARTEIRAGERENC)))'
      '  AND HISTCARTINV.TIPMOVCARTINV = '#39'ATU'#39' ')
    ValidateWithMask = True
    Left = 252
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end>
    object qryBuscaATUIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaATUPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaATUPLANO: TFloatField
      FieldName = 'PLANO'
    end
  end
  object qryMarcaFlgReprocAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDINVESTIMENTO, H.IDCARTEIRAINVEST, H.IDPLANPREVCTBPATR' +
        ', I.DESCINVESTIMENTO'
      'FROM HISTCARTINV H, INVESTIMENTO I'
      'WHERE (H.IDHISTCARTINV  IN'
      '           (SELECT MAX(H2.IDHISTCARTINV)'
      '            FROM HISTCARTINV H2'
      
        '            WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      
        '              AND ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEIRA' +
        'INVEST  = :IDCARTEIRAINVEST))'
      '              AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '              AND ((:IDINVESTIMENTO IS NULL) OR (H2.IDINVESTIMEN' +
        'TO = :IDINVESTIMENTO))'
      
        '              AND ((H2.DATAMOVCARTINV || H2.IDCARTEIRAINVEST || ' +
        'H2.IDINVESTIMENTO) IN'
      
        '                          (SELECT (MAX(H3.DATAMOVCARTINV) || H3.' +
        'IDCARTEIRAINVEST || H3.IDINVESTIMENTO)'
      '                           FROM HISTCARTINV H3'
      
        '                           WHERE ((:IDPLANPREVCTBPATR IS NULL) O' +
        'R (H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                             AND ((:IDCARTEIRAINVEST IS NULL) OR' +
        ' (H3.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      '                             AND (H3.IDCARTEIRAGERENC IS NULL)'
      
        '                             AND ((:IDINVESTIMENTO IS NULL) OR (' +
        'H3.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                             AND (H3.DATAMOVCARTINV < TO_DATE(:D' +
        'ATAATU,'#39'DD/MM/YYYY'#39') )'
      '                             AND (H3.IDTIPOINVEST = 2)'
      '                             AND (H3.SALDOQTDEINVCART > 0)'
      
        '                           GROUP BY H3.IDINVESTIMENTO, H3.IDCART' +
        'EIRAINVEST))'
      '              AND (H2.IDTIPOINVEST = 2)'
      '              AND (H2.SALDOQTDEINVCART > 0)'
      '            GROUP BY H2.IDINVESTIMENTO, H2.IDCARTEIRAINVEST))'
      
        '  AND ((NVL(H.SALDOQTDEINVCART,0) > 0) OR ((NVL(H.SALDOQTDEINVCA' +
        'RT,0) = 0) AND (H.TIPMOVCARTINV = '#39'INI'#39')))'
      
        '  AND (H.DATAMOVCARTINV >= LEAST(TO_DATE('#39'01/11/2003'#39','#39'DD/MM/YYY' +
        'Y'#39'), TO_DATE(:DATAATU,'#39'DD/MM/YYYY'#39')))'
      '  AND (H.IDINVESTIMENTO = I.IDINVESTIMENTO)')
    ValidateWithMask = True
    Left = 56
    Top = 4
    ParamData = <
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end>
    object qryMarcaFlgReprocAuxIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryMarcaFlgReprocAuxIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryMarcaFlgReprocAuxIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryMarcaFlgReprocAuxDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
  end
  object qryVerMarcaReproc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAOPERACAO AS DATA'
      'FROM OPERACAOINVEST'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (IDCARTEIRAINVEST  = :IDC' +
        'ARTEIRAINVEST))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (IDINVESTIMENTO    = :IDI' +
        'NVESTIMENTO))'
      '  AND DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      'GROUP BY NUMDOCUMENTO, DATAOPERACAO'
      ''
      'UNION'
      ''
      'SELECT DATAMOVCUSTOD AS DATA'
      'FROM OPERCUSTODIA'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      
        '  AND (((IDCARTEIRAORIG IS NULL)    OR (IDCARTEIRAORIG    = :IDC' +
        'ARTEIRAINVEST)) OR'
      
        '       ((IDCARTEIRADEST IS NULL)    OR (IDCARTEIRADEST    = :IDC' +
        'ARTEIRAINVEST)))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (IDINVESTIMENTO    = :IDI' +
        'NVESTIMENTO))'
      '  AND DATAMOVCUSTOD BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                            TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      'GROUP BY IDBOLETA, DATAMOVCUSTOD'
      ''
      'UNION'
      ''
      'SELECT C.DATACOTAACAO  AS DATA'
      'FROM COTACAOACAO  C'
      'WHERE C.IDACAO        = :IDINVESTIMENTO'
      '  AND C.DATACOTAACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                             TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '  AND EXISTS (SELECT H.IDHISTCARTINV'
      '              FROM HISTCARTINV H'
      '              WHERE H.IDHISTCARTINV ='
      '                      (SELECT MAX(H1.IDHISTCARTINV)'
      '                       FROM HISTCARTINV H1, PARAMINVEST P'
      
        '                       WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H' +
        '1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                         AND ((:IDCARTEIRAINVEST IS NULL)  OR (H' +
        '1.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      
        '                         AND ((:IDINVESTIMENTO IS NULL)    OR (H' +
        '1.IDINVESTIMENTO    = :IDINVESTIMENTO))'
      '                         AND  H1.DATAMOVCARTINV ='
      '                                (SELECT MAX(H2.DATAMOVCARTINV)'
      
        '                                 FROM HISTCARTINV H2, PARAMINVES' +
        'T P1'
      
        '                                 WHERE   ((:IDPLANPREVCTBPATR IS' +
        ' NULL) OR (H2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                   AND   ((:IDCARTEIRAINVEST IS ' +
        'NULL)  OR (H2.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      
        '                                   AND   ((:IDINVESTIMENTO IS NU' +
        'LL)    OR (H2.IDINVESTIMENTO    = :IDINVESTIMENTO))'
      
        '                                   AND  (H2.DATAMOVCARTINV <= TO' +
        '_DATE(:DATAINI, '#39'DD/MM/YYYY'#39'))'
      
        '                                   AND  (H2.IDCARTEIRAGERENC IS ' +
        'NULL)'
      
        '                                   AND ((H2.IDTIPOOPERACAO IS NU' +
        'LL) OR'
      
        '                                        (H2.IDTIPOOPERACAO NOT I' +
        'N (P1.IDTIPOOPERDIRDIV,P1.IDTIPOOPERDIRJUR))))'
      '                         AND (H1.IDCARTEIRAGERENC IS NULL)'
      '                         AND ((H1.IDTIPOOPERACAO IS NULL) OR'
      
        '                              (H1.IDTIPOOPERACAO NOT IN (P.IDTIP' +
        'OOPERDIRDIV,P.IDTIPOOPERDIRJUR))))'
      '                AND NVL(H.SALDOQTDEINVCART,0) > 0)'
      ''
      '')
    ValidateWithMask = True
    Left = 252
    Top = 236
    ParamData = <
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end>
    object qryVerMarcaReprocDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object qryVerPrimeiroSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS NUMREG'
      'FROM HISTCARTINV'
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      '  AND DATAMOVCARTINV < TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 252
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end>
    object qryVerPrimeiroSaldoNUMREG: TFloatField
      FieldName = 'NUMREG'
    end
  end
  object qryBuscaBoletaDTB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVALORES' +
        ','
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAINVES' +
        'T,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOPERAC' +
        'AO,'
      
        '   OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFECHBO' +
        'L,'
      '   OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,  OP.IDMOTIVOBLOQUEIO, OP.ORIGDEST,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.RECPAG,            TP.DESCTIPOOPERACAO,'
      '   IV.DESCINVESTIMENTO,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CA.DESCCARTINVEST,'
      '   ODI.DATAAGE'
      ''
      
        'FROM OPERACAOINVEST OP, TIPOOPERACAO TP, OPERDIREITOXINV OD, INV' +
        'ESTIMENTO IV,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA, OPERACAODIREITO ODI'
      ''
      'WHERE (OP.NUMDOCUMENTO '#9'  =:IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (ODI.IDOPERACAODIREITO  = OP.IDOPERACAODIREITO)  '
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR   = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDTBIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTBIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDTBIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDTBEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDTBIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDTBIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTBIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTBIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTBDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTBNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTBQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTBPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDTBDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTBIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDTBFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTBFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTBIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTBVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTBIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTBVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTBIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTBIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDTBIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryBuscaBoletaDTBORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTBTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDTBNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTBTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTBRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTBDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTBDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTBPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTBDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaDTBDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
  end
  object qryBuscaBoletaDTD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVALORES' +
        ','
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAINVES' +
        'T,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOPERAC' +
        'AO,'
      
        '   OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFECHBO' +
        'L,'
      '   OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,  OP.ORIGDEST,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.DESCTIPOOPERACAO,  TP.FLGCONTAINVEST,'
      '   IV.DESCINVESTIMENTO,'
      '   OC.IDMOTIVOBLOQDEST, OC.IDMOTIVOBLOQORIG,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CA.DESCCARTINVEST'
      ''
      
        'FROM OPERACAOINVEST OP, OPERCUSTODIA OC, TIPOOPERACAO TP, OPERDI' +
        'REITOXINV OD, INVESTIMENTO IV,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA      = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR   = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 464
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDTDIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTDIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDTDIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDTDEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDTDIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDTDIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTDIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTDIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTDDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTDNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTDQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTDPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDTDDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTDIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDTDFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTDFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTDIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTDVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTDIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTDVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTDIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTDIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDTDORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTDTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDTDNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTDTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTDDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTDDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTDIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDTDIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDTDFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDTDPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTDDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryBuscaBoletaDRS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,     OP.IDCORRETVALORE' +
        'S,'
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,          OP.IDCARTEIRAINVE' +
        'ST,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,    OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,      OP.PRECOUNITOPERA' +
        'CAO,'
      
        '   OP.DATAVENCOPER,      OP.IDFORCLI,          OP.FLGSTATUSFECHB' +
        'OL,'
      '   OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC,  OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR, OP.VLRIR,             OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,  OP.IDOPERACAODIREITO, OP.ORIGDEST,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO,  TP.TIPOCUSTODIA,'
      '   TP.RECPAG,            TP.DESCTIPOOPERACAO,'
      '   IV.DESCINVESTIMENTO,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CA.DESCCARTINVEST'
      ''
      
        'FROM OPERACAOINVEST OP, TIPOOPERACAO TP, OPERDIREITOXINV OD, INV' +
        'ESTIMENTO IV,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.NUMDOCUMENTO '#9'  =:IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR   = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 372
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDRSIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDRSIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDRSIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDRSEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDRSIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDRSIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDRSIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDRSIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDRSDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDRSNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDRSQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDRSPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDRSDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDRSIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDRSFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRSFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRSIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDRSVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDRSIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDRSVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDRSIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDRSIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDRSIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDRSORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRSTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDRSNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRSTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRSRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRSDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDRSDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDRSPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDRSDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryBuscaBoletaDCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVALORES' +
        ','
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAINVES' +
        'T,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOPERAC' +
        'AO,'
      
        '   OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFECHBO' +
        'L,'
      '   OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      
        '   OP.IDOPERACAOORIGEM,  OP.IDOPERCUSTODIA,   OP.IDOPERACAODIREI' +
        'TO,'
      '   OP.VLRCUSTOATUAL,     OP.VLRVARIACAOATUAL, OP.ORIGDEST,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.DESCTIPOOPERACAO,  TP.FLGCONTAINVEST,'
      '   OC.IDMOTIVOBLOQDEST,  OC.IDMOTIVOBLOQORIG,'
      '   IV.DESCINVESTIMENTO,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CA.DESCCARTINVEST'
      ''
      'FROM'
      
        '   OPERACAOINVEST OP, OPERCUSTODIA OC, TIPOOPERACAO TP, OPERDIRE' +
        'ITOXINV OD, INVESTIMENTO IV,'
      '   VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      'WHERE (OP.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :ID' +
        'CARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA      = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR   = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST'
      ''
      '')
    ValidateWithMask = True
    Left = 464
    Top = 98
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDCIIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDCIIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDCIIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDCIEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDCIIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDCIIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDCIDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDCINUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDCIQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDCIPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDCIDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDCIFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDCIFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDCIIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDCIVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDCIIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDCIVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDCIIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDCIIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDCIIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
    object qryBuscaBoletaDCIIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDCIVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object qryBuscaBoletaDCIVLRVARIACAOATUAL: TFloatField
      FieldName = 'VLRVARIACAOATUAL'
    end
    object qryBuscaBoletaDCIORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDCITIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDCINATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDCITIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDCIDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDCIDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDCIIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDCIIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDCIFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDCIPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDCIDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object QryVerInvestOrigDest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO'
      'FROM   OPERDIREITOXINV'
      'WHERE  IDOPERACAODIREITO = :IDOPERACAODIREITO AND'
      '       ORIGDEST          = '#39'O'#39)
    ValidateWithMask = True
    Left = 252
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
  end
  object QryBuscaOperInvestPend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(O.QTDEOPERACAO) AS QTDEOPERACAO'
      'FROM   OPERACAOINVEST O'
      'WHERE  O.IDOPERACAOORIGEM = :IDOPERACAOORIGEM AND'
      '       O.IDTIPOOPERACAO   = :IDTIPOOPERACAO '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
  end
  object qryBuscaBoletaDTA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.IDINVESTIMENTO,    OI.IDOPERACAOINVEST,  OI.IDTIPOOPER' +
        'ACAO, OI.IDCARTEIRAINVEST,'
      '       OI.IDCARTEIRAGERENC,  OI.DATAOPERACAO,  OI.QTDEOPERACAO,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLROPERACAO,'
      
        '       OI.IDPLANPREVCTBPATR, OI.IDOPERACAODIREITO, OI.NUMDOCUMEN' +
        'TO,   OI.VLRIR,'
      '       OI.IDLOTE,            OI.DATAVENCOPER,'
      '       TP.NATUREZAOPERACAO,  TP.DESCTIPOOPERACAO,  TP.RECPAG,'
      
        '       IV.DESCINVESTIMENTO,  OD.IDTIPOOPERACAO AS IDTIPOOPERACAO' +
        'AGE,'
      '       CA.DESCCARTINVEST,    PP.PLANPRVCONTABPATRO, OD.DATAAGE'
      ''
      
        'FROM OPERACAODIREITO OD, OPERACAOINVEST OI, TIPOOPERACAO TP, INV' +
        'ESTIMENTO IV,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE OI.NUMDOCUMENTO      = :IDBOLETA'
      '  AND OI.IDINVESTIMENTO    = :IDINVESTIMENTO'
      '  AND OI.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '  AND OI.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      
        '  AND ((:IDPLANPREVCTBPATR IS NOT NULL) OR (OI.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR))'
      '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND OI.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST'
      
        '  AND (((OI.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OI.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS( SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OI.IDOPERACAOINVEST))'
      'ORDER BY IDCARTEIRAINVEST, NVL(IDCARTEIRAGERENC,0)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 143
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
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
      end>
    object qryBuscaBoletaDTAIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDTAIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDTAIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDTAIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDTAIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDTADATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDTAQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDTAVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDTAIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDTAIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDTANUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDTAVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDTAIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDTADATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDTANATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTADESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDTARECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDTADESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDTAIDTIPOOPERACAOAGE: TFloatField
      FieldName = 'IDTIPOOPERACAOAGE'
    end
    object qryBuscaBoletaDTADESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaDTAPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDTADATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
  end
  object QryUpdHistCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV SET SALDOQTDECPMF=:SALDOQTDECPMF'
      'WHERE  IDHISTCARTINV =:IDHISTCARTINV AND SALDOQTDECPMF <> 0'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 374
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SALDOQTDECPMF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end>
  end
  object QryBuscaHistCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   HISTCARTINV'
      'WHERE  IDHISTCARTINV =:IDHISTCARTINV AND SALDOQTDECPMF <> 0')
    ValidateWithMask = True
    Left = 154
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end>
  end
  object QryOperacaoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      '   OPERACAODIREITO'
      'WHERE'
      '   IDOPERACAODIREITO =:IDOPERACAODIREITO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 258
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaBoletaVSU: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDINVESTIMENTO,         IV.IDEMISSOR,              IV.DESC' +
        'INVESTIMENTO,'
      
        '   OP.IDLOTE,                 OP.IDPLANPREVCTBPATR,      OP.NUMD' +
        'OCUMENTO,'
      
        '   OP.IDCARTEIRAINVEST,       OP.DATAOPERACAO,           OP.QTDE' +
        'OPERACAO,'
      
        '   OP.IDOPERACAOINVEST,       OP.DATAVENCOPER,           OP.IDCU' +
        'STODIANTE,'
      
        '   OP.EMPRESAPROP,            OP.IDMODULO,               OP.IDTI' +
        'POOPERACAO,'
      
        '   OP.PRECOUNITOPERACAO,      OP.IDFORCLI,               OP.FLGS' +
        'TATUSFECHBOL,'
      
        '   OP.FLGSTATUSORDMOV,        OP.IDCARTEIRAGERENC,       OP.VLRO' +
        'PERACAO,'
      '   OP.VLRIR,'
      
        '   TP.TIPOMOVTO,              TP.NATUREZAOPERACAO,       TP.TIPO' +
        'CUSTODIA,'
      '   TP.DESCTIPOOPERACAO,       TP.FLGCONTAINVEST,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CA.DESCCARTINVEST'
      ''
      'FROM'
      
        '   OPERACAOINVEST OP, TIPOOPERACAO TP, INVESTIMENTO IV, VWPLANPR' +
        'EVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (OP.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (OP.IDTIPOOPERACAO    IN (-114, -10114))'
      '  AND (OP.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO)'
      '  AND (OP.IDINVESTIMENTO    = IV.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY OP.IDOPERACAOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 428
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object QryBuscaBoletaVSUIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryBuscaBoletaVSUIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object QryBuscaBoletaVSUDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaBoletaVSUIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryBuscaBoletaVSUIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryBuscaBoletaVSUNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryBuscaBoletaVSUIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaBoletaVSUDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryBuscaBoletaVSUQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryBuscaBoletaVSUIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryBuscaBoletaVSUDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryBuscaBoletaVSUIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryBuscaBoletaVSUEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object QryBuscaBoletaVSUIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object QryBuscaBoletaVSUIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryBuscaBoletaVSUPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object QryBuscaBoletaVSUIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryBuscaBoletaVSUFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object QryBuscaBoletaVSUFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object QryBuscaBoletaVSUIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryBuscaBoletaVSUVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryBuscaBoletaVSUVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryBuscaBoletaVSUTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object QryBuscaBoletaVSUNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryBuscaBoletaVSUTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object QryBuscaBoletaVSUDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaBoletaVSUFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object QryBuscaBoletaVSUPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryBuscaBoletaVSUDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryBuscaBoletaTCU: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERCUSTODIA,    OP.IDMOTIVOBLOQDEST,  OP.IDMOTIVOBLOQOR' +
        'IG,'
      
        '   OP.IDCUSTODIANTEDEST, OP.IDCUSTODIANTEORIG, OP.IDINVESTIMENTO' +
        ','
      
        '   OP.IDCARTEIRADEST,    OP.IDCARTEIRAORIG,    OP.IDHISTCARTINVD' +
        'EST,'
      
        '   OP.IDHISTCARTINVORIG, OP.IDCUSTODIAORIG,    OP.IDCUSTODIADEST' +
        ','
      '   OP.DATAMOVCUSTOD,     OP.IDLOTE,            OP.QUANTIDADE,'
      
        '   OP.IDBOLETA,          IV.IDEMISSOR,         IV.DESCINVESTIMEN' +
        'TO,'
      
        '   OP.IDPLANPREVCTBPATR, OP.FLGTIPOCONTAORIG,  OP.FLGTIPOCONTADE' +
        'ST,'
      
        '   CI.DESCCARTINVEST,    PP.PLANPRVCONTABPATRO,OP.IDPLANPREVCTBD' +
        'EST,'
      
        '   CASE WHEN IDMOTIVOBLOQORIG <> IDMOTIVOBLOQDEST THEN '#39'TRANSFER' +
        'ENCIA DE MOTIVO DE BLOQUEIO'#39
      
        '        WHEN IDCUSTODIANTEORIG <> IDCUSTODIANTEDEST THEN '#39'TRANSF' +
        'ERENCIA DE CUSTODIANTE'#39
      '        ELSE '#39'TRANSFERENCIA NA CUSTODIA'#39
      '   END AS DESCTIPOOPERACAO'
      
        'FROM  OPERCUSTODIA OP, INVESTIMENTO IV, CARTEIRAINVEST CI, VWPLA' +
        'NPREVCTBPATR PP'
      'WHERE (OP.IDBOLETA = :IDBOLETA)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '  AND (OP.IDINVESTIMENTO  = IV.IDINVESTIMENTO)'
      '  AND (OP.IDCARTEIRAORIG = CI.IDCARTEIRAINVEST)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (NOT EXISTS (SELECT IDCUSTODIA'
      '                   FROM HISTCUSTODIA'
      '                   WHERE IDOPERCUSTODIA = OP.IDOPERCUSTODIA))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 285
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryBuscaBoletaTCUIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
    object qryBuscaBoletaTCUIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaTCUIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaTCUIDCUSTODIANTEDEST: TFloatField
      FieldName = 'IDCUSTODIANTEDEST'
    end
    object qryBuscaBoletaTCUIDCUSTODIANTEORIG: TFloatField
      FieldName = 'IDCUSTODIANTEORIG'
    end
    object qryBuscaBoletaTCUIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaTCUIDCARTEIRADEST: TFloatField
      FieldName = 'IDCARTEIRADEST'
    end
    object qryBuscaBoletaTCUIDCARTEIRAORIG: TFloatField
      FieldName = 'IDCARTEIRAORIG'
    end
    object qryBuscaBoletaTCUIDHISTCARTINVDEST: TFloatField
      FieldName = 'IDHISTCARTINVDEST'
    end
    object qryBuscaBoletaTCUIDHISTCARTINVORIG: TFloatField
      FieldName = 'IDHISTCARTINVORIG'
    end
    object qryBuscaBoletaTCUIDCUSTODIAORIG: TFloatField
      FieldName = 'IDCUSTODIAORIG'
    end
    object qryBuscaBoletaTCUIDCUSTODIADEST: TFloatField
      FieldName = 'IDCUSTODIADEST'
    end
    object qryBuscaBoletaTCUDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
    end
    object qryBuscaBoletaTCUIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaTCUQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryBuscaBoletaTCUIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletaTCUIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaBoletaTCUDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaTCUIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaTCUDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 35
    end
    object qryBuscaBoletaTCUDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaTCUPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaTCUIDPLANPREVCTBDEST: TFloatField
      FieldName = 'IDPLANPREVCTBDEST'
    end
    object qryBuscaBoletaTCUFLGTIPOCONTAORIG: TFloatField
      FieldName = 'FLGTIPOCONTAORIG'
    end
    object qryBuscaBoletaTCUFLGTIPOCONTADEST: TFloatField
      FieldName = 'FLGTIPOCONTADEST'
    end
  end
  object QryBuscaAnuncio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       OPERACAOINVEST.IDOPERACAODIREITO, OPERACAOINVEST.IDCARTEI' +
        'RAINVEST, OPERACAOINVEST.IDTIPOOPERACAO,'
      
        '       (OPERACAOINVEST.VLROPERACAO + OPERACAOINVEST.VLRREMUNERAC' +
        'AO - OPERACAOINVEST.VLRIR - OPERACAOINVEST.VLRIRREMUNER) AS VLRO' +
        'PERACAO'
      'FROM'
      '       OPERACAOINVEST'
      'WHERE'
      
        '       OPERACAOINVEST.DATAOPERACAO      < TO_DATE(:DATAOPERACAO,' +
        #39'DD/MM/YYYY'#39')'
      '  AND  OPERACAOINVEST.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND  OPERACAOINVEST.IDTIPOOPERACAO    = :IDTIPOOPERACAO'
      '  AND  OPERACAOINVEST.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      
        '  AND  ((:IDOPERACAOORIGEM IS NULL) OR (:IDOPERACAOORIGEM = 0) O' +
        'R (OPERACAOINVEST.IDOPERACAOINVEST = :IDOPERACAOORIGEM))'
      '  AND  OPERACAOINVEST.IDCARTEIRAGERENC IS NULL')
    ValidateWithMask = True
    Left = 464
    Top = 329
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptResult
      end>
  end
  object QryCarteiraGerenc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM '
      'CARTEIRAGERENC ')
    ValidateWithMask = True
    Left = 464
    Top = 428
  end
  object QryVerProvisaoCartGerenc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTPROVISAO'
      'FROM   HISTPROVISAO'
      'WHERE  IDOPERACAODIREITO =:IDOPERACAODIREITO'
      '  AND  IDCARTEIRAGERENC  =:IDCARTEIRAGERENC'
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end>
  end
  object qryBuscaBoletaDRE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVALORES' +
        ','
      
        '   OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAINVES' +
        'T,'
      '   OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACAO,'
      
        '   OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOPERAC' +
        'AO,'
      
        '   OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFECHBO' +
        'L,'
      '   OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO,'
      '   OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      '   OP.IDOPERACAOORIGEM,  OP.IDOPERACAODIREITO,OP.ORIGDEST,'
      '   TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODIA,'
      '   TP.RECPAG,            TP.DESCTIPOOPERACAO, TP.FLGCONTAINVEST,'
      '   IV.DESCINVESTIMENTO,'
      '   OC.IDMOTIVOBLOQDEST, OC.IDMOTIVOBLOQORIG,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CA.DESCCARTINVEST'
      ''
      
        'FROM OPERACAOINVEST OP, TIPOOPERACAO TP, OPERDIREITOXINV OD, INV' +
        'ESTIMENTO IV, OPERCUSTODIA OC,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.NUMDOCUMENTO =:IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (OP.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA      = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST'
      '')
    ValidateWithMask = True
    Left = 464
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDREIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDREIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDREIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDREEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDREIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDREIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDREIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDREIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDREDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDRENUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDREQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDREPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDREDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDREIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDREFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDREFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDREIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDREVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDREIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDREVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDREIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDREIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDREIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDREORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRETIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDRENATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRETIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDRERECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDREDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDREDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDREIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDREIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDREFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDREPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDREDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryUpdBoleta: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET STATUS       = :STATUS,'
      
        '    PLANO        = DECODE(SIGN(:PLANO),  NULL, DECODE(PLANO,0,NU' +
        'LL,PLANO), :PLANO),'
      
        '    PLNCODIGO    = DECODE(SIGN(:PLNCODIGO), NULL, DECODE(PLNCODI' +
        'GO,0,NULL,PLNCODIGO), :PLNCODIGO),'
      
        '    CODDOCUMENTO = DECODE(SIGN(:CODDOCUMENTO), NULL, DECODE(CODD' +
        'OCUMENTO,0,NULL,CODDOCUMENTO), :CODDOCUMENTO)'
      'WHERE IDBOLETA   = :IDBOLETA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
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
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
  end
  object qryBuscaBoletaDSA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVAL' +
        'ORES,'
      
        '       OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAI' +
        'NVEST,'
      
        '       OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACA' +
        'O,'
      
        '       OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOP' +
        'ERACAO,'
      
        '       OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFE' +
        'CHBOL,'
      
        '       OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO' +
        ','
      '       OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      '       OP.IDOPERACAOORIGEM,  OP.IDOPERACAODIREITO,OP.ORIGDEST,'
      '       OP.VLRCUSTOATUAL,     OP.VLRVARIACAOATUAL,'
      
        '       TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODI' +
        'A,'
      
        '       TP.RECPAG,            TP.DESCTIPOOPERACAO, TP.FLGCONTAINV' +
        'EST,'
      '       IV.DESCINVESTIMENTO,'
      '       OC.IDMOTIVOBLOQDEST,  OC.IDMOTIVOBLOQORIG,'
      '       PP.PLANPRVCONTABPATRO,'
      '       CA.DESCCARTINVEST'
      ''
      
        'FROM OPERACAOINVEST OP, TIPOOPERACAO TP, OPERDIREITOXINV OD, INV' +
        'ESTIMENTO IV, OPERCUSTODIA OC,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.NUMDOCUMENTO    = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (OP.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO      = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO      = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA      = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 464
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaDSAIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaDSAIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaDSAIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaDSAEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaDSAIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaDSAIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaDSAIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaDSAIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaDSADATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaDSANUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaDSAQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaDSAPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaDSADATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaDSAIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaDSAFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDSAFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDSAIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaDSAVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaDSAIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaDSAVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaDSAIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaDSAIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaDSAIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaDSAORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDSAVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object qryBuscaBoletaDSAVLRVARIACAOATUAL: TFloatField
      FieldName = 'VLRVARIACAOATUAL'
    end
    object qryBuscaBoletaDSATIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaDSANATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDSATIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDSARECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaDSADESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaDSADESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaDSAIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaDSAIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaDSAFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaDSAPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaDSADESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryBuscaBoletaCSA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERACAOINVEST,  OP.IDCUSTODIANTE,    OP.IDCORRETVAL' +
        'ORES,'
      
        '       OP.EMPRESAPROP,       OP.IDMODULO,         OP.IDCARTEIRAI' +
        'NVEST,'
      
        '       OP.IDINVESTIMENTO,    OP.IDTIPOOPERACAO,   OP.DATAOPERACA' +
        'O,'
      
        '       OP.NUMDOCUMENTO,      OP.QTDEOPERACAO,     OP.PRECOUNITOP' +
        'ERACAO,'
      
        '       OP.DATAVENCOPER,      OP.IDFORCLI,         OP.FLGSTATUSFE' +
        'CHBOL,'
      
        '       OP.FLGSTATUSORDMOV,   OP.IDCARTEIRAGERENC, OP.VLROPERACAO' +
        ','
      '       OP.IDPLANPREVCTBPATR, OP.VLRIR,            OP.IDLOTE,'
      '       OP.IDOPERACAOORIGEM,  OP.IDOPERACAODIREITO,OP.ORIGDEST,'
      '       OP.VLRCUSTOATUAL,     OP.VLRVARIACAOATUAL,'
      
        '       TP.TIPOMOVTO,         TP.NATUREZAOPERACAO, TP.TIPOCUSTODI' +
        'A,'
      
        '       TP.RECPAG,            TP.DESCTIPOOPERACAO, TP.FLGCONTAINV' +
        'EST,'
      '       IV.DESCINVESTIMENTO,'
      '       OC.IDMOTIVOBLOQDEST, OC.IDMOTIVOBLOQORIG,'
      '       PP.PLANPRVCONTABPATRO,'
      '       CA.DESCCARTINVEST'
      ''
      
        'FROM OPERACAOINVEST OP, TIPOOPERACAO TP, OPERDIREITOXINV OD, INV' +
        'ESTIMENTO IV, OPERCUSTODIA OC,'
      '     VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA'
      ''
      'WHERE (OP.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (OP.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (TP.IDTIPOOPERACAO = OP.IDTIPOOPERACAO)'
      '  AND (OD.IDOPERACAOINVEST(+) = OP.IDOPERACAOINVEST)'
      '  AND (IV.IDINVESTIMENTO = OP.IDINVESTIMENTO)'
      '  AND (OP.IDOPERCUSTODIA = OC.IDOPERCUSTODIA(+))'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      
        '  AND (((OP.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC I' +
        'S NULL)) OR'
      '       (OP.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC))'
      '  AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST'
      '                  FROM HISTCARTINV'
      '                  WHERE IDOPERACAOINVEST = OP.IDOPERACAOINVEST))'
      ''
      'ORDER BY IDOPERACAOINVEST'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
    object qryBuscaBoletaCSAIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaCSAIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaCSAIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaBoletaCSAEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaBoletaCSAIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaBoletaCSAIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaCSAIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaCSAIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaCSADATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaCSANUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaBoletaCSAQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaCSAPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaBoletaCSADATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaBoletaCSAIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaBoletaCSAFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaCSAFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaCSAIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaCSAVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaBoletaCSAIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaCSAVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryBuscaBoletaCSAIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaCSAIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryBuscaBoletaCSAIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryBuscaBoletaCSAORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaCSAVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object qryBuscaBoletaCSAVLRVARIACAOATUAL: TFloatField
      FieldName = 'VLRVARIACAOATUAL'
    end
    object qryBuscaBoletaCSATIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryBuscaBoletaCSANATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaCSATIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaCSARECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaCSADESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaCSADESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaCSAIDMOTIVOBLOQDEST: TFloatField
      FieldName = 'IDMOTIVOBLOQDEST'
    end
    object qryBuscaBoletaCSAIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
    end
    object qryBuscaBoletaCSAFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryBuscaBoletaCSAPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaCSADESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryVerTRCPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MIN(DATAMOVCUSTOD) AS DATAMOVCUSTOD, IDINVESTIMENTO, IDPL' +
        'ANPREVCTBPATR, IDCARTEIRAINVEST'
      'FROM (SELECT O.DATAMOVCUSTOD, O.IDINVESTIMENTO,'
      
        '             DECODE(:IDCARTEIRAINVEST, O.IDCARTEIRAORIG, O.IDCAR' +
        'TEIRADEST, O.IDCARTEIRAORIG) AS IDCARTEIRAINVEST,'
      '             DECODE(:IDPLANPREVCTBPATR, O.IDPLANPREVCTBPATR,'
      
        '                                        DECODE(O.IDPLANPREVCTBDE' +
        'ST, NULL, O.IDPLANPREVCTBPATR, O.IDPLANPREVCTBDEST),'
      
        '                                        O.IDPLANPREVCTBPATR) AS ' +
        'IDPLANPREVCTBPATR'
      '      FROM OPERCUSTODIA O, BOLETA B'
      '      WHERE O.IDINVESTIMENTO = :IDINVESTIMENTO'
      '        AND O.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      
        '        AND :IDCARTEIRAINVEST IN (O.IDCARTEIRAORIG, O.IDCARTEIRA' +
        'DEST)'
      
        '        AND O.DATAMOVCUSTOD > TO_DATE(:DATAMOVCUSTOD,'#39'DD/MM/YYYY' +
        #39')'
      '        AND O.IDBOLETA = B.IDBOLETA'
      
        '        AND ((:TIPMOVBOLETA IS NULL) OR (B.TIPMOVBOLETA = :TIPMO' +
        'VBOLETA)))'
      'GROUP BY IDINVESTIMENTO, IDPLANPREVCTBPATR, IDCARTEIRAINVEST ')
    ValidateWithMask = True
    Left = 582
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVCUSTOD'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end>
    object qryVerTRCPeriodoDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
    end
    object qryVerTRCPeriodoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryVerTRCPeriodoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryVerTRCPeriodoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
  end
  object qryNumBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BOLETA.IDBOLETA'
      'FROM BOLETA'
      'WHERE'
      '   (:IDBOLETA IS NULL) OR (BOLETA.IDBOLETA = :IDBOLETA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end>
  end
  object qrySaldosTRCPlanos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CA.DESCCARTINVEST,'
      '   IV.DESCINVESTIMENTO,'
      '   IV.IDEMISSOR,'
      '   H1.IDPLANPREVCTBPATR,'
      '   NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,'
      
        '   DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRIN' +
        'VCART,0))) AS SALDOVLRINVCART,'
      '   ROUND(NVL(H1.SALDOAQUI,0),2) AS SALDOAQUI,'
      
        '   DECODE(H1.SALDOQTDEINVCART,0,0,(ROUND((H1.SALDOAQUI / H1.SALD' +
        'OQTDEINVCART),10))) AS PUCUSTO,'
      '   NVL(H1.SALDOVARIACAO,0) AS SALDOVARIACAO,'
      '   NVL(H1.SALDOPROVPERDA,0) AS SALDOPROVPERDA,'
      '   NVL(H1.SALDOQTDECPMF,0) AS SALDOQTDECPMF,'
      
        '   (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS SAL' +
        'DOCCI,'
      '   0 AS PERCTRANSFERIDO,'
      '   ROUND((H1.SALDOQTDEINVCART * 0),8) AS QTDTRANSFERIDO,'
      '   ROUND((H1.SALDOVLRINVCART * 0),2) AS VLRTRANSFERIDO    '
      'FROM'
      '   HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA'
      'WHERE'
      '   (H1.IDHISTCARTINV IN (SELECT MAX(H2.IDHISTCARTINV)'
      '                         FROM HISTCARTINV H2, PARAMINVEST P2'
      '                         WHERE'
      '                            (H2.IDTIPOINVEST = 2)'
      
        '                            AND ((:IDPLANPREVCTBPATR IS NULL) OR' +
        ' (H2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR ))'
      
        '                            AND ((:IDCARTEIRAINVEST IS NULL)  OR' +
        ' (H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                            AND ((:IDINVESTIMENTO IS NULL)    OR' +
        ' (H2.IDINVESTIMENTO = :IDINVESTIMENTO ))'
      '                            AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '                            AND (H2.DATAMOVCARTINV  = TO_DATE(:D' +
        'ATAMOVCARTINV,'#39'DD/MM/YYYY'#39'))'
      
        '                            AND (H2.IDTIPOOPERACAO NOT IN (NVL(P' +
        '2.IDTIPOOPERDIRDSU,0), (NVL(P2.IDTIPOOPERDIRDSU,0) + 10000),'
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERDIRJUR,0), (NVL(P2.IDTIPOOPERDIRJUR,0) + 10000),'
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERDIRMUL,0), (NVL(P2.IDTIPOOPERDIRMUL,0) + 10000),'
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERDIRDIV,0), (NVL(P2.IDTIPOOPERDIRDIV,0) + 10000),'
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERRFRAC ,0), (NVL(P2.IDTIPOOPERRFRAC ,0) + 10000)))'
      
        '                         GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCAR' +
        'TEIRAINVEST, H2.IDINVESTIMENTO))'
      '  AND (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO(+))'
      '  AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+))'
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
    Left = 154
    Top = 484
    ParamData = <
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
        Name = 'DATAMOVCARTINV'
        ParamType = ptUnknown
      end>
    object qrySaldosTRCPlanosDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 38
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qrySaldosTRCPlanosDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qrySaldosTRCPlanosSALDOQTDEINVCART: TFloatField
      DisplayLabel = 'Saldo de Qtd.'
      DisplayWidth = 20
      FieldName = 'SALDOQTDEINVCART'
      DisplayFormat = '###,###,###,###,##0.00000000'
    end
    object qrySaldosTRCPlanosSALDOVLRINVCART: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 18
      FieldName = 'SALDOVLRINVCART'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySaldosTRCPlanosPERCTRANSFERIDO: TFloatField
      DisplayLabel = '% a Transferir'
      DisplayWidth = 11
      FieldName = 'PERCTRANSFERIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySaldosTRCPlanosQTDTRANSFERIDO: TFloatField
      DisplayLabel = 'Qtd a Transferir'
      DisplayWidth = 18
      FieldName = 'QTDTRANSFERIDO'
      DisplayFormat = '###,###,###,###,##0.00000000'
    end
    object qrySaldosTRCPlanosSALDOCCI: TFloatField
      DisplayLabel = 'Saldo de Qtd. CCI'
      DisplayWidth = 18
      FieldName = 'SALDOCCI'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00000000'
    end
    object qrySaldosTRCPlanosSALDOQTDECPMF: TFloatField
      DisplayLabel = 'Saldo CCI'
      DisplayWidth = 18
      FieldName = 'SALDOQTDECPMF'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00000000'
    end
    object qrySaldosTRCPlanosSALDOAQUI: TFloatField
      DisplayLabel = 'Saldo de Custo'
      DisplayWidth = 18
      FieldName = 'SALDOAQUI'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySaldosTRCPlanosPUCUSTO: TFloatField
      DisplayLabel = 'PU de Custo'
      DisplayWidth = 18
      FieldName = 'PUCUSTO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00000000'
    end
    object qrySaldosTRCPlanosSALDOVARIACAO: TFloatField
      DisplayLabel = 'Saldo de Variação'
      DisplayWidth = 18
      FieldName = 'SALDOVARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySaldosTRCPlanosSALDOPROVPERDA: TFloatField
      DisplayLabel = 'Saldo de Prov. Perda'
      DisplayWidth = 18
      FieldName = 'SALDOPROVPERDA'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySaldosTRCPlanosVLRTRANSFERIDO: TFloatField
      FieldName = 'VLRTRANSFERIDO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
  end
  object qryBuscaBoletaTRP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.DATAOPERACAO, IV.DESCINVESTIMENTO, PP.PLANPRVCONTABPAT' +
        'RO, CI.DESCCARTINVEST, TP.DESCTIPOOPERACAO, OI.QTDEOPERACAO,'
      
        '       OI.IDOPERACAOINVEST, OI.IDINVESTIMENTO, OI.IDPLANPREVCTBP' +
        'ATR, OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, IV.IDEMISSOR,'
      
        '       OI.IDLOTE, OI.IDTIPOOPERACAO, OI.ORIGDEST, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTODIANTE,'
      
        '       DECODE(OI.ORIGDEST, '#39'O'#39',  OC.IDMOTIVOBLOQORIG, OC.IDMOTIV' +
        'OBLOQDEST) AS IDMOTIVOBLOQUEIO,'
      '       BO.PLANO, BO.PLNCODIGO, BO.CODDOCUMENTO'
      ''
      
        'FROM OPERACAOINVEST OI, VWPLANPREVCTBPATR PP, INVESTIMENTO IV, V' +
        'WCARTEIRASRV CI, TIPOOPERACAO TP,'
      '     OPERCUSTODIA OC, BOLETA BO'
      ''
      'WHERE (OI.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '  AND (OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND (OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '  AND (OI.IDOPERCUSTODIA = OC.IDOPERCUSTODIA(+))'
      '  AND (OI.NUMDOCUMENTO = BO.IDBOLETA)'
      '  AND (NOT EXISTS (SELECT IDHISTCARTINV'
      '                   FROM HISTCARTINV'
      
        '                   WHERE IDOPERACAOINVEST = OI.IDOPERACAOINVEST)' +
        ')'
      ''
      'ORDER BY IDOPERACAOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 428
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryBuscaBoletaTRPDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaTRPDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaTRPPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaTRPDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaTRPDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaTRPQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaTRPIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaTRPIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaTRPIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaTRPIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaTRPIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaTRPIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaBoletaTRPIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaTRPIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaTRPIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
    object qryBuscaBoletaTRPIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaTRPIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryBuscaBoletaTRPORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryBuscaBoletaTRPPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBuscaBoletaTRPPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaBoletaTRPCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object qryBuscaBoletaTRI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.DATAOPERACAO, IV.DESCINVESTIMENTO, PP.PLANPRVCONTABPAT' +
        'RO, CI.DESCCARTINVEST, TP.DESCTIPOOPERACAO, OI.QTDEOPERACAO,'
      
        '       OI.IDOPERACAOINVEST, OI.IDINVESTIMENTO, OI.IDPLANPREVCTBP' +
        'ATR, OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, IV.IDEMISSOR,'
      
        '       OI.IDLOTE, OI.IDTIPOOPERACAO, OI.ORIGDEST, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTODIANTE'
      
        'FROM OPERACAOINVEST OI, VWPLANPREVCTBPATR PP, INVESTIMENTO IV, V' +
        'WCARTEIRASRV CI, TIPOOPERACAO TP'
      'WHERE (OI.NUMDOCUMENTO = :IDBOLETA)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '  AND (OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND (OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '  AND (NOT EXISTS (SELECT IDHISTCARTINV'
      '                   FROM HISTCARTINV'
      
        '                   WHERE IDOPERACAOINVEST = OI.IDOPERACAOINVEST)' +
        ')'
      'ORDER BY IDOPERACAOINVEST'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 254
    Top = 428
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryBuscaBoletaTRIDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletaTRIDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaBoletaTRIPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBuscaBoletaTRIDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaBoletaTRIDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaBoletaTRIQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaBoletaTRIIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaBoletaTRIIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaBoletaTRIIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaBoletaTRIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaBoletaTRIIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaBoletaTRIIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaBoletaTRIIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaBoletaTRIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaBoletaTRIIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
    object qryBuscaBoletaTRIIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaBoletaTRIORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
  end
  object QryGravaLogTotalPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV,IDMODULO,IDUSUARIO,DATA' +
        ',VERSAO,DESCOPERACAO)'
      
        'VALUES (:IDLOGTOTALPREV,:IDMODULO,:IDUSUARIO,SYSDATE,:VERSAO,:DE' +
        'SCOPERACAO) '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 59
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOGTOTALPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryBuscaVendasDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OI.IDINVESTIMENTO,'
      '   OI.IDCARTEIRAINVEST, '
      '   OI.IDPLANPREVCTBPATR,'
      '   OI.IDCUSTODIANTE,'
      '   OI.VLROPERACAO,'
      '   OI.QTDEOPERACAO   '
      'FROM OPERACAOINVEST OI'
      'WHERE '
      '    OI.IDTIPOINVEST = 2    '
      'AND OI.DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      'AND OI.FLGSTATUSFECHBOL = '#39'F'#39
      'AND OI.IDTIPOOPERACAO IN'
      '   (SELECT '
      '       TP.IDTIPOOPERACAO '
      '    FROM  TIPOOPERACAO TP '
      '    WHERE  '
      '        TP.IDTIPOINVEST     = 2      '
      '    AND TP.IDTIPOOPERACAO   > 0'
      '    AND TP.NATUREZAOPERACAO = '#39'D'#39'    '
      '    AND TP.TIPOCUSTODIA     = '#39'V'#39
      '    AND TP.FLGOPDIREITO     = '#39'N'#39'    '
      '    AND TP.TIPOMOVTO        = '#39'OPE'#39')'
      
        'ORDER BY OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDPLANPREVCT' +
        'BPATR, OI.IDCUSTODIANTE'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 574
    Top = 425
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryVerDireitosCancelar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'AN.IDOPERACAODIREITO,'
      'AN.DATAAGE,'
      'AN.DATABASE,'
      'AN.DATAEX,'
      'AN.DATACOM,'
      'AN.IDEMISSOR,'
      'AN.IDCUSTODIANTE,'
      'AN.IDOPERACAODIREITO,'
      'AN.IDINVESTIMENTO,'
      'AN.IDCARTEIRAINVEST,'
      'AN.IDPLANPREVCTBPATR,'
      'AN.IDMOTIVOBLOQUEIO,'
      'AN.QTDEOPERACAO,'
      '(AN.VLROPERACAO - NVL(RB.VLROPERACAO,0)) AS VLRCANCELAR'
      'FROM '
      '('
      
        'SELECT IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO, TP.NATUREZAOPER' +
        'ACAO, '
      ''
      '       OD.IDOPERACAODIREITO,'
      '       OD.DATAAGE,'
      '       OD.DATAEX AS DATABASE,'
      '       OD.DATAOPER  AS DATAEX,'
      '       OD.DATACOM,'
      '       OD.IDEMISSOR,'
      '       '
      '       OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VLRIR,'
      '       OI.PRECOUNITOPERACAO,'
      ''
      '       OI.NUMDOCUMENTO,'
      '       OI.IDOPERACAOINVEST,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDPLANPREVCTBP' +
        'ATR,'
      '       OI.IDTIPOINVEST, OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.DATAVENCOPER,'
      '       OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE,'
      '       OI.IDCARTEIRAGERENC, OI.IDOPERCUSTODIA, OI.IDCUSTORIG,'
      '       OI.IDMOTIVOBLOQUEIO, OI.IDOPERACAOORIGEM'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP'
      ''
      ''
      'WHERE '
      '      OI.IDTIPOINVEST = 2'
      
        '  AND OD.DATACOM           > TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')' +
        '      '
      '  AND OI.IDTIPOOPERACAO    IN (-70, -10070)  '
      '  AND OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO  '
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO  '
      '  AND OI.IDTIPOINVEST      = TP.IDTIPOINVEST  '
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO) AN,    '
      ''
      '('
      
        'SELECT IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO, TP.NATUREZAOPER' +
        'ACAO, '
      ''
      '       OD.IDOPERACAODIREITO,'
      '       OD.DATAAGE,'
      '       OD.DATAEX AS DATABASE,'
      '       OD.DATAOPER  AS DATAEX,'
      '       OD.DATACOM,'
      '       OD.IDEMISSOR,'
      '       '
      '       OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VLRIR,       '
      '       OI.PRECOUNITOPERACAO,'
      '       '
      '       OI.NUMDOCUMENTO,       '
      '       OI.IDOPERACAOINVEST,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDPLANPREVCTBP' +
        'ATR, '
      '       OI.IDTIPOINVEST, OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.DATAVENCOPER, '
      '       OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE, '
      '       OI.IDCARTEIRAGERENC, OI.IDOPERCUSTODIA, OI.IDCUSTORIG,'
      '       OI.IDMOTIVOBLOQUEIO, OI.IDOPERACAOORIGEM'
      '       '
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, '
      '     OPERACAODIREITO OD, TIPOOPERACAO TP'
      ''
      'WHERE '
      '      OI.IDTIPOINVEST = 2  '
      '  AND OD.DATACOM           > TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO  '
      
        '  AND ((OI.IDTIPOOPERACAO  = OD.IDTIPOOPERACAO) OR (OI.IDTIPOOPE' +
        'RACAO = OD.IDTIPOOPERACAO+10000))  '
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO  '
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      '  AND OI.IDTIPOINVEST      = TP.IDTIPOINVEST'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO )  RB'
      ''
      'WHERE'
      '    AN.IDINVESTIMENTO     = :IDINVESTIMENTO'
      'AND AN.IDCARTEIRAINVEST   = :IDCARTEIRAINVEST'
      'AND AN.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR'
      ''
      'AND AN.IDOPERACAODIREITO  = RB.IDOPERACAODIREITO(+)'
      'AND AN.IDINVESTIMENTO     = RB.IDINVESTIMENTO(+)'
      'AND AN.IDCARTEIRAINVEST   = RB.IDCARTEIRAINVEST(+)'
      'AND AN.IDPLANPREVCTBPATR  = RB.IDPLANPREVCTBPATR(+)'
      'AND AN.IDOPERACAOINVEST   = RB.IDOPERACAOORIGEM(+)'
      ''
      'AND AN.DATABASE          >= TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      ''
      'AND (AN.VLROPERACAO - NVL(RB.VLROPERACAO,0)) > 0'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 574
    Top = 484
    ParamData = <
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
      end>
  end
  object qryRecebimento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO' +
        ', PP.PLANPRVCONTABPATRO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RREMUNERACAO,'
      '       OI.VLRIRREMUNER, OI.VLRIR,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        'OI.IDOPERACAOORIGEM,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, '
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATACOM,'#39'DD/MM/YYYY'#39'))' +
        '))'
      '      ) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '  AND OI.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '  AND OI.IDCUSTODIANTE     = :IDCUSTODIANTE'
      
        '  AND ((:IDMOTIVOBLOQUEIO IS NULL) OR (OI.IDMOTIVOBLOQUEIO =:IDM' +
        'OTIVOBLOQUEIO))  '
      '  AND TP.IDTIPOINVEST = 2'
      
        '  AND ((OI.IDTIPOOPERACAO  = OD.IDTIPOOPERACAO) OR (OI.IDTIPOOPE' +
        'RACAO = OD.IDTIPOOPERACAO+10000))'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updRecebimento
    ValidateWithMask = True
    Left = 688
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end>
    object qryRecebimentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryRecebimentoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryRecebimentoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryRecebimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryRecebimentoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryRecebimentoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryRecebimentoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryRecebimentoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryRecebimentoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 20
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,##0.00000000'
    end
    object qryRecebimentoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryRecebimentoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryRecebimentoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryRecebimentoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryRecebimentoIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryRecebimentoORIGDEST: TStringField
      DisplayWidth = 9
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoEMPRESAPROP: TFloatField
      DisplayWidth = 13
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryRecebimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryRecebimentoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryRecebimentoIDTIPOINVEST: TFloatField
      DisplayWidth = 12
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryRecebimentoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryRecebimentoNUMDOCUMENTO_1: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryRecebimentoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryRecebimentoIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryRecebimentoIDCUSTODIANTE: TFloatField
      DisplayWidth = 14
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryRecebimentoFLGSTATUSFECHBOL: TStringField
      DisplayWidth = 18
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoFLGSTATUSORDMOV: TStringField
      DisplayWidth = 18
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoIDOPERACAODIREITO: TFloatField
      DisplayWidth = 18
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryRecebimentoPERCENTUAL: TFloatField
      DisplayWidth = 11
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryRecebimentoIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryRecebimentoIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 19
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryRecebimentoIDOPERCUSTODIA: TFloatField
      DisplayWidth = 15
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryRecebimentoIDCUSTORIG: TFloatField
      DisplayWidth = 11
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryRecebimentoIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 17
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryRecebimentoNATUREZAOPERACAO: TStringField
      DisplayWidth = 19
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryRecebimentoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object qryRecebimentoALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoCARTGERENCIAL: TStringField
      FieldName = 'CARTGERENCIAL'
      Visible = False
      Size = 1
    end
  end
  object updRecebimento: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO, '
      'IDOPERACAOORIGEM)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO, :IDOPERACAOORIGEM)'
      '')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 716
    Top = 192
  end
  object dsRecebimento: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebimento
    Left = 744
    Top = 192
  end
  object qryCancelamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO, PP.PLANPRVCONTA' +
        'BPATRO, CI.DESCCARTINVEST,'
      '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, IV.IDEMISSOR, '
      '       OI.NUMDOCUMENTO,'
      
        '       OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VLRREMUNERACAO, OI.VL' +
        'RIRREMUNER, OI.VLRIR,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLRLIQUIDO,'
      '       OD.DATAEX AS DATABASE, OD.DATACOM, OD.DATAAGE,'
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        'OI.IDOPERACAOORIGEM,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATACOM,'#39'DD/MM/YYYY'#39'))' +
        '))'
      '      ) CI'
      ''
      'WHERE OI.FLGSTATUSFECHBOL  = :FLGSTATUSFECHBOL'
      
        '  AND ((:IDOPERACAODIREITO IS NULL) OR (OI.IDOPERACAODIREITO =:I' +
        'DOPERACAODIREITO))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR =:I' +
        'DPLANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (OI.IDCARTEIRAINVEST =:IDC' +
        'ARTEIRAINVEST))'
      
        '  AND ((:IDCUSTODIANTE IS NULL) OR (OI.IDCUSTODIANTE =:IDCUSTODI' +
        'ANTE))'
      
        '  AND ((:IDMOTIVOBLOQUEIO IS NULL) OR (OI.IDMOTIVOBLOQUEIO =:IDM' +
        'OTIVOBLOQUEIO))'
      ''
      '  AND OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO'
      ''
      '  AND TP.IDTIPOINVEST      = 2'
      '  AND OI.IDTIPOOPERACAO    in (-170, -10170)'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 723
    Top = 285
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end>
    object qryCancelamentoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryCancelamentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryCancelamentoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryCancelamentoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryCancelamentoDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCancelamentoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryCancelamentoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryCancelamentoVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
    end
    object qryCancelamentoVLRIRREMUNER: TFloatField
      FieldName = 'VLRIRREMUNER'
    end
    object qryCancelamentoVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryCancelamentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object qryCancelamentoSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryCancelamentoSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryCancelamentoDATABASE: TDateTimeField
      FieldName = 'DATABASE'
    end
    object qryCancelamentoDATACOM: TDateTimeField
      FieldName = 'DATACOM'
    end
    object qryCancelamentoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryCancelamentoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryCancelamentoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryCancelamentoORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryCancelamentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryCancelamentoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryCancelamentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryCancelamentoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryCancelamentoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryCancelamentoNUMDOCUMENTO_1: TStringField
      FieldName = 'NUMDOCUMENTO_1'
      Size = 30
    end
    object qryCancelamentoPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryCancelamentoDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryCancelamentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryCancelamentoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryCancelamentoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryCancelamentoFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryCancelamentoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryCancelamentoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryCancelamentoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryCancelamentoIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
    object qryCancelamentoIDCUSTORIG: TFloatField
      FieldName = 'IDCUSTORIG'
    end
    object qryCancelamentoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryCancelamentoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Size = 4
    end
    object qryCancelamentoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryCancelamentoALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoCARTGERENCIAL: TStringField
      FieldName = 'CARTGERENCIAL'
      Size = 1
    end
    object qryCancelamentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryCancelamentoDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
  end
  object qryTipoOperCan: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO IN (-170, -10170)'
      '  AND IDTIPOINVEST = 2'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 721
    Top = 425
  end
  object qryInvestimentoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       I.IDINVESTIMENTO, I.DESCINVESTIMENTO, C.QTDTITLOTE,'
      '       I.IDTIPOINVEST, I.IDEMISSOR, I.IDMOEDACONTAB'
      'FROM  INVESTIMENTO I, COTACAOINVEST C'
      'WHERE (I.IDTIPOINVEST = 2)'
      '  AND (I.IDEMISSOR = :IDEMISSOR)'
      '  AND (I.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '  AND (I.IDINVESTIMENTO = C.IDINVESTIMENTO)'
      '  AND (C.DATACOTACAO IN (SELECT MAX(C1.DATACOTACAO)'
      '                         FROM COTACAOINVEST C1'
      
        '                         WHERE ((:DATACOTACAO IS NULL) OR (C1.DA' +
        'TACOTACAO <= TO_DATE(:DATACOTACAO,'#39'DD/MM/YYYY'#39')))'
      
        '                           AND (C1.IDINVESTIMENTO = :IDINVESTIME' +
        'NTO)))'
      'ORDER BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 721
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end>
    object qryInvestimentoAcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoAcaoQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object qryInvestimentoAcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoAcaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object qryInvestimentoAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object qryInvestimentoAcaoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'BASEDADOS.INVESTIMENTO.IDMOEDACONTAB'
    end
  end
  object dspSelBoleta: TDataSetProvider
    Constraints = True
    Left = 722
    Top = 374
  end
  object cdsSelBoleta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 719
    Top = 329
  end
  object qryBoletaCanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLA' +
        'NO, PLNCODIGO, CODDOCUMENTO,'
      '       '#39'N'#39' AS EXCLUIBOLETA, 0 AS CONTACCI, 0 AS VALOR'
      'FROM BOLETA'
      'WHERE IDBOLETA IN (SELECT NUMDOCUMENTO'
      '                   FROM OPERACAOINVEST'
      '                   WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO)'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updBoletaCanc
    ValidateWithMask = True
    Left = 704
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryBoletaCancIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBoletaCancSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBoletaCancDATABOLETA: TDateTimeField
      FieldName = 'DATABOLETA'
    end
    object qryBoletaCancTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Size = 3
    end
    object qryBoletaCancIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBoletaCancPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBoletaCancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBoletaCancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBoletaCancEXCLUIBOLETA: TStringField
      FieldName = 'EXCLUIBOLETA'
      FixedChar = True
      Size = 1
    end
    object qryBoletaCancCONTACCI: TFloatField
      FieldName = 'CONTACCI'
    end
    object qryBoletaCancVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object updBoletaCanc: TUpdateSQL
    ModifySQL.Strings = (
      'update BOLETA'
      'set'
      '  STATUS = :STATUS,'
      '  DATABOLETA = :DATABOLETA,'
      '  TIPMOVBOLETA = :TIPMOVBOLETA,'
      '  IDFORCLI = :IDFORCLI,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    InsertSQL.Strings = (
      'insert into BOLETA'
      
        '  (IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLANO, ' +
        'PLNCODIGO, '
      '   CODDOCUMENTO)'
      'values'
      
        '  (:IDBOLETA, :STATUS, :DATABOLETA, :TIPMOVBOLETA, :IDFORCLI, :P' +
        'LANO, :PLNCODIGO, '
      '   :CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from BOLETA'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    Left = 730
    Top = 143
  end
  object qryProvisao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO' +
        ', PP.PLANPRVCONTABPATRO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RREMUNERACAO,'
      '       OI.VLRIRREMUNER, OI.VLRIR,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        '0 AS QTDEEXERCIDA,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, '
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39')))' +
        ')'
      '      ) CI'
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '  AND OI.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '  AND OI.IDCUSTODIANTE     = :IDCUSTODIANTE'
      
        '  AND ((:IDMOTIVOBLOQUEIO IS NULL) OR (OI.IDMOTIVOBLOQUEIO =:IDM' +
        'OTIVOBLOQUEIO))'
      '  AND TP.IDTIPOINVEST = 2'
      '  AND OI.IDTIPOOPERACAO    in (-70, -10070)'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updProvisao
    ValidateWithMask = True
    Left = 696
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end>
    object qryProvisaoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryProvisaoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryProvisaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryProvisaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryProvisaoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryProvisaoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryProvisaoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryProvisaoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryProvisaoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 20
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,##0.00000000'
    end
    object qryProvisaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryProvisaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryProvisaoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryProvisaoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryProvisaoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryProvisaoIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryProvisaoORIGDEST: TStringField
      DisplayWidth = 1
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryProvisaoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryProvisaoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryProvisaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryProvisaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryProvisaoNUMDOCUMENTO_1: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryProvisaoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryProvisaoIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryProvisaoIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryProvisaoFLGSTATUSFECHBOL: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoFLGSTATUSORDMOV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoIDOPERACAODIREITO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryProvisaoPERCENTUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Visible = False
      DisplayFormat = '##0.#########'
    end
    object qryProvisaoIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryProvisaoIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryProvisaoIDOPERCUSTODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryProvisaoIDCUSTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryProvisaoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryProvisaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryProvisaoQTDEEXERCIDA: TFloatField
      FieldName = 'QTDEEXERCIDA'
      Visible = False
    end
    object qryProvisaoALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoCARTGERENCIAL: TStringField
      FieldName = 'CARTGERENCIAL'
      Visible = False
      Size = 1
    end
  end
  object updProvisao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 716
    Top = 236
  end
  object dsProvisao: TwwDataSource
    AutoEdit = False
    DataSet = qryProvisao
    Left = 744
    Top = 236
  end
  object qryVerTRPPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MIN(DATAMOVCUSTOD) AS DATAMOVCUSTOD, IDINVESTIMENTO, IDPL' +
        'ANPREVCTBPATR, IDCARTEIRAINVEST'
      'FROM (SELECT O.DATAMOVCUSTOD, O.IDINVESTIMENTO,'
      
        '             DECODE(:IDCARTEIRAINVEST, O.IDCARTEIRAORIG, O.IDCAR' +
        'TEIRADEST, O.IDCARTEIRAORIG) AS IDCARTEIRAINVEST,'
      '             DECODE(:IDPLANPREVCTBPATR, O.IDPLANPREVCTBPATR,'
      
        '                                        DECODE(O.IDPLANPREVCTBDE' +
        'ST, NULL, O.IDPLANPREVCTBPATR, O.IDPLANPREVCTBDEST),'
      
        '                                        O.IDPLANPREVCTBPATR) AS ' +
        'IDPLANPREVCTBPATR'
      '      FROM OPERCUSTODIA O, BOLETA B'
      '      WHERE O.IDINVESTIMENTO = :IDINVESTIMENTO'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVCTBPAT' +
        'R = :IDPLANPREVCTBPATR))'
      
        '        AND :IDCARTEIRAINVEST IN (O.IDCARTEIRAORIG, O.IDCARTEIRA' +
        'DEST)'
      
        '        AND O.DATAMOVCUSTOD > TO_DATE(:DATAMOVCUSTOD,'#39'DD/MM/YYYY' +
        #39')'
      '        AND O.IDBOLETA = B.IDBOLETA'
      
        '        AND ((:TIPMOVBOLETA IS NULL) OR (B.TIPMOVBOLETA = :TIPMO' +
        'VBOLETA))'
      '        AND (EXISTS(SELECT DISTINCT HC1.IDOPERCUSTODIA'
      '                    FROM HISTCUSTODIA HC1'
      
        '                    WHERE HC1.IDOPERCUSTODIA = O.IDOPERCUSTODIA)' +
        '))'
      'GROUP BY IDINVESTIMENTO, IDPLANPREVCTBPATR, IDCARTEIRAINVEST ')
    ValidateWithMask = True
    Left = 694
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVCUSTOD'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end>
  end
  object qryBuscaBoletaTRD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'ODT.IDBOLETA,'
      'ODT.IDINVESTORIG,'
      'ODT.IDCARTINVESTORIG,'
      '0 AS IDCARTEIRAGERENC,'
      'ODT.IDCUSTODIAORIG,'
      'ODT.IDMOTIVOBLOQORIG,'
      'ODT.IDOPERINVESTORIG,'
      'ODT.IDOPERINVESTDEST,'
      'ODT.IDPLANPREVCTBPATRORIG,'
      'ODT.IDPLANPREVCTBPATRDEST,'
      'ODT.IDTIPOOPERORIG,'
      'ODT.IDTIPOOPERDEST,'
      'ODT.DATAOPERACAO,'
      'ODT.VLROPERACAO,'
      'ODT.QTDEOPERACAO,'
      'IV.DESCINVESTIMENTO,'
      'TPB.DESCTIPOOPERACAO AS DESCTIPOOPERB,'
      'TPB.NATUREZAOPERACAO AS NATUREZAOPERB,'
      'TPA.DESCTIPOOPERACAO AS DESCTIPOOPERA,'
      'TPA.NATUREZAOPERACAO AS NATUREZAOPERA'
      ''
      
        'FROM OPERDIRTRANSF ODT, OPERACAODIREITO OD, PARAMINVEST PA, INVE' +
        'STIMENTO IV,'
      '     TIPOOPERACAO TPB, TIPOOPERACAO TPA'
      'WHERE (ODT.IDBOLETA =:IDBOLETA)'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (ODT.IDINVESTORIG = :IDINVES' +
        'TIMENTO))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (ODT.IDCARTINVESTORIG = :I' +
        'DCARTEIRAINVEST))'
      
        'AND ODT.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') ' +
        ' '
      'AND ODT.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      
        'AND OD.IDTIPOOPERACAO    IN (PA.IDTIPOOPERDIRDSU, PA.IDTIPOOPERD' +
        'IRSUB)'
      'AND IV.IDINVESTIMENTO     = ODT.IDINVESTORIG'
      'AND TPB.IDTIPOINVEST      = 2'
      'AND ODT.IDTIPOOPERORIG    = TPB.IDTIPOOPERACAO'
      'AND TPA.IDTIPOINVEST      = 2'
      'AND ODT.IDTIPOOPERDEST    = TPA.IDTIPOOPERACAO'
      'AND (NOT EXISTS(SELECT DISTINCT HI1.IDOPERACAOINVEST'
      '                FROM HISTCARTINV HI1'
      
        '                WHERE HI1.IDOPERACAOINVEST = ODT.IDOPERINVESTORI' +
        'G))'
      'AND (NOT EXISTS(SELECT DISTINCT HI2.IDOPERACAOINVEST'
      '                FROM HISTCARTINV HI2'
      
        '                WHERE HI2.IDOPERACAOINVEST = ODT.IDOPERINVESTDES' +
        'T))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 576
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object qryBuscaBoletaTRCAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERCUSTODIA,    OP.IDMOTIVOBLOQDEST,  OP.IDMOTIVOBLOQOR' +
        'IG,'
      
        '   OP.IDCUSTODIANTEDEST, OP.IDCUSTODIANTEORIG, OP.IDINVESTIMENTO' +
        ','
      
        '   OP.IDCARTEIRADEST,    OP.IDCARTEIRAORIG,    OP.IDHISTCARTINVD' +
        'EST,'
      
        '   OP.IDHISTCARTINVORIG, OP.IDCUSTODIAORIG,    OP.IDCUSTODIADEST' +
        ','
      '   OP.DATAMOVCUSTOD,     OP.IDLOTE,            OP.QUANTIDADE,'
      
        '   OP.IDTIPOOPERACAO,    OP.IDTIPOOPERORIG,    OP.IDTIPOOPERDEST' +
        ','
      
        '   OP.IDBOLETA,          IV.IDEMISSOR,         IV.DESCINVESTIMEN' +
        'TO,'
      
        '   TP.FLGCONTAINVEST,    OP.IDPLANPREVCTBPATR, PP.PLANPRVCONTABP' +
        'ATRO,'
      '   CA.DESCCARTINVEST'
      ''
      'FROM'
      
        '   OPERCUSTODIA OP, INVESTIMENTO IV, TIPOOPERACAO TP, VWPLANPREV' +
        'CTBPATR PP,VWCARTEIRASRV CA'
      'WHERE (OP.IDBOLETA = :IDBOLETA)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDCARTEIRAORIG IS NULL) OR (OP.IDCARTEIRAORIG = :IDCART' +
        'EIRAORIG))'
      '  AND (OP.IDINVESTIMENTO  = IV.IDINVESTIMENTO)'
      '  AND (OP.IDTIPOOPERORIG = TP.IDTIPOOPERACAO)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCARTEIRAORIG = CA.IDCARTEIRAINVEST)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 584
    Top = 100
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAORIG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAORIG'
        ParamType = ptResult
      end>
  end
end
