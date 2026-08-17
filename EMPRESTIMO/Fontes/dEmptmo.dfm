object dtmEmptmo: TdtmEmptmo
  OldCreateOrder = False
  Left = 446
  Top = 140
  Height = 572
  Width = 741
  object qryCotacaoExata: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, M.MOEDESC, M.MOESIGLA'
      ''
      'FROM'
      '   COTACAOMOEDA C, MOEDA M'
      ''
      'WHERE'
      '   ( C.MOECODIGO =:MOEDA )'
      '   AND ( C.COTDATA =:DATA )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      ''
      'ORDER BY'
      '   C.COTDATA DESC')
    ValidateWithMask = True
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryCotacaoExataMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryCotacaoExataCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoExataMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryCotacaoExataMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryCotacaoNaoExata: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, M.MOEDESC, M.MOESIGLA'
      ''
      'FROM'
      '   COTACAOMOEDA C, MOEDA M'
      ''
      'WHERE'
      '   ( C.MOECODIGO =:MOEDA )'
      '   AND ( C.COTDATA <=:DATA )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      ''
      'ORDER BY'
      '   C.COTDATA DESC')
    ValidateWithMask = True
    Left = 48
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryCotacaoNaoExataMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryCotacaoNaoExataCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoNaoExataMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryCotacaoNaoExataMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryCotacoesIntervalo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, C.COTMESREF, M.MOEDESC, M.MOESIGLA '
      'FROM '
      '   COTACAOMOEDA C, MOEDA M '
      'WHERE '
      '   ( C.MOECODIGO =:INDICE )'
      
        '   AND ( (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) ' +
        '>=:ANOMESINI )'
      
        '   AND ( (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) ' +
        '<=:ANOMESFIM )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      'ORDER BY'
      '   C.COTDATA')
    ValidateWithMask = True
    Left = 48
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INDICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESFIM'
        ParamType = ptUnknown
      end>
    object qryCotacoesIntervaloMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryCotacoesIntervaloCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
    end
    object qryCotacoesIntervaloCOTMESREF: TStringField
      FieldName = 'COTMESREF'
      Size = 6
    end
    object qryCotacoesIntervaloMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryCotacoesIntervaloMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, M.MOEDESC, M.MOESIGLA,'
      '   M.MOEPERIODICIDADE, M.MOEINATIVO,'
      '   M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM'
      'FROM'
      '   MOEDA M'
      'WHERE'
      '   M.MOECODIGO =:MOEDA')
    ValidateWithMask = True
    Left = 48
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end>
    object qryIndiceMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryIndiceMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryIndiceMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryIndiceMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Size = 1
    end
    object qryIndiceMOEINATIVO: TStringField
      FieldName = 'MOEINATIVO'
      Origin = 'MOEDA.MOEINATIVO'
      Size = 1
    end
    object qryIndiceFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Size = 1
    end
    object qryIndiceDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'MOEDA.DATAINICIO'
    end
    object qryIndiceDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'MOEDA.DATAFIM'
    end
  end
  object qryIntegraContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MASCARA'
      ''
      'FROM'
      '   PLANO'
      ''
      'WHERE'
      '   ( PLANO =:PPLANO )')
    ValidateWithMask = True
    Left = 48
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryIntegraContabMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PPLANO ) AND'
      '  ( PLACONTA =:PPLACONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      ''
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end>
    object qryVerificaContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryVerificaContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryVerificaContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Size = 1
    end
    object qryVerificaContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Size = 1
    end
  end
  object qryParamCAP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MASCARADESEMB'
      'FROM'
      '   PARAMCAP'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( RECPAG =:RECPAG )')
    ValidateWithMask = True
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object qryParamCAPMASCARADESEMB: TStringField
      FieldName = 'MASCARADESEMB'
      Origin = 'PARAMCAP.MASCARADESEMB'
      Size = 15
    end
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PG.USACRESPON, PG.USAABC, PG.CODCENTRORESPON,'
      '   PG.UNIDNEGOC, PG.MOEDACORRENTE,'
      '   PG.IDPATRO, PG.IDPLANOPREV,'
      '   M.MOESIGLA'
      ''
      'FROM'
      '   PARAMGLOBAL PG, MOEDA M'
      ''
      'WHERE'
      '   ( PG.IDPESSOA =:PIDPESSOA )'
      '   AND ( PG.MOEDACORRENTE = M.MOECODIGO(+) )')
    ValidateWithMask = True
    Left = 176
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalUSACRESPON: TStringField
      FieldName = 'USACRESPON'
      Origin = 'PARAMGLOBAL.USACRESPON'
      Size = 1
    end
    object qryParamGlobalUSAABC: TStringField
      FieldName = 'USAABC'
      Origin = 'PARAMGLOBAL.USAABC'
      Size = 1
    end
    object qryParamGlobalCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PARAMGLOBAL.CODCENTRORESPON'
      Size = 10
    end
    object qryParamGlobalUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
    object qryParamGlobalMOEDACORRENTE: TFloatField
      FieldName = 'MOEDACORRENTE'
      Origin = 'PARAMGLOBAL.MOEDACORRENTE'
    end
    object qryParamGlobalIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'PARAMGLOBAL.IDPATRO'
    end
    object qryParamGlobalIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PARAMGLOBAL.IDPLANOPREV'
    end
    object qryParamGlobalMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryPlanoData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PD.IDPLANODATA,'
      '   PD.IDPESSOA,'
      '   PD.PLANO,'
      '   PD.DATAINICIO,'
      '   PD.DATAFIM'
      ''
      'FROM'
      '   PLANODATA PD'
      ''
      'WHERE'
      '   ( PD.IDPESSOA =:PIDPESSOA )'
      '   AND ( PD.DATAINICIO <=:PDATAHOJE )'
      '   AND ( (PD.DATAFIM IS NULL) OR (PD.DATAFIM >=:PDATAHOJE) )')
    ValidateWithMask = True
    Left = 176
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAHOJE'
        ParamType = ptUnknown
      end>
    object qryPlanoDataIDPLANODATA: TFloatField
      FieldName = 'IDPLANODATA'
      Origin = 'BASEDADOS.PLANODATA.IDPLANODATA'
    end
    object qryPlanoDataIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PLANODATA.IDPESSOA'
    end
    object qryPlanoDataPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PLANODATA.PLANO'
    end
    object qryPlanoDataDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.PLANODATA.DATAINICIO'
    end
    object qryPlanoDataDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'BASEDADOS.PLANODATA.DATAFIM'
    end
  end
  object qryInsertContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTRATOEMPTMO'
      '('
      
        '  IDCONTRATOEMPTMO , IDCONTRQUITACAO, IDPESSOA       , IDTIPOCON' +
        'TREMPTMO ,'
      
        '  IDINSCRICAOEMPTMO, IDPLANOPREV    , IDPATRO        , IDVERBA  ' +
        '         ,'
      '  IDBENEF          , IDCBANCARIA    ,'
      
        '  CODFORMAPAG      , PORTFORMAPAG   , PORTFORMAREC   , NUMPARCEL' +
        'AS       ,'
      
        '  DATACREDITO      , DATASITUACAO   , DATAASSINATURA , DATAPRIMP' +
        'ARC      ,'
      
        '  DATACANC         , VLRCONTRATO    , VLRPARCELA     , TXJUROS  ' +
        '         ,'
      
        '  FLGSITUACAO      , FLGFORMAREC    , FLGFORMAPAG    , VLRSALBAS' +
        'E        ,'
      
        '  VLRMARGEM        , VLRMAXPERMIT   , MOECODIGO      , VLRPARCEL' +
        'AMES     ,'
      
        '  VLRPARCATRASO    , VLRDEBITO      , VLRRESERVA     , VLRSALDOD' +
        'EV       ,'
      '  VLRPENDENCIA     , DATASALDODEV   , DATAPENDENCIA  ,'
      
        '  IDTIPOSUSPEMPTMO , DATAINICIOSUSP , DATAFIMSUSP    , ANOSUSPEN' +
        'SAO      ,'
      
        '  MESSUSPENSAO     , IDCBANCARIADEB , IDRESPONSAVEL  , IDPLANOOR' +
        'IGEM     ,'
      
        '  NUMPARCDESCONTO  , FLGEXCEPCIONAL , FLGFINANCIAMENTO, FLGUSAMA' +
        'RGEMALT  ,'
      '  IDPLANOCOB, TSEMESES, NUMPROTOCOLO, FLGPERDAEFETIVA'
      ')'
      'VALUES'
      '('
      
        '  :PIDCONTRATOEMPTMO , :PIDCONTRQUITACAO, :PIDPESSOA       , :PI' +
        'DTIPOCONTREMPTMO,'
      
        '  :PIDINSCRICAOEMPTMO, :PIDPLANOPREV    , :PIDPATRO        , :PI' +
        'DVERBA          ,'
      '  :PIDBENEF          , :PIDCBANCARIA    ,'
      
        '  :PCODFORMAPAG      , :PPORTFORMAPAG   , :PPORTFORMAREC   , :PN' +
        'UMPARCELAS      ,'
      
        '  :PDATACREDITO      , :PDATASITUACAO   , :PDATAASSINATURA , :PD' +
        'ATAPRIMPARC     ,'
      
        '  :PDATACANC         , :PVLRCONTRATO    , :PVLRPARCELA     , :PT' +
        'XJUROS          ,'
      
        '  :PFLGSITUACAO      , :PFLGFORMAREC    , :PFLGFORMAPAG    , :PV' +
        'LRSALBASE       ,'
      
        '  :PVLRMARGEM        , :PVLRMAXPERMIT   , :PMOECODIGO      , :PV' +
        'LRPARCELAMES    ,'
      
        '  :PVLRPARCATRASO    , :PVLRDEBITO      , :PVLRRESERVA     , :PV' +
        'LRSALDODEV      ,'
      '  :PVLRPENDENCIA     , :PDATASALDODEV   , :PDATAPENDENCIA  ,'
      
        '  :PIDTIPOSUSPEMPTMO , :PDATAINICIOSUSP , :PDATAFIMSUSP    , :PA' +
        'NOSUSPENSAO     ,'
      
        '  :PMESSUSPENSAO     , :PIDCBANCARIADEB , :PIDRESPONSAVEL  , :PI' +
        'DPLANOORIGEM    ,'
      
        '  :PNUMPARCDESCONTO  , :PFLGEXCEPCIONAL , :PFLGFINANCIAMENTO, :P' +
        'FLGUSAMARGEMALT ,'
      '  :PIDPLANOCOB, :PTSEMESES,:PNUMPROTOCOLO, :PFLGPERDAEFETIVA'
      ')'
      ''
      '')
    UniDirectional = True
    ValidateWithMask = True
    Left = 148
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDVERBA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAREC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATASITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAASSINATURA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAPRIMPARC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACANC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PTXJUROS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAREC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRSALBASE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRMARGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRMAXPERMIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRPARCELAMES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRPARCATRASO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRDEBITO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRRESERVA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRSALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINICIOSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIMSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANOSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMESSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIADEB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGEXCEPCIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGFINANCIAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGUSAMARGEMALT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOCOB'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PTSEMESES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PNUMPROTOCOLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGPERDAEFETIVA'
        ParamType = ptUnknown
      end>
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT SIT.IDSITPART, SIT.FLGINTERNO'
      '        FROM PARTPREVPLAN PPP, SITPART SIT'
      '       WHERE PPP.IDPESSOA = :PIDPESSOA'
      '         AND PPP.IDSITPART = SIT.IDSITPART'
      '         AND (PPP.FLGDESATIVADO = 0 OR'
      '             (PPP.FLGDESATIVADO = 1 AND NOT EXISTS'
      '              (SELECT 1'
      '                '
      '                  FROM partprevplan ppp1'
      '                '
      '                 WHERE ppp1.idpessoa = ppp.idpessoa'
      '                      '
      '                   AND ppp1.flgdesativado = 0)'
      '             '
      '              AND (ppp.idsitplanoprev = 25 OR'
      '              '
      '              (ppp.idsitplanoprev <> 25 AND'
      '              ppp.datacancelamento ='
      '              (SELECT MAX(ppp1.datacancelamento)'
      '                      '
      '                        FROM partprevplan ppp1'
      '                      '
      '                       WHERE ppp1.idpessoa = ppp.idpessoa)'
      '              '
      '              AND NOT EXISTS'
      '               (SELECT 1'
      '                      '
      '                        FROM partprevplan ppp1'
      '                      '
      '                       WHERE ppp1.idpessoa = ppp.idpessoa'
      '                            '
      '                         AND ppp1.idsitplanoprev = 25))))'
      '             '
      '             OR (ppp.flgdesativado = 1 AND NOT EXISTS'
      '              (SELECT 1'
      '                     FROM partprevplan ppp1'
      '                   '
      '                    WHERE ppp1.idpessoa = ppp.idpessoa'
      '                         '
      '                      AND ppp1.flgdesativado = 0)'
      '             '
      '              AND ppp.idplanoprev ='
      '              (SELECT max(ppp1.idplanoprev)'
      '                         FROM partprevplan ppp1'
      '                       '
      '                        WHERE ppp1.idpessoa = ppp.idpessoa'
      '                             '
      '                          AND ppp1.flgdesativado = 1)))'
      '')
    ValidateWithMask = True
    Left = 248
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qrySitPartIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = 'BASEDADOS.SITPART.IDSITPART'
    end
    object qrySitPartFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPART.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
  end
  object qryParamIntegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PI.IDPARAMINTEGRAEP,'
      '   PI.DESCPARAMINTEGRA,'
      ''
      '   PI.IDPLANOPREVCONTAB,'
      '   PI.IDPLANOPREV,'
      '   PI.IDPATRO,'
      '   PI.IDTIPOEMPTMO,'
      '   PI.IDTIPOCONTREMPTMO,'
      '   PI.IDITEMEMPTMO,'
      '   PI.IDPESSOA,'
      '   PI.IDEMPRESA,'
      '   PI.PLANO,'
      ''
      '   PI.CCDEBFOLHA,'
      '   PI.CCCREDFOLHA,'
      '   PI.SUBCDEBFOLHA,'
      '   PI.SUBCCREDFOLHA,'
      '   PI.CCUSTDEBFOLHA,'
      '   PI.CCUSTCREDFOLHA,'
      ''
      '  PI.CCDEBFOLHARESULT,'
      '  PI.CCCREDFOLHARESULT,'
      '  PI.CCUSTDEBFOLHARESULT, '
      '  PI.CCUSTCREDFOLHARESULT,'
      '  PI.SUBCDEBFOLHARESULT,'
      '  PI.SUBCCREDFOLHARESULT,'
      '  PI.TIPORECDESFOLHARESULT,'
      ''
      ''
      ''
      '   PI.CCDEBFINAN,'
      '   PI.CCCREDFINAN,'
      '   PI.SUBCDEBFINAN,'
      '   PI.SUBCCREDFINAN,'
      '   PI.CCUSTDEBFINAN,'
      '   PI.CCUSTCREDFINAN,'
      ''
      '   PI.CODCENTRORESPON,'
      '   PI.UNIDNEGOC,'
      ''
      '   PI.RECPAGFINAN,'
      '   PI.TIPORECDESFINAN,'
      ''
      '   PI.RECPAGFOLHA,'
      '   PI.TIPORECDESFOLHA,'
      ''
      '   PI.RECPAG'
      ''
      'FROM'
      '   PARAMINTEGRAEP PI'
      ''
      'WHERE'
      '   ( PI.IDPESSOA =:PIDPESSOA )'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (PI.IDITEMEMPTMO =:PIDITEME' +
        'MPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (PI.IDTIPOEMPTMO =:PIDTIPOE' +
        'MPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (PI.IDTIPOCONTREMPTMO ' +
        '=:PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDPLANOPREV IS NULL) OR (PI.IDPLANOPREV =:PIDPLANOPR' +
        'EV) )'
      '   AND ( (:PIDPATRO IS NULL) OR (PI.IDPATRO =:PIDPATRO) )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object qryParamIntegraIDPARAMINTEGRAEP: TFloatField
      FieldName = 'IDPARAMINTEGRAEP'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDPARAMINTEGRAEP'
    end
    object qryParamIntegraDESCPARAMINTEGRA: TStringField
      FieldName = 'DESCPARAMINTEGRA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".DESCPARAMINTEGRA'
      Size = 60
    end
    object qryParamIntegraIDPLANOPREVCONTAB: TFloatField
      FieldName = 'IDPLANOPREVCONTAB'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDPLANOPREVCONTAB'
    end
    object qryParamIntegraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDPLANOPREV'
    end
    object qryParamIntegraIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDPATRO'
    end
    object qryParamIntegraIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDTIPOEMPTMO'
    end
    object qryParamIntegraIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDTIPOCONTREMPTMO'
    end
    object qryParamIntegraIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDITEMEMPTMO'
    end
    object qryParamIntegraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDPESSOA'
    end
    object qryParamIntegraIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".IDEMPRESA'
    end
    object qryParamIntegraPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".PLANO'
    end
    object qryParamIntegraCCDEBFOLHA: TStringField
      FieldName = 'CCDEBFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCDEBFOLHA'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraCCCREDFOLHA: TStringField
      FieldName = 'CCCREDFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCCREDFOLHA'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraSUBCDEBFOLHA: TFloatField
      FieldName = 'SUBCDEBFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".SUBCDEBFOLHA'
    end
    object qryParamIntegraSUBCCREDFOLHA: TFloatField
      FieldName = 'SUBCCREDFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".SUBCCREDFOLHA'
    end
    object qryParamIntegraCCUSTDEBFOLHA: TStringField
      FieldName = 'CCUSTDEBFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCUSTDEBFOLHA'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraCCUSTCREDFOLHA: TStringField
      FieldName = 'CCUSTCREDFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCUSTCREDFOLHA'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraCCDEBFINAN: TStringField
      FieldName = 'CCDEBFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCDEBFINAN'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraCCCREDFINAN: TStringField
      FieldName = 'CCCREDFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCCREDFINAN'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraSUBCDEBFINAN: TFloatField
      FieldName = 'SUBCDEBFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".SUBCDEBFINAN'
    end
    object qryParamIntegraSUBCCREDFINAN: TFloatField
      FieldName = 'SUBCCREDFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".SUBCCREDFINAN'
    end
    object qryParamIntegraCCUSTDEBFINAN: TStringField
      FieldName = 'CCUSTDEBFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCUSTDEBFINAN'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraCCUSTCREDFINAN: TStringField
      FieldName = 'CCUSTCREDFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCUSTCREDFINAN'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".UNIDNEGOC'
    end
    object qryParamIntegraRECPAGFINAN: TStringField
      FieldName = 'RECPAGFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".RECPAGFINAN'
      FixedChar = True
      Size = 1
    end
    object qryParamIntegraTIPORECDESFINAN: TStringField
      FieldName = 'TIPORECDESFINAN'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".TIPORECDESFINAN'
      FixedChar = True
      Size = 15
    end
    object qryParamIntegraRECPAGFOLHA: TStringField
      FieldName = 'RECPAGFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".RECPAGFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryParamIntegraTIPORECDESFOLHA: TStringField
      FieldName = 'TIPORECDESFOLHA'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".TIPORECDESFOLHA'
      FixedChar = True
      Size = 15
    end
    object qryParamIntegraRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryParamIntegraCCDEBFOLHARESULT: TStringField
      FieldName = 'CCDEBFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCDEBFOLHARESULT'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraCCCREDFOLHARESULT: TStringField
      FieldName = 'CCCREDFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCCREDFOLHARESULT'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraCCUSTDEBFOLHARESULT: TStringField
      FieldName = 'CCUSTDEBFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCUSTDEBFOLHARESULT'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraCCUSTCREDFOLHARESULT: TStringField
      FieldName = 'CCUSTCREDFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".CCUSTCREDFOLHARESULT'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraSUBCDEBFOLHARESULT: TFloatField
      FieldName = 'SUBCDEBFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".SUBCDEBFOLHARESULT'
    end
    object qryParamIntegraSUBCCREDFOLHARESULT: TFloatField
      FieldName = 'SUBCCREDFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".SUBCCREDFOLHARESULT'
    end
    object qryParamIntegraTIPORECDESFOLHARESULT: TStringField
      FieldName = 'TIPORECDESFOLHARESULT'
      Origin = 'BASEDADOS."CM.PARAMINTEGRAEP".TIPORECDESFOLHARESULT'
      FixedChar = True
      Size = 15
    end
  end
  object qryEntidadeContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV, IDPLANPREVC'
      ''
      'FROM'
      '   PLANPREVXCONTABIL'
      ''
      'WHERE'
      '   IDPLANOPREV =:PIDPLANOPREV')
    ValidateWithMask = True
    Left = 48
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryEntidadeContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.PLANPREVXCONTABIL".IDPLANOPREV'
    end
    object qryEntidadeContabilIDPLANPREVC: TFloatField
      FieldName = 'IDPLANPREVC'
      Origin = 'BASEDADOS."CM.PLANPREVXCONTABIL".IDPLANPREVC'
    end
  end
  object Temporizador: TTimer
    Enabled = False
    OnTimer = TemporizadorTimer
    Left = 48
    Top = 416
  end
  object qryParamContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA,'
      '   PLANO,'
      '   PACESTORNA'
      'FROM'
      '   PARAMCONTAB PC'
      'WHERE'
      '   PC.IDPESSOA =:PIDPESSOA')
    ValidateWithMask = True
    Left = 176
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamContabIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMCONTAB.IDPESSOA'
    end
    object qryParamContabPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PARAMCONTAB.PLANO'
    end
    object qryParamContabPACESTORNA: TStringField
      FieldName = 'PACESTORNA'
      Origin = 'BASEDADOS.PARAMCONTAB.PACESTORNA'
      FixedChar = True
      Size = 1
    end
  end
  object qryVerificaPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTMOVEMPTMO,'
      '       PLNCODIGO'
      'FROM   HISTMOVEMPTMO'
      'WHERE  (TO_CHAR(IDHISTMOVEMPTMO) NOT IN (:PIDHISTMOVEMPTMO))'
      '   AND (PLNCODIGO = :PPLNCODIGO)'
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryVerificaPlanilhaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryVerificaPlanilhaIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
  end
  object qryExcHistContrato: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 336
    Top = 68
  end
  object qryHistoricoMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.HMEORIGEM,'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.HMEFORMACOBRANCA, HME.HMEANOCOMPETENCIA,'
      '   HME.HMEMESCOBRANCA,   HME.HMEMESCOMPETENCIA,'
      '   HME.HMEANOCOBRANCA,'
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO,'
      '   HME.HMEVLRPREVISTO,'
      '   HME.FLGENVIO,'
      '   HME.IDTMPDESC,'
      ''
      '   HPLN.PLNCODIGO,'
      '   HDOC.CODDOCUMENTO,'
      ''
      '   DOC.STATUS'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   DOCUMENTO     DOC,'
      ''
      '   ('
      '   SELECT DISTINCT'
      '      IDCONTRATOEMPTMO, PLNCODIGO'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      '          ( IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO )'
      '      AND ( HMETIPOMOV           =:PHMETIPOMOV )'
      
        '      AND ( (:PHMEORIGEM         IS NULL) OR (HMEORIGEM =:PHMEOR' +
        'IGEM) )'
      '      AND ( HMEDATAPREVISTA      =:PHMEDATAPREVISTA )'
      '      AND ( HMECENTRALIZA        = 0 )'
      '      AND ( FLGBAIXADO           = 0 )'
      
        '      AND ( (FLGESTORNADO        = 0) OR (FLGESTORNADO IS NULL) ' +
        ')'
      '      AND ( HMEDATAEFETIVA       IS NULL)'
      '   ) HPLN,'
      ''
      '   ('
      '   SELECT DISTINCT'
      '      IDCONTRATOEMPTMO, CODDOCUMENTO'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      '          ( IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO )'
      '      AND ( HMETIPOMOV           =:PHMETIPOMOV )'
      
        '      AND ( (:PHMEORIGEM         IS NULL) OR (HMEORIGEM =:PHMEOR' +
        'IGEM) )'
      '      AND ( HMEDATAPREVISTA      =:PHMEDATAPREVISTA )'
      '      AND ( HMECENTRALIZA        = 1 )'
      '      AND ( FLGBAIXADO           = 0 )'
      
        '      AND ( (FLGESTORNADO        = 0) OR (FLGESTORNADO IS NULL) ' +
        ')'
      '      AND ( HMEDATAEFETIVA       IS NULL)'
      '   ) HDOC'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV          =:PHMETIPOMOV )'
      '   AND ( HME.HMEDATAPREVISTA     =:PHMEDATAPREVISTA)'
      
        '   AND ( (:PHMEORIGEM            IS NULL ) OR (HME.HMEORIGEM =:P' +
        'HMEORIGEM) )'
      '   AND ('
      '       (HME.HMECENTRALIZA      = 1 OR  HME.HMEDESTACADO = 1) OR'
      '       (HME.HMECENTRALIZA      = 0 AND HME.HMEDESTACADO = 0) OR'
      
        '       (HME.HMETIPOMOV         =:PHMETIPOMOV AND HME.HMEORIGEM =' +
        ' 8)'
      '       )'
      '   AND ('
      '       HME.HMEVLRPREVISTO   = 0 OR'
      '       ('
      '       HME.FLGBAIXADO       = 0     AND'
      '       HME.HMEVLREFETIVO    IS NULL AND'
      '       HME.HMEDATAEFETIVA   IS NULL'
      '       ) OR'
      '       ('
      '       HME.HMETIPOMOV       =:PHMETIPOMOV AND'
      '       HME.HMEORIGEM        = 8 AND'
      '       HME.FLGBAIXADO       IS NULL'
      '       )'
      '       )'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND ( HME.IDCONTRATOEMPTMO    = HPLN.IDCONTRATOEMPTMO(+) )'
      '   AND ( HME.IDCONTRATOEMPTMO    = HDOC.IDCONTRATOEMPTMO(+) )'
      '   AND ( HDOC.CODDOCUMENTO       = DOC.CODDOCUMENTO(+) )'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 444
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end>
    object qryHistoricoMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryHistoricoMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryHistoricoMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.CODDOCUMENTO'
    end
    object qryHistoricoMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMECENTRALIZA'
    end
    object qryHistoricoMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDESTACADO'
    end
    object qryHistoricoMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryHistoricoMovFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGENVIO'
    end
    object qryHistoricoMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.PLNCODIGO'
    end
    object qryHistoricoMovSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.DOCUMENTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistoricoMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistoricoMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistoricoMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistoricoMovIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryHistoricoMovHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 352
    Top = 464
  end
  object qrySaidaSistema: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(H.IDHISTMOVEMPTMO) AS TOTAL_ITENS'
      ''
      'FROM'
      '   HISTMOVEMPTMO H,'
      '   CONTRATOEMPTMO C,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO TE'
      ''
      'WHERE'
      '   ( H.FLGENVIO = 0 )'
      '   AND ( (H.HMEDESTACADO = 1) OR (H.HMECENTRALIZA = 1) )'
      '   AND ( (H.FLGESTORNADO = 0) OR (H.FLGESTORNADO IS NULL) )'
      '   AND ( TE.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )'
      '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qrySaidaSistemaTOTAL_ITENS: TFloatField
      FieldName = 'TOTAL_ITENS'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryRecebimentoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDPATRO, H.CODDOCUMENTO, H.PLNCODIGO'
      ''
      'FROM'
      '   HISTRECPATROEP H'
      ''
      'WHERE'
      '       ( H.IDPATRO =:PIDPATRO )'
      '   AND ( H.RPEANOCOBRANCA =:PRPEANOCOBRANCA )'
      '   AND ( H.RPEMESCOBRANCA =:PRPEMESCOBRANCA )')
    ValidateWithMask = True
    Left = 408
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRPEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRPEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryRecebimentoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.HISTRECPATROEP.IDPATRO'
    end
    object qryRecebimentoPatroCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTRECPATROEP.CODDOCUMENTO'
    end
    object qryRecebimentoPatroPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTRECPATROEP.PLNCODIGO'
    end
  end
  object qryFechamentos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA,'
      '   ANOFECHAEMPTMO,'
      '   MESFECHAEMPTMO,'
      '   ANOFECHAPATROEP,'
      '   MESFECHAPATROEP,'
      '   ANOFECHAFOLHAEP,'
      '   MESFECHAFOLHAEP'
      'FROM'
      '   PATRO'
      'WHERE'
      '   IDPESSOA =:PIDPATRO')
    ValidateWithMask = True
    Left = 408
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object qryFechamentosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryFechamentosANOFECHAEMPTMO: TFloatField
      FieldName = 'ANOFECHAEMPTMO'
    end
    object qryFechamentosMESFECHAEMPTMO: TFloatField
      FieldName = 'MESFECHAEMPTMO'
    end
    object qryFechamentosANOFECHAPATROEP: TFloatField
      FieldName = 'ANOFECHAPATROEP'
    end
    object qryFechamentosMESFECHAPATROEP: TFloatField
      FieldName = 'MESFECHAPATROEP'
    end
    object qryFechamentosANOFECHAFOLHAEP: TFloatField
      FieldName = 'ANOFECHAFOLHAEP'
    end
    object qryFechamentosMESFECHAFOLHAEP: TFloatField
      FieldName = 'MESFECHAFOLHAEP'
    end
  end
  object qryExcluiHistRecPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTRECPATROEP'
      'WHERE'
      '   ( IDHISTRECPATROEP =:PIDHISTRECPATROEP )')
    ValidateWithMask = True
    Left = 408
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTRECPATROEP'
        ParamType = ptInput
      end>
  end
  object qryInsereHistRecPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTRECPATROEP'
      '('
      'IDHISTRECPATROEP,'
      'IDPATRO,'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'RPEDATA,'
      'RPEVLR,'
      'RPEMESCOBRANCA,'
      'RPEANOCOBRANCA'
      ')'
      'VALUES'
      '('
      ':PIDHISTRECPATROEP,'
      ':PIDPATRO,'
      ':PCODDOCUMENTO,'
      ':PPLNCODIGO,'
      ':PRPEDATA,'
      ':PRPEVLR,'
      ':PRPEMESCOBRANCA,'
      ':PRPEANOCOBRANCA'
      ')')
    ValidateWithMask = True
    Left = 408
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTRECPATROEP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PRPEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PRPEVLR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRPEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRPEANOCOBRANCA'
        ParamType = ptInput
      end>
    object FloatField4: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.HISTRECPATROEP.IDPATRO'
    end
    object FloatField5: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTRECPATROEP.CODDOCUMENTO'
    end
    object FloatField6: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTRECPATROEP.PLNCODIGO'
    end
  end
  object qryTmpDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   TMP.MESREFERENCIA     , TMP.CODALTERADOR      , TMP.PLNCODIGO' +
        'PREV     , TMP.CODTIPRECDES      ,'
      
        '   TMP.CODSUBCONTA       , TMP.RECPAG            , TMP.IDEMPRESA' +
        'PROP     , TMP.CODTIPDOC         ,'
      
        '   TMP.PLACONTAD         , TMP.PLANO             , TMP.PLACONTAC' +
        '         , TMP.IDPESSOA          ,'
      
        '   TMP.CODDOCUMENTOPREV  , TMP.FLGTIPODESC       , TMP.CODPORTFO' +
        'RMA      , TMP.VALOR             ,'
      
        '   TMP.IDTITULAR         , TMP.IDPLANASS         , TMP.IDDESCONT' +
        'O        , TMP.UNIDNEGOC         ,'
      
        '   TMP.IDMOTIVO          , TMP.DATARECEBIMENTO   , TMP.CODCENTRO' +
        'RESPON   , TMP.MESCOBRANCA       ,'
      
        '   TMP.CODCENTROCUSTOD   , TMP.IDPESSJUR         , TMP.IDPROVENT' +
        'O        , TMP.CODCENTROCUSTOC   ,'
      
        '   TMP.IDPLANOPREV       , TMP.IDEMPRESA         , TMP.VALORRECE' +
        'BIDO     , TMP.NUMPRIORIDADE     ,'
      
        '   TMP.ORDEM             , TMP.MATRICULA         , TMP.INSCRICAO' +
        'NUMERO   , TMP.VALORBASE1        ,'
      
        '   TMP.VALORBASE2        , TMP.VALORBASE3        , TMP.FLGDESCON' +
        'TO       , TMP.CODRETORNO        ,'
      
        '   TMP.NUMDEPENDSEGURO   , TMP.CODPROVDESC       , TMP.FLGDESCFO' +
        'LHA      , TMP.DATAREFERENCIA    ,'
      
        '   TMP.DESCRICAO         , TMP.REFERENCIA        , TMP.FLGFORNPA' +
        'G        , TMP.FLGFORNCOMISS     ,'
      
        '   TMP.IDFUNDACAO        , TMP.CODDOCUMENTOEFET  , TMP.PLNCODIGO' +
        'EFET     , TMP.SISTORIGEM        ,'
      
        '   TMP.FLGALTERADOR      , TMP.PERIODO           , TMP.EXERCICIO' +
        '         , TMP.FLGATRASODEVOL    ,'
      
        '   TMP.DATACOBRANCA      , TMP.NODOCUMENTO       , TMP.COMPLDOCU' +
        'MENTO    , TMP.IDFAVORECIDO      ,'
      
        '   TMP.IDLOTE            , TMP.IDEMPCOBRANCA     , TMP.TIPCODIGO' +
        '         , TMP.SITENVIO          ,'
      
        '   TMP.SEQPROPOSTA       , TMP.FLGEXISTEHST      , TMP.NUMLANCTO' +
        '         , TMP.TRGDTINCLUSAO     ,'
      
        '   TMP.TRGUSERINCLUSAO   , TMP.LOTEPREVIA        , TMP.FONTEPAGA' +
        'DORA     , TMP.FLGINTEVENTO      ,'
      
        '   TMP.IDMODULO          , TMP.VALORINFO         , TMP.PARCELARU' +
        'B        , TMP.PRAZORUB          ,'
      
        '   TMP.IDPLANPREVCONTAB  , TMP.IDREGRACALCULO    , TMP.FLGDESCFO' +
        'LHA'
      ''
      'FROM'
      '   TMPDESC TMP'
      ''
      'WHERE'
      '       ( TMP.IDPESSOA             =:IDMUTUARIO )'
      '   AND ( TMP.IDPROVENTO           =:IDRUBRICA )'
      '   AND ( TMP.IDDESCONTO           =:IDDESCONTO )'
      '   AND ( RTRIM(TMP.MESCOBRANCA)   =:MESCOBRANCA )'
      '   AND ( RTRIM(TMP.MESREFERENCIA) =:MESREFERENCIA )'
      '   AND ( TMP.IDMODULO             = 15 )'
      '   AND ( TMP.VALORRECEBIDO        > 0 )'
      ''
      'ORDER BY'
      '   TMP.MESREFERENCIA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMUTUARIO'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDRUBRICA'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDDESCONTO'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
        Value = '01'
      end>
  end
  object qryDeleteObsLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   OBSLANCIMOVEL'
      'WHERE'
      '   (IDDOCUMENTO = :PIDDOCUMENTO)')
    ValidateWithMask = True
    Left = 528
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteMsgCnab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '   MENSAGENSCNAB'
      ''
      'WHERE'
      '   CODDOCUMENTO = :PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 528
    Top = 435
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryItensReceb: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 48
    Top = 368
  end
  object qryParamIntegraReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TP.IDTIPOCONTRXPATRO,'
      '   TP.IDTIPOCONTREMPTMO, TP.IDPATRO, TP.IDPLANOPREV,'
      '   TP.CCBAIXA, TP.PLANO,'
      '   TP.IDPESSOA,'
      '   TP.RECPAG, TP.CODTIPRECDES,'
      '   TP.UNIDNEGOC, TP.CODCENTRORESPON,'
      '   TP.CODTIPDOC, TP.CODPORTFORMA'
      ''
      'FROM'
      '   TIPOCONTRXPPATRO TP'
      ''
      'WHERE'
      '   ( TP.IDPATRO =:PIDPATRO )')
    ValidateWithMask = True
    Left = 176
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object qryParamIntegraRecebIDTIPOCONTRXPATRO: TFloatField
      FieldName = 'IDTIPOCONTRXPATRO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDTIPOCONTRXPATRO'
    end
    object qryParamIntegraRecebIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDTIPOCONTREMPTMO'
    end
    object qryParamIntegraRecebIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDPATRO'
    end
    object qryParamIntegraRecebIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDPLANOPREV'
    end
    object qryParamIntegraRecebCCBAIXA: TStringField
      FieldName = 'CCBAIXA'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.CCBAIXA'
      FixedChar = True
      Size = 18
    end
    object qryParamIntegraRecebPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.PLANO'
    end
    object qryParamIntegraRecebIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDPESSOA'
    end
    object qryParamIntegraRecebRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryParamIntegraRecebCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryParamIntegraRecebUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.UNIDNEGOC'
    end
    object qryParamIntegraRecebCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryParamIntegraRecebCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryParamIntegraRecebCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
  end
  object qryMarcaPlnRecPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   FLGRECEBIMENTO    = NULL,'
      '   PLNCODIGORECEB    =:PPLNCODIGORECEB'
      ''
      'WHERE'
      '   IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO'
      '   FROM'
      
        '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIP' +
        'OEMPTMO TE'
      ''
      '   WHERE'
      '          ( H.HMEANOCOBRANCA       =:PHMEANOCOBRANCA )'
      '      AND ( H.HMEMESCOBRANCA       =:PHMEMESCOBRANCA )'
      
        '      AND ( (H.HMECENTRALIZA       = 1) OR (H.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (H.FLGESTORNADO        = 0) OR (H.FLGESTORNADO IS NU' +
        'LL) )'
      '      AND ( H.HMETIPOFOLHA         = '#39'P'#39' )'
      '      AND ( H.HMEFORMACOBRANCA     = '#39'F'#39' )'
      '      AND ( H.FLGRECEBIMENTO       = 0 )'
      '      AND ( H.FLGBAIXADO           IS NULL )'
      '      AND ( H.PLNCODIGOESTORNO     IS NULL )'
      '      AND ( H.PLNCODIGORECEB       IS NULL )'
      '      AND ( H.CODDOCUMENTORECEB    IS NULL )'
      '      AND ( H.CODDOCUMENTO         IS NULL )'
      '      AND ( H.HMEVLREFETIVO        IS NOT NULL )'
      '      AND ( C.IDPATRO              =:PIDPATRO )'
      '      AND ( TE.IDEMPRESAPROP       =:PIDEMPRESAPROP )'
      '      AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO )'
      '      AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO )'
      '   )')
    ValidateWithMask = True
    Left = 224
    Top = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGORECEB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
  end
  object qryMarcaDocRecPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   FLGRECEBIMENTO    = NULL,'
      '   CODDOCUMENTORECEB    =:PCODDOCUMENTORECEB'
      ''
      'WHERE'
      '   IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO'
      '   FROM'
      
        '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIP' +
        'OEMPTMO TE'
      ''
      '   WHERE'
      '          ( H.HMEANOCOBRANCA       =:PHMEANOCOBRANCA )'
      '      AND ( H.HMEMESCOBRANCA       =:PHMEMESCOBRANCA )'
      
        '      AND ( (H.HMECENTRALIZA       = 1) OR (H.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (H.FLGESTORNADO        = 0) OR (H.FLGESTORNADO IS NU' +
        'LL) )'
      '      AND ( H.HMETIPOFOLHA         = '#39'P'#39' )'
      '      AND ( H.HMEFORMACOBRANCA     = '#39'F'#39' )'
      '      AND ( H.FLGRECEBIMENTO       = 0 )'
      '      AND ( H.FLGBAIXADO           IS NULL )'
      '      AND ( H.PLNCODIGOESTORNO     IS NULL )'
      '      AND ( H.PLNCODIGORECEB       IS NULL )'
      '      AND ( H.CODDOCUMENTORECEB    IS NULL )'
      '      AND ( H.CODDOCUMENTO         IS NULL )'
      '      AND ( H.HMEVLREFETIVO        IS NOT NULL )'
      '      AND ( C.IDPATRO              =:PIDPATRO )'
      '      AND ( TE.IDEMPRESAPROP       =:PIDEMPRESAPROP )'
      '      AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO )'
      '      AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO )'
      '   )')
    ValidateWithMask = True
    Left = 224
    Top = 524
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTORECEB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
  end
  object qryParamEmptmo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PEP.IDEMPRESAPROP,'
      ''
      '   PEP.IDGRUPOREGRA,'
      '   PEP.FLGOBRIGAVERBA,'
      '   PEP.FLGVERBAUNICA,'
      ''
      '   PEP.FLGFORMAPORT,'
      '   PEP.CODFORMAPAGTO,'
      '   PEP.PORTFORMARECTO,'
      '   PEP.PORTFORMAPAGTO,'
      '   PEP.FLGFORMAREC,'
      '   PEP.FLGFORMAPAG,'
      ''
      '   PEP.FLGDATAATUSLD,'
      '   PEP.FLGSALDODEVANT,'
      '   PEP.FLGPENDCONCESSAO,'
      ''
      '   PEP.IDTIPOCLIENTE,'
      '   PEP.IDPROGRAMA,'
      '   PEP.IDEMPRESA,'
      '   PEP.CODCENTROCUSTO,'
      ''
      '   PEP.IDCIDADES, PEP.IDESTADO, PEP.IDPAIS,'
      ''
      '   PEP.FLGINTEGRACONC,'
      '   PEP.FLGUSAFIARIO,'
      ''
      '   PEP.FLGIMPRIMEINSC,'
      ''
      '   PEP.FLGINTEGRACONTAB,'
      '   PEP.FLGINTEGRAFOLHA,'
      '   PEP.FLGINTEGRACAPCAR,'
      ''
      '   PEP.TIPODOCPAG,'
      '   PEP.TIPODOCREC,'
      ''
      '   PEP.FLGGERARUBRICA,'
      '   PEP.FLGSUSPENSAOAUTO,'
      '   PEP.FLGAMTPRESTAB,'
      '   PEP.FLGRENPRESTAB,'
      '   PEP.FLGCONCULTDIAMES,'
      ''
      '   PEP.IDITEMIOF,'
      '   PEP.IDITEMIOFCOMPL,'
      '   PEP.IDITEMIOFCOMPLCON,'
      ''
      '   PEP.FLGAGRUPAPARC,'
      '   PEP.FLGAGRUPAPARCFOL,'
      '   PEP.FLGSUSPENDEATRASO,'
      '   PEP.FLGOBRIGAAVALISTA,'
      '   PEP.FLGCALCDIA,'
      '   PEP.FLGMOSTRATIT,'
      '   PEP.FLGTRAVARDATA,'
      '   PEP.FLGTRATAASSINAT,'
      '   PEP.IDREGRAAVAL,'
      ''
      '   PEP.FLGENVIODIVERG,'
      '   PEP.FLGPARCDIVERG,'
      '   PEP.FLGTRATQUITCANC,'
      ''
      '   PEP.HORAENCERRA,'
      ''
      '   PEP.FLGCONTABCONC,'
      '   PEP.FLGCONTABPARCELA,'
      '   PEP.FLGCONTABENCARGO,'
      ''
      '   PEP.FLGINTEGRAENVIO,'
      '   PEP.FLGINTEGRAQUITA,'
      ''
      '   PEP.FLGENVIAQUITA,'
      '   PEP.FLGENVIAAMORTIZA,'
      ''
      '   CID.NOME AS NOME_CIDADE,'
      '   EST.CODESTADO, EST.NOMEESTADO,'
      '   PAI.NOMEPAIS,'
      '   REG.NOMEREGRA,'
      ''
      '   PEP.IDITEMSEGCONC,'
      '   PEP.IDITEMDEVSEGCONC,'
      '   PEP.IDITEMDEVSEGQUIT,'
      '   PEP.IDITEMSEGCOMPL,'
      ''
      '   PEP.IDITEMINESPERADO,'
      '   PEP.IDITEMSLDMAIS,'
      '   PEP.IDITEMSLDMENOS,'
      ''
      '   NVL(PEP.FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL,'
      ''
      '   PEP.IDREGRADEVSEG,'
      '   PEP.FLGINSCRET,'
      '   PEP.IDREGRAATUALDIA,'
      '   DEV.NOMEREGRA AS REGRADEV,'
      '   ATU.NOMEREGRA AS REGRAATU,'
      ''
      '   PEP.FLGCONTROLAINSC,'
      '   PEP.FLGUSAFLOATCONC,'
      ''
      '   PEP.FLGQUITAPARCMORTE,'
      '   PEP.FLGPARTIDADOBRADA,'
      '   PEP.IDITEMPROVPERDA,'
      '   PEP.IDITEMSEGESPECIAL,'
      '   PEP.FLGIMPRINSCRICAO,'
      ''
      '   PEP.IDSEGURADORA,'
      ''
      '   PEP.FLGESTORNADIVERG,'
      '   PEP.FLGESTORNOPOSQUIT,'
      ''
      '   PEP.FLGABONODIVERG,'
      '   PEP.FLGCTABANCOPREF,'
      '   PEP.IDREGRATIPOCONTR,'
      ''
      '   PEP.FLGAMORTRETROATIV,'
      '   PEP.FLGUSAMARGEMALT,'
      '   PEP.FLGOBRIGAAVALALT,'
      '   PEP.FLGTRATAATUSLD,'
      ''
      '   PEP.IDREGRAPLANOCOB,'
      '   PLC.NOMEREGRA AS REGRAPLANOCOB,'
      '   '
      '   PEP.IDPROVENTO'
      '   '
      'FROM'
      '   CIDADES     CID,'
      '   ESTADO      EST,'
      '   PAIS        PAI,'
      '   PARAMEMPTMO PEP,'
      '   REGRA       REG,'
      '   REGRA       DEV,'
      '   REGRA       ATU,'
      '   REGRA       TIP,'
      '   REGRA       PLC'
      ''
      'WHERE'
      '       PEP.IDEMPRESAPROP   =:PIDEMPRESAPROP'
      '   AND PEP.IDCIDADES       = CID.IDCIDADES(+)'
      '   AND PEP.IDESTADO        = EST.IDESTADO(+)'
      '   AND PEP.IDPAIS          = PAI.IDPAIS(+)'
      '   AND PEP.IDREGRAAVAL     = REG.IDREGRA(+)'
      '   AND PEP.IDREGRADEVSEG   = DEV.IDREGRA(+)'
      '   AND PEP.IDREGRAATUALDIA = ATU.IDREGRA(+)'
      '   AND PEP.IDREGRATIPOCONTR = TIP.IDREGRA(+)'
      '   AND PEP.IDREGRAPLANOCOB = PLC.IDREGRA(+)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 572
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryParamEmptmoIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryParamEmptmoIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
    end
    object qryParamEmptmoFLGOBRIGAVERBA: TFloatField
      FieldName = 'FLGOBRIGAVERBA'
    end
    object qryParamEmptmoFLGFORMAPORT: TStringField
      FieldName = 'FLGFORMAPORT'
      FixedChar = True
      Size = 1
    end
    object qryParamEmptmoCODFORMAPAGTO: TFloatField
      FieldName = 'CODFORMAPAGTO'
    end
    object qryParamEmptmoPORTFORMARECTO: TFloatField
      FieldName = 'PORTFORMARECTO'
    end
    object qryParamEmptmoPORTFORMAPAGTO: TFloatField
      FieldName = 'PORTFORMAPAGTO'
    end
    object qryParamEmptmoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryParamEmptmoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryParamEmptmoFLGDATAATUSLD: TFloatField
      FieldName = 'FLGDATAATUSLD'
    end
    object qryParamEmptmoIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
    end
    object qryParamEmptmoIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object qryParamEmptmoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryParamEmptmoIDESTADO: TStringField
      FieldName = 'IDESTADO'
      FixedChar = True
      Size = 3
    end
    object qryParamEmptmoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryParamEmptmoFLGINTEGRACONC: TFloatField
      FieldName = 'FLGINTEGRACONC'
    end
    object qryParamEmptmoFLGIMPRIMEINSC: TFloatField
      FieldName = 'FLGIMPRIMEINSC'
    end
    object qryParamEmptmoFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
    end
    object qryParamEmptmoFLGINTEGRAFOLHA: TFloatField
      FieldName = 'FLGINTEGRAFOLHA'
    end
    object qryParamEmptmoFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
    end
    object qryParamEmptmoTIPODOCPAG: TFloatField
      FieldName = 'TIPODOCPAG'
    end
    object qryParamEmptmoTIPODOCREC: TFloatField
      FieldName = 'TIPODOCREC'
    end
    object qryParamEmptmoFLGGERARUBRICA: TFloatField
      FieldName = 'FLGGERARUBRICA'
    end
    object qryParamEmptmoNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 50
    end
    object qryParamEmptmoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryParamEmptmoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryParamEmptmoNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object qryParamEmptmoFLGVERBAUNICA: TFloatField
      FieldName = 'FLGVERBAUNICA'
    end
    object qryParamEmptmoFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryParamEmptmoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryParamEmptmoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryParamEmptmoFLGSALDODEVANT: TFloatField
      FieldName = 'FLGSALDODEVANT'
    end
    object qryParamEmptmoIDITEMIOF: TFloatField
      FieldName = 'IDITEMIOF'
    end
    object qryParamEmptmoFLGAMTPRESTAB: TFloatField
      FieldName = 'FLGAMTPRESTAB'
    end
    object qryParamEmptmoFLGRENPRESTAB: TFloatField
      FieldName = 'FLGRENPRESTAB'
    end
    object qryParamEmptmoFLGUSAFIARIO: TFloatField
      FieldName = 'FLGUSAFIARIO'
    end
    object qryParamEmptmoIDITEMIOFCOMPL: TFloatField
      FieldName = 'IDITEMIOFCOMPL'
    end
    object qryParamEmptmoFLGCONCULTDIAMES: TFloatField
      FieldName = 'FLGCONCULTDIAMES'
    end
    object qryParamEmptmoFLGAGRUPAPARC: TFloatField
      FieldName = 'FLGAGRUPAPARC'
    end
    object qryParamEmptmoFLGSUSPENDEATRASO: TFloatField
      FieldName = 'FLGSUSPENDEATRASO'
    end
    object qryParamEmptmoFLGOBRIGAAVALISTA: TFloatField
      FieldName = 'FLGOBRIGAAVALISTA'
    end
    object qryParamEmptmoFLGCALCDIA: TFloatField
      FieldName = 'FLGCALCDIA'
    end
    object qryParamEmptmoFLGMOSTRATIT: TFloatField
      FieldName = 'FLGMOSTRATIT'
    end
    object qryParamEmptmoFLGTRAVARDATA: TFloatField
      FieldName = 'FLGTRAVARDATA'
    end
    object qryParamEmptmoFLGTRATAASSINAT: TFloatField
      FieldName = 'FLGTRATAASSINAT'
    end
    object qryParamEmptmoIDREGRAAVAL: TFloatField
      FieldName = 'IDREGRAAVAL'
    end
    object qryParamEmptmoNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryParamEmptmoHORAENCERRA: TStringField
      FieldName = 'HORAENCERRA'
      FixedChar = True
      Size = 5
    end
    object qryParamEmptmoFLGPENDCONCESSAO: TFloatField
      FieldName = 'FLGPENDCONCESSAO'
    end
    object qryParamEmptmoFLGENVIODIVERG: TFloatField
      FieldName = 'FLGENVIODIVERG'
    end
    object qryParamEmptmoFLGPARCDIVERG: TFloatField
      FieldName = 'FLGPARCDIVERG'
    end
    object qryParamEmptmoFLGTRATQUITCANC: TFloatField
      FieldName = 'FLGTRATQUITCANC'
    end
    object qryParamEmptmoFLGCONTABCONC: TFloatField
      FieldName = 'FLGCONTABCONC'
    end
    object qryParamEmptmoFLGCONTABPARCELA: TFloatField
      FieldName = 'FLGCONTABPARCELA'
    end
    object qryParamEmptmoFLGINTEGRAENVIO: TFloatField
      FieldName = 'FLGINTEGRAENVIO'
    end
    object qryParamEmptmoFLGINTEGRAQUITA: TFloatField
      FieldName = 'FLGINTEGRAQUITA'
    end
    object qryParamEmptmoIDITEMSEGCONC: TFloatField
      FieldName = 'IDITEMSEGCONC'
    end
    object qryParamEmptmoIDITEMDEVSEGCONC: TFloatField
      FieldName = 'IDITEMDEVSEGCONC'
    end
    object qryParamEmptmoIDITEMDEVSEGQUIT: TFloatField
      FieldName = 'IDITEMDEVSEGQUIT'
    end
    object qryParamEmptmoIDITEMSEGCOMPL: TFloatField
      FieldName = 'IDITEMSEGCOMPL'
    end
    object qryParamEmptmoFLGEXCEPCIONAL: TFloatField
      FieldName = 'FLGEXCEPCIONAL'
    end
    object qryParamEmptmoIDREGRADEVSEG: TFloatField
      FieldName = 'IDREGRADEVSEG'
    end
    object qryParamEmptmoIDREGRAATUALDIA: TFloatField
      FieldName = 'IDREGRAATUALDIA'
    end
    object qryParamEmptmoREGRADEV: TStringField
      FieldName = 'REGRADEV'
      Size = 60
    end
    object qryParamEmptmoREGRAATU: TStringField
      FieldName = 'REGRAATU'
      Size = 60
    end
    object qryParamEmptmoFLGQUITAPARCMORTE: TFloatField
      FieldName = 'FLGQUITAPARCMORTE'
    end
    object qryParamEmptmoFLGCONTABENCARGO: TFloatField
      FieldName = 'FLGCONTABENCARGO'
    end
    object qryParamEmptmoFLGINSCRET: TFloatField
      FieldName = 'FLGINSCRET'
    end
    object qryParamEmptmoFLGCONTROLAINSC: TFloatField
      FieldName = 'FLGCONTROLAINSC'
    end
    object qryParamEmptmoFLGUSAFLOATCONC: TFloatField
      FieldName = 'FLGUSAFLOATCONC'
    end
    object qryParamEmptmoFLGPARTIDADOBRADA: TFloatField
      FieldName = 'FLGPARTIDADOBRADA'
    end
    object qryParamEmptmoIDITEMPROVPERDA: TFloatField
      FieldName = 'IDITEMPROVPERDA'
    end
    object qryParamEmptmoIDITEMSEGESPECIAL: TFloatField
      FieldName = 'IDITEMSEGESPECIAL'
    end
    object qryParamEmptmoIDITEMIOFCOMPLCON: TFloatField
      FieldName = 'IDITEMIOFCOMPLCON'
    end
    object qryParamEmptmoIDITEMINESPERADO: TFloatField
      FieldName = 'IDITEMINESPERADO'
    end
    object qryParamEmptmoIDITEMSLDMAIS: TFloatField
      FieldName = 'IDITEMSLDMAIS'
    end
    object qryParamEmptmoIDITEMSLDMENOS: TFloatField
      FieldName = 'IDITEMSLDMENOS'
    end
    object qryParamEmptmoFLGIMPRINSCRICAO: TFloatField
      FieldName = 'FLGIMPRINSCRICAO'
    end
    object qryParamEmptmoFLGAGRUPAPARCFOL: TFloatField
      FieldName = 'FLGAGRUPAPARCFOL'
    end
    object qryParamEmptmoFLGESTORNOPOSQUIT: TFloatField
      FieldName = 'FLGESTORNOPOSQUIT'
    end
    object qryParamEmptmoFLGESTORNADIVERG: TFloatField
      FieldName = 'FLGESTORNADIVERG'
    end
    object qryParamEmptmoIDSEGURADORA: TFloatField
      FieldName = 'IDSEGURADORA'
    end
    object qryParamEmptmoFLGENVIAQUITA: TFloatField
      FieldName = 'FLGENVIAQUITA'
    end
    object qryParamEmptmoFLGENVIAAMORTIZA: TFloatField
      FieldName = 'FLGENVIAAMORTIZA'
    end
    object qryParamEmptmoFLGABONODIVERG: TFloatField
      FieldName = 'FLGABONODIVERG'
    end
    object qryParamEmptmoFLGCTABANCOPREF: TFloatField
      FieldName = 'FLGCTABANCOPREF'
    end
    object qryParamEmptmoIDREGRATIPOCONTR: TFloatField
      FieldName = 'IDREGRATIPOCONTR'
    end
    object qryParamEmptmoFLGAMORTRETROATIV: TFloatField
      FieldName = 'FLGAMORTRETROATIV'
    end
    object qryParamEmptmoFLGUSAMARGEMALT: TFloatField
      FieldName = 'FLGUSAMARGEMALT'
    end
    object qryParamEmptmoFLGOBRIGAAVALALT: TFloatField
      FieldName = 'FLGOBRIGAAVALALT'
    end
    object qryParamEmptmoFLGTRATAATUSLD: TFloatField
      FieldName = 'FLGTRATAATUSLD'
    end
    object qryParamEmptmoIDREGRAPLANOCOB: TFloatField
      FieldName = 'IDREGRAPLANOCOB'
    end
    object qryParamEmptmoIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
  end
  object updTmpDesc: TUpdateSQL
    ModifySQL.Strings = (
      'update TMPDESC'
      'set'
      '  SITENVIO = :SITENVIO'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDDESCONTO = :OLD_IDDESCONTO and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  IDMODULO = :OLD_IDMODULO')
    Left = 296
    Top = 242
  end
  object qryAuxEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select *'
      'from histmovemptmo'
      'where idhistmovemptmo = -1')
    ValidateWithMask = True
    Left = 352
    Top = 512
  end
  object qryRegra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    UpdateObject = updRegra
    ValidateWithMask = True
    Left = 116
    Top = 20
  end
  object Regra: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 264
    Top = 412
  end
  object qryVerificaDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DOC.CODDOCUMENTO, DOC.COMPLDOCUMENTO,'
      '   DOC.STATUS, DOC.EMISBLOQ, DOC.CODPORTFORMA,'
      ''
      '   LXD.NUMLOTE, LXD.VALOR, LXD.FLGBAIXA, LXD.LOTETRANSMISSAO,'
      ''
      '   LTP.FLAGEMISSAO, LTP.FLAGCANCEL'
      'FROM'
      '   DOCUMENTO  DOC,'
      '   LOTEXDOCUM LXD,'
      '   LOTEPAGTO  LTP'
      'WHERE'
      '       DOC.CODDOCUMENTO =:PCODDOCUMENTO'
      '   AND DOC.CODDOCUMENTO = LXD.CODDOCUMENTO(+)'
      '   AND LXD.NUMLOTE      = LTP.NUMLOTE(+)')
    ValidateWithMask = True
    Left = 488
    Top = 504
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryVerificaDocumentoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryVerificaDocumentoCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryVerificaDocumentoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryVerificaDocumentoEMISBLOQ: TStringField
      FieldName = 'EMISBLOQ'
      FixedChar = True
      Size = 1
    end
    object qryVerificaDocumentoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryVerificaDocumentoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object qryVerificaDocumentoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryVerificaDocumentoFLGBAIXA: TStringField
      FieldName = 'FLGBAIXA'
      FixedChar = True
      Size = 1
    end
    object qryVerificaDocumentoLOTETRANSMISSAO: TFloatField
      FieldName = 'LOTETRANSMISSAO'
    end
    object qryVerificaDocumentoFLAGEMISSAO: TStringField
      FieldName = 'FLAGEMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryVerificaDocumentoFLAGCANCEL: TStringField
      FieldName = 'FLAGCANCEL'
      FixedChar = True
      Size = 1
    end
  end
  object qryMarcaItemQuitado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE /*+INDEX(HME XPKHISTMOVEMPTMO) INDEX(HME XIE29HISTMOVEMPT' +
        'MO) */'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGQUITADO             = 1,'
      '   HME.FLGDIVERGPEND          = NULL,'
      '   HME.HMEDATAQUITABONO       =:PHMEDATAQUITABONO,'
      '   HME.IDUSUARIOESTORNO = :PIDUSUARIOESTORNO'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '   AND ( (:PIDHISTMOVEMPTMO   IS NULL) OR (HME.IDHISTMOVEMPTMO =' +
        ':PIDHISTMOVEMPTMO) )'
      '   AND HME.HMETIPOMOV         <> 3'
      '   AND HME.FLGBAIXADO         = 0'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO IS NULL) )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )')
    ValidateWithMask = True
    Left = 224
    Top = 512
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHMEDATAQUITABONO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryDesMarcaTodosItensQuitados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE /*+INDEX(HME XIE29HISTMOVEMPTMO) */'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGQUITADO       = 0,'
      '   HME.HMEDATAQUITABONO = NULL,'
      '   HME.IDUSUARIOESTORNO = NULL'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '   AND ( (:PHMEDATAQUITABONO  IS NULL) OR (HME.HMEDATAQUITABONO ' +
        '=:PHMEDATAQUITABONO) )'
      '   AND HME.HMETIPOMOV         <> 3'
      '   AND HME.FLGBAIXADO         = 0'
      '   AND HME.FLGQUITADO         = 1'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO IS NULL) )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )')
    ValidateWithMask = True
    Left = 224
    Top = 404
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAQUITABONO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAQUITABONO'
        ParamType = ptInput
      end>
  end
  object qryMarcaItensEstornados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGESTORNADO         = 1,'
      '   HMEDATAESTORNO       =:PHMEDATAESTORNO,'
      '   HMEDATAESTORNOALT    = SYSDATE,'
      '   IDUSUARIOESTORNO     =:PIDUSUARIOESTORNO'
      'WHERE'
      '       HMETIPOMOV       =:PHMETIPOMOV'
      '   AND HMEDATAPREVISTA  =:PHMEDATAPREVISTA'
      '   AND IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND (:PHMEORIGEM     IS NULL OR HMEORIGEM =:PHMEORIGEM)'
      '   AND FLGRECEBIMENTO   IS NULL'
      '   AND ('
      '           ('
      '               HMEDATAEFETIVA   IS NULL'
      '           AND HMEVLREFETIVO    IS NULL'
      '           AND FLGBAIXADO       = 0'
      '           )'
      '        OR HMEVLREFETIVO    = 0'
      '       )')
    ValidateWithMask = True
    Left = 316
    Top = 363
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHMEDATAESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptInput
      end>
  end
  object qryInsertLogTotalPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LOGTOTALPREV'
      '('
      
        'IDLOGTOTALPREV, IDMODULO, IDPESQUISA1, IDPESQUISA2, IDPESQUISA3,' +
        ' ORIGEM,'
      'DESCOPERACAO, DATA, IDUSUARIO, VERSAO'
      ')'
      'VALUES'
      '('
      
        ':PIDLOGTOTALPREV, :PIDMODULO, :PIDPESQUISA1, :PIDPESQUISA2, :PID' +
        'PESQUISA3, :PORIGEM,'
      ':PDESCOPERACAO, SYSDATE, :PIDUSUARIO, :PVERSAO'
      ')')
    ValidateWithMask = True
    Left = 296
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOGTOTALPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESQUISA1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESQUISA2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESQUISA3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESCOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PVERSAO'
        ParamType = ptInput
      end>
  end
  object qryUpdateLogTotalPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LOGTOTALPREV'
      ''
      'SET'
      '   IDMODULO       =:PIDMODULONOVO,'
      '   IDPESQUISA1    =:PIDPESQUISA1NOVO,'
      '   IDPESQUISA2    =:PIDPESQUISA2NOVO,'
      '   ORIGEM         =:PORIGEMNOVO,'
      '   DESCOPERACAO   =:PDESCOPERACAO,'
      '   DATA           =:PDATANOVO,'
      '   IDUSUARIO      =:PIDUSUARIO,'
      '   VERSAO         =:PVERSAO'
      ''
      'WHERE'
      '       IDMODULO            =:PIDMODULO'
      
        '   AND ( :PIDLOGTOTALPREV  IS NULL OR IDLOGTOTALPREV  =:PIDLOGTO' +
        'TALPREV )'
      
        '   AND ( :PIDPESQUISA1     IS NULL OR IDPESQUISA1     =:PIDPESQU' +
        'ISA1 )'
      
        '   AND ( :PIDPESQUISA2     IS NULL OR IDPESQUISA2     =:PIDPESQU' +
        'ISA2 )'
      
        '   AND ( :PORIGEM          IS NULL OR ORIGEM          =:PORIGEM ' +
        ')'
      
        '   AND ( :PDATAINI         IS NULL OR DATA            >=:PDATAIN' +
        'I )'
      
        '   AND ( :PDATAFIM         IS NULL OR DATA            <=:PDATAFI' +
        'M )')
    ValidateWithMask = True
    Left = 296
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULONOVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA1NOVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA2NOVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMNOVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESCOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PDATANOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PVERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOGTOTALPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOGTOTALPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteLogTotalPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   LOGTOTALPREV'
      'WHERE'
      '       IDMODULO            =:PIDMODULO'
      
        '   AND ( :PIDLOGTOTALPREV  IS NULL OR IDLOGTOTALPREV  =:PIDLOGTO' +
        'TALPREV )'
      
        '   AND ( :PIDPESQUISA1     IS NULL OR IDPESQUISA1     =:PIDPESQU' +
        'ISA1 )'
      
        '   AND ( :PIDPESQUISA2     IS NULL OR IDPESQUISA2     =:PIDPESQU' +
        'ISA2 )'
      
        '   AND ( :PORIGEM          IS NULL OR ORIGEM          =:PORIGEM ' +
        ')'
      
        '   AND ( :PDATAINI         IS NULL OR DATA            >=:PDATAIN' +
        'I )'
      
        '   AND ( :PDATAFIM         IS NULL OR DATA            <=:PDATAFI' +
        'M )')
    ValidateWithMask = True
    Left = 244
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOGTOTALPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOGTOTALPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESQUISA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
  end
  object qryInsertHistMovEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVEMPTMO'
      '('
      
        '  IDHISTMOVEMPTMO  , IDITEMCENTRALIZA , IDITEMEMPTMO    , IDCONT' +
        'RATOEMPTMO,'
      
        '  HMEMESCOMPETENCIA, HMEANOCOMPETENCIA, IDREGRA         , IDRUBR' +
        'ICA     ,'
      
        '  HMEMESCOBRANCA   , HMEANOCOBRANCA   , HMEFORMACOBRANCA, HMESEQ' +
        'COBRANCA,'
      
        '  HMEDATAPREVISTA  , HMEDATAATUALIZA  , HMEDATA         , HMETXJ' +
        'UROS    ,'
      '  HMEPARCELA       , HMEPARCELAALT    ,'
      '  HMESALDODEV      , HMEVLREFETIVO   , HMEVLRPREVISTO,'
      
        '  HMERECPAG        , HMETIPOMOV       , HMECENTRALIZA   , HMEORI' +
        'GEM     ,'
      
        '  HMEPRIORIDADE    , FLGENVIO         , FLGBAIXADO      , FLGDIV' +
        'ERGPEND, FLGTIPODIVERG,'
      
        '  HMENUMPARCELAS   , HMEDESTACADO     , HMEDATAVENCTO   , HMEDAT' +
        'AEFETIVA,'
      
        '  HMETIPOFOLHA     , VERSAO           , HMEDATARECEB    , HMEVLR' +
        'BASE, IDCBANCARIA,'
      '  IDPATRO          , IDPLANOPREVCONTAB'
      ')'
      'VALUES'
      '('
      
        ' SEQHISTMOVEMPTMO.NEXTVAL, :PIDITEMCENTRALIZA , :PIDITEMEMPTMO  ' +
        '  , :PIDCONTRATOEMPTMO,'
      
        ' :PHMEMESCOMPETENCIA, :PHMEANOCOMPETENCIA, :PIDREGRA         , :' +
        'PIDRUBRICA       ,'
      
        ' :PHMEMESCOBRANCA   , :PHMEANOCOBRANCA   , :PHMEFORMACOBRANCA, :' +
        'PHMESEQCOBRANCA  ,'
      
        ' :PHMEDATAPREVISTA  , :PHMEDATAATUALIZA  , :PHMEDATA         , :' +
        'PHMETXJUROS      ,'
      ' :PHMEPARCELA       , :PHMEPARCELAALT    ,'
      ' :PHMESALDODEV      , :PHMEVLREFETIVO    , :PHMEVLRPREVISTO  ,'
      
        ' :PHMERECPAG        , :PHMETIPOMOV       , :PHMECENTRALIZA   , :' +
        'PHMEORIGEM       ,'
      
        ' :PHMEPRIORIDADE    , :PFLGENVIO         , :PFLGBAIXADO      , :' +
        'PFLGDIVERGPEND   , :PFLGTIPODIVERG,'
      
        ' :PHMENUMPARCELAS   , :PHMEDESTACADO     , :PHMEDATAVENCTO   , :' +
        'PHMEDATAEFETIVA,'
      
        ' :PHMETIPOFOLHA     , :PVERSAO           , :PHMEDATARECEB    , :' +
        'PHMEVLRBASE, :PIDCBANCARIA,'
      ' :PIDPATRO          , :PIDPLANOPREVCONTAB'
      ')'
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDITEMCENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMESEQCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMETXJUROS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELAALT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMESALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMEVLREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMEVLRPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMECENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPRIORIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMENUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEDESTACADO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMETIPOFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PVERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATARECEB'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PHMEVLRBASE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREVCONTAB'
        ParamType = ptInput
      end>
  end
  object qryDadosContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CTE.FLGPERDAEFETIVA,'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDINSCRICAOEMPTMO,'
      '   CON.IDCONTRQUITACAO,'
      '   CON.IDTIPOCONTREMPTMO,'
      '   CON.IDPATRO,'
      '   CON.IDPLANOPREV,'
      '   CON.IDPLANOORIGEM,'
      '   CON.IDPESSOA,'
      '   CON.IDBENEF,'
      '   CON.IDCBANCARIA,'
      '   CON.IDCBANCARIADEB,'
      '   CON.IDVERBA,'
      '   CON.IDSITPART,'
      '   CON.FLGSITUACAO,'
      '   CON.FLGFORMAREC,'
      '   CON.PORTFORMAREC,'
      '   CON.FLGFORMAPAG,'
      '   CON.CODFORMAPAG,'
      '   CON.PORTFORMAPAG,'
      '   CON.DATAASSINATURA,'
      '   CON.DATAASSINATURA AS DATAINSC,'
      '   CON.DATACREDITO,'
      '   CON.DATAPRIMPARC,'
      '   CON.DATACANC,'
      '   CON.DATASITUACAO,'
      '   CON.PRAZO,'
      '   CON.PRAZO AS NUMPARCELAS,'
      '   CON.VLRCONTRATO,'
      '   CON.VLRPARCELA,'
      '   CON.TXJUROS,'
      '   CON.ANOSUSPENSAO,'
      '   CON.MESSUSPENSAO,'
      '   CON.VLRPARCELAMES,'
      '   CON.VLRPARCATRASO,'
      '   CON.VLRDEBITO,'
      '   CON.VLRRESERVA,'
      '   CON.VLRSALDODEV,'
      '   CON.VLRPENDENCIA,'
      '   CON.VLRSALBASE,'
      '   CON.VLRMARGEM,'
      '   CON.VLRMAXPERMIT,'
      '   CON.DATASALDODEV,'
      '   CON.DATAPENDENCIA,'
      '   CON.TCEDESCRICAO,'
      '   CON.IDTIPOEMPTMO,'
      '   CON.DESCTIPOEMPTMO,'
      '   CON.IDEMPRESAPROP,'
      '   CON.MATRICULA,'
      '   CON.INSCRICAONUMERO,'
      '   CON.SALPARTICIPACAO,'
      '   CON.SALMANTIDO,'
      '   CON.SALAUXDOENCA,'
      '   CON.SITDESCRICAO,'
      '   CON.FLGINTERNO,'
      '   CON.NOME_TITULAR,'
      '   CON.CPF_TITULAR,'
      '   CON.NOME,'
      '   CON.NOME_MUTUARIO,'
      '   CON.NUMDOCUMENTO,'
      '   CON.CPF_MUTUARIO,'
      '   CON.IDREGRAMARGEM,'
      '   CON.IDREGRARESERVA,'
      '   CON.IDREGRAELEG,'
      '   CON.IDREGRALIMITES,'
      '   CON.TCEMINRENOVA,'
      '   CON.TCEDIASVALIDINSC,'
      '   CON.TCEDIASTOLERAINSC,'
      '   CON.TCEMAXCONTRATO,'
      '   CON.TCEMAXINSCR,'
      '   CON.TCEMAXPARC,'
      '   CON.TCEMINPARC,'
      '   CON.TCEMINQUIT,'
      ''
      '   DEP.MATRICULA AS MATRICULA_MUTUARIO,'
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Ativo'#39','
      '                          '#39'C'#39', '#39'Cancelado'#39','
      '                          '#39'E'#39', '#39'Encerrado'#39','
      '                          '#39'Q'#39', '#39'Quitado'#39','
      '                          '#39'P'#39', '#39'Pendente'#39','
      '                          '#39'R'#39', '#39'Refinanciado'#39','
      '                          '#39'S'#39', '#39'Suspenso'#39','
      
        '                          '#39'K'#39', '#39'Pendente de Quitação'#39') AS DESCSI' +
        'TCONTRATO,'
      '   PLP.NOME AS PLANOPREV,'
      '   PPA.NOME AS PATRO,'
      '   PBA.NOME AS BANCO,'
      '   BCO.NUMBANCO,'
      '   CBA.CONTACORRENTE,'
      '   AGE.NUMAGENCIA,'
      '   AMO.HMEDATAPREVISTA AS AMODATAPREVISTA,'
      '   DECODE(AMO.HMEFORMACOBRANCA, '#39'C'#39', '#39'CONTAS A RECEBER  '#39','
      
        '                                '#39'F'#39', '#39'FOLHA DE PAGAMENTO'#39') AS FO' +
        'RMAPAGAMORT,'
      '   QUI.HMEDATAPREVISTA AS QUIDATAPREVISTA,'
      '   DECODE(AMO.HMEFORMACOBRANCA, '#39'C'#39', '#39'CONTAS A RECEBER  '#39','
      
        '                                '#39'F'#39', '#39'FOLHA DE PAGAMENTO'#39') AS FO' +
        'RMAPAGQUITA,'
      ''
      '   SLD.DATAULTATUALIZA,'
      ''
      '   CON.MOECODIGO, MOE.MOESIGLA,'
      '   CON.IDTIPOSUSPEMPTMO,'
      '   CON.DATAINICIOSUSP,'
      '   CON.DATAFIMSUSP,'
      '   CON.USUARIOLIBSUSP,'
      '   CON.DATALIBSUSP,'
      '   CON.HORALIBSUSP,'
      '   CON.FLGSUSPENSAOAUTO,'
      '   CTE.FLGFINANCIAMENTO,'
      ' AMO.ORIGEMRECURSO,'
      ' AMO.IDTIPORECURSO'
      ''
      'FROM'
      '   PESSOA          PPA,'
      '   PESSOA          PBA,'
      '   VWCONTRATOEP    CON,'
      '   DEPENTIT        DEP,'
      '   PLANPREV        PLP,'
      '   BANCO           BCO,'
      '   CONTABANCARIA   CBA,'
      '   AGENCIABANCARIA AGE,'
      '   MOEDA           MOE,'
      '   CONTRATOEMPTMO  CTE,'
      ''
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      HME.HMEORIGEM,'
      '      HME.HMECENTRALIZA,'
      '      HME.HMEDATAPREVISTA,'
      '      HME.HMEFORMACOBRANCA,'
      '      HME.ORIGEMRECURSO,'
      '      HME.IDTIPORECURSO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '      AND HME.HMETIPOMOV       = 2'
      '      AND ('
      '          HME.HMEVLRPREVISTO   = 0 OR'
      '          ('
      '          HME.FLGBAIXADO       = 0     AND'
      '          HME.HMEVLREFETIVO    IS NULL AND'
      '          HME.HMEDATAEFETIVA   IS NULL)) AND'
      '          '
      '         (NVL(HME.FLGQUITADO, 0) = 0) AND'
      '         (NVL(HME.FLGABONADO, 0) = 0) AND'
      '         (NVL(HME.FLGESTORNADO, 0) = 0)'
      '   ) AMO,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      HME.HMEORIGEM,'
      '      HME.HMECENTRALIZA,'
      '      HME.HMEDATAPREVISTA,'
      '      HME.HMEFORMACOBRANCA,'
      '      HME.ORIGEMRECURSO,'
      '      HME.IDTIPORECURSO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV       = 3'
      
        '      AND ( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 OR HM' +
        'E.HMEORIGEM = 8 )'
      
        '      --AND ( HME.FLGBAIXADO     = 0 OR (HME.HMEORIGEM = 8 AND H' +
        'ME.FLGBAIXADO IS NULL))'
      
        '      AND ( HME.FLGBAIXADO     = 0 OR ((HME.HMEORIGEM = 8 OR HME' +
        '.HMEORIGEM = 10) AND HME.FLGBAIXADO IS NULL))'
      '      AND (NVL(HME.FLGQUITADO, 0) = 0)'
      '      AND (NVL(HME.FLGABONADO, 0) = 0)'
      '      AND (NVL(HME.FLGESTORNADO, 0) = 0)) QUI,'
      ' '
      '   ('
      '   SELECT'
      '      IDCONTRATOEMPTMO,'
      '      MAX(HMEDATAATUALIZA) AS DATAULTATUALIZA'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      '          ( IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '      AND (nvl(FLGESTORNADO,0) = 0)'
      '   '
      '   GROUP BY'
      '      IDCONTRATOEMPTMO'
      '   ) SLD'
      'WHERE'
      '       CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '   AND SLD.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'
      '   AND CTE.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO  = AMO.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO  = QUI.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDPESSOA          = DEP.IDTITULAR(+)'
      '   AND CON.IDBENEF           = DEP.IDPESSOA(+)'
      '   AND CON.IDPATRO           = PPA.IDPESSOA'
      '   AND CON.IDPLANOPREV       = PLP.IDPLANOPREV'
      '   AND CON.IDCBANCARIA       = CBA.IDCBANCARIA(+)'
      '   AND CBA.IDAGENCIA         = AGE.IDPESSOA(+)'
      '   AND AGE.IDBANCO           = BCO.IDPESSOA(+)'
      '   AND BCO.IDPESSOA          = PBA.IDPESSOA(+)'
      '   AND CON.MOECODIGO         = MOE.MOECODIGO(+)'
      ''
      'ORDER BY'
      '   QUI.HMEDATAPREVISTA DESC, AMO.HMEDATAPREVISTA DESC'
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryDadosContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryDadosContratoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryDadosContratoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryDadosContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryDadosContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryDadosContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDadosContratoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryDadosContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDadosContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryDadosContratoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryDadosContratoIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryDadosContratoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryDadosContratoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryDadosContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryDadosContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryDadosContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryDadosContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryDadosContratoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryDadosContratoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryDadosContratoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryDadosContratoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryDadosContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDadosContratoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryDadosContratoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryDadosContratoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryDadosContratoPRAZO: TFloatField
      FieldName = 'PRAZO'
    end
    object qryDadosContratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryDadosContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryDadosContratoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryDadosContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryDadosContratoANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
    end
    object qryDadosContratoMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
    end
    object qryDadosContratoVLRPARCELAMES: TFloatField
      FieldName = 'VLRPARCELAMES'
    end
    object qryDadosContratoVLRPARCATRASO: TFloatField
      FieldName = 'VLRPARCATRASO'
    end
    object qryDadosContratoVLRDEBITO: TFloatField
      FieldName = 'VLRDEBITO'
    end
    object qryDadosContratoVLRRESERVA: TFloatField
      FieldName = 'VLRRESERVA'
    end
    object qryDadosContratoVLRSALDODEV: TFloatField
      FieldName = 'VLRSALDODEV'
    end
    object qryDadosContratoVLRPENDENCIA: TFloatField
      FieldName = 'VLRPENDENCIA'
    end
    object qryDadosContratoVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
    end
    object qryDadosContratoVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
    end
    object qryDadosContratoVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
    end
    object qryDadosContratoDATASALDODEV: TDateTimeField
      FieldName = 'DATASALDODEV'
    end
    object qryDadosContratoDATAPENDENCIA: TDateTimeField
      FieldName = 'DATAPENDENCIA'
    end
    object qryDadosContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryDadosContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryDadosContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDadosContratoIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryDadosContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryDadosContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDadosContratoSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
    end
    object qryDadosContratoSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
    end
    object qryDadosContratoSALAUXDOENCA: TFloatField
      FieldName = 'SALAUXDOENCA'
    end
    object qryDadosContratoSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      Size = 50
    end
    object qryDadosContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryDadosContratoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryDadosContratoCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      FixedChar = True
      Size = 18
    end
    object qryDadosContratoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDadosContratoNOME_MUTUARIO: TStringField
      FieldName = 'NOME_MUTUARIO'
      Size = 60
    end
    object qryDadosContratoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDadosContratoCPF_MUTUARIO: TStringField
      FieldName = 'CPF_MUTUARIO'
      FixedChar = True
      Size = 18
    end
    object qryDadosContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object qryDadosContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object qryDadosContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object qryDadosContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object qryDadosContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryDadosContratoTCEDIASVALIDINSC: TFloatField
      FieldName = 'TCEDIASVALIDINSC'
    end
    object qryDadosContratoTCEDIASTOLERAINSC: TFloatField
      FieldName = 'TCEDIASTOLERAINSC'
    end
    object qryDadosContratoTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
    end
    object qryDadosContratoTCEMAXINSCR: TFloatField
      FieldName = 'TCEMAXINSCR'
    end
    object qryDadosContratoTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
    end
    object qryDadosContratoTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
    end
    object qryDadosContratoTCEMINQUIT: TFloatField
      FieldName = 'TCEMINQUIT'
    end
    object qryDadosContratoMATRICULA_MUTUARIO: TStringField
      FieldName = 'MATRICULA_MUTUARIO'
      Size = 15
    end
    object qryDadosContratoDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryDadosContratoPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryDadosContratoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryDadosContratoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryDadosContratoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryDadosContratoCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryDadosContratoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryDadosContratoAMODATAPREVISTA: TDateTimeField
      FieldName = 'AMODATAPREVISTA'
    end
    object qryDadosContratoFORMAPAGAMORT: TStringField
      FieldName = 'FORMAPAGAMORT'
      Size = 18
    end
    object qryDadosContratoQUIDATAPREVISTA: TDateTimeField
      FieldName = 'QUIDATAPREVISTA'
    end
    object qryDadosContratoFORMAPAGQUITA: TStringField
      FieldName = 'FORMAPAGQUITA'
      Size = 18
    end
    object qryDadosContratoDATAULTATUALIZA: TDateTimeField
      FieldName = 'DATAULTATUALIZA'
    end
    object qryDadosContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryDadosContratoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryDadosContratoIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryDadosContratoDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryDadosContratoDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryDadosContratoUSUARIOLIBSUSP: TStringField
      FieldName = 'USUARIOLIBSUSP'
      Size = 30
    end
    object qryDadosContratoDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
    end
    object qryDadosContratoHORALIBSUSP: TStringField
      FieldName = 'HORALIBSUSP'
      Size = 8
    end
    object qryDadosContratoFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryDadosContratoFLGFINANCIAMENTO: TFloatField
      FieldName = 'FLGFINANCIAMENTO'
    end
    object qryDadosContratoORIGEMRECURSO: TStringField
      FieldName = 'ORIGEMRECURSO'
      Size = 200
    end
    object qryDadosContratoIDTIPORECURSO: TFloatField
      FieldName = 'IDTIPORECURSO'
    end
    object qryDadosContratoFLGPERDAEFETIVA: TFloatField
      FieldName = 'FLGPERDAEFETIVA'
    end
  end
  object qryBancoPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   BPF.IDBANCOPORTFORMA,'
      '   BPF.IDBANCO,'
      '   BPF.CODPORTFORMA,'
      '   BPF.VLRARREDSALARIO,'
      '   BPF.DFLOATPAGTO,'
      '   BPF.COLVALOR,'
      '   BPF.TAMVALOR,'
      '   BPF.PREFIXOARQ,'
      '   BPF.IDFAVORECIDO'
      'FROM'
      '   BANCOPORTFORMA BPF'
      'WHERE'
      '       BPF.IDMODULO          = 15'
      
        '   AND ( (:PIDBANCOPORTFORMA IS NULL) OR (BPF.IDBANCOPORTFORMA  ' +
        '=:PIDBANCOPORTFORMA) )'
      
        '   AND ( (:PIDBANCO          IS NULL) OR (BPF.IDBANCO           ' +
        '=:PIDBANCO) )'
      
        '   AND ( (:PCODPORTFORMA     IS NULL) OR (BPF.CODPORTFORMA      ' +
        '=:PCODPORTFORMA) )'
      ' ')
    ValidateWithMask = True
    Left = 524
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBANCOPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBANCOPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object qryBancoPortFormaIDBANCOPORTFORMA: TFloatField
      FieldName = 'IDBANCOPORTFORMA'
      Origin = 'BASEDADOS.BANCOPORTFORMA.IDBANCOPORTFORMA'
    end
    object qryBancoPortFormaIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Origin = 'BASEDADOS.BANCOPORTFORMA.IDBANCO'
    end
    object qryBancoPortFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.BANCOPORTFORMA.CODPORTFORMA'
    end
    object qryBancoPortFormaVLRARREDSALARIO: TFloatField
      FieldName = 'VLRARREDSALARIO'
      Origin = 'BASEDADOS.BANCOPORTFORMA.VLRARREDSALARIO'
    end
    object qryBancoPortFormaDFLOATPAGTO: TFloatField
      FieldName = 'DFLOATPAGTO'
      Origin = 'BASEDADOS.BANCOPORTFORMA.DFLOATPAGTO'
    end
    object qryBancoPortFormaCOLVALOR: TFloatField
      FieldName = 'COLVALOR'
      Origin = 'BASEDADOS.BANCOPORTFORMA.COLVALOR'
    end
    object qryBancoPortFormaTAMVALOR: TFloatField
      FieldName = 'TAMVALOR'
      Origin = 'BASEDADOS.BANCOPORTFORMA.TAMVALOR'
    end
    object qryBancoPortFormaPREFIXOARQ: TStringField
      FieldName = 'PREFIXOARQ'
      Origin = 'BASEDADOS.BANCOPORTFORMA.PREFIXOARQ'
      Size = 10
    end
    object qryBancoPortFormaIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Origin = 'BASEDADOS.BANCOPORTFORMA.IDFAVORECIDO'
    end
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PFO.CODPORTFORMA,'
      '   PFO.CODPORTADOR,'
      '   PFO.CODFORMA,'
      '   PFO.RECPAG,'
      '   PFO.DMAIS,'
      '   PFO.NUMEMPRESABANCO,'
      '   PFO.NOSSONUMERO,'
      '   PFO.DESCRICAO,'
      ''
      '   PFO.CONTROLEREMESSA,'
      '   PFO.DATACONTRREMESSA,'
      '   PFO.CODARQUIVOREMESSA,'
      '   PFO.FLGEMITEAVISO,'
      ''
      '   PFO.CODTIPOPAGTO,'
      ''
      '   PCO.IDBANCO,'
      '   PCO.NOCONTACORR,'
      '   PFO.DMAISALT,'
      '   PFO.CODFORMAPGTOALT,'
      '   PFO.VALORMAXIMO'
      ''
      'FROM'
      '   PORTADORFORMA PFO,'
      '   PORTADORCONTA PCO'
      ''
      'WHERE'
      '       PFO.RECPAG      = '#39'P'#39
      
        '   AND ( (:PCODPORTFORMA IS NULL) OR (PFO.CODPORTFORMA =:PCODPOR' +
        'TFORMA) )'
      '   AND NVL(PFO.FLGATIVO,'#39'S'#39') = '#39'S'#39
      '   AND PFO.CODPORTADOR = PCO.CODPORTADOR'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 268
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
    object qryPortadorFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTFORMA'
    end
    object qryPortadorFormaCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTADOR'
    end
    object qryPortadorFormaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODFORMA'
    end
    object qryPortadorFormaRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PORTADORFORMA.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryPortadorFormaDMAIS: TFloatField
      FieldName = 'DMAIS'
      Origin = 'BASEDADOS.PORTADORFORMA.DMAIS'
    end
    object qryPortadorFormaNUMEMPRESABANCO: TStringField
      FieldName = 'NUMEMPRESABANCO'
      Origin = 'BASEDADOS.PORTADORFORMA.NUMEMPRESABANCO'
    end
    object qryPortadorFormaNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'BASEDADOS.PORTADORFORMA.NOSSONUMERO'
    end
    object qryPortadorFormaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryPortadorFormaIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Origin = 'BASEDADOS.PORTADORCONTA.IDBANCO'
    end
    object qryPortadorFormaCONTROLEREMESSA: TFloatField
      FieldName = 'CONTROLEREMESSA'
      Origin = 'BASEDADOS.PORTADORFORMA.CONTROLEREMESSA'
    end
    object qryPortadorFormaDATACONTRREMESSA: TDateTimeField
      FieldName = 'DATACONTRREMESSA'
      Origin = 'BASEDADOS.PORTADORFORMA.DATACONTRREMESSA'
    end
    object qryPortadorFormaCODARQUIVOREMESSA: TFloatField
      FieldName = 'CODARQUIVOREMESSA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODARQUIVOREMESSA'
    end
    object qryPortadorFormaCODTIPOPAGTO: TFloatField
      FieldName = 'CODTIPOPAGTO'
      Origin = 'BASEDADOS.PORTADORFORMA.CODTIPOPAGTO'
    end
    object qryPortadorFormaNOCONTACORR: TStringField
      FieldName = 'NOCONTACORR'
      Origin = 'BASEDADOS.PORTADORCONTA.NOCONTACORR'
      FixedChar = True
      Size = 15
    end
    object qryPortadorFormaFLGEMITEAVISO: TStringField
      FieldName = 'FLGEMITEAVISO'
      Origin = 'BASEDADOS.PORTADORFORMA.FLGEMITEAVISO'
      FixedChar = True
      Size = 1
    end
    object qryPortadorFormaDMAISALT: TFloatField
      FieldName = 'DMAISALT'
      Origin = 'BASEDADOS.PORTADORFORMA.DMAISALT'
    end
    object qryPortadorFormaCODFORMAPGTOALT: TFloatField
      FieldName = 'CODFORMAPGTOALT'
      Origin = 'BASEDADOS.PORTADORFORMA.CODFORMAPGTOALT'
    end
    object qryPortadorFormaVALORMAXIMO: TFloatField
      FieldName = 'VALORMAXIMO'
      Origin = 'BASEDADOS.PORTADORFORMA.VALORMAXIMO'
    end
  end
  object qrySeqContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SEQCONTRATOEMPTMO.NEXTVAL AS SEQCONTRATOEMPTMO'
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 514
    Top = 114
    object qrySeqContratoSEQCONTRATOEMPTMO: TFloatField
      FieldName = 'SEQCONTRATOEMPTMO'
    end
  end
  object qryEntidadeContabilVolta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV, IDPLANPREVC'
      ''
      'FROM'
      '   PLANPREVXCONTABIL'
      ''
      'WHERE'
      '   IDPLANPREVC =:PIDPLANPREVC')
    ValidateWithMask = True
    Left = 104
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANPREVC'
        ParamType = ptInput
      end>
    object qryEntidadeContabilVoltaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANOPREV'
    end
    object qryEntidadeContabilVoltaIDPLANPREVC: TFloatField
      FieldName = 'IDPLANPREVC'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANPREVC'
    end
  end
  object qryUpdatePlanoOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO'
      'SET'
      '   IDPLANOORIGEM    =:PIDPLANOORIGEM'
      'WHERE'
      '   IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryMutuarioContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA,'
      '   IDBENEF,'
      '   IDPLANOORIGEM,'
      '   IDPLANOPREV,'
      '   IDPATRO'
      'FROM'
      '   CONTRATOEMPTMO'
      'WHERE'
      '   IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 344
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryMutuarioContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPESSOA'
    end
    object qryMutuarioContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDBENEF'
    end
    object qryMutuarioContratoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPLANOORIGEM'
    end
    object qryMutuarioContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPLANOPREV'
    end
    object qryMutuarioContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPATRO'
    end
  end
  object qryUpdateFlgEstorno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGESTORNADO      = 1,'
      '   HME.HMEDATAESTORNO    =:PHMEDATAESTORNO,'
      '   HME.IDUSUARIOESTORNO  =:PIDUSUARIOESTORNO,'
      
        '   HME.HMEOBSERVACAO     = HME.HMEOBSERVACAO || '#39' - '#39' || :PHMEOB' +
        'SERVACAO'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO         =:PIDCONTRATOEMPTMO'
      
        '   AND (:PHMETIPOMOV                IS NULL OR HME.HMETIPOMOV   ' +
        '  =:PHMETIPOMOV)'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0)     = 0'
      '   AND NVL(HME.FLGABONADO, 0)       = 0'
      '   AND NVL(HME.FLGQUITADO, 0)       = 0'
      ''
      '   AND HME.HMEVLREFETIVO            IS NULL'
      '   AND HME.HMEDATAEFETIVA           IS NULL'
      '   AND HME.FLGBAIXADO               = 0'
      ''
      
        '   AND ( (:PENVIADO                 IS NULL) OR (:PENVIADO      ' +
        '  IS NOT NULL AND FLGENVIO      IS NULL) )'
      
        '   AND ( (:PNAOENVIADO              IS NULL) OR (:PNAOENVIADO   ' +
        '  IS NOT NULL AND (FLGENVIO     = 0 OR NVL(FLGSUSPENSAO, 0) = 1'
      '   AND NOT EXISTS (SELECT FLGENVIA FROM TIPOSUSPEMPTMO TE '
      
        '                                         WHERE TE.IDTIPOSUSPEMPT' +
        'MO = HME.IDTIPOSUSPEMPTMO'
      '                                         AND FLGENVIA = 1))))'
      
        '   AND (:PIDITEMEMPTMO              IS NULL OR IDITEMEMPTMO     ' +
        '  =:PIDITEMEMPTMO)'
      
        '   AND (:PIDHISTMOVEMPTMO           IS NULL OR IDHISTMOVEMPTMO  ' +
        '  =:PIDHISTMOVEMPTMO)'
      ''
      
        '   AND ( (:PFILTROPORDATAPREVISTA   IS NULL) OR (HMEDATAPREVISTA' +
        '  BETWEEN :PHMEDATAPREVISTAINI AND :PHMEDATAPREVISTAFIM) )'
      
        '   AND ( (:PFILTROPORDATAATUALIZA   IS NULL) OR (HMEDATAATUALIZA' +
        '  BETWEEN :PHMEDATAATUALIZAINI AND :PHMEDATAATUALIZAFIM) )'
      ''
      '   AND NOT EXISTS ('
      '                  SELECT 1'
      '                  FROM'
      '                     HISTMOVEMPTMO H2'
      '                  WHERE'
      
        '                         H2.HMETIPOMOV           = HME.HMETIPOMO' +
        'V'
      
        '                     AND (H2.HMECENTRALIZA       = 1 OR H2.HMEDE' +
        'STACADO = 1)'
      '                     AND NVL(H2.FLGESTORNADO, 0) = 0'
      '                     AND ('
      '                         H2.HMEVLREFETIVO        IS NOT NULL OR'
      '                         H2.FLGBAIXADO           IS NULL OR'
      '                         H2.FLGABONADO           = 1 OR'
      '                         H2.FLGQUITADO           = 1'
      '                         )'
      
        '                     AND H2.HMEPARCELA           = HME.HMEPARCEL' +
        'A'
      
        '                     AND H2.HMEANOCOMPETENCIA    = HME.HMEANOCOM' +
        'PETENCIA'
      
        '                     AND H2.HMEMESCOMPETENCIA    = HME.HMEMESCOM' +
        'PETENCIA'
      
        '                     AND H2.IDCONTRATOEMPTMO     = HME.IDCONTRAT' +
        'OEMPTMO'
      '                  )'
      '   AND ('
      '         ('
      '         :PNAOENVIADO         IS NULL  OR'
      '         HME.HMECENTRALIZA    = 1      OR'
      '         HME.HMEDESTACADO     = 1'
      '         )'
      '         OR'
      '         ('
      '         :PNAOENVIADO         IS NOT NULL AND'
      '         HME.HMECENTRALIZA    = 0 AND'
      '         NOT EXISTS ('
      '                    SELECT 1'
      '                    FROM'
      '                       HISTMOVEMPTMO H2'
      '                    WHERE'
      
        '                           H2.HMETIPOMOV           = HME.HMETIPO' +
        'MOV'
      
        '                       AND (H2.HMECENTRALIZA       = 1 OR H2.HME' +
        'DESTACADO = 1)'
      '                       AND H2.FLGENVIO             IS NULL'
      
        '                       AND HME.IDITEMCENTRALIZA     = H2.IDITEME' +
        'MPTMO'
      
        '                       AND H2.HMEPARCELA           = HME.HMEPARC' +
        'ELA'
      
        '                       AND H2.HMEANOCOMPETENCIA    = HME.HMEANOC' +
        'OMPETENCIA'
      
        '                       AND H2.HMEMESCOMPETENCIA    = HME.HMEMESC' +
        'OMPETENCIA'
      
        '                       AND H2.IDCONTRATOEMPTMO     = HME.IDCONTR' +
        'ATOEMPTMO'
      '                    )'
      '         )'
      '       )'
      '   AND ('
      '         ('
      '         :PFLGESTORNOPOSQUIT  IS NULL'
      '         )'
      '         OR'
      '         ('
      '         :PFLGESTORNOPOSQUIT  IS NOT NULL AND'
      '         EXISTS ('
      '                SELECT 1'
      '                FROM'
      '                   ITEMXTIPOCONTR IT,'
      '                   CONTRATOEMPTMO CO'
      '                WHERE'
      
        '                       CO.IDCONTRATOEMPTMO      = HME.IDCONTRATO' +
        'EMPTMO'
      
        '                   AND IT.IDTIPOCONTREMPTMO     = CO.IDTIPOCONTR' +
        'EMPTMO'
      
        '                   AND IT.IDITEMEMPTMO          = HME.IDITEMEMPT' +
        'MO'
      '                   AND nvl(FLGESTORNOPOSQUIT,0) = 1'
      '                )'
      '         )'
      '       )')
    ValidateWithMask = True
    Left = 200
    Top = 312
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PHMEDATAESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEOBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROPORDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROPORDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOENVIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNOPOSQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNOPOSQUIT'
        ParamType = ptInput
      end>
  end
  object qryExisteAtualizacaoDiariaMutuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO, COUNT(HME.HMEDATAPREVISTA) AS TOTAL'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '       HME.HMETIPOMOV            = 5'
      '   AND CON.IDPESSOA              =:PIDPESSOA'
      '   AND CON.IDBENEF               =:PIDBENEF'
      '   AND HME.HMEDATAPREVISTA       =:PHMEDATAPREVISTA'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND CON.FLGSITUACAO           NOT IN ('#39'C'#39', '#39'Q'#39')'
      '   AND CON.IDCONTRATOEMPTMO      = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 48
    Top = 468
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryExisteAtualizacaoDiariaMutuarioIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryExisteAtualizacaoDiariaMutuarioTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qrySeqHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SEQHISTMOVEMPTMO.NEXTVAL AS SEQHISTMOVEMPTMO'
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 666
    Top = 34
    object qrySeqHistMovSEQHISTMOVEMPTMO: TFloatField
      FieldName = 'SEQHISTMOVEMPTMO'
    end
  end
  object ResourceManager: TCMResourceManager
    PathExe = 'C:\ProjetosCM5\Bin\'
    PathBpl = 'C:\ProjetosCM5\CM\Packages\'
    Left = 48
    Top = 532
  end
  object updRegra: TUpdateSQL
    Left = 144
    Top = 344
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 404
  end
  object sqlRegra: TCMSqlParams
    ClientDataSet = cdsRegra
    Left = 328
    Top = 408
  end
  object RegraMT: TRegraMT
    IdCalculo = 0
    DatabaseName = 'BaseDados'
    DbConnectionType = cntBDE
    Left = 256
    Top = 352
  end
  object qryVerificaLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   COUNT(*) AS QTDLANCTODOCUM'
      'FROM'
      '   LANCTODOCUM'
      'WHERE'
      '           ESTORNO IS NULL '
      '   AND CODDOCUMENTO =:PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 544
    Top = 276
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryVerificaLanctoDocumQTDLANCTODOCUM: TFloatField
      FieldName = 'QTDLANCTODOCUM'
    end
  end
  object QryTpContratoEmp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCONTREMPTMO FROM CONTRATOEMPTMO'
      'WHERE IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 552
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryAtualizaSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CONTRATOEMPTMO SET FLGSITUACAO = '#39'A'#39
      'WHERE'
      '       IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 504
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryParamFlagVerifica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDCONTRATOEMPTMO,FLGPERDAEFETIVA '
      'from CONTRATOEMPTMO '
      'where IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 512
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
        Value = 0
      end>
  end
end
