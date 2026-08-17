object dtmAPrev: TdtmAPrev
  OldCreateOrder = True
  Left = 97
  Top = 352
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
      '        CODSUBCONTA,'
      '        RECPAG,            CODTIPRECDES,      TIPCODIGO,'
      '        CODTIPDOC,         CODPORTFORMA,'
      '        PLANO13,           PLACONTAC13,       PLACONTAD13,'
      '        CODCENTROCUSTOC13, CODCENTROCUSTOD13, IDEMPRESA13,'
      '        UNIDNEGOC13,       IDEMPRESAPROP13,   CODCENTRORESPON13,'
      '        CODSUBCONTA13,     '
      '        RECPAG13,          CODTIPRECDES13,    TIPCODIGO13,'
      '        CODTIPDOC13,       CODPORTFORMA13,    CODTIPDESEMBCAR,'
      '        RECPAGDEVOL,       CODTIPDESEMBDEVOL, PLACONTADBANCO ,'
      '        IDPLANPREVCONTAB'
      'FROM  CONTPLANPATRO'
      'WHERE IDPLANOPREV = :IdPlanoPrev AND'
      '      IDPESSJUR   = :IdPessJur   AND'
      '      IDCONTRIBUICAO = :IdContribuicao'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
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
      '        CODSUBCONTA,'
      '        RECPAG,           CODTIPRECDES,      TIPCODIGO,'
      '        CODTIPDOC,        CODPORTFORMA ,'
      '        PLANO13,          PLACONTAC13,       PLACONTAD13,'
      '        CODCENTROCUSTOC13,CODCENTROCUSTOD13, IDEMPRESA13,'
      '        UNIDNEGOC13,      CODCENTRORESPON13, IDEMPRESAPROP13,'
      '        CODSUBCONTA13 ,'
      '        RECPAG13,         CODTIPRECDES13,    TIPCODIGO13,'
      '        CODTIPDOC13,      CODPORTFORMA13,    CODTIPDESEMBCAR,'
      '        RECPAGDEVOL,      CODTIPDESEMBDEVOL, PLACONTADBANCO,'
      '        IDPLANPREVCONTAB'
      'FROM  CONTPREV'
      'WHERE IDPLANOPREV = :IdPlanoPrev AND'
      '      IDCONTRIBUICAO = :IdContribuicao'
      ''
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
    Left = 32
    Top = 136
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
    ExibeMensagens = False
    Left = 126
    Top = 29
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
      '       CP.IDRUBDECTERC,      CP.IDRUBDECTERCATRA,'
      '       CP.IDRUBDECTERCDEVOL, CP.IDRUBRICA,'
      '       CP.IDRUBRICAATRASO,   CP.IDRUBRICADEVOLUC,'
      '       CP.IDRUBADIANT,       CP.IDRUBDEVOLADIANT,'
      
        '       CP.IDRUBADIANT13,     CP.IDRUBDEVADIANT13, CP.IDRUBADIANT' +
        '13'
      'FROM   CONTRIBUICAO C, CONTPREV CP'
      'WHERE  (CP.IDPLANOPREV      = :IDPLANOPREV)'
      'AND    (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)'
      'ORDER BY CP.IDCONTRIBUICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 136
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
    Left = 224
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
    Top = 184
  end
end
