object DtmCmBack: TDtmCmBack
  OldCreateOrder = True
  OnDestroy = DtmCmBackDestroy
  Left = 71
  Top = 51
  Height = 561
  Width = 681
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 29
    Top = 8
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                  '
      '   UNIDNEGOC            '
      'FROM                    '
      '   PARAMGLOBAL          '
      'WHERE                   '
      '   (IDPESSOA=:IDPESSOA) ')
    ValidateWithMask = True
    Left = 100
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
  end
  object qryCotMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COTVALOR                   '
      'FROM'
      '   COTACAOMOEDA'
      'WHERE'
      '   (MOECODIGO = :MOECODIGO)  AND'
      '   (:COTDATA >= COTDATA)   AND'
      '   (:COTDATA <= DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM))')
    ValidateWithMask = True
    Left = 176
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'COTDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'COTDATA'
        ParamType = ptUnknown
      end>
    object qryCotMoedaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
  end
  object qryVerifPlanil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                '
      '   PLNCODIGO, PLNPLANIL, PLNEFETIVADO,'
      '   PLNDATDIA, PEREXERCICIO, PERNUMERO '
      'FROM                                  '
      '   PLANILHA                           '
      'WHERE                                 '
      '   (PLNCODIGO=:PLNCODIGO)             ')
    ValidateWithMask = True
    Left = 29
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryVerifPlanilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'PLANILHA.PLNCODIGO'
    end
    object qryVerifPlanilPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
      Origin = 'PLANILHA.PLNPLANIL'
    end
    object qryVerifPlanilPLNEFETIVADO: TStringField
      FieldName = 'PLNEFETIVADO'
      Origin = 'PLANILHA.PLNEFETIVADO'
      Size = 1
    end
    object qryVerifPlanilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
      Origin = 'PLANILHA.PLNDATDIA'
    end
    object qryVerifPlanilPEREXERCICIO: TFloatField
      FieldName = 'PEREXERCICIO'
      Origin = 'PLANILHA.PEREXERCICIO'
    end
    object qryVerifPlanilPERNUMERO: TFloatField
      FieldName = 'PERNUMERO'
      Origin = 'PLANILHA.PERNUMERO'
    end
  end
  object qryNumLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLNCODIGO, LACNUMLAN                         '
      'FROM                                            '
      '   LANCAMENTO                                   '
      'WHERE                                           '
      '   (PLNCODIGO =:PLNCODIGO)                  AND '
      '   (PLACONTA =:PLACONTA)                    AND'
      '   (PLANO =:PLANO)                          AND'
      '   (IDMODULO =:IDMODULO)                    AND'
      '   (LACDEBCRE =:LACDEBCRE)                  AND'
      '   (LACTIPO =:LACTIPO)                      AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO =:CODCENTROCUSTO)        AND '
      '   (CODSUBCONTA =:CODSUBCONTA)                  '
      ' ')
    ValidateWithMask = True
    Left = 28
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACDEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end>
    object qryNumLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryNumLancLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
    end
  end
  object qryParamContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   PACDIAMES, PLANO, PACDATABLOQ, FLGPERMITEZERO, FLGHISTCAIXAAL' +
        'TA            '
      'FROM                    '
      '   PARAMCONTAB          '
      'WHERE                   '
      '   (IDPESSOA=:IDPESSOA) '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamContabPACDIAMES: TStringField
      FieldName = 'PACDIAMES'
      Origin = 'PARAMCONTAB.PACDIAMES'
      Size = 1
    end
    object qryParamContabPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryParamContabPACDATABLOQ: TDateTimeField
      FieldName = 'PACDATABLOQ'
      Origin = 'BASEDADOS.PARAMCONTAB.PACDATABLOQ'
    end
    object qryParamContabFLGPERMITEZERO: TStringField
      FieldName = 'FLGPERMITEZERO'
      Origin = 'BASEDADOS.PARAMCONTAB.FLGPERMITEZERO'
      FixedChar = True
      Size = 1
    end
    object qryParamContabFLGHISTCAIXAALTA: TStringField
      FieldName = 'FLGHISTCAIXAALTA'
      Origin = 'BASEDADOS.PARAMCONTAB.FLGHISTCAIXAALTA'
      FixedChar = True
      Size = 1
    end
  end
  object qryProxPlanilD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                            '
      '   MAX(PLNPLANIL) AS IDPROXPLANIL '
      'FROM                              '
      '   PLANILHA                       '
      'WHERE                             '
      '   (IDPESSOA=:IDPESSOA) AND       '
      '   (PLNDATDIA=:PLNDATDIA)         ')
    ValidateWithMask = True
    Left = 245
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PLNDATDIA'
        ParamType = ptUnknown
      end>
    object qryProxPlanilDIDPROXPLANIL: TFloatField
      FieldName = 'IDPROXPLANIL'
      Origin = 'PLANILHA.PLNPLANIL'
    end
  end
  object qryProxPlanilP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '   MAX(PLNPLANIL) AS IDPROXPLANIL   '
      'FROM                                '
      '   PLANILHA                         '
      'WHERE                               '
      '   (IDPESSOA=:IDPESSOA) AND         '
      '   (PEREXERCICIO=:PEREXERCICIO) AND '
      '   (PERNUMERO=:PERNUMERO)           ')
    ValidateWithMask = True
    Left = 29
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end>
    object qryProxPlanilPIDPROXPLANIL: TFloatField
      FieldName = 'IDPROXPLANIL'
      Origin = 'PLANILHA.PLNPLANIL'
    end
  end
  object qryProxPlanilE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '   MAX(PLNPLANIL) AS IDPROXPLANIL   '
      'FROM                                '
      '   PLANILHA                         '
      'WHERE                               '
      '   (IDPESSOA=:IDPESSOA) AND         '
      '   (PEREXERCICIO=:PEREXERCICIO)     ')
    ValidateWithMask = True
    Left = 100
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end>
    object qryProxPlanilEIDPROXPLANIL: TFloatField
      FieldName = 'IDPROXPLANIL'
      Origin = 'PLANILHA.PLNPLANIL'
    end
  end
  object qryPlanilIns: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PLANILHA'
      '   (PLNCODIGO, PERNUMERO, PEREXERCICIO, IDMODULO,'
      '    PLNDATDIA, PLNPLANIL, PLNNUMLAN, PLNTOTDEB,'
      '    PLNTOTCRE, PLNTOTDEBOFICIAL, PLNTOTCREOFICIAL,'
      '    PLNTOTDEBGER, PLNTOTCREGER, PLNTOTDEBGEREN1,'
      '    PLNTOTCREGEREN1, PLNTOTDEBGEREN2, PLNTOTCREGEREN2,'
      '    PLNEFETIVADO, IDUSUARIOINCLUSAO, TIPCODIGO,'
      '    PLNEMUSO, IDPESSOA, PLNTOTDEBHIST, PLNTOTCREHIST)'
      'VALUES                                                     '
      '   (:PLNCODIGO, :PERNUMERO, :PEREXERCICIO, :IDMODULO,      '
      '    :PLNDATDIA, :PLNPLANIL, :PLNNUMLAN, :PLNTOTDEB,        '
      '    :PLNTOTCRE, :PLNTOTDEBOFICIAL, :PLNTOTCREOFICIAL,      '
      '    :PLNTOTDEBGER, :PLNTOTCREGER, :PLNTOTDEBGEREN1,        '
      '    :PLNTOTCREGEREN1, :PLNTOTDEBGEREN2, :PLNTOTCREGEREN2,  '
      '    :PLNEFETIVADO, :IDUSUARIOINCLUSAO, :TIPCODIGO,         '
      '    :PLNEMUSO, :IDPESSOA, :PLNTOTDEBHIST, :PLNTOTCREHIST)  '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PLNDATDIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNPLANIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNNUMLAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLNEFETIVADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNEMUSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREHIST'
        ParamType = ptUnknown
      end>
  end
  object qryProxLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                        '
      '   MAX(LACNUMLAN) AS IDNUMLAN '
      'FROM                          '
      '   LANCAMENTO                 '
      'WHERE                         '
      '   (PLNCODIGO=:PLNCODIGO)     ')
    ValidateWithMask = True
    Left = 245
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryProxLancIDNUMLAN: TFloatField
      FieldName = 'IDNUMLAN'
      Origin = 'LANCAMENTO.LACNUMLAN'
    end
  end
  object qryLancIns: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCAMENTO'
      
        '   (PLNCODIGO, LACNUMLAN, LACDEBCRE, IDEMPRESA,                 ' +
        '               '
      
        '    CODSUBCONTA, IDPESSOA, IDMODULO, UNIDNEGOC, IDUSUARIOINCLUSA' +
        'O,             '
      
        '    CODCENTROCUSTO, PLACONTA, PLANO, LACTIPO, LACNUMDOC, LACHIST' +
        '1,             '
      
        '    LACHIST2, LACHIST3, LACHIST4, LACHIST5, LACVALOR, LACTIPCONV' +
        'OFICIAL,       '
      
        '    LACVALOFICIAL, LACTIPCONVGER, LACVALGERENCIAL, LACTIPCONVGER' +
        'EN1,           '
      
        '    LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA,' +
        '               '
      
        '    LACORIGEMAPLIC, TIPCODIGO, LACVALHIST, HITCODHIST, IDELEMDEM' +
        'ONSTRAT,IDPLANOPREV,IDPATRO)'
      
        'VALUES                                                          ' +
        '               '
      
        '   (:PLNCODIGO, :LACNUMLAN, :LACDEBCRE, :IDEMPRESA,             ' +
        '               '
      
        '    :CODSUBCONTA, :IDPESSOA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOIN' +
        'CLUSAO,        '
      
        '    :CODCENTROCUSTO, :PLACONTA, :PLANO, :LACTIPO, :LACNUMDOC, :L' +
        'ACHIST1,       '
      
        '    :LACHIST2, :LACHIST3, :LACHIST4, :LACHIST5, :LACVALOR, :LACT' +
        'IPCONVOFICIAL, '
      
        '    :LACVALOFICIAL, :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCON' +
        'VGEREN1,       '
      
        '    :LACVALGEREN1, :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMO' +
        'EDA,           '
      
        '    :LACORIGEMAPLIC, :TIPCODIGO, :LACVALHIST, :HITCODHIST, :IDEL' +
        'EMDEMONSTRAT,:IDPLANOPREV,:IDPATRO)  '
      ' ')
    ValidateWithMask = True
    Left = 29
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LACNUMLAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACDEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACNUMDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACHIST1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACHIST2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACHIST3'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACHIST4'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACHIST5'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPCONVOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPCONVGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALGERENCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPCONVGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPCONVGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACATOUTMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LACORIGEMAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HITCODHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDELEMDEMONSTRAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
  end
  object qryLancUpd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE LANCAMENTO SET                                     '
      '   LACVALOR        = (LACVALOR + :LACVALOR),              '
      '   LACVALOFICIAL   = (LACVALOFICIAL + :LACVALOFICIAL),    '
      '   LACVALGERENCIAL = (LACVALGERENCIAL + :LACVALGERENCIAL),'
      '   LACVALGEREN1    = (LACVALGEREN1 + :LACVALGEREN1),      '
      '   LACVALGEREN2    = (LACVALGEREN2 + :LACVALGEREN2),      '
      '   LACVALHIST      = (LACVALHIST   + :LACVALHIST )        '
      'WHERE                                                     '
      '   (LACNUMLAN =:LACNUMLAN) AND                            '
      '   (PLNCODIGO =:PLNCODIGO) AND                            '
      '   (LACDEBCRE =:LACDEBCRE)                                ')
    ValidateWithMask = True
    Left = 100
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'LACVALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALGERENCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LACVALHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LACNUMLAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACDEBCRE'
        ParamType = ptUnknown
      end>
  end
  object qryPlanilUpd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PLANILHA SET                                          '
      
        '   PLNNUMLAN        = (PLNNUMLAN + :PLNNUMLAN),                 ' +
        '      '
      '   PLNTOTCRE        = (PLNTOTCRE + :PLNTOTCRE),              '
      '   PLNTOTCREOFICIAL = (PLNTOTCREOFICIAL + :PLNTOTCREOFICIAL),'
      '   PLNTOTCREGER     = (PLNTOTCREGER + :PLNTOTCREGER),        '
      '   PLNTOTCREGEREN1  = (PLNTOTCREGEREN1 + :PLNTOTCREGEREN1),  '
      '   PLNTOTCREGEREN2  = (PLNTOTCREGEREN2 + :PLNTOTCREGEREN2),  '
      '   PLNTOTCREHIST    = (PLNTOTCREHIST + :PLNTOTCREHIST),      '
      '   PLNTOTDEB        = (PLNTOTDEB + :PLNTOTDEB),              '
      '   PLNTOTDEBOFICIAL = (PLNTOTDEBOFICIAL + :PLNTOTDEBOFICIAL),'
      '   PLNTOTDEBGER     = (PLNTOTDEBGER + :PLNTOTDEBGER),        '
      '   PLNTOTDEBGEREN1  = (PLNTOTDEBGEREN1 + :PLNTOTDEBGEREN1),  '
      '   PLNTOTDEBGEREN2  = (PLNTOTDEBGEREN2 + :PLNTOTDEBGEREN2),  '
      '   PLNTOTDEBHIST    = (PLNTOTDEBHIST + :PLNTOTDEBHIST)       '
      'WHERE                                                        '
      '   PLNCODIGO =:PLNCODIGO                                     ')
    ValidateWithMask = True
    Left = 176
    Top = 149
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PLNNUMLAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTCREHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNTOTDEBHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PERIODO SET                    '
      '   PERATUALI =:PERATUALI              '
      'WHERE                                 '
      '   (PERNUMERO =:PERNUMERO) AND        '
      '   (PEREXERCICIO =:PEREXERCICIO) AND  '
      '   (IDPESSOA =:IDPESSOA)              ')
    ValidateWithMask = True
    Left = 245
    Top = 152
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PERATUALI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTestaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                 '
      '   PLACCUST, PLATIPO, PLAINATIVA,      '
      '   PLAALTERA, PLABLOQUE, PLABLOQUEDATA,'
      '   PLASUBCONTA, PLAMOEDAHISTORICA,     '
      '   PLATIPCONVGER, PLATIPCONVGEREN1,    '
      '   PLATIPCONVGEREN2, PLATIPCONVOFICIAL '
      'FROM                                   '
      '   PLANOCONTA                          '
      'WHERE                                  '
      '   (PLACONTA=:PLACONTA) AND     '
      '   (PLANO=:PLANO)                      ')
    ValidateWithMask = True
    Left = 29
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryTestaContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Size = 1
    end
    object qryTestaContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Size = 1
    end
    object qryTestaContaPLAINATIVA: TStringField
      FieldName = 'PLAINATIVA'
      Size = 1
    end
    object qryTestaContaPLAALTERA: TStringField
      FieldName = 'PLAALTERA'
      Size = 1
    end
    object qryTestaContaPLABLOQUE: TStringField
      FieldName = 'PLABLOQUE'
      Size = 1
    end
    object qryTestaContaPLABLOQUEDATA: TDateTimeField
      FieldName = 'PLABLOQUEDATA'
    end
    object qryTestaContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Size = 1
    end
    object qryTestaContaPLAMOEDAHISTORICA: TFloatField
      FieldName = 'PLAMOEDAHISTORICA'
    end
    object qryTestaContaPLATIPCONVGER: TStringField
      FieldName = 'PLATIPCONVGER'
      Size = 1
    end
    object qryTestaContaPLATIPCONVGEREN1: TStringField
      FieldName = 'PLATIPCONVGEREN1'
      Size = 1
    end
    object qryTestaContaPLATIPCONVGEREN2: TStringField
      FieldName = 'PLATIPCONVGEREN2'
      Size = 1
    end
    object qryTestaContaPLATIPCONVOFICIAL: TStringField
      FieldName = 'PLATIPCONVOFICIAL'
      Size = 1
    end
  end
  object qryVerifSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   IDPLANOSALDO                                 '
      'FROM                                            '
      '   PLANOSALDO                                   '
      'WHERE                                           '
      '   (PLACONTA =:PLACONTA)                    AND'
      '   (PLANO =:PLANO)                          AND'
      '   (PEREXERCICIO =:PEREXERCICIO)            AND'
      '   (PERNUMERO =:PERNUMERO)                  AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO =:CODCENTROCUSTO)        AND'
      '   (IDEMPRESA =:IDEMPRESA)                  AND '
      '   (CODSUBCONTA =:CODSUBCONTA)     AND'
      '   (IDPLANOPREV =:IDPLANOPREV) AND'
      '   (IDPATRO =:IDPATRO)'
      '             '
      ''
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
    object qryVerifSaldoIDPLANOSALDO: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qrySaldoUpd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PLANOSALDO SET'
      '   PLSCREDITOCOR      = (PLSCREDITOCOR + :PLSCREDITOCOR),'
      
        '   PLSCREDITOOFICIAL  = (PLSCREDITOOFICIAL + :PLSCREDITOOFICIAL)' +
        ','
      '   PLSCREDITOGER      = (PLSCREDITOGER + :PLSCREDITOGER),'
      '   PLSCREDITOGEREN1   = (PLSCREDITOGEREN1 + :PLSCREDITOGEREN1),'
      '   PLSCREDITOGEREN2   = (PLSCREDITOGEREN2 + :PLSCREDITOGEREN2),'
      '   PLSCREDITOHIST     = (PLSCREDITOHIST + :PLSCREDITOHIST),'
      
        '   PLSDEBITOCORRENTE  = (PLSDEBITOCORRENTE + :PLSDEBITOCORRENTE)' +
        ','
      '   PLSDEBITOOFICIAL   = (PLSDEBITOOFICIAL + :PLSDEBITOOFICIAL),'
      '   PLSDEBITOGER       = (PLSDEBITOGER + :PLSDEBITOGER),'
      '   PLSDEBITOGEREN1    = (PLSDEBITOGEREN1 + :PLSDEBITOGEREN1),'
      '   PLSDEBITOGEREN2    = (PLSDEBITOGEREN2 + :PLSDEBITOGEREN2),'
      '   PLSDEBITOHIST      = (PLSDEBITOHIST + :PLSDEBITOHIST)'
      'WHERE'
      '   IDPLANOSALDO =:IDPLANOSALDO'
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLSCREDITOCOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOCORRENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOSALDO'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoIns: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PLANOSALDO'
      '   (PLSCREDITOCOR, PLSCREDITOOFICIAL, PLSCREDITOGER,'
      '   PLSCREDITOGEREN1, PLSCREDITOGEREN2, PLSCREDITOHIST,'
      '   PLSDEBITOCORRENTE, PLSDEBITOOFICIAL, PLSDEBITOGER,'
      '   PLSDEBITOGEREN1, PLSDEBITOGEREN2, PLSDEBITOHIST,'
      '   CODCENTROCUSTO, IDEMPRESA, CODSUBCONTA, IDPLANOSALDO,'
      '   PLANO, PLACONTA, IDPESSOA, UNIDNEGOC, PLSTIPO,'
      
        '   IDUSUARIOINCLUSAO, PEREXERCICIO, PERNUMERO, IDPLANOPREV, IDPA' +
        'TRO )'
      'VALUES'
      '   (:PLSCREDITOCOR, :PLSCREDITOOFICIAL, :PLSCREDITOGER,'
      '   :PLSCREDITOGEREN1, :PLSCREDITOGEREN2, :PLSCREDITOHIST,'
      '   :PLSDEBITOCORRENTE, :PLSDEBITOOFICIAL, :PLSDEBITOGER,'
      '   :PLSDEBITOGEREN1, :PLSDEBITOGEREN2, :PLSDEBITOHIST,'
      '   :CODCENTROCUSTO, :IDEMPRESA, :CODSUBCONTA, :IDPLANOSALDO,'
      '   :PLANO, :PLACONTA, :IDPESSOA, :UNIDNEGOC, :PLSTIPO,'
      
        '   :IDUSUARIOINCLUSAO, :PEREXERCICIO, :PERNUMERO, :IDPLANOPREV, ' +
        ':IDPATRO)')
    ValidateWithMask = True
    Left = 245
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLSCREDITOCOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSCREDITOHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOCORRENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOOFICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOGEREN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOGEREN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLSDEBITOHIST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOSALDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLSTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
  end
  object qryTestaData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERDATINI,PERDATFIM'
      'FROM PERIODO WHERE (IDPESSOA =:IDPESSOA) AND '
      '(PEREXERCICIO =:PEREXERCICIO)            AND '
      '(PERNUMERO =:PERNUMERO)                  AND '
      '(PERBLOQUE = '#39'N'#39')')
    ValidateWithMask = True
    Left = 29
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end>
  end
  object qryTestaPer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERNUMERO, PEREXERCICIO, PERBLOQUE, PERBLOINT FROM'
      'PERIODO WHERE (:DATALANC BETWEEN PERDATINI AND PERDATFIM) AND'
      ' (IDPESSOA =:IDPESSOA)'
      ' AND (PERESPECIAL = '#39'N'#39') ')
    ValidateWithMask = True
    Left = 100
    Top = 152
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATALANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryTestaPerPERNUMERO: TFloatField
      FieldName = 'PERNUMERO'
      Origin = 'PERIODO.PERNUMERO'
    end
    object qryTestaPerPEREXERCICIO: TFloatField
      FieldName = 'PEREXERCICIO'
      Origin = 'PERIODO.PEREXERCICIO'
    end
    object qryTestaPerPERBLOQUE: TStringField
      FieldName = 'PERBLOQUE'
      Origin = 'PERIODO.PERBLOQUE'
      Size = 1
    end
    object qryTestaPerPERBLOINT: TStringField
      FieldName = 'PERBLOINT'
      Origin = 'PERIODO.PERBLOINT'
      Size = 1
    end
  end
  object qryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '                    '
      
        '    P.PLNCODIGO, P.IDMODULO, L.LACNUMLAN, L.LACDEBCRE, L.IDEMPRE' +
        'SA,                 '
      
        '    L.CODSUBCONTA, L.IDPESSOA, L.IDMODULO, L.UNIDNEGOC, L.IDUSUA' +
        'RIOINCLUSAO,        '
      
        '    L.CODCENTROCUSTO, L.PLACONTA, L.PLANO, L.LACTIPO, L.LACNUMDO' +
        'C, L.LACHIST1,      '
      
        '    L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5, L.LACVALOR, ' +
        'L.LACTIPCONVOFICIAL,'
      
        '    L.LACVALOFICIAL, L.LACTIPCONVGER, LACVALGERENCIAL, L.LACTIPC' +
        'ONVGEREN1,          '
      
        '    L.LACVALGEREN1, L.LACTIPCONVGEREN2, L.LACVALGEREN2, L.LACATO' +
        'UTMOEDA,            '
      
        '    L.LACORIGEMAPLIC, L.TIPCODIGO, L.LACVALHIST, L.HITCODHIST, L' +
        '.IDELEMDEMONSTRAT,'
      '    L.IDPLANOPREV, L.IDPATRO   '
      
        'FROM PLANILHA P, LANCAMENTO L                                   ' +
        '                    '
      
        'WHERE (P.PLNCODIGO =:PLNCODIGO) AND                             ' +
        '                    '
      
        '      (P.PLNCODIGO = L.PLNCODIGO)                               ' +
        '                    ')
    ValidateWithMask = True
    Left = 100
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryLancamentoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'PLANILHA.PLNCODIGO'
    end
    object qryLancamentoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'PLANILHA.IDMODULO'
    end
    object qryLancamentoLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Origin = 'LANCAMENTO.LACNUMLAN'
    end
    object qryLancamentoLACDEBCRE: TStringField
      FieldName = 'LACDEBCRE'
      Origin = 'LANCAMENTO.LACDEBCRE'
      Size = 1
    end
    object qryLancamentoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'LANCAMENTO.IDEMPRESA'
    end
    object qryLancamentoCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'LANCAMENTO.CODSUBCONTA'
    end
    object qryLancamentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LANCAMENTO.IDPESSOA'
    end
    object qryLancamentoIDMODULO_1: TFloatField
      FieldName = 'IDMODULO_1'
      Origin = 'LANCAMENTO.IDMODULO'
    end
    object qryLancamentoUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'LANCAMENTO.UNIDNEGOC'
    end
    object qryLancamentoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LANCAMENTO.IDUSUARIOINCLUSAO'
    end
    object qryLancamentoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCAMENTO.CODCENTROCUSTO'
      Size = 10
    end
    object qryLancamentoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'LANCAMENTO.PLACONTA'
      Size = 18
    end
    object qryLancamentoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'LANCAMENTO.PLANO'
    end
    object qryLancamentoLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Origin = 'LANCAMENTO.LACTIPO'
      Size = 1
    end
    object qryLancamentoLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Origin = 'LANCAMENTO.LACNUMDOC'
      Size = 15
    end
    object qryLancamentoLACHIST1: TStringField
      FieldName = 'LACHIST1'
      Origin = 'LANCAMENTO.LACHIST1'
      Size = 40
    end
    object qryLancamentoLACHIST2: TStringField
      FieldName = 'LACHIST2'
      Origin = 'LANCAMENTO.LACHIST2'
      Size = 40
    end
    object qryLancamentoLACHIST3: TStringField
      FieldName = 'LACHIST3'
      Origin = 'LANCAMENTO.LACHIST3'
      Size = 40
    end
    object qryLancamentoLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Origin = 'LANCAMENTO.LACHIST4'
      Size = 40
    end
    object qryLancamentoLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Origin = 'LANCAMENTO.LACHIST5'
      Size = 40
    end
    object qryLancamentoLACVALOR: TFloatField
      FieldName = 'LACVALOR'
      Origin = 'LANCAMENTO.LACVALOR'
    end
    object qryLancamentoLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Origin = 'LANCAMENTO.LACTIPCONVOFICIAL'
      Size = 1
    end
    object qryLancamentoLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Origin = 'LANCAMENTO.LACVALOFICIAL'
    end
    object qryLancamentoLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Origin = 'LANCAMENTO.LACTIPCONVGER'
      Size = 1
    end
    object qryLancamentoLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Origin = 'LANCAMENTO.LACVALGERENCIAL'
    end
    object qryLancamentoLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN1'
      Size = 1
    end
    object qryLancamentoLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Origin = 'LANCAMENTO.LACVALGEREN1'
    end
    object qryLancamentoLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN2'
      Size = 1
    end
    object qryLancamentoLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Origin = 'LANCAMENTO.LACVALGEREN2'
    end
    object qryLancamentoLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Origin = 'LANCAMENTO.LACATOUTMOEDA'
      Size = 1
    end
    object qryLancamentoLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Origin = 'LANCAMENTO.LACORIGEMAPLIC'
      Size = 1
    end
    object qryLancamentoTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'LANCAMENTO.TIPCODIGO'
      Size = 2
    end
    object qryLancamentoLACVALHIST: TFloatField
      FieldName = 'LACVALHIST'
      Origin = 'LANCAMENTO.LACVALHIST'
    end
    object qryLancamentoHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Origin = 'LANCAMENTO.HITCODHIST'
      Size = 4
    end
    object qryLancamentoIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Origin = 'LANCAMENTO.IDELEMDEMONSTRAT'
    end
    object qryLancamentoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'LANCAMENTO.IDPLANOPREV'
    end
    object qryLancamentoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'LANCAMENTO.IDPATRO'
    end
  end
  object qryEstornoUpd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PLANILHA SET PLNPLANESTORNO =:PLNPLANESTORNO'
      'WHERE  (PLNCODIGO =:PLNCODIGO) ')
    ValidateWithMask = True
    Left = 176
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNPLANESTORNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanilDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE PLANILHA WHERE (PLNCODIGO =:PLNCODIGO) ')
    ValidateWithMask = True
    Left = 29
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryLancDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE LANCAMENTO WHERE (PLNCODIGO =:PLNCODIGO)')
    ValidateWithMask = True
    Left = 245
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryUmLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '                    '
      
        '    P.PLNCODIGO, P.IDMODULO, L.LACNUMLAN, L.LACDEBCRE, L.IDEMPRE' +
        'SA,                 '
      
        '    L.CODSUBCONTA, L.IDPESSOA, L.IDMODULO, L.UNIDNEGOC, L.IDUSUA' +
        'RIOINCLUSAO,        '
      
        '    L.CODCENTROCUSTO, L.PLACONTA, L.PLANO, L.LACTIPO, L.LACNUMDO' +
        'C, L.LACHIST1,      '
      
        '    L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5, L.LACVALOR, ' +
        'L.LACTIPCONVOFICIAL,'
      
        '    L.LACVALOFICIAL, L.LACTIPCONVGER, LACVALGERENCIAL, L.LACTIPC' +
        'ONVGEREN1,          '
      
        '    L.LACVALGEREN1, L.LACTIPCONVGEREN2, L.LACVALGEREN2, L.LACATO' +
        'UTMOEDA,            '
      
        '    L.LACORIGEMAPLIC, L.TIPCODIGO, L.LACVALHIST, L.HITCODHIST, L' +
        '.IDELEMDEMONSTRAT,'
      '    L.IDPLANOPREV, L.IDPATRO'
      
        'FROM PLANILHA P, LANCAMENTO L                                   ' +
        '                    '
      'WHERE (P.PLNCODIGO =:PLNCODIGO) AND'
      '      (L.LACNUMLAN =:LACNUMLAN) AND'
      '      (P.PLNCODIGO = L.PLNCODIGO)')
    ValidateWithMask = True
    Left = 100
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LACNUMLAN'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'PLANILHA.PLNCODIGO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'PLANILHA.IDMODULO'
    end
    object FloatField3: TFloatField
      FieldName = 'LACNUMLAN'
      Origin = 'LANCAMENTO.LACNUMLAN'
    end
    object StringField1: TStringField
      FieldName = 'LACDEBCRE'
      Origin = 'LANCAMENTO.LACDEBCRE'
      Size = 1
    end
    object FloatField4: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'LANCAMENTO.IDEMPRESA'
    end
    object FloatField5: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'LANCAMENTO.CODSUBCONTA'
    end
    object FloatField6: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LANCAMENTO.IDPESSOA'
    end
    object FloatField7: TFloatField
      FieldName = 'IDMODULO_1'
      Origin = 'LANCAMENTO.IDMODULO'
    end
    object FloatField8: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'LANCAMENTO.UNIDNEGOC'
    end
    object FloatField9: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LANCAMENTO.IDUSUARIOINCLUSAO'
    end
    object StringField2: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCAMENTO.CODCENTROCUSTO'
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'PLACONTA'
      Origin = 'LANCAMENTO.PLACONTA'
      Size = 18
    end
    object FloatField10: TFloatField
      FieldName = 'PLANO'
      Origin = 'LANCAMENTO.PLANO'
    end
    object StringField4: TStringField
      FieldName = 'LACTIPO'
      Origin = 'LANCAMENTO.LACTIPO'
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'LACNUMDOC'
      Origin = 'LANCAMENTO.LACNUMDOC'
      Size = 15
    end
    object StringField6: TStringField
      FieldName = 'LACHIST1'
      Origin = 'LANCAMENTO.LACHIST1'
      Size = 40
    end
    object StringField7: TStringField
      FieldName = 'LACHIST2'
      Origin = 'LANCAMENTO.LACHIST2'
      Size = 40
    end
    object StringField8: TStringField
      FieldName = 'LACHIST3'
      Origin = 'LANCAMENTO.LACHIST3'
      Size = 40
    end
    object StringField9: TStringField
      FieldName = 'LACHIST4'
      Origin = 'LANCAMENTO.LACHIST4'
      Size = 40
    end
    object StringField10: TStringField
      FieldName = 'LACHIST5'
      Origin = 'LANCAMENTO.LACHIST5'
      Size = 40
    end
    object FloatField11: TFloatField
      FieldName = 'LACVALOR'
      Origin = 'LANCAMENTO.LACVALOR'
    end
    object StringField11: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Origin = 'LANCAMENTO.LACTIPCONVOFICIAL'
      Size = 1
    end
    object FloatField12: TFloatField
      FieldName = 'LACVALOFICIAL'
      Origin = 'LANCAMENTO.LACVALOFICIAL'
    end
    object StringField12: TStringField
      FieldName = 'LACTIPCONVGER'
      Origin = 'LANCAMENTO.LACTIPCONVGER'
      Size = 1
    end
    object FloatField13: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Origin = 'LANCAMENTO.LACVALGERENCIAL'
    end
    object StringField13: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN1'
      Size = 1
    end
    object FloatField14: TFloatField
      FieldName = 'LACVALGEREN1'
      Origin = 'LANCAMENTO.LACVALGEREN1'
    end
    object StringField14: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Origin = 'LANCAMENTO.LACTIPCONVGEREN2'
      Size = 1
    end
    object FloatField15: TFloatField
      FieldName = 'LACVALGEREN2'
      Origin = 'LANCAMENTO.LACVALGEREN2'
    end
    object StringField15: TStringField
      FieldName = 'LACATOUTMOEDA'
      Origin = 'LANCAMENTO.LACATOUTMOEDA'
      Size = 1
    end
    object StringField16: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Origin = 'LANCAMENTO.LACORIGEMAPLIC'
      Size = 1
    end
    object StringField17: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'LANCAMENTO.TIPCODIGO'
      Size = 2
    end
    object FloatField16: TFloatField
      FieldName = 'LACVALHIST'
      Origin = 'LANCAMENTO.LACVALHIST'
    end
    object StringField18: TStringField
      FieldName = 'HITCODHIST'
      Origin = 'LANCAMENTO.HITCODHIST'
      Size = 4
    end
    object FloatField17: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Origin = 'LANCAMENTO.IDELEMDEMONSTRAT'
    end
    object qryUmLancamentoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'LANCAMENTO.IDPLANOPREV'
    end
    object qryUmLancamentoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'LANCAMENTO.IDPATRO'
    end
  end
  object qryUmLancDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE LANCAMENTO WHERE'
      '   (PLNCODIGO =:PLNCODIGO) AND'
      '   (LACNUMLAN =:LACNUMLAN)     ')
    ValidateWithMask = True
    Left = 100
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LACNUMLAN'
        ParamType = ptUnknown
      end>
  end
  object qryVerifSaldoCCp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   IDPLANOSALDO                                 '
      'FROM                                            '
      '   PLANOSALDO                                   '
      'WHERE                                           '
      '   (PLACONTA =:PLACONTA)             AND '
      '   (PLANO =:PLANO)                          AND '
      '   (PEREXERCICIO =:PEREXERCICIO)            AND '
      '   (PERNUMERO =:PERNUMERO)                  AND '
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND '
      '   (IDPESSOA  =:IDPESSOA)                   AND '
      '   (CODCENTROCUSTO =:CODCENTROCUSTO) AND'
      '   (IDEMPRESA =:IDEMPRESA)                  AND '
      '   (CODSUBCONTA IS NULL)                  AND'
      '   (IDPLANOPREV IS NULL) AND'
      '   (IDPATRO IS NULL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 100
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object FloatField18: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryVerifSaldoSCp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOSALDO'
      'FROM'
      '   PLANOSALDO'
      'WHERE'
      '   (PLACONTA =:PLACONTA)             AND'
      '   (PLANO =:PLANO)                          AND'
      '   (PEREXERCICIO =:PEREXERCICIO)            AND'
      '   (PERNUMERO =:PERNUMERO)                  AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO IS NULL)          AND'
      '   (IDEMPRESA IS NULL)                      AND'
      '   (CODSUBCONTA =:CODSUBCONTA) AND'
      '   (IDPLANOPREV IS NULL) AND'
      '   (IDPATRO IS NULL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end>
    object FloatField19: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryVerifSaldoNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   IDPLANOSALDO                                 '
      'FROM                                            '
      '   PLANOSALDO                                   '
      'WHERE                                           '
      '   (PLACONTA =:PLACONTA)             AND '
      '   (PLANO =:PLANO)                          AND'
      '   (PEREXERCICIO =:PEREXERCICIO)            AND'
      '   (PERNUMERO =:PERNUMERO)                  AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO IS NULL)          AND'
      '   (IDEMPRESA IS NULL)                      AND'
      '   (CODSUBCONTA IS NULL) AND'
      '   (IDPLANOPREV IS NULL) AND'
      '   (IDPATRO IS NULL)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 245
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object FloatField20: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryNumLancSC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   PLNCODIGO, LACNUMLAN                         '
      'FROM                                            '
      '   LANCAMENTO                                   '
      'WHERE                                           '
      '   (PLNCODIGO =:PLNCODIGO)                  AND '
      '   (PLACONTA =:PLACONTA)                    AND'
      '   (PLANO =:PLANO)                          AND'
      '   (IDMODULO =:IDMODULO)                    AND'
      '   (LACDEBCRE =:LACDEBCRE)                  AND'
      '   (LACTIPO =:LACTIPO)                      AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO =:CODCENTROCUSTO)        AND '
      '   (CODSUBCONTA IS NULL)                  ')
    ValidateWithMask = True
    Left = 100
    Top = 341
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACDEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end>
    object FloatField21: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object FloatField22: TFloatField
      FieldName = 'LACNUMLAN'
    end
  end
  object qryNumLancCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   PLNCODIGO, LACNUMLAN                         '
      'FROM                                            '
      '   LANCAMENTO                                   '
      'WHERE                                           '
      '   (PLNCODIGO =:PLNCODIGO)                  AND '
      '   (PLACONTA =:PLACONTA)                   AND'
      '   (PLANO =:PLANO)                          AND'
      '   (IDMODULO =:IDMODULO)                    AND'
      '   (LACDEBCRE =:LACDEBCRE)                  AND'
      '   (LACTIPO =:LACTIPO)                      AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO IS NULL)                 AND'
      '   (CODSUBCONTA =:CODSUBCONTA)')
    ValidateWithMask = True
    Left = 176
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACDEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end>
    object FloatField23: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object FloatField24: TFloatField
      FieldName = 'LACNUMLAN'
    end
  end
  object qryNumLancNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   PLNCODIGO, LACNUMLAN                         '
      'FROM                                            '
      '   LANCAMENTO                                   '
      'WHERE                                           '
      '   (PLNCODIGO =:PLNCODIGO)                  AND'
      '   (PLACONTA  =:PLACONTA)                   AND'
      '   (PLANO     =:PLANO)                      AND'
      '   (IDMODULO  =:IDMODULO)                   AND'
      '   (LACDEBCRE =:LACDEBCRE)                  AND'
      '   (LACTIPO   =:LACTIPO)                    AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO IS NULL)                 AND'
      '   (CODSUBCONTA IS NULL)')
    ValidateWithMask = True
    Left = 245
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACDEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LACTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object FloatField25: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object FloatField26: TFloatField
      FieldName = 'LACNUMLAN'
    end
  end
  object qryPlanoVigente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   PD.PLANO, PD.DATAINICIO, PD.DATAFIM, PD.PLANOANTERIOR, P.MASC' +
        'ARA'
      'FROM'
      '   PLANODATA PD, PLANO P'
      'WHERE'
      '   (:DATA BETWEEN PD.DATAINICIO AND PD.DATAFIM) AND'
      '   (PD.IDPESSOA=:IDPESSOA) AND'
      '   (PD.PLANO = P.PLANO)')
    ValidateWithMask = True
    Left = 176
    Top = 293
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPlanoVigentePLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANODATA.PLANO'
    end
    object qryPlanoVigenteDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'PLANODATA.DATAINICIO'
    end
    object qryPlanoVigenteDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'PLANODATA.DATAFIM'
    end
    object qryPlanoVigentePLANOANTERIOR: TFloatField
      FieldName = 'PLANOANTERIOR'
      Origin = 'PLANODATA.PLANOANTERIOR'
    end
    object qryPlanoVigenteMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
  end
  object qryPlanoAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLANOANTERIOR'
      'FROM '
      '   PLANODATA'
      'WHERE'
      '   (IDPESSOA=:IDPESSOA) AND'
      '   (PLANO=:PLANO)')
    ValidateWithMask = True
    Left = 245
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanoAnteriorPLANOANTERIOR: TFloatField
      FieldName = 'PLANOANTERIOR'
      Origin = 'PLANODATA.PLANOANTERIOR'
    end
  end
  object qryDePara: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CONTA2, CENTROCUSTO2'
      'FROM '
      '   PLANODEPARA')
    ValidateWithMask = True
    Left = 314
    Top = 56
    object qryDeParaCONTA2: TStringField
      FieldName = 'CONTA2'
      Origin = 'PLANODEPARA.CONTA2'
      Size = 18
    end
    object qryDeParaCENTROCUSTO2: TStringField
      FieldName = 'CENTROCUSTO2'
      Size = 10
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                   '
      '   MOEDESC               '
      'FROM                     '
      '   MOEDA                 '
      'WHERE                    '
      '   (MOECODIGO=:MOECODIGO)')
    ValidateWithMask = True
    Left = 242
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end>
    object qryMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
  end
  object QryDelRateioDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '  RATEIODOCUM'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO AND'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RTRIM(RECPAG) = :RECPAG')
    ValidateWithMask = True
    Left = 382
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
  end
  object qryPlanilRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.PANCONTAPERC,'
      '   D.PLANO, D.PANCONTABASE, D.PANCCUSTOBASE,'
      '   D.PLACONTA, D.CODCENTROCUSTO,'
      '   D.IDEMPRESA, D.IDPESSOA, D.PANPERC,'
      '   D.UNIDNEGOC, D.CODSUBCONTA, D.TIPCODIGO'
      'FROM'
      '   PREPLANILHA P, PREDETALHE D'
      'WHERE'
      '   (P.PANCODIGO=:PANCODIGO) AND'
      '   (P.PANCODIGO = D.PANCODIGO)'
      'ORDER BY'
      '   D.PANNUMLANC')
    ValidateWithMask = True
    Left = 314
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PANCODIGO'
        ParamType = ptUnknown
      end>
    object qryPlanilRateioPANCONTAPERC: TStringField
      FieldName = 'PANCONTAPERC'
      Origin = 'PREPLANILHA.PANCONTAPERC'
      Size = 1
    end
    object qryPlanilRateioPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PREDETALHE.PLANO'
    end
    object qryPlanilRateioPANCONTABASE: TStringField
      FieldName = 'PANCONTABASE'
      Origin = 'PREDETALHE.PANCONTABASE'
      Size = 18
    end
    object qryPlanilRateioPANCCUSTOBASE: TStringField
      FieldName = 'PANCCUSTOBASE'
      Origin = 'PREDETALHE.PANCCUSTOBASE'
      Size = 10
    end
    object qryPlanilRateioPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PREDETALHE.PLACONTA'
      Size = 18
    end
    object qryPlanilRateioCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'PREDETALHE.CODCENTROCUSTO'
      Size = 10
    end
    object qryPlanilRateioIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PREDETALHE.IDEMPRESA'
    end
    object qryPlanilRateioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PREDETALHE.IDPESSOA'
    end
    object qryPlanilRateioPANPERC: TFloatField
      FieldName = 'PANPERC'
      Origin = 'PREDETALHE.PANPERC'
    end
    object qryPlanilRateioCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'PREDETALHE.CODSUBCONTA'
    end
    object qryPlanilRateioTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'PREDETALHE.TIPCODIGO'
      Size = 2
    end
    object qryPlanilRateioUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PREDETALHE.UNIDNEGOC'
    end
  end
  object qrySaldoRateioCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA,'
      '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC,'
      
        '   DECODE(B.SALDORATEIO, 0, 0, SUM(DECODE(S.PLSDEBITOCORRENTE, N' +
        'ULL, 0, S.PLSDEBITOCORRENTE) -'
      
        '       DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))/B.SALD' +
        'ORATEIO) AS PERCRATEIO'
      'FROM'
      '   PLANOSALDO S,'
      '   (SELECT'
      
        '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)' +
        ' -'
      
        '           DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SAL' +
        'DORATEIO'
      '    FROM'
      '       PLANOSALDO'
      '    WHERE'
      '       (PLANO=:PLANO) AND'
      '       (PLACONTA=:PLACONTA) AND'
      '       (CODCENTROCUSTO=:CODCENTROCUSTO) AND'
      '       (IDEMPRESA=:IDEMPRESA) AND'
      '       (PEREXERCICIO=:PEREXERCICIO) AND'
      '       (PERNUMERO=:PERNUMERO) AND'
      '       (IDPESSOA=:IDPESSOA)) B'
      ''
      'WHERE'
      '   (S.PLANO=:PLANO) AND'
      '   (S.PLACONTA=:PLACONTA) AND'
      '   (S.CODCENTROCUSTO=:CODCENTROCUSTO) AND'
      '   (S.IDEMPRESA=:IDEMPRESA) AND'
      '   (S.PEREXERCICIO=:PEREXERCICIO) AND'
      '   (S.PERNUMERO=:PERNUMERO) AND'
      '   (S.IDPESSOA=:IDPESSOA)'
      'GROUP BY'
      '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA,'
      '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, B.SALDORATEIO'
      ' ')
    ValidateWithMask = True
    Left = 390
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySaldoRateioCCustoPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qrySaldoRateioCCustoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qrySaldoRateioCCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qrySaldoRateioCCustoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qrySaldoRateioCCustoCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qrySaldoRateioCCustoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySaldoRateioCCustoUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qrySaldoRateioCCustoPERCRATEIO: TFloatField
      FieldName = 'PERCRATEIO'
    end
  end
  object qrySaldoRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA,'
      '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC,'
      
        '   DECODE(B.SALDORATEIO, 0, 0, SUM(DECODE(S.PLSDEBITOCORRENTE, N' +
        'ULL, 0, S.PLSDEBITOCORRENTE) -'
      
        '       DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))/B.SALD' +
        'ORATEIO) AS PERCRATEIO'
      'FROM'
      '   PLANOSALDO S,'
      '   (SELECT'
      
        '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)' +
        ' -'
      
        '           DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SAL' +
        'DORATEIO'
      '    FROM'
      '       PLANOSALDO'
      '    WHERE'
      '       (PLANO=:PLANO) AND'
      '       (PLACONTA=:PLACONTA) AND'
      '       (PEREXERCICIO=:PEREXERCICIO) AND'
      '       (PERNUMERO=:PERNUMERO) AND'
      '       (IDPESSOA=:IDPESSOA)) B'
      'WHERE'
      '   (S.PLANO=:PLANO) AND'
      '   (S.PLACONTA=:PLACONTA) AND'
      '   (S.PEREXERCICIO=:PEREXERCICIO) AND'
      '   (S.PERNUMERO=:PERNUMERO) AND'
      '   (S.IDPESSOA=:IDPESSOA)'
      'GROUP BY'
      '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA,'
      '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, B.SALDORATEIO'
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySaldoRateioPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qrySaldoRateioPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qrySaldoRateioCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qrySaldoRateioIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qrySaldoRateioCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qrySaldoRateioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySaldoRateioUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qrySaldoRateioPERCRATEIO: TFloatField
      FieldName = 'PERCRATEIO'
    end
  end
  object QryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PF.IDFORCLI,'
      '  DC.CONTACCLIENTE AS CONTACONTABIL,'
      '  DC.CODCENTROCUSTO,'
      '  DC.CODSUBCONTA,'
      '  DC.UNIDNEGOC'
      'FROM'
      '  PORTADORFORMA PF, EMPRESACLIENTE DC'
      'WHERE'
      '  PF.CODPORTFORMA = :CODPORTFORMA AND'
      '  DC.IDPESSOA = :IDPESSOA AND'
      '  PF.IDFORCLI = DC.IDFORCLI')
    ValidateWithMask = True
    Left = 314
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryPortFormaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = '"CM.EMPRESACLIENTE".IDFORCLI'
    end
    object QryPortFormaCONTACONTABIL: TStringField
      FieldName = 'CONTACONTABIL'
      Origin = 'EMPRESACLIENTE.CONTACCLIENTE'
      Size = 18
    end
    object QryPortFormaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'EMPRESACLIENTE.CODCENTROCUSTO'
      Size = 10
    end
    object QryPortFormaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESACLIENTE.CODSUBCONTA'
    end
    object QryPortFormaUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'EMPRESACLIENTE.UNIDNEGOC'
    end
  end
  object QryParGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  MASCARANUMAGENCIA, FLGCRIAAGENCIA'
      'FROM'
      ' PARAMGLOBAL'
      'WHERE'
      ' IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 314
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    object QryParGlobalMASCARANUMAGENCIA: TStringField
      FieldName = 'MASCARANUMAGENCIA'
      Origin = 'PARAMGLOBAL.MASCARANUMAGENCIA'
      Size = 10
    end
    object QryParGlobalFLGCRIAAGENCIA: TStringField
      FieldName = 'FLGCRIAAGENCIA'
      Origin = 'PARAMGLOBAL.FLGCRIAAGENCIA'
      Size = 1
    end
  end
  object qryVerifSaldoSCpCCp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   IDPLANOSALDO                                 '
      'FROM                                            '
      '   PLANOSALDO                                   '
      'WHERE                                           '
      '   (PLACONTA =:PLACONTA)             AND '
      '   (PLANO =:PLANO)                          AND '
      '   (PEREXERCICIO =:PEREXERCICIO)            AND '
      '   (PERNUMERO =:PERNUMERO)                  AND '
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND '
      '   (IDPESSOA  =:IDPESSOA)                   AND '
      '   (CODCENTROCUSTO =:CODCENTROCUSTO) AND'
      '   (IDEMPRESA =:IDEMPRESA)                  AND '
      '   (CODSUBCONTA =:CODSUBCONTA)   AND              '
      '   (IDPLANOPREV IS NULL) AND'
      '   (IDPATRO IS NULL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end>
    object FloatField27: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryVerifSaldoCCpPVp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   IDPLANOSALDO                                 '
      'FROM                                            '
      '   PLANOSALDO                                   '
      'WHERE                                           '
      '   (PLACONTA =:PLACONTA)                    AND'
      '   (PLANO =:PLANO)                          AND'
      '   (PEREXERCICIO =:PEREXERCICIO)            AND'
      '   (PERNUMERO =:PERNUMERO)                  AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO =:CODCENTROCUSTO)        AND'
      '   (IDEMPRESA =:IDEMPRESA)                  AND '
      '   (CODSUBCONTA IS NULL)  AND                  '
      '   (IDPLANOPREV =:IDPLANOPREV) AND'
      '   (IDPATRO =:IDPATRO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
    object FloatField28: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryVerifSaldoSCpPVp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOSALDO'
      'FROM'
      '   PLANOSALDO'
      'WHERE'
      '   (PLACONTA =:PLACONTA)             AND'
      '   (PLANO =:PLANO)                          AND'
      '   (PEREXERCICIO =:PEREXERCICIO)            AND'
      '   (PERNUMERO =:PERNUMERO)                  AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO IS NULL)          AND'
      '   (IDEMPRESA IS NULL)                      AND'
      '   (CODSUBCONTA =:CODSUBCONTA) AND                  '
      '   (IDPLANOPREV =:IDPLANOPREV) AND'
      '   (IDPATRO =:IDPATRO)'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 382
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
    object FloatField29: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryVerifSaldoPVp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                                          '
      '   IDPLANOSALDO                                 '
      'FROM                                            '
      '   PLANOSALDO                                   '
      'WHERE                                           '
      '   (PLACONTA =:PLACONTA)                    AND '
      '   (PLANO =:PLANO)                          AND'
      '   (PEREXERCICIO =:PEREXERCICIO)            AND'
      '   (PERNUMERO =:PERNUMERO)                  AND'
      '   (UNIDNEGOC =:UNIDNEGOC)                  AND'
      '   (IDPESSOA  =:IDPESSOA)                   AND'
      '   (CODCENTROCUSTO IS NULL)                 AND'
      '   (IDEMPRESA IS NULL)                      AND'
      '   (CODSUBCONTA IS NULL) AND                  '
      '   (IDPLANOPREV =:IDPLANOPREV) AND'
      '   (IDPATRO =:IDPATRO)'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEREXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
    object FloatField30: TFloatField
      FieldName = 'IDPLANOSALDO'
    end
  end
  object qryTestaCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.CODCENTROCUSTO'
      'FROM'
      '   CENTCUST C,'
      '   CONTASXCC CC'
      'WHERE'
      '   (CC.CODCENTROCUSTO = :CODCENTROCUSTO) AND'
      '   (CC.IDEMPRESA = :IDEMPRESA) AND'
      '   (CC.PLACONTA  = :PLACONTA) AND'
      '   (CC.PLANO     = :PLANO) AND'
      '   ((C.ATIVO = '#39'S'#39') OR (C.ATIVO IS NULL)) AND '
      '   (CC.CODCENTROCUSTO = C.CODCENTROCUSTO) AND'
      '   (CC.IDEMPRESA = C.IDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 314
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryTestaCCCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.CENTCUST".CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryTravaParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMCONTAB FOR UPDATE')
    ValidateWithMask = True
    Left = 406
    Top = 168
  end
end
