object DMRendaFixa: TDMRendaFixa
  OldCreateOrder = True
  Left = 103
  Top = 65525
  Height = 723
  Width = 925
  object qryInsOperRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERRENFIX'
      
        '   (IDOPERRENFIX,IDINVESTIMENTO,IDTIPOOPERACAO,IDCARTEIRAINVEST,' +
        'IDCUSTODIANTE,IDFORCLI,MOECODIGO,'
      
        '    IDPLANPREVCTBPATR,DATAOPERACAO,VENCOPERACAO,PUOPERACAO,PUEMI' +
        'SSAO,VLROPERACAO,QTDEOPERACAO,OBSERVACAO,'
      
        '    IDTIPOINVEST,DATAEMISSAO,IDUSUARIO,IDOPERRENFIXAPLIC,TXBOLSA' +
        ',TXOPERACIONAL,FLGOPERIMPLANT,'
      
        '    PUMERCADO,DATALEILAO,FLGNEGOCIACAO,CODDOCUMENTO,PLNCODIGO,BO' +
        'LETA,IDCLASSRISCORENFIX,FLGCARTHIPO,'
      
        '    QTDCARTHIPO,FLGRECALC,PERCTRANSF, DATALIQUIDACAO, IDOPERRENF' +
        'IXORIG)'
      'VALUES'
      
        '   (:IDOPERRENFIX,:IDINVESTIMENTO,:IDTIPOOPERACAO,:IDCARTEIRAINV' +
        'EST,:IDCUSTODIANTE,:IDFORCLI,:MOECODIGO,'
      
        '    :IDPLANPREVCTBPATR,:DATAOPERACAO,:VENCOPERACAO,:PUOPERACAO,:' +
        'PUEMISSAO,:VLROPERACAO,:QTDEOPERACAO,:OBSERVACAO,'
      
        '    :IDTIPOINVEST,:DATAEMISSAO,:IDUSUARIO,:IDOPERRENFIXAPLIC,:TX' +
        'BOLSA,:TXOPERACIONAL,:FLGOPERIMPLANT,'
      
        '    :PUMERCADO,:DATALEILAO,:FLGNEGOCIACAO,:CODDOCUMENTO,:PLNCODI' +
        'GO,:BOLETA,:IDCLASSRISCORENFIX,:FLGCARTHIPO,'
      
        '    :QTDCARTHIPO,:FLGRECALC,:PERCTRANSF, :DATALIQUIDACAO, :IDOPE' +
        'RRENFIXORIG)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'VENCOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PUOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PUEMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAEMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXBOLSA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXOPERACIONAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGOPERIMPLANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PUMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALEILAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGNEGOCIACAO'
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
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSRISCORENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCARTHIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDCARTHIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGRECALC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCTRANSF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALIQUIDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXORIG'
        ParamType = ptUnknown
      end>
  end
  object qryInsOperRenFixXCurvas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERRENFIXXCURVAS'
      
        '   (IDCURVARENFIX,IDITEMRENFIX,IDOPERRENFIX,MOECODIGO,VLRCURVA,P' +
        'ERCCURVA)'
      'VALUES'
      
        '   (:IDCURVARENFIX,:IDITEMRENFIX,:IDOPERRENFIX,DECODE(:MOECODIGO' +
        ',0,NULL,:MOECODIGO) ,:VLRCURVA,:PERCCURVA) '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRCURVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCCURVA'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistRenFixXItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTRENFIXXITENS'
      
        '   (IDHISTRENFIX,IDCURVARENFIX,IDITEMRENFIX,PUITEM,PUACUITEM,IDR' +
        'EGRACALCULO,'
      '    VLRITEM,VLRACUITEM)'
      'VALUES'
      
        '   (:IDHISTRENFIX,:IDCURVARENFIX,:IDITEMRENFIX,:PUITEM,:PUACUITE' +
        'M,:IDREGRACALCULO,'
      '    :VLRITEM,:VLRACUITEM)'
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PUITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PUACUITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRACALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRACUITEM'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTRENFIX'
      
        '   (IDHISTRENFIX,IDINVESTIMENTO,IDOPERRENFIX,IDOPERRENFIXAPLIC,I' +
        'DCARTEIRAINVEST,IDTIPOOPERACAO,'
      
        '    IDPLANPREVCTBPATR,PLNCODIGO,CODDOCUMENTO,IDMODULO,IDEMPRESAP' +
        'ROP,DATAHISTRENFIX,QTDHISTRENFIX,'
      
        '    VLRHISTRENFIX, SALDOVLRHISTRENFI,SALDOQTDHISTRENFI,TIPMOVHIS' +
        'RENFIX,NATURMOVHISTRENFI,HISTMOVRENFIX,'
      '    FLGRECALC, IDOPERRENFIXORIG)'
      'VALUES'
      
        '   (:IDHISTRENFIX,:IDINVESTIMENTO,:IDOPERRENFIX,:IDOPERRENFIXAPL' +
        'IC,:IDCARTEIRAINVEST,:IDTIPOOPERACAO,'
      
        '    :IDPLANPREVCTBPATR,decode(:PLNCODIGO,0,null,:PLNCODIGO),deco' +
        'de(:CODDOCUMENTO,0,null,:CODDOCUMENTO),:IDMODULO,:IDEMPRESAPROP,' +
        ':DATAHISTRENFIX,:QTDHISTRENFIX,'
      
        '    :VLRHISTRENFIX,:SALDOVLRHISTRENFI,:SALDOQTDHISTRENFI,:TIPMOV' +
        'HISTRENFIX,:NATURMOVHISTRENFI,:HISTMOVRENFIX,'
      
        '    :FLGRECALC, decode(:IDOPERRENFIXORIG,0,null,:IDOPERRENFIXORI' +
        'G))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SALDOVLRHISTRENFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SALDOQTDHISTRENFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOVHISTRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NATURMOVHISTRENFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTMOVRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGRECALC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXORIG'
        ParamType = ptUnknown
      end>
  end
  object qryUpdHistRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'UPDATE'
      
        '   HISTRENFIX SET PLNCODIGO = DECODE(:PLNCODIGO,0,NULL,:PLNCODIG' +
        'O) ,'
      '   CODDOCUMENTO = DECODE(:CODDOCUMENTO,0,NULL,:CODDOCUMENTO) '
      'WHERE'
      '   IDHISTRENFIX = :IDHISTRENFIX'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 135
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
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qrySelItemXOpeXInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CI.IDCURVARENFIX, CR.DESCCURVARENFIX, IC.FLGCURVACONTABIL' +
        ', CI.IDITEMRENFIX, IT.DESCITEMRENFIX,'
      
        '       CI.FLGMOEDA, CI.IDREGRA, CI.FLGDESTACADO, CI.FLGCENTRALIZ' +
        'ADO, CI.SEQCALCULO, IT.TIPOITEM ,'
      
        '       IV.IDCLASSETIT, IC.FLGCURVACONTABIL, IC.FLGTPCURVASWAP, I' +
        'C.FLGCOTRENFIX'
      ''
      'FROM INVESTIMENTO IV, ITEMRENFIX IT, CURVASRENFIX CR,'
      '     INVESTXCURVARENFIX IC, CURVASXITEMRENFIX CI'
      ''
      'WHERE IV.IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '      IT.IDITEMRENFIX = CI.IDITEMRENFIX AND'
      '      CI.IDCURVARENFIX = CR.IDCURVARENFIX AND'
      '      IC.IDCURVARENFIX = CR.IDCURVARENFIX AND'
      '      IC.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      'ORDER BY IC.FLGCURVACONTABIL, CI.IDCURVARENFIX, SEQCALCULO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
  object qryUpdOperRenFixXCurvas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERRENFIXXCURVAS'
      
        'SET   (IDCURVARENFIX, IDITEMRENFIX, IDOPERRENFIX, IDMOEDA, VLRCU' +
        'RVA, PERCCURVA)'
      'VALUES'
      
        '   (:IDCURVARENFIX, :IDITEMRENFIX, :IDOPERRENFIX, :IDMOEDA, :VLR' +
        'CURVA, :PERCCURVA)')
    ValidateWithMask = True
    Left = 148
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCURVA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCCURVA'
        ParamType = ptInput
      end>
  end
  object qrySelOperRenFixXCurvas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCURVARENFIX,IDITEMRENFIX,IDOPERRENFIX,MOECODIGO,VLRCURV' +
        'A,PERCCURVA'
      'FROM OPERRENFIXXCURVAS'
      'WHERE IDOPERRENFIX =  :IDOPERRENFIX  AND'
      '      IDCURVARENFIX = :IDCURVARENFIX AND'
      '      IDITEMRENFIX =  :IDITEMRENFIX'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosHist: TwwQuery
    AfterScroll = qryBuscaSaldosHistAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTB' +
        'PATR,HR.PLNCODIGO,'
      
        '   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEI' +
        'RAINVEST,HR.IDOPERRENFIXAPLIC,'
      
        '   HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHIS' +
        'TRENFIX,HR.QTDHISTRENFIX,'
      
        '   HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX,' +
        'HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX,'
      
        '   IV.DESCINVESTIMENTO, IV.IDCLASSETIT, IV.CARENCIA, EM.SIGLAEMI' +
        'SSOR, CL.DESCCLASSETIT,'
      '   HR.IDOPERRENFIXORIG, CL.FLGUSAQTD'
      
        'FROM  HISTRENFIX HR, INVESTIMENTO IV, EMISSOR EM, CLASSETITRENFI' +
        'X CL'
      
        'WHERE (HR.DATAHISTRENFIX <= TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (HR.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDOPERRENFIXAPLIC IS NULL) OR (HR.IDOPERRENFIXAPLIC = :' +
        'IDOPERRENFIXAPLIC))'
      '  AND (HR.IDHISTRENFIX IN'
      '          (SELECT MAX(H1.IDHISTRENFIX)'
      '           FROM HISTRENFIX H1'
      
        '           WHERE (H1.DATAHISTRENFIX <= TO_DATE(:DATAHISTRENFIX,'#39 +
        'DD/MM/YYYY'#39'))'
      
        '             AND ((:IDHISTRENFIX IS NULL) OR (H1.IDHISTRENFIX <=' +
        ' :IDHISTRENFIX))'
      
        '             AND ((:IDINVESTIMENTO IS NULL) OR (H1.IDINVESTIMENT' +
        'O = :IDINVESTIMENTO))'
      
        '             AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H1.IDOPERRENF' +
        'IXAPLIC = :IDOPERRENFIXAPLIC))'
      '             AND (((:TIPOPROC IN (0,2)) AND'
      '                   (H1.TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      '                   (H1.IDTIPOOPERACAO NOT IN (-166,-167)) AND'
      
        '                   (H1.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,' +
        #39'DD/MM/YYYY'#39'))) OR'
      '                  (:TIPOPROC = 1) OR'
      '                  ((:TIPOPROC = 3) AND'
      '                   (H1.TIPMOVHISRENFIX = '#39'TRC'#39') AND'
      
        '                   (H1.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,' +
        #39'DD/MM/YYYY'#39'))))'
      
        '             AND ((H1.IDTIPOOPERACAO NOT IN (-17,-18,-19)) OR (:' +
        'OPER IS NOT NULL ))'
      
        '             AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.' +
        'IDOPERRENFIXAPLIC) IN'
      
        '                      (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINV' +
        'ESTIMENTO || H2.IDOPERRENFIXAPLIC'
      '                       FROM HISTRENFIX H2'
      
        '                       WHERE (H2.DATAHISTRENFIX <= TO_DATE(:DATA' +
        'HISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                         AND ((:IDINVESTIMENTO IS NULL) OR (H2.I' +
        'DINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                         AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H' +
        '2.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      '                         AND (((:TIPOPROC IN (0,2)) AND'
      '                               (H2.TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      
        '                               (H2.IDTIPOOPERACAO NOT IN (-166,-' +
        '167)) AND '
      
        '                               (H2.DATAHISTRENFIX = TO_DATE(:DAT' +
        'AHISTRENFIX,'#39'DD/MM/YYYY'#39'))) OR'
      '                              (:TIPOPROC = 1) OR'
      '                              ((:TIPOPROC = 3) AND'
      '                               (H2.TIPMOVHISRENFIX = '#39'TRC'#39') AND'
      
        '                               (H2.DATAHISTRENFIX = TO_DATE(:DAT' +
        'AHISTRENFIX,'#39'DD/MM/YYYY'#39'))))'
      
        '                         AND ((H2.IDTIPOOPERACAO NOT IN (-17,-18' +
        ',-19)) OR (:OPER IS NOT NULL ))'
      
        '                       GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENF' +
        'IXAPLIC))'
      '           GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      
        '  AND ((:IDCLASSETIT IS NULL) OR (IV.IDCLASSETIT = :IDCLASSETIT)' +
        ')'
      '  AND (((:TIPOPROC IN (0,2)) AND'
      '        (HR.TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      
        '        (HR.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY' +
        #39'))) OR'
      '       (:TIPOPROC = 1) OR'
      '       ((:TIPOPROC = 3) AND'
      '        (HR.TIPMOVHISRENFIX = '#39'TRC'#39') AND'
      
        '        (HR.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY' +
        #39'))))'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (IV.IDTIPOINVEST = 1)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      'ORDER BY DESCCLASSETIT, DESCINVESTIMENTO'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPER'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPER'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosItems: TwwQuery
    AfterOpen = qryBuscaSaldosItemsAfterOpen
    AfterScroll = qryBuscaSaldosItemsAfterScroll
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT HT.IDHISTRENFIX, HT.IDCURVARENFIX, HT.IDITEMRENFIX, HT.PU' +
        'ITEM, HT.PUACUITEM,'
      '       HT.IDREGRACALCULO,'
      '       TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX,'
      '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO,'
      
        '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX, IT.' +
        'TIPOITEM,'
      '       HT.VLRITEM, HT.VLRACUITEM'
      'FROM   HISTRENFIXXITENS HT, ITEMRENFIX IT, CURVASXITEMRENFIX CI'
      'WHERE  HT.IDHISTRENFIX = :IDHISTRENFIX AND'
      '       HT.IDITEMRENFIX = IT.IDITEMRENFIX AND'
      '       HT.IDCURVARENFIX = CI.IDCURVARENFIX AND'
      '       HT.IDITEMRENFIX = CI.IDITEMRENFIX'
      'ORDER BY HT.IDCURVARENFIX, CI.SEQCALCULO'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end>
    object qryBuscaSaldosItemsIDHISTRENFIX: TFloatField
      FieldName = 'IDHISTRENFIX'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.IDHISTRENFIX'
    end
    object qryBuscaSaldosItemsIDCURVARENFIX: TFloatField
      FieldName = 'IDCURVARENFIX'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.IDCURVARENFIX'
    end
    object qryBuscaSaldosItemsIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.IDITEMRENFIX'
    end
    object qryBuscaSaldosItemsPUITEM: TFloatField
      FieldName = 'PUITEM'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.PUITEM'
    end
    object qryBuscaSaldosItemsPUACUITEM: TFloatField
      FieldName = 'PUACUITEM'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.PUACUITEM'
    end
    object qryBuscaSaldosItemsIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.IDREGRACALCULO'
    end
    object qryBuscaSaldosItemsCODITEMRENFIX: TStringField
      FieldName = 'CODITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.CODITEMRENFIX'
      Size = 12
    end
    object qryBuscaSaldosItemsIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.CURVASXITEMRENFIX.IDREGRA'
    end
    object qryBuscaSaldosItemsFLGMOEDA: TStringField
      FieldName = 'FLGMOEDA'
      Origin = 'BASEDADOS.CURVASXITEMRENFIX.FLGMOEDA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldosItemsFLGDESTACADO: TStringField
      FieldName = 'FLGDESTACADO'
      Origin = 'BASEDADOS.CURVASXITEMRENFIX.FLGDESTACADO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldosItemsFLGCENTRALIZADO: TStringField
      FieldName = 'FLGCENTRALIZADO'
      Origin = 'BASEDADOS.CURVASXITEMRENFIX.FLGCENTRALIZADO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldosItemsSEQCALCULO: TFloatField
      FieldName = 'SEQCALCULO'
      Origin = 'BASEDADOS.CURVASXITEMRENFIX.SEQCALCULO'
    end
    object qryBuscaSaldosItemsDESCITEMRENFIX: TStringField
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
    object qryBuscaSaldosItemsTIPOITEM: TStringField
      FieldName = 'TIPOITEM'
      Origin = 'BASEDADOS.ITEMRENFIX.TIPOITEM'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldosItemsVLRITEM: TFloatField
      FieldName = 'VLRITEM'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.VLRITEM'
    end
    object qryBuscaSaldosItemsVLRACUITEM: TFloatField
      FieldName = 'VLRACUITEM'
      Origin = 'BASEDADOS.HISTRENFIXXITENS.VLRACUITEM'
    end
  end
  object qryBuscaSaldosOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERRENFIX, OP.IDINVESTIMENTO, OP.IDCUSTODIANTE, OP.' +
        'IDCARTEIRAINVEST,'
      
        '       OP.IDPLANPREVCTBPATR, OP.IDFORCLI, OP.MOECODIGO, OP.DATAO' +
        'PERACAO, OP.PUOPERACAO,'
      
        '       OP.PUEMISSAO, OP.VLROPERACAO, OP.QTDEOPERACAO, OP.VENCOPE' +
        'RACAO, OP.OBSERVACAO,'
      
        '       OP.IDTIPOOPERACAO, OP.DATAEMISSAO, TP.NATUREZAOPERACAO, T' +
        'P.FLGGERACONTAB,'
      
        '       OP.IDUSUARIO, OP.FLGOPERIMPLANT, OP.DATALEILAO, OP.FLGCAR' +
        'THIPO, OP.QTDCARTHIPO,'
      
        '       OP.IDOPERRENFIXAPLIC,OP.TXBOLSA,OP.TXOPERACIONAL,OP.PUMER' +
        'CADO,OP.FLGNEGOCIACAO,'
      
        '       OP.CODDOCUMENTO,OP.PLNCODIGO,OP.BOLETA,OP.IDCLASSRISCOREN' +
        'FIX,OP.FLGRECALC,'
      
        '       OP.DATALIQUIDACAO, OP.IDOPERRENFIXORIG, (OP1.DATAOPERACAO' +
        ') AS DATAOPERACAOORIG,'
      '       (OP1.PUOPERACAO) AS PUOPERACAOORIG'
      'FROM'
      '   OPERRENFIX OP, TIPOOPERACAO TP, OPERRENFIX OP1'
      'WHERE'
      '   OP.IDOPERRENFIX = :IDOPERRENFIX'
      '   AND OP.IDOPERRENFIXORIG = OP1.IDOPERRENFIX(+)'
      '   AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosItemsOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERRENFIX, OP.IDITEMRENFIX, OP.IDCURVARENFIX, OP.MO' +
        'ECODIGO, OP.VLRCURVA,'
      '       OP.PERCCURVA,'
      '       TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX,'
      '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO,'
      
        '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX, MO.' +
        'MOESIGLA, IT.TIPOITEM'
      
        'FROM   OPERRENFIXXCURVAS OP, ITEMRENFIX IT, CURVASXITEMRENFIX CI' +
        ', MOEDA MO'
      'WHERE  OP.IDOPERRENFIX = :IDOPERRENFIX  AND'
      '       OP.IDITEMRENFIX = IT.IDITEMRENFIX AND'
      '       OP.IDCURVARENFIX = CI.IDCURVARENFIX AND'
      '       OP.IDITEMRENFIX = CI.IDITEMRENFIX AND'
      '       OP.MOECODIGO = MO.MOECODIGO(+)'
      'ORDER BY CI.SEQCALCULO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaSaldosItemsXCurvas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    CV.IDCURVARENFIX,CV.IDITEMRENFIX,CV.IDREGRA,CV.FLGMOEDA,CV.F' +
        'LGDESTACADO,CV.FLGCENTRALIZADO,CV.SEQCALCULO,'
      '    IT.DESCITEMRENFIX, IT.TIPOITEM'
      'FROM CURVASXITEMRENFIX CV,ITEMRENFIX IT'
      'WHERE'
      '   (CV.IDCURVARENFIX = :IDCURVARENFIX) AND'
      '   (CV.IDITEMRENFIX = :IDITEMRENFIX) AND'
      '   (CV.IDITEMRENFIX = IT.IDITEMRENFIX)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptResult
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 247
    Top = 9
  end
  object qrySelOperRenFix: TwwQuery
    AfterOpen = qrySelOperRenFixAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.*, TP.*, IV.IDCLASSETIT, IV.DESCINVESTIMENTO'
      'FROM OPERRENFIX OP, TIPOOPERACAO TP, INVESTIMENTO IV'
      'WHERE'
      
        '   ((:IDOPERRENFIX IS NULL)   OR (OP.IDOPERRENFIX = :IDOPERRENFI' +
        'X)) AND'
      
        '   ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVESTI' +
        'MENTO)) AND'
      '   (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 55
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
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
      end>
  end
  object qrySelOperRenFixItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.*, IT.DESCITEMRENFIX, CI.SEQCALCULO, CI.IDREGRA, CI.FL' +
        'GMOEDA, IT.TIPOITEM'
      'FROM OPERRENFIXXCURVAS OP, CURVASXITEMRENFIX CI, ITEMRENFIX IT'
      'WHERE OP.IDOPERRENFIX = :IDOPERRENFIX AND'
      '      OP.IDCURVARENFIX = CI.IDCURVARENFIX AND'
      '      OP.IDITEMRENFIX = CI.IDITEMRENFIX AND'
      '      OP.IDITEMRENFIX = IT.IDITEMRENFIX'
      'ORDER BY CI.SEQCALCULO')
    ValidateWithMask = True
    Left = 148
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end>
  end
  object qryProcuraResgatesNoDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERRENFIX,OP.PLNCODIGO,OP.CODDOCUMENTO,LC.OPERACAO AS S' +
        'TATUS'
      'FROM'
      '   OPERRENFIX OP,'
      '   LANCTODOCUM LC'
      'WHERE'
      '   (OP.DATAOPERACAO = TO_DATE(:dDataProc,'#39'DD/MM/YYYY'#39')) AND'
      
        '   ( ( (:IDOPERRENFIX  IS NOT NULL)    AND (OP.IDOPERRENFIX  = :' +
        'IDOPERRENFIX) ) OR (:IDOPERRENFIX IS NULL) ) AND'
      '   (OP.CODDOCUMENTO = LC.CODDOCUMENTO) AND'
      '   (LC.OPERACAO     = '#39'5'#39')'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 587
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataProc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaHistRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   H.DATAHISTRENFIX, H.IDHISTRENFIX, H.PLNCODIGO, H.CODDOCUMENTO' +
        ', H.IDOPERRENFIX, H.IDOPERRENFIXAPLIC,'
      
        '   H.TIPMOVHISRENFIX, H.IDTIPOOPERACAO, O.PLNCODIGO AS PLNOPER, ' +
        'O.CODDOCUMENTO AS DOCOPER'
      'FROM'
      '   HISTRENFIX H, OPERRENFIX O'
      'WHERE'
      '   (H.DATAHISTRENFIX >= TO_DATE(:dDataProc,'#39'DD/MM/YYYY'#39'))'
      
        '   AND ((:IDOPERRENFIXAPLIC IS NULL) OR ((H.IDOPERRENFIXAPLIC = ' +
        ':IDOPERRENFIXAPLIC) OR (H.IDOPERRENFIXORIG = :IDOPERRENFIXAPLIC)' +
        '))'
      
        '   AND ((:IDHISTRENFIX IS NULL) OR (H.IDHISTRENFIX = :IDHISTRENF' +
        'IX))'
      
        '   AND ((:IDINVESTIMENTO IS NULL) OR (H.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '   AND (H.IDOPERRENFIX = O.IDOPERRENFIX)'
      'ORDER BY'
      '    H.DATAHISTRENFIX DESC, H.IDHISTRENFIX DESC'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataProc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
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
  object qryUpdFinanceiroHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTRENFIX'
      'SET VLRHISTRENFIX = :VLRHISTRENFIX,'
      '    SALDOVLRHISTRENFI = :SALDOVLRHISTRENFI'
      'WHERE  IDHISTRENFIX = :IDHISTRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 587
    Top = 92
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRHISTRENFIX'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'SALDOVLRHISTRENFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end>
  end
  object qryPadrLancRF: TwwQuery
    AfterOpen = qryPadrLancRFAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDPESSOA, IDTIPOINVEST, IDTIPOOPERACAO, IDCARTEIRAINVEST,IDIN' +
        'VESTIMENTO, IDFORCLI,'
      
        '   FLGPAGRECNAO, RECPAG, CODCENTRORESPON, CODTIPRECDES, UNIDNEGO' +
        'C, PLANO, CONTADOPERFIN, CONTACOPERFIN,'
      
        '   CENCUSTDINVEST, CENCUSTCINVEST, IDEMPRESA, CODSUBCONTAD, CODS' +
        'UBCONTAC, TIPCODIGO,'
      
        '   TIPLANCINVEST, HISTLANCINVEST, IDREGRALANCONTINV, TIPFORNINV,' +
        ' IDCLASSETIT, IDITEMRENFIX, IDSEGMENTACAO'
      ''
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( IDEMPRESA =:EMPRESAPROP )'
      '   AND ( IDTIPOINVEST =:TIPOINVEST )'
      '   AND ( IDSEGMENTACAO =:SEGMENTACAO )'
      
        '   AND (  ( (:TIPOOERACAO IS NOT NULL) AND (IDTIPOOPERACAO =:TIP' +
        'OOERACAO) )  OR   (:TIPOOERACAO IS NULL) )'
      
        '   AND (  ( (:CARTEIRA IS NOT NULL) AND (IDCARTEIRAINVEST =:CART' +
        'EIRA) )   OR   (:CARTEIRA IS NULL) )'
      
        '   AND (  ( (:INVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO =:IN' +
        'VESTIMENTO) ) OR   (:INVESTIMENTO IS NULL) )'
      
        '   AND (  ( (:IDCLASSETIT IS NOT NULL) AND (IDCLASSETIT =:IDCLAS' +
        'SETIT) )   OR   (:IDCLASSETIT IS NULL) )'
      
        '   AND (  ( (:IDITEMRENFIX IS NOT NULL) AND (IDITEMRENFIX =:IDIT' +
        'EMRENFIX) ) OR   (:IDITEMRENFIX IS NULL) )'
      
        '   AND DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) FROM PADRLANCCON' +
        'TINV'
      '                        WHERE( IDPESSOA =:EMPRESAPROP )'
      '                         AND ( IDEMPRESA =:EMPRESAPROP )'
      '                         AND ( IDTIPOINVEST =:TIPOINVEST )'
      '                         AND ( IDSEGMENTACAO =:SEGMENTACAO )'
      
        '                         AND ( DATAVIGENCIA <= TO_DATE(:DATAVIGE' +
        'NCIA,'#39'DD/MM/YYYY'#39') )'
      
        '                         AND (  ( (:TIPOOERACAO IS NOT NULL) AND' +
        ' (IDTIPOOPERACAO =:TIPOOERACAO) )  OR   (:TIPOOERACAO IS NULL) )'
      
        '                         AND (  ( (:CARTEIRA IS NOT NULL) AND (I' +
        'DCARTEIRAINVEST =:CARTEIRA) )   OR   (:CARTEIRA IS NULL) )'
      
        '                         AND (  ( (:INVESTIMENTO IS NOT NULL) AN' +
        'D (IDINVESTIMENTO =:INVESTIMENTO) ) OR   (:INVESTIMENTO IS NULL)' +
        ' )'
      
        '                         AND (  ( (:IDCLASSETIT IS NOT NULL) AND' +
        ' (IDCLASSETIT =:IDCLASSETIT) )   OR   (:IDCLASSETIT IS NULL) )'
      
        '                         AND (  ( (:IDITEMRENFIX IS NOT NULL) AN' +
        'D (IDITEMRENFIX =:IDITEMRENFIX) ) OR   (:IDITEMRENFIX IS NULL) )'
      '                       ) '
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 470
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM INVESTIMENTO'
      'WHERE '
      '   IDINVESTIMENTO = :IDINVESTIMENTO')
    ValidateWithMask = True
    Left = 148
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST SET DATAULTFECHRF = :DATAULTFECHRF'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 148
    Top = 178
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECHRF'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDHISTRENFIX'
    end
    object FloatField2: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object StringField1: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object FloatField3: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object updTempItensCalc: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDCURVARENFIX = :IDCURVARENFIX,'
      '  IDITEMRENFIX = :IDITEMRENFIX,'
      '  DESCITEMRENFIX = :DESCITEMRENFIX,'
      '  PUITEM = :PUITEM,'
      '  PUACUITEM = :PUACUITEM,'
      '  VLRCONTABIL = :VLRCONTABIL,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  TIPOITEM = :TIPOITEM'
      'where'
      '  IDCURVARENFIX = :OLD_IDCURVARENFIX and'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX and'
      '  DESCITEMRENFIX = :OLD_DESCITEMRENFIX and'
      '  PUITEM = :OLD_PUITEM and'
      '  PUACUITEM = :OLD_PUACUITEM and'
      '  VLRCONTABIL = :OLD_VLRCONTABIL and'
      '  IDREGRACALCULO = :OLD_IDREGRACALCULO and'
      '  TIPOITEM = :OLD_TIPOITEM')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDCURVARENFIX, IDITEMRENFIX, DESCITEMRENFIX, PUITEM, PUACUITE' +
        'M, '
      'VLRCONTABIL, '
      '   IDREGRACALCULO, TIPOITEM)'
      'values'
      '  (:IDCURVARENFIX, :IDITEMRENFIX, :DESCITEMRENFIX, :PUITEM, '
      ':PUACUITEM, '
      '   :VLRCONTABIL, :IDREGRACALCULO, :TIPOITEM)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDCURVARENFIX = :OLD_IDCURVARENFIX and'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX and'
      '  DESCITEMRENFIX = :OLD_DESCITEMRENFIX and'
      '  PUITEM = :OLD_PUITEM and'
      '  PUACUITEM = :OLD_PUACUITEM and'
      '  VLRCONTABIL = :OLD_VLRCONTABIL and'
      '  IDREGRACALCULO = :OLD_IDREGRACALCULO and'
      '  TIPOITEM = :OLD_TIPOITEM')
    Left = 587
    Top = 263
  end
  object qryTempItensCalc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (0) AS IDCURVARENFIX,'
      '   (0) AS IDITEMRENFIX,'
      
        '   '#39'                                                            ' +
        #39' AS DESCITEMRENFIX,'
      '   (0.00) AS PUITEM,'
      '   (0.00) AS PUACUITEM,'
      '   (0.00) AS VLRCONTABIL,'
      '   (0) AS IDREGRACALCULO,'
      '   '#39' '#39' AS TIPOITEM'
      'FROM'
      '   DUAL'
      'WHERE 1=2'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updTempItensCalc
    ValidateWithMask = True
    Left = 587
    Top = 306
  end
  object qryTempHistCalc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (0) AS IDHISTRENFIX,'
      '   (0) AS IDPLANPREVCTBPATR,'
      '   (0) AS PLNCODIGO,'
      '   (0) AS CODDOCUMENTO,'
      '   (0) AS IDTIPOOPERACAO,'
      '   (0) AS IDCARTEIRAINVEST,'
      '   (0) AS IDOPERRENFIXAPLIC,'
      '   (0) AS IDOPERRENFIX,'
      '   (0) AS IDINVESTIMENTO,'
      '   (0.00) AS VLRHISTRENFIX,'
      '   (0) AS QTDHISTRENFIX,'
      '   (0.00) AS SALDOVLRHISTRENFI,'
      '   (0) AS SALDOQTDHISTRENFI,'
      '   '#39' '#39' AS NATURMOVHISTRENFI,'
      
        '   '#39'                                                            ' +
        #39' AS HISTMOVRENFIX,'
      '   (0) AS IFORCLI,'
      '   (0) AS IDCLASSETIT,'
      '   (0) AS IDOPERRENFIXORIG   '
      'FROM'
      '   DUAL'
      'WHERE'
      '   1=2'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updTempHistCalc
    ValidateWithMask = True
    Left = 587
    Top = 348
  end
  object updTempHistCalc: TUpdateSQL
    Left = 587
    Top = 392
  end
  object qryBuscaSaldosHistAux: TwwQuery
    AfterOpen = qryBuscaSaldosHistAuxAfterOpen
    AfterScroll = qryBuscaSaldosHistAuxAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HR.IDHISTRENFIX, HR.SALDOVLRHISTRENFI, HR.SALDOQTDHISTREN' +
        'FI, IV.DESCINVESTIMENTO,'
      '       IV.CARENCIA, HR.IDPLANPREVCTBPATR, HR.PLNCODIGO'
      'FROM   HISTRENFIX HR, INVESTIMENTO IV'
      'WHERE HR.IDHISTRENFIX IN (SELECT MAX(IDHISTRENFIX)'
      '                          FROM HISTRENFIX'
      
        '                          WHERE ((:DATAHISTRENFIX IS NULL) OR (D' +
        'ATAHISTRENFIX = :DATAHISTRENFIX))'
      
        '                            AND ((:IDINVESTIMENTO IS NULL) OR (I' +
        'DINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                            AND ((:IDOPERRENFIXAPLIC IS NULL) OR' +
        ' (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      
        '                            AND (  ((:TIPOPROC = 0) AND (TIPMOVH' +
        'ISRENFIX = '#39'ATU'#39') AND (IDHISTRENFIX > :IDHISTRENFIX)) OR'
      
        '                                   ((:TIPOPROC IN (1,2)) AND (TI' +
        'PMOVHISRENFIX = '#39'ATU'#39') AND (IDHISTRENFIX < :IDHISTRENFIX)) OR'
      '                                   (:TIPOPROC = 3)   )'
      
        '                            AND ((:TIPOPROC = 3) OR (IDTIPOOPERA' +
        'CAO NOT IN (-17,-18,-19)))'
      '                          GROUP BY IDOPERRENFIXAPLIC)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '  AND (IV.IDTIPOINVEST = 1)'
      
        '  AND ((:DATAHISTRENFIX IS NULL) OR (HR.DATAHISTRENFIX = :DATAHI' +
        'STRENFIX))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (HR.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDOPERRENFIXAPLIC IS NULL) OR (IDOPERRENFIXAPLIC = :IDO' +
        'PERRENFIXAPLIC))'
      
        '  AND (  ((:TIPOPROC = 0) AND (HR.TIPMOVHISRENFIX = '#39'ATU'#39') AND (' +
        'HR.IDHISTRENFIX > :IDHISTRENFIX)) OR'
      
        '         ((:TIPOPROC IN (1,2)) AND (HR.TIPMOVHISRENFIX = '#39'ATU'#39') ' +
        'AND (HR.IDHISTRENFIX < :IDHISTRENFIX)) OR'
      '         (:TIPOPROC = 3)  )'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 148
    Top = 220
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosHistPoup: TwwQuery
    AfterScroll = qryBuscaSaldosHistPoupAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTB' +
        'PATR,HR.PLNCODIGO,'
      
        '   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEI' +
        'RAINVEST,HR.IDOPERRENFIXAPLIC,'
      
        '   HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHIS' +
        'TRENFIX,HR.QTDHISTRENFIX,'
      
        '   HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX,' +
        'HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX,'
      '   IV.DESCINVESTIMENTO, IV.CARENCIA, IV.IDCLASSETIT'
      'FROM   HISTRENFIX HR, INVESTIMENTO IV'
      
        'WHERE ((:DATAHISTRENFIX IS NULL) OR (HR.DATAHISTRENFIX <= TO_DAT' +
        'E(:DATAHISTRENFIX, '#39'DD/MM/YYYY'#39')))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (HR.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDOPERRENFIXAPLIC IS NULL) OR (IDOPERRENFIXAPLIC = :IDO' +
        'PERRENFIXAPLIC))'
      '  AND HR.IDHISTRENFIX IN'
      '         (SELECT MAX(H1.IDHISTRENFIX)'
      '          FROM HISTRENFIX H1'
      
        '          WHERE ((:DATAHISTRENFIX IS NULL) OR (H1.DATAHISTRENFIX' +
        ' <= TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39')))'
      
        '            AND ((:IDINVESTIMENTO IS NULL) OR (H1.IDINVESTIMENTO' +
        ' = :IDINVESTIMENTO))'
      
        '            AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H1.IDOPERRENFI' +
        'XAPLIC = :IDOPERRENFIXAPLIC))'
      '            AND (((:TIPOPROC IN (0,2)) AND'
      '                  (H1.TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      
        '                  (H1.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39 +
        'DD/MM/YYYY'#39'))) OR'
      '                 (:TIPOPROC = 1) OR'
      '                 ((:TIPOPROC = 3) AND'
      '                  (H1.TIPMOVHISRENFIX = '#39'TRC'#39') AND'
      
        '                  (H1.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39 +
        'DD/MM/YYYY'#39'))))'
      
        '            AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.I' +
        'DOPERRENFIXAPLIC) IN'
      
        '                     (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVE' +
        'STIMENTO || H2.IDOPERRENFIXAPLIC'
      '                      FROM HISTRENFIX H2'
      
        '                      WHERE (H2.DATAHISTRENFIX <= TO_DATE(:DATAH' +
        'ISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                        AND ((:IDINVESTIMENTO IS NULL) OR (H2.ID' +
        'INVESTIMENTO = :IDINVESTIMENTO))'
      
        '                        AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H2' +
        '.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      '                        AND (((:TIPOPROC IN (0,2)) AND'
      '                               (H2.TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      
        '                               (H2.DATAHISTRENFIX = TO_DATE(:DAT' +
        'AHISTRENFIX,'#39'DD/MM/YYYY'#39'))) OR'
      '                              (:TIPOPROC = 1) OR'
      '                              ((:TIPOPROC = 3) AND'
      '                               (H2.TIPMOVHISRENFIX = '#39'TRC'#39') AND'
      
        '                               (H2.DATAHISTRENFIX = TO_DATE(:DAT' +
        'AHISTRENFIX,'#39'DD/MM/YYYY'#39'))))'
      
        '                      GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFI' +
        'XAPLIC))'
      '          GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC)'
      
        '  AND (((:IDCLASSETIT IS NULL) OR (IV.IDCLASSETIT = :IDCLASSETIT' +
        ')) OR'
      
        '       ((:IDCLASSPOUPBLOQ IS NULL) OR (IV.IDCLASSETIT = :IDCLASS' +
        'POUPBLOQ)) )'
      '  AND (((:TIPOPROC IN (0,2)) AND'
      '        (HR.TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      
        '        (HR.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY' +
        #39'))) OR'
      '       (:TIPOPROC = 1) OR'
      '       ((:TIPOPROC = 3) AND'
      '        (HR.TIPMOVHISRENFIX = '#39'TRC'#39') AND'
      
        '        (HR.DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY' +
        #39'))))'
      '  AND (IV.IDTIPOINVEST = 1)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (HR.SALDOVLRHISTRENFI > 0)'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 247
    Top = 263
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSPOUPBLOQ'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSPOUPBLOQ'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosItemsPoup: TwwQuery
    AfterOpen = qryBuscaSaldosItemsPoupAfterOpen
    AfterScroll = qryBuscaSaldosItemsPoupAfterScroll
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT HT.IDHISTRENFIX, HT.IDCURVARENFIX, HT.IDITEMRENFIX, HT.PU' +
        'ITEM, HT.PUACUITEM,'
      '       HT.IDREGRACALCULO,'
      '       TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX,'
      '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO,'
      '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX'
      'FROM   HISTRENFIXXITENS HT, ITEMRENFIX IT, CURVASXITEMRENFIX CI'
      'WHERE  HT.IDHISTRENFIX = :IDHISTRENFIX AND'
      '       HT.IDITEMRENFIX = IT.IDITEMRENFIX AND'
      '       HT.IDCURVARENFIX = CI.IDCURVARENFIX AND'
      '       HT.IDITEMRENFIX = CI.IDITEMRENFIX'
      'ORDER BY CI.SEQCALCULO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 247
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosOperPoup: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERRENFIX, OP.IDINVESTIMENTO, OP.IDCUSTODIANTE, OP.' +
        'IDCARTEIRAINVEST,'
      
        '       OP.IDPLANPREVCTBPATR, OP.IDFORCLI, OP.MOECODIGO, OP.DATAO' +
        'PERACAO, OP.PUOPERACAO,'
      
        '       OP.PUEMISSAO, OP.VLROPERACAO, OP.QTDEOPERACAO, OP.VENCOPE' +
        'RACAO, OP.OBSERVACAO,'
      
        '       OP.IDTIPOOPERACAO, OP.DATAEMISSAO, TP.NATUREZAOPERACAO, T' +
        'P.FLGGERACONTAB'
      ''
      'FROM OPERRENFIX OP, TIPOOPERACAO TP'
      'WHERE IDOPERRENFIX = :IDOPERRENFIX AND'
      '      OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 247
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldosItemsOperPoup: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDOPERRENFIX, OP.IDITEMRENFIX, OP.IDCURVARENFIX, OP.MO' +
        'ECODIGO, OP.VLRCURVA,'
      '       OP.PERCCURVA,'
      '       TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX,'
      '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO,'
      
        '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX, MO.' +
        'MOESIGLA'
      
        'FROM   OPERRENFIXXCURVAS OP, ITEMRENFIX IT, CURVASXITEMRENFIX CI' +
        ', MOEDA MO'
      'WHERE  OP.IDOPERRENFIX = :IDOPERRENFIX  AND'
      '       OP.IDITEMRENFIX = IT.IDITEMRENFIX AND'
      '       OP.IDCURVARENFIX = CI.IDCURVARENFIX AND'
      '       OP.IDITEMRENFIX = CI.IDITEMRENFIX AND'
      '       OP.MOECODIGO = MO.MOECODIGO(+)'
      'ORDER BY CI.SEQCALCULO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaSaldosItemsXCurvasPoup: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    CV.IDCURVARENFIX,CV.IDITEMRENFIX,CV.IDREGRA,CV.FLGMOEDA,CV.F' +
        'LGDESTACADO,CV.FLGCENTRALIZADO,CV.SEQCALCULO,'
      '    IT.DESCITEMRENFIX'
      'FROM CURVASXITEMRENFIX CV,ITEMRENFIX IT'
      'WHERE'
      '   (CV.IDCURVARENFIX = :IDCURVARENFIX) AND'
      '   (CV.IDITEMRENFIX = :IDITEMRENFIX) AND'
      '   (CV.IDITEMRENFIX = IT.IDITEMRENFIX)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaFluxoPagtoJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAFLUXO,PERCFLUXO,IDINVESTIMENTO,IDCURVARENFIX,IDITEMRENFIX'
      'FROM'
      '   FLUXOINVESTRENFIX'
      'WHERE'
      '   DATAFLUXO = (SELECT'
      '                   MAX(FX.DATAFLUXO)'
      '                FROM'
      '                   FLUXOINVESTRENFIX FX'
      '                WHERE'
      '                   FX.IDINVESTIMENTO = :IDINVESTIMENTO AND'
      
        '                   FX.DATAFLUXO  BETWEEN TO_DATE(:dDataOper,'#39'DD/' +
        'MM/YYYY'#39') AND'
      
        '                                         TO_DATE(:dDataRef,'#39'DD/M' +
        'M/YYYY'#39') AND'
      '                   FX.IDCURVARENFIX  = :IDCURVARENFIX AND'
      '                   FX.IDITEMRENFIX   = :IDITEMRENFIX ) AND'
      '   IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '   IDCURVARENFIX  = :IDCURVARENFIX AND'
      '   IDITEMRENFIX   = :IDITEMRENFIX'
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
    Left = 247
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataOper'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end>
  end
  object QryLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 247
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryLotexDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'DELETE FROM LOTEXDOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO AND FLG' +
        'BAIXA = '#39'C'#39' ')
    ValidateWithMask = True
    Left = 47
    Top = 436
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryRecbtoPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RECBTOPAGTO WHERE CODDOCUMENTO =:CODDOCUMENTO')
    ValidateWithMask = True
    Left = 148
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DOCUMENTO WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 47
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTO WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 470
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PLANILHA WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 247
    Top = 436
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryIrLitigio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE IRLITIGIO SET PLANO = NULL, PLNCODIGO = NULL'
      'WHERE IDOPERRENFIX =:IDOPERRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 470
    Top = 348
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
  end
  object QryRateioDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 148
    Top = 436
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryCurvaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CR.DESCCURVARENFIX, IC.IDCURVARENFIX, IC.FLGCURVACONTABIL' +
        ', IC.FLGTPCURVASWAP, IC.FLGCOTRENFIX,IC.FLGCORREMISS'
      'FROM  INVESTXCURVARENFIX IC, CURVASRENFIX CR'
      'WHERE (IC.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      
        '      (((:IDCURVARENFIX IS NOT NULL) AND (IC.IDCURVARENFIX = :ID' +
        'CURVARENFIX)) OR'
      '       (:IDCURVARENFIX IS NULL)) AND'
      '      (IC.IDCURVARENFIX = CR.IDCURVARENFIX)'
      'ORDER BY FLGCURVACONTABIL, IDCURVARENFIX'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 247
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end>
  end
  object qryBuscaFluxoIncorpJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAFLUXO,PERCFLUXO,IDINVESTIMENTO,IDCURVARENFIX,IDITEMRENFIX'
      'FROM'
      '   FLUXOINVESTRENFIX'
      'WHERE'
      '   DATAFLUXO = (SELECT'
      '                   MAX(FX.DATAFLUXO)'
      '                FROM'
      '                   FLUXOINVESTRENFIX FX'
      '                WHERE'
      '                   FX.IDINVESTIMENTO = :IDINVESTIMENTO AND'
      
        '                   FX.DATAFLUXO  BETWEEN TO_DATE(:dDataOper,'#39'DD/' +
        'MM/YYYY'#39') AND'
      
        '                                         TO_DATE(:dDataRef,'#39'DD/M' +
        'M/YYYY'#39') AND'
      '                   FX.IDCURVARENFIX  = :IDCURVARENFIX AND'
      '                   FX.IDITEMRENFIX   = :IDITEMRENFIX ) AND'
      '   IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '   IDCURVARENFIX  = :IDCURVARENFIX AND'
      '   IDITEMRENFIX   = :IDITEMRENFIX'
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
    Left = 247
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataOper'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end>
  end
  object qryBuscaFluxoAmortPrinc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAFLUXO,PERCFLUXO,IDINVESTIMENTO,IDCURVARENFIX,IDITEMRENFIX'
      'FROM'
      '   FLUXOINVESTRENFIX'
      'WHERE'
      '   DATAFLUXO = (SELECT'
      '                   MAX(FX.DATAFLUXO)'
      '                FROM'
      '                   FLUXOINVESTRENFIX FX'
      '                WHERE'
      '                   FX.IDINVESTIMENTO = :IDINVESTIMENTO AND'
      
        '                   FX.DATAFLUXO  BETWEEN TO_DATE(:dDataOper,'#39'DD/' +
        'MM/YYYY'#39') AND'
      
        '                                         TO_DATE(:dDataRef,'#39'DD/M' +
        'M/YYYY'#39') AND'
      '                   FX.IDCURVARENFIX  = :IDCURVARENFIX AND'
      '                   FX.IDITEMRENFIX   = :IDITEMRENFIX ) AND'
      '   IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '   IDCURVARENFIX  = :IDCURVARENFIX AND'
      '   IDITEMRENFIX   = :IDITEMRENFIX'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 247
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataOper'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInput
      end>
  end
  object qryBuscaPUPGJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PUACUITEM, IDITEMRENFIX'
      'FROM HISTRENFIXXITENS'
      'WHERE IDHISTRENFIX = (SELECT MAX(IDHISTRENFIX)'
      '                      FROM HISTRENFIX'
      '                      WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      
        '                        AND IDOPERRENFIXAPLIC = :IDOPERRENFIXAPL' +
        'IC'
      
        '                        AND DATAHISTRENFIX = TO_DATE(:DATAOPERAC' +
        'AO,'#39'DD/MM/YYYY'#39')'
      '                        AND IDTIPOOPERACAO = :IDTIPOOPERACAO)'
      '  AND IDITEMRENFIX = :IDITEMRENFIX'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaCotRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRCOTACAO'
      'FROM COTACAORENFIX'
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND DATACOTACAO = TO_DATE(:DATACOTACAO,'#39'DD/MM/YYYY'#39')'
      '  AND DATAVENCTO = TO_DATE(:DATAVENCTO,'#39'DD/MM/YYYY'#39')'
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 50
    ParamData = <
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
        Name = 'DATAVENCTO'
        ParamType = ptInput
      end>
  end
  object qryBuscaHistOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.DATAHISTRENFIX, H.IDHISTRENFIX, H.NATURMOVHISTRENFI, H.' +
        'HISTMOVRENFIX,'
      '       H.PLNCODIGO, H.CODDOCUMENTO, H.IDOPERRENFIX, O.BOLETA'
      'FROM   HISTRENFIX H, OPERRENFIX O'
      'WHERE  (H.DATAHISTRENFIX = TO_DATE(:DATAOPER,'#39'DD/MM/YYYY'#39'))'
      
        '  AND  ((:IDOPERRENFIXAPLIC IS NULL) OR (H.IDOPERRENFIXAPLIC = :' +
        'IDOPERRENFIXAPLIC))'
      
        '  AND  ((:IDINVESTIMENTO IS NULL) OR (H.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      '  AND  (H.TIPMOVHISRENFIX IN ('#39'OPE'#39','#39'TRC'#39'))'
      
        '  AND  ((H.NATURMOVHISTRENFI = '#39'D'#39') OR (H.IDTIPOOPERACAO IN (-17' +
        ',-18,-19,-166,167)))'
      '  AND  ((H.IDHISTRENFIX > :IDHISTRENFIX) OR (H.FLGRECALC = '#39'S'#39'))'
      '  AND  (H.IDOPERRENFIX = O.IDOPERRENFIX)'
      ''
      'UNION'
      ''
      
        'SELECT H1.DATAHISTRENFIX, H1.IDHISTRENFIX, H1.NATURMOVHISTRENFI,' +
        ' H1.HISTMOVRENFIX,'
      '       H1.PLNCODIGO, H1.CODDOCUMENTO, H1.IDOPERRENFIX, O1.BOLETA'
      'FROM  (SELECT O.BOLETA'
      '       FROM HISTRENFIX H, OPERRENFIX O'
      
        '       WHERE  (H.DATAHISTRENFIX = TO_DATE(:DATAOPER,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '         AND  ((:IDOPERRENFIXAPLIC IS NULL) OR ((H.IDOPERRENFIXA' +
        'PLIC = :IDOPERRENFIXAPLIC) OR (H.IDOPERRENFIXORIG = :IDOPERRENFI' +
        'XAPLIC)))'
      
        '         AND  ((:IDINVESTIMENTO IS NULL) OR (H.IDINVESTIMENTO = ' +
        ':IDINVESTIMENTO))'
      '         AND  (H.TIPMOVHISRENFIX = '#39'TRC'#39')'
      '         AND  (H.NATURMOVHISTRENFI = '#39'A'#39')'
      '         AND  (H.IDHISTRENFIX > :IDHISTRENFIX)'
      
        '         AND  (H.IDOPERRENFIX = O.IDOPERRENFIX)) H2, OPERRENFIX ' +
        'O1, HISTRENFIX H1'
      'WHERE H2.BOLETA = O1.BOLETA'
      '  AND H1.IDOPERRENFIX = O1.IDOPERRENFIX'
      '  AND H1.TIPMOVHISRENFIX = '#39'TRC'#39
      '  AND H1.NATURMOVHISTRENFI = '#39'A'#39
      ''
      'ORDER BY DATAHISTRENFIX DESC, IDHISTRENFIX DESC'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPER'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPER'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end>
  end
  object qryUpdOperRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   OPERRENFIX SET PLNCODIGO = :PLNCODIGO,'
      '                  CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE'
      '   IDOPERRENFIX = :IDOPERRENFIX'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 587
    Top = 135
    ParamData = <
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
        DataType = ftUnknown
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaSaldosItemsAux: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT HT.IDHISTRENFIX, HT.IDCURVARENFIX, HT.IDITEMRENFIX, HT.PU' +
        'ITEM, HT.PUACUITEM,'
      '       HT.IDREGRACALCULO,'
      '       TRIM(IT.CODITEMRENFIX) AS CODITEMRENFIX,'
      '       CI.IDREGRA, CI.FLGMOEDA, CI.FLGDESTACADO,'
      
        '       CI.FLGCENTRALIZADO, CI.SEQCALCULO, IT.DESCITEMRENFIX,IT.T' +
        'IPOITEM ,'
      '       HT.VLRITEM, HT.VLRACUITEM'
      'FROM   HISTRENFIXXITENS HT, ITEMRENFIX IT, CURVASXITEMRENFIX CI'
      'WHERE  HT.IDHISTRENFIX = :IDHISTRENFIX AND'
      '       HT.IDITEMRENFIX = IT.IDITEMRENFIX AND'
      '       HT.IDCURVARENFIX = CI.IDCURVARENFIX AND'
      '       HT.IDITEMRENFIX = CI.IDITEMRENFIX'
      'ORDER BY CI.SEQCALCULO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaUltPUPagtoJur: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PUACUITEM, IDITEMRENFIX'
      'FROM HISTRENFIXXITENS'
      'WHERE IDHISTRENFIX ='
      '   (SELECT MAX(IDHISTRENFIX)'
      '    FROM HISTRENFIX'
      '    WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '      AND IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC'
      '      AND DATAHISTRENFIX <= TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      '      AND IDTIPOOPERACAO = -17)'
      '   AND (IDITEMRENFIX = :IDITEMRENFIX)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaFluxoProvPerda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERCFLUXO'
      'FROM FLUXOINVESTRENFIX'
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND IDCURVARENFIX = :IDCURVARENFIX'
      '  AND IDITEMRENFIX = -15'
      '  AND DATAFLUXO <= TO_DATE(:DATAFLUXO,'#39'DD/MM/YYYY'#39')'
      'ORDER BY DATAFLUXO DESC'
      ' ')
    ValidateWithMask = True
    Left = 250
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFLUXO'
        ParamType = ptResult
      end>
  end
  object qryBuscaRendRET: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTRENFIX,PUACUITEM, IDITEMRENFIX'
      'FROM'
      '   HISTRENFIXXITENS'
      'WHERE'
      '   (IDHISTRENFIX =(SELECT MAX(IDHISTRENFIX)'
      '                  FROM HISTRENFIX'
      '                  WHERE'
      '                     (IDINVESTIMENTO = :IDINVESTIMENTO)'
      
        '                     AND (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC' +
        ')'
      
        '                     AND (DATAHISTRENFIX IN (SELECT MAX(DATAHIST' +
        'RENFIX )'
      '                                             FROM'
      '                                                HISTRENFIX'
      '                                             WHERE'
      
        '                                                (IDINVESTIMENTO ' +
        '= :IDINVESTIMENTO)'
      
        '                                                AND (IDOPERRENFI' +
        'XAPLIC = :IDOPERRENFIXAPLIC)'
      
        '                                                AND (DATAHISTREN' +
        'FIX <= TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                                             GROUP BY IDINVESTIM' +
        'ENTO))'
      '                  GROUP BY IDINVESTIMENTO))'
      '   AND (IDITEMRENFIX=-6)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaSaldosResgF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(QTDEOPERACAO) AS SLDQTD, SUM(VLROPERACAO) AS SLDVLR'
      'FROM   OPERRENFIX'
      'WHERE IDTIPOOPERACAO NOT IN (-17, -18, -19)'
      '  AND IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC'
      
        '  AND (((DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') ) AN' +
        'D (IDOPERRENFIX > :IDOPERRENFIX)) OR'
      '        (DATAOPERACAO > TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') ) )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
        Value = '9375'
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
        Value = '361'
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
        Value = '18/03/2003'
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
        Value = '817'
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 587
    Top = 220
  end
  object qryBuscaLucroPrejOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (L.VLRCURVA + P.VLRCURVA) AS LUCROPREJ'
      'FROM (SELECT VLRCURVA'
      '      FROM OPERRENFIXXCURVAS'
      '      WHERE IDOPERRENFIX = :IDOPERRENFIX'
      '        AND IDITEMRENFIX = -9) L,'
      '     (SELECT VLRCURVA'
      '      FROM OPERRENFIXXCURVAS'
      '      WHERE IDOPERRENFIX = :IDOPERRENFIX'
      '        AND IDITEMRENFIX = -10) P')
    ValidateWithMask = True
    Left = 342
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end>
  end
  object qryBuscaTotalResgPoup: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(O.VLROPERACAO) AS VALOR, SUM(O.QTDEOPERACAO) AS QUANT' +
        'IDADE,'
      
        '       SUM(DECODE(T.TIPOMOVTO, '#39'TRC'#39', NVL(O.VLROPERACAO,0), 0)) ' +
        'AS VALORTRC,'
      
        '       SUM(DECODE(T.TIPOMOVTO, '#39'TRC'#39', NVL(O.QTDEOPERACAO,0), 0))' +
        ' AS QTDTRC'
      'FROM OPERRENFIX O, TIPOOPERACAO T'
      'WHERE O.DATAOPERACAO > TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '  AND ('
      
        '       (('#39'ATU'#39' = :sOPER) AND (O.DATAOPERACAO <  TO_DATE(:DATAFIM' +
        ','#39'DD/MM/YYYY'#39'))) OR'
      
        '       (('#39'ATU'#39' = :sOPER) AND (T.TIPOMOVTO = '#39'TRC'#39') AND (O.DATAOP' +
        'ERACAO <=  TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) OR'
      
        '       (('#39'OPE'#39' = :sOPER) AND (O.DATAOPERACAO <=  TO_DATE(:DATAFI' +
        'M,'#39'DD/MM/YYYY'#39')))'
      '      )'
      '  AND O.IDINVESTIMENTO = :IDINVESTIMENTO'
      
        '  AND ((:IDOPERRENFIXAPLIC IS NULL) OR (O.IDOPERRENFIXAPLIC = :I' +
        'DOPERRENFIXAPLIC))'
      
        '  AND ((T.NATUREZAOPERACAO = '#39'D'#39') OR ((T.NATUREZAOPERACAO = '#39'A'#39')' +
        ' AND (T.TIPOMOVTO = '#39'TRC'#39')))'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sOper'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sOPER'
        ParamType = ptUnknown
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
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end>
  end
  object qryUpdLucroPrej: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERRENFIXXCURVAS'
      'SET VLRCURVA = :VLRCURVA'
      'WHERE IDOPERRENFIX = :IDOPERRENFIX'
      '  AND (((:IDITEMRENFIX = 0) AND (IDITEMRENFIX IN (-9,-10))) OR'
      '        (IDITEMRENFIX = :IDITEMRENFIX))'
      '')
    ValidateWithMask = True
    Left = 587
    Top = 178
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRCURVA'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptInputOutput
      end>
  end
  object qryBuscaFluxo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FLUXOINVESTRENFIX'
      'WHERE DATAFLUXO = TO_DATE(:DATAFLUXO,'#39'DD/MM/YYYY'#39')'
      '  AND IDINVESTIMENTO = :IDINVESTIMENTO '
      '  AND IDCURVARENFIX  = :IDCURVARENFIX'
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
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 92
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFLUXO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end>
  end
  object qryNumBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BOLETA'
      'FROM OPERRENFIX'
      'WHERE DATAOPERACAO = TO_DATE(:DATAOPERACAO, '#39'DD/MM/YYYY'#39')'
      '  AND IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC'
      '  AND IDTIPOOPERACAO IN (-97,-98)')
    ValidateWithMask = True
    Left = 469
    Top = 263
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end>
  end
  object qryBuscaFluxosNoDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(OP.VLROPERACAO) AS VLROPERACAO'
      'FROM '
      '   OPERRENFIX OP'
      'WHERE'
      '   (OP.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (OP.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) AND'
      '   (OP.DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) AND'
      '   (OP.IDTIPOOPERACAO IN (-17,-18))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaOPECotRenFix: TwwQuery
    AfterOpen = qryBuscaSaldosHistAuxAfterOpen
    AfterScroll = qryBuscaSaldosHistAuxAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HR.IDHISTRENFIX, HR.TIPMOVHISRENFIX, HR.IDOPERRENFIXAPLIC, HR' +
        '.IDINVESTIMENTO  '
      'FROM   HISTRENFIX HR'
      'WHERE  HR.IDHISTRENFIX IN (SELECT IDHISTRENFIX'
      '                           FROM HISTRENFIX'
      
        '                           WHERE (((:DATAHISTRENFIX IS NOT NULL)' +
        ' AND (DATAHISTRENFIX = TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))) O' +
        'R (:DATAHISTRENFIX IS NULL)) AND'
      
        '                                 (((:IDINVESTIMENTO IS NOT NULL)' +
        ' AND (IDINVESTIMENTO = :IDINVESTIMENTO)) OR (:IDINVESTIMENTO IS ' +
        'NULL)) AND'
      
        '                                 (((:IDOPERRENFIXAPLIC IS NOT NU' +
        'LL) AND (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC)) OR (:IDOPERREN' +
        'FIXAPLIC IS NULL)) AND'
      '                                 (TIPMOVHISRENFIX = '#39'OPE'#39') AND'
      
        '                                 (IDTIPOOPERACAO NOT IN (-17,-18' +
        ',-19))) AND'
      
        '       (((:DATAHISTRENFIX IS NOT NULL) AND (HR.DATAHISTRENFIX = ' +
        'TO_DATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39'))) OR (:DATAHISTRENFIX IS N' +
        'ULL)) AND'
      
        '       (((:IDINVESTIMENTO IS NOT NULL) AND (HR.IDINVESTIMENTO = ' +
        ':IDINVESTIMENTO)) OR (:IDINVESTIMENTO IS NULL)) AND'
      
        '       (((:IDOPERRENFIXAPLIC IS NOT NULL) AND (HR.IDOPERRENFIXAP' +
        'LIC = :IDOPERRENFIXAPLIC)) OR (:IDOPERRENFIXAPLIC IS NULL)) AND'
      '       (HR.TIPMOVHISRENFIX = '#39'OPE'#39')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 178
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
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
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaATUCotRenFix: TwwQuery
    AfterOpen = qryBuscaSaldosHistAuxAfterOpen
    AfterScroll = qryBuscaSaldosHistAuxAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HR.IDHISTRENFIX, HR.TIPMOVHISRENFIX, HR.IDOPERRENFIXAPLIC,'
      '   HR.IDINVESTIMENTO, HR.PLNCODIGO  '
      'FROM   HISTRENFIX HR'
      'WHERE  HR.IDHISTRENFIX IN (SELECT MAX(IDHISTRENFIX)'
      '                           FROM HISTRENFIX'
      
        '                           WHERE (DATAHISTRENFIX = TO_DATE(:DATA' +
        'HISTRENFIX,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                 (IDINVESTIMENTO = :IDINVESTIMEN' +
        'TO) AND'
      
        '                                 (IDOPERRENFIXAPLIC = :IDOPERREN' +
        'FIXAPLIC) AND'
      '                                 (TIPMOVHISRENFIX = '#39'ATU'#39') AND'
      
        '                                 (IDHISTRENFIX > :IDHISTRENFIX))' +
        '  '
      ''
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryBuscasSldQtdHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HR.SALDOQTDHISTRENFI, HR.PLNCODIGO, HR.IDHISTRENFIX'
      'FROM   HISTRENFIX HR'
      'WHERE  HR.IDHISTRENFIX IN (SELECT MIN(IDHISTRENFIX)'
      '                           FROM HISTRENFIX'
      
        '                           WHERE (DATAHISTRENFIX = TO_DATE(:DATA' +
        'HISTRENFIX,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                 (IDINVESTIMENTO = :IDINVESTIMEN' +
        'TO) AND'
      
        '                                 (IDOPERRENFIXAPLIC = :IDOPERREN' +
        'FIXAPLIC) AND'
      '                                 (TIPMOVHISRENFIX = '#39'ATU'#39') AND'
      '                                 (IDHISTRENFIX < :IDHISTRENFIX))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 436
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end>
  end
  object qryMarcadoReproc: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MIN(H.DATAHISTRENFIX) AS DATAHISTRENFIX, H.IDINVESTIMENTO' +
        ', H.IDOPERRENFIXAPLIC,'
      '       I.DESCINVESTIMENTO'
      'FROM HISTRENFIX H, INVESTIMENTO I'
      
        'WHERE ((:IDINVESTIMENTO IS NULL) OR (H.IDINVESTIMENTO = :IDINVES' +
        'TIMENTO))'
      
        '  AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H.IDOPERRENFIXAPLIC = :I' +
        'DOPERRENFIXAPLIC))'
      '  AND (H.FLGRECALC = '#39'S'#39')'
      
        '  AND ((((H.TIPMOVHISRENFIX || H.NATURMOVHISTRENFI) =  '#39'OPEA'#39') A' +
        'ND'
      
        '         (H.DATAHISTRENFIX < TO_DATE(:DATAULTFECHRF,'#39'DD/MM/YYYY'#39 +
        ')) ) OR'
      
        '       (((H.TIPMOVHISRENFIX || H.NATURMOVHISTRENFI) <> '#39'OPEA'#39') A' +
        'ND'
      
        '         (H.DATAHISTRENFIX <= TO_DATE(:DATAULTFECHRF,'#39'DD/MM/YYYY' +
        #39')) ) )'
      '  AND (H.IDINVESTIMENTO = I.IDINVESTIMENTO)'
      
        'GROUP BY H.IDINVESTIMENTO, I.DESCINVESTIMENTO, H.IDOPERRENFIXAPL' +
        'IC'
      'ORDER BY DATAHISTRENFIX DESC, IDINVESTIMENTO, IDOPERRENFIXAPLIC'
      ''
      ''
      ' '
      ' ')
    Left = 587
    Top = 50
    ParamData = <
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAULTFECHRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAULTFECHRF'
        ParamType = ptUnknown
      end>
  end
  object qryMarcaInvRep: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTRENFIX'
      'SET FLGRECALC = DECODE(:FLAG,'#39'S'#39','#39'S'#39',NULL)'
      'WHERE (IDHISTRENFIX  IN'
      '        (SELECT MIN(H2.IDHISTRENFIX)'
      '         FROM HISTRENFIX H2'
      
        '         WHERE ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEIRAINV' +
        'EST  = :IDCARTEIRAINVEST))'
      
        '           AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR))'
      
        '           AND ((:IDINVESTIMENTO IS NULL) OR (H2.IDINVESTIMENTO ' +
        '= :IDINVESTIMENTO))'
      
        '           AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H2.IDOPERRENFIX' +
        'APLIC = :IDOPERRENFIXAPLIC))'
      
        '           AND ((H2.DATAHISTRENFIX || H2.IDCARTEIRAINVEST || H2.' +
        'IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC || H2.IDPLANPREVCTBPATR) ' +
        'IN'
      
        '                               (SELECT (MAX(H3.DATAHISTRENFIX) |' +
        '| H3.IDCARTEIRAINVEST || H3.IDINVESTIMENTO || H3.IDOPERRENFIXAPL' +
        'IC || H3.IDPLANPREVCTBPATR)'
      '                                FROM HISTRENFIX H3'
      
        '                                WHERE ((:IDCARTEIRAINVEST IS NUL' +
        'L) OR (H3.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                                  AND ((:IDPLANPREVCTBPATR IS NU' +
        'LL) OR (H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                  AND ((:IDINVESTIMENTO IS NULL)' +
        ' OR (H3.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                  AND ((:IDOPERRENFIXAPLIC IS NU' +
        'LL) OR (H3.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      
        '                                  AND (H3.DATAHISTRENFIX <= TO_D' +
        'ATE(:DATAHISTRENFIX,'#39'DD/MM/YYYY'#39') )'
      
        '                                GROUP BY H3.IDINVESTIMENTO, H3.I' +
        'DOPERRENFIXAPLIC, H3.IDCARTEIRAINVEST, H3.IDPLANPREVCTBPATR) )'
      '           AND (NOT EXISTS (SELECT H4.IDOPERRENFIX'
      '                            FROM HISTRENFIX H4'
      
        '                            WHERE H4.IDINVESTIMENTO = H2.IDINVES' +
        'TIMENTO'
      
        '                              AND H4.IDOPERRENFIXAPLIC = H2.IDOP' +
        'ERRENFIXAPLIC'
      
        '                              AND H4.DATAHISTRENFIX = H2.DATAHIS' +
        'TRENFIX'
      '                              AND H4.SALDOQTDHISTRENFI = 0'
      '                              AND :FLAG = '#39'S'#39'))'
      
        '         GROUP BY H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.IDO' +
        'PERRENFIXAPLIC, H2.IDPLANPREVCTBPATR))'
      '  AND (SALDOQTDHISTRENFI > 0)'
      ' '
      ' '
      ' ')
    Left = 465
    Top = 436
    ParamData = <
      item
        DataType = ftString
        Name = 'FLAG'
        ParamType = ptInput
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLAG'
        ParamType = ptInput
      end>
  end
  object qruBuscaPUFluxo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PUOPERACAO, DATAOPERACAO, VLROPERACAO'
      'FROM OPERRENFIX'
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC'
      '  AND IDTIPOOPERACAO = :IDTIPOOPERACAO'
      '  AND DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 585
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end>
  end
  object qryBuscaDtUltPUPagtoJur: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAHISTRENFIX'
      'FROM HISTRENFIX'
      'WHERE IDHISTRENFIX ='
      '   (SELECT MAX(IDHISTRENFIX)'
      '    FROM HISTRENFIX'
      '    WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '      AND IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC'
      '      AND DATAHISTRENFIX <= TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      '      AND IDTIPOOPERACAO = -17)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 342
    Top = 482
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryBuscaValorIOF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DECODE(NVL(HT.VLRITEM,0),0,HT.PUACUITEM,HT.VLRITEM) AS VLRIOF' +
        ','
      
        '   DECODE(NVL(HT.VLRACUITEM,0),0,HT.PUACUITEM,HT.VLRACUITEM) AS ' +
        'VLRACUIOF'
      'FROM'
      '   HISTRENFIX H, HISTRENFIXXITENS HT,'
      '   (SELECT IDOPERRENFIX, MAX(DATAVIGENCIA) AS DATAVIGENCIA'
      '    FROM HISTOPERRENFIX'
      '    WHERE IDOPERRENFIX = :IDOPERRENFIXAPLIC'
      '      AND DATAVIGENCIA <= TO_DATE(:DATAPROC,'#39'DD/MM/YYYY'#39')'
      '    GROUP BY IDOPERRENFIX) OP'
      'WHERE (HT.IDITEMRENFIX = -8)'
      '  AND (HT.IDCURVARENFIX = :IDCURVARENFIX)'
      '  AND (HT.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX)'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE (H1.IDOPERRENFIXAPLIC = :IDOPER' +
        'RENFIXAPLIC)'
      
        '                             AND (H1.DATAHISTRENFIX IN (SELECT M' +
        'AX(H2.DATAHISTRENFIX)'
      
        '                                                        FROM HIS' +
        'TRENFIX H2'
      
        '                                                        WHERE (H' +
        '2.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC)'
      
        '                                                          AND (H' +
        '2.DATAHISTRENFIX <= TO_DATE(:DATAPROC,'#39'DD/MM/YYYY'#39'))))'
      '                        ))'
      '  AND ((H.DATAHISTRENFIX - OP.DATAVIGENCIA) < 30)'
      '  AND (H.IDHISTRENFIX = HT.IDHISTRENFIX)'
      '  AND (H.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAPROC'
        ParamType = ptUnknown
      end>
  end
  object qryExisteOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERRENFIX, OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, TP.' +
        'FLGGERACONTAB,'
      
        '   TP.FLGCONTAINVEST, TP.TIPOMOVTO, TP.DESCTIPOOPERACAO, IV.DESC' +
        'INVESTIMENTO'
      'FROM'
      '   OPERRENFIX OP, TIPOOPERACAO TP, INVESTIMENTO IV'
      'WHERE (OP.DATAOPERACAO = TO_DATE(:DDATAPROC,'#39'DD/MM/YYYY'#39'))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDOPERRENFIXAPLIC IS NULL) OR (OP.IDOPERRENFIXAPLIC = :' +
        'IDOPERRENFIXAPLIC) OR (OP.IDOPERRENFIXORIG = :IDOPERRENFIXAPLIC)' +
        ')'
      '  AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '  AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND NOT EXISTS (SELECT IDOPERRENFIX'
      '                  FROM HISTRENFIX H1'
      
        '                  WHERE H1.DATAHISTRENFIX = TO_DATE(:DDATAPROC,'#39 +
        'DD/MM/YYYY'#39')'
      '                    AND H1.IDOPERRENFIX = OP.IDOPERRENFIX)'
      'ORDER BY'
      '   OP.IDOPERRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 468
    Top = 485
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataProc'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DDATAPROC'
        ParamType = ptResult
      end>
  end
  object qryBuscaOPETRC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.DATAOPERACAO, O.IDOPERRENFIX, O.IDOPERRENFIXAPLIC, O.ID' +
        'INVESTIMENTO, O.IDTIPOOPERACAO, O.PLNCODIGO, O.CODDOCUMENTO,'
      '       T.DESCTIPOOPERACAO, P.DESCPLANOPREV, I.IDCLASSETIT'
      'FROM OPERRENFIX O, TIPOOPERACAO T, INVESTIMENTO I,'
      
        '     (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) A' +
        'S DESCPLANOPREV'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) P'
      'WHERE O.BOLETA = :BOLETA'
      '  AND ((O.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) OR'
      '       (O.IDOPERRENFIXORIG = :IDOPERRENFIXAPLIC) OR'
      '       (:IDOPERRENFIXAPLIC IS NULL))'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      '  AND O.IDPLANPREVCTBPATR = P.IDPLANPREVCTBPATR'
      '  AND O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      'ORDER BY IDTIPOOPERACAO'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 157
    Top = 493
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end>
  end
  object qryOperTRCDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.IDOPERRENFIX'
      'FROM'
      '   OPERRENFIX OP'
      'WHERE (OP.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC)'
      '  AND (OP.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '  AND (OP.DATAOPERACAO = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '  AND (OP.IDTIPOOPERACAO IN (-97,-98))'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 247
    Top = 492
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
  end
  object qryAtuEmiss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CR.DESCCURVARENFIX, IC.IDCURVARENFIX, IC.FLGCURVACONTABIL' +
        ', IC.FLGTPCURVASWAP, IC.FLGCOTRENFIX'
      'FROM  INVESTXCURVARENFIX IC, CURVASRENFIX CR'
      'WHERE (IC.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      
        '      (((:IDCURVARENFIX IS NOT NULL) AND (IC.IDCURVARENFIX = :ID' +
        'CURVARENFIX)) OR'
      '       (:IDCURVARENFIX IS NULL)) AND'
      '      (IC.IDCURVARENFIX = CR.IDCURVARENFIX)'
      'ORDER BY FLGCURVACONTABIL, IDCURVARENFIX'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 583
    Top = 482
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptInput
      end>
  end
  object Regra: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 536
    Top = 536
  end
end
