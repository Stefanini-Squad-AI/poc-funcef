object DtmMoviment: TDtmMoviment
  OldCreateOrder = True
  OnCreate = DtmMovimentCreate
  OnDestroy = DtmMovimentDestroy
  Left = 28
  Top = 110
  Height = 479
  Width = 741
  object qryTestaValdiade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        LOTEVALIDADE '
      'FROM'
      '        PRODUTO'
      'WHERE '
      '       (CODPRODUTO = :pCODPROD)')
    ValidateWithMask = True
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODPROD'
        ParamType = ptUnknown
      end>
    object qryTestaValdiadeLOTEVALIDADE: TStringField
      FieldName = 'LOTEVALIDADE'
      Size = 1
    end
  end
  object qryInfoSaldoRep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SALDOQTDE'
      'FROM'
      '    SALDO'
      'WHERE'
      '      (CODARTIGO = :pCODARTIGO)'
      '  AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryInfoSaldoRepSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
    end
  end
  object qryVerifIntContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       DATAULTINTEGRA '
      'FROM '
      '       PARALMOX '
      ' WHERE'
      '         (IDPESSOA = :pIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerifIntContabDATAULTINTEGRA: TDateTimeField
      FieldName = 'DATAULTINTEGRA'
      Origin = 'PARALMOX.DATAULTINTEGRA'
    end
  end
  object qryVerifDtInvent: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '           DATAULTINVENTARIO'
      'FROM '
      '           UNCUSTEI'
      'WHERE '
      '           (IDPESSOA = :pIDPESSOA)'
      '  AND (CODCUSTEIO = :pCODCUSTEIO)')
    ValidateWithMask = True
    Left = 48
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end>
    object qryVerifDtInventDATAULTINVENTARIO: TDateTimeField
      FieldName = 'DATAULTINVENTARIO'
      Origin = 'UNCUSTEI.DATAULTINVENTARIO'
    end
  end
  object qryVerifDtRepresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAREPRESA'
      'FROM PARALMOX '
      'WHERE (IDPESSOA = :pIDPESSOA)')
    ValidateWithMask = True
    Left = 48
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerifDtRepresaDATAREPRESA: TDateTimeField
      FieldName = 'DATAREPRESA'
      Origin = 'PARALMOX.DATAREPRESA'
    end
  end
  object qryCalcSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     SALDOQTDE'
      'FROM'
      '     SALDO'
      'WHERE'
      '     (CODARTIGO = :pCODARTIGO)'
      ' And (CODALMOXARIFADO  = :pCODALMOX )')
    ValidateWithMask = True
    Left = 48
    Top = 225
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
    object qryCalcSaldoSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
    end
  end
  object qryInsertSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO SALDO'
      '     (CODARTIGO,'
      '      SALDOQTDE,'
      '      CODALMOXARIFADO,'
      '      DATAULTLANC,'
      '      IDPESSOA )'
      'VALUES'
      '     (:pCODARTIGO,'
      '      :pSALDOQTDE,'
      '      :pCODALMOXARIFADO,'
      '      :pDATAULTLANC,'
      '      :pIDPESSOA )')
    ValidateWithMask = True
    Left = 48
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSALDOQTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAULTLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE SALDO SET'
      '     SALDOQTDE = :pSALDOQTDE'
      'WHERE'
      '     (CODARTIGO = :pCODARTIGO)'
      ' AND (CODALMOXARIFADO  = :pCODALMOX )')
    ValidateWithMask = True
    Left = 48
    Top = 278
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pSALDOQTDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
  end
  object qryCalcCustoMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CUSTOMEDIO,'
      '     SALDOQTDEUC'
      'FROM'
      '     CUSTOMED'
      'WHERE'
      '      (CODARTIGO  = :pCODARTIGO)'
      '  AND (CODCUSTEIO = :pCODCUSTEIO)'
      '')
    ValidateWithMask = True
    Left = 160
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end>
    object qryCalcCustoMedCUSTOMEDIO: TFloatField
      FieldName = 'CUSTOMEDIO'
    end
    object qryCalcCustoMedSALDOQTDEUC: TFloatField
      FieldName = 'SALDOQTDEUC'
    end
  end
  object qryUpdCustoMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CUSTOMED SET'
      '     CUSTOMEDIO  = :pCUSTOMEDIO'
      '    ,SALDOQTDEUC = :pSALDOQTDEUC'
      'WHERE'
      '     (CODARTIGO  = :pCODARTIGO)'
      ' AND (CODCUSTEIO = :pCODCUSTEIO)'
      '')
    ValidateWithMask = True
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCUSTOMEDIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSALDOQTDEUC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertCustoMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CUSTOMED'
      '     (CODCUSTEIO,'
      '      CODARTIGO,'
      '      SALDOQTDEUC,'
      '      CUSTOMEDIO )'
      'VALUES'
      '     (:pCODCUSTEIO,'
      '      :pCODARTIGO,'
      '      :pSALDOQTDEUC,'
      '      :pCUSTOMEDIO )')
    ValidateWithMask = True
    Left = 160
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSALDOQTDEUC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCUSTOMEDIO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' INSERT INTO MOVIMENT'
      '        ( IDMOV,'
      '          CODALMOXARIFADO,'
      '          IDPESSOA,'
      '          CODARTIGO,'
      '          CODTIPOMOV,'
      '          CUSTOMEDIOMOV,'
      '          VALORMOV,'
      '          QTDEMOV,'
      '          SALDOQTDEMOV,'
      '          DATALANCMOV,'
      '          DATAMOV,'
      '          NUMDOCUMENTO,'
      '          CODCENTROCUSTO,'
      '          IDEMPRESA,'
      '          CODALMOXTRANSF,'
      '          FLGENTRADACUSTO,'
      '          UNIDNEGOC )'
      ' VALUES'
      '        ( :pIDMOV,'
      '          :pCODALMOXARIFADO,'
      '          :pIDPESSOA,'
      '          :pCODARTIGO,'
      '          :pCODTIPOMOV,'
      '          :pCUSTOMEDIOMOV,'
      '          :pVALORMOV,'
      '          :pQTDEMOV,'
      '          :pSALDOQTDEMOV,'
      '          :pDATALANCMOV,'
      '          :pDATAMOV,'
      '          :pNUMDOCUMENTO,'
      '          :pCODCENTROCUSTO,'
      '          :pIDEMPRESA,'
      '          :pCODALMOXTRANSF,'
      '          :pFLGENTRADACUSTO,'
      '          :pUNIDNEGOC )')
    ValidateWithMask = True
    Left = 256
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODTIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCUSTOMEDIOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALORMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pQTDEMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSALDOQTDEMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATALANCMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pNUMDOCUMENTO'
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
        Name = 'pCODALMOXTRANSF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGENTRADACUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pUNIDNEGOC'
        ParamType = ptUnknown
      end>
  end
  object qrySaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(M.SALDOQTDEMOV) as SALDO'
      'FROM'
      '   MOVIMENT M ,'
      '   (SELECT M.CODALMOXARIFADO,'
      '           MAX(M.IDMOV) AS MAXIDMOV'
      '    FROM'
      '           MOVIMENT M,'
      '          ( SELECT'
      '                  MAX(DATAMOV) AS DATAMOV,'
      '                  CODALMOXARIFADO'
      '            FROM MOVIMENT'
      '            WHERE'
      '                  (CODARTIGO = :pCODARTIGO )'
      '              AND (DATAMOV < :pDATAMOV )'
      
        '              AND (CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FR' +
        'OM ALMOX WHERE (CODCUSTEIO = :pCODCUSTEIO )))'
      '              AND (IDPESSOA = :pIDPESSOA)'
      '            GROUP BY CODALMOXARIFADO'
      '          ) SUB'
      '    WHERE'
      '           (M.CODARTIGO = :pCODARTIGO )'
      '       AND (M.DATAMOV = SUB.DATAMOV )'
      '       AND (M.CODALMOXARIFADO = SUB.CODALMOXARIFADO)'
      
        '       AND (M.CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FROM AL' +
        'MOX WHERE (CODCUSTEIO = :pCODCUSTEIO )))'
      '     GROUP BY M.CODALMOXARIFADO ) AUX'
      'WHERE'
      '     (M.IDMOV = AUX.MAXIDMOV)')
    ValidateWithMask = True
    Left = 256
    Top = 267
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end>
    object qrySaldoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object qryCustoMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      A.CODCUSTEIO,'
      '      M.CUSTOMEDIOMOV'
      'FROM'
      '      MOVIMENT M,'
      '      ALMOX A,'
      '      ('
      '       SELECT A.CODCUSTEIO,'
      '              MAX(M.IDMOV) AS MAXIDMOV'
      '       FROM MOVIMENT M,'
      '            ALMOX A,'
      '            ( SELECT A.CODCUSTEIO,MAX(M.DATAMOV) AS DATAMOV'
      '              FROM MOVIMENT M, ALMOX A'
      '              WHERE'
      '                    (M.CODARTIGO = :pCODARTIGO)'
      '                AND (M.DATAMOV < :pDATAMOV )'
      '                AND (M.IDPESSOA = :pIDPESSOA)'
      '                AND (M.CODALMOXARIFADO  = A.CODALMOXARIFADO)'
      '              GROUP BY A.CODCUSTEIO'
      '            ) SUB'
      '       WHERE'
      '              (M.CODARTIGO = :pCODARTIGO )'
      '          AND (M.DATAMOV = SUB.DATAMOV )'
      '          AND (A.CODCUSTEIO = SUB.CODCUSTEIO)'
      '          AND (A.CODALMOXARIFADO = M.CODALMOXARIFADO)'
      '          GROUP BY A.CODCUSTEIO ) AUX'
      'WHERE'
      '       (M.IDMOV = AUX.MAXIDMOV)'
      '   AND (A.CODALMOXARIFADO = M.CODALMOXARIFADO)'
      'GROUP BY A.CODCUSTEIO,M.CUSTOMEDIOMOV')
    ValidateWithMask = True
    Left = 256
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end>
    object qryCustoMedCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
    end
    object qryCustoMedCUSTOMEDIOMOV: TFloatField
      FieldName = 'CUSTOMEDIOMOV'
    end
  end
  object qryMoviment: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDMOV,'
      '      CODTIPOMOV,'
      '      CODARTIGO,'
      '      CODALMOXARIFADO,'
      '      DATAMOV,'
      '      QTDEMOV,'
      '      VALORMOV,'
      '      CUSTOMEDIOMOV,'
      '      SALDOQTDEMOV,'
      '      IDPESSOA,'
      '      CODALMOXTRANSF,'
      '      FLGENTRADACUSTO'
      'FROM'
      '      MOVIMENT'
      'WHERE'
      '    (CODARTIGO = :pCODARTIGO)'
      'AND (DATAMOV    >= :pDATA)'
      'AND (DATAMOV    <= :pDATAREPRESA)'
      'AND (IDPESSOA  = :pIDPESSOA)'
      'ORDER BY DATAMOV,IDMOV')
    ValidateWithMask = True
    Left = 256
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAREPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryMovimentIDMOV: TFloatField
      FieldName = 'IDMOV'
    end
    object qryMovimentCODTIPOMOV: TStringField
      FieldName = 'CODTIPOMOV'
      Size = 1
    end
    object qryMovimentCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryMovimentCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
    object qryMovimentDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryMovimentQTDEMOV: TFloatField
      FieldName = 'QTDEMOV'
      Precision = 5
    end
    object qryMovimentVALORMOV: TFloatField
      FieldName = 'VALORMOV'
    end
    object qryMovimentCUSTOMEDIOMOV: TFloatField
      FieldName = 'CUSTOMEDIOMOV'
    end
    object qryMovimentSALDOQTDEMOV: TFloatField
      FieldName = 'SALDOQTDEMOV'
    end
    object qryMovimentIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovimentCODALMOXTRANSF: TFloatField
      FieldName = 'CODALMOXTRANSF'
    end
    object qryMovimentFLGENTRADACUSTO: TStringField
      FieldName = 'FLGENTRADACUSTO'
      Origin = 'MOVIMENT.FLGENTRADACUSTO'
      Size = 1
    end
  end
  object qryEntraLoteVali: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODARTIGO,'
      '    CODALMOXARIFADO,'
      '    DATAVALIDADE,'
      '    L.SALDOLOTE'
      'FROM'
      '    LOTEVALI L'
      'WHERE'
      '     (L.CODARTIGO       = :pCODARTIGO)'
      ' AND (L.CODALMOXARIFADO = :pCODALMOXARIFADO)'
      ' AND (L.DATAVALIDADE    = :pDATAVALIDADE)')
    UpdateObject = updEntraLoteVali
    ValidateWithMask = True
    Left = 160
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAVALIDADE'
        ParamType = ptUnknown
      end>
    object qryEntraLoteValiSALDOLOTE: TFloatField
      FieldName = 'SALDOLOTE'
      Origin = 'LOTEVALI.SALDOLOTE'
    end
    object qryEntraLoteValiCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'LOTEVALI.CODARTIGO'
      Size = 14
    end
    object qryEntraLoteValiCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'LOTEVALI.CODALMOXARIFADO'
    end
    object qryEntraLoteValiDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
      Origin = 'LOTEVALI.DATAVALIDADE'
    end
  end
  object updEntraLoteVali: TUpdateSQL
    ModifySQL.Strings = (
      'update LOTEVALI'
      'set'
      '  CODARTIGO = :CODARTIGO,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  DATAVALIDADE = :DATAVALIDADE,'
      '  SALDOLOTE = :SALDOLOTE'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO and'
      '  DATAVALIDADE = :OLD_DATAVALIDADE')
    InsertSQL.Strings = (
      'insert into LOTEVALI'
      '  (CODARTIGO, CODALMOXARIFADO, DATAVALIDADE, SALDOLOTE)'
      'values'
      '  (:CODARTIGO, :CODALMOXARIFADO, :DATAVALIDADE, :SALDOLOTE)')
    DeleteSQL.Strings = (
      'delete from LOTEVALI'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO and'
      '  DATAVALIDADE = :OLD_DATAVALIDADE')
    Left = 160
    Top = 216
  end
  object qrySaiLoteVali: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    L.CODARTIGO,'
      '    L.CODALMOXARIFADO,'
      '    L.DATAVALIDADE,'
      '    L.SALDOLOTE'
      'FROM'
      '    LOTEVALI L'
      'WHERE'
      '     (L.CODARTIGO       = :pCODARTIGO)'
      ' AND (L.CODALMOXARIFADO = :pCODALMOXARIFADO)'
      ' AND (1 = 2)'
      'ORDER BY L.DATAVALIDADE')
    UpdateObject = updSaiLoteVali
    ValidateWithMask = True
    Left = 160
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'SALDOLOTE'
      Origin = 'LOTEVALI.SALDOLOTE'
    end
    object StringField1: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'LOTEVALI.CODARTIGO'
      Size = 14
    end
    object FloatField2: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'LOTEVALI.CODALMOXARIFADO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAVALIDADE'
      Origin = 'LOTEVALI.DATAVALIDADE'
    end
  end
  object updSaiLoteVali: TUpdateSQL
    ModifySQL.Strings = (
      'update LOTEVALI'
      'set'
      '  CODARTIGO = :CODARTIGO,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  DATAVALIDADE = :DATAVALIDADE,'
      '  SALDOLOTE = :SALDOLOTE'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO and'
      '  DATAVALIDADE = :OLD_DATAVALIDADE')
    InsertSQL.Strings = (
      'insert into LOTEVALI'
      '  (CODARTIGO, CODALMOXARIFADO, DATAVALIDADE, SALDOLOTE)'
      'values'
      '  (:CODARTIGO, :CODALMOXARIFADO, :DATAVALIDADE, :SALDOLOTE)')
    DeleteSQL.Strings = (
      'delete from LOTEVALI'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO and'
      '  DATAVALIDADE = :OLD_DATAVALIDADE')
    Left = 160
    Top = 320
  end
  object qryDataTrava: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    I.DATATRAVA'
      'FROM'
      '    INVENTAR I,'
      '    QTDECONT Q'
      'WHERE'
      '    (I.CONTAGEMENCERRADA <> '#39'T'#39')'
      'AND (Q.CODARTIGO       = :pCODARTIGO)'
      'AND (I.CODALMOXARIFADO = :pCODALMOXARIFADO)'
      'AND (I.IDINVENTARIO    = Q.IDINVENTARIO)')
    ValidateWithMask = True
    Left = 256
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
  end
  object qryFatorCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.Fator'
      'FROM'
      '     Conver C, '
      '     Produto P,'
      '     Artigo A'
      'WHERE'
      '     (A.CodArtigo = :pCODARTIGO)'
      ' And (C.CodMedida = :pCODMEDIDA)'
      ' And (A.CodProduto = P.CodProduto)'
      ' And (C.CodProduto = P.CodProduto)'
      '')
    ValidateWithMask = True
    Left = 256
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODMEDIDA'
        ParamType = ptUnknown
      end>
  end
  object qryFatorCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.Fator,'
      '     P.LoteValidade,'
      '     P.CodMedCusto'
      ' FROM'
      '     Conver C,'
      '     Produto P,'
      '     Artigo A'
      'WHERE'
      '     (A.CODARTIGO  = :pCODARTIGO)'
      ' And (A.CodProduto = P.CodProduto)'
      ' And (C.CodProduto = P.CodProduto)'
      ' And (C.CodMedida  = P.CodMedCusto)')
    ValidateWithMask = True
    Left = 256
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end>
    object qryFatorCustoFATOR: TFloatField
      FieldName = 'FATOR'
    end
    object qryFatorCustoLOTEVALIDADE: TStringField
      FieldName = 'LOTEVALIDADE'
      Size = 1
    end
    object qryFatorCustoCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Size = 4
    end
  end
  object qryUpdValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' UPDATE CUSTOMED SET'
      '   CUSTOMEDIO   = :pCUSTOMEDIO'
      '  ,SALDOQTDEUC  = :pSALDOQTDEUC'
      ' WHERE'
      '       (CODARTIGO  = :pCODARTIGO )'
      '   AND (CODCUSTEIO = :pCODCUSTEIO)'
      '')
    ValidateWithMask = True
    Left = 336
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCUSTOMEDIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSALDOQTDEUC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODCUSTEIO'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoRep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      '      (M.SALDOQTDEMOV) AS SALDO'
      ' FROM'
      '       MOVIMENT M,'
      '       (SELECT MAX(M.IDMOV) AS MAXIDMOV'
      '        FROM MOVIMENT M,'
      '             ( SELECT MAX(DATAMOV) AS DATAMOV'
      '               FROM MOVIMENT'
      '               WHERE'
      '                      (CODARTIGO = :pCODARTIGO )'
      '                  AND ( DATAMOV < :pDATAMOV )'
      '                  AND (CODALMOXARIFADO = :pCODALMOXARIFADO)'
      '              ) SUB'
      '        WHERE'
      '               (CODARTIGO = :pCODARTIGO)'
      '           AND (M.DATAMOV =  SUB.DATAMOV )'
      '           AND (CODALMOXARIFADO = :pCODALMOXARIFADO)'
      '        ) AUX'
      ' WHERE'
      '        (M.IDMOV = AUX.MAXIDMOV)')
    ValidateWithMask = True
    Left = 336
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qrySaldoRepSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object qryAtuSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '      IDMOV,'
      '      DATAMOV,'
      '      QTDEMOV,'
      '      SALDOQTDEMOV'
      'FROM'
      '      MOVIMENT'
      'WHERE'
      '    (CODARTIGO = :pCODARTIGO)'
      'AND (DATAMOV >= :pDATAMOV )'
      'AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      'ORDER BY DATAMOV,IDMOV')
    ValidateWithMask = True
    Left = 336
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryAtuSaldoIDMOV: TFloatField
      FieldName = 'IDMOV'
    end
    object qryAtuSaldoDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryAtuSaldoQTDEMOV: TFloatField
      FieldName = 'QTDEMOV'
    end
    object qryAtuSaldoSALDOQTDEMOV: TFloatField
      FieldName = 'SALDOQTDEMOV'
    end
  end
  object qryUltDataMovRep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     MAX(DATAMOV) AS DATAMOV'
      'FROM'
      '     MOVIMENT'
      'WHERE'
      '      (CODARTIGO = :pCODARTIGO)'
      '   AND(DATAMOV  <= :pDATAMOV)'
      '')
    ValidateWithMask = True
    Left = 336
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end>
  end
  object qryUpdMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE MOVIMENT SET'
      '       IDMOVENTRADA  = :pIDMOVENTRADA'
      '      ,PLNCODIGO     = :pPLNCODIGO'
      'WHERE ( IDMOV = :pIDMOV)')
    ValidateWithMask = True
    Left = 336
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDMOVENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryInfoSaldoMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     M.SALDOQTDEMOV'
      ' FROM'
      '     MOVIMENT M,'
      '     ( SELECT MAX(M.IDMOV) AS IDMOV'
      '       FROM'
      '          MOVIMENT M,'
      '          (SELECT MAX(DATAMOV) AS DATAMOV'
      '           FROM MOVIMENT'
      '           WHERE'
      '                  (CODARTIGO = :pCODARTIGO)'
      '              AND (DATAMOV <= :pDATAMOV)'
      '              AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '           ) SUB1'
      '       WHERE'
      '            (CODARTIGO = :pCODARTIGO)'
      '        AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '        AND (M.DATAMOV = SUB1.DATAMOV)'
      '      ) AUX'
      ' WHERE'
      '      (CODARTIGO = :pCODARTIGO)'
      '  AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '  AND (M.IDMOV = AUX.IDMOV)')
    ValidateWithMask = True
    Left = 424
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryInfoSaldoMovSALDOQTDEMOV: TFloatField
      FieldName = 'SALDOQTDEMOV'
    end
  end
  object qryUpdSaldoMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE MOVIMENT SET'
      '     SALDOQTDEMOV  = :pSALDOQTDEMOV '
      'WHERE'
      '     ( IDMOV  = :pIDMOV)')
    ValidateWithMask = True
    Left = 424
    Top = 118
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pSALDOQTDEMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryUpdMovVal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' UPDATE MOVIMENT SET'
      '   CUSTOMEDIOMOV   = :pCUSTOMEDIOMOV'
      '  ,VALORMOV        = :pVALORMOV'
      ' WHERE'
      '   (IDMOV = :pIDMOV)'
      '')
    ValidateWithMask = True
    Left = 336
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCUSTOMEDIOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALORMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryAtuPrecoSug: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.CODARTIGO,'
      '       I.VLRCUSTO,'
      '       I.PERCLUCRO,'
      '       I.PRECOSUG,'
      '       (CI.FATOR / CM.FATOR) AS FATOR'
      'FROM ITEM I,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     CONVER CM,'
      '     CONVER CI'
      'WHERE'
      '      (I.CODARTIGO = :CODARTIGO) AND'
      '      (I.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)       '
      '  AND (P.CODMEDCUSTO = CM.CODMEDIDA)'
      '  AND (P.CODPRODUTO = CM.CODPRODUTO)   '
      '  AND (I.CODMEDPDV  = CI.CODMEDIDA)'
      '  AND (P.CODPRODUTO = CI.CODPRODUTO)')
    UpdateObject = updAtuPrecoSug
    ValidateWithMask = True
    Left = 427
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end>
    object qryAtuPrecoSugCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'ITEM.CODARTIGO'
      Size = 14
    end
    object qryAtuPrecoSugVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      Origin = 'ITEM.VLRCUSTO'
    end
    object qryAtuPrecoSugPERCLUCRO: TFloatField
      FieldName = 'PERCLUCRO'
      Origin = 'ITEM.PERCLUCRO'
    end
    object qryAtuPrecoSugPRECOSUG: TFloatField
      FieldName = 'PRECOSUG'
      Origin = 'ITEM.PRECOSUG'
    end
    object qryAtuPrecoSugFATOR: TFloatField
      FieldName = 'FATOR'
      Origin = 'CONVER.FATOR'
    end
  end
  object updAtuPrecoSug: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEM'
      'set'
      '  VLRCUSTO = :VLRCUSTO,'
      '  PRECOSUG = :PRECOSUG'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    InsertSQL.Strings = (
      'insert into ITEM'
      '  (VLRCUSTO, PRECOSUG)'
      'values'
      '  (:VLRCUSTO, :PRECOSUG)')
    DeleteSQL.Strings = (
      'delete from ITEM'
      'where'
      '  RTRIM(CODARTIGO) = :OLD_CODARTIGO')
    Left = 426
    Top = 171
  end
  object qryCustoArt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODARTIGO,'
      '       CUSTOMEDIO,'
      '       CUSTOREP'
      'FROM CUSTOMED'
      'WHERE (CODARTIGO = :CODARTIGO)'
      '')
    ValidateWithMask = True
    Left = 427
    Top = 278
    ParamData = <
      item
        DataType = ftString
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end>
    object qryCustoArtCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'CUSTOMED.CODARTIGO'
      Size = 14
    end
    object qryCustoArtCUSTOMEDIO: TFloatField
      FieldName = 'CUSTOMEDIO'
      Origin = 'CUSTOMED.CUSTOMEDIO'
    end
    object qryCustoArtCUSTOREP: TFloatField
      FieldName = 'CUSTOREP'
      Origin = 'CUSTOMED.CUSTOREP'
    end
  end
  object qryModChef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MB.CODARTIGOBUFFET,'
      '       MB.BUFFETQTDPREVISTA,'
      '       MB.VLRCUSTO,'
      '       MB.PRECOSUG,'
      '       MB.IDMODCHEFBUFFET,'
      '       CC.CODARTIGO,'
      '      (CC.QTDEARTIGO * CF.FATOR / CM.FATOR) AS QTDE'
      'FROM MODCHEFBUFFET MB,'
      '     CHEFBUFFETCOMP CC,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     CONVER CM,'
      '     CONVER CF'
      'WHERE'
      '      (MB.IDMODCHEFBUFFET = :IDMODCHEFBUFFET)'
      '  AND (MB.IDMODCHEFBUFFET = CC.IDMODCHEFBUFFET)'
      '  AND (CC.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (P.CODMEDCUSTO = CM.CODMEDIDA)'
      '  AND (P.CODPRODUTO = CM.CODPRODUTO)'
      '  AND (CC.CODMEDIDA  = CF.CODMEDIDA)'
      '  AND (P.CODPRODUTO = CF.CODPRODUTO)'
      '')
    UpdateObject = updModChef
    ValidateWithMask = True
    Left = 424
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODCHEFBUFFET'
        ParamType = ptUnknown
      end>
    object qryModChefCODARTIGOBUFFET: TStringField
      FieldName = 'CODARTIGOBUFFET'
      Origin = 'MODCHEFBUFFET.CODARTIGOBUFFET'
      Size = 14
    end
    object qryModChefBUFFETQTDPREVISTA: TFloatField
      FieldName = 'BUFFETQTDPREVISTA'
      Origin = 'MODCHEFBUFFET.BUFFETQTDPREVISTA'
    end
    object qryModChefCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'CHEFBUFFETCOMP.CODARTIGO'
      Size = 14
    end
    object qryModChefQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'CHEFBUFFETCOMP.QTDEARTIGO'
    end
    object qryModChefVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
    end
    object qryModChefPRECOSUG: TFloatField
      FieldName = 'PRECOSUG'
    end
    object qryModChefIDMODCHEFBUFFET: TFloatField
      FieldName = 'IDMODCHEFBUFFET'
    end
  end
  object updModChef: TUpdateSQL
    ModifySQL.Strings = (
      'update MODCHEFBUFFET'
      'set'
      '  VLRCUSTO = :VLRCUSTO,'
      '  PRECOSUG = :PRECOSUG'
      'where'
      '  IDMODCHEFBUFFET = :OLD_IDMODCHEFBUFFET')
    InsertSQL.Strings = (
      'insert into MODCHEFBUFFET'
      '  (VLRCUSTO, PRECOSUG)'
      'values'
      '  (:VLRCUSTO, :PRECOSUG)')
    DeleteSQL.Strings = (
      'delete from MODCHEFBUFFET'
      'where'
      '  IDMODCHEFBUFFET = :OLD_IDMODCHEFBUFFET')
    Left = 426
    Top = 324
  end
  object qryFichaTec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FT.CODARTIGOSEC, FT.CODARTIGOPRINC, FT.VLRCUSTO,'
      '      (FT.QTDE * CF.FATOR / CM.FATOR) AS QTDE'
      'FROM CM.FICHTECN FT,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     CONVER CM,'
      '     CONVER CF'
      'WHERE (FT.CODARTIGOPRINC = :CODARTIGO)'
      '  AND (FT.CODARTIGOSEC = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (P.CODMEDCUSTO = CM.CODMEDIDA)'
      '  AND (P.CODPRODUTO = CM.CODPRODUTO)'
      '  AND (FT.CODMEDIDA  = CF.CODMEDIDA)'
      '  AND (P.CODPRODUTO = CF.CODPRODUTO)'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end>
    object qryFichaTecCODARTIGOSEC: TStringField
      FieldName = 'CODARTIGOSEC'
      Origin = 'FICHTECN.CODARTIGOSEC'
      Size = 14
    end
    object qryFichaTecQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'FICHTECN.QTDE'
    end
    object qryFichaTecCODARTIGOPRINC: TStringField
      FieldName = 'CODARTIGOPRINC'
      Origin = 'FICHTECN.CODARTIGOPRINC'
      Size = 14
    end
    object qryFichaTecVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      Origin = 'FICHTECN.VLRCUSTO'
    end
  end
  object qryUpdFichaTec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FICHTECN SET VLRCUSTO = :VLRCUSTO'
      'WHERE (CODARTIGOPRINC = :CODARTIGOPRINC)'
      '  AND (CODARTIGOSEC = :CODARTIGOSEC)')
    ValidateWithMask = True
    Left = 502
    Top = 234
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODARTIGOPRINC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODARTIGOSEC'
        ParamType = ptUnknown
      end>
  end
end
