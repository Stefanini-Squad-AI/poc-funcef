object dtmAPrev: TdtmAPrev
  OldCreateOrder = True
  Left = 65511
  Top = 26
  Height = 538
  Width = 812
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 12
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 61
  end
  object qryContPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPLANOPREV,       IDCONTRIBUICAO,    IDPESSJUR,'
      '        PLANO,             PLACONTAC,         PLACONTAD,'
      '        CODCENTROCUSTOC,   CODCENTROCUSTOD,   IDEMPRESA,'
      '        UNIDNEGOC,         IDEMPRESAPROP,     CODCENTRORESPON,'
      '        CODSUBCONTA,      '
      '        RECPAG,            CODTIPRECDES,      TIPCODIGO,'
      '        CODTIPDOC,         CODPORTFORMA,'
      '        PLANO13,           PLACONTAC13,       PLACONTAD13,'
      '        CODCENTROCUSTOC13, CODCENTROCUSTOD13, IDEMPRESA13,'
      '        UNIDNEGOC13,       IDEMPRESAPROP13,   CODCENTRORESPON13,'
      '        CODSUBCONTA13,     '
      '        RECPAG13,          CODTIPRECDES13,    TIPCODIGO13,'
      '        CODTIPDOC13,       CODPORTFORMA13,    CODTIPDESEMBCAR,'
      '        RECPAGDEVOL,       CODTIPDESEMBDEVOL, CODCCUSTODEVOL,'
      '        PLACONTADEVOL,     IDPLANPREVCONTAB ,'
      '        CODTIPDESEMB13,    TIPCODIGO13 ,'
      '        PLACONTADBANCO13  ,PLACONTADBANCO'
      'FROM  CONTPLANPATRO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 61
  end
  object qryContPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPLANOPREV,      IDCONTRIBUICAO,'
      '        PLANO,            PLACONTAC,         PLACONTAD,'
      '        CODCENTROCUSTOC,  CODCENTROCUSTOD,   IDEMPRESA,'
      '        UNIDNEGOC,        CODCENTRORESPON,   IDEMPRESAPROP,'
      '        CODSUBCONTA,      '
      '        RECPAG,           CODTIPRECDES,      TIPCODIGO,'
      '        CODTIPDOC,        CODPORTFORMA ,'
      '        PLANO13,          PLACONTAC13,       PLACONTAD13,'
      '        CODCENTROCUSTOC13,CODCENTROCUSTOD13, IDEMPRESA13,'
      '        UNIDNEGOC13,      CODCENTRORESPON13, IDEMPRESAPROP13,'
      '        CODSUBCONTA13 ,   '
      '        RECPAG13,         CODTIPRECDES13,    TIPCODIGO13,'
      '        CODTIPDOC13,      CODPORTFORMA13,    CODTIPDESEMBCAR,'
      '        RECPAGDEVOL,      CODTIPDESEMBDEVOL, CODCCUSTODEVOL,'
      '        PLACONTADEVOL,    IDPLANPREVCONTAB,'
      '        CODTIPDESEMB13,    TIPCODIGO13,'
      '        PLACONTADBANCO13  ,PLACONTADBANCO'
      'FROM  CONTPREV')
    ValidateWithMask = True
    Left = 108
    Top = 61
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 112
  end
  object qryVerificaObrig: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 193
    Top = 13
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 108
    Top = 112
  end
  object regraAPrev: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 110
    Top = 13
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 194
    Top = 110
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
      '       CP.FLGCOBRADECTERC,   CP.FLGACERTACONTRIB13'
      'FROM   CONTRIBUICAO C, CONTPREV CP'
      'WHERE  (CP.IDPLANOPREV      = :IDPLANOPREV)'
      'AND    (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)'
      'ORDER BY CP.IDCONTRIBUICAO'
      '')
    ValidateWithMask = True
    Left = 108
    Top = 160
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
    Left = 192
    Top = 160
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
    Top = 160
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 289
    Top = 114
  end
  object qryPlanReduz: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 34
    Top = 207
  end
  object qryReduzContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 109
    Top = 207
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
    Left = 193
    Top = 207
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
    Left = 289
    Top = 160
  end
  object qryMovReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 289
    Top = 13
  end
  object qryInsTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO TMPDESC (CODALTERADOR, CODCENTROCUSTOC, CODCENTROCUS' +
        'TOD,'
      '            CODCENTRORESPON, CODDOCUMENTOEFET, CODDOCUMENTOPREV,'
      '            CODPORTFORMA, CODPROVDESC, CODSUBCONTA,'
      
        '            CODTIPDOC, CODTIPRECDES, COMPLDOCUMENTO, DATACOBRANC' +
        'A,'
      
        '            DATARECEBIMENTO, DATAREFERENCIA, DESCRICAO, EXERCICI' +
        'O,'
      
        '            FLGALTERADOR, FLGATRASODEVOL, FLGDESCFOLHA, FLGDESCO' +
        'NTO,'
      '            FLGEXISTEHST, FLGINTEVENTO,'
      '            FLGTIPODESC,  IDDESCONTO, IDEMPCOBRANCA,'
      
        '            IDEMPRESA, IDEMPRESAPROP,  IDFAVORECIDO,  IDFUNDACAO' +
        ','
      '            IDLOTE, IDMODULO, IDMOTIVO, IDPESSJUR, IDPESSOA,'
      '            IDPLANOPREV, IDPLANPREVCONTAB, IDPROVENTO,'
      '            IDTITULAR, INSCRICAONUMERO,  MATRICULA,'
      '            MESCOBRANCA,  MESREFERENCIA, NODOCUMENTO,'
      '            PERIODO,'
      '            PLACONTAC, PLACONTAD, PLANO,'
      '            RECPAG, REFERENCIA, SEQPROPOSTA, SISTORIGEM,'
      
        '            SITENVIO, TIPCODIGO, UNIDNEGOC, VALOR,VALORBASE1, VA' +
        'LORBASE2,'
      '            VALORBASE3, VALORINFO, VALORRECEBIDO )'
      'VALUES     (:CODALTERADOR, :CODCENTROCUSTOC, :CODCENTROCUSTOD,'
      
        '            :CODCENTRORESPON, :CODDOCUMENTOEFET, :CODDOCUMENTOPR' +
        'EV,'
      '            :CODPORTFORMA, :CODPROVDESC, :CODSUBCONTA,'
      
        '            :CODTIPDOC, :CODTIPRECDES, :COMPLDOCUMENTO, :DATACOB' +
        'RANCA,'
      
        '            :DATARECEBIMENTO, :DATAREFERENCIA, :DESCRICAO, :EXER' +
        'CICIO,'
      
        '            :FLGALTERADOR, :FLGATRASODEVOL, :FLGDESCFOLHA, :FLGD' +
        'ESCONTO,'
      '            :FLGEXISTEHST, :FLGINTEVENTO,'
      '            :FLGTIPODESC, :IDDESCONTO, :IDEMPCOBRANCA,'
      
        '            :IDEMPRESA, :IDEMPRESAPROP, :IDFAVORECIDO, :IDFUNDAC' +
        'AO,'
      
        '            :IDLOTE, :IDMODULO, :IDMOTIVO, :IDPESSJUR, :IDPESSOA' +
        ','
      '            :IDPLANOPREV, :IDPLANPREVCONTAB, :IDPROVENTO,'
      '            :IDTITULAR, :INSCRICAONUMERO, :MATRICULA,'
      '            :MESCOBRANCA, :MESREFERENCIA, :NODOCUMENTO,'
      '            :PERIODO,'
      '            :PLACONTAC, :PLACONTAD, :PLANO,'
      '            :RECPAG, :REFERENCIA, :SEQPROPOSTA, :SISTORIGEM,'
      
        '            :SITENVIO, :TIPCODIGO, :UNIDNEGOC, :VALOR, :VALORBAS' +
        'E1, :VALORBASE2,'
      '            :VALORBASE3, :VALORINFO, :VALORRECEBIDO )'
      ' ')
    ValidateWithMask = True
    Left = 289
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODALTERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTOEFET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODPROVDESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODTIPDOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMPLDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATARECEBIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGALTERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGATRASODEVOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGEXISTEHST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGINTEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGTIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMPCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
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
        Name = 'IDPLANPREVCONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INSCRICAONUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NODOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLACONTAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLACONTAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SISTORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORBASE1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORBASE2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORBASE3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORINFO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORRECEBIDO'
        ParamType = ptInput
      end>
  end
  object qryDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, D.IDTITULAR, DP.DESCR' +
        'ICAO AS TIPODEPENDENCIA,'
      '       D.NUMSEQUENCIA, D.FLGCONTAIMPOSTOR, D.FLGCONTASALARIOF,'
      '       DECODE(BF.IDPESSOA, NULL, 0, 1 ) AS FLGBENEFICIARIO,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      ''
      
        '       D.FLGDESIGNADO, D.FLGDEPLEGAL, D.IDDEPENDENCIA, D.MATRICU' +
        'LA,'
      '       NVL(D.INICIOIMPOSTOR,NULL) INICIOIMPOSTOR,'
      '       D.FIMIMPOSTOR,'
      '       NVL(D.INICIOSALARIOF,NULL) INICIOSALARIOF,'
      '       D.FIMSALARIOF, PF.DATANASC,'
      '       PF.DATAMORTE, PF.NOMEPAI,'
      '       PF.NOMEMAE, PF.SEXO, PF.FLGMOLESTIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE , PF.FLGISENTOIRRF,'
      '       PF.INICIOINVALIDEZ, PF.FIMINVALIDEZ,'
      '       NVL(BT.CODTIPORECEBEDOR,NULL) CODTIPORECEBEDOR,'
      
        '       NVL(PF.IDGRINSTR,0) IDGRINSTR, SIT.DESCRICAO AS SITUACAOD' +
        'EPEN,'
      '       0 AS FLGELEGIVEL , EG.MATRICULA AS MATRICULA_TITULAR'
      
        'FROM   BFCIARIOTITPLAN BT,PESSOA P, PESSOAFISICA PF, SITDEPENDEN' +
        'TE SIT, ELEGPATRO EG,DEPEN DP, DEPENDENTE DEP, DEPENTIT D,'
      '      (SELECT DISTINCT IDTITULAR,IDPESSOA FROM BENEFBFCIARIO'
      
        '       WHERE IDTITULAR     = :idtitular AND IDSITBENEFICIO IN (1' +
        ',2,4)) BF'
      ''
      'WHERE  D.IDTITULAR     = :idtitular'
      'AND    D.IDPESSOA      = :IdDependente '
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    BT.IDTITULAR    = D.IDTITULAR'
      'AND    EG.IDPESSOA     = D.IDTITULAR'
      'AND    BF.IDTITULAR(+) = D.IDTITULAR'
      'AND    BF.IDPESSOA(+)  = D.IDPESSOA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'ORDER BY D.NUMSEQUENCIA'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 372
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdDependente'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizadependente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE DEPENTIT'
      'SET FLGCONTAIMPOSTOR = :PARMIR,'
      '    FLGCONTASALARIOF = :PARMSF,'
      '    FIMIMPOSTOR = :DATAFIMIR,'
      '    FIMSALARIOF = :DATAFIMSF'
      'WHERE'
      '     IDTITULAR = :TITULAR AND'
      '     IDPESSOA  = :PESSOA '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 372
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PARMIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PARMSF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIMIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIMSF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizaTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PESSOAFISICA'
      'SET NUMDEPIRRF = :NDEPIR,'
      '    NUMDEPSALF = :NDEPSF,'
      '    NUMDEPTOT  = :NDEPTT'
      'WHERE'
      '     IDPESSOA = :TITULAR '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 372
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NDEPIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NDEPSF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NDEPTT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LC.PLACONTA, LC.CODSUBCONTA, LC.LACDEBCRE, LC.LACVALOR, L' +
        'C.LACVALHIST, LC.LACHIST1, LC.LACHIST2, '
      
        '                        LC.LACHIST3, LC.PLNCODIGO, LC.LACNUMLAN,' +
        ' LC.HITCODHIST, LC.IDPESSOA, LC.IDEMPRESA, LC.IDMODULO, '
      
        '                        LC.UNIDNEGOC, LC.IDUSUARIOINCLUSAO, LC.P' +
        'LANO, LC.LACTIPO, LC.LACNUMDOC, LC.LACHIST4, LC.LACHIST5, '
      
        '                        LC.LACTIPCONVOFICIAL, LC.LACVALOFICIAL, ' +
        'LC.LACTIPCONVGER, LC.LACVALGERENCIAL, '
      
        '                        LC.LACTIPCONVGEREN1, LC.LACVALGEREN1, LC' +
        '.LACTIPCONVGEREN2, LC.LACVALGEREN2, LC.LACATOUTMOEDA, '
      
        '                        LC.LACORIGEMAPLIC, LC.TIPCODIGO, LC.IDEL' +
        'EMDEMONSTRAT, LC.CODCENTROCUSTO, '
      
        '                        U.NOME,CC.NOME,CC.CODCENTROCUSTO, PL.PLN' +
        'DATDIA, -1 AS IDPESSJUR, -1 AS IDPLANOPREV '
      
        '                        FROM LANCAMENTO LC, UNIDNEGOCIO U, CENTC' +
        'UST CC, PLANILHA PL WHERE'
      '                        (LC.PLNCODIGO =  :plncodigo) AND'
      '                        (LC.PLNCODIGO = PL.PLNCODIGO) AND'
      
        '                        (CC.IDEMPRESA(+)      = LC.IDEMPRESA) AN' +
        'D'
      
        '                        (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUST' +
        'O) AND'
      
        '                        (LC.IDPESSOA          = U.IDPESSOA(+)) A' +
        'ND'
      '                        (LC.UNIDNEGOC         = U.UNIDNEGOC(+))')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 289
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'plncodigo'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 20
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryContabilIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 455
    Top = 16
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select d.coddocumento,d.plano,d.placonta,l.plncodigo ,l.numLanct' +
        'o,'
      '        r.unidnegoc,r.codcentrorespon,r.codtiprecdes,r.valor,'
      
        '        -1 as idpessjur, -1 as idplanoprev, -1.00 AS FLGDEVOLUCA' +
        'O'
      'from documento d , lanctodocum l, rateiodocum r'
      'where d.coddocumento = :coddocumento and'
      'd.coddocumento = l.coddocumento and'
      'd.coddocumento = r.coddocumento'
      'order by d.plano,d.placonta'
      ' ')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 372
    Top = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'coddocumento'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryDocumentosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDocumentosFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      '   CODTIPRECDES, VALOR)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 372
    Top = 208
  end
  object qryContribNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 279
  end
  object qryBenefNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 35
    Top = 345
  end
end
