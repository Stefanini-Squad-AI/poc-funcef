object dtmContribInterf: TdtmContribInterf
  OldCreateOrder = True
  Left = 178
  Top = 163
  Height = 479
  Width = 741
  object qryValSal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   VALORPROVENTO'
      'FROM     HISTRUBSAL'
      'WHERE    (IDPESSOA = :pIdPessoa)'
      'AND      (IDPESSJUR = :pIdPessJur)'
      'AND      (IDRUBRICA = :pIdRubrica)'
      'AND      (MES <= :pMesRef)'
      'ORDER BY MES DESC'
      '')
    ValidateWithMask = True
    Left = 21
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdRubrica'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end>
    object qryValSalVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
    end
  end
  object qryValSalManut: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SALMANTIDO'
      'FROM   PARTPREVPLAN'
      'WHERE  (IDPESSJUR = :pIdPessJur)'
      'AND    (IDPLANOPREV = :pIdPlanoPrev)'
      'AND    (IDPESSOA = :pIdPessoa)'
      'AND    (SEQPROPOSTA = :pSeqProposta)'
      '')
    ValidateWithMask = True
    Left = 27
    Top = 69
    ParamData = <
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
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end>
    object qryValSalManutSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
      Origin = 'PARTPREVPLAN.SALMANTIDO'
    end
  end
  object qryElegPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATADEMISSAO'
      'FROM   ELEGPATRO'
      'WHERE  (IDPESSOA = :pIdPessoa)'
      'AND    (IDPESSJUR = :pIdPessJur)'
      '')
    ValidateWithMask = True
    Left = 99
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end>
    object qryElegPatroDATADEMISSAO: TDateTimeField
      FieldName = 'DATADEMISSAO'
      Origin = 'ELEGPATRO.DATADEMISSAO'
    end
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CPP.IDCONTRIBPAI,CPART.VALORBASE1,CPART.VALORBASE2,CPART.' +
        'VALORBASE3,'
      
        '       CPP.IDCONTRIBPAI2,CPP.IDCONTRIBPAI3,CASSOC1.FLGPAGADOR AS' +
        ' FLGPAGADORASSOC1,'
      
        '       CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR' +
        ' AS FLGPAGADORASSOC3'
      
        'FROM   CONTRIBUICAO C,CONTPREV CPP,CONTPREV CASSOC1,CONTPREV CAS' +
        'SOC2,'
      '       CONTPREV CASSOC3,CONTRIBPREVPARTP CPART'
      'WHERE  (C.IDCONTRIBUICAO = :piIdContribuicao)'
      'AND    (CPP.IDPLANOPREV = :piIdPlanoPrev)'
      'AND    (CPP.IDCONTRIBUICAO = :piIdContribuicao)'
      'AND    (CPART.IDPESSJUR = :piIdPessJur)'
      'AND    (CPART.IDPLANOPREV = :piIdPlanoPrev)'
      'AND    (CPART.IDPESSOA = :piIdPessoa)'
      'AND    (CPART.SEQPROPOSTA = :piSeqProposta)'
      'AND    (CPART.IDCONTRIBUICAO = :piIdContribuicao)'
      'AND    (CASSOC1.IDPLANOPREV(+) = :piIdPlanoPrev)'
      'AND    (CPP.IDCONTRIBPAI = CASSOC1.IDCONTRIBUICAO(+))'
      'AND    (CASSOC2.IDPLANOPREV(+) = :piIdPlanoPrev)'
      'AND    (CPP.IDCONTRIBPAI2 = CASSOC2.IDCONTRIBUICAO(+))'
      'AND    (CASSOC3.IDPLANOPREV(+) = :piIdPlanoPrev)'
      'AND    (CPP.IDCONTRIBPAI3 = CASSOC3.IDCONTRIBUICAO(+))'
      'ORDER BY CPP.ORDEMCALCULO'
      '')
    ValidateWithMask = True
    Left = 99
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piSeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end>
    object qryContribIDCONTRIBPAI: TFloatField
      FieldName = 'IDCONTRIBPAI'
    end
    object qryContribVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryContribVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryContribVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qryContribIDCONTRIBPAI2: TFloatField
      FieldName = 'IDCONTRIBPAI2'
    end
    object qryContribIDCONTRIBPAI3: TFloatField
      FieldName = 'IDCONTRIBPAI3'
    end
    object qryContribFLGPAGADORASSOC1: TStringField
      FieldName = 'FLGPAGADORASSOC1'
      Size = 1
    end
    object qryContribFLGPAGADORASSOC2: TStringField
      FieldName = 'FLGPAGADORASSOC2'
      Size = 1
    end
    object qryContribFLGPAGADORASSOC3: TStringField
      FieldName = 'FLGPAGADORASSOC3'
      Size = 1
    end
  end
  object qryOpContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   H.VALOR, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3'
      'FROM     TMPDESC H, CONTRIBPREVPARTP C'
      'WHERE    (C.IDPESSJUR = :pIdPessJur)'
      'AND      (C.IDPLANOPREV  = :pIdPlanoPrev)'
      'AND      (C.IDPESSOA = :pIdPessoa)'
      'AND      (C.SEQPROPOSTA = :pSeqProposta)'
      'AND      (C.IDCONTRIBUICAO = :pIdContribAssoc)'
      'AND      (H.SEQPROPOSTA(+) = :pSeqProposta)'
      'AND      (H.MESREFERENCIA(+) <= :pMesRef)'
      'AND      (H.IDPESSJUR(+) = :pIdPessJur)'
      'AND      (H.IDPLANOPREV(+) = :pIdPlanoPrev)'
      'AND      (H.IDPESSOA(+) = :pIdPessoa)'
      'AND      (H.IDDESCONTO(+) = :pIdContribAssoc)'
      'ORDER BY H.MESREFERENCIA DESC'
      '')
    ValidateWithMask = True
    Left = 168
    Top = 9
    ParamData = <
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
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdContribAssoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
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
        Name = 'pIdContribAssoc'
        ParamType = ptUnknown
      end>
    object qryOpContribVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryOpContribVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryOpContribVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryOpContribVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CTRLINTERFACE'
      '(IDLOTE,'
      ' IDPESSOA,'
      ' MESREFERENCIA,'
      ' TIPO,'
      ' DESCRICAO,'
      ' FLGATRASODEVOL,'
      ' FLGPREPARADO,'
      ' FLGIDATMP,'
      ' FLGVOLTATMP,'
      ' FLGIDAINTERFACE,'
      ' FLGVOLTAINTERFACE,'
      ' DATAPREPARO,'
      ' DATAIDATMP,'
      ' DATAVOLTATMP,'
      ' DATAIDAINTERFACE,'
      ' DATAVOLTAINTERFA)'
      'VALUES'
      '(:IDLOTE,'
      ' :IDPESSOA,'
      ' :MESREFERENCIA,'
      ' :TIPO,'
      ' :DESCRICAO,'
      ' :FLGATRASODEVOL,'
      ' :FLGPREPARADO,'
      ' :FLGIDATMP,'
      ' :FLGVOLTATMP,'
      ' :FLGIDAINTERFACE,'
      ' :FLGVOLTAINTERFACE,'
      ' :DATAPREPARO,'
      ' :DATAIDATMP,'
      ' :DATAVOLTATMP,'
      ' :DATAIDAINTERFACE,'
      ' :DATAVOLTAINTERFA)')
    ValidateWithMask = True
    Left = 168
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGATRASODEVOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPREPARADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGIDATMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGVOLTATMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGIDAINTERFACE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGVOLTAINTERFACE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPREPARO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAIDATMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVOLTATMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAIDAINTERFACE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVOLTAINTERFA'
        ParamType = ptUnknown
      end>
  end
  object qryInsTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO TMPDESC (IDLOTE,IDFUNDACAO,IDPESSJUR,IDPLANOPREV,IDT' +
        'ITULAR,'
      'IDPESSOA,SEQPROPOSTA,IDMOTIVO,IDDESCONTO,IDPROVENTO,CODPROVDESC,'
      'MESREFERENCIA,MESCOBRANCA,FLGTIPODESC,VALOR,VALORRECEBIDO,'
      'DATACOBRANCA,DATARECEBIMENTO,FLGATRASODEVOL,'
      'FLGDESCONTO,FLGDESCFOLHA,FLGEXISTEHST,DATAREFERENCIA,'
      'DESCRICAO,MATRICULA,REFERENCIA,SISTORIGEM,SITENVIO,'
      
        'NODOCUMENTO,COMPLDOCUMENTO,IDFAVORECIDO,IDEMPCOBRANCA, IDMODULO,' +
        ' IDEMPRESAPROP)'
      'VALUES (:IDLOTE,:IDFUNDACAO,:IDPESSJUR,:IDPLANOPREV,:IDTITULAR,'
      
        ':IDPESSOA,:SEQPROPOSTA,:IDMOTIVO,:IDDESCONTO,:IDPROVENTO,:CODPRO' +
        'VDESC,'
      ':MESREFERENCIA,:MESCOBRANCA,:FLGTIPODESC,:VALOR,:VALORRECEBIDO,'
      ':DATACOBRANCA,:DATARECEBIMENTO,:FLGATRASODEVOL,'
      ':FLGDESCONTO,:FLGDESCFOLHA,:FLGEXISTEHST,:DATAREFERENCIA,'
      ':DESCRICAO,:MATRICULA,:REFERENCIA,:SISTORIGEM,:SITENVIO,'
      
        ':NODOCUMENTO,:COMPLDOCUMENTO,:IDFAVORECIDO,:IDEMPCOBRANCA, 32, :' +
        'IDEMPRESAPROP)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 242
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
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
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDDESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODPROVDESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGTIPODESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORRECEBIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATACOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATARECEBIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGATRASODEVOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGDESCFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGEXISTEHST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SISTORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SITENVIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NODOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFAVORECIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
end
