object dtmCalcDocumento: TdtmCalcDocumento
  OldCreateOrder = False
  Left = 111
  Top = 79
  Height = 480
  Width = 696
  object qrySaldoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.DATAVENCTO,'
      '       BX.ULTBAIXA,'
      '       SUM('
      
        '       DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39', DE' +
        'CODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '       DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39', DE' +
        'CODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '       DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39', DE' +
        'CODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0) +'
      
        '       DECODE(RTRIM(LD.OPERACAO), '#39'12'#39', DECODE(D.RECPAG, '#39'R'#39', DE' +
        'CODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '       ) AS TOT_RECEBER,'
      ''
      '       SUM('
      
        '       DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39', DEC' +
        'ODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '       ) AS TOT_ALTERADOR,'
      ''
      '       SUM('
      
        '       DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', DEC' +
        'ODE(LD.DEBCRE, '#39'C'#39', LD.VALOR, LD.VALOR * -1), 0), 0)'
      '       ) AS TOT_RECEBIDO'
      ''
      ' FROM DOCUMENTO D, LANCTODOCUM LD,'
      '      ( SELECT MAX(DATALANCTO) AS ULTBAIXA'
      '          FROM LANCTODOCUM'
      '         WHERE CODDOCUMENTO = :PCODDOCUMENTO'
      '           AND RTRIM(OPERACAO) = '#39'5'#39
      '           AND ESTORNO IS NULL ) BX'
      ''
      'WHERE D.CODDOCUMENTO = LD.CODDOCUMENTO'
      '  AND LD.ESTORNO IS NULL '
      '  AND D.CODDOCUMENTO = :PCODDOCUMENTO'
      '  AND ((:PDTLIMITE IS NULL) OR (LD.DATALANCTO <= :PDTLIMITE))'
      '  AND ( (RTRIM(LD.OPERACAO) <> '#39'4'#39') OR'
      '        ( (RTRIM(LD.OPERACAO) = '#39'4'#39') AND'
      
        '          ((BX.ULTBAIXA IS NULL) OR (LD.DATALANCTO <= BX.ULTBAIX' +
        'A)) AND'
      '          ( (LD.CODALTERADOR = :PCODALTMULTA) OR'
      '            (LD.CODALTERADOR = :PCODALTJUROS) OR'
      '            (LD.CODALTERADOR = :PCODALTCM) ) ) )'
      ''
      'GROUP BY D.DATAVENCTO, BX.ULTBAIXA'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 24
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTLIMITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTLIMITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTCM'
        ParamType = ptUnknown
      end>
    object qrySaldoDocTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
    end
    object qrySaldoDocTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
    end
    object qrySaldoDocDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qrySaldoDocULTBAIXA: TDateTimeField
      FieldName = 'ULTBAIXA'
    end
    object qrySaldoDocTOT_ALTERADOR: TFloatField
      FieldName = 'TOT_ALTERADOR'
    end
  end
  object qryUpdLiberaLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL'
      'SET'
      '   FLGERRO = :PFLGERRO'
      'WHERE'
      '   IDDOCUMENTO = :PIDDOCUMENTO')
    ValidateWithMask = True
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGERRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
end
