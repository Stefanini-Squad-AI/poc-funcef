object dtmAGE: TdtmAGE
  OldCreateOrder = True
  Left = 30
  Top = 58
  Height = 286
  Width = 411
  object qrySaldoCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO'
      'FROM'
      '   HISTCUSTODIA H1'
      'WHERE'
      
        '   (((:IDPLANPREVCTBPATR IS NOT NULL) AND (H1.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR)) OR (:IDPLANPREVCTBPATR IS NULL)) AND'
      '   (H1.IDCARTEIRAINVEST =:IDCARTEIRA)   AND'
      '   (H1.IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (H1.IDLOTE =:IDLOTE)) OR ((:IDLOT' +
        'E IS NULL) AND (H1.IDLOTE IS NULL))) AND'
      '   (H1.IDCUSTODIANTE =:IDCUSTODIANTE)   AND'
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      
        '          WHERE (H2.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR) AN' +
        'D'
      
        '                (H2.IDCARTEIRAINVEST  = H1.IDCARTEIRAINVEST)  AN' +
        'D'
      
        '                (H2.IDINVESTIMENTO    = H1.IDINVESTIMENTO)    AN' +
        'D'
      
        '               ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL)) ' +
        '    AND'
      
        '              (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOT' +
        'E)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      
        '                (H2.IDCUSTODIANTE     = H1.IDCUSTODIANTE)     AN' +
        'D'
      
        '                (H2.IDMOTIVOBLOQUEIO  = H1.IDMOTIVOBLOQUEIO)  AN' +
        'D'
      '               ((H2.DATAMOVCUSTOD     <   :DATAMOV) OR'
      
        '                (H2.DATAMOVCUSTOD     =   :DATAMOV))          AN' +
        'D'
      
        '                (H2.IDCUSTODIA        <   :IDCUSTODIA)))      AN' +
        'D'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      
        '          WHERE (H3.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR) AN' +
        'D'
      
        '                (H3.IDCARTEIRAINVEST  = H1.IDCARTEIRAINVEST)  AN' +
        'D'
      
        '                (H3.IDINVESTIMENTO    = H1.IDINVESTIMENTO)    AN' +
        'D'
      
        '              (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOT' +
        'E)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      
        '                (H3.IDCUSTODIANTE     = H1.IDCUSTODIANTE)     AN' +
        'D'
      
        '                (H3.IDMOTIVOBLOQUEIO  = H1.IDMOTIVOBLOQUEIO)  AN' +
        'D'
      
        '                (H3.DATAMOVCUSTOD     = H1.DATAMOVCUSTOD)     AN' +
        'D'
      '                ((H3.DATAMOVCUSTOD    <   :DATAMOV) OR'
      '                 (H3.IDCUSTODIA       <   :IDCUSTODIA))))'
      'ORDER BY DATAMOVCUSTOD DESC, IDCUSTODIA DESC'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 52
    Top = 16
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
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
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
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptInput
      end>
    object qrySaldoCustodiaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object qrySaldoCustodiaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qrySaldoCustodiaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
  end
end
