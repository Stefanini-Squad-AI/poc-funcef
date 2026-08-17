object dtmInterface: TdtmInterface
  OldCreateOrder = True
  Left = 102
  Top = 152
  Height = 479
  Width = 741
  object qryEscreveRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      'HISTRUBSAL(IDPESSOA,'
      '           IDPESSJUR,'
      '           IDRUBRICA,'
      '           CODPROVDESC,'
      '           IDMOTIVO,'
      '           MES,'
      '           MESCOBRANCA,'
      '           REFERENCIA,'
      '           VALORPROVENTO,'
      '           FLGCOMPOESALPART,'
      '           FLGCOMPOESALBENEF)'
      'VALUES (   :pIdPessoa,'
      '           :pIdPessJur,'
      '           :pIdRubrica,'
      '           :pCodProvDesc,'
      '           :pIdMotivo,'
      '           :pMes,'
      '           :pMesCobranca,'
      '           :pReferencia,'
      '           :pValorProvento,'
      '           :pFlgCompoeSalPart,'
      '           :pFlgCompoeSalBenef)')
    ValidateWithMask = True
    Left = 36
    Top = 6
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
        Name = 'pCodProvDesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pReferencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pValorProvento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFlgCompoeSalPart'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFlgCompoeSalBenef'
        ParamType = ptUnknown
      end>
  end
  object qryCodProvDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.CODPROVDESC'
      'FROM   RUBRICAXPESS RP'
      'WHERE  (RP.IDPESSOA = :pIdPessJur)'
      'AND    (RP.IDRUBRICA = :pIdRubrica)')
    ValidateWithMask = True
    Left = 124
    Top = 6
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
    object qryCodProvDescCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Origin = 'RUBRICAXPESS.CODPROVDESC'
      Size = 7
    end
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   TD.VALOR,TD.ORDEM,TD.FLGTIPODESC,TD.FLGDESCFOLHA,TD.MES' +
        'REFERENCIA,'
      
        '         TD.MESCOBRANCA,TD.IDLOTE, TD.IDDESCONTO, TD.NUMPRIORIDA' +
        'DE, '
      
        '         TD.IDPESSJUR, TD.IDPLANOPREV, TD.IDPESSOA, TD.SEQPROPOS' +
        'TA,'
      '         TD.IDDESCONTO AS IDCONTRIBUICAO, TD.IDPROVENTO'
      'FROM     TMPDESC TD'
      'WHERE    (TD.CODPROVDESC = :CodProvDesc)'
      'AND      (TD.IDPESSOA = :IdPessoa)'
      'AND      (TD.MESREFERENCIA = :MesRef)'
      'AND      (TD.IDPESSJUR = :IdPessJur)'
      'AND      (TD.DATARECEBIMENTO IS NULL)'
      'AND      (NOT (TD.VALORRECEBIDO > 0))'
      'ORDER BY TD.NUMPRIORIDADE'
      '')
    ValidateWithMask = True
    Left = 39
    Top = 233
    ParamData = <
      item
        DataType = ftString
        Name = 'CodProvDesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end>
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'TMPDESC.VALOR'
    end
    object qryTmpDescORDEM: TFloatField
      FieldName = 'ORDEM'
      Origin = 'TMPDESC.ORDEM'
    end
    object qryTmpDescFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      Origin = 'TMPDESC.FLGTIPODESC'
      Size = 1
    end
    object qryTmpDescFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      Origin = 'TMPDESC.FLGDESCFOLHA'
      Size = 1
    end
    object qryTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'TMPDESC.MESREFERENCIA'
      Size = 7
    end
    object qryTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'TMPDESC.MESCOBRANCA'
      Size = 7
    end
    object qryTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Origin = 'TMPDESC.IDLOTE'
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
      Origin = 'TMPDESC.IDDESCONTO'
    end
    object qryTmpDescNUMPRIORIDADE: TFloatField
      FieldName = 'NUMPRIORIDADE'
      Origin = 'TMPDESC.NUMPRIORIDADE'
    end
    object qryTmpDescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TMPDESC.IDPESSOA'
    end
    object qryTmpDescIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'TMPDESC.IDPESSJUR'
    end
    object qryTmpDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'TMPDESC.IDPLANOPREV'
    end
    object qryTmpDescSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'TMPDESC.SEQPROPOSTA'
    end
    object qryTmpDescIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Origin = 'TMPDESC.IDDESCONTO'
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'TMPDESC.IDPROVENTO'
    end
  end
  object qryUpdTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  TMPDESC TD'
      'SET     TD.VALORRECEBIDO   = :ValorRecebido,'
      '        TD.VALOR           = :VALOR,'
      '        TD.DATARECEBIMENTO = :DataRef,'
      '        TD.SITENVIO        = :SITENVIO'
      'WHERE  (TD.ORDEM           = :Ordem)'
      'AND    (TD.IDPESSOA        = :IDPESSOA)'
      'AND    (TD.IDPLANOPREV     = :IDPLANOPREV)'
      'AND    (TD.IDLOTE          = :IDLOTE)'
      'AND    (TD.FLGTIPODESC     = :FlgTipoDesc)'
      'AND    (TD.FLGDESCFOLHA    = :FlgDescFolha)'
      'AND    (TD.MESREFERENCIA   = :MesRef)'
      'AND    (TD.MESCOBRANCA     = :MesCob)'
      'AND    (TD.IDPESSJUR       = :IdPessJur)'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 171
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ValorRecebido'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SITENVIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Ordem'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FlgTipoDesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FlgDescFolha'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesCob'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end>
  end
  object qryRubricasPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   P.IDRUBSALBENEFICIO,P.IDREGRASALBENEFI,P.IDRUBREMTOTAL,' +
        'P.IDREGRAREMTOTAL,'
      '         P.IDREGRACALCSALPA,P.IDRUBSALPARTICIP,'
      '         P.IDRUBSALMANUT,P.IDRUBSALMANUTPARC,'
      '         P.IDRUBSALAUXDOENCA'
      'FROM     PATRO P'
      'WHERE    (P.IDPESSOA = :IdPessJur)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 36
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end>
    object qryRubricasPatroIDRUBSALBENEFICIO: TFloatField
      FieldName = 'IDRUBSALBENEFICIO'
      Origin = 'PATRO.IDRUBSALBENEFICIO'
    end
    object qryRubricasPatroIDREGRASALBENEFI: TFloatField
      FieldName = 'IDREGRASALBENEFI'
      Origin = 'PATRO.IDREGRASALBENEFI'
    end
    object qryRubricasPatroIDRUBREMTOTAL: TFloatField
      FieldName = 'IDRUBREMTOTAL'
      Origin = 'PATRO.IDRUBREMTOTAL'
    end
    object qryRubricasPatroIDREGRAREMTOTAL: TFloatField
      FieldName = 'IDREGRAREMTOTAL'
      Origin = 'PATRO.IDREGRAREMTOTAL'
    end
    object qryRubricasPatroIDREGRACALCSALPA: TFloatField
      FieldName = 'IDREGRACALCSALPA'
      Origin = 'PATRO.IDREGRACALCSALPA'
    end
    object qryRubricasPatroIDRUBSALPARTICIP: TFloatField
      FieldName = 'IDRUBSALPARTICIP'
      Origin = 'PATRO.IDRUBSALPARTICIP'
    end
    object qryRubricasPatroIDRUBSALMANUT: TFloatField
      FieldName = 'IDRUBSALMANUT'
      Origin = 'PATRO.IDRUBSALMANUT'
    end
    object qryRubricasPatroIDRUBSALMANUTPARC: TFloatField
      FieldName = 'IDRUBSALMANUTPARC'
      Origin = 'PATRO.IDRUBSALMANUTPARC'
    end
    object qryRubricasPatroIDRUBSALAUXDOENCA: TFloatField
      FieldName = 'IDRUBSALAUXDOENCA'
      Origin = 'PATRO.IDRUBSALAUXDOENCA'
    end
  end
  object qrySalPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDPESSOA,H.MESCOBRANCA,H.IDMOTIVO,H.MES,H.IDPESSJUR,H.R' +
        'EFERENCIA,'
      
        '       H.IDRUBRICA,H.CODPROVDESC,H.CODMOEDA,H.VALORPROVENTO,H.ID' +
        'REGRACALCULO,'
      
        '       H.FLGCOMPOESALPART,H.FLGCOMPOESALBENEF,H.FLGIRRF,H.VALORC' +
        'OTAS'
      'FROM   HISTRUBSAL H'
      'WHERE  (H.IDPESSOA = :IdPessoa)'
      'AND    (H.IDPESSJUR = :IdPessJur)'
      'AND    (H.IDMOTIVO = :IdMotivo)'
      'AND    (H.MES = :MesRef)'
      'AND    (H.FLGCOMPOESALPART = 1)'
      '')
    ValidateWithMask = True
    Left = 196
    Top = 57
    ParamData = <
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
        Name = 'IdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end>
    object qrySalPartIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'HISTRUBSAL.IDPESSOA'
    end
    object qrySalPartMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'HISTRUBSAL.MESCOBRANCA'
      Size = 7
    end
    object qrySalPartIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'HISTRUBSAL.IDMOTIVO'
    end
    object qrySalPartMES: TStringField
      FieldName = 'MES'
      Origin = 'HISTRUBSAL.MES'
      Size = 7
    end
    object qrySalPartIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'HISTRUBSAL.IDPESSJUR'
    end
    object qrySalPartREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'HISTRUBSAL.REFERENCIA'
      Size = 10
    end
    object qrySalPartIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'HISTRUBSAL.IDRUBRICA'
    end
    object qrySalPartCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Origin = 'HISTRUBSAL.CODPROVDESC'
      Size = 7
    end
    object qrySalPartCODMOEDA: TFloatField
      FieldName = 'CODMOEDA'
      Origin = 'HISTRUBSAL.CODMOEDA'
    end
    object qrySalPartVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
    end
    object qrySalPartIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'HISTRUBSAL.IDREGRACALCULO'
    end
    object qrySalPartFLGCOMPOESALPART: TFloatField
      FieldName = 'FLGCOMPOESALPART'
      Origin = 'HISTRUBSAL.FLGCOMPOESALPART'
    end
    object qrySalPartFLGCOMPOESALBENEF: TFloatField
      FieldName = 'FLGCOMPOESALBENEF'
      Origin = 'HISTRUBSAL.FLGCOMPOESALBENEF'
    end
    object qrySalPartFLGIRRF: TFloatField
      FieldName = 'FLGIRRF'
      Origin = 'HISTRUBSAL.FLGIRRF'
    end
    object qrySalPartVALORCOTAS: TFloatField
      FieldName = 'VALORCOTAS'
      Origin = 'HISTRUBSAL.VALORCOTAS'
    end
  end
  object qrySalBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDPESSOA,H.MESCOBRANCA,H.IDMOTIVO,H.MES,H.IDPESSJUR,H.R' +
        'EFERENCIA,'
      
        '       H.IDRUBRICA,H.CODPROVDESC,H.CODMOEDA,H.VALORPROVENTO,H.ID' +
        'REGRACALCULO,'
      
        '       H.FLGCOMPOESALPART,H.FLGCOMPOESALBENEF,H.FLGIRRF,H.VALORC' +
        'OTAS'
      'FROM   HISTRUBSAL H'
      'WHERE  (H.IDPESSOA = :IdPessoa)'
      'AND    (H.IDPESSJUR = :IdPessJur)'
      'AND    (H.IDMOTIVO = :IdMotivo)'
      'AND    (H.MES = :MesRef)'
      'AND    (H.FLGCOMPOESALBENEF = 1)'
      '')
    ValidateWithMask = True
    Left = 204
    Top = 105
    ParamData = <
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
        Name = 'IdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end>
    object qrySalBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'HISTRUBSAL.IDPESSOA'
    end
    object qrySalBenefMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'HISTRUBSAL.MESCOBRANCA'
      Size = 7
    end
    object qrySalBenefIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'HISTRUBSAL.IDMOTIVO'
    end
    object qrySalBenefMES: TStringField
      FieldName = 'MES'
      Origin = 'HISTRUBSAL.MES'
      Size = 7
    end
    object qrySalBenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'HISTRUBSAL.IDPESSJUR'
    end
    object qrySalBenefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'HISTRUBSAL.REFERENCIA'
      Size = 10
    end
    object qrySalBenefIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'HISTRUBSAL.IDRUBRICA'
    end
    object qrySalBenefCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Origin = 'HISTRUBSAL.CODPROVDESC'
      Size = 7
    end
    object qrySalBenefCODMOEDA: TFloatField
      FieldName = 'CODMOEDA'
      Origin = 'HISTRUBSAL.CODMOEDA'
    end
    object qrySalBenefVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
    end
    object qrySalBenefIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'HISTRUBSAL.IDREGRACALCULO'
    end
    object qrySalBenefFLGCOMPOESALPART: TFloatField
      FieldName = 'FLGCOMPOESALPART'
      Origin = 'HISTRUBSAL.FLGCOMPOESALPART'
    end
    object qrySalBenefFLGCOMPOESALBENEF: TFloatField
      FieldName = 'FLGCOMPOESALBENEF'
      Origin = 'HISTRUBSAL.FLGCOMPOESALBENEF'
    end
    object qrySalBenefFLGIRRF: TFloatField
      FieldName = 'FLGIRRF'
      Origin = 'HISTRUBSAL.FLGIRRF'
    end
    object qrySalBenefVALORCOTAS: TFloatField
      FieldName = 'VALORCOTAS'
      Origin = 'HISTRUBSAL.VALORCOTAS'
    end
  end
  object qrySalario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDPESSOA,H.MESCOBRANCA,H.IDMOTIVO,H.MES,H.IDPESSJUR,H.R' +
        'EFERENCIA,'
      
        '       H.IDRUBRICA,H.CODPROVDESC,H.CODMOEDA,H.VALORPROVENTO,H.ID' +
        'REGRACALCULO,'
      
        '       H.FLGCOMPOESALPART,H.FLGCOMPOESALBENEF,H.FLGIRRF,H.VALORC' +
        'OTAS'
      'FROM   HISTRUBSAL H'
      'WHERE  (H.IDPESSOA = :IdPessoa)'
      'AND    (H.IDPESSJUR = :IdPessJur)'
      'AND    (H.IDMOTIVO = :IdMotivo)'
      'AND    (H.MES = :MesRef)'
      '')
    ValidateWithMask = True
    Left = 124
    Top = 116
    ParamData = <
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
        Name = 'IdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end>
    object qrySalarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'HISTRUBSAL.IDPESSOA'
    end
    object qrySalarioMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'HISTRUBSAL.MESCOBRANCA'
      Size = 7
    end
    object qrySalarioIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'HISTRUBSAL.IDMOTIVO'
    end
    object qrySalarioMES: TStringField
      FieldName = 'MES'
      Origin = 'HISTRUBSAL.MES'
      Size = 7
    end
    object qrySalarioIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'HISTRUBSAL.IDPESSJUR'
    end
    object qrySalarioREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'HISTRUBSAL.REFERENCIA'
      Size = 10
    end
    object qrySalarioIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'HISTRUBSAL.IDRUBRICA'
    end
    object qrySalarioCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Origin = 'HISTRUBSAL.CODPROVDESC'
      Size = 7
    end
    object qrySalarioCODMOEDA: TFloatField
      FieldName = 'CODMOEDA'
      Origin = 'HISTRUBSAL.CODMOEDA'
    end
    object qrySalarioVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
    end
    object qrySalarioIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'HISTRUBSAL.IDREGRACALCULO'
    end
    object qrySalarioFLGCOMPOESALPART: TFloatField
      FieldName = 'FLGCOMPOESALPART'
      Origin = 'HISTRUBSAL.FLGCOMPOESALPART'
    end
    object qrySalarioFLGCOMPOESALBENEF: TFloatField
      FieldName = 'FLGCOMPOESALBENEF'
      Origin = 'HISTRUBSAL.FLGCOMPOESALBENEF'
    end
    object qrySalarioFLGIRRF: TFloatField
      FieldName = 'FLGIRRF'
      Origin = 'HISTRUBSAL.FLGIRRF'
    end
    object qrySalarioVALORCOTAS: TFloatField
      FieldName = 'VALORCOTAS'
      Origin = 'HISTRUBSAL.VALORCOTAS'
    end
  end
  object qryDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DPP.IDPESSJUR,DPP.SITFUNDACAO,DPP.DIACOBNORMAL,DPP.IDPLAN' +
        'OPREV,'
      
        '       DPP.FLGUTILNORMAL,DPP.FLGANTERIORNORMAL,DPP.FLGMESCOBNORM' +
        'AL'
      'FROM   DATASPATROPLANO DPP'
      'WHERE  (DPP.IDPESSJUR   = :IdPessJur)'
      'AND    (DPP.IDPLANOPREV = :IdPlanoPrev)'
      'AND    (DPP.SITFUNDACAO = :SitFundacao)'
      '')
    ValidateWithMask = True
    Left = 123
    Top = 54
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
        DataType = ftString
        Name = 'SitFundacao'
        ParamType = ptUnknown
      end>
    object qryDatasIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'DATASPATROPLANO.IDPESSJUR'
    end
    object qryDatasSITFUNDACAO: TStringField
      FieldName = 'SITFUNDACAO'
      Origin = 'DATASPATROPLANO.SITFUNDACAO'
      Size = 2
    end
    object qryDatasDIACOBNORMAL: TFloatField
      FieldName = 'DIACOBNORMAL'
      Origin = 'DATASPATROPLANO.DIACOBNORMAL'
    end
    object qryDatasIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'DATASPATROPLANO.IDPLANOPREV'
    end
    object qryDatasFLGUTILNORMAL: TStringField
      FieldName = 'FLGUTILNORMAL'
      Origin = 'DATASPATROPLANO.FLGUTILNORMAL'
      Size = 1
    end
    object qryDatasFLGANTERIORNORMAL: TStringField
      FieldName = 'FLGANTERIORNORMAL'
      Origin = 'DATASPATROPLANO.FLGANTERIORNORMAL'
      Size = 1
    end
    object qryDatasFLGMESCOBNORMAL: TStringField
      FieldName = 'FLGMESCOBNORMAL'
      Origin = 'DATASPATROPLANO.FLGMESCOBNORMAL'
      Size = 1
    end
  end
  object qryMantidos1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PPP.IDPESSOA,PPP.IDPESSJUR,PPP.IDPLANOPREV,PPP.FLGSALVIRT' +
        'BENEF,'
      '       PPP.SALMANTIDO,PPP.SALAUXDOENCA,S.FLGINTERNO,EP.MATRICULA'
      'FROM   PARTPREVPLAN PPP,SITPART S,ELEGPATRO EP'
      'WHERE  (PPP.IDPESSJUR = :IdPessJur)'
      'AND    (S.FLGINTERNO IN ('#39'MA'#39','#39'MP'#39','#39'AS'#39'))'
      'AND    (PPP.IDSITPART = S.IDSITPART)'
      'AND    (EP.IDPESSOA = PPP.IDPESSOA)'
      'AND    (EP.IDPESSJUR = PPP.IDPESSJUR)'
      '')
    ValidateWithMask = True
    Left = 300
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end>
    object qryMantidos1IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMantidos1IDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryMantidos1IDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMantidos1FLGSALVIRTBENEF: TFloatField
      FieldName = 'FLGSALVIRTBENEF'
    end
    object qryMantidos1SALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
    end
    object qryMantidos1SALAUXDOENCA: TFloatField
      FieldName = 'SALAUXDOENCA'
    end
    object qryMantidos1FLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Size = 2
    end
    object qryMantidos1MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
  end
  object qryMantidos2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PPP.IDPESSOA,PPP.IDPESSJUR,PPP.IDPLANOPREV,PPP.FLGSALVIRT' +
        'BENEF,'
      '       PPP.SALMANTIDO,PPP.SALAUXDOENCA,S.FLGINTERNO,EP.MATRICULA'
      'FROM   PARTPREVPLAN PPP,SITPART S,ELEGPATRO EP'
      'WHERE  (PPP.IDPESSJUR = :IdPessJur)'
      'AND    (S.FLGINTERNO IN ('#39'MA'#39','#39'MP'#39','#39'AS'#39'))'
      'AND    (PPP.IDSITPART = S.IDSITPART)'
      'AND    (EP.IDPESSOA = PPP.IDPESSOA)'
      'AND    (EP.IDPESSJUR = PPP.IDPESSJUR)'
      'AND    (PPP.IDPESSOA NOT IN (:Pessoas))'
      '')
    ValidateWithMask = True
    Left = 300
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Pessoas'
        ParamType = ptUnknown
      end>
    object qryMantidos2IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMantidos2IDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryMantidos2IDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMantidos2FLGSALVIRTBENEF: TFloatField
      FieldName = 'FLGSALVIRTBENEF'
    end
    object qryMantidos2SALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
    end
    object qryMantidos2SALAUXDOENCA: TFloatField
      FieldName = 'SALAUXDOENCA'
    end
    object qryMantidos2FLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Size = 2
    end
    object qryMantidos2MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
  end
  object qryUpdCtrlInterf1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CTRLINTERFACE CI'
      'SET    CI.FLGVOLTAINTERFACE = 1,'
      '       CI.DATAVOLTAINTERFA = :DataRef,'
      '       CI.VLRTOTAL = (SELECT SUM(T.VALORRECEBIDO) FROM TMPDESC T'
      '                      WHERE T.IDLOTE = CI.IDLOTE AND'
      '                            T.IDPESSJUR = CI.IDPESSOA AND'
      '                            T.MESREFERENCIA = CI.MESREFERENCIA),'
      '       CI.NUMREG   = (SELECT COUNT(T.ORDEM) FROM TMPDESC T'
      '                      WHERE T.IDLOTE = CI.IDLOTE AND'
      '                            T.IDPESSJUR = CI.IDPESSOA AND'
      '                            T.MESREFERENCIA = CI.MESREFERENCIA)'
      'WHERE  (CI.IDPESSOA = :IdPessJur)'
      ''
      '')
    ValidateWithMask = True
    Left = 138
    Top = 171
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end>
    object FloatField23: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField24: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object FloatField25: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object FloatField26: TFloatField
      FieldName = 'FLGSALVIRTBENEF'
    end
    object FloatField27: TFloatField
      FieldName = 'SALMANTIDO'
    end
    object FloatField28: TFloatField
      FieldName = 'SALAUXDOENCA'
    end
    object StringField9: TStringField
      FieldName = 'FLGINTERNO'
      Size = 2
    end
    object StringField10: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
  end
  object qryUpdCtrlInterf2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CTRLINTERFACE CI'
      'SET    CI.FLGVOLTAINTERFACE = 1,'
      '       CI.DATAVOLTAINTERFA = :DataRef,'
      '       CI.VLRTOTAL = (SELECT SUM(T.VALORRECEBIDO) FROM TMPDESC T'
      '                      WHERE T.IDLOTE = CI.IDLOTE AND'
      '                            T.IDPESSJUR = CI.IDPESSOA AND'
      '                            T.MESREFERENCIA = CI.MESREFERENCIA),'
      '       CI.NUMREG   = (SELECT COUNT(T.ORDEM) FROM TMPDESC T'
      '                      WHERE T.IDLOTE = CI.IDLOTE AND'
      '                            T.IDPESSJUR = CI.IDPESSOA AND'
      '                            T.MESREFERENCIA = CI.MESREFERENCIA)'
      'WHERE  (CI.IDPESSOA = :IdPessJur)'
      'AND    (CI.IDLOTE IN (:IdLote))'
      '')
    ValidateWithMask = True
    Left = 231
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end>
    object FloatField29: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField30: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object FloatField31: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object FloatField32: TFloatField
      FieldName = 'FLGSALVIRTBENEF'
    end
    object FloatField33: TFloatField
      FieldName = 'SALMANTIDO'
    end
    object FloatField34: TFloatField
      FieldName = 'SALAUXDOENCA'
    end
    object StringField11: TStringField
      FieldName = 'FLGINTERNO'
      Size = 2
    end
    object StringField12: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
  end
  object qryInsTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'INSERT INTO TMPDESC (IDLOTE,IDFUNDACAO,IDPESSJUR,IDPLANOPREV,IDT' +
        'ITULAR,'
      'IDPESSOA,SEQPROPOSTA,IDMOTIVO,IDDESCONTO,IDPROVENTO,CODPROVDESC,'
      'MESREFERENCIA,MESCOBRANCA,FLGTIPODESC,VALOR,VALORRECEBIDO,'
      'DATACOBRANCA,DATARECEBIMENTO,ORDEM,NUMPRIORIDADE,MATRICULA,'
      
        'FLGDESCONTO,FLGDESCFOLHA,FLGATRASODEVOL,FLGEXISTEHST,DATAREFEREN' +
        'CIA,'
      'DESCRICAO,REFERENCIA,SISTORIGEM,SITENVIO,'
      'NODOCUMENTO,COMPLDOCUMENTO,'
      'IDFAVORECIDO,IDEMPCOBRANCA)'
      'VALUES (:IDLOTE,:IDFUNDACAO,:IDPESSJUR,:IDPLANOPREV,:IDTITULAR,'
      
        ':IDPESSOA,:SEQPROPOSTA,:IDMOTIVO,:IDDESCONTO,:IDPROVENTO,:CODPRO' +
        'VDESC,'
      ':MESREFERENCIA,:MESCOBRANCA,:FLGTIPODESC,:VALOR,:VALORRECEBIDO,'
      ':DATACOBRANCA,'
      ':DATARECEBIMENTO,:ORDEM,:NUMPRIORIDADE,:MATRICULA,'
      
        ':FLGDESCONTO,:FLGDESCFOLHA,:FLGATRASODEVOL,:FLGEXISTEHST,:DATARE' +
        'FERENCIA,'
      
        ':DESCRICAO,:REFERENCIA,:SISTORIGEM,:SITENVIO,:NODOCUMENTO,:COMPL' +
        'DOCUMENTO,'
      ':IDFAVORECIDO,:IDEMPCOBRANCA)'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 297
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
        DataType = ftInteger
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
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMPRIORIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MATRICULA'
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
        DataType = ftString
        Name = 'FLGATRASODEVOL'
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
      end>
  end
  object qryContribRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CP.IDCONTRIBUICAO, CP.IDCONTRIBUICAO AS IDDESCONTO,'
      
        '       CP.IDREGRACALCULO, CP.IDREGRAPRIMPAGTO, CP.IDREGRAULTPAGT' +
        'O,'
      
        '       SP.FLGINTERNO AS SITFUNDACAO, PP.IDPESSJUR, PP.IDPLANOPRE' +
        'V,'
      
        '       PP.IDPESSOA, PP.SEQPROPOSTA, PP.INSCRICAODATA, CPP.DATAIN' +
        'ICIO, CPP.DATAFINAL,'
      '       PF.DATANASC, RP.CODPROVDESC, CP.IDRUBRICA'
      
        'FROM   CONTPREV CP, PLANPREVPATRO PLP, SITPART SP, PARTPREVPLAN ' +
        'PP,'
      '       contribprevpartp CPP, PESSOAFISICA PF, RUBRICAXPESS RP'
      'WHERE  (PP.FLGDESATIVADO  = 0)'
      'AND    (PP.IDPESSOA       = :piIdPessoa)'
      'AND    (PF.IDPESSOA(+)    = :piIdPessoa)'
      'AND    (PLP.IDPESSJUR     = :piIdPessJur)'
      'AND    (PLP.IDPLANOPREV   = :piIdPlanoPrev)'
      'AND    (RP.CODPROVDESC    = :psCodProvDesc)'
      'AND    (RP.IDPESSOA       = PLP.IDPESSJUR)'
      'AND    (CP.IDRUBRICA      = RP.IDRUBRICA)'
      'AND    (PP.IDPESSJUR      = PLP.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV    = PLP.IDPLANOPREV)'
      'AND    (CPP.IDPESSOA      = PP.IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA   = PP.SEQPROPOSTA)'
      'AND    (CPP.IDPESSJUR     = PP.IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV   = PP.IDPLANOPREV)'
      'AND    (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO)'
      'AND    (CP.IDPLANOPREV    = CPP.IDPLANOPREV)'
      'AND'#9' (SP.IDSITPART'#9'  = PP.IDSITPART)'
      'ORDER BY CP.ORDEMCALCULO '
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 128
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessoa'
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
        DataType = ftString
        Name = 'psCodProvDesc'
        ParamType = ptUnknown
      end>
  end
  object qryTmpDescPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   TD.VALOR,TD.ORDEM,TD.FLGTIPODESC,TD.FLGDESCFOLHA,TD.MES' +
        'REFERENCIA,'
      
        '         TD.MESCOBRANCA,TD.IDLOTE, TD.IDDESCONTO, TD.NUMPRIORIDA' +
        'DE, '
      
        '         TD.IDPESSJUR, TD.IDPLANOPREV, TD.IDPESSOA, TD.SEQPROPOS' +
        'TA,'
      
        '         TD.IDDESCONTO AS IDCONTRIBUICAO, CP.IDREGRACALCULO, CP.' +
        'IDREGRAPRIMPAGTO,'
      
        '         CP.IDREGRAULTPAGTO, SP.FLGINTERNO AS SITFUNDACAO, CPP.D' +
        'ATAINICIO,'
      '         CPP.DATAFINAL, PP.INSCRICAODATA, PF.DATANASC'
      
        'FROM     CONTPREV CP, SITPART SP, PARTPREVPLAN PP, CONTRIBPREVPA' +
        'RTPLAN CPP,'
      '         TMPDESC TD, PESSOAFISICA PF '
      'WHERE    (TD.CODPROVDESC   = :CodProvDesc)'
      'AND      (TD.IDPESSOA      = :IdPessoa)'
      'AND      (TD.MESREFERENCIA = :MesRef)'
      'AND      (TD.IDPESSJUR     = :IdPessJur)'
      'AND      (TD.DATARECEBIMENTO IS NULL)'
      'AND      (NOT (TD.VALORRECEBIDO > 0))'
      'AND      (PF.IDPESSOA(+)   = :IdPessoa)'
      'AND      (PP.IDPESSJUR     = :IdPessJur)'
      'AND      (PP.IDPESSOA      = :IdPessoa)'
      'AND      (PP.FLGDESATIVADO = 0)'
      'AND      (PP.IDPLANOPREV   = TD.IDPLANOPREV)'
      'AND      (PP.SEQPROPOSTA   = TD.SEQPROPOSTA)'
      'AND      (CPP.IDPESSOA     = PP.IDPESSOA)'
      'AND      (CPP.SEQPROPOSTA  = PP.SEQPROPOSTA)'
      'AND      (CPP.IDCONTRIBUICAO = TD.IDDESCONTO)'
      'AND      (CPP.IDPESSJUR    = PP.IDPESSJUR)'
      'AND      (CPP.IDPLANOPREV  = PP.IDPLANOPREV)'
      'AND      (SP.IDSITPART     = PP.IDSITPART)'
      'ORDER BY TD.NUMPRIORIDADE'
      '')
    ValidateWithMask = True
    Left = 240
    Top = 293
    ParamData = <
      item
        DataType = ftString
        Name = 'CodProvDesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
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
    object FloatField1: TFloatField
      FieldName = 'VALOR'
      Origin = 'TMPDESC.VALOR'
    end
    object FloatField2: TFloatField
      FieldName = 'ORDEM'
      Origin = 'TMPDESC.ORDEM'
    end
    object StringField1: TStringField
      FieldName = 'FLGTIPODESC'
      Origin = 'TMPDESC.FLGTIPODESC'
      Size = 1
    end
    object StringField2: TStringField
      FieldName = 'FLGDESCFOLHA'
      Origin = 'TMPDESC.FLGDESCFOLHA'
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'TMPDESC.MESREFERENCIA'
      Size = 7
    end
    object StringField4: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'TMPDESC.MESCOBRANCA'
      Size = 7
    end
    object FloatField3: TFloatField
      FieldName = 'IDLOTE'
      Origin = 'TMPDESC.IDLOTE'
    end
    object FloatField4: TFloatField
      FieldName = 'IDDESCONTO'
      Origin = 'TMPDESC.IDDESCONTO'
    end
    object FloatField5: TFloatField
      FieldName = 'NUMPRIORIDADE'
      Origin = 'TMPDESC.NUMPRIORIDADE'
    end
    object FloatField6: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TMPDESC.IDPESSOA'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 118
    Top = 233
  end
  object qryGravaRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CLASSERUBRICAS'
      '(CODPATRO,'
      ' CODPLANO,'
      ' MESREFERENCIA,'
      ' MESCOBRANCA,'
      ' VALORRECEBIDO,'
      ' CODPROVDESC,'
      ' CHAVE,'
      ' VALORCHAVE,'
      ' DATAREFERENCIA,'
      ' SEQINTERFACE)'
      'VALUES'
      '(:IdPessJur,'
      ' :IdPlanoPrev,'
      ' :MesRef,'
      ' :MesCob,'
      ' :Valor,'
      ' :CodProvDesc,'
      ' :Chave,'
      ' :ValorChave,'
      ' :DataRef,'
      ' :SeqInterface)')
    ValidateWithMask = True
    Left = 203
    Top = 233
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
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesCob'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CodProvDesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Chave'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ValorChave'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SeqInterface'
        ParamType = ptUnknown
      end>
  end
end
