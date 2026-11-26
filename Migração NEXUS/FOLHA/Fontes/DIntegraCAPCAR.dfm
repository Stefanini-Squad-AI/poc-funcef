object dtmIntegraCAPCAR: TdtmIntegraCAPCAR
  OldCreateOrder = True
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDPESSOA,NOME'
      'FROM     PESSOA'
      'WHERE    FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 14
    Top = 50
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
      
        '       PP.CODALTERADORJUROS,PP.CODALTERADORCORR, PP.PLANO,PP.PLA' +
        'CONTALIQFLHBEN'
      'FROM   PLANPREV PL, PLANPREVPATRO PP, PESSOA PAT'
      'WHERE  PP.IDPESSJUR = :IDPESSOA'
      'AND    PL.TPPLANOPREV IN (:TPPLANO)'
      'AND    PL.IDPLANOPREV = PP.IDPLANOPREV'
      'AND    PAT.IDPESSOA = PP.IDPESSJUR')
    ValidateWithMask = True
    Left = 98
    Top = 50
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TPPLANO'
        ParamType = ptUnknown
        Value = 'F'
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
        'DIGO,CP.CODALTERADORJUROS,'
      
        '       CP.CODSUBCONTA,CP.IDEMPRESAPROP,CP.CODCENTRORESPON,CP.UNI' +
        'DNEGOC,CP.CODCENTROCUSTOD,'
      
        '       CP.IDEMPRESA,CP.CODCENTROCUSTOC,CP.PLACONTAD,CP.PLANO,CP.' +
        'PLACONTAC,CP.CODTIPDOC,'
      
        '       CP.CODTIPRECDES,CP.RECPAG,CP.CODALTERADORCORR,CP.CODTIPDE' +
        'SEMBDEVOL,CP.RECPAGDEVOL,'
      '       CP.CODTIPDESEMBDEVOL,CP.RECPAGDEVOL,CP.FLGINTERNO,'
      '       CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,CP.FLGPAGADOR,'
      '       CP.PLACONTADEVOL,CP.CODCCUSTODEVOL'
      'FROM   CONTRIBUICAO C, CONTPREV CP, PLANPREV P'
      'WHERE  CP.IDPLANOPREV = :IDPLANOPREV'
      'AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND    P.IDPLANOPREV = CP.IDPLANOPREV')
    ValidateWithMask = True
    Left = 104
    Top = 170
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
      '       BF.CODRECEBCAPABN,BF.PLACONTADEVOL,BF.CODCCUSTODEVOL'
      'FROM   BENEFICIO B, BENEFPLANPATRO BF, PLANPREV P, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR')
    ValidateWithMask = True
    Left = 237
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
      '         PL.PLACONTACIRRF'
      'FROM     PLANPREV PL'
      'WHERE    PL.TPPLANOPREV IN (:TPPLANO)'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 20
    Top = 170
    ParamData = <
      item
        DataType = ftString
        Name = 'TPPLANO'
        ParamType = ptUnknown
        Value = 'F'
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
        'ESAPROP,CP.CODALTERADORJUROS,'
      
        '         CP.TIPCODIGO,CP.PLANO,CP.PLACONTAC,CP.PLACONTAD,CP.IDEM' +
        'PRESA,CP.CODCENTROCUSTOC,'
      
        '         CP.CODCENTROCUSTOD,CP.UNIDNEGOC,CP.CODCENTRORESPON,CP.C' +
        'ODSUBCONTA,CP.CODALTERADORCORR,'
      
        '         CP.CODPORTFORMA,CP.CODTIPRECDES,CP.RECPAG,CP.CODTIPDOC,' +
        'CP.CODTIPDESEMBDEVOL,CP.RECPAGDEVOL,'
      '         CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,CV.FLGPAGADOR,'
      '         CV.FLGINTERNO,       CP.PLACONTADEVOL,CP.CODCCUSTODEVOL'
      
        'FROM     CONTRIBUICAO C, CONTPLANPATRO CP, PLANPREV P,  PESSOA  ' +
        'PAT,'
      '               CONTPREV CV'
      'WHERE    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'AND      CV.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      CV.IDPLANOPREV = CP.IDPLANOPREV'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 231
    Top = 50
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
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL'
      'FROM   BENEFICIO B, BENEFPLANPREV BF, PLANPREV P'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV')
    ValidateWithMask = True
    Left = 189
    Top = 173
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
    Left = 280
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryCCusto1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 211
    Top = 357
  end
  object qryAtividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC,IDPESSOA,NOME,IDUSUARIO,UNETIPO,UNECODIGO'
      'FROM   UNIDNEGOCIO'
      'WHERE  IDPESSOA = :IDEMPRESA')
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
      'FROM   PORTADORFORMA')
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
    ValidateWithMask = True
    Left = 205
    Top = 414
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
      
        '         CP.CODALTERADORJUROS,CP.CODTIPRECDES,CP.RECPAG,CP.IDEMP' +
        'RESAPROP,CP.CODTIPDOC,CP.TIPCODIGO,'
      
        '         CP.PLACONTAD,CP.PLANO,CP.PLACONTAC,CP.CODCENTRORESPON,C' +
        'P.CODSUBCONTA,CP.CODCENTROCUSTOD,'
      
        '         CP.CODCENTROCUSTOC,CP.UNIDNEGOC,CP.CODPORTFORMA,CP.IDEM' +
        'PRESA,CP.CODALTERADORCORR,'
      '         CP.CODTIPDESEMBDEVOL,CP.RECPAGDEVOL,'
      '         CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13,'
      '         CP.PLACONTADEVOL,CP.CODCCUSTODEVOL'
      
        'FROM     CONTRIBUICAO C, CONTRIBPREVPARTP CP, PLANPREV P, PESSOA' +
        ' PAT'
      'WHERE    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      CP.IDPESSOA = :IDPESSOA'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 280
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
  object qryReservaPart: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'SELECT R.IDTIPORESERVA,R.NOME, P.NOME AS PLANO,'
      
        '       RP.IDPLANOPREV,RP.IDTIPORESERVA,RP.IDPESSOA,RP.IDPESSJUR,' +
        'RP.SEQPROPOSTA,'
      
        '       RP.CODDOCUMENTOPREV,RP.PLNCODIGOPREV,RP.CODPORTFORMA,RP.I' +
        'DEMPRESAPROP,'
      
        '       RP.CODCENTRORESPON,RP.CODSUBCONTA,RP.UNIDNEGOC,RP.IDEMPRE' +
        'SA,RP.CODCENTROCUSTOD,'
      
        '       RP.CODCENTROCUSTOC,RP.PLANO,RP.PLACONTAD,RP.PLACONTAC,RP.' +
        'PLNCODIGOEFET,'
      '       RP.CODDOCUMENTOEFET'
      'FROM   RESERVAXPLANO R, PLANPREV P, RESERVAPART RP'
      'WHERE  R.IDPLANOPREV = :IDPLANOPREV'
      'AND    RP.IDPESSJUR = :IDPESSJUR'
      'AND    RP.IDPESSOA = :IDPESSOA'
      'AND    P.IDPLANOPREV = R.IDPLANOPREV'
      'AND    RP.IDTIPORESERVA = R.IDTIPORESERVA'
      'AND    RP.IDPLANOPREV = R.IDPLANOPREV'
      '')
    ValidateWithMask = True
    Left = 391
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
      
        'FROM   PESSOA P,ELEGPATRO E,PESSOA PAT,PLANPREV PL,PARTPREVPLAN ' +
        'PP'
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
      
        'SELECT CODCENTRORESPON,IDPESSOA,NOME,ANALITICOSINTET,IDUSUARIOIN' +
        'CLUSAO,'
      '       RESPONSAVEL,ATIVO'
      'FROM   CENTRESPON'
      'WHERE  ATIVO = '#39'S'#39
      'AND    IDPESSOA = :IDEMPRESA')
    ValidateWithMask = True
    Left = 277
    Top = 289
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
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
      'WHERE  IDPESSOA = :IDEMPRESA')
    ValidateWithMask = True
    Left = 306
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   CODALTERADOR,DESCRICAO'
      'FROM     TIPOALTERADOR'
      'WHERE    RECPAG = '#39'R'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 306
    Top = 414
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
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 396
    Top = 414
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   P.NOME,F.IDPESSOA,F.CODSUBCONTAIRRF,F.IDFAVORECIDOIRRF,' +
        'F.IDRUBLIQEMPRESTI,'
      
        '         F.CODTIPRECDESIRRF,F.IDEMPRESAPROPIRRF,F.RECPAGIRRF,F.C' +
        'ODCENTCUSTDIRRF,'
      
        '         F.IDEMPRESAIRRF,F.TIPCODIGOIRRF,F.CODTIPDOCIRRF,F.CODCE' +
        'NTCUSTCIRRF,'
      
        '         F.CODPORTFORMAIRRF,F.PLACONTADIRRF,F.PLANOIRRF,F.UNIDNE' +
        'GOCIRRF,F.PLACONTACIRRF,'
      
        '         F.CODCENTRESPIRRF,F.FLGTIPOPREVIDENC, F.IDRUBLIQASSISTE' +
        'N,'
      
        '         F.IDRUBLIQPREVIDEN,F.DIAFOLHA,F.FLGUTILFOLHA,F.FLGANTER' +
        'IORFOLHA,'
      
        '         F.FLGMESFOLHA,F.IDRUBBENEFLIQUIDO,P1.NOME AS FAVORECIDO' +
        ','
      '         F.CODDESEMBIRRF,F.RECPAG,F.IDEMPRESAPROP'
      'FROM       FUNDACAO F, PESSOA P, PESSOA P1'
      'WHERE    P.IDPESSOA = F.IDPESSOA'
      'AND          P1.IDPESSOA(+) = F.IDFAVORECIDOIRRF'
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 98
    Top = 281
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 98
    Top = 240
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
    Left = 348
    Top = 232
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
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL'
      'FROM   BENEFICIO B, BENEFPLANOPART BF, PLANPREV P, PESSOA PAT'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDPESSOA = :IDPESSOA'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO')
    ValidateWithMask = True
    Left = 383
    Top = 179
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
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL'
      
        'FROM   BENEFICIO B, BENEFPLANPATRO BF, PLANPREV P, PESSOA PAT, B' +
        'ENEFPLANPREV BP'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BP.FLGPOSSUIABONO = 1'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      'AND    BP.IDBENEFICIO = B.IDBENEFICIO'
      'AND    BP.IDPLANOPREV = BF.IDPLANOPREV')
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
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL'
      'FROM   BENEFICIO B, BENEFPLANPREV BF, PLANPREV P'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.FLGPOSSUIABONO = 1'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV')
    ValidateWithMask = True
    Left = 189
    Top = 128
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
      '       BF.PLACONTADEVOL,BF.CODCCUSTODEVOL'
      
        'FROM   BENEFICIO B, BENEFPLANOPART BF, PLANPREV P, PESSOA PAT, B' +
        'ENEFPLANPREV BP'
      'WHERE  BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDPESSJUR = :IDPESSJUR'
      'AND    BF.IDPESSOA = :IDPESSOA'
      'AND    BP.FLGPOSSUIABONO = 1'
      'AND    P.IDPLANOPREV = BF.IDPLANOPREV'
      'AND    PAT.IDPESSOA = BF.IDPESSJUR'
      'AND    BF.IDBENEFICIO = B.IDBENEFICIO'
      'AND    BP.IDBENEFICIO = BF.IDBENEFICIO'
      'AND    BP.IDPLANOPREV = BF.IDPLANOPREV')
    ValidateWithMask = True
    Left = 473
    Top = 171
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
        'ESAPROP13,CP.CODALTERAJUROS13,'
      
        '         CP.TIPCODIGO13,CP.PLANO13,CP.PLACONTAC13,CP.PLACONTAD13' +
        ',CP.IDEMPRESA13,CP.CODCENTROCUSTOC13,'
      
        '         CP.CODCENTROCUSTOD13,CP.UNIDNEGOC13,CP.CODCENTRORESPON1' +
        '3,CP.CODSUBCONTA13,CP.CODALTERACORR13,'
      
        '         CP.CODPORTFORMA13,CP.CODTIPRECDES13,CP.RECPAG13,CP.CODT' +
        'IPDOC13,'
      '         CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13, CP2.FLGPAGADOR,'
      '         CP2.FLGINTERNO'
      
        'FROM     CONTRIBUICAO C, CONTPLANPATRO CP, CONTPREV CP2, PLANPRE' +
        'V P, PESSOA PAT'
      'WHERE    CP2.FLGCOBRADECTERC = 1'
      'AND      CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      CP2.IDPLANOPREV = CP.IDPLANOPREV'
      'AND'#9'   CP2.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 453
    Top = 51
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
      
        '       CP.CODALTERAJUROS13,CP.CODALTERACORR13,CP.CODSUBCONTA13,C' +
        'P.IDEMPRESAPROP13,'
      '       CP.CODCENTRORESPON13,CP.UNIDNEGOC13,CP.CODCENTROCUSTOD13,'
      
        '       CP.IDEMPRESA13,CP.CODCENTROCUSTOC13,CP.PLACONTAD13,CP.PLA' +
        'NO13,'
      '       CP.PLACONTAC13,CP.CODTIPDOC13,CP.FLGINTERNO,'
      '       CP.CODTIPRECDES13,CP.RECPAG13,CP.FLGPAGADOR,'
      '       CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13'
      'FROM   CONTRIBUICAO C, CONTPREV CP, PLANPREV P'
      'WHERE  CP.FLGCOBRADECTERC = 1'
      'AND    CP.IDPLANOPREV = :IDPLANOPREV'
      'AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND    P.IDPLANOPREV = CP.IDPLANOPREV')
    ValidateWithMask = True
    Left = 467
    Top = 117
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
      
        '         CP.CODALTERAJUROS13,CP.CODTIPRECDES13,CP.RECPAG13,CP.ID' +
        'EMPRESAPROP13,'
      '         CP.CODTIPDOC13,CP.TIPCODIGO13,'
      
        '         CP.PLACONTAD13,CP.PLANO13,CP.PLACONTAC13,CP.CODCENTRORE' +
        'SPON13,'
      '         CP.CODSUBCONTA13,CP.CODCENTROCUSTOD13,'
      
        '         CP.CODCENTROCUSTOC13,CP.UNIDNEGOC13,CP.CODPORTFORMA13,C' +
        'P.IDEMPRESA13,'
      '         CP.CODALTERACORR13,CP.CODTIPDESEMBCAR,CP.CODTIPDESEMB13'
      
        'FROM     CONTRIBUICAO C, CONTPREV CP2, CONTRIBPREVPARTP CP, PLAN' +
        'PREV P, PESSOA PAT'
      'WHERE    CP2.FLGCOBRADECTERC = 1'
      'AND      CP.IDPLANOPREV = :IDPLANOPREV'
      'AND      CP.IDPESSJUR = :IDPESSJUR'
      'AND      CP.IDPESSOA = :IDPESSOA'
      'AND      CP2.IDPLANOPREV = CP.IDPLANOPREV'
      'AND'#9'   CP2.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND      P.IDPLANOPREV = CP.IDPLANOPREV'
      'AND      PAT.IDPESSOA = CP.IDPESSJUR'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 473
    Top = 230
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
      'SELECT   IDPESSOA,PLANO,PLACONTALIQFLHBEN,CODPORTFORMA,'
      '                 TIPCODIGO,UNIDNEGOC,CODCENTRORESPON'
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
end
