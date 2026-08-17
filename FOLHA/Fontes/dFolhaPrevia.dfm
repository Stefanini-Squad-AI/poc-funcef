object dtmFolhaPrevia: TdtmFolhaPrevia
  OldCreateOrder = True
  OnCreate = dtmFolhaPreviaCreate
  Left = 475
  Top = 99
  Height = 951
  Width = 1392
  object qryRubricaIndividual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' '
      ''
      ''
      ''
      '')
    ValidateWithMask = False
    Left = 42
    Top = 15
  end
  object qryDadoTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.MATRICULA, P.INSCRICAONUMERO'
      'FROM ELEGPATRO E, PARTPREVPLAN P'
      'WHERE E.IDPESSOA = :PIDTITULAR'
      'AND E.IDPESSJUR = :PIDPESSJUR'
      'AND P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSJUR = E.IDPESSJUR'
      'AND P.IDPLANOPREV = :PIDPLANOPREV'
      'AND P.FLGDESATIVADO = 0')
    ValidateWithMask = False
    Left = 131
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryDadoRecebedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME'
      'FROM PESSOA'
      'WHERE IDPESSOA = :PIDPESSOA')
    ValidateWithMask = False
    Left = 131
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 42
    Top = 75
  end
  object qryPrevia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 308
    Top = 135
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 308
    Top = 15
  end
  object qryProvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PD.IDPROVENTO, PD.FLGDESCPENSAO, PD.FLGIRRF, PD.FLGESPECI' +
        'AL,'
      
        '       nvl(rxe.FLGSALFAMILIA,0) FLGSALFAMILIA,    /*SOL 191668 -' +
        ' inclusao vw_rubxevento */'
      '       DECODE(PD.FLGESPECIAL,0,PD.FLGDESCONTO,2) FLGDESCONTO,'
      '       PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF,PD.CODIRRFDARF,'
      
        '       NVL(PD.NUMPRIORIDADEFB,0) AS NUMPRIORIDADE, NVL(PD.CODIRR' +
        'FDARF, '#39' '#39') AS CODIRRFDARF,'
      '       NVL(PD.DESCPARCIAL, 0) DESCPARCIAL,'
      
        '       NVL(PD.TIPOBASEDESCONTO,5) AS TIPOBASEDESCONTO, CODFONTEP' +
        'AGADORA,'
      
        '       CODPROVDESC, NVL(PD.FLGRUBLEGAL,0) AS FLGRUBLEGAL, PD.FLG' +
        'MARGEM,PD.FLGBITRIBUTACAO, NVL(PD.FLGREPROGRAMAR,0) AS FLGREPROG' +
        'RAMAR,'
      '       PD.CODIRRFDARFREG,'
      'PD.FLGEXCLUICONTRIBPA'
      
        'FROM PROVDESC PD, VW_RUBXEVENTO RXE       /*SOL 191668 - inclusa' +
        'o vw_rubxevento */'
      
        'WHERE PD.IDPROVENTO = RXE.IDPROVENTO(+)   /*SOL 191668 - inclusa' +
        'o vw_rubxevento */'
      'ORDER BY PD.IDPROVENTO'
      ''
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
      ' ')
    ValidateWithMask = False
    Left = 42
    Top = 135
  end
  object qryCorrecaoContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT A.CODALTERADOR, A.IDREGRACALCULO, A.IDRUBNORMAL, A.IDRUBD' +
        'EVOLUCAO'
      'FROM CONTPREV C, ALTERADORXCONTRIB A'
      'WHERE C.IDPLANOPREV = :IDPLANOPREV'
      'AND C.IDCONTRIBUICAO = :IDCONTRIBUICAO'
      'AND (C.IDRUBRICAATRASO   = :IDRUBRICA OR'
      '     C.IDRUBRICADEVOLUC  = :IDRUBRICA OR'
      '     C.IDRUBDECTERC      = :IDRUBRICA OR'
      '     C.IDRUBDECTERCDEVOL = :IDRUBRICA OR'
      '     C.IDRUBDECTERCATRA  = :IDRUBRICA OR'
      '     C.IDRUBRICA         = :IDRUBRICA)'
      'AND A.IDPLANOPREV = C.IDPLANOPREV'
      'AND A.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'AND A.FLGCOBRA = 1'
      'AND A.FLGATRASO = :PFLGATRASO'
      'AND A.FLGDEVOL = :PFLGDEVOL')
    ValidateWithMask = True
    Left = 308
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATRASO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEVOL'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(DISTINCT IDPESSOA)'
      'FROM BENEFBFCIARIO'
      'WHERE (NUMEROPROCESSO = :pNUMEROPROCESSO)'
      'AND IDSITBENEFICIO IN (1,2)')
    ValidateWithMask = True
    Left = 219
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryPercentual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERCENTUAL'
      'FROM BFCIARIOTITPLAN'
      'WHERE (IDTITULAR = :pIdTitular)'
      'AND (IDPESSJUR = :pIdPessJur)'
      'AND (IDPLANOPREV = :pIdPlanoPrev)'
      'AND (IDPESSOA = :pIdPessoa)'
      'AND (IDBENEFICIO = :pIdBeneficio)')
    ValidateWithMask = True
    Left = 219
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizaValorHst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set   VALORPREV     = :VALORPREVISTO,'
      '      VALORPREVMIN  = :VALORPREVMIN'
      'where IDPESSJUR     = :PESSJUR'
      'and   IDTITULAR     = :TITULAR'
      'and   IDPLANOPREV   = :PLANOPREV'
      'and   IDBENEFICIO   = :BENEFICIO'
      'and   IDMOTIVO      = :MOTIVO'
      'and   NUMEROPROCESSO= :NUMPROC'
      'and   MES           = :MES'
      'and   IDPESSOA      = :PESSOA'
      'and   MESREFERENCIA = :MESREF'
      'and   SEQPROPOSTA   = :SEQPROP'
      'and   SEQBENEFICIO  = :SEQBENEF'
      '')
    ValidateWithMask = True
    Left = 219
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORPREVISTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORPREVMIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQBENEF'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCBANCARIA, TIPOCONTA'
      'FROM CONTABANCARIA'
      'WHERE IDPESSOA = :IDPESSOA'
      'AND TIPOCONTA = 2'
      ' ')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 219
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDadosPF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDEPIRRF, NUMDEPSALF, FLGISENTOIRRF,'
      '       NVL(DATANASC,SYSDATE) AS DATANASC'
      'FROM PESSOAFISICA'
      'WHERE IDPESSOA = :PIDPESSOA')
    ValidateWithMask = False
    Left = 131
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdDescFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TMPDESC'
      'SET    LOTEPREVIA  = :pIdLotePrevia,'
      '       DATARECEBIMENTO = :pData'
      'WHERE  (IDLOTE = :pIdLote)'
      'AND    (IDPESSJUR = :pidpessjur)'
      'AND    (IDPLANOPREV = :pidplanoprev)'
      'AND    (IDTITULAR = :pidtitular)'
      'AND    (IDPESSOA = :pidpessoa)'
      'AND    (MESREFERENCIA = :pmesref)'
      'AND    (IDPROVENTO = :pidprovento)'
      'AND    (IDMOTIVO = :pidmotivo or IDMOTIVO IS NULL)'
      'AND    (FLGDESCFOLHA = '#39'B'#39')')
    ValidateWithMask = True
    Left = 42
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdLotePrevia'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pData'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pidpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pidplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pidtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pidpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pmesref'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pidprovento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pidmotivo'
        ParamType = ptUnknown
      end>
  end
  object qryPagadorContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBRICA, FLGPAGADOR'
      'FROM (SELECT IDCONTRIBUICAO, IDPLANOPREV, IDRUBRICA, FLGPAGADOR'
      '      FROM CONTPREV'
      '      UNION'
      
        '      SELECT IDCONTRIBUICAO, IDPLANOPREV, IDRUBRICAATRASO, FLGPA' +
        'GADOR'
      '      FROM CONTPREV'
      '      UNION'
      
        '      SELECT IDCONTRIBUICAO, IDPLANOPREV, IDRUBRICADEVOLUC, FLGP' +
        'AGADOR'
      '      FROM CONTPREV'
      '      UNION'
      
        '      SELECT IDCONTRIBUICAO, IDPLANOPREV, IDRUBDECTERC, FLGPAGAD' +
        'OR'
      '      FROM CONTPREV'
      '      UNION'
      
        '      SELECT IDCONTRIBUICAO, IDPLANOPREV, IDRUBDECTERCDEVOL, FLG' +
        'PAGADOR'
      '      FROM CONTPREV'
      '      UNION'
      
        '      SELECT IDCONTRIBUICAO, IDPLANOPREV, IDRUBDECTERCATRA, FLGP' +
        'AGADOR'
      '      FROM CONTPREV)'
      'WHERE IDRUBRICA IS NOT NULL'
      'ORDER BY IDPLANOPREV, IDCONTRIBUICAO, IDRUBRICA'
      ' ')
    ValidateWithMask = True
    Left = 131
    Top = 255
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 308
    Top = 211
  end
  object qryRubXPA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRUBRICA'
      'FROM RUBXPENSAOALIM'
      'WHERE IDEMPRESA       = :PIDEMPRESA'
      'AND   IDTITULAR       = :PIDTITULAR'
      'AND   IDPESSOA        = :PIDPESSOA'
      'AND   IDFAVORECIDO    = :PIDFAVORECIDO'
      'AND   SEQRUBRICAINDIV = :PSEQRUBRICAINDIV')
    ValidateWithMask = True
    Left = 42
    Top = 195
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFAVORECIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PSEQRUBRICAINDIV'
        ParamType = ptUnknown
      end>
  end
  object qryVerifPaisNaoUsado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(PA.CODINTERNACIONAL,SUBSTR(PA.NOMEPAIS,1,3)) AS CODIG' +
        'O'
      'FROM PESSOA P, ENDPESS EN, CIDADES CI, ESTADO ES, PAIS PA'
      'WHERE EN.IDPESSOA = :PESSOA'
      'AND CI.IDCIDADES = EN.IDCIDADES'
      'AND ES.IDESTADO = CI.IDESTADO'
      'AND PA.IDPAIS = ES.IDPAIS'
      'AND P.IDPESSOA = EN.IDPESSOA'
      'AND EN.IDENDERECO = P.IDENDRESIDENCIAL')
    ValidateWithMask = True
    Left = 132
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCorrecaoBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, IDREGRACALCULO, IDRUBNORMAL, IDRUBDEVOLUCAO'
      'FROM ALTERADORXBENEF'
      'WHERE IDPLANOPREV = :IDPLANOPREV'
      'AND IDBENEFICIO = :IDBENEFICIO'
      'AND FLGCOBRA = 1'
      'AND FLGATRASO = :PFLGATRASO'
      'AND FLGDEVOL = :PFLGDEVOL')
    ValidateWithMask = True
    Left = 396
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATRASO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEVOL'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateTmpdesc1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TMPDESC'
      
        'SET DATARECEBIMENTO = NULL, VALORRECEBIDO = NULL, LOTEPREVIA = N' +
        'ULL'
      'WHERE IDTITULAR = :PIDTITULAR'
      'AND MESCOBRANCA = :PMESCOBRANCA'
      'AND FLGTIPODESC IN ('#39'C'#39','#39'P'#39','#39'A'#39','#39'E'#39')'
      'AND FLGDESCFOLHA = '#39'B'#39
      'AND LOTEPREVIA IS NOT NULL'
      'AND IDLOTE IS NOT NULL'
      'AND SITENVIO = '#39'0'#39
      ''
      '')
    ValidateWithMask = True
    Left = 124
    Top = 391
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryBFCiarioTitPlan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IDPESSOA'
      'FROM BFCIARIOTITPLAN'
      'WHERE IDRESPONSAVEL = :PIDRESPONSAVEL'
      'AND IDPLANOPREV = :PIDPLANOPREV'
      'AND IDPESSJUR = :PIDPESSJUR'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 396
    Top = 195
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryLimiteRubrica: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,'
      '       IDRUBRICA,'
      '       NVL(LIMITEMAXIMO,0) AS LIMITEMAXIMO,'
      '       NVL(LIMITEMINIMO,0) AS LIMITEMINIMO'
      'FROM RUBRICAXCONTABANCARIA'
      'ORDER BY IDPESSOA, IDRUBRICA'
      ' ')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 483
    Top = 128
  end
  object qryEstruturas: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDESTRUTURA, IDREGRA, IDRUBRICAEXIBICAO, DESCRICAO'
      'FROM ESTRUTURACALCULO'
      'ORDER BY IDESTRUTURA'
      ''
      '      '
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 565
    Top = 230
  end
  object qryAdiantamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDRESPONSAVEL, MES, MESCOBRANCA, IDRUBRICA, VALORPROVENTO' +
        ', VALORRECEBIDO,'
      
        #9'      VALORINFO, CODMOEDA, IDPESSJUR, NUMEROPROCESSO, NUMPROCIN' +
        'SS'
      'FROM HISTRUBSAL'
      'WHERE MESCOBRANCA >= :SMESCOB'
      'AND IDPESSOA = :IIDPESSOA'
      'AND FLGTIPODESC NOT IN ('#39'B'#39','#39'P'#39')'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 131
    Top = 315
    ParamData = <
      item
        DataType = ftString
        Name = 'SMESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAtualizaflgisento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update PESSOAFISICA'
      'set FLGISENTOIRRF = 0, FLGMOLESTIAGRAVE = 0'
      'Where IDPESSOA = :PESSOA'
      '  '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 42
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCompensaIRRFNaoUsada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT ANOMESINICIO, ANOMESFIM, COMPTOTAL-SALDOCOMP AS SALDOACOM' +
        'P'
      'FROM COMPENSAIRRF'
      'WHERE IDPESSOA = :IDPESSOA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 555
    Top = 387
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDetProcjudicial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DPJ.IDPROCJUD,'
      '  DPJ.IDREGRA,'
      '  DPJ.IDRUBRICA,'
      '  DPJ.IDRUBRICAABONO,'
      '  NVL(PRJ.PERCACAO,0) AS PERCACAO,'
      '  PRJ.SITPROCESSO,'
      '  PRJ.DATAINICIO,'
      '  PRJ.DATAFINAL,'
      '  NVL(PRJ.TIPOACAO,0) AS TIPOACAO,'
      '  NVL(PRJ.FLGFAZDEPOSITO,0) AS FLGFAZDEPOSITO,'
      '  PRJ.IDPESSOA,'
      '  PD.IDGRUPORUBRICA --BRUNO AZEVEDO SOL 149068'
      '  , PRJ.CODIRRFDARF'
      '  , PD.CODFONTEPAGADORA'
      '  , PD.IDGRUPORUBRICA'
      '  ,PD.FLGDESCONTO'
      '  ,CASE'
      '      WHEN'
      '       (SELECT COUNT(*)'
      '          FROM DETPROCJUD, REGRA'
      '        WHERE REGRA.IDREGRA = DETPROCJUD.IDREGRA'
      '          AND DETPROCJUD.IDPROCJUD = PRJ.IDPROCJUD'
      '          AND INSTR(REGRA.NOMEREGRA, '#39'EQUA'#39') <> 0'
      '       ) > 0'
      '      THEN  1'
      '      ELSE 0'
      '   END FLGACAOEQUA'
      ''
      '  /*SIG70584-93915*/'
      '  , (SELECT COUNT(PJ.IDPROCJUD)'
      '       FROM PROCJUD PJ'
      '      WHERE PJ.IDPESSOA = PRJ.IDPESSOA'
      '        AND PJ.SITPROCESSO < 2'
      '        AND EXISTS (SELECT 1 FROM DETPROCJUD DJ'
      '                     WHERE DJ.IDPROCJUD = PJ.IDPROCJUD'
      '                       AND DJ.FLGATIVA  = 0'
      '                   )'
      '    ) AS NUM_ACOES'
      '  , (SELECT SUM(PJ.PERCACAO)'
      '       FROM PROCJUD PJ'
      '      WHERE PJ.IDPESSOA = PRJ.IDPESSOA'
      '        AND PJ.SITPROCESSO < 2'
      '        AND EXISTS (SELECT 1 FROM DETPROCJUD DJ'
      '                     WHERE DJ.IDPROCJUD = PJ.IDPROCJUD'
      '                       AND DJ.FLGATIVA  = 0'
      '                   )'
      '    ) AS PERC_ACOES'
      '  /*SIG70584-93915*/'
      ''
      'FROM'
      '  DETPROCJUD DPJ,'
      '  PROCJUD    PRJ,'
      '  PROVDESC   PD  --BRUNO AZEVEDO SOL 149068'
      ''
      'WHERE DPJ.IDPESSOA    = :IDPESSOA'
      '  AND DPJ.IDPROCJUD   = PRJ.IDPROCJUD'
      '  AND DPJ.FLGATIVA    = 0'
      '  AND PRJ.SITPROCESSO < 2'
      '  AND PD.IDPROVENTO = DPJ.IDRUBRICA --BRUNO AZEVEDO SOL 149068'
      
        '  /*--Leandro WO13356 AND (PRJ.DATAINICIO <= :DTPGTO  AND (PRJ.D' +
        'ATAFINAL >= :DTPGTO OR PRJ.DATAFINAL IS NULL)) --LEANDRO WO4555*' +
        '/'
      'ORDER BY DPJ.ORDEMCALCULO ASC  /*SIG70584-93915*/'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 220
    Top = 251
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryaux3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 396
    Top = 136
  end
  object qryBaseIR: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(DECODE(V.FLGDESCONTO,0,H.VALORPROVENTO,1,-1*H.VALORPR' +
        'OVENTO,0)) AS BASE'
      'FROM HISTRUBSAL H, PROVDESC V'
      'WHERE H.IDMODULO = 18'
      'AND H.IDRESPONSAVEL = :PIDRESPONSAVEL'
      'AND H.IDTITULAR = :PIDTITULAR'
      'AND TO_CHAR(H.DATAPAGAMENTO, '#39'YYYY/MM'#39') = :PMES'
      'AND H.CODIRRFDARF = :PCODIRRFDARF'
      'AND H.IDRUBRICA = V.IDPROVENTO'
      'AND H.FLGIRRF = 1'
      'AND H.IDHSTFOLHABENEF IS NOT NULL'
      'AND H.FLGESTORNO = 0'
      'AND SUBSTR(H.MES,6,2) <> '#39'13'#39
      ''
      ' ')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 395
    Top = 255
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODIRRFDARF'
        ParamType = ptUnknown
      end>
  end
  object qryValorIR: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(H.VALORPROVENTO) AS VALOR'
      'FROM HISTRUBSAL H'
      'WHERE H.IDMODULO = 18'
      'AND H.IDRESPONSAVEL = :PIDRESPONSAVEL'
      'AND H.IDTITULAR = :PIDTITULAR'
      'AND TO_CHAR(H.DATAPAGAMENTO, '#39'YYYY/MM'#39') = :PMES'
      'AND H.CODIRRFDARF = :PCODIRRFDARF'
      'AND H.IDRUBRICA = :PIDRUBRICA'
      'AND H.IDHSTFOLHABENEF IS NOT NULL'
      'AND H.FLGTIPODESC = '#39'I'#39
      'AND H.FLGESTORNO = 0')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 395
    Top = 315
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODIRRFDARF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryBaseIR13: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(DECODE(V.FLGDESCONTO,0,H.VALORPROVENTO,1,-1*H.VALORPR' +
        'OVENTO,0)) AS BASE'
      'FROM HISTRUBSAL H, PROVDESC V'
      'WHERE H.IDMODULO = 18'
      'AND H.IDRESPONSAVEL = :PIDRESPONSAVEL'
      'AND H.IDTITULAR = :PIDTITULAR'
      'AND TO_CHAR(H.DATAPAGAMENTO, '#39'YYYY/MM'#39') = :PMES'
      'AND H.MES = :PMESABONO'
      'AND H.CODIRRFDARF = :PCODIRRFDARF'
      'AND H.IDRUBRICA = V.IDPROVENTO'
      'AND H.FLGIRRF = 1'
      'AND H.IDHSTFOLHABENEF IS NOT NULL'
      'AND H.FLGESTORNO = 0')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 459
    Top = 255
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESABONO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODIRRFDARF'
        ParamType = ptUnknown
      end>
  end
  object qryValorIR13: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(H.VALORPROVENTO) AS VALOR'
      'FROM HISTRUBSAL H'
      'WHERE H.IDMODULO = 18'
      'AND H.IDRESPONSAVEL = :PIDRESPONSAVEL'
      'AND H.IDTITULAR = :PIDTITULAR'
      'AND TO_CHAR(H.DATAPAGAMENTO, '#39'YYYY/MM'#39') = :PMES'
      'AND H.MES = :PMESABONO'
      'AND H.CODIRRFDARF = :PCODIRRFDARF'
      'AND H.IDRUBRICA = :PIDRUBRICA'
      'AND H.IDHSTFOLHABENEF IS NOT NULL'
      'AND H.FLGTIPODESC = '#39'I'#39
      'AND H.FLGESTORNO = 0')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 459
    Top = 315
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESABONO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODIRRFDARF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryEstrutxRub: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EST.IDESTRUTURA,'
      '       EST.GRUPOCALCULO,'
      '       EST.IDRUBRICA,'
      '       '#39' '#39' AS STIPODESC,'
      '       0.000000 AS V1,'
      '       0.000000 AS V2,'
      '       NVL(PRV.PRAZO,0) AS PRAZO'
      'FROM ESTRUTURAXRUBRICA EST, PROVDESC PRV'
      'WHERE EST.IDRUBRICA = PRV.IDPROVENTO'
      'ORDER BY EST.IDESTRUTURA, EST.GRUPOCALCULO, EST.IDRUBRICA'
      ' ')
    ControlType.Strings = (
      'FLGEFETIVAR;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 564
    Top = 74
  end
  object cdsEstrutura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstrutura'
    Left = 565
    Top = 123
    object cdsEstruturaIDESTRUTURA: TFloatField
      FieldName = 'IDESTRUTURA'
    end
    object cdsEstruturaGRUPOCALCULO: TStringField
      FieldName = 'GRUPOCALCULO'
      FixedChar = True
      Size = 1
    end
    object cdsEstruturaIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object cdsEstruturaSTIPODESC: TStringField
      FieldName = 'STIPODESC'
      FixedChar = True
      Size = 1
    end
    object cdsEstruturaV1: TFloatField
      FieldName = 'V1'
    end
    object cdsEstruturaV2: TFloatField
      FieldName = 'V2'
    end
    object cdsEstruturaPRAZO: TFloatField
      FieldName = 'PRAZO'
    end
  end
  object dspEstrutura: TDataSetProvider
    DataSet = qryEstrutxRub
    Constraints = True
    Left = 564
    Top = 174
  end
  object qryRubricaGravar: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'INSERT INTO PREVIA'
      
        '(NUMEROPROCESSO,    IDPESSJUR,          IDPATRO,           IDPLA' +
        'NOPREV,'
      
        ' IDTITULAR,         IDPESSOA,           IDRESPONSAVEL,     IDFAV' +
        'ORECIDO,'
      
        ' IDRECEBEPGTO,      MES,                MESCOBRANCA,       IDBEN' +
        'EFICIO,'
      
        ' IDRUBRICA,         IDLOTE,             FLGTIPODESC,       FLGDE' +
        'SCONTO,'
      
        ' FLGESPECIAL,       IDMOTIVO,           SEQPROPOSTA,       SEQRU' +
        'BRICA,'
      
        ' REFERENCIA,        VALORPROVENTO,      VALORCOTAS,        VALOR' +
        'INFO,'
      
        ' VALORRECEBIDO,     CODMOEDA,           IDREGRACALCULO,    CODIR' +
        'RFDARF,'
      
        ' CODALTERADOR,      DATAPAGAMENTO,      FONTEPAGADORA,     FLGIR' +
        'RF,'
      
        ' IDMODULO,          FLGSRB,             FLGOK,             FLGCO' +
        'NCESSAO,'
      
        ' FLGINDIVIDUAL,     FLGCOMPOESALPART,   FLGCOMPOESALBENEF, ORDEM' +
        ','
      
        ' FLGPAGA,           IDEMPRESA,          RECPAG,            CODTI' +
        'PRECDES,'
      
        ' CODCENTROCUSTO,    CODCENTRORESPON,    UNIDNEGOC,         PLANO' +
        ','
      
        ' PLACONTA,          IDPLANOCONTABIL,    PLACONTAC,         PLACO' +
        'NTAD,'
      
        ' CODCENTROCUSTOC,   CODCENTROCUSTOD,    FLGTEMPROVISAO,    PLACO' +
        'NTACPROVIS,'
      
        ' PLACONTADPROVIS,   CODCCUSTOCPROVIS,   CODCCUSTODPROVIS,  CODPO' +
        'RTFORMA,'
      
        ' DFLOATPAGTO,       NUMPROCINSS,        FLGSALFAM,         FLGPR' +
        'OVISORIO,'
      
        ' IDVERSAOESTORNO,   NUMBANCO,           NUMAGENCIA,        CONTA' +
        'CORRENTE,'
      
        ' IDPLANOORIGEM,     FLGPENSAOALIM,      PARCELAS,          IDFAV' +
        'DOC,'
      
        ' CODPROVDESC,       IDSEQINTERNOFB,     SEQDOCUMENTO,      IDPRO' +
        'CJUD, MESCOMPREEM,IDHSTBITRIBUTACAO, IDINFORME,'
      'RELACAODEPEN, IDPERFILINVEST, TIPOCONTA, CODNATREINF)'
      ''
      ' VALUES'
      
        '(:NUMEROPROCESSO,   :IDPESSJUR,         :IDPATRO,          :IDPL' +
        'ANOPREV,'
      
        ' :IDTITULAR,        :IDPESSOA,          :IDRESPONSAVEL,    :IDFA' +
        'VORECIDO,'
      
        ' :IDRECEBEPGTO,     :MES,               :MESCOBRANCA,      :IDBE' +
        'NEFICIO,'
      
        ' :IDRUBRICA,        :IDLOTE,            :FLGTIPODESC,      :FLGD' +
        'ESCONTO,'
      
        ' :FLGESPECIAL,      :IDMOTIVO,          :SEQPROPOSTA,      :SEQR' +
        'UBRICA,'
      
        ' :REFERENCIA,       :VALORPROVENTO,     :VALORCOTAS,       :VALO' +
        'RINFO,'
      
        ' :VALORRECEBIDO,    :CODMOEDA,          :IDREGRACALCULO,   :CODI' +
        'RRFDARF,'
      
        ' :CODALTERADOR,     :DATAPAGAMENTO,     :FONTEPAGADORA,    :FLGI' +
        'RRF,'
      
        ' :IDMODULO,         :FLGSRB,            :FLGOK,            :FLGC' +
        'ONCESSAO,'
      
        ' :FLGINDIVIDUAL,    :FLGCOMPOESALPART,  :FLGCOMPOESALBENEF,:ORDE' +
        'M,'
      
        ' :FLGPAGA,          :IDEMPRESA,         :RECPAG,           :CODT' +
        'IPRECDES,'
      
        ' :CODCENTROCUSTO,   :CODCENTRORESPON,   :UNIDNEGOC,        :PLAN' +
        'O,'
      
        ' :PLACONTA,         :IDPLANOCONTABIL,   :PLACONTAC,        :PLAC' +
        'ONTAD,'
      
        ' :CODCENTROCUSTOC,  :CODCENTROCUSTOD,   :FLGTEMPROVISAO,   :PLAC' +
        'ONTACPROVIS,'
      
        ' :PLACONTADPROVIS,  :CODCCUSTOCPROVIS,  :CODCCUSTODPROVIS, :CODP' +
        'ORTFORMA,'
      
        ' :DFLOATPAGTO,      :NUMPROCINSS,       :FLGSALFAM,        :FLGP' +
        'ROVISORIO,'
      
        ' :IDVERSAOPAGTO,    :NUMBANCO,          :NUMAGENCIA,       :CONT' +
        'ACORRENTE,'
      
        ' :IDPLANOORIGEM,    :FLGPENSAOALIM,     :PARCELAS,         :IDFA' +
        'VDOC,'
      
        ' :CODPROVDESC,      :IDSEQINTERNOFB,    :SEQDOCUMENTO,     :IDPR' +
        'OCJUD, :MESCOMPREEM,:IDHSTBITRIBUTACAO, :IDINFORME,'
      ' :RELACAODEPEN, :IDPERFILINVEST, :TIPOCONTA, :CODNATREINF)'
      ''
      ''
      ''
      ''
      ''
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
    Left = 563
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IDRECEBEPGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGTIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGESPECIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORPROVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORCOTAS'
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
      end
      item
        DataType = ftInteger
        Name = 'CODMOEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRACALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIRRFDARF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODALTERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGSRB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGOK'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCONCESSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGINDIVIDUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALPART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGPAGA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UNIDNEGOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOCONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGTEMPROVISAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTACPROVIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTADPROVIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCCUSTOCPROVIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCCUSTODPROVIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DFLOATPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGSALFAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPROVISORIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDVERSAOPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMAGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTACORRENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPENSAOALIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PARCELAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFAVDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODPROVDESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEQINTERNOFB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPROCJUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESCOMPREEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDHSTBITRIBUTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDINFORME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RELACAODEPEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPERFILINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODNATREINF'
        ParamType = ptInput
      end>
  end
  object qryRubricaRateio: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRUBRICA'
      'FROM CONJUNTORUBXRUB'
      'WHERE IDCONJUNTORUBRICA = -1')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 309
    Top = 390
  end
  object cdsRubricaRateio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRubricaRateio'
    Left = 309
    Top = 283
    object cdsRubricaRateioIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
  end
  object dspRubricaRateio: TDataSetProvider
    DataSet = qryRubricaRateio
    Constraints = True
    Left = 308
    Top = 334
  end
  object qryIRGeral: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.IDRESPONSAVEL, H.IDTITULAR, H.CODIRRFDARF, '
      
        '       SUM(CASE WHEN ( (SUBSTR(H.MES,6,2) <> '#39'13'#39') AND (H.FLGIRR' +
        'F = 1) AND (H.FLGTIPODESC <> '#39'I'#39') )'
      
        '             THEN DECODE(V.FLGDESCONTO,0,H.VALORPROVENTO,1,-1*H.' +
        'VALORPROVENTO,0) '
      '              ELSE 0 '
      '           END) BASEIR,'
      
        '       SUM( CASE WHEN ( (SUBSTR(H.MES,6,2) = '#39'13'#39') AND (H.FLGIRR' +
        'F = 1) AND (H.FLGTIPODESC <> '#39'I'#39') )'
      
        '             THEN DECODE(V.FLGDESCONTO,0,H.VALORPROVENTO,1,-1*H.' +
        'VALORPROVENTO,0) '
      '             ELSE 0 '
      '           END) BASEIR13,'
      
        '       SUM( CASE WHEN ( (SUBSTR(H.MES,6,2) <> '#39'13'#39') AND (H.FLGTI' +
        'PODESC = '#39'I'#39') )'
      '             THEN H.VALORPROVENTO '
      '             ELSE 0 '
      '           END) VALORIR,'
      
        '       SUM( CASE WHEN ( (SUBSTR(H.MES,6,2) = '#39'13'#39') AND (H.FLGTIP' +
        'ODESC = '#39'I'#39') )'
      '             THEN H.VALORPROVENTO '
      '             ELSE 0 '
      '           END) VALORIR13'#9#9'      '#9#9#9'  '
      'FROM HISTRUBSAL H, PROVDESC V'
      'WHERE H.IDMODULO                          = 18'
      '  AND TO_CHAR(H.DATAPAGAMENTO, '#39'YYYY/MM'#39') = '#39'2007/06'#39
      '  AND H.IDRUBRICA                         = V.IDPROVENTO        '
      '  AND H.FLGESTORNO                        = 0   '
      '  AND H.IDHSTFOLHABENEF IS NOT NULL'
      '  AND H.codirrfdarf IS NOT NULL '
      'GROUP BY H.IDRESPONSAVEL, H.IDTITULAR, H.CODIRRFDARF  ')
    ValidateWithMask = True
    Left = 264
    Top = 520
  end
  object qryAux4: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 484
    Top = 35
  end
  object qryCtrlInterface: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CTRLINTERFACE'
      'SET IDSITPREVIA = :IDSITPREVIA'
      'WHERE IDLOTE = :IDLOTE')
    ValidateWithMask = True
    Left = 32
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSITPREVIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object qryUltTitularPrevia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CTRLINTERFACE'
      'SET IDSITPREVIA = :IDSITPREVIA'
      'WHERE IDLOTE = :IDLOTE')
    ValidateWithMask = True
    Left = 96
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSITPREVIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object qryNumProcINSS: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 403
    Top = 395
  end
  object dspRRA: TDataSetProvider
    DataSet = qryRRA
    Constraints = True
    Left = 648
    Top = 72
  end
  object qryRRA: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 648
    Top = 24
  end
  object cdsRRA: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'agrRRA'
        GroupingLevel = 1
        IndexName = 'idx_pessoa'
        Visible = False
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'FLGDEVOLUCAO'
        DataType = ftFloat
      end
      item
        Name = 'IDBENEFICIO'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDTITULAR'
        DataType = ftFloat
      end
      item
        Name = 'MESREFERENCIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VALORPREV'
        DataType = ftFloat
      end
      item
        Name = 'RUBRICAREVISAO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'idxRRA'
        Fields = 'IDPESSOA'
        GroupingLevel = 1
      end>
    IndexName = 'idxRRA'
    Params = <>
    ProviderName = 'dspRRA'
    StoreDefs = True
    Left = 648
    Top = 120
    object cdsRRAIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsRRAFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
    object cdsRRAIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object cdsRRAIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsRRAIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object cdsRRAMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object cdsRRAVALORPREV: TFloatField
      FieldName = 'VALORPREV'
    end
    object cdsRRARUBRICAREVISAO: TFloatField
      FieldName = 'RUBRICAREVISAO'
    end
    object cdsRRAFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
    end
    object cdsRRAAGR_TOTALRRA: TAggregateField
      FieldName = 'AGR_TOTALRRA'
      Visible = True
      Active = True
      Expression = 'SUM(VALORPREV)'
      GroupingLevel = 1
      IndexName = 'idxRRA'
    end
  end
  object qryRubricaXPlano: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM RUBRICAXPLANO'
      ' WHERE IDRUBRICA = :IDRUBRICA'
      '       AND IDPLANOPREV = :IDPLANOPREV')
    ValidateWithMask = True
    Left = 216
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryMat: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT MATRICULA FROM DEPENTIT'
      'WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 216
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAuxRRA: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 400
    Top = 472
  end
  object qryRubricasContribEqua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CP.IDCONTRIBUICAO, CP.IDRUBRICA, PD.CODPROVDESC, PD.DESCR' +
        'ICAO '
      'FROM ('
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDECTERC      AS IDRUBRI' +
        'CA, '#39'IDRUBDECTERC'#39'      AS NOME, 1 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDECTERCDEVOL AS IDRUBRI' +
        'CA, '#39'IDRUBDECTERCDEVOL'#39' AS NOME, 1 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDECTERCATRA  AS IDRUBRI' +
        'CA, '#39'IDRUBDECTERCATRA'#39'  AS NOME, 1 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBRICAATRASO   AS IDRUBRI' +
        'CA, '#39'IDRUBRICAATRASO'#39'   AS NOME, 0 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBRICADEVOLUC  AS IDRUBRI' +
        'CA, '#39'IDRUBRICADEVOLUC'#39'  AS NOME, 0 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBADIANT       AS IDRUBRI' +
        'CA, '#39'IDRUBADIANT'#39'       AS NOME, 0 AS ABONO, 0 AS ACAO, 1 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDEVOLADIANT  AS IDRUBRI' +
        'CA, '#39'IDRUBDEVOLADIANT'#39'  AS NOME, 0 AS ABONO, 0 AS ACAO, 1 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDEVADIANT13  AS IDRUBRI' +
        'CA, '#39'IDRUBDEVADIANT13'#39'  AS NOME, 1 AS ABONO, 0 AS ACAO, 1 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBADIANT13     AS IDRUBRI' +
        'CA, '#39'IDRUBADIANT13'#39'     AS NOME, 1 AS ABONO, 0 AS ACAO, 1 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBACJUD        AS IDRUBRI' +
        'CA, '#39'IDRUBACJUD'#39'        AS NOME, 0 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBATRACJUD     AS IDRUBRI' +
        'CA, '#39'IDRUBATRACJUD'#39'     AS NOME, 0 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDEVACJUD     AS IDRUBRI' +
        'CA, '#39'IDRUBDEVACJUD'#39'     AS NOME, 0 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDADACJUD     AS IDRUBRI' +
        'CA, '#39'IDRUBDADACJUD'#39'     AS NOME, 0 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBDEVADTACJUD  AS IDRUBRI' +
        'CA, '#39'IDRUBDEVADTACJUD'#39'  AS NOME, 0 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUB13ACJUD      AS IDRUBRI' +
        'CA, '#39'IDRUB13ACJUD'#39'      AS NOME, 0 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUB13ATRACJUD   AS IDRUBRI' +
        'CA, '#39'IDRUB13ATRACJUD'#39'   AS NOME, 1 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUB13DEVACJUD   AS IDRUBRI' +
        'CA, '#39'IDRUB13DEVACJUD'#39'   AS NOME, 1 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUB13DESCACJUD  AS IDRUBRI' +
        'CA, '#39'IDRUB13DESCACJUD'#39'  AS NOME, 1 AS ABONO, 1 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUB13DVADTACJUD AS IDRUBRI' +
        'CA, '#39'IDRUB13DVADTACJUD'#39' AS NOME, 1 AS ABONO, 1 AS ACAO, 1 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBACERTO       AS IDRUBRI' +
        'CA, '#39'IDRUBACERTO'#39'       AS NOME, 0 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBACERTODECT   AS IDRUBRI' +
        'CA, '#39'IDRUBACERTODECT'#39'   AS NOME, 1 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV UNION'
      
        'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDRUBRICA         AS IDRUBRI' +
        'CA, '#39'IDRUBRICA'#39'         AS NOME, 0 AS ABONO, 0 AS ACAO, 0 AS PRO' +
        'VISORIO FROM CONTPREV'
      ') CP'
      
        'INNER JOIN CONTRIBUICAO C ON CP.IDCONTRIBUICAO = C.IDCONTRIBUICA' +
        'O '
      
        'INNER JOIN TPCONTRIBUICAO TC ON TC.IDTPCONTRIBUICAO = C.IDTPCONT' +
        'RIBUICAO AND TC.FLGDEFICIT = 1'
      'INNER JOIN PROVDESC PD ON PD.IDPROVENTO = CP.IDRUBRICA'
      'WHERE CP.IDRUBRICA IS NOT NULL'
      
        'GROUP BY CP.IDCONTRIBUICAO, CP.IDRUBRICA, PD.CODPROVDESC, PD.DES' +
        'CRICAO')
    ValidateWithMask = True
    Left = 184
    Top = 568
  end
  object qryRubricasDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  HST.MES,'
      '  HST.IDPESSOA,'
      '  PRD.CODIRRFDARF,'
      
        '  DECODE(PRD.FLGDESCONTO,0,HST.VALORPROVENTO,NULL) VALORPROVENTO' +
        ','
      
        '  DECODE(PRD.FLGDESCONTO,1,HST.VALORPROVENTO,NULL) VALORDESCONTO' +
        ','
      
        '  TO_CHAR(DECODE(PRD.FLGDESCONTO,1,NULL,2, DECODE(HST.VALORRECEB' +
        'IDO-HST.VALORPROVENTO,0,'
      
        '                                           DECODE(HST.VALORINFO,' +
        '0,NULL,HST.VALORINFO||'#39' (I)'#39'),'
      
        '                                           HST.VALORRECEBIDO-HST' +
        '.VALORPROVENTO||'#39' (R)'#39')))'
      '  INFORMATIVO,'
      '  PRD.FLGDESCONTO,'
      '  PRD.FLGIRRF,'
      '  /*PRD.FLGSALFAMILIA*/0 AS FLGSALFAM,     -- SOL 191668    '
      '  HST.CODIRRFDARF,'
      '  PRD.IDPROVENTO,'
      '  HST.SEQRUBRICA AS ORDEM,'
      '  PRD.CODPROVDESC AS CODRUBRICA ,'
      '  PRD.DESCRPROVDESC AS RUBRICA,'
      '  HST.PARCELAS,'
      '  DECODE(HST.FLGTIPODESC,'#39'Y'#39','#39'ORDEM'#39',NULL) AS  ORDEM,'
      '  DECODE(HST.FONTEPAGADORA,1,'#39'FUND'#39','#39'INSS'#39') AS FONTEPAGADORA,'
      '  HST.Idperfilinvest,'
      
        '  TRIM(PE.NOME || '#39' - '#39' ||cast(PE.IDPLANPREVCONTAB as varchar(10' +
        '))) as NOMEPLANO,'
      '   0 as VALORINFO,'
      '  0 as VLRPROVENTO,'
      ' 0 as IDPLANOCONTABIL'
      ''
      'FROM'
      '  PREVIA HST,'
      '  PROVDESC PRD,'
      '  PERFILINVEST PE'
      ''
      ''
      'WHERE'
      '  (HST.MESCOBRANCA = '#39'2002/02'#39')     AND'
      '  (HST.IDTITULAR   = 386019)        AND'
      '  (HST.IDPESSOA    = 386019)        AND'
      '  (PRD.IDPROVENTO  = HST.IDRUBRICA) AND'
      '  (PRD.FLGESPECIAL <> 2) AND'
      '  (HST.IDPERFILINVEST = PE.IDPERFILINVEST)'
      ''
      ''
      'ORDER BY'
      '  HST.SEQRUBRICA,'
      '  PRD.FLGIRRF,'
      '  HST.CODIRRFDARF'
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
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0'
      'FLGSALFAM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 258
    Top = 568
  end
  object updDetProcjudicial: TUpdateSQL
    Left = 216
    Top = 296
  end
  object qryRubricaEqua: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDRUBRICA FROM '
      '('
      'WITH EQUA AS('
      'SELECT CP.IDRUBDECTERC,      CP.IDRUBDECTERCATRA,'
      '       CP.IDRUBDECTERCDEVOL, CP.IDRUBRICA,'
      '       CP.IDRUBRICAATRASO,   CP.IDRUBRICADEVOLUC,'
      '       CP.IDRUBADIANT,       CP.IDRUBDEVOLADIANT,'
      '       CP.IDRUBADIANT13,     CP.IDRUBDEVADIANT13'
      'FROM   CONTRIBUICAO C, CONTPREV CP, TPCONTRIBUICAO TC'
      'WHERE   (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)'
      'AND ( C.IDTPCONTRIBUICAO = TC.IDTPCONTRIBUICAO)'
      'AND (TC.FLGDEFICIT = 1)'
      ')'
      'SELECT IDRUBDECTERC AS IDRUBRICA  FROM EQUA UNION'
      'SELECT IDRUBDECTERCATRA  FROM EQUA UNION'
      'SELECT IDRUBDECTERCDEVOL  FROM EQUA UNION'
      'SELECT IDRUBRICA  FROM EQUA UNION'
      'SELECT IDRUBRICAATRASO  FROM EQUA UNION'
      'SELECT IDRUBRICADEVOLUC  FROM EQUA UNION'
      'SELECT IDRUBADIANT  FROM EQUA UNION'
      'SELECT IDRUBDEVOLADIANT  FROM EQUA UNION'
      'SELECT IDRUBADIANT13  FROM EQUA UNION'
      'SELECT IDRUBDEVADIANT13  FROM EQUA '
      ')'
      'WHERE IDRUBRICA IS NOT NULL')
    ValidateWithMask = True
    Left = 384
    Top = 536
  end
  object qryRubricaRateioReinf: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT C.IDRUBRICA'
      'FROM CONJUNTORUBXRUB C'
      
        'INNER JOIN CM.CONJUNTORUBRICA CR ON C.IDCONJUNTORUBRICA = CR.IDC' +
        'ONJUNTORUBRICA'
      'WHERE CR.CODIGO= '#39'REINFRUB'#39)
    ValidateWithMask = True
    Left = 504
    Top = 512
  end
  object qryReinf: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT C.IDRUBRICA'
      'FROM CONJUNTORUBXRUB C'
      
        'INNER JOIN CM.CONJUNTORUBRICA CR ON C.IDCONJUNTORUBRICA = CR.IDC' +
        'ONJUNTORUBRICA'
      'WHERE CR.CODIGO= '#39'1'#39)
    ValidateWithMask = True
    Left = 608
    Top = 480
  end
end
