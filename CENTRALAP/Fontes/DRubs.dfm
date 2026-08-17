object DtmRubs: TDtmRubs
  OldCreateOrder = True
  Left = 231
  Top = 113
  Height = 528
  Width = 793
  object QryInsRubs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into RUBS'
      
        '  (IDRUBS, FLGSTATUS, IDASSUNTOXATEND, IDHISTLANCTO, IDHISTBAIXA' +
        ', IDCANCELAMENTO)'
      'values'
      
        '  (:IDRUBS, :FLGSTATUS, :IDASSUNTOXATEND, :IDHISTLANCTO, :IDHIST' +
        'BAIXA, '
      '   :IDCANCELAMENTO)')
    ValidateWithMask = True
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDASSUNTOXATEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHISTLANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHISTBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCANCELAMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdRubs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update RUBS'
      'set'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDRUBS = :IDRUBS')
    ValidateWithMask = True
    Left = 32
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
  end
  object QryInsTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into TIPODOCXRUB'
      
        '  (IDRUBXBENEFICIO, IDTIPODOCXRUB, IDDOCUMENTO, DATARECEB, FLGRE' +
        'CEBIDO, OBS)'
      'values'
      
        '  (:IDRUBXBENEFICIO, :IDTIPODOCXRUB, :IDDOCUMENTO, :DATARECEB, :' +
        'FLGRECEBIDO, :OBS)')
    ValidateWithMask = True
    Left = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBXBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTIPODOCXRUB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATARECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGRECEBIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptInput
      end>
  end
  object QryInsBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into RUBXBENEFICIO'
      
        '  (IDRUBXBENEFICIO, IDPESSJUR, IDPESSOA, IDPLANOPREV, IDBENEFICI' +
        'O, IDRUBS, '
      '   IDSITBENEF, IDTITULAR)'
      'values'
      
        '  (:IDRUBXBENEFICIO, :IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :IDBEN' +
        'EFICIO, '
      '   :IDRUBS, :IDSITBENEF, :IDTITULAR)')
    ValidateWithMask = True
    Left = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBXBENEFICIO'
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
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object QryUpdTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update TIPODOCXRUB'
      'set'
      '  DATARECEB = :DATARECEB,'
      '  FLGRECEBIDO = :FLGRECEBIDO,'
      '  OBS = :OBS'
      'where'
      '  IDTIPODOCXRUB = :IDTIPODOCXRUB')
    ValidateWithMask = True
    Left = 120
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATARECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGRECEBIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDTIPODOCXRUB'
        ParamType = ptUnknown
      end>
  end
  object QryInsHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into HISTMOVRUBS'
      '  (IDHISTMOVRUBS, IDRUBS, FLGSTATUS, HISTORICO, DATAMOV)'
      'values'
      '  (:IDHISTMOVRUBS, :IDRUBS, :FLGSTATUS, :HISTORICO, :DATAMOV)')
    ValidateWithMask = True
    Left = 280
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTMOVRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
  end
  object QryUpdHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update HISTMOVRUBS'
      'set'
      '  IDRUBS = :IDRUBS,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  HISTORICO = :HISTORICO,'
      '  DATAMOV = :DATAMOV'
      'where'
      '  IDHISTMOVRUBS = :IDHISTMOVRUBS ')
    ValidateWithMask = True
    Left = 216
    Top = 48
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHISTMOVRUBS'
        ParamType = ptUnknown
      end>
  end
  object QryUpdHistLancto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update RUBS'
      'set'
      '  IDHISTLANCTO = :IDHISTLANCTO'
      'where'
      '  IDRUBS = :IDRUBS')
    ValidateWithMask = True
    Left = 32
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTLANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
  end
  object QryUpdHistBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update RUBS'
      'set'
      '  IDHISTBAIXA = :IDHISTBAIXA,'
      '  IDCANCELAMENTO = :IDCANCELAMENTO'
      'where'
      '  IDRUBS = :IDRUBS')
    ValidateWithMask = True
    Left = 32
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCANCELAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
  end
  object QryModelorub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'DISTINCT   C.IDCONFIGRUBS,'
      '  C.DESCRUB,'
      '  C.NOMETXTRUB,'
      '  C.NOMEDOCRUB,'
      '  C.SEPARADORCOLUNAS,'
      '  C.NUMDIASCARTAAVISO,'
      '  C.FLGDELIMITALINHA'
      'FROM'
      '  CONFIGRUBS C,'
      '  RUBS R,'
      '  ASSUNTO A,'
      '  ASSUNTOXATEND AXA'
      ''
      'WHERE'
      '  R.IDRUBS = :IDRUBS  AND'
      
        '  (A.IDCONFIGRUBS =  R.IDCONFIGRUBS OR   R.IDASSUNTOXATEND = AXA' +
        '.IDASSUNTOXATEND)  AND'
      '  A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND'
      '  A.IDASSUNTO = AXA.IDASSUNTO(+)  AND'
      '  C.IDCONFIGRUBS = A.IDCONFIGRUBS  '
      '')
    ValidateWithMask = True
    Left = 342
    Top = 5
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object QryModelorubDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Origin = '"CM.RUBS".DESCRUB'
      Size = 60
    end
    object QryModelorubNOMETXTRUB: TStringField
      FieldName = 'NOMETXTRUB'
      Origin = '"CM.RUBS".NOMETXTRUB'
      Size = 60
    end
    object QryModelorubSEPARADORCOLUNAS: TStringField
      FieldName = 'SEPARADORCOLUNAS'
      Origin = '"CM.RUBS".SEPARADORCOLUNAS'
      Size = 1
    end
    object QryModelorubNUMDIASCARTAAVISO: TFloatField
      FieldName = 'NUMDIASCARTAAVISO'
      Origin = 'RUBS.NUMDIASCARTAAVISO'
    end
    object QryModelorubIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = '"CM.CONFIGRUBS".IDCONFIGRUBS'
    end
    object QryModelorubNOMEDOCRUB: TStringField
      FieldName = 'NOMEDOCRUB'
      Origin = '"CM.CONFIGRUBS".NOMEDOCRUB'
      Size = 60
    end
    object QryModelorubFLGDELIMITALINHA: TStringField
      FieldName = 'FLGDELIMITALINHA'
      Origin = '"CM.RUBS".FLGDELIMITALINHA'
      Size = 1
    end
  end
  object QryCamposRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.IDCONFIGRUBS, D.CAMPODETALHE, D.LARGURACOLUNA,'
      '  D.DESCHEADERRUBS, C.FLGTIPOARQUIVO, D.IDDETALHERUBS'
      'FROM'
      '  DETALHERUBS D, CONFIGRUBS C'
      'WHERE'
      '  D.IDCONFIGRUBS = :IDCONFIGRUBS AND'
      '  D.IDCONFIGRUBS  = C.IDCONFIGRUBS ')
    ValidateWithMask = True
    Left = 124
    Top = 154
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
    object QryCamposRubCAMPODETALHE: TStringField
      FieldName = 'CAMPODETALHE'
      Origin = 'DETALHERUBS.CAMPODETALHE'
      Size = 60
    end
    object QryCamposRubLARGURACOLUNA: TFloatField
      FieldName = 'LARGURACOLUNA'
      Origin = 'DETALHERUBS.LARGURACOLUNA'
    end
    object QryCamposRubDESCHEADERRUBS: TStringField
      FieldName = 'DESCHEADERRUBS'
      Origin = 'HEADERRUBS.DESCHEADERRUBS'
      Size = 60
    end
    object QryCamposRubIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = 'DETALHERUBS.IDCONFIGRUBS'
    end
    object QryCamposRubFLGTIPOARQUIVO: TStringField
      FieldName = 'FLGTIPOARQUIVO'
      Origin = 'BASEDADOS.CONFIGRUBS.FLGTIPOARQUIVO'
      FixedChar = True
      Size = 1
    end
    object QryCamposRubIDDETALHERUBS: TFloatField
      FieldName = 'IDDETALHERUBS'
      Origin = 'BASEDADOS.DETALHERUBS.IDDETALHERUBS'
    end
  end
  object QryGeraRubantes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       RUBS.IDRUBS AS IDRUB,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIPANTE,'
      '       EP.LOGRADOURO AS ENDERECO,'
      '       EP.NUMERO AS NUMERO,'
      '       EP.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       EP.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       EP.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIPANTE,'
      '       A.NOMESOLICITANTE,'
      '       A.LOGRADOURO AS ENDERECO_SOLICITANTE,'
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,'
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLICITANTE,'
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,'
      '       A.CEPSOLIC AS CEP_SOLICITANTE,'
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,'
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,'
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,'
      '       EL.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEPENDENTE_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEPENDENTES_SALFAMILIA,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS EP,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       ATEND A,'
      '       ASSUNTOXATEND AXA,'
      '       RUBS,'
      '       TELENDPESS TE'
      'WHERE'
      '      (RUBS.IDRUBS = :IDRUBS)'
      'AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = EL.IDPESSOA)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = P.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND   (P.IDENDCORRESP = EP.IDENDERECO (+))'
      'AND   (EP.IDCIDADES = CID.IDCIDADES (+))'
      'AND   (CID.IDESTADO = EST.IDESTADO (+))'
      'AND   (A.IDTITULAR = P.IDPESSOA)'
      'AND   (A.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (A.IDATEND = AXA.IDATEND)'
      'AND   (TE.IDENDERECO(+) = EP.IDENDERECO)'
      ' ')
    ValidateWithMask = True
    Left = 452
    Top = 29
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
  end
  object QryGeraRubxBenf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_BEN_SERV,'
      '   ('#39'B'#39') AS BF,'
      '   RB.IDBENEFICIO,'
      '   RB.IDPESSJUR AS IDPESSOA,'
      '   RB.IDPLANOPREV,'
      '   RB.IDSITBENEF'
      'FROM'
      '   RUBXBENEFICIO RB, BENEFICIO BE'
      'WHERE'
      '   (RB.IDRUBS = :IDRUBS) AND'
      '   (RB.IDBENEFICIO = BE.IDBENEFICIO)'
      'UNION'
      'SELECT'
      '   SERV.NOME AS NOME_BEN_SERV,'
      '   ('#39'S'#39') AS BF,'
      '   RB.IDBENEFICIO,'
      '   RB.IDPESSJUR AS IDPESSOA,'
      '   RB.IDPLANOPREV,'
      '   RB.IDSITBENEF'
      'FROM'
      '   RUBXBENEFICIO RB, SERVICO SERV'
      'WHERE'
      '   (RB.IDRUBS = :IDRUBS) AND'
      '   (RB.IDBENEFICIO = SERV.IDSERVICOS)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 278
    Top = 73
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object QryGeraRubxBenfBF: TStringField
      FieldName = 'BF'
      Size = 1
    end
    object QryGeraRubxBenfIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object QryGeraRubxBenfIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryGeraRubxBenfIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryGeraRubxBenfIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
    end
    object QryGeraRubxBenfNOME_BEN_SERV: TStringField
      FieldName = 'NOME_BEN_SERV'
      Size = 60
    end
  end
  object QryGeraRubTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    TD.NOMEDOCUMENTO'
      'FROM'
      '    TIPODOCXRUB TP, DOCUMENTOS TD, RUBXBENEFICIO RX'
      'WHERE'
      '    (RX.IDRUBS = :IDRUBS) AND'
      '    (TP.IDDOCUMENTO = TD.IDDOCUMENTO) AND'
      '    (RX.IDRUBXBENEFICIO = TP.IDRUBXBENEFICIO)'
      'ORDER BY'
      '    TD.NOMEDOCUMENTO'
      '')
    ValidateWithMask = True
    Left = 447
    Top = 85
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object QryGeraRubTipoDocNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'DOCUMENTOS.NOMEDOCUMENTO'
      Size = 100
    end
  end
  object QryAnexosRubs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCONFIGRUBS,'
      '  C.DESCRUB,'
      '  C.NOMETXTRUB,'
      '  C.NOMEDOCRUB,'
      '  C.SEPARADORCOLUNAS,'
      '  C.NUMDIASCARTAAVISO,'
      '  C.FLGDELIMITALINHA,'
      '  D.CAMPODETALHE,'
      '  D.LARGURACOLUNA,'
      '  D.DESCHEADERRUBS'
      'FROM'
      '  CONFIGRUBS C, DETALHERUBS D'
      'WHERE'
      '  D.IDCONFIGRUBS = :IDCONFIGRUBS AND'
      '  D.IDCONFIGRUBS = C.IDCONFIGRUBS')
    ValidateWithMask = True
    Left = 216
    Top = 108
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
    object QryAnexosRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object QryAnexosRubsDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Size = 60
    end
    object QryAnexosRubsNOMETXTRUB: TStringField
      FieldName = 'NOMETXTRUB'
      Size = 60
    end
    object QryAnexosRubsNOMEDOCRUB: TStringField
      FieldName = 'NOMEDOCRUB'
      Size = 60
    end
    object QryAnexosRubsSEPARADORCOLUNAS: TStringField
      FieldName = 'SEPARADORCOLUNAS'
      Size = 1
    end
    object QryAnexosRubsNUMDIASCARTAAVISO: TFloatField
      FieldName = 'NUMDIASCARTAAVISO'
    end
    object QryAnexosRubsFLGDELIMITALINHA: TStringField
      FieldName = 'FLGDELIMITALINHA'
      Size = 1
    end
    object QryAnexosRubsCAMPODETALHE: TStringField
      FieldName = 'CAMPODETALHE'
      Size = 60
    end
    object QryAnexosRubsLARGURACOLUNA: TFloatField
      FieldName = 'LARGURACOLUNA'
    end
    object QryAnexosRubsDESCHEADERRUBS: TStringField
      FieldName = 'DESCHEADERRUBS'
      Size = 60
    end
  end
  object QryTermosXBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCONFIGRUBS,IDTERMOSXBENEF'
      'FROM'
      '   TERMOSXBENEF'
      'WHERE'
      '   IDBENEFICIO = :IDBENEFICIO AND'
      '   IDPESSOA = :IDPESSOA AND'
      '   IDPLANOPREV = :IDPLANOPREV AND'
      '   IDSITBENEF = :IDSITBENEF'
      '')
    ValidateWithMask = True
    Left = 217
    Top = 154
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end>
    object QryTermosXBenefIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = '"CM.TERMOSXBENEF".IDCONFIGRUBS'
    end
    object QryTermosXBenefIDTERMOSXBENEF: TFloatField
      FieldName = 'IDTERMOSXBENEF'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 283
    Top = 120
  end
  object QryBuscaNumDocTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DOCPESSOA.NUMDOCUMENTO'
      'FROM'
      '  DOCPESSOA, ATEND, RUBS, ASSUNTOXATEND'
      'WHERE'
      '  (RUBS.IDRUBS = :IDRUBS) AND'
      '  (DOCPESSOA.IDPESSOA = ATEND.IDTITULAR) AND'
      '  (ASSUNTOXATEND.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND) AND'
      '  (ATEND.IDATEND = ASSUNTOXATEND.IDATEND)'
      '')
    ValidateWithMask = True
    Left = 352
    Top = 48
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object QryBuscaNumDocTitularNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'DOCPESSOA.NUMDOCUMENTO'
      Size = 18
    end
  end
  object QryBuscaDocTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIPODOCPESSOA.NOMEDOCUMENTO'
      'FROM'
      '  DOCPESSOA, ATEND, RUBS, ASSUNTOXATEND, TIPODOCPESSOA'
      'WHERE'
      '  (RUBS.IDRUBS = :IDRUBS) AND'
      '  (TIPODOCPESSOA.IDDOCUMENTO = DOCPESSOA.IDDOCUMENTO) AND'
      '  (DOCPESSOA.IDPESSOA = ATEND.IDTITULAR) AND'
      '  (ASSUNTOXATEND.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND) AND'
      '  (ATEND.IDATEND = ASSUNTOXATEND.IDATEND)')
    ValidateWithMask = True
    Left = 128
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object QryBuscaDocTitularNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
  end
  object QryGeraTermoTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    DOC.NOMEDOCUMENTO'
      'FROM'
      '    TERMOXDOC TD,TIPODOCXBENEF DB, '
      '                   DOCUMENTOS  DOC'
      'WHERE'
      '    (TD.IDPESSOA = :IDPESSOA) AND'
      '    (TD.IDPLANOPREV= :IDPLANOPREV) AND'
      '    (TD.IDSITBENEF = :IDSITBENEF) AND'
      '    (TD.IDBENEFICIO = :IDBENEFICIO) AND'
      '    (TD.IDTERMOSXBENEF = :IDTERMOSXBENEF) AND'
      '    (DB.IDTIPODOCXBENEF = TD.IDTIPODOCXBENEF)  AND'
      '    ( DOC.IDDOCUMENTO = DB.IDDOCUMENTO)'
      'ORDER BY'
      '    DOC.NOMEDOCUMENTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 359
    Top = 109
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTERMOSXBENEF'
        ParamType = ptUnknown
      end>
    object QryGeraTermoTipoDocNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'DOCUMENTOS.NOMEDOCUMENTO'
      Size = 100
    end
  end
  object QRYGERARUB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       RUBS.IDRUBS AS IDRUB,'
      '       A.IDATEND,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,'
      '       X.LOGRADOURO AS ENDERECO,'
      '       X.NUMERO AS NUMERO,'
      '       X.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       X.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       X.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIP,'
      '       A.NOMESOLICITANTE,'
      '       A.LOGRADOURO AS ENDERECO_SOLICIT,'
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,'
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLIC,'
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,'
      '       A.CEPSOLIC AS CEP_SOLICITANTE,'
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,'
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,'
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,'
      '       A.NUMDOCUMENTOCPF AS CPF_SOLICITANTE,'
      '       A.NUMDOCUMENTORG AS RG_SOLICITANTE,'
      '       A.EMAIL AS EMAIL_SOLICITANTE,'
      '       EL.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF ,'
      '       BAN.NUMBANCO  AS NUMERO_BANCO,'
      '       PB.NOME  AS NOME_BANCO,'
      '       AG.NUMAGENCIA  AS NUMERO_AGENCIA,'
      '       PA.NOME  AS NOME_AGENCIA,'
      '       CONT.CONTACORRENTE ,'
      '       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,'
      '       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,'
      '       CID.NOME AS  NOME_CIDADE,'
      '       DEPEN.DESCRICAO AS TIPO_DEPENDENTE'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS X,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       ATEND A,'
      '       ASSUNTOXATEND AXA,'
      '       RUBS,'
      '       TELENDPESS TE,'
      '       BANCO BAN,'
      '       AGENCIABANCARIA AG,'
      '       CONTABANCARIA  CONT,'
      '       PESSOA  PB,'
      '       PESSOA  PA,'
      '       PAIS PI ,'
      '       DEPEN DEPEN,'
      '       DEPENTIT   DEPENTIT'
      'WHERE'
      '      (RUBS.IDRUBS =  :IDRUBS)'
      'AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      'AND   ( P.IDENDCORRESP = X.IDENDERECO(+))'
      'AND   (  X.IDCIDADES = CID.IDCIDADES(+)  )'
      'AND   (  EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = EL.IDPESSOA)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = P.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      
        'and ((pp.FLGDESATIVADO = 1 AND pp.IDPESSOA NOT IN (SELECT PPP1.I' +
        'DPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = pp.IDPESSOA' +
        ' AND PPP1.FLGDESATIVADO IN (0, NULL))) OR pp.FLGDESATIVADO IN (0' +
        ', NULL) )'
      ''
      'AND   (A.IDTITULAR = P.IDPESSOA)'
      'AND   (A.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (A.IDATEND = AXA.IDATEND)'
      'AND   (EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (CONT.IDPESSOA (+) = P.IDPESSOA)'
      'AND   (CONT.FLGCONTAPREF  = 1 OR CONT.FLGCONTAPREF IS NULL)'
      'AND   (CONT.IDAGENCIA = AG.IDPESSOA(+))'
      'AND   (BAN.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PB.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PA.IDPESSOA(+) = AG.IDPESSOA)'
      'AND   (PI.IDPAIS(+) = PF.IDPAIS)'
      'AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO)'
      'AND   (DEPEN.IDDEPENDENCIA(+)   = DEPENTIT.IDDEPENDENCIA)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 300
    Top = 165
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptInput
      end>
  end
  object QRYVERIFICATERMO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCONFIGRUBS , IDBENEFICIARIO  FROM CONTROLATERMO  '
      'WHERE'
      '    IDCONFIGRUBS = :IDCONFIGRUBS'
      'AND IDBENEFICIARIO = :IDBENEFICIARIO'
      'AND IDDETALHERUBS = :IDDETALHERUBS'
      '')
    ValidateWithMask = True
    Left = 32
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDDETALHERUBS'
        ParamType = ptUnknown
      end>
  end
  object QryInsereControleTermo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into CONTROLATERMO'
      '  (IDCONFIGRUBS,IDBENEFICIARIO,IDDETALHERUBS)'
      'values'
      '   (:IDCONFIGRUBS,:IDBENEFICIARIO,:IDDETALHERUBS)'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IDDETALHERUBS'
        ParamType = ptUnknown
      end>
  end
  object qryGeraRubRecad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       RUBS.IDRUBS AS IDRUB,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,'
      '       X.LOGRADOURO AS ENDERECO,'
      '       X.NUMERO AS NUMERO,'
      '       X.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       X.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       X.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIP,'
      '       DEPENTIT.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF ,'
      '       BAN.NUMBANCO  AS NUMERO_BANCO,'
      '       PB.NOME  AS NOME_BANCO,'
      '       AG.NUMAGENCIA  AS NUMERO_AGENCIA,'
      '       PA.NOME  AS NOME_AGENCIA,'
      '       CONT.CONTACORRENTE ,'
      '       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,'
      '       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,'
      '       CID.NOME AS  NOME_CIDADE,'
      '       DEPEN.DESCRICAO AS TIPO_DEPENDENTE'
      '       '
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS X,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       RUBS,'
      '       TELENDPESS TE,'
      '       BANCO BAN,'
      '       AGENCIABANCARIA AG,'
      '       CONTABANCARIA  CONT,'
      '       PESSOA  PB,'
      '       PESSOA  PA,'
      '       PAIS PI ,'
      '       DEPEN DEPEN,'
      '       DEPENTIT,'
      '       RUBXBENEFICIO RXB,'
      '       PESSOA PTIT'
      'WHERE'
      '           (RUBS.IDRUBS = :IDRUBS)'
      'AND   (RUBS.IDRUBS = RXB.IDRUBS)'
      'AND   (RXB.IDTITULAR = PTIT.IDPESSOA)'
      'AND   (RXB.IDPESSOA = P.IDPESSOA) '
      'AND   (EL.IDPESSOA = PTIT.IDPESSOA)    '
      'AND   (EL.IDPESSJUR = PP.IDPESSJUR)'
      ''
      'AND   (PTIT.IDENDCORRESP = X.IDENDERECO)'
      'AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      'AND   (X.IDCIDADES = CID.IDCIDADES(+))'
      'AND   (EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = PTIT.IDPESSOA) '
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND   (EST.IDESTADO (+) = CID.IDESTADO)'
      ''
      'AND   (CONT.IDPESSOA (+) = P.IDPESSOA)'
      'AND   (CONT.FLGCONTAPREF  = 1 OR CONT.FLGCONTAPREF IS NULL)'
      'AND   (CONT.IDAGENCIA = AG.IDPESSOA(+))'
      'AND   (BAN.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PB.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PA.IDPESSOA(+) = AG.IDPESSOA)'
      'AND   (PI.IDPAIS(+) = PF.IDPAIS)'
      ''
      'AND   (DEPENTIT.IDPESSOA(+) = P.IDPESSOA)'
      'AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA)')
    ValidateWithMask = True
    Left = 296
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptInput
      end>
  end
  object QryDados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       RUBS.IDRUBS AS IDRUB,'
      '       A.IDATEND,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,'
      '       X.LOGRADOURO AS ENDERECO,'
      '       X.NUMERO AS NUMERO,'
      '       X.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       X.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       X.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIP,'
      '       A.NOMESOLICITANTE,'
      '       A.LOGRADOURO AS ENDERECO_SOLICIT,'
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,'
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLIC,'
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,'
      '       A.CEPSOLIC AS CEP_SOLICITANTE,'
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,'
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,'
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,'
      '       A.NUMDOCUMENTOCPF AS CPF_SOLICITANTE,'
      '       A.NUMDOCUMENTORG AS RG_SOLICITANTE,'
      '       A.EMAIL AS EMAIL_SOLICITANTE,'
      '       EL.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF ,'
      '       BAN.NUMBANCO  AS NUMERO_BANCO,'
      '       PB.NOME  AS NOME_BANCO,'
      '       AG.NUMAGENCIA  AS NUMERO_AGENCIA,'
      '       PA.NOME  AS NOME_AGENCIA,'
      '       CONT.CONTACORRENTE ,'
      '       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,'
      '       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,'
      '       CID.NOME AS  NOME_CIDADE,'
      '       DEPEN.DESCRICAO AS TIPO_DEPENDENTE,'
      '       ('
      '          SELECT'
      
        '             DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_' +
        'BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, BENEFICIO BE'
      '          WHERE'
      '             (RB.IDRUBS = RUBS.IDRUBS) AND'
      '             (RB.IDBENEFICIO = BE.IDBENEFICIO)'
      '          UNION'
      '          SELECT'
      '             SERV.NOME AS NOME_BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, SERVICO SERV'
      '          WHERE'
      '             (RB.IDRUBS = RUBS.IDRUBS) AND'
      '             (RB.IDBENEFICIO = SERV.IDSERVICOS)'
      '       )  AS NOME_BEN_SERV'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS X,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       ATEND A,'
      '       ASSUNTOXATEND AXA,'
      '       RUBS,'
      '       TELENDPESS TE,'
      '       BANCO BAN,'
      '       AGENCIABANCARIA AG,'
      '       CONTABANCARIA  CONT,'
      '       PESSOA  PB,'
      '       PESSOA  PA,'
      '       PAIS PI ,'
      '       DEPEN DEPEN,'
      '       DEPENTIT   DEPENTIT'
      'WHERE'
      '      (RUBS.IDRUBS =  :IDRUBS)'
      'AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      'AND   ( P.IDENDCORRESP = X.IDENDERECO(+))'
      'AND   (  X.IDCIDADES = CID.IDCIDADES(+)  )'
      'AND   (  EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = EL.IDPESSOA)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = P.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      
        'and ((pp.FLGDESATIVADO = 1 AND pp.IDPESSOA NOT IN (SELECT PPP1.I' +
        'DPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = pp.IDPESSOA' +
        ' AND PPP1.FLGDESATIVADO IN (0, NULL))) OR pp.FLGDESATIVADO IN (0' +
        ', NULL) )'
      ''
      'AND   (A.IDTITULAR = P.IDPESSOA)'
      'AND   (A.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (A.IDATEND = AXA.IDATEND)'
      'AND   (EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (CONT.IDPESSOA (+) = P.IDPESSOA)'
      'AND   (CONT.FLGCONTAPREF  = 1 OR CONT.FLGCONTAPREF IS NULL)'
      'AND   (CONT.IDAGENCIA = AG.IDPESSOA(+))'
      'AND   (BAN.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PB.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PA.IDPESSOA(+) = AG.IDPESSOA)'
      'AND   (PI.IDPAIS(+) = PF.IDPAIS)'
      'AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO)'
      'AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA)'
      '')
    ValidateWithMask = True
    Left = 153
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBS'
        ParamType = ptInput
      end>
  end
  object qryBuscaRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDRUBS,'
      '  HL.FLGSTATUS,'
      '  CC.IDREPORTS,'
      '  C.IDCONFIGRUBS,'
      '  C.DESCRUB,'
      '  C.NOMETXTRUB,'
      '  C.NOMEDOCRUB,'
      '  C.SEPARADORCOLUNAS,'
      '  C.NUMDIASCARTAAVISO,'
      '  C.FLGDELIMITALINHA,'
      '  C.IDCARTACOBRANCA'
      'FROM'
      '  CONFIGRUBS C,'
      '  RUBS R,'
      '  ASSUNTO A,'
      '  ASSUNTOXATEND AXA,'
      '  CARTACOBRANCA CC,'
      '  HISTMOVRUBS HL'
      'WHERE'
      '  R.IDRUBS = -1 AND'
      '  R.IDRUBS = HL.IDRUBS AND'
      '  R.IDASSUNTOXATEND = AXA.IDASSUNTOXATEND(+)  AND'
      '  A.IDASSUNTO = AXA.IDASSUNTO  AND'
      '  A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND'
      '  C.IDCONFIGRUBS = A.IDCONFIGRUBS AND'
      '  CC.IDCARTACOBRANCA = C.IDCARTACOBRANCA'
      ''
      ' ')
    UpdateObject = UpdBuscaRubs
    ValidateWithMask = True
    Left = 222
    Top = 211
    object qryBuscaRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
    end
    object qryBuscaRubsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Size = 2
    end
    object qryBuscaRubsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object qryBuscaRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryBuscaRubsDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Size = 60
    end
    object qryBuscaRubsNOMETXTRUB: TStringField
      FieldName = 'NOMETXTRUB'
      Size = 60
    end
    object qryBuscaRubsNOMEDOCRUB: TStringField
      FieldName = 'NOMEDOCRUB'
      Size = 60
    end
    object qryBuscaRubsSEPARADORCOLUNAS: TStringField
      FieldName = 'SEPARADORCOLUNAS'
      FixedChar = True
      Size = 1
    end
    object qryBuscaRubsNUMDIASCARTAAVISO: TFloatField
      FieldName = 'NUMDIASCARTAAVISO'
    end
    object qryBuscaRubsFLGDELIMITALINHA: TStringField
      FieldName = 'FLGDELIMITALINHA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaRubsIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
    end
  end
  object UpdBuscaRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVRUBS'
      'set'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDRUBS = :OLD_IDRUBS and'
      '  FLGSTATUS = :OLD_FLGSTATUS')
    Left = 205
    Top = 215
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.CAMPODETALHE'
      'FROM'
      '  DETALHERUBS D'
      'WHERE'
      '  D.IDCONFIGRUBS = :IDCONFIGRUBS'
      '')
    ValidateWithMask = True
    Left = 407
    Top = 177
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 27
    Top = 265
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object DsDados: TwwDataSource
    DataSet = QryDados
    Left = 188
    Top = 273
  end
  object QryCadModelo: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  IDCARTACOBRANCA = :IDCARTACOBRANCA AND'
      '  (FLGTIPOCARTA = '#39'Z'#39')'
      'ORDER BY'
      '  MODELOCARTA'
      ''
      '')
    ValidateWithMask = True
    Left = 76
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTACOBRANCA'
        ParamType = ptInput
      end>
    object QryCadModeloIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object QryCadModeloMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object QryCadModeloIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object QryCadModeloORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object QryCadModeloFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  object QryDetDocs: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    ValidateWithMask = True
    Left = 272
    Top = 296
  end
  object DsGeraRUb: TwwDataSource
    DataSet = QRYGERARUB
    Left = 304
    Top = 176
  end
  object dsDetDocs: TwwDataSource
    DataSet = QryDetDocs
    Left = 312
    Top = 296
  end
  object dsDetDependIRRF: TwwDataSource
    DataSet = qryDetDependIRRF
    Left = 49
    Top = 364
  end
  object qryDetDependIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT D.NUMSEQUENCIA, P.NOME,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       DP.DESCRICAO AS DEPENDENCIA,'
      
        '       DECODE(D.FLGCONTAIMPOSTOR, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDIRRF' +
        ','
      
        '       DECODE(D.FLGCONTASALARIOF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDSALA' +
        'RIOFAMILIA, '
      
        '       DECODE (DECODE(BF.IDPESSOA, NULL, 0, 1 ), 1, '#39'SIM'#39', '#39'NÃO'#39 +
        ') AS BENEFICIARIO, '
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      '       DECODE(D.FLGDESIGNADO, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DESIGNADO,'
      
        '       DECODE(D.FLGDEPLEGAL, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDENTE_LEGA' +
        'L,                                      '
      '       D.MATRICULA,'
      '       D.INICIOIMPOSTOR AS DATA_INICIO_IRRF,'
      '       D.FIMIMPOSTOR AS DATA_FIM_IRRF,'
      
        '       D.INICIOSALARIOF AS DT_INI_SAL_FAMILIA,                  ' +
        '                                          '
      '       D.FIMSALARIOF AS DT_FIM_SAL_FAMILIA,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.NOMEPAI AS NOME_PAI,'
      '       PF.NOMEMAE AS NOME_MAE,'
      '       DECODE(PF.SEXO, '#39'M'#39', '#39'MASCULINO'#39', '#39'FEMININO'#39') AS SEXO,'
      
        '       DECODE(PF.FLGMOLESTIAGRAVE, 1, '#39'SIM'#39', '#39'NÃO'#39') AS POSSUI_MO' +
        'LESTIA_GRAVE, '
      '       PF.DATAMOLESTIAGRAVE AS DATA_MOLESTIA_GRAVE,'
      '       DECODE(PF.FLGISENTOIRRF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS ISENOT_IRRF,'
      '       SIT.DESCRICAO AS SITUACAO_DEPENDENTE'
      
        'FROM   PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP, D' +
        'EPENDENTE DEP, DEPENTIT D, (SELECT DISTINCT IDTITULAR,IDPESSOA F' +
        'ROM BENEFBFCIARIO'
      
        'WHERE IDTITULAR     = :idtitular AND IDSITBENEFICIO IN (1,2,4)) ' +
        'BF'
      'WHERE  D.IDTITULAR     = :idtitular'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    BF.IDTITULAR(+) = D.IDTITULAR'
      'AND    BF.IDPESSOA(+)  = D.IDPESSOA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'AND    D.FLGCONTAIMPOSTOR = 1'
      'ORDER BY D.NUMSEQUENCIA         ')
    ValidateWithMask = True
    Left = 89
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end>
  end
  object qryDetTelefones: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT'
      '  TEL.DDI, '
      '  TEL.DDD, '
      '  TEL.NUMERO,'
      '  TEL.TIPO,'
      'DECODE(SUBSTR(TEL.TIPO,  1, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  2, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  3, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  4, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  5, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  6, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') AS DESCTIPO'
      'FROM ENDPESS EP, TELENDPESS TEL'
      'WHERE EP.IDPESSOA = :idbeneficiario AND'
      '      TEL.IDENDERECO = EP.IDENDERECO')
    ValidateWithMask = True
    Left = 184
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idbeneficiario'
        ParamType = ptInput
      end>
  end
  object dsDetTelefones: TwwDataSource
    DataSet = qryDetTelefones
    Left = 192
    Top = 352
  end
  object qryDetDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT D.NUMSEQUENCIA, P.NOME,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       DP.DESCRICAO AS DEPENDENCIA,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      '       DECODE(D.FLGDESIGNADO, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DESIGNADO,'
      
        '       DECODE(D.FLGDEPLEGAL, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDENTE_LEGA' +
        'L,                                      '
      '       D.MATRICULA,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.NOMEPAI AS NOME_PAI,'
      '       PF.NOMEMAE AS NOME_MAE,'
      '       DECODE(PF.SEXO, '#39'M'#39', '#39'MASCULINO'#39', '#39'FEMININO'#39') AS SEXO,'
      
        '       DECODE(PF.FLGMOLESTIAGRAVE, 1, '#39'SIM'#39', '#39'NÃO'#39') AS POSSUI_MO' +
        'LESTIA_GRAVE, '
      '       PF.DATAMOLESTIAGRAVE AS DATA_MOLESTIA_GRAVE,'
      '       SIT.DESCRICAO AS SITUACAO_DEPENDENTE'
      'FROM   PESSOA P, '
      '       PESSOAFISICA PF, '
      '       SITDEPENDENTE SIT, '
      '       DEPEN DP, '
      '       DEPENDENTE DEP, '
      '       DEPENTIT D'
      'WHERE  D.IDTITULAR     = :IDTITULAR'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'ORDER BY D.NUMSEQUENCIA')
    ValidateWithMask = True
    Left = 304
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object dtsDetDependentes: TwwDataSource
    DataSet = qryDetDependentes
    Left = 312
    Top = 376
  end
  object qryDetBeneficiarios: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT P.IDPESSOA,'
      '       P.NOME, '
      '       DP.DESCRICAO AS DEPENDENCIA,       '
      '       DECODE( F.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL, '
      '       F.DATANASC, '
      '       DECODE( F.SEXO, '#39'M'#39', '#39'MASCULINO'#39', '#39'FEMININO'#39' ) AS SEXO '
      'FROM   PESSOA        P,'
      '       BENEFBFCIARIO B, '
      '       PESSOAFISICA  F,'
      '       DEPENTIT      D,'
      '       DEPEN         DP '
      'WHERE  P.IDPESSOA      = B.IDPESSOA '
      '  AND  P.IDPESSOA      = F.IDPESSOA'
      '  AND  D.IDTITULAR     = B.IDTITULAR (+)'
      '  AND  D.IDPESSOA      = B.IDPESSOA'
      '  AND  D.IDDEPENDENCIA <> '#39'PRP'#39
      '  AND  D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      '  AND  B.IDTITULAR     = :IDTITULAR'
      '  AND  B.IDBENEFICIO   = :IDBENEFICIO'
      '  AND  B.IDPLANOPREV   = :IDPLANO'
      '  AND  B.IDPESSJUR     = :IDPATROCINADORA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATROCINADORA'
        ParamType = ptInput
      end>
  end
  object dtsDetBeneficiarios: TwwDataSource
    DataSet = qryDetBeneficiarios
    Left = 440
    Top = 384
  end
end
