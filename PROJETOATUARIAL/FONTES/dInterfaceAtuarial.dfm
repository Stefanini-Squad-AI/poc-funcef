object DtmInterfaceAtuarial: TDtmInterfaceAtuarial
  OldCreateOrder = False
  Left = 122
  Top = 137
  Height = 375
  Width = 544
  object qryPartAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PP.IDPESSJUR,'
      '       PP.IDPLANOPREV,'
      '       PP.IDPESSOA,'
      '       PP.SEQPROPOSTA,'
      '       PP.INSCRICAONUMERO,'
      '       EL.MATRICULA,'
      '       SP.FLGINTERNO'
      'FROM   SITPART SP, ELEGPATRO EL, PARTPREVPLAN PP'
      'WHERE  PP.IDSITPART = SP.IDSITPART'
      '  AND  PP.IDPESSJUR = EL.IDPESSJUR'
      '  AND  PP.IDPESSOA = EL.IDPESSOA'
      '  AND  PP.SEQPROPOSTA = 1'
      '  AND  SP.FLGINTERNO IN ('#39'AT'#39','#39'MA'#39')'
      '  AND  PP.IDPESSOA = :IDPESSOA'
      '/*  AND  PP.IDPLANOPREV = :IDPLANOPREV   -- linha[15] */'
      ''
      'UNION'
      ''
      'SELECT /*+ INDEX (BENEFBFCIARIO XIF5BENEFBFCIARIO) */'
      '       DISTINCT'
      '       PP.IDPESSJUR,'
      '       PP.IDPLANOPREV,'
      '       PP.IDPESSOA,'
      '       PP.SEQPROPOSTA,'
      '       PP.INSCRICAONUMERO,'
      '       EL.MATRICULA, '#39'AS'#39' AS FLGINTERNO'
      'FROM   BENEFPLANPREV BP, PARTPREVPLAN PP, ELEGPATRO EL,'
      '       BENEFBFCIARIO BF, SITPART SP'
      'WHERE  PP.IDSITPART = SP.IDSITPART'
      '  AND  PP.IDPLANOPREV    = BP.IDPLANOPREV'
      '  AND  PP.IDPESSJUR      = EL.IDPESSJUR'
      '  AND  PP.IDPESSOA       = EL.IDPESSOA'
      '  AND  BF.IDPESSJUR      = PP.IDPESSJUR'
      '  AND  BF.IDPLANOPREV    = PP.IDPLANOPREV'
      '  AND  BF.IDTITULAR      = PP.IDPESSOA'
      '  AND  BF.IDPESSOA       = PP.IDPESSOA'
      '  AND  BF.IDBENEFICIO    = BP.IDBENEFICIO'
      '  AND  BF.SEQPROPOSTA    = PP.SEQPROPOSTA'
      '  AND  BP.FLGCALCTODOMES = 1'
      '  AND  SP.FLGINTERNO     = '#39'AS'#39
      '  AND  PP.IDPESSOA       = :IDPESSOA'
      '/*  AND  BP.IDPLANOPREV    = :IDPLANOPREV   -- linha[42] */ ')
    ValidateWithMask = True
    Left = 47
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RXP.FLGCONTROLE, RXP.FLGTRANSFERENCIA, RXP.FLGTITULARCOLE' +
        'T,'
      '       NVL(H.SALDOCOTAS, RP.VALORRESERVA) AS VALORRESERVA,'
      '       RXP.INDICEREAJUSTE, RXP.IDTIPORESERVA'
      'FROM RESERVAPART RP, RESERVAXPLANO RXP,'
      '     (SELECT IDTIPORESERVA, SALDOCOTAS'
      '      FROM HISTMOVRESERVA H'
      '      WHERE H.IDHISTRESERVA IN (SELECT IDHISTRESERVA FROM ('
      
        '                                SELECT IDTIPORESERVA, MAX(IDHIST' +
        'RESERVA) AS IDHISTRESERVA'
      '                                FROM HISTMOVRESERVA'
      '                                WHERE MESREFERENCIA <= :ANOMES'
      '                                AND IDPESSOA = :IDPESSOA'
      '                                AND IDPLANOPREV = :IDPLANOPREV'
      '                                AND IDPESSJUR = :IDPESSJUR'
      '                                GROUP BY IDTIPORESERVA))) H'
      'WHERE RP.IDPESSJUR = :IDPESSJUR'
      '  AND RP.IDPESSOA = :IDPESSOA'
      '  AND RP.IDPLANOPREV = :IDPLANOPREV'
      '  AND RP.SEQPROPOSTA = :SEQPROPOSTA'
      '  AND RP.IDPLANOPREV = RXP.IDPLANOPREV'
      '  AND RP.IDTIPORESERVA = RXP.IDTIPORESERVA'
      '  AND H.IDTIPORESERVA(+) = RP.IDTIPORESERVA'
      
        'ORDER BY RXP.FLGCONTROLE, RXP.FLGTRANSFERENCIA, RXP.FLGTITULARCO' +
        'LET'
      '')
    ValidateWithMask = True
    Left = 139
    Top = 66
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end>
  end
  object qryPlanPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.NOME, PL.IDPLANOPREV, PL.IDRGSALMEDIOATU'
      'FROM   PLANPREV PL'
      'ORDER BY PL.NOME'
      '')
    ValidateWithMask = True
    Left = 138
    Top = 6
  end
  object qryGarantia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(H.SALDOCOTAS, RP.VALORRESERVA) AS VALORRESERVA,'
      '       RXP.INDICEREAJUSTE, RXP.IDTIPORESERVA'
      'FROM RESERVAPART RP, RESERVAXPLANO RXP, PLANPREV PL,'
      '     (SELECT IDTIPORESERVA, SALDOCOTAS'
      '      FROM HISTMOVRESERVA H'
      '      WHERE H.IDHISTRESERVA IN (SELECT IDHISTRESERVA FROM ('
      
        '                                SELECT IDTIPORESERVA, MAX(IDHIST' +
        'RESERVA) AS IDHISTRESERVA'
      '                                FROM HISTMOVRESERVA'
      '                                WHERE MESREFERENCIA <= :ANOMES'
      '                                AND IDPESSOA = :IDPESSOA'
      '                                AND IDPLANOPREV = :IDPLANOPREV'
      '                                AND IDPESSJUR = :IDPESSJUR'
      '                                GROUP BY IDTIPORESERVA))) H'
      'WHERE RP.IDPESSJUR = :IDPESSJUR'
      'AND RP.IDPESSOA = :IDPESSOA'
      'AND RP.IDPLANOPREV = :IDPLANOPREV'
      'AND RP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND RP.IDPLANOPREV = RXP.IDPLANOPREV'
      'AND RP.IDTIPORESERVA = RXP.IDTIPORESERVA'
      'AND H.IDTIPORESERVA(+) = RP.IDTIPORESERVA'
      'AND PL.IDPLANOPREV = RXP.IDPLANOPREV'
      'AND PL.IDRESCONTROLEATU = RXP.IDTIPORESERVA'
      'AND RXP.FLGCONTROLE = 1')
    ValidateWithMask = True
    Left = 45
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANOMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object QryIdRegraSRB: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDRGSALMEDIOATU'
      'FROM   PLANPREV PL'
      'WHERE  PL.IDPLANOPREV = :IDPLANOPREV'
      'ORDER BY PL.NOME')
    ValidateWithMask = True
    Left = 233
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 236
    Top = 65
  end
  object RegraMT: TRegraMT
    IdCalculo = 0
    DatabaseName = 'BaseDados'
    DbConnectionType = cntBDE
    Left = 144
    Top = 120
  end
end
