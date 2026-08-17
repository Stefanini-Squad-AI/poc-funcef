object DtmRAD: TDtmRAD
  OldCreateOrder = True
  OnCreate = DtmRADCreate
  OnDestroy = DtmRADDestroy
  Left = 90
  Top = 101
  Height = 479
  Width = 741
  object qryExecProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RADINSTPROCESSO'
      '      (IDPROCESSO,'
      '       IDTIPOPROCESSO,'
      '       FLGOK,'
      '       DATAINIPROCESSO,'
      '       CODCENTROCUSTO,'
      '       IDEMPRESA,'
      '       UNIDNEGOC,'
      '       IDPESSOA,'
      '       CODGRUPOPROD,'
      '       CODCENTRORESPON,'
      '       VLRPROC,'
      '       DATAFIMPREV,'
      '       IDUSUARIO,'
      '       IDPESSRESP,'
      '       OBS,'
      '       CODTIPDOC )'
      'VALUES'
      '       (:pIDPROCESSO,'
      '        :pIDTIPOPROCESSO,'
      '        :pFLGOK,'
      '        :pDATAINIPROCESSO,'
      '        :pCODCENTROCUSTO,'
      '        :pIDEMPRESA,'
      '        :pUNIDNEGOC,'
      '        :pIDPESSOA,'
      '        :pCODGRUPOPROD,'
      '        :pCODCENTRORESPON,'
      '        :pVLRPROCESSO,'
      '        :pDATAFIMPREV,'
      '        :pIDUSUARIO,'
      '        :pIDPESSRESP,        '
      '        :POBS,'
      '        :PCODTIPDOC)')
    ValidateWithMask = True
    Left = 24
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTIPOPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGOK'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATAINIPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pUNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODGRUPOPROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVLRPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATAFIMPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPESSRESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCODTIPDOC'
        ParamType = ptUnknown
      end>
  end
  object qryEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPOETAPA'
      'FROM'
      '      RADTIPOETAPAXPROC'
      'WHERE'
      '      (FLGINICIAL = '#39'S'#39')'
      '  AND (IDTIPOPROCESSO = :pIDPROC)'
      '            ')
    ValidateWithMask = True
    Left = 88
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryEtapaIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOETAPA'
    end
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      FLGOK'
      'FROM'
      '      RADINSTPROCESSO'
      'WHERE'
      '     (IDPROCESSO = :pIDPROC)')
    ValidateWithMask = True
    Left = 144
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryProcFLGOK: TStringField
      FieldName = 'FLGOK'
      Origin = 'RADINSTPROCESSO.FLGOK'
      Size = 1
    end
  end
  object qryExecEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RADINSTETAPA'
      '      (IDPROCESSO,'
      '       IDETAPA,'
      '       IDTIPOETAPA,'
      '       DATAINIETAPA,'
      '       IDETAPAANT,'
      '   DATAFIMPREV)'
      'VALUES'
      '      (:pIDPROCESSO,'
      '       :pIDETAPA,'
      '       :pIDTIPOETAPA,'
      '       :pDATAINIETAPA,'
      '       :pIDETAPAANT,'
      '  :pDATAFIMPREV)')
    ValidateWithMask = True
    Left = 24
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDETAPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTIPOETAPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pDATAINIETAPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDETAPAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATAFIMPREV'
        ParamType = ptUnknown
      end>
  end
  object qryNdiaProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '              NUMDIASPREVISTO '
      'FROM '
      '     RADTIPOPROCESSO'
      'WHERE '
      '     (IDTIPOPROCESSO = :pIDPROC)')
    ValidateWithMask = True
    Left = 216
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryNdiaProcNUMDIASPREVISTO: TFloatField
      FieldName = 'NUMDIASPREVISTO'
    end
  end
  object qryNdiaEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '              NUMDIASPREVISTO '
      'FROM '
      '     RADTIPOETAPAXPROC'
      'WHERE '
      '           (IDTIPOPROCESSO = :pIDPROC)'
      '  AND (IDTIPOETAPA = :pIDETAPA)')
    ValidateWithMask = True
    Left = 288
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDETAPA'
        ParamType = ptUnknown
      end>
    object qryNdiaEtapaNUMDIASPREVISTO: TFloatField
      FieldName = 'NUMDIASPREVISTO'
    end
  end
  object qryEmpresaProp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ES.IDESTADO, ES.CODESTADO, E.IDCIDADES, ES.IDPAIS'
      'FROM PESSOA P,'
      '     ENDPESS E,'
      '     CIDADES C,'
      '     ESTADO  ES'
      'WHERE (P.IDPESSOA = :pIDPESSOA) AND'
      '      (E.IDPESSOA = P.IDPESSOA) AND'
      '      (E.IDENDERECO = P.IDENDCOMERCIAL) AND'
      '      (E.IDCIDADES = C.IDCIDADES) AND'
      '      (ES.IDESTADO = C.IDESTADO)'
      '')
    ValidateWithMask = True
    Left = 112
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryInfoProcPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      COUNT(*) AS NUMERO'
      'FROM'
      '    PESSOA P,'
      '    RADINSTPROCESSO IP,'
      '    RADINSTETAPA IE,'
      '    RADTIPOPROCESSO TP,'
      '    RADTIPOETAPA   TE,'
      '    RADTIPOETAPAXPROC TEP,'
      '    MODULO M,'
      '    USUARIOSISTEMA U,'
      '    (SELECT  DISTINCT'
      '             EXA.IDTIPOPROCESSO,'
      '             EXA.IDTIPOETAPA'
      '     FROM'
      '           RADETAPAXGRPRESP EXA,'
      '           RADGRUPOAUTORIZA A,'
      '           RADGRPRESPON G,'
      '           RADGRAUTXGRRESPON AXG,'
      '           RADRESPONXGRP RXP'
      '    WHERE'
      '          (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)'
      '      AND (G.IDGRPRESPON       = AXG.IDGRPRESPON)'
      '      AND (AXG.IDGRUPOAUTORIZA = EXA.IDGRUPOAUTORIZA)'
      '      AND (G.IDGRPRESPON       = RXP.IDGRPRESPON)'
      '      AND (RXP.IDUSUARIO = :pIDUSUARIO) ) USU'
      'WHERE'
      '      (IP.FLGOK = '#39'N'#39')'
      '  AND (IE.DATAFIMETAPA IS NULL)'
      '  AND (USU.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)'
      '  AND (USU.IDTIPOETAPA = TE.IDTIPOETAPA)'
      '  AND (IP.IDPROCESSO = IE.IDPROCESSO)'
      '  AND (IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)'
      '  AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)'
      '  AND (TEP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)'
      '  AND (TEP.IDTIPOETAPA = TE.IDTIPOETAPA)'
      '  AND (TEP.IDMODULO = M.IDMODULO)'
      '  AND (IP.IDUSUARIO = U.IDUSUARIO(+))'
      '  AND (IP.IDPESSRESP = P.IDPESSOA(+))'
      'ORDER BY IP.IDPROCESSO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 217
    Top = 93
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANO'
      'WHERE 1 = 2')
    ValidateWithMask = True
    Left = 24
    Top = 176
  end
end
