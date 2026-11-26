object dtmFolha: TdtmFolha
  OldCreateOrder = True
  Left = 65532
  Top = 65532
  Height = 608
  Width = 808
  object qryIntegraRubXPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RP.IDPESSJUR,RP.IDRUBRICA,RP.IDPLANOPREV,RP.TIPCODIGO,RP.' +
        'CODTIPRECDES,'
      
        '       RP.RECPAG,RP.IDPESSOA,RP.CODTIPDOC,RP.CODPORTFORMA,RP.COD' +
        'CENTRORESPON,'
      
        '       RP.CODSUBCONTA,RP.CODCENTROCUSTOD,RP.IDEMPRESA,RP.CODCENT' +
        'ROCUSTOC,'
      
        '       RP.PLACONTAD,RP.PLANO,RP.PLACONTAC,RP.UNIDNEGOC,RP.IDEMPR' +
        'ESAPROP'
      'FROM   RUBRICAXPLANO RP'
      'WHERE  (RP.IDPESSJUR   = :pIdPessJur)'
      'AND    (RP.IDRUBRICA   = :pIdRubrica)'
      'AND    (RP.IDPLANOPREV = :pIdPlanoPrev)')
    ValidateWithMask = True
    Left = 341
    Top = 224
    ParamData = <
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
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryIntegraPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPLANOPREV,P.RECPAG,P.IDEMPRESAPROP,P.CODTIPRECDES,P.I' +
        'DFUNDACAO,P.CODTIPDOC'
      'FROM   PLANPREV P'
      'WHERE  (P.IDPLANOPREV = :pIdPlanoPrev)')
    ValidateWithMask = True
    Left = 341
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryCodProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.CODPROVDESC'
      'FROM   RUBRICAXPESS RP'
      'WHERE  (RP.IDPESSOA = :pIdPessJur) '
      'AND (RP.IDRUBRICA = :pIdRubrica)')
    ValidateWithMask = True
    Left = 529
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdRubrica'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 142
    Top = 23
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BR.IDPLANOPREV,BR.NUMORDEM,BR.IDBENEFICIO,BR.IDTIPORESERV' +
        'A,BR.IDREGRAABATERESE,'
      
        '       P.NOME, B.NOME AS BENEFICIO, RPL.NOME AS RESERVA, RPL.IND' +
        'ICEREAJUSTE,'
      
        '       RP.IDTIPORESERVA,RP.IDPLANOPREV,RP.IDPESSJUR,RP.IDPESSOA,' +
        'RP.DATAREFERENCIASA,'
      
        '       RP.VALORRESERVA,RP.PERCENTUALSAQUE,EP.MATRICULA, PPP.INSC' +
        'RICAONUMERO,PP.IDFUNDACAO'
      
        'FROM BENEFRESERVA BR, RESERVAPART RP, PARTPREVPLAN PPP,  RESERVA' +
        'XPLANO RPL,'
      '     PLANPREV PP, BENEFICIO B,  PESSOA P, ELEGPATRO EP'
      'WHERE (BR.IDPLANOPREV = :IdPlanoPrev)'
      'AND (BR.IDBENEFICIO = :IdBeneficio)'
      'AND (RP.IDPESSJUR = :IdPessJur)'
      'AND (RP.IDPLANOPREV = :IdPlanoPrev)'
      'AND (RP.IDPESSOA = :IdPessoa)'
      'AND (RP.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND (RP.IDTIPORESERVA = BR.IDTIPORESERVA)'
      'AND (PPP.IDPESSJUR = :IdPessJur)'
      'AND (PPP.IDPLANOPREV = :IdPlanoPrev)'
      'AND (PPP.IDPESSOA = :IdPessoa)'
      'AND (PPP.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND (RPL.IDPLANOPREV = :IdPlanoPrev)'
      'AND (RPL.IDTIPORESERVA = BR.IDTIPORESERVA)'
      'AND (PP.IDPLANOPREV = :IdPlanoPrev)'
      'AND (B.IDBENEFICIO = :IdBeneficio)'
      'AND (P.IDPESSOA = :IdPessoa)'
      'AND (EP.IDPESSJUR = :IdPessJur)'
      'AND (EP.IDPESSOA = :IdPessoa)'
      'ORDER BY BR.NUMORDEM'
      ' ')
    ValidateWithMask = True
    Left = 449
    Top = 23
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdBeneficio'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryUpdReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RESERVAPART RP'
      'SET    RP.VALORRESERVA = :Valor'
      'WHERE (RP.IDPESSJUR = :IdPessJur)'
      'AND   (RP.IDPLANOPREV = :IdPlanoPrev)'
      'AND   (RP.IDPESSOA = :IdPessoa)'
      'AND   (RP.SEQPROPOSTA = :SeqProposta)'
      'AND   (RP.IDTIPORESERVA = :IdTipoReserva)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 449
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdTipoReserva'
        ParamType = ptUnknown
      end>
  end
  object qryRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA'
      'FROM   RUBRICAINDIV'
      'WHERE  (IDPESSOA  = :IdPessoa)'
      'AND    (FLGTPRUBMANUT  = '#39'1'#39')'
      'UNION '
      'SELECT IDPESSOA'
      'FROM TMPDESC'
      'WHERE (IDPESSOA = :Idpessoa)'
      'AND   (FLGDESCONTO = 0)'
      'AND   (MESCOBRANCA = :MesCob)'
      'AND   (MESREFERENCIA = :MesRef)'
      '')
    ValidateWithMask = True
    Left = 46
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesCob'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end>
  end
  object qryUpdRubIndiv1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   RUBRICAINDIV '
      'SET '
      '   NUMOCORRENCIAS = NUMOCORRENCIAS+1 '
      'WHERE '
      '   IDPESSOA||IDRUBRICA||SEQRUBRICAINDIV IN ('
      '      SELECT R.IDPESSOA||R.IDRUBRICA||R.SEQRUBRICAINDIV'
      '      FROM PREVIA P, RUBRICAINDIV R  '
      '      WHERE  (P.FLGTIPODESC = '#39'Y'#39') '
      '      AND (P.IDPESSOA = R.IDPESSOA)'
      '      AND (R.NUMOCORRENCIAS < R.PARCELAS) AND '
      '      (R.FLGPERMANENTE = 0))'
      '      AND (P.IDLOTE IN :ILOTE)')
    ValidateWithMask = True
    Left = 46
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'ILOTE'
        ParamType = ptUnknown
      end>
  end
  object qryABNPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BPP.IDPESSJUR,BPP.IDPLANOPREV,BPP.IDPESSOA,BPP.IDBENEFICI' +
        'O,BPP.SEQPROPOSTA,'
      
        '       BPP.RECPAGABN,BPP.IDEMPRESAPROPABN,BPP.CODCENTROCUSTOCA,B' +
        'PP.CODCENTROCUSTODA,'
      
        '       BPP.PLACONTADABN,BPP.PLACONTACABN,BPP.PLANOABN,BPP.IDEMPR' +
        'ESAABN,BPP.UNIDNEGOCABN,'
      
        '       BPP.CODCENTRORESPONA,BPP.CODSUBCONTAABN,BPP.CODALTERACORR' +
        'ABN,BPP.CODALTERAJUROSABN,'
      
        '       BPP.CODTIPRECDESABN,BPP.TIPCODIGOABN,BPP.CODTIPDOCABN,BPP' +
        '.CODPORTFORMAABN'
      'FROM   BENEFPLANOPART BPP'
      'WHERE  (BPP.IDPESSOA = :pIdPessoa)'
      'AND    (BPP.IDBENEFICIO = :pIdBeneficio)'
      'AND    (BPP.SEQPROPOSTA = :pSeqProposta)'
      'AND    (BPP.IDPLANOPREV = :pIdPlanoPrev)'
      'AND    (BPP.IDPESSJUR = :pIdPessJur)'
      '')
    ValidateWithMask = True
    Left = 341
    Top = 419
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end>
  end
  object qryABNPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BPP.IDPESSJUR,BPP.IDPLANOPREV,BPP.IDBENEFICIO,BPP.RECPAGA' +
        'BN,BPP.IDEMPRESAPROPABN,'
      
        '       BPP.CODCENTROCUSTOCA,BPP.CODCENTROCUSTODA,BPP.PLACONTADAB' +
        'N,BPP.PLACONTACABN,'
      
        '       BPP.PLANOABN,BPP.IDEMPRESAABN,BPP.UNIDNEGOCABN,BPP.CODCEN' +
        'TRORESPONA,'
      
        '       BPP.CODSUBCONTAABN,BPP.CODALTERACORRABN,BPP.CODALTERAJURO' +
        'SABN,BPP.CODTIPRECDESABN,'
      '       BPP.TIPCODIGOABN,BPP.CODTIPDOCABN,BPP.CODPORTFORMAABN'
      'FROM   BENEFPLANPATRO BPP'
      'WHERE  (BPP.IDPLANOPREV = :pIdPlanoPrev)'
      'AND    (BPP.IDPESSJUR = :pIdPessJur)'
      'AND    (BPP.IDBENEFICIO = :pIdBeneficio)')
    ValidateWithMask = True
    Left = 341
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end>
  end
  object qryABNPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BPP.IDPLANOPREV,BPP.IDBENEFICIO,BPP.RECPAGABN,BPP.IDEMPRE' +
        'SAPROPABN,'
      
        '       BPP.CODCENTROCUSTOCA,BPP.CODCENTROCUSTODA,BPP.PLACONTADAB' +
        'N,BPP.PLACONTACABN,'
      
        '       BPP.PLANOABN,BPP.IDEMPRESAABN,BPP.UNIDNEGOCABN,BPP.CODCEN' +
        'TRORESPONA,'
      
        '       BPP.CODSUBCONTAABN,BPP.CODALTERACORRABN,BPP.CODALTERAJURO' +
        'SABN,BPP.CODTIPRECDESABN,'
      '       BPP.TIPCODIGOABN,BPP.CODTIPDOCABN,BPP.CODPORTFORMAABN'
      'FROM   BENEFPLANPREV BPP'
      'WHERE  (BPP.IDBENEFICIO = :pIdBeneficio)'
      'AND    (BPP.IDPLANOPREV = :pIdPlanoPrev)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 341
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object qryRubIndiv2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RI.IDPESSOA,RI.IDEMPRESA,RI.IDRUBRICA,RI.NUMOCORRENCIAS,R' +
        'I.IDFAVORECIDO,'
      
        '       RI.IDREGRACALCULO,RI.VALORRUBRICA,RI.ANOMESINICIO,RI.FLGP' +
        'ERMANENTE,RI.PARCELAS,'
      
        '       PD.FLGIRRF, PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF, RP' +
        '.CODPROVDESC,'
      '       P.NOME, PD.DESCRICAO, PD.NUMPRIORIDADEFB,'
      
        '       DECODE(RA.IDPESSOA,NULL,PD.FLGDESCPENSAO,RA.FLGINCIDE) AS' +
        ' FLGDESCPENSAO,'
      
        '       PFI.DATANASC, PFI.NUMDEPIRRF, RI.DATAINICIO, RI.FLGBASEPA' +
        ','
      
        '       RI.DATAFINAL, decode(ri.flgpermanente,0,RI.ANOMESREF,:pMe' +
        'sCob) AS ANOMESREF,'
      '       RI.SEQRUBRICAINDIV, NVL(RI.FLGUSAABONO,0) FLGUSAABONO,'
      
        '       RI.FLGPENSAOALIM AS FLGPENSAOALIM, PD.CODIRRFDARF CODIRRF' +
        'DARF'
      
        'FROM RUBRICAINDIV RI, PROVDESC PD, RUBRICAXPESS RP, RUBXPENSAOAL' +
        'IM RA, PESSOA P,'
      '     PESSOAFISICA PFI'
      'WHERE (RI.IDPESSOA = :pIdPessoa)'
      'AND (RI.ANOMESINICIO <= :pMesCob)'
      'AND (RI.IDEMPRESA = :pIdFundacao)'
      'AND (RI.FLGTPRUBMANUT = '#39'1'#39')'
      
        'AND ((TO_CHAR(RI.DATAFINAL,'#39'YYYY/MM'#39') >= :pMesRef) OR (RI.DATAFI' +
        'NAL IS NULL))'
      
        'AND ((TO_CHAR(RI.DATAINICIO,'#39'YYYY/MM'#39') <= :pMesRef) OR (RI.DATAI' +
        'NICIO IS NULL))'
      
        'AND (((RI.NUMOCORRENCIAS < RI.PARCELAS) AND (RI.FLGPERMANENTE = ' +
        '0)) OR (RI.FLGPERMANENTE=1))'
      'AND (PD.FLGDESCONTO = :pFlgDesconto)'
      'AND (PD.IDPROVENTO = RI.IDRUBRICA)'
      'AND (RP.IDRUBRICA = RI.IDRUBRICA)'
      'AND (RP.IDPESSOA = :pIdFundacao)'
      'AND (PFI.IDPESSOA = RI.IDPESSOA)'
      'AND (P.IDPESSOA = RI.IDPESSOA)'
      'AND (RI.IDPESSOA = RA.IDPESSOA(+))'
      'AND (RI.IDRUBRICA = RA.IDRUBRICA(+))'
      
        'ORDER BY PD.NUMPRIORIDADEFB, SEQRUBRICAINDIV, FLGPENSAOALIM, IDR' +
        'EGRACALCULO'
      ' ')
    ValidateWithMask = False
    Left = 46
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'pMesCob'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesCob'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdFundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFlgDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdFundacao'
        ParamType = ptUnknown
      end>
  end
  object qryInsTmpDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  MESREFERENCIA,MESCOBRANCA,FLGTIPODESC,VALOR,'
      
        '  VALORRECEBIDO,MATRICULA,INSCRICAONUMERO,IDTITULAR,IDPESSOA,IDP' +
        'ESSJUR,'
      
        '  IDFUNDACAO,IDPLANOPREV,IDPLANASS,IDPROVENTO,CODPROVDESC,FLGDES' +
        'CONTO,'
      '  IDDESCONTO,NUMPRIORIDADE,ORDEM,IDMOTIVO,'
      
        '  NUMDEPENDSEGURO,FLGDESCFOLHA,DATAREFERENCIA,DATARECEBIMENTO,DE' +
        'SCRICAO,'
      
        '  REFERENCIA,FLGFORNPAG,FLGFORNCOMISS,PLNCODIGOPREV,CODTIPRECDES' +
        ',RECPAG,'
      '  IDEMPRESAPROP,CODTIPDOC,CODSUBCONTA,PLACONTAD,PLANO,PLACONTAC,'
      
        '  CODDOCUMENTOPREV,CODPORTFORMA,UNIDNEGOC,CODCENTRORESPON,CODCEN' +
        'TROCUSTOD,'
      
        '  CODCENTROCUSTOC,IDEMPRESA,CODDOCUMENTOEFET,CODRETORNO,SISTORIG' +
        'EM,'
      
        '  PLNCODIGOEFET,FLGALTERADOR,PERIODO,EXERCICIO,CODALTERADOR,DATA' +
        'COBRANCA,'
      
        '  NODOCUMENTO,COMPLDOCUMENTO,TIPCODIGO,IDFAVORECIDO,SITENVIO,IDL' +
        'OTE,'
      '  SEQPROPOSTA,FLGATRASODEVOL'
      'from TMPDESC'
      'where 1=0')
    UpdateObject = InsTmpDesc
    ValidateWithMask = True
    Left = 449
    Top = 167
  end
  object qryInsIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCIRRF'
      '('
      'IDLANCIRRF,CODDOCUMENTO,IDPESSOA,'
      'IDBENEFIRRF,CODNATUREZA,DATALANCAMENTO,VLRBASE,VLRIRRF,'
      'VLRINSS,NUMDOCUMENTO,VLRREFERENCIA,PERCIRRF'
      ')'
      'VALUES'
      '('
      ':IDLANCIRRF,:CODDOCUMENTO,:IDPESSOA,'
      ':IDBENEFIRRF,:CODNATUREZA,:DATALANCAMENTO,:VLRBASE,:VLRIRRF,'
      ':VLRINSS,:NUMDOCUMENTO,:VLRREFERENCIA,:PERCIRRF'
      ')'
      '')
    ValidateWithMask = True
    Left = 529
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLANCIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODNATUREZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRBASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCIRRF'
        ParamType = ptUnknown
      end>
  end
  object qryDescFolha1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT TD.MESCOBRANCA,TD.MESREFERENCIA,TD.IDTITULAR,TD.' +
        'IDPESSOA,TD.FLGTIPODESC,'
      
        '       TD.VALOR,TD.IDPESSJUR,TD.IDPROVENTO,TD.IDPLANOPREV,TD.ORD' +
        'EM,'
      
        '       TD.CODPROVDESC,TD.REFERENCIA,TD.IDFUNDACAO,TD.IDLOTE, TD.' +
        'IDMOTIVO,'
      '       PD.FLGIRRF, PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF,'
      '       PD.NUMPRIORIDADEFB, RP.IDPESSOA AS PESSOAPENSAOALIM,'
      
        '       DECODE(RP.IDPESSOA,NULL,PD.FLGDESCPENSAO,RP.FLGINCIDE) AS' +
        ' FLGDESCPENSAO,'
      '       TD.VALORRECEBIDO,TD.IDDESCONTO,'
      '       TD.PLANO,TD.IDEMPRESA,TD.PLACONTAC,TD.CODCENTROCUSTOC,'
      '       TD.UNIDNEGOC,TD.CODCENTRORESPON,TD.CODTIPRECDES,'
      
        '       TD.RECPAG,TD.IDFAVORECIDO,TD.FLGDESCONTO,TD.VALORINFO, PD' +
        '.CODIRRFDARF,'
      
        '       NVL(PD.TIPOBASEDESCONTO,5) AS TIPOBASEDESCONTO, PD.DESCPA' +
        'RCIAL'
      'FROM   TMPDESC TD, RUBXPENSAOALIM RP, PROVDESC PD, PARAMAPREV PA'
      'WHERE (TD.IDTITULAR = :pIdTitular)'
      'AND   (TD.IDPESSOA = :pIdPessoa)'
      'AND   (TD.IDPESSJUR = :pIdPessJur)'
      'AND   (TD.IDPLANOPREV = :pIdPlanoPrev)'
      'AND (   (    (PA.IDMOTIVOABONO = :pIdMotivo)'
      '         AND (TD.MESREFERENCIA = :pMesRef)'
      '         AND (TD.MESCOBRANCA = :pMesPagto))'
      '     OR (    (PA.IDMOTIVOFOLHABEN = :pIdMotivo)'
      '         AND (TD.MESREFERENCIA <= :pMesRef)'
      '         AND (TD.MESCOBRANCA <= :pMesPagto)))'
      'AND   (TD.FLGDESCFOLHA = :pFlgDescFolha)'
      'AND   (PD.FLGDESCONTO = 1)'
      'AND   (TD.FLGTIPODESC IN ('#39'C'#39','#39'P'#39','#39'A'#39','#39'E'#39'))'
      'AND   (TD.DATARECEBIMENTO IS NULL)'
      'AND   (PD.IDPROVENTO = TD.IDPROVENTO)'
      'AND   (TD.IDPESSOA = RP.IDPESSOA(+))'
      'AND   (TD.IDPROVENTO = RP.IDRUBRICA(+))'
      
        'ORDER BY PD.NUMPRIORIDADEFB, TD.MESREFERENCIA,TD.CODPROVDESC, TD' +
        '.REFERENCIA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 142
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
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
        DataType = ftInteger
        Name = 'pIdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFlgDescFolha'
        ParamType = ptUnknown
      end>
  end
  object InsTmpDesc: TUpdateSQL
    ModifySQL.Strings = (
      'update TMPDESC'
      'set'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  PLNCODIGOPREV = :PLNCODIGOPREV,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  RECPAG = :RECPAG,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  PLACONTAD = :PLACONTAD,'
      '  PLANO = :PLANO,'
      '  PLACONTAC = :PLACONTAC,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODDOCUMENTOPREV = :CODDOCUMENTOPREV,'
      '  FLGTIPODESC = :FLGTIPODESC,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  VALOR = :VALOR,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPLANASS = :IDPLANASS,'
      '  IDDESCONTO = :IDDESCONTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  CODCENTROCUSTOD = :CODCENTROCUSTOD,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  CODCENTROCUSTOC = :CODCENTROCUSTOC,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  NUMPRIORIDADE = :NUMPRIORIDADE,'
      '  ORDEM = :ORDEM,'
      '  MATRICULA = :MATRICULA,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  CODRETORNO = :CODRETORNO,'
      '  NUMDEPENDSEGURO = :NUMDEPENDSEGURO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  DATAREFERENCIA = :DATAREFERENCIA,'
      '  DESCRICAO = :DESCRICAO,'
      '  REFERENCIA = :REFERENCIA,'
      '  FLGFORNPAG = :FLGFORNPAG,'
      '  FLGFORNCOMISS = :FLGFORNCOMISS,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  CODDOCUMENTOEFET = :CODDOCUMENTOEFET,'
      '  PLNCODIGOEFET = :PLNCODIGOEFET,'
      '  SISTORIGEM = :SISTORIGEM,'
      '  FLGALTERADOR = :FLGALTERADOR,'
      '  PERIODO = :PERIODO,'
      '  EXERCICIO = :EXERCICIO,'
      '  DATACOBRANCA = :DATACOBRANCA,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  COMPLDOCUMENTO = :COMPLDOCUMENTO,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDLOTE = :IDLOTE,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  SITENVIO = :SITENVIO,'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  CODALTERADOR = :OLD_CODALTERADOR and'
      '  PLNCODIGOPREV = :OLD_PLNCODIGOPREV and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  CODSUBCONTA = :OLD_CODSUBCONTA and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP and'
      '  CODTIPDOC = :OLD_CODTIPDOC and'
      '  PLACONTAD = :OLD_PLACONTAD and'
      '  PLANO = :OLD_PLANO and'
      '  PLACONTAC = :OLD_PLACONTAC and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODDOCUMENTOPREV = :OLD_CODDOCUMENTOPREV and'
      '  FLGTIPODESC = :OLD_FLGTIPODESC and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  VALOR = :OLD_VALOR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDDESCONTO = :OLD_IDDESCONTO and'
      '  UNIDNEGOC = :OLD_UNIDNEGOC and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  DATARECEBIMENTO = :OLD_DATARECEBIMENTO and'
      '  CODCENTRORESPON = :OLD_CODCENTRORESPON and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  CODCENTROCUSTOD = :OLD_CODCENTROCUSTOD and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  CODCENTROCUSTOC = :OLD_CODCENTROCUSTOC and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  VALORRECEBIDO = :OLD_VALORRECEBIDO and'
      '  NUMPRIORIDADE = :OLD_NUMPRIORIDADE and'
      '  ORDEM = :OLD_ORDEM and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  INSCRICAONUMERO = :OLD_INSCRICAONUMERO and'
      '  FLGDESCONTO = :OLD_FLGDESCONTO and'
      '  CODRETORNO = :OLD_CODRETORNO and'
      '  NUMDEPENDSEGURO = :OLD_NUMDEPENDSEGURO and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  FLGDESCFOLHA = :OLD_FLGDESCFOLHA and'
      '  DATAREFERENCIA = :OLD_DATAREFERENCIA and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  FLGFORNPAG = :OLD_FLGFORNPAG and'
      '  FLGFORNCOMISS = :OLD_FLGFORNCOMISS and'
      '  IDFUNDACAO = :OLD_IDFUNDACAO and'
      '  CODDOCUMENTOEFET = :OLD_CODDOCUMENTOEFET and'
      '  PLNCODIGOEFET = :OLD_PLNCODIGOEFET and'
      '  SISTORIGEM = :OLD_SISTORIGEM and'
      '  FLGALTERADOR = :OLD_FLGALTERADOR and'
      '  PERIODO = :OLD_PERIODO and'
      '  EXERCICIO = :OLD_EXERCICIO and'
      '  DATACOBRANCA = :OLD_DATACOBRANCA and'
      '  NODOCUMENTO = :OLD_NODOCUMENTO and'
      '  COMPLDOCUMENTO = :OLD_COMPLDOCUMENTO and'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  TIPCODIGO = :OLD_TIPCODIGO and'
      '  SITENVIO = :OLD_SITENVIO and')
    InsertSQL.Strings = (
      'INSERT INTO TMPDESC'
      '('
      '  MESREFERENCIA,MESCOBRANCA,FLGTIPODESC,VALOR,'
      
        '  VALORRECEBIDO,MATRICULA,INSCRICAONUMERO,IDTITULAR,IDPESSOA,IDP' +
        'ESSJUR,'
      
        '  IDFUNDACAO,IDPLANOPREV,IDPLANASS,IDPROVENTO,CODPROVDESC,FLGDES' +
        'CONTO,'
      '  IDDESCONTO,NUMPRIORIDADE,ORDEM,IDMOTIVO,'
      
        '  NUMDEPENDSEGURO,FLGDESCFOLHA,DATAREFERENCIA,DATARECEBIMENTO,DE' +
        'SCRICAO,'
      
        '  REFERENCIA,FLGFORNPAG,FLGFORNCOMISS,PLNCODIGOPREV,CODTIPRECDES' +
        ',RECPAG,'
      '  IDEMPRESAPROP,CODTIPDOC,CODSUBCONTA,PLACONTAD,PLANO,PLACONTAC,'
      
        '  CODDOCUMENTOPREV,CODPORTFORMA,UNIDNEGOC,CODCENTRORESPON,CODCEN' +
        'TROCUSTOD,'
      
        '  CODCENTROCUSTOC,IDEMPRESA,CODDOCUMENTOEFET,CODRETORNO,SISTORIG' +
        'EM,'
      
        '  PLNCODIGOEFET,FLGALTERADOR,PERIODO,EXERCICIO,CODALTERADOR,DATA' +
        'COBRANCA,'
      
        '  NODOCUMENTO,COMPLDOCUMENTO,TIPCODIGO,IDFAVORECIDO,SITENVIO,IDL' +
        'OTE,'
      '  SEQPROPOSTA,FLGATRASODEVOL'
      ')'
      'VALUES'
      '('
      '  :MESREFERENCIA,:MESCOBRANCA,:FLGTIPODESC,:VALOR,'
      
        '  :VALORRECEBIDO,:MATRICULA,:INSCRICAONUMERO,:IDTITULAR,:IDPESSO' +
        'A,:IDPESSJUR,'
      
        '  :IDFUNDACAO,:IDPLANOPREV,:IDPLANASS,:IDPROVENTO,:CODPROVDESC,:' +
        'FLGDESCONTO,'
      '  :IDDESCONTO,:NUMPRIORIDADE,:ORDEM,:IDMOTIVO,'
      
        '  :NUMDEPENDSEGURO,:FLGDESCFOLHA,:DATAREFERENCIA,:DATARECEBIMENT' +
        'O,:DESCRICAO,'
      
        '  :REFERENCIA,:FLGFORNPAG,:FLGFORNCOMISS,:PLNCODIGOPREV,:CODTIPR' +
        'ECDES,:RECPAG,'
      
        '  :IDEMPRESAPROP,:CODTIPDOC,:CODSUBCONTA,:PLACONTAD,:PLANO,:PLAC' +
        'ONTAC,'
      
        '  :CODDOCUMENTOPREV,:CODPORTFORMA,:UNIDNEGOC,:CODCENTRORESPON,:C' +
        'ODCENTROCUSTOD,'
      
        '  :CODCENTROCUSTOC,:IDEMPRESA,:CODDOCUMENTOEFET,:CODRETORNO,:SIS' +
        'TORIGEM,'
      
        '  :PLNCODIGOEFET,:FLGALTERADOR,:PERIODO,:EXERCICIO,:CODALTERADOR' +
        ',:DATACOBRANCA,'
      
        '  :NODOCUMENTO,:COMPLDOCUMENTO,:TIPCODIGO,:IDFAVORECIDO,:SITENVI' +
        'O,:IDLOTE,'
      '  :SEQPROPOSTA,:FLGATRASODEVOL'
      ')'
      ''
      '')
    DeleteSQL.Strings = (
      'delete from TMPDESC'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  CODALTERADOR = :OLD_CODALTERADOR and'
      '  PLNCODIGOPREV = :OLD_PLNCODIGOPREV and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  CODSUBCONTA = :OLD_CODSUBCONTA and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP and'
      '  CODTIPDOC = :OLD_CODTIPDOC and'
      '  PLACONTAD = :OLD_PLACONTAD and'
      '  PLANO = :OLD_PLANO and'
      '  PLACONTAC = :OLD_PLACONTAC and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODDOCUMENTOPREV = :OLD_CODDOCUMENTOPREV and'
      '  FLGTIPODESC = :OLD_FLGTIPODESC and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  VALOR = :OLD_VALOR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDDESCONTO = :OLD_IDDESCONTO and'
      '  UNIDNEGOC = :OLD_UNIDNEGOC and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  DATARECEBIMENTO = :OLD_DATARECEBIMENTO and'
      '  CODCENTRORESPON = :OLD_CODCENTRORESPON and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  CODCENTROCUSTOD = :OLD_CODCENTROCUSTOD and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  CODCENTROCUSTOC = :OLD_CODCENTROCUSTOC and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  VALORRECEBIDO = :OLD_VALORRECEBIDO and'
      '  NUMPRIORIDADE = :OLD_NUMPRIORIDADE and'
      '  ORDEM = :OLD_ORDEM and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  INSCRICAONUMERO = :OLD_INSCRICAONUMERO and'
      '  FLGDESCONTO = :OLD_FLGDESCONTO and'
      '  CODRETORNO = :OLD_CODRETORNO and'
      '  NUMDEPENDSEGURO = :OLD_NUMDEPENDSEGURO and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  FLGDESCFOLHA = :OLD_FLGDESCFOLHA and'
      '  DATAREFERENCIA = :OLD_DATAREFERENCIA and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  REFERENCIA = :OLD_REFERENCIA and'
      '  FLGFORNPAG = :OLD_FLGFORNPAG and'
      '  FLGFORNCOMISS = :OLD_FLGFORNCOMISS and'
      '  IDFUNDACAO = :OLD_IDFUNDACAO and'
      '  CODDOCUMENTOEFET = :OLD_CODDOCUMENTOEFET and'
      '  PLNCODIGOEFET = :OLD_PLNCODIGOEFET and'
      '  SISTORIGEM = :OLD_SISTORIGEM and'
      '  FLGALTERADOR = :OLD_FLGALTERADOR and'
      '  PERIODO = :OLD_PERIODO and'
      '  EXERCICIO = :OLD_EXERCICIO and'
      '  DATACOBRANCA = :OLD_DATACOBRANCA and'
      '  NODOCUMENTO = :OLD_NODOCUMENTO and'
      '  COMPLDOCUMENTO = :OLD_COMPLDOCUMENTO and'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  TIPCODIGO = :OLD_TIPCODIGO and'
      '  SITENVIO = :OLD_SITENVIO and')
    Left = 449
    Top = 218
  end
  object qryInsRubSal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTRUBSAL'
      '('
      
        ' IDPESSOA,IDPESSJUR,IDRUBRICA,CODPROVDESC,IDMOTIVO,MES,MESCOBRAN' +
        'CA,'
      ' REFERENCIA,IDREGRACALCULO,FLGCOMPOESALPART,FLGCOMPOESALBENEF,'
      ' FLGIRRF,CodMoeda,VALORPROVENTO,VALORINTEGRAL,'
      ' VALORCOTAS,SEQRUBRICA,FLGSRB,IDRESPONSAVEL,'
      ' IDTITULAR, IDPLANOPREV, IDMODULO, IDPATRO'
      ')'
      'VALUES'
      '('
      
        ' :IDPESSOA,:IDPESSJUR,:IDRUBRICA,:CODPROVDESC,:IDMOTIVO,:MES,:ME' +
        'SCOBRANCA,'
      
        ' :REFERENCIA,:IDREGRACALCULO,:FLGCOMPOESALPART,:FLGCOMPOESALBENE' +
        'F,'
      ' :FLGIRRF,:CodMoeda,:VALORPROVENTO,:VALORINTEGRAL,'
      ' :VALORCOTAS,:SEQRUBRICA,:FLGSRB,'
      ' :IDRESPONSAVEL,:IDTITULAR,:IDPLANOPREV, 18,:IDPESSJUR'
      ')'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 46
    Top = 23
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
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODPROVDESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRACALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALPART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodMoeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORPROVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORINTEGRAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORCOTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGSRB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryCotMoedaData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT CM.COTVALOR,CM.COTDATA'
      ' FROM   COTACAOMOEDA CM                          '
      ' WHERE  (CM.MOECODIGO = :MoeCodigo)'
      ' AND    (CM.COTDATA = (SELECT MAX(CM1.COTDATA)'
      '                       FROM   COTACAOMOEDA CM1'
      '                       WHERE  (CM1.MOECODIGO = :MoeCodigo)'
      
        '                       AND    (CM1.COTDATA <= TO_DATE(:pDataRef,' +
        #39'dd/mm/yyyy'#39')   ) ) )')
    ValidateWithMask = True
    Left = 449
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MoeCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MoeCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptUnknown
      end>
  end
  object qryNumBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS NUMBENEFICIARIOS'
      'FROM   BENEFBFCIARIO BB'
      'WHERE  (BB.IDTITULAR = :pIdTitular)'
      'AND    (BB.IDPLANOPREV = :pIdPlanoPrev)'
      'AND    (BB.IDPESSJUR = :pIdPessJur)'
      'AND    (BB.IDBENEFICIO = :pIdBeneficio)'
      'AND    (BB.SEQPROPOSTA = :pSeqProposta)'
      ''
      '')
    ValidateWithMask = True
    Left = 529
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end>
  end
  object qryInsPrevia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 46
    Top = 71
  end
  object qryUpdDescFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TMPDESC'
      'SET    VALORRECEBIDO = :pValor,'
      '       LOTEPREVIA  = :pIdLotePrevia,'
      '       VALORINFO   = :pValorInfo,'
      '       DATARECEBIMENTO = :pData'
      'WHERE  (IDLOTE = :pIdLote)'
      'AND    (ORDEM  = :pOrdem)'
      'AND    (IDPESSJUR = :pidpessjur)'
      'AND    (IDPLANOPREV = :pidplanoprev)'
      'AND    (IDTITULAR = :pidtitular)'
      'AND    (IDPESSOA = :pidpessoa)'
      'AND    (MESCOBRANCA = :pmescob)'
      'AND    (MESREFERENCIA = :pmesref)'
      'AND    (IDPROVENTO = :pidprovento)'
      'AND    (IDMOTIVO = :pidmotivo)')
    ValidateWithMask = True
    Left = 142
    Top = 119
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pValor'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdLotePrevia'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pValorInfo'
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
        Name = 'pOrdem'
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
        Name = 'pmescob'
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
  object qryDesfazSalVirt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARTPREVPLAN'
      'SET    FLGSALVIRTBENEF = 0'
      'WHERE (IDPESSJUR      = :IdPessJur)'
      'AND   (IDPLANOPREV    = :IdPlanoPrev)'
      'AND   (IDPESSOA       = :IdPessoa)'
      'AND   (SEQPROPOSTA    = :SeqProposta)')
    ValidateWithMask = True
    Left = 234
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SeqProposta'
        ParamType = ptUnknown
      end>
  end
  object qryParaCobDef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CP.IDPESSOA'
      'FROM   CONTRIBPREVPARTP CP'
      'WHERE  (CP.IDPESSOA = :piIdPessoa)'
      'AND    (CP.IDCONTRIBUICAO = :piIdContrib)'
      'AND    (CP.FLGCOBRA = 0)'
      'AND    (CP.IDPESSJUR = :piIdPessJur)'
      'AND    (CP.IDPLANOPREV = :piIdPlanoPrev)'
      'AND    (CP.QTDEPARCELAS = (SELECT COUNT(HST.NUMRECEBIMENTO)'
      '                           FROM   HSTCONTRIBPREV HST'
      
        '                           WHERE  (CP.IDPESSJUR   = HST.IDPESSJU' +
        'R)'
      
        '                           AND    (CP.IDPLANOPREV = HST.IDPLANOP' +
        'REV)'
      
        '                           AND    (CP.IDPESSOA    = HST.IDPESSOA' +
        ')'
      
        '                           AND    (CP.IDCONTRIBUICAO = HST.IDCON' +
        'TRIBUICAO)))'
      '')
    ValidateWithMask = True
    Left = 234
    Top = 23
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContrib'
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
      end>
  end
  object qryUpdReassocia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CONTRIBPREVPARTP CPP'
      'SET    CPP.FLGCOBRA        = :FlgCobra'
      'WHERE  (CPP.IDPESSOA       = :IDPESSOA)'
      'AND    (CPP.IDPESSJUR      = :IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (CPP.IDCONTRIBUICAO = :IDCONTRIBUICAO)'
      '')
    ValidateWithMask = True
    Left = 234
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FlgCobra'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object qryFlgCobra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT IDPESSOA, IDPESSJUR, IDPLANOPREV, IDCONTRIBUICAO' +
        ', FLGCOBRA'
      'FROM CONTRIBPREVPARTP'
      'WHERE (IDPESSOA = :IdTitular)'
      'AND (IDPESSJUR = :IdPessJur)'
      'AND (IDPLANOPREV = :IdPlanoPrev)'
      'AND (FLGCOBRA = :FlgCobra)')
    ValidateWithMask = True
    Left = 234
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FlgCobra'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPartPrevPlan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update PARTPREVPLAN'
      'set IDSITPLANOPREV=:IDSITPLANOATUAL,'
      '    IDSITPART     =:IDSITPARTATUAL,'
      '    FLGSALVIRTBENEF = 0'
      'WHERE (IDPESSJUR = :IdPessJur)'
      'AND   (IDPLANOPREV = :IdPlanoPrev)'
      'AND   (IDPESSOA = :IdPessoa)'
      'AND   (SEQPROPOSTA = :SEQPROPOSTA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 341
    Top = 119
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSITPLANOATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSITPARTATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryUltEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDSITFUNCATUAL,IDSITPLANOATUAL,IDSITPARTATUAL,IDEVENTOSPR' +
        'EV'
      'FROM   EVENTOSPREV'
      'WHERE (IDPESSJUR = :IDPESSJUR)'
      'AND   (IDPLANOPREV = :IDPLANOPREV)'
      'AND   (IDPESSOA = :IDPESSOA)'
      'AND   (SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (IDEVENTOGERADOR = :IDEVENTOGERADOR)'
      'ORDER BY DATAEVENTO DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 341
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryUpdElegpatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update ELEGPATRO'
      'set IDSITFUNC=:IDSITFUNCATUAL'
      'WHERE (IDPESSJUR = :IdPessJur)'
      'AND   (IDPESSOA = :IdPessoa)'
      '')
    ValidateWithMask = True
    Left = 341
    Top = 23
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSITFUNCATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryHst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HSTBENEFBFCIARIO H'
      'SET    H.FLGENVIADO       = 1,'
      '       H.DTEFETPGTO       = :DTEFETPGTO,'
      '       H.VLBENEFPGTO      = :VLBENEFPGTO,'
      '       H.IDHSTFOLHABENEF  = :IDHSTFOLHABENEF'
      'WHERE  (H.IDPESSJUR       = :IDPESSJUR)'
      'AND    (H.IDTITULAR       = :IDTITULAR)'
      'AND    (H.IDPLANOPREV     = :IDPLANOPREV)'
      'AND    (H.IDBENEFICIO     = :IDBENEFICIO)'
      'AND    (H.MES             = :MESPAGAMENTO)'
      'AND    (H.IDMOTIVO        = :IDMOTIVO)'
      'AND    (H.NUMEROPROCESSO  = :NUMEROPROCESSO)'
      'AND    (H.IDPESSOA        = :IDPESSOA)'
      'AND    (H.MESREFERENCIA   = :MESREFERENCIA)'
      'AND    (H.SEQPROPOSTA     = :SEQPROPOSTA)'
      'AND    (H.SEQBENEFICIO    = :SEQBENEFICIO)'
      '')
    ValidateWithMask = True
    Left = 142
    Top = 167
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTEFETPGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLBENEFPGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESPAGAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
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
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryProvFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   DISTINCT TD.MESREFERENCIA,TD.IDPESSOA,TD.FLGTIPODESC,TD' +
        '.VALOR,'
      '         TD.IDPESSJUR,TD.IDPROVENTO,TD.IDPLANOPREV,TD.ORDEM,'
      '         TD.CODPROVDESC,TD.REFERENCIA,TD.IDFUNDACAO,TD.IDLOTE,'
      '         PD.FLGIRRF, PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF,'
      '         PD.NUMPRIORIDADEFB,PD.FLGDESCPENSAO,TD.VALORRECEBIDO,'
      '         TD.PLANO,TD.IDEMPRESA,TD.PLACONTAC,TD.CODCENTROCUSTOC,'
      '         TD.UNIDNEGOC,TD.CODCENTRORESPON,TD.CODTIPRECDES,'
      '         TD.RECPAG,TD.IDFAVORECIDO,TD.FLGDESCONTO'
      'FROM     TMPDESC TD, PROVDESC PD'
      'WHERE    (TD.IDPESSOA = :pIdPessoa)'
      'AND      (TD.IDPESSJUR = :pIdPessJur)'
      'AND      (TD.IDPLANOPREV = :pIdPlanoPrev)'
      'AND      (TD.MESCOBRANCA = :pMesPagto)'
      'AND      (TD.FLGDESCFOLHA = :pFlgDescFolha)'
      'AND      (TD.FLGDESCONTO = 0)'
      'AND      (TD.FLGTIPODESC IN ('#39'C'#39','#39'P'#39','#39'A'#39','#39'X'#39'))'
      'AND      (TD.DATARECEBIMENTO IS NULL)'
      'AND      (PD.IDPROVENTO=TD.IDPROVENTO)'
      
        'ORDER BY PD.NUMPRIORIDADEFB, TD.MESREFERENCIA,TD.CODPROVDESC, TD' +
        '.REFERENCIA'
      ' ')
    ValidateWithMask = True
    Left = 143
    Top = 270
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
        Name = 'pMesPagto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFlgDescFolha'
        ParamType = ptUnknown
      end>
  end
  object qryUpdRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RUBRICAINDIV RI'
      'SET    RI.NUMOCORRENCIAS = :pNumOcorrencias'
      'WHERE  (RI. FLGTPRUBMANUT  = '#39'1'#39')'
      'AND    (RI.IDPESSOA        = :pIdPessoa)'
      'AND    (RI.IDEMPRESA       = :pIdEmpresa)'
      'AND    (RI.IDRUBRICA       = :pIdRubrica)'
      '')
    ValidateWithMask = True
    Left = 46
    Top = 268
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
  object qryFiltraDescFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select flgpagador'
      'from contprev '
      'where idrubrica = :idrubrica'
      'and idplanoprev = :idplanoprev')
    ValidateWithMask = True
    Left = 234
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idrubrica'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end>
  end
  object qryRubXPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES'
      'FROM   RUBRICAXPLANO'
      'WHERE  IDPESSJUR   = :PESSJUR AND'
      '       IDRUBRICA   = :RUBRICA AND'
      '       IDPLANOPREV = :PLANOPREV')
    ValidateWithMask = True
    Left = 341
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryProventoFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RI.IDPESSOA, RI.IDEMPRESA, RI.IDPROVENTO AS IDRUBRICA, 1,' +
        ' RI.IDFAVORECIDO,'
      
        '       0, RI.VALOR, RI.MESCOBRANCA, 1, 1,RI.ORDEM,RI.IDLOTE,RI.I' +
        'DMOTIVO,'
      
        '       PD.FLGIRRF, PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF, RI' +
        '.CODPROVDESC,'
      
        '       P.NOME, PD.DESCRICAO, EP.MATRICULA, RI.INSCRICAONUMERO, R' +
        'I.IDPESSJUR, RI.IDPLANOPREV,'
      
        '       RI.PLANO,RI.IDEMPRESA,RI.PLACONTAD,RI.CODCENTROCUSTOC, RI' +
        '.IDTITULAR,'
      '       RI.UNIDNEGOC,RI.CODCENTRORESPON,RI.CODTIPRECDES,'
      
        '       RI.RECPAG,PD.FLGDESCPENSAO AS FLGDESCPENSAO, RI.ORDEM AS ' +
        'SEQRUBRICAINDIV,'
      
        '       EP.SALTOTAL, PFI.DATANASC, PFI.NUMDEPIRRF, PFI.DATANASC A' +
        'S DATAINICIO, 0,'
      
        '       EP.IDSITFUNC, RI.DATAREFERENCIA, RI.MESREFERENCIA, RI.SEQ' +
        'PROPOSTA,'
      '       0 AS FLGPENSAOALIM, PD.CODIRRFDARF CODIRRFDARF'
      
        'FROM TMPDESC RI, PROVDESC PD, PESSOA P, ELEGPATRO EP, PESSOAFISI' +
        'CA PFI'
      'WHERE  (RI.IDPESSOA = :pIdPessoa)'
      'AND    (RI.IDPESSJUR = :pIdPessJur)'
      'AND    (RI.IDPLANOPREV = :pIdPlanoPrev)'
      'AND    (RI.MESCOBRANCA = :pMesCob)'
      'AND    (RI.FLGDESCFOLHA = '#39'B'#39')'
      'AND    (PD.FLGDESCONTO = 0)'
      'AND    (RI.FLGTIPODESC IN ('#39'C'#39','#39'P'#39','#39'A'#39','#39'X'#39'))'
      'AND    (RI.DATARECEBIMENTO IS NULL)'
      'AND    (PD.IDPROVENTO = RI.IDPROVENTO)'
      'AND    (P.IDPESSOA = RI.IDPESSOA)'
      'AND    (EP.IDPESSOA(+) = RI.IDPESSOA)'
      'AND    (EP.IDPESSJUR(+) = RI.IDPESSJUR)'
      'AND    (PFI.IDPESSOA = RI.IDPESSOA)'
      'ORDER BY FLGPENSAOALIM')
    ValidateWithMask = False
    Left = 234
    Top = 168
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
        Name = 'pMesCob'
        ParamType = ptUnknown
      end>
  end
  object qryProventoPrevia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PD.FLGDESCPENSAO, PD.FLGIRRF, PD.FLGESPECIAL,'
      '       DECODE(PD.FLGESPECIAL,0,PD.FLGDESCONTO,2) FLGDESCONTO,'
      '       PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF,'
      
        '       NVL(PD.NUMPRIORIDADEFB,0) AS NUMPRIORIDADE, NVL(PD.CODIRR' +
        'FDARF, '#39' '#39') AS CODIRRFDARF,'
      '       NVL(PD.DESCPARCIAL, 0) DESCPARCIAL,'
      '       NVL(PD.TIPOBASEDESCONTO,5) AS TIPOBASEDESCONTO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, TO_CHAR(PD.IDPROVENTO), PD' +
        '.CODPROVDESC) AS CODRUBEXIBICAO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.DESCRICAO, PD.DESCRPROV' +
        'DESC) AS NOME,'
      '       NVL(PD.FLGRUBLEGAL,0) AS FLGRUBLEGAL,'
      '       PD.FLGREPROGRAMAR,'
      '       PD.CODPROVDESC '
      'FROM PARAMAPREV PRM, PROVDESC PD'
      'WHERE (PD.IDPROVENTO = :PIDPROVENTO)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = False
    Left = 529
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DATAINICIO, DATAFINAL'
      'FROM BENEFBFCIARIO'
      'WHERE NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND IDTITULAR = :IDTITULAR')
    ValidateWithMask = True
    Left = 46
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryParametrosFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ' ')
    ValidateWithMask = True
    Left = 449
    Top = 273
  end
  object MSBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matric. Titular'
      'Matric. Benef.'
      'Nº Insc'
      'CPF'
      'Nome ')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.MATRICSHOW'
      'VWPARTICIPDEPEN.SITPATRO'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.IDPLANOPREV'
      'VWPARTICIPDEPEN.IDSITPART'
      'VWPARTICIPDEPEN.SEQPROPOSTA'
      'VWPARTICIPDEPEN.FLGDESATIVADO'
      'VWPARTICIPDEPEN.PLANO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.DESCRICAO'
      'VWPARTICIPDEPEN.SITFUND')
    Filtro.Strings = (
      'IDPLANOPREV IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '10'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 46
    Top = 384
  end
  object qryModalidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RXB.IDBENEFICIO, BPP.TPMODALIDADE'
      'FROM'
      '   BENEFPLANPREV BPP,'
      '   ('
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBABONO        AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBABONOFIM     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLUCAO    AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBRICADIF      AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBRICACORRECAO AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBRICAATRASO   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBRICAREVISAO  AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBATRREVISAO   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVREVISAO   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBRICA         AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBANTECABONO   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDESCANTECAB  AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBADIANT13     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLADIANT  AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVADIANT13  AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLABONO   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBACJUD        AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBATRACJUD     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVACJUD     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBREVACJUD     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBADTACJUD     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDADACJUD     AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUB13ACJUD      AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUB13DESACJUD   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUB13PGAN1ACJUD AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUB13DVANACJUD  AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUB13ADTACJUD   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUB13DADACJUD   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBADIANT       AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBNORADICJUD   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBATRADICJUD   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV UNION'
      
        '   SELECT IDPLANOPREV, IDBENEFICIO, IDRUBDEVADICJUD   AS IDRUBRI' +
        'CA FROM BENEFPLANPREV'
      '   ) RXB'
      'WHERE'
      '       RXB.IDPLANOPREV = BPP.IDPLANOPREV'
      '   AND RXB.IDBENEFICIO = BPP.IDBENEFICIO'
      '   AND RXB.IDPLANOPREV =:PIDPLANOPREV'
      '   AND RXB.IDRUBRICA   =:PIDRUBRICA')
    ValidateWithMask = True
    Left = 144
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end>
    object qryModalidadeIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryModalidadeTPMODALIDADE: TStringField
      FieldName = 'TPMODALIDADE'
      FixedChar = True
      Size = 2
    end
  end
  object qryTipoOpcaoIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PPP.TIPOOPCAOIR'
      'FROM'
      '   PARTPREVPLAN PPP'
      'WHERE'
      '       PPP.IDPESSOA    =:PIDPESSOA'
      '   AND PPP.IDPLANOPREV =:PIDPLANOPREV')
    ValidateWithMask = True
    Left = 144
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryTipoOpcaoIRTIPOOPCAOIR: TFloatField
      FieldName = 'TIPOOPCAOIR'
      Origin = 'BASEDADOS.PARTPREVPLAN.TIPOOPCAOIR'
    end
  end
end
