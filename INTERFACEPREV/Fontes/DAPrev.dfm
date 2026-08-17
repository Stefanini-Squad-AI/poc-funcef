object dtmAPrev: TdtmAPrev
  OldCreateOrder = True
  Left = 267
  Top = 95
  Height = 479
  Width = 741
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 28
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 216
    Top = 77
  end
  object qryContPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPLANOPREV,       IDCONTRIBUICAO,    IDPESSJUR,'
      '        PLANO,             PLACONTAC,         PLACONTAD,'
      '        CODCENTROCUSTOC,   CODCENTROCUSTOD,   IDEMPRESA,'
      '        UNIDNEGOC,         IDEMPRESAPROP,     CODCENTRORESPON,'
      '        CODSUBCONTA,       CODALTERADORCORR,  CODALTERADORJUROS,'
      '        RECPAG,            CODTIPRECDES,      TIPCODIGO,'
      '        CODTIPDOC,         CODPORTFORMA,'
      '        PLANO13,           PLACONTAC13,       PLACONTAD13,'
      '        CODCENTROCUSTOC13, CODCENTROCUSTOD13, IDEMPRESA13,'
      '        UNIDNEGOC13,       IDEMPRESAPROP13,   CODCENTRORESPON13,'
      '        CODSUBCONTA13,     CODALTERACORR13,   CODALTERAJUROS13,'
      '        RECPAG13,          CODTIPRECDES13,    TIPCODIGO13,'
      '        CODTIPDOC13,       CODPORTFORMA13,    CODTIPDESEMBCAR,'
      '        RECPAGDEVOL,       CODTIPDESEMBDEVOL, CODCCUSTODEVOL,'
      '        PLACONTADEVOL,     IDPLANPREVCONTAB ,'
      '        CODTIPDESEMB13,    TIPCODIGO13 ,'
      '        PLACONTADBANCO13  ,PLACONTADBANCO'
      'FROM  CONTPLANPATRO'
      'WHERE IDPLANOPREV = :IdPlanoPrev AND'
      '      IDPESSJUR   = :IdPessJur   AND'
      '      IDCONTRIBUICAO = :IdContribuicao'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 83
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdContribuicao'
        ParamType = ptUnknown
      end>
  end
  object qryContPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPLANOPREV,      IDCONTRIBUICAO,'
      '        PLANO,            PLACONTAC,         PLACONTAD,'
      '        CODCENTROCUSTOC,  CODCENTROCUSTOD,   IDEMPRESA,'
      '        UNIDNEGOC,        CODCENTRORESPON,   IDEMPRESAPROP,'
      '        CODSUBCONTA,      CODALTERADORJUROS, CODALTERADORCORR ,'
      '        RECPAG,           CODTIPRECDES,      TIPCODIGO,'
      '        CODTIPDOC,        CODPORTFORMA ,'
      '        PLANO13,          PLACONTAC13,       PLACONTAD13,'
      '        CODCENTROCUSTOC13,CODCENTROCUSTOD13, IDEMPRESA13,'
      '        UNIDNEGOC13,      CODCENTRORESPON13, IDEMPRESAPROP13,'
      '        CODSUBCONTA13 ,   CODALTERAJUROS13 , CODALTERACORR13 ,'
      '        RECPAG13,         CODTIPRECDES13,    TIPCODIGO13,'
      '        CODTIPDOC13,      CODPORTFORMA13,    CODTIPDESEMBCAR,'
      '        RECPAGDEVOL,      CODTIPDESEMBDEVOL, CODCCUSTODEVOL,'
      '        PLACONTADEVOL,    IDPLANPREVCONTAB,'
      '        CODTIPDESEMB13,    TIPCODIGO13,'
      '        PLACONTADBANCO13  ,PLACONTADBANCO'
      'FROM  CONTPREV'
      'WHERE IDPLANOPREV = :IdPlanoPrev AND'
      '      IDCONTRIBUICAO = :IdContribuicao'
      ' ')
    ValidateWithMask = True
    Left = 129
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdContribuicao'
        ParamType = ptUnknown
      end>
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 40
    Top = 144
  end
  object qryVerificaObrig: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 217
    Top = 21
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 132
    Top = 138
  end
  object regraAPrev: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 126
    Top = 21
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 218
    Top = 134
  end
  object qryAuxContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CP.IDPLANOPREV,       CP.IDCONTRIBUICAO,'
      '       CP.IDREGRACALCULO,    CP.IDREGRAPRIMPAGTO,'
      '       CP.IDREGRAULTPAGTO,   C.QTDEPARCELAS,'
      '       CP.FLGPAGADOR,        C.FLGOBRIGATORIA,'
      '       C.NOME,               CP.FLGNAOEXIGEREC,'
      '       CP.FLGCOBRA13DTFIM,   CP.IDREGRAPRIMPGTO13,'
      '       CP.IDREGRAULTPGTO13,  CP.IDREGRACALCULO13,'
      '       CP.FLGSALPRORATA1PG,'
      '       CP.IDRUBDECTERC,      CP.IDRUBDECTERCATRA,'
      '       CP.IDRUBDECTERCDEVOL, CP.IDRUBRICA,'
      '       CP.IDRUBRICAATRASO,   CP.IDRUBRICADEVOLUC,'
      '       CP.FLGCOBRADECTERC'
      'FROM   CONTRIBUICAO C, CONTPREV CP'
      'WHERE  (CP.IDPLANOPREV      = :IDPLANOPREV)'
      'AND    (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)'
      'ORDER BY CP.IDCONTRIBUICAO'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaxPess: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPROVDESC'
      'FROM   RUBRICAXPESS'
      'WHERE  IDPESSOA  = :IDPESSJUR'
      'AND    IDRUBRICA = :IDRUBRICA')
    ValidateWithMask = True
    Left = 232
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryAlteradorContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 192
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 294
    Top = 258
  end
  object qryPlanReduz: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 26
    Top = 263
  end
  object qryReduzContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 117
    Top = 260
  end
  object qryBenefRecalculo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS FLGPROCESSA, BF.IDPESSOA,   BF.IDTITULAR,      BF.ID' +
        'PLANOPREV, BF.SEQPROPOSTA,'
      
        '       BF.IDPESSJUR,  BF.IDBENEFICIO,     BF.NUMEROPROCESSO, BF.' +
        'NUMPROCINSS,'
      '       BF.VALORATUAL, BF.VALORCALCULADO,  BF.VALORCOTAS,'
      '       BF.VALORTOTAL, BF.VLRCALCINSS,     BF.VLRINFINSS,'
      
        '       BF.DATAFINAL,  BF.DATAINICIO,      BF.DATAINICIOFUND, BF.' +
        'DATAINICIOINSS,'
      
        '       BF.DATAREQUERIMENTO,               BF.IDSITBENEFICIO, BF.' +
        'IDTPPAGTOBENEFIC,'
      
        '       BF.ULTMESREAJUSTE, BPP.VALORBASE1, BPP.VALORBASE2, BPP.VA' +
        'LORBASE3, B.NOME'
      'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPP, BENEFICIO B'
      'WHERE  (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (BF.IDBENEFICIO    = :IDBENEFICIO)'
      'AND    (BF.IDPESSOA       <> :IDPESSOA)'
      'AND    (BF.IDBENEFICIO = B.IDBENEFICIO)'
      'AND    (BPP.IDPESSOA(+)   = BF.IDTITULAR)'
      'AND    (BPP.IDPESSJUR(+)  = BF.IDPESSJUR)'
      'AND    (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV)'
      'AND    (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO)')
    ValidateWithMask = True
    Left = 209
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 136
    Top = 328
  end
  object qryMovReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 321
    Top = 21
  end
end
