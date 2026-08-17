object dtmFuncoesInvest: TdtmFuncoesInvest
  OldCreateOrder = True
  Left = 108
  Top = 112
  Height = 479
  Width = 741
  object QryPadraoIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   TB.ALIQUOTA'
      'FROM'
      '   TABELAIR TB,'
      '   ('
      '    SELECT                              '
      '       MAX(TB1.DTREF) AS DATA'
      '    FROM     '
      '       TABELAIR TB1'
      '    WHERE   '
      '      (TB1.IDTIPOINVEST = :IDTIPOINVEST) AND'
      '      (TB1.DTREF<=TO_DATE(:DTREF,'#39'DD/MM/YYYY'#39')) '
      '   ) X'
      'WHERE'
      '  (IDTIPOINVEST = :IDTIPOINVEST) AND'
      '  (TB.DTREF = X.DATA)')
    ValidateWithMask = True
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryPadraoIRALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'TABELAIR.ALIQUOTA'
    end
  end
  object QryPadraoIROPE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '   TIR.ALIQUOTA                     '
      'FROM     '
      '   TABELAIR TIR                   '
      'WHERE   '
      '  (IDTIPOOPERACAO=:IDTIPOOPERACAO)               AND'
      '  (DTREF<=:DTREF)  ')
    ValidateWithMask = True
    Left = 40
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTREF'
        ParamType = ptUnknown
      end>
    object QryPadraoIROPEALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'TABELAIR.ALIQUOTA'
    end
  end
  object QryPadraoIRMer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '   TIR.ALIQUOTA                     '
      'FROM     '
      '   TABELAIR TIR                   '
      'WHERE   '
      '  (IDTIPOINVEST=:IDTIPOINVEST)               AND'
      '  (IDMERCADO=:IDMERCADO)                      AND'
      '  (DTREF<=:DTREF)              '
      '  ')
    ValidateWithMask = True
    Left = 40
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTREF'
        ParamType = ptUnknown
      end>
    object QryPadraoIRMerALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'TABELAIR.ALIQUOTA'
    end
  end
  object QryIOF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '      PRAZO, PERCENTUAL       '
      'FROM                               '
      '      TABELAIOF'
      'WHERE                             '
      '    PRAZO = :PRAZO')
    ValidateWithMask = True
    Left = 136
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PRAZO'
        ParamType = ptUnknown
      end>
  end
  object QryProvIRRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '   AC.FLGPROVISIONAIR'
      'FROM     '
      '   ACAO AC                   '
      'WHERE   '
      '  (IDACAO=:IDACAO)')
    ValidateWithMask = True
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptUnknown
      end>
    object QryProvIRRVFLGPROVISIONAIR: TStringField
      FieldName = 'FLGPROVISIONAIR'
      Origin = 'ACAO.FLGPROVISIONAIR'
      Size = 1
    end
  end
  object QryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT            '
      '   PA.MOECODIGO,                  '
      '   PA.FLGPROVISIONAIRRF,'
      '   PA.FLGPROVISIONAIRRV,'
      '   PA.MOEDAATULIT'
      'FROM     '
      '   PARAMINVEST PA')
    ValidateWithMask = True
    Left = 240
    Top = 128
    object QryParamInvestFLGPROVISIONAIRRF: TStringField
      FieldName = 'FLGPROVISIONAIRRF'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRF'
      Size = 1
    end
    object QryParamInvestFLGPROVISIONAIRRV: TStringField
      FieldName = 'FLGPROVISIONAIRRV'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRV'
      Size = 1
    end
    object QryParamInvestMOEDAATULIT: TFloatField
      FieldName = 'MOEDAATULIT'
      Origin = 'PARAMINVEST.MOEDAATULIT'
    end
    object QryParamInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = '"PARAMINVEST".MOECODIGO'
    end
  end
  object QryProvIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT                              '
      '   TP.FLGPROVISIONAIR'
      'FROM     '
      '   TIPOTITRENFIXA TP, TITRENFIXA TT                   '
      'WHERE   '
      '  (IDTITRENFIXA=:IDTITRENFIXA) AND'
      '  (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA)')
    ValidateWithMask = True
    Left = 240
    Top = 70
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITRENFIXA'
        ParamType = ptUnknown
      end>
    object QryProvIRRFFLGPROVISIONAIR: TStringField
      FieldName = 'FLGPROVISIONAIR'
      Size = 1
    end
  end
  object QryDeleteSaldoLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM SaldoIRLitigio WHERE IDIRLitigio'
      '   IN (SELECT IDIRLITIGIO FROM IRLitigio '
      '       WHERE IDOPERACAOINVEST = :IDOPERACAOINVEST)'
      '')
    ValidateWithMask = True
    Left = 240
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryDeleteLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM IRLITIGIO  '
      '   WHERE IDOPERACAOINVEST=:IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 136
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QrySelectIRLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     VLRIRLITIGIO,'
      '     PLANO'
      'FROM'
      '     IRLITIGIO'
      'WHERE'
      '     (DATAFATOGERADOR < :dDataRef) AND'
      '     (IDORIGEMIRLITIGIO = :pIDORIGEMIRLITIGIO) AND'
      '     (PLANO = :pPLANO) AND'
      '     (IDPLANOPREV = :pIDPLANOPREV) AND'
      '     (IDPATROCINADORA = :pIDPATROCINADORA)')
    ValidateWithMask = True
    Left = 40
    Top = 248
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPATROCINADORA'
        ParamType = ptUnknown
      end>
    object QrySelectIRLitigioVLRIRLITIGIO: TFloatField
      FieldName = 'VLRIRLITIGIO'
      Origin = 'IRLITIGIO.VLRIRLITIGIO'
    end
    object QrySelectIRLitigioPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'IRLITIGIO.PLANO'
    end
  end
  object QrySaldoLitigio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'PLNCODIGO,'
      'PLANO'
      'FROM'
      '   SALDOIRLITIGIO'
      'WHERE'
      '   DATAATUALIZACAO =:DATAATUALIZACAO')
    ValidateWithMask = True
    Left = 40
    Top = 299
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAATUALIZACAO'
        ParamType = ptUnknown
      end>
    object QrySaldoLitigioPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'SALDOIRLITIGIO.PLNCODIGO'
    end
    object QrySaldoLitigioPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'SALDOIRLITIGIO.PLANO'
    end
  end
  object QryTrataIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT          '
      '        CODTRATAIND,'
      '        DESCTRATAIND'
      'FROM   '
      '      TRATAINDICE '
      'WHERE  MOECODIGO= :pMOEDAATULIT')
    ValidateWithMask = True
    Left = 240
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pMOEDAATULIT'
        ParamType = ptUnknown
      end>
    object QryTrataIndiceDESCTRATAIND: TStringField
      FieldName = 'DESCTRATAIND'
      Size = 60
    end
  end
  object QryOrigemIRLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDORIGEMIRLITIGIO,'
      '    DesOrigemLitigio'
      'FROM'
      '    OrigemIRLitigio'
      'WHERE'
      '    IDTIPOINVEST=:IDTIPOINVEST'
      '')
    ValidateWithMask = True
    Left = 136
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QrySumSaldoAntRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     SI.DATAATUALIZACAO,'
      '     SUM (SI.VLRSLDIRLITIGIO) AS VLRSALDOATU,'
      '     SI.IDMODULO,'
      '     SI.PLNCODIGO,'
      '     SI.PLANO,'
      '     IL.IDINVESTIMENTO,'
      '     TR.CODTIPRENFIXA,'
      '     IL.IDORIGEMIRLITIGIO'
      'FROM'
      '     SALDOIRLITIGIO SI,'
      '     IRLITIGIO IL,'
      '     TITRENFIXA TR'
      'WHERE '
      '     (SI.DATAATUALIZACAO < :dDataRef) AND'
      '     (TR.CODTIPRENFIXA = :CODTIPRENFIXA) AND'
      '     (SI.IDIRLITIGIO = IL.IDIRLITIGIO(+)) AND'
      '     (IL.IDORIGEMIRLITIGIO = 1) AND'
      '     (IL.IDINVESTIMENTO = TR.IDTITRENFIXA(+))'
      'GROUP BY '
      '     SI.DATAATUALIZACAO,SI.IDMODULO,SI.PLNCODIGO,SI.PLANO,'
      '     TR.CODTIPRENFIXA,'
      '     IL.IDINVESTIMENTO,IL.IDORIGEMIRLITIGIO')
    ValidateWithMask = True
    Left = 136
    Top = 352
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODTIPRENFIXA'
        ParamType = ptUnknown
      end>
  end
  object DsSaldoIrLitigio: TwwDataSource
    AutoEdit = False
    DataSet = QrySaldoLitigio
    Left = 40
    Top = 352
  end
  object QrySumSaldoAtuRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     SI.DATAATUALIZACAO,'
      '     SUM (SI.VLRSLDIRLITIGIO) AS VLRSALDOATU,'
      '     SI.IDMODULO,'
      '     SI.PLNCODIGO,'
      '     SI.PLANO,'
      '     IL.IDINVESTIMENTO,'
      '     TR.CODTIPRENFIXA,'
      '     IL.IDORIGEMIRLITIGIO'
      'FROM'
      '     SALDOIRLITIGIO SI,'
      '     IRLITIGIO IL,'
      '     TITRENFIXA TR'
      'WHERE '
      '     (SI.DATAATUALIZACAO = :dDataRef) AND'
      '     (IL.IDORIGEMIRLITIGIO = 1) AND'
      '     (SI.IDIRLITIGIO = IL.IDIRLITIGIO(+)) AND'
      '     (IL.IDINVESTIMENTO = TR.IDTITRENFIXA(+))'
      'GROUP BY '
      '     SI.DATAATUALIZACAO,SI.IDMODULO,SI.PLNCODIGO,SI.PLANO,'
      '     TR.CODTIPRENFIXA,'
      '     IL.IDINVESTIMENTO,IL.IDORIGEMIRLITIGIO')
    ValidateWithMask = True
    Left = 136
    Top = 299
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object QrySumSaldoAntRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      SUM(A.VLRSALDOANT) AS VLRSALDOANTERIOR'
      'FROM'
      '(SELECT '
      '     SI.DATAATUALIZACAO,'
      '     SUM (SI.VLRSLDIRLITIGIO) AS VLRSALDOANT,'
      '     SI.IDMODULO,'
      '     SI.PLNCODIGO,'
      '     SI.PLANO,'
      '     IL.IDINVESTIMENTO,'
      '     IL.IDORIGEMIRLITIGIO'
      'FROM'
      '     SALDOIRLITIGIO SI,'
      '     IRLITIGIO IL'
      'WHERE'
      '     (SI.DATAATUALIZACAO < :dDataRef) AND'
      '     (IL.IDORIGEMIRLITIGIO = 2) AND'
      '     (SI.IDIRLITIGIO = IL.IDIRLITIGIO(+)) '
      'GROUP BY'
      '     SI.DATAATUALIZACAO,SI.IDMODULO,SI.PLNCODIGO,SI.PLANO,'
      '     IL.IDINVESTIMENTO,IL.IDORIGEMIRLITIGIO'
      ') A')
    ValidateWithMask = True
    Left = 240
    Top = 352
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object QrySumSaldoAtuRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      SUM(A.VLRSALDOATU) AS VLRSALDOATUAL,'
      '      A.IDORIGEMIRLITIGIO'
      'FROM'
      '(SELECT '
      '     SI.DATAATUALIZACAO,'
      '     SUM (SI.VLRSLDIRLITIGIO) AS VLRSALDOATU,'
      '     SI.IDMODULO,'
      '     SI.PLNCODIGO,'
      '     SI.PLANO,'
      '     IL.IDINVESTIMENTO,'
      '     IL.IDORIGEMIRLITIGIO'
      'FROM'
      '     SALDOIRLITIGIO SI,'
      '     IRLITIGIO IL'
      'WHERE'
      '     (SI.DATAATUALIZACAO = :dDataRef) AND'
      '     (IL.IDORIGEMIRLITIGIO = 2) AND'
      '     (SI.IDIRLITIGIO = IL.IDIRLITIGIO(+)) '
      'GROUP BY'
      '     SI.DATAATUALIZACAO,SI.IDMODULO,SI.PLNCODIGO,SI.PLANO,'
      '     IL.IDINVESTIMENTO,IL.IDORIGEMIRLITIGIO'
      ') A'
      'GROUP BY '
      '     A.IDORIGEMIRLITIGIO')
    ValidateWithMask = True
    Left = 240
    Top = 299
    ParamData = <
      item
        DataType = ftFloat
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 136
    Top = 70
  end
  object QryInsertSaldoIrLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO SALDOIRLITIGIO'
      
        '  (IDSALDOIRLITIGIO, PLNCODIGO, PLANO, IDIRLITIGIO, DATAATUALIZA' +
        'CAO,'
      '   VLRSLDIRLITIGIO, IDMODULO, IDTIPOINVEST)'
      'VALUES'
      
        '  (:IDSALDOIRLITIGIO, :PLNCODIGO, :PLANO, :IDIRLITIGIO, :DATAATU' +
        'ALIZACAO, '
      '   :VLRSLDIRLITIGIO, :IDMODULO, :IDTIPOINVEST)')
    ValidateWithMask = True
    Left = 344
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSALDOIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAATUALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRSLDIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryPlanoPatroPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     PLANO,'
      '     IDPLANOPREV,'
      '     IDPATROCINADORA'
      'FROM'
      '     IRLITIGIO'
      'WHERE'
      '     (DATAFATOGERADOR < :dDataRef)')
    ValidateWithMask = True
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object QryPlanoPatroPlanoPrevPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'IRLITIGIO.PLANO'
    end
    object QryPlanoPatroPlanoPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'IRLITIGIO.IDPLANOPREV'
    end
    object QryPlanoPatroPlanoPrevIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'IRLITIGIO.IDPATROCINADORA'
    end
  end
  object QryUpdateSaldoIrLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '       SALDOIRLITIGIO'
      'SET '
      '       PLNCODIGO= :pPLNCODIGO, '
      '       PLANO = :pPLANO'
      'WHERE'
      '      IDSALDOIRLITIGIO = :pIDSALDOIRLITIGIO')
    ValidateWithMask = True
    Left = 344
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDSALDOIRLITIGIO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaPUAtualizadoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        FX1.DATA,'
      '        FX.PERCAMORT,'
      '        FX.PUATUALIZADO,'
      '        FX.PUINFORMADO'
      'FROM   '
      '       FLUXOTITULO FX,'
      '       (SELECT MAX(DATAFLUXO)  AS DATA'
      '        FROM FLUXOTITULO'
      '        WHERE'
      '        DATAFLUXO < TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39') AND'
      '        IDINVESTIMENTO =:pIDINVESTIMENTO) FX1'
      'WHERE'
      '       (FX.IDINVESTIMENTO =:pIDINVESTIMENTO)  AND'
      '       (FX.DATAFLUXO = FX1.DATA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 299
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaPUAtualizadoAntDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QryBuscaPUAtualizadoAntPUATUALIZADO: TFloatField
      FieldName = 'PUATUALIZADO'
    end
    object QryBuscaPUAtualizadoAntPUINFORMADO: TFloatField
      FieldName = 'PUINFORMADO'
    end
    object QryBuscaPUAtualizadoAntPERCAMORT: TFloatField
      FieldName = 'PERCAMORT'
    end
  end
  object UpdFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '       FLUXOTITULO'
      'SET '
      '       PUATUALIZADO= :pPUATUALIZADO'
      'WHERE'
      '      (DATAFLUXO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')) AND'
      '      (IDINVESTIMENTO = :pIDINVESTIMENTO)')
    ValidateWithMask = True
    Left = 464
    Top = 70
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pPUATUALIZADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaPUIncJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT          '
      '        DATAFLUXO,'
      '        PERCINCJUROS'
      'FROM'
      '       FLUXOTITULO'
      'WHERE'
      '       (DATAFLUXO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '       (IDINVESTIMENTO =:pIDINVESTIMENTO) AND'
      '       (PERCINCJUROS <> 0 )')
    ValidateWithMask = True
    Left = 464
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaPUIncJurosDATAFLUXO: TDateTimeField
      FieldName = 'DATAFLUXO'
    end
    object QryBuscaPUIncJurosPERCINCJUROS: TFloatField
      FieldName = 'PERCINCJUROS'
    end
  end
  object QryBuscaPUPgJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT          '
      '        DATAFLUXO,'
      '        PERCPGJUROS'
      'FROM'
      '       FLUXOTITULO'
      'WHERE'
      '       (DATAFLUXO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '       (IDINVESTIMENTO =:pIDINVESTIMENTO) AND'
      '       (PERCPGJUROS <> 0 )')
    ValidateWithMask = True
    Left = 464
    Top = 189
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaPUPgJurosDATAFLUXO: TDateTimeField
      FieldName = 'DATAFLUXO'
    end
    object QryBuscaPUPgJurosPERCPGJUROS: TFloatField
      FieldName = 'PERCPGJUROS'
    end
  end
  object QryBuscaPUAmort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       DATAFLUXO,'
      '       PERCAMORT,'
      '       SUMPERCAMORT'
      'FROM'
      '       FLUXOTITULO FX,'
      '       (SELECT SUM(PERCAMORT) AS SUMPERCAMORT'
      '        FROM FLUXOTITULO FX1'
      '        WHERE'
      '           (DATAFLUXO < TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '           (IDINVESTIMENTO =:pIDINVESTIMENTO))'
      'WHERE'
      '       (DATAFLUXO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '       (IDINVESTIMENTO =:pIDINVESTIMENTO) AND'
      '       (PERCAMORT <> 0 )')
    ValidateWithMask = True
    Left = 464
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaPUAmortDATAFLUXO: TDateTimeField
      FieldName = 'DATAFLUXO'
    end
    object QryBuscaPUAmortPERCAMORT: TFloatField
      FieldName = 'PERCAMORT'
    end
    object QryBuscaPUAmortSUMPERCAMORT: TFloatField
      FieldName = 'SUMPERCAMORT'
    end
  end
  object QrySelAtuFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CODDOCUMENTO,PLNCODIGO,PLANO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDCARTEIRAINVEST = :iCarteira ) AND'
      '   (IDINVESTIMENTO   = :iInvestimento ) AND'
      '   (TIPMOVCARTINV    = '#39'ATU'#39') AND'
      '   (IDTIPOOPERACAO   = -2) AND'
      '   (DATAMOVCARTINV   = TO_DATE(:DataProc,'#39'DD/MM/YYYY'#39') )')
    ValidateWithMask = True
    Left = 464
    Top = 299
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iCarteira'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataProc'
        ParamType = ptUnknown
      end>
    object QrySelAtuFluxoTituloCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QrySelAtuFluxoTituloPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object QrySelAtuFluxoTituloPLANO: TFloatField
      FieldName = 'PLANO'
    end
  end
  object QryDelAtuFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDCARTEIRAINVEST = :iCarteira ) AND'
      '   (IDINVESTIMENTO   = :iInvestimento ) AND'
      '   (TIPMOVCARTINV    = '#39'ATU'#39') AND'
      '   (IDTIPOOPERACAO   = -2 ) AND'
      '   (DATAMOVCARTINV   = TO_DATE(:DataProc,'#39'DD/MM/YYYY'#39') )')
    ValidateWithMask = True
    Left = 136
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iCarteira'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DataProc'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaAliqCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TB.ALIQUOTA'
      'FROM'
      '   TABELACPMF TB,'
      '   ('
      '    SELECT'
      '       MAX(TB1.DATAVIGENCIA) AS DATA'
      '    FROM'
      '       TABELACPMF TB1'
      '    WHERE'
      '      (TB1.DATAVIGENCIA <= TO_DATE(:dDataVigencia,'#39'DD/MM/YYYY'#39'))'
      '   ) X'
      'WHERE'
      '    TB.DATAVIGENCIA = X.DATA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataVigencia'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'TABELAIR.ALIQUOTA'
    end
  end
  object QryInsertLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into IRLITIGIO'
      
        '  (IDIRLITIGIO,IDORIGEMIRLITIGIO,IDOPERACAOINVEST,IDINVESTIMENTO' +
        ',IDMODULO,DATAFATOGERADOR,'
      
        '   DESFATOGERADOR,VLRIRLITIGIO,IDPLANOPREV,IDPATROCINADORA, IDOP' +
        'ERACAOFUNDO,'
      
        '   IDHISTCARTINV,IDHISTRENFIX,IDHISTFUNDO,VLRRENDIMENTO,IDOPERRE' +
        'NFIX)'
      'values'
      
        '  (:IDIRLITIGIO,:IDORIGEMIRLITIGIO,:IDOPERACAOINVEST,:IDINVESTIM' +
        'ENTO,:IDMODULO,:DATAFATOGERADOR,'
      
        '   :DESFATOGERADOR,:VLRIRLITIGIO,:IDPLANOPREV,:IDPATROCINADORA,:' +
        'IDOPERACAOFUNDO,'
      
        '   :IDHISTCARTINV,:IDHISTRENFIX,:IDHISTFUNDO,:VLRRENDIMENTO,:IDO' +
        'PERRENFIX)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 189
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFATOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESFATOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATROCINADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRRENDIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaDataFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        FX.DATAFLUXO'
      'FROM   '
      '       FLUXOTITULO FX'
      'WHERE'
      '       (FX.IDINVESTIMENTO =:pIDINVESTIMENTO)  AND'
      '       (FX.DATAFLUXO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaFluxoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDHISTCARTINV'
      'FROM'
      '      HISTCARTINV'
      'WHERE'
      '      (IDTIPOINVEST = 1) AND'
      '      (IDINVESTIMENTO = :iIdInvestimento) AND'
      '      (IDTIPOOPERACAO IN (-17,-18,-19)) AND'
      '      (DATAMOVCARTINV = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      '')
    ValidateWithMask = True
    Left = 464
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object qryDelIrLitigioTrim: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM IRLITIGIO'
      'WHERE'
      '   (IDORIGEMIRLITIGIO =:IDORIGEMIRLITIGIO) AND'
      '   (DATAFATOGERADOR = :DATAREF)'
      ' ')
    ValidateWithMask = True
    Left = 343
    Top = 356
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
  end
end
