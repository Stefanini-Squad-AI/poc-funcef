object dtmIntegraCAPCAR: TdtmIntegraCAPCAR
  OldCreateOrder = True
  Left = 65494
  Top = 65527
  Height = 577
  Width = 812
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   P.IDPESSOA,P.NOME'
      'FROM     PESSOA P, PATRO PT'
      'WHERE    PT.IDPESSOA = P.IDPESSOA'
      'AND      PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 14
    Top = 51
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 14
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatro
    SQL.Strings = (
      
        'SELECT PL.IDPLANOPREV,PP.IDPESSJUR,PL.NOME, PAT.NOME AS PATROCIN' +
        'ADORA,'
      '       PP.PLANO,PP.PLACONTALIQFLHBEN'
      'FROM   PESSOA PAT, PLANPREVPATRO PP, PLANPREV PL'
      'WHERE  PP.IDPESSJUR = :IDPESSOA'
      'AND    PL.IDPLANOPREV = PP.IDPLANOPREV'
      'AND    PAT.IDPESSOA = PP.IDPESSJUR'
      ' ')
    ValidateWithMask = True
    Left = 98
    Top = 50
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 98
  end
  object qryContribPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO,C.NOME,P.NOME AS PLANO,'
      
        '       CP.IDPLANOPREV,CP.IDCONTRIBUICAO,CP.CODPORTFORMA,CP.TIPCO' +
        'DIGO,'
      
        '       CP.CODSUBCONTA,CP.IDEMPRESAPROP,CP.CODCENTRORESPON,CP.UNI' +
        'DNEGOC,CP.CODCENTROCUSTOD,'
      
        '       CP.IDEMPRESA,CP.CODCENTROCUSTOC,CP.PLACONTAD,CP.PLANO,CP.' +
        'PLACONTAC,CP.CODTIPDOC,'
      
        '       CP.CODTIPRECDES,CP.RECPAG,CP.CODTIPDESEMBDEVOL,CP.RECPAGD' +
        'EVOL,'
      '       CP.CODTIPDESEMBDEVOL,CP.RECPAGDEVOL,CP.FLGINTERNO,'
      '       CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,CP.FLGPAGADOR,'
      '       CP.PLACONTADEVOL,CP.CODCCUSTODEVOL,'
      '       CP.PLACONTADEVOLPAT,CP.CODCCUSTODEVOLPAT,'
      '       CP.PLACONTADPROVIS, CP.PLACONTACPROVIS,'
      '       CP.CODCCUSTODPROVIS, CP.CODCCUSTOCPROVIS,'
      
        '       CP.IDPLANPREVCONTAB , CP.PLACONTADBANCO, CP.PLACONTADBANC' +
        'O13,'
      '       CP.FLGDESCFOLHA, CP.PLACONTAOUTROMES,'
      '       CP.CODTIPDESEMBPROV, CP.PLANOADT, CP.PLACONTADPROVADT,'
      '       CP.PLACONTACPROVADT, CP.CODTIPRECDESADT, CP.RECPAGADT,'
      '       CP.PLACTAACJUD'
      'FROM   CONTPREV CP, CONTRIBUICAO C, PLANPREV P'
      'WHERE  CP.IDPLANOPREV = :IDPLANOPREV'
      'AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND    P.IDPLANOPREV = CP.IDPLANOPREV'
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
    Left = 470
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO, PAT.NOME AS PATROC' +
        'INADORA,'
      '       PAT.IDPESSOA AS IDPESSJUR, P.IDPLANOPREV,'
      
        '       BF.IDPLANOPREV,BF.IDBENEFICIO,BF.IDPESSJUR,BF.PLANO,BF.CO' +
        'DALTERADORCORR,BF.TIPCODIGO,'
      
        '       BF.PLACONTAC,BF.PLACONTAD,BF.IDEMPRESA,BF.CODCENTROCUSTOC' +
        ',BF.CODCENTROCUSTOD,'
      
        '       BF.IDEMPRESAPROP,BF.CODSUBCONTA,BF.CODCENTRORESPON,BF.UNI' +
        'DNEGOC,BF.CODPORTFORMA,'
      '       BF.CODTIPRECDES,BF.RECPAG,BF.CODTIPDOC,'
      '       BF.CODTIPRECEBDEVOL,BF.RECPAGDEVOL,BF.CODTIPRECEBCAP,'
      '       BF.CODRECEBCAPABN,BF.PLACONTADEVOL,BF.CODCCUSTODEVOL,'
      '       BF.PLACONTADEVOLPAT,BF.CODCCUSTODEVOLPAT ,'
      '       BF.PLACONTADPROVIS, BF.PLACONTACPROVIS,'
      '       BF.CODCCUSTODPROVIS, BF.CODCCUSTOCPROVIS,'
      '       BF.IDPLANPREVCONTAB,'
      '       BF.CODTIPDESEMBPROV, BF.PLANOADT, BF.PLACONTADPROVADT,'
      '       BF.PLACONTACPROVADT, BF.CODTIPRECDESADT, BF.RECPAGADT,'
      '       BF.PLACTAACJUD'
      'FROM   BENEFPLANPATRO BF, PLANPREV P, BENEFICIO B, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    B.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 178
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryPlanoPuro: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatro
    SQL.Strings = (
      'SELECT   PL.IDPLANOPREV,PL.RECPAGIRRF,PL.IDFAVORECIDOIRRF,'
      '         PL.RECPAG,PL.IDEMPRESAPROPIRRF,'
      '         PL.IDEMPRESAPROP,PL.CODTIPRECDESIRRF,'
      '         PL.CODTIPRECDES,PL.TIPCODIGOIRRF,'
      '         PL.CODPORTFORMAIRRF,PL.IDFUNDACAO,'
      '         PL.UNIDNEGOCIOIRRF,PL.CODCENTRESPIRRF,'
      '         PL.CODSUBCONTAIRRF,PL.CODTIPDOCIRRF,'
      '         PL.CODTIPDOC,PL.CODCENTCUSTDIRRF,'
      '         PL.IDEMPRESAIRRF,PL.CODCENTCUSTCIRRF,'
      '         PL.NOME,PL.PLACONTADIRRF,PL.PLANOIRRF,'
      '         PL.PLACONTACIRRF , PL.CODDESEMBIRRF'
      'FROM     PLANPREV PL'
      
        'WHERE    PL.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREV' +
        'PATRO PLP, PATRO P'
      '                            WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      
        '                            AND     PLP.IDPESSJUR = P.IDPESSOA )' +
        ' OR'
      
        '         NOT EXISTS (SELECT 1 FROM PLANPREVPATRO PLP WHERE PLP.I' +
        'DPLANOPREV = PL.IDPLANOPREV)'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 20
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPlanoPuro: TwwDataSource
    DataSet = qryPlanoPuro
    Left = 17
    Top = 126
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   C.IDCONTRIBUICAO,C.NOME,P.NOME AS PLANO,PAT.NOME AS PAT' +
        'ROCINADORA,'
      '         PAT.IDPESSOA AS IDPESSJUR,P.IDPLANOPREV,'
      
        '         CP.IDPLANOPREV,CP.IDCONTRIBUICAO,CP.IDPESSJUR,CP.IDEMPR' +
        'ESAPROP,'
      
        '         CP.TIPCODIGO,CP.PLANO,CP.PLACONTAC,CP.PLACONTAD,CP.IDEM' +
        'PRESA,CP.CODCENTROCUSTOC,'
      
        '         CP.CODCENTROCUSTOD,CP.UNIDNEGOC,CP.CODCENTRORESPON,CP.C' +
        'ODSUBCONTA,'
      
        '         CP.CODPORTFORMA,CP.CODTIPRECDES,CP.RECPAG,CP.CODTIPDOC,' +
        'CP.CODTIPDESEMBDEVOL,CP.RECPAGDEVOL,'
      '         CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,CV.FLGPAGADOR,'
      
        '         CV.FLGINTERNO,       CP.PLACONTADEVOL,CP.CODCCUSTODEVOL' +
        ','
      '         CP.PLACONTADEVOLPAT,CP.CODCCUSTODEVOLPAT,'
      '         CP.PLACONTADPROVIS, CP.PLACONTACPROVIS,'
      
        '         CP.CODCCUSTODPROVIS, CP.CODCCUSTOCPROVIS, CP.PLACONTAOU' +
        'TROMES,'
      
        '         CP.IDPLANPREVCONTAB, CP.PLACONTADBANCO, CP.PLACONTADBAN' +
        'CO13, CV.FLGDESCFOLHA,'
      '         CP.CODTIPDESEMBPROV, CP.PLANOADT, CP.PLACONTADPROVADT,'
      '         CP.PLACONTACPROVADT, CP.CODTIPRECDESADT, CP.RECPAGADT,'
      '         CP.PLACTAACJUD'
      
        'FROM     CONTPLANPATRO CP, CONTPREV CV, PLANPREV P,  PESSOA  PAT' +
        ', CONTRIBUICAO C'
      'WHERE    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      CV.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      CV.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'ORDER BY C.NOME'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 450
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryBenefPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO,'
      
        '       BF.IDPLANOPREV,BF.IDBENEFICIO,BF.CODPORTFORMA,BF.TIPCODIG' +
        'O,BF.CODALTERADORCORR,'
      
        '       BF.CODSUBCONTA,BF.IDEMPRESAPROP,BF.CODCENTRORESPON,BF.UNI' +
        'DNEGOC,BF.CODCENTROCUSTOD,'
      
        '       BF.IDEMPRESA,BF.CODCENTROCUSTOC,BF.PLACONTAD,BF.PLANO,BF.' +
        'PLACONTAC,BF.CODTIPDOC,'
      
        '       BF.CODTIPRECDES,BF.RECPAG,  BF.CODTIPRECEBDEVOL, BF.RECPA' +
        'GDEVOL,'
      '       BF.CODTIPRECEBCAP, BF.CODRECEBCAPABN,'
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL,'
      '       BF.PLACONTADEVOLPAT,BF.CODCCUSTODEVOLPAT,'
      '       BF.PLACONTADPROVIS, BF.PLACONTACPROVIS,'
      '       BF.CODCCUSTODPROVIS, BF.CODCCUSTOCPROVIS,'
      '       BF.IDPLANPREVCONTAB,'
      '       BF.CODTIPDESEMBPROV, BF.PLANOADT, BF.PLACONTADPROVADT,'
      '       BF.PLACONTACPROVADT, BF.CODTIPRECDESADT, BF.RECPAGADT,'
      '       BF.PLACTAACJUD'
      'FROM   BENEFPLANPREV BF, PLANPREV P, BENEFICIO B'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    B.IDBENEFICIO = BF.IDBENEFICIO '
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 189
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryReservaPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.* , P.NOME AS PLANO'
      'FROM RESERVAXPLANO R, PLANPREV P'
      'WHERE R.IDPLANOPREV = :IDPLANOPREV AND'
      '              P.IDPLANOPREV = R.IDPLANOPREV AND'
      '              R.ANALITICOSINTETI = '#39'A'#39' AND'
      '              R.FLGCONTROLE = 0'
      '')
    ValidateWithMask = True
    Left = 99
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAtividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC,IDPESSOA,NOME,IDUSUARIO,UNETIPO,UNECODIGO'
      'FROM   UNIDNEGOCIO'
      'WHERE  (IDPESSOA = :IDEMPRESA)'
      'AND ( UNETIPO = '#39'A'#39' )'
      'AND ( ATIVO = '#39'S'#39')')
    ValidateWithMask = True
    Left = 14
    Top = 287
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsAtividade: TwwDataSource
    DataSet = qryAtividade
    Left = 14
    Top = 237
  end
  object qryformapag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODPORTFORMA,PLANO,IDTEMPLCHEQUE,IDPESSOA,IDEMPRESA,PLACO' +
        'NTA,CODCENTROCUSTO,'
      
        '       CODBLOQCHE,CODPORTADOR,CODFORMA,RECPAG,LANCAFINANC,DMAIS,' +
        'IDUSUARIOINCLUSAO,'
      
        '       DESCRICAO,NUMEMPRESABANCO,NOSSONUMERO,JUROSPORDIA,PRAZOPR' +
        'OTESTO,CONTROLEREMESSA,'
      
        '       DATACONTRREMESSA,CODARQUIVOREMESSA,PATHARQUIVOREM,PATHARQ' +
        'UIVORET,CODTIPOPAGTO,'
      '       CODFORMAPAGTO,FLGEMITEAVISO'
      'FROM   PORTADORFORMA'
      ' ')
    ValidateWithMask = True
    Left = 189
    Top = 287
  end
  object dsformapag: TwwDataSource
    DataSet = qryformapag
    Left = 189
    Top = 237
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO, NOME, CODEXTERNO'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  STATUSGRUPOCDC = '#39'A'#39' AND'
      '  ATIVO = '#39'S'#39' AND'
      
        '  ( (:IDPLANCENTCUST IS NULL) OR (:IDPLANCENTCUST IS NOT NULL) A' +
        'ND (IDPLANCENTCUST = :IDPLANCENTCUST) )'
      'ORDER BY'
      '  CODCENTROCUSTO'
      '')
    ValidateWithMask = True
    Left = 189
    Top = 398
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end>
  end
  object dsTipoDocCAR: TwwDataSource
    DataSet = qryTipoDocCAR
    Left = 116
    Top = 357
  end
  object qryTipoDocCAR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC,DESCRICAO'
      'FROM   TIPODOCRECPAG'
      'WHERE  RECPAG = '#39'R'#39)
    ValidateWithMask = True
    Left = 117
    Top = 411
  end
  object qryContribPart: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'SELECT   C.IDCONTRIBUICAO,C.NOME, P.NOME AS PLANO,'
      '         PAT.NOME AS PATROCINADORA,'
      
        '         CP.SEQPROPOSTA,CP.IDPESSJUR,CP.IDPLANOPREV,CP.IDCONTRIB' +
        'UICAO,CP.IDPESSOA,'
      
        '         CP.CODTIPRECDES,CP.RECPAG,CP.IDEMPRESAPROP,CP.CODTIPDOC' +
        ',CP.TIPCODIGO,'
      
        '         CP.PLACONTAD,CP.PLANO,CP.PLACONTAC,CP.CODCENTRORESPON,C' +
        'P.CODSUBCONTA,CP.CODCENTROCUSTOD,'
      
        '         CP.CODCENTROCUSTOC,CP.UNIDNEGOC,CP.CODPORTFORMA,CP.IDEM' +
        'PRESA,'
      '         CP.CODTIPDESEMBDEVOL,CP.RECPAGDEVOL,'
      '         CP.CODTIPDESEMBCAR,'
      '         CP.PLACONTADEVOL,CP.CODCCUSTODEVOL,'
      '         CP.PLACONTADEVOLPAT,CP.CODCCUSTODEVOLPAT,'
      
        '         CP.PLACONTADPROVIS, CP.PLACONTACPROVIS, CP.PLACONTAOUTR' +
        'OMES,  '
      
        '         CP.CODCCUSTODPROVIS, CP.CODCCUSTOCPROVIS, CP.IDPLANPREV' +
        'CONTAB ,'
      '         CP.PLACONTADBANCO, CP.PLACONTADBANCO13, CV.FLGDESCFOLHA'
      
        'FROM     CONTRIBPREVPARTP CP, CONTPREV CV, CONTRIBUICAO C, PLANP' +
        'REV P, PESSOA PAT'
      'WHERE    CP.IDPLANOPREV    = :IDPLANOPREV'
      'AND      CP.IDPESSJUR      = :IDPESSJUR'
      'AND      CP.IDPESSOA       = :IDPESSOA'
      'AND      CV.IDPLANOPREV    = CP.IDPLANOPREV'
      'AND      CV.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV     = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA      = CP.IDPESSJUR'
      'ORDER BY C.NOME'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryReservaPart: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'SELECT R.IDTIPORESERVA,R.NOME, P.NOME AS PLANO,'
      
        '       RP.IDPLANOPREV,RP.IDTIPORESERVA,RP.IDPESSOA,RP.IDPESSJUR,' +
        'RP.SEQPROPOSTA '
      '   RESERVAXPLANO R, PLANPREV P, RESERVAPART RP'
      'WHERE  R.IDPLANOPREV = :IDPLANOPREV'
      'AND    RP.IDPESSJUR = :IDPESSJUR'
      'AND    RP.IDPESSOA = :IDPESSOA'
      'AND    P.IDPLANOPREV = R.IDPLANOPREV'
      'AND    RP.IDTIPORESERVA = R.IDTIPORESERVA'
      'AND    RP.IDPLANOPREV = R.IDPLANOPREV'
      '')
    ValidateWithMask = True
    Left = 94
    Top = 126
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME,E.MATRICULA,PAT.NOME AS PATROCINADORA,PL.NOME AS P' +
        'LANO,'
      '       PP.IDPESSOA,PP.IDPLANOPREV,PP.IDPESSJUR'
      
        'FROM   PESSOA P, PESSOA PAT, ELEGPATRO E, PARTPREVPLAN PP, PLANP' +
        'REV PL'
      'WHERE  P.IDPESSOA = :IDPESSOA'
      'AND    E.IDPESSJUR = :IDPESSJUR'
      'AND    PL.IDPLANOPREV  = :IDPLANOPREV'
      'AND    P.IDPESSOA = E.IDPESSOA'
      'AND    E.IDPESSJUR = PAT.IDPESSOA'
      'AND    PP.IDPESSOA = E.IDPESSOA'
      'AND    PP.IDPESSJUR = E.IDPESSJUR'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      ''
      '')
    ValidateWithMask = True
    Left = 348
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsParticipante: TwwDataSource
    DataSet = qryParticipante
    Left = 348
  end
  object qrycentrespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  CODCENTRORESPON, IDPESSOA, NOME, ANALITICOSINTET, IDUSUARIOINC' +
        'LUSAO,'
      '  RESPONSAVEL, ATIVO, CODEXTERNO, IDPLANCRESPON'
      'FROM   '
      '  CENTRESPON'
      'WHERE  '
      '  ATIVO = '#39'S'#39' AND'
      '  IDPESSOA = :IDEMPRESA AND'
      
        '  ( (:IDPLANCRESPON IS NULL) OR (:IDPLANCRESPON IS NOT NULL) AND' +
        ' (IDPLANCRESPON = :IDPLANCRESPON) )')
    ValidateWithMask = True
    Left = 237
    Top = 401
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCRESPON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCRESPON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCRESPON'
        ParamType = ptInput
      end>
  end
  object qrytipooper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPCODIGO,TIPDESCRICAO'
      'FROM   TIPOPER')
    ValidateWithMask = True
    Left = 348
    Top = 288
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA'
      'FROM   SUBCONTA'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 306
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   CODALTERADOR,DESCRICAO'
      'FROM     TIPOALTERADOR'
      'WHERE    RECPAG = '#39'R'#39
      'AND      IDPESSOA =:IDFUNDACAO'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 306
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsTipoDocCAP: TwwDataSource
    DataSet = qryTipoDocCAP
    Left = 21
    Top = 357
  end
  object qryTipoDocCAP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC,DESCRICAO'
      'FROM   TIPODOCRECPAG'
      'WHERE  RECPAG = '#39'P'#39)
    ValidateWithMask = True
    Left = 21
    Top = 414
  end
  object qryAltPagar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   CODALTERADOR,DESCRICAO'
      'FROM     TIPOALTERADOR'
      'WHERE    RECPAG = '#39'P'#39
      'AND      IDPESSOA = :IDFUNDACAO'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 396
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  P.NOME,F.IDPESSOA,F.CODSUBCONTAIRRF,F.IDFAVORECIDOIRRF,F.IDRUB' +
        'LIQEMPRESTI,'
      
        '  F.CODTIPRECDESIRRF,F.IDEMPRESAPROPIRRF,F.RECPAGIRRF,F.CODCENTC' +
        'USTDIRRF,'
      
        '  F.IDEMPRESAIRRF,F.TIPCODIGOIRRF,F.CODTIPDOCIRRF,F.CODCENTCUSTC' +
        'IRRF,'
      
        '  F.CODPORTFORMAIRRF,F.PLACONTADIRRF,F.PLANOIRRF,F.UNIDNEGOCIRRF' +
        ',F.PLACONTACIRRF,'
      '  F.CODCENTRESPIRRF,F.FLGTIPOPREVIDENC, F.IDRUBLIQASSISTEN,'
      
        '  F.IDRUBLIQPREVIDEN,F.DIAFOLHA,F.FLGUTILFOLHA,F.FLGANTERIORFOLH' +
        'A,'
      '  F.FLGMESFOLHA,F.IDRUBBENEFLIQUIDO,'
      '  P1.NOME AS FAVORECIDO,'
      '  F.CODDESEMBIRRF,F.RECPAG,F.IDEMPRESAPROP'
      'FROM'
      '  PESSOA P,'
      '  FUNDACAO F,'
      '  (SELECT PESSOA.IDPESSOA, PESSOA.NOME'
      '   FROM PESSOA , FUNDACAO'
      '   WHERE PESSOA.IDPESSOA = FUNDACAO.IDFAVORECIDOIRRF) P1'
      'WHERE'
      '  F.IDPESSOA         = P.IDPESSOA AND'
      '  F.IDFAVORECIDOIRRF = P1.IDPESSOA(+) AND'
      '  F.IDPESSOA         = :IDFUNDACAO'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 98
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 98
    Top = 232
  end
  object qryBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO, '
      '       PAT.NOME AS PATROCINADORA,'
      
        '       BF.NUMEROPROCESSO,BF.IDPESSJUR,BF.IDPLANOPREV,BF.IDTITULA' +
        'R,BF.IDPESSOA,BF.SEQPROPOSTA,'
      
        '       BF.IDBENEFICIO,BF.TIPCODIGO,BF.CODCENTRORESPON,BF.IDEMPRE' +
        'SAPROP,BF.CODSUBCONTA,BF.PLANO,'
      
        '       BF.PLACONTAD,BF.PLACONTAC,BF.CODCENTROCUSTOD,BF.CODCENTRO' +
        'CUSTOC,BF.UNIDNEGOC,'
      '       BF.CODPORTFORMA'
      'FROM   BENEFICIO B, BENEFBFCIARIO BF, PLANPREV P, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDPESSOA = :IDPESSOA'
      'AND    BF.IDTITULAR = :IDPESSOA'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR')
    ValidateWithMask = True
    Left = 270
    Top = 190
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBenefPart: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      
        'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO,PAT.NOME AS PATROCI' +
        'NADORA,'
      
        '       BF.IDPESSJUR,BF.IDPLANOPREV,BF.IDPESSOA,BF.IDBENEFICIO,BF' +
        '.CODCENTRORESPON,'
      
        '       BF.IDEMPRESAPROP,BF.CODSUBCONTA,BF.UNIDNEGOC,BF.CODCENTRO' +
        'CUSTOD,BF.IDEMPRESA,'
      
        '       BF.CODCENTROCUSTOC,BF.PLACONTAD,BF.PLANO,BF.PLACONTAC,BF.' +
        'SEQPROPOSTA,BF.CODTIPRECDES,'
      
        '       BF.RECPAG,BF.CODTIPDOC,BF.CODALTERADORCORR,BF.TIPCODIGO,B' +
        'F.CODPORTFORMA,BF.CODTIPRECEBDEVOL,'
      '       BF.RECPAGDEVOL,BF.CODTIPRECEBCAP, BF.CODRECEBCAPABN,'
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL,'
      '       BF.PLACONTADEVOLPAT,BF.CODCCUSTODEVOLPAT,'
      '       BF.PLACONTADPROVIS, BF.PLACONTACPROVIS,'
      '       BF.CODCCUSTODPROVIS, BF.CODCCUSTOCPROVIS,'
      '       BF.IDPLANPREVCONTAB'
      'FROM   BENEFPLANOPART BF, PLANPREV P, BENEFICIO B, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDPESSOA = :IDPESSOA'
      'AND    B.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      '')
    ValidateWithMask = True
    Left = 272
    Top = 98
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBenefAbono: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO, PAT.NOME AS PATROC' +
        'INADORA,'
      '       PAT.IDPESSOA AS IDPESSJUR, P.IDPLANOPREV,'
      
        '       BF.IDPLANOPREV,BF.IDBENEFICIO,BF.IDPESSJUR,BF.RECPAGABN,B' +
        'F.IDEMPRESAPROPABN,'
      
        '       BF.CODCENTROCUSTOCA,BF.CODCENTROCUSTODA,BF.PLACONTACABN,B' +
        'F.PLACONTADABN,'
      
        '       BF.IDEMPRESAABN,BF.PLANOABN,BF.UNIDNEGOCABN,BF.CODCENTROR' +
        'ESPONA,BF.CODSUBCONTAABN,'
      
        '       BF.CODALTERAJUROSABN,BF.CODALTERACORRABN,BF.CODTIPRECDESA' +
        'BN,'
      '       BF.TIPCODIGOABN,BF.CODTIPDOCABN,BF.CODPORTFORMAABN,'
      '       BF.CODTIPRECEBCAP, BF.CODRECEBCAPABN,'
      '       BF.PLACONTADEVOLA,BF.CODCCUSTODEVOLA,'
      '       BF.PLACONTADEVPATA,BF.CODCCUSTODEVPATA,'
      '       BF.PLACONTADPROVIS, BF.PLACONTACPROVIS,'
      '       BF.CODCCUSTODPROVIS, BF.CODCCUSTOCPROVIS,'
      '       BF.IDPLANPREVCONTAB, BF.PLACTAACJUD13'
      
        'FROM   BENEFPLANPATRO BF, BENEFPLANPREV BP, PLANPREV P, BENEFICI' +
        'O B, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BP.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    BP.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    BP.FLGPOSSUIABONO = 1'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    B.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 171
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryBenefPlanoAbono: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO,'
      
        '       BF.IDPLANOPREV,BF.IDBENEFICIO,BF.RECPAGABN,BF.IDEMPRESAPR' +
        'OPABN,BF.PLANOABN,'
      
        '       BF.CODCENTROCUSTOCA,BF.CODCENTROCUSTODA,BF.PLACONTADABN,B' +
        'F.PLACONTACABN,'
      
        '       BF.IDEMPRESAABN,BF.UNIDNEGOCABN,BF.CODCENTRORESPONA,BF.CO' +
        'DSUBCONTAABN,'
      
        '       BF.CODALTERACORRABN,BF.CODALTERAJUROSABN,BF.CODTIPRECDESA' +
        'BN,BF.TIPCODIGOABN,'
      '       BF.CODTIPDOCABN,BF.CODPORTFORMAABN,'
      '       BF.CODTIPRECEBCAP, BF.CODRECEBCAPABN,'
      '       BF.PLACONTADEVOLA,BF.CODCCUSTODEVOLA,'
      '       BF.PLACONTADEVPATA,BF.CODCCUSTODEVPATA,'
      '       BF.PLACONTADPROVIS, BF.PLACONTACPROVIS,'
      '       BF.CODCCUSTODPROVIS, BF.CODCCUSTOCPROVIS,'
      '       BF.IDPLANPREVCONTAB,'
      '       BF.PLACTAACJUD13'
      'FROM   BENEFPLANPREV BF, PLANPREV P, BENEFICIO B'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.FLGPOSSUIABONO = 1'
      'AND    B.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBenefPartAbono: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      
        'SELECT B.IDBENEFICIO,B.NOME, P.NOME AS PLANO,PAT.NOME AS PATROCI' +
        'NADORA,'
      
        '       BF.IDPESSJUR,BF.IDPLANOPREV,BF.IDPESSOA,BF.IDBENEFICIO,BF' +
        '.SEQPROPOSTA,'
      '       BF.RECPAGABN,'
      
        '       BF.IDEMPRESAPROPABN,BF.CODCENTROCUSTOCA,BF.CODCENTROCUSTO' +
        'DA,BF.PLACONTADABN,'
      
        '       BF.PLACONTACABN,BF.PLANOABN,BF.IDEMPRESAABN,BF.UNIDNEGOCA' +
        'BN,BF.CODCENTRORESPONA,'
      
        '       BF.CODSUBCONTAABN,BF.CODALTERACORRABN,BF.CODALTERAJUROSAB' +
        'N,BF.CODTIPRECDESABN,'
      '       BF.TIPCODIGOABN,BF.CODTIPDOCABN,BF.CODPORTFORMAABN,'
      '       BF.CODTIPRECEBCAP, BF.CODRECEBCAPABN,'
      '       BF.PLACONTADEVOLA,BF.CODCCUSTODEVOLA,'
      '       BF.PLACONTADEVPATA,BF.CODCCUSTODEVPATA,'
      '       BF.PLACONTADPROVIS, BF.PLACONTACPROVIS,'
      '       BF.CODCCUSTODPROVIS, BF.CODCCUSTOCPROVIS,'
      '       BF.IDPLANPREVCONTAB'
      
        'FROM   BENEFPLANOPART BF, BENEFPLANPREV BP, BENEFICIO B, PLANPRE' +
        'V P, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDPESSOA = :IDPESSOA'
      'AND    BP.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    BP.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    BP.FLGPOSSUIABONO = 1'
      'AND    B.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      ''
      ' ')
    ValidateWithMask = True
    Left = 521
    Top = 163
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUSistema: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 390
    Top = 357
  end
  object qryDecTercPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   C.IDCONTRIBUICAO,C.NOME,P.NOME AS PLANO,PAT.NOME AS PAT' +
        'ROCINADORA,'
      '         PAT.IDPESSOA AS IDPESSJUR,P.IDPLANOPREV,'
      
        '         CP.IDPLANOPREV,CP.IDCONTRIBUICAO,CP.IDPESSJUR,CP.IDEMPR' +
        'ESAPROP13,'
      
        '         CP.TIPCODIGO13,CP.PLANO13,CP.PLACONTAC13,CP.PLACONTAD13' +
        ',CP.IDEMPRESA13,CP.CODCENTROCUSTOC13,'
      
        '         CP.CODCENTROCUSTOD13,CP.UNIDNEGOC13,CP.CODCENTRORESPON1' +
        '3,CP.CODSUBCONTA13,'
      
        '         CP.CODPORTFORMA13,CP.CODTIPRECDES13,CP.RECPAG13,CP.CODT' +
        'IPDOC13,'
      '         CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13, CP2.FLGPAGADOR,'
      '         CP.PLACONTADPROVIS, CP.PLACONTACPROVIS,'
      '         CP.PLACONTADPROVIS13, CP.PLACONTACPROVIS13,'
      
        '         CP.CODCCUSTDPROVIS13, CP.CODCCUSTCPROVIS13, CP.PLACTAOU' +
        'TROMES13,'
      
        '         CP2.FLGINTERNO, CP.IDPLANPREVCONTAB ,CP.PLACONTADBANCO,' +
        ' CP.PLACONTADBANCO13,'
      '         CP2.FLGDESCFOLHA, CP.PLACTAACJUD13,'
      '         CP.PLACTAACJUD'
      
        'FROM     CONTPLANPATRO CP, CONTPREV CP2, PLANPREV P, CONTRIBUICA' +
        'O C, PESSOA PAT'
      'WHERE    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      CP2.FLGCOBRADECTERC = 1'
      'AND      CP2.IDPLANOPREV = CP.IDPLANOPREV'
      'AND'#9' CP2.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'ORDER BY C.NOME'
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
    Left = 381
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryDecTercPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO,C.NOME,P.NOME AS PLANO,'
      
        '       CP.IDPLANOPREV,CP.IDCONTRIBUICAO,CP.CODPORTFORMA13,CP.TIP' +
        'CODIGO13,'
      '       CP.CODSUBCONTA13,CP.IDEMPRESAPROP13,'
      '       CP.CODCENTRORESPON13,CP.UNIDNEGOC13,CP.CODCENTROCUSTOD13,'
      
        '       CP.IDEMPRESA13,CP.CODCENTROCUSTOC13,CP.PLACONTAD13,CP.PLA' +
        'NO13,'
      '       CP.PLACONTAC13,CP.CODTIPDOC13,CP.FLGINTERNO,'
      '       CP.CODTIPRECDES13,CP.RECPAG13,CP.FLGPAGADOR,'
      '       CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,'
      '       CP.PLACONTADPROVIS13, CP.PLACONTACPROVIS13,'
      
        '       CP.CODCCUSTDPROVIS13, CP.CODCCUSTCPROVIS13, CP.PLACTAOUTR' +
        'OMES13, '
      
        '       CP.IDPLANPREVCONTAB, CP.PLACONTADBANCO, CP.PLACONTADBANCO' +
        '13, CP.FLGDESCFOLHA,'
      '       CP.PLACTAACJUD13'
      'FROM   CONTPREV CP, CONTRIBUICAO C, PLANPREV P'
      'WHERE  CP.FLGCOBRADECTERC = 1'
      'AND    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND    P.IDPLANOPREV = CP.IDPLANOPREV'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 387
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryDecTercPart: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'SELECT   C.IDCONTRIBUICAO,C.NOME, P.NOME AS PLANO,'
      '         PAT.NOME AS PATROCINADORA,'
      
        '         CP.SEQPROPOSTA,CP.IDPESSJUR,CP.IDPLANOPREV,CP.IDCONTRIB' +
        'UICAO,CP.IDPESSOA,'
      '         CP.CODTIPRECDES13,CP.RECPAG13,CP.IDEMPRESAPROP13,'
      '         CP.CODTIPDOC13,CP.TIPCODIGO13,'
      
        '         CP.PLACONTAD13,CP.PLANO13,CP.PLACONTAC13,CP.CODCENTRORE' +
        'SPON13,'
      '         CP.CODSUBCONTA13,CP.CODCENTROCUSTOD13,'
      
        '         CP.CODCENTROCUSTOC13,CP.UNIDNEGOC13,CP.CODPORTFORMA13,C' +
        'P.IDEMPRESA13,'
      '         CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,'
      '         CP.PLACONTADPROVIS13, CP.PLACONTACPROVIS13,'
      '         CP.CODCCUSTDPROVIS13, CP.CODCCUSTCPROVIS13,'
      
        '         CP.PLACONTADBANCO, CP.PLACONTADBANCO13, CP.FLGDESCFOLHA' +
        ','
      '         CP.PLACTAOUTROMES13'
      
        'FROM     CONTRIBPREVPARTP CP, CONTPREV CP2, CONTRIBUICAO C, PLAN' +
        'PREV P, PESSOA PAT'
      'WHERE    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      CP.IDPESSOA = :IDPESSOA'
      'AND      CP2.IDPLANOPREV = CP.IDPLANOPREV'
      'AND'#9' CP2.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      CP2.FLGCOBRADECTERC = 1'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'ORDER BY C.NOME'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 393
    Top = 214
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPatroDados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDPESSOA '
      'FROM     PATRO'
      'WHERE    IDPESSOA = :idPessoa'
      '')
    ValidateWithMask = True
    Left = 470
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
      end>
  end
  object dsc: TDataSource
    DataSet = qrycentrespon
    Left = 304
    Top = 272
  end
  object qryPlanPrevContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV AS IDPLANPREVCONTAB, NOME'
      'FROM   PLANPREVCONTABIL'
      'WHERE  NVL(ATIVO,'#39'S'#39') = '#39'S'#39
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 493
    Top = 372
  end
end
