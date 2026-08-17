object dtmFolha: TdtmFolha
  OldCreateOrder = True
  Left = 107
  Top = 84
  Height = 479
  Width = 741
  object qryIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ALIQUOTA_IRRF, PARCDEDUZIRRF'
      'FROM'
      '  IRRF'
      'WHERE'
      '  (FAIXA_IRRF >=  :pBase) AND'
      '  (ROWNUM      = 1)')
    ValidateWithMask = True
    Left = 27
    Top = 7
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pBase'
        ParamType = ptUnknown
      end>
  end
  object qryEscreveRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 111
    Top = 7
  end
  object qryIntegraRubXPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSJUR, IDRUBRICA, IDPLANOPREV, TIPCODIGO, CODTIPRECDES,'
      '  RECPAG, IDPESSOA, CODTIPDOC, CODPORTFORMA, CODCENTRORESPON,'
      '  CODSUBCONTA, CODCENTROCUSTOD, IDEMPRESA, CODCENTROCUSTOC,'
      '  PLACONTAD,PLANO,PLACONTAC,UNIDNEGOC,IDEMPRESAPROP'
      'FROM'
      '  RUBRICAXPLANO'
      'WHERE'
      '  (IDRUBRICA   = :pIdRubrica) AND'
      '  (IDPESSJUR   = :pIdPessJur) AND'
      '  (IDPLANOPREV = :pIdPlanoPrev)')
    ValidateWithMask = True
    Left = 146
    Top = 199
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdRubrica'
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
      end>
  end
  object qryIntegraPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  IDPLANOPREV,RECPAG,IDEMPRESAPROP,CODTIPRECDES,IDFUNDACAO,CODTI' +
        'PDOC'
      'FROM'
      '  PLANPREV'
      'WHERE'
      '  (IDPLANOPREV = :pIdPlanoPrev)')
    ValidateWithMask = True
    Left = 299
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryIntegraIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  IDPESSOA, CODSUBCONTAIRRF, CODTIPRECDESIRRF, IDEMPRESAPROPIRRF' +
        ', RECPAGIRRF,'
      
        '  CODCENTROCUSTODIRRF, IDEMPRESAIRRF, TIPCODIGOIRRF, CODTIPDOCIR' +
        'RF,'
      
        '  CODCENTROCUSTOCIRRF, CODPORTADORFORMAIRRF, PLACONTADIRRF, PLAN' +
        'OIRRF,'
      
        '  UNIDNEGOCIRRF, PLACONTACIRRF, CODCENTRORESPONIRRF, IDFAVORECID' +
        'OIRRF'
      'FROM'
      '  FUNDACAO'
      'WHERE'
      '  (IDPESSOA   = :pIdFundacao)')
    ValidateWithMask = True
    Left = 383
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdFundacao'
        ParamType = ptUnknown
      end>
  end
  object qryCodProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODPROVDESC'
      'FROM'
      '  RUBRICAXPESS'
      'WHERE'
      '  (IDRUBRICA = :pIdRubrica) AND'
      '  (IDPESSOA  = :pIdPessJur)')
    ValidateWithMask = True
    Left = 27
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdRubrica'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end>
  end
  object qryDescFolha1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TD.*, PD.FLGIRRF, PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF,'
      '  PD.NUMPRIORIDADE, PATRO.CODMOEDA'
      'FROM'
      '  TMPDESC TD, PROVDESC PD, PATRO'
      'WHERE'
      '  (TD.IDPESSOA     = :pIdPessoa) AND'
      '  (TD.IDPESSJUR    = :pIdPessJur) AND'
      '  (TD.IDPLANOPREV  = :pIdPlanoPrev) AND'
      '  (TD.MESCOBRANCA  = :pMesRef) AND'
      '  (TD.FLGDESCFOLHA = :pFlgDescFolha) AND'
      '  (TD.FLGDESCONTO  = 1) AND'
      '  (TD.FLGTIPODESC IN ('#39'P'#39','#39'A'#39','#39'E'#39')) AND'
      '  (TD.IDPROVENTO   = PD.IDPROVENTO) AND'
      '  (TD.IDPESSJUR    = PATRO.IDPESSOA)'
      'ORDER BY'
      '  PD.NUMPRIORIDADE, TD.IDPROVENTO')
    ValidateWithMask = True
    Left = 388
    Top = 87
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
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFlgDescFolha'
        ParamType = ptUnknown
      end>
  end
  object qryDescFolha2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 484
    Top = 87
  end
  object qryUpdDescFolha1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 388
    Top = 75
  end
  object qryExcluiRub1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 27
    Top = 118
  end
  object qryUpdExcluiRub: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 27
    Top = 177
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 111
    Top = 63
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 215
    Top = 17
  end
  object qryUpdReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 215
    Top = 4
  end
  object qryRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RI.IDPESSOA,RI.IDEMPRESA,RI.IDRUBRICA,RI.NUMOCORRENCIAS,R' +
        'I.IDFAVORECIDO,'
      
        '       RI.IDREGRACALCULO,RI.VALORRUBRICA,RI.ANOMESINICIO,RI.FLGP' +
        'ERMANENTE,RI.PARCELAS,'
      '       PD.FLGIRRF, RP.CODPROVDESC,'
      '       P.NOME, PD.DESCRICAO, F.MATRICULA'
      
        'FROM   CM.RUBRICAINDIV RI, CM.PROVDESC PD, CM.RUBRICAXPESS RP, C' +
        'M.PESSOA P,'
      '       CM.FUNCIONARIO F '
      'WHERE  RI.IDPESSOA = :pIdPessoa  AND'
      '       RI.ANOMESINICIO <= :pMes  AND'
      '       RI.IDEMPRESA = :pIdPessJur AND'
      '       ((RI.NUMOCORRENCIAS < RI.PARCELAS AND'
      '         RI.FLGPERMANENTE = 0) OR'
      '        (RI.FLGPERMANENTE = 1)) AND'
      '       PD.FLGDESCONTO = :pFlgDesconto AND'
      '       F.IDEMPRESA = :pIdPessJur AND'
      '       RP.IDPESSOA = RI.IDEMPRESA AND'
      '       RI.IDRUBRICA = PD.IDPROVENTO AND'
      '       RI.IDPESSOA = P.IDPESSOA AND'
      '       RI.IDPESSOA = F.IDPESSOA AND'
      '       RP.IDRUBRICA = RI.IDRUBRICA')
    ValidateWithMask = True
    Left = 218
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMes'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFlgDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end>
  end
  object qryUpdRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '  RUBRICAINDIV'
      'SET'
      '  NUMOCORRENCIAS = :pNumOcorrencias'
      'WHERE'
      '  (IDPESSOA  = :pIdPessoa) AND'
      '  (IDEMPRESA = :pIdEmpresa) AND'
      '  (IDRUBRICA = :pIdRubrica)'
      ' ')
    ValidateWithMask = True
    Left = 218
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNumOcorrencias'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdEmpresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdRubrica'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiRub2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TD.*, PD.FLGIRRF, PD.FLGINSS, PD.FLGFGTS'
      'FROM'
      '  TMPDESC TD, PROVDESC PD'
      'WHERE'
      '  (TD.IDPESSOA     = :pIdPessoa) AND'
      '  (TD.IDPESSJUR    = :pIdPessJur) AND'
      '  (TD.IDPLANOPREV  = :pIdPlanoPrev) AND'
      '  (TD.MESCOBRANCA  = :pMes) AND'
      '  (TD.CODPROVDESC  = :pCodProvDesc) AND'
      '  (TD.DATARECEBIMENTO IS NOT NULL) AND'
      '  (TD.VALORRECEBIDO   IS NOT NULL) AND'
      '  (TD.FLGDESCFOLHA = :pFlgDescFolha) AND'
      '  (TD.FLGDESCONTO  = 1) AND'
      '  (TD.IDPROVENTO   = PD.IDPROVENTO)'
      'ORDER BY'
      '  TD.NUMPRIORIDADE DESC')
    ValidateWithMask = True
    Left = 114
    Top = 117
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
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCodProvDesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFlgDescFolha'
        ParamType = ptUnknown
      end>
  end
  object qryUpdDescFolha2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 484
    Top = 75
  end
  object qryValeTransporte: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  SEQRUBRICAINDIV, IDPESSOA, IDEMPRESA, IDRUBRICA,'
      '  NUMOCORRENCIAS, ANOMESINICIO, FLGPERMANENTE,'
      '  VALORRUBRICA, PARCELAS, FLGTPRUBMANUT, IDREGRACALCULO'
      'FROM'
      '  RUBRICAINDIV')
    UpdateObject = updValeTransporte
    ValidateWithMask = True
    Left = 256
    Top = 160
  end
  object updValeTransporte: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  NUMOCORRENCIAS = :NUMOCORRENCIAS,'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  VALORRUBRICA = :VALORRUBRICA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  FLGPERMANENTE = :FLGPERMANENTE,'
      '  PARCELAS = :PARCELAS,'
      '  FLGTPRUBMANUT = :FLGTPRUBMANUT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  NUMOCORRENCIAS = :OLD_NUMOCORRENCIAS and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV and'
      '  IDREGRACALCULO = :OLD_IDREGRACALCULO and'
      '  VALORRUBRICA = :OLD_VALORRUBRICA and'
      '  ANOMESINICIO = :OLD_ANOMESINICIO and'
      '  FLGPERMANENTE = :OLD_FLGPERMANENTE and'
      '  PARCELAS = :OLD_PARCELAS and'
      '  FLGTPRUBMANUT = :OLD_FLGTPRUBMANUT')
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      '  (IDPESSOA, IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS, '
      'SEQRUBRICAINDIV, IDREGRACALCULO, '
      '   VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, PARCELAS, '
      'FLGTPRUBMANUT)'
      'values'
      '  (:IDPESSOA, :IDEMPRESA, :IDRUBRICA, :NUMOCORRENCIAS, '
      ':SEQRUBRICAINDIV, '
      
        '   :IDREGRACALCULO, :VALORRUBRICA, :ANOMESINICIO, :FLGPERMANENTE' +
        ', '
      ':PARCELAS, '
      '   :FLGTPRUBMANUT)')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  NUMOCORRENCIAS = :OLD_NUMOCORRENCIAS and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV and'
      '  IDREGRACALCULO = :OLD_IDREGRACALCULO and'
      '  VALORRUBRICA = :OLD_VALORRUBRICA and'
      '  ANOMESINICIO = :OLD_ANOMESINICIO and'
      '  FLGPERMANENTE = :OLD_FLGPERMANENTE and'
      '  PARCELAS = :OLD_PARCELAS and'
      '  FLGTPRUBMANUT = :OLD_FLGTPRUBMANUT')
    Left = 256
    Top = 147
  end
  object qryUpdDescFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '  TMPDESC'
      'SET'
      '  VALORRECEBIDO = :pValor,'
      '  VALOR                   = :pValor,'
      '  SITENVIO             = '#39'2'#39','
      '  DATARECEBIMENTO = SYSDATE '
      'WHERE'
      '  (IDLOTE = :pIdLote) AND'
      '  (ORDEM  = :pOrdem)')
    ValidateWithMask = True
    Left = 300
    Top = 86
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pValor'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pValor'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pOrdem'
        ParamType = ptUnknown
      end>
  end
  object qryDescFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  TD.MESREFERENCIA,TD.IDTITULAR AS IDPESSOA,TD.FLGTIPODESC,TD.VA' +
        'LOR,'
      '  TD.IDPESSJUR,TD.IDPROVENTO,TD.IDPLANOPREV,TD.ORDEM,'
      '  TD.CODPROVDESC,TD.REFERENCIA,TD.IDFUNDACAO,TD.IDLOTE,'
      '  PD.FLGSALFAMILIA, PD.FLGFERIAS, PD.FLGDECIMOTERCEIRO,'
      '  PD.NUMPRIORIDADE,PD.FLGRESCISAO,PD.IDREGRA,'
      '  TD.VALORRECEBIDO, TD.MESCOBRANCA, TD.VALORBASE1,'
      '  TD.NUMPARCELAS, TD.PARCELA'
      'FROM'
      '  TMPDESC TD, PROVDESC PD'
      'WHERE'
      '  (TD.IDTITULAR = :pIdPessoa) '
      'AND      (TD.MESCOBRANCA = :pMesRef)'
      'AND      (TD.FLGDESCFOLHA = :pFlgDescFolha)'
      'AND      (NVL(TD.VALORRECEBIDO,0) = 0) '
      'AND      ((TD.FLGTIPODESC = '#39'P'#39' AND'
      '              TD.FLGATRASODEVOL = '#39'N'#39' AND'
      '               :pValorTaxa = '#39'T'#39') OR'
      '               ((TD.FLGTIPODESC <> '#39'P'#39' OR '
      '                TD.FLGATRASODEVOL <> '#39'N'#39') AND '
      '               :pValorTaxa = '#39'V'#39'))'
      'AND      (TD.FLGDESCONTO = 1)'
      'AND      (TD.FLGTIPODESC IN ('#39'P'#39','#39'A'#39','#39'E'#39','#39'C'#39'))'
      'AND      (PD.IDPROVENTO=TD.IDPROVENTO)'
      'ORDER BY'
      
        '  PD.NUMPRIORIDADE, TD.MESREFERENCIA,TD.CODPROVDESC, TD.REFERENC' +
        'IA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 300
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFlgDescFolha'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pValorTaxa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pValorTaxa'
        ParamType = ptUnknown
      end>
  end
  object qryAuxFormaCalc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 391
    Top = 151
  end
end
