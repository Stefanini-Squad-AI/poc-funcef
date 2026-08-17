object DtmMovEstoque: TDtmMovEstoque
  OldCreateOrder = False
  Left = 4
  Top = 46
  Height = 479
  Width = 741
  object spVerifDataRepresa: TCMSqlParams
    SQL.Strings = (
      'SELECT DATAREPRESA'
      'FROM PARALMOX '
      'WHERE (IDPESSOA = :IDPESSOA)')
    Left = 40
    Top = 56
  end
  object spVerifIntegraContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       DATAULTINTEGRA '
      'FROM '
      '       PARALMOX '
      ' WHERE'
      '         (IDPESSOA = :IDPESSOA)')
    Left = 40
    Top = 104
  end
  object spVerifDataInvent: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '           DATAULTINVENTARIO'
      'FROM '
      '           UNCUSTEI'
      'WHERE '
      '           (IDPESSOA = :IDPESSOA)'
      '  AND (CODCUSTEIO = :CODCUSTEIO)'
      ' ')
    Left = 40
    Top = 152
  end
  object spLoteValidade: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    CODARTIGO,'
      '    CODALMOXARIFADO,'
      '    DATAVALIDADE,'
      '    SALDOLOTE'
      'FROM'
      '    LOTEVALI'
      'WHERE'
      '     (CODARTIGO       = :CODARTIGO)'
      ' AND (CODALMOXARIFADO = :CODALMOXARIFADO)'
      ' AND (DATAVALIDADE    = :DATAVALIDADE)'
      'ORDER BY DATAVALIDADE ')
    Left = 40
    Top = 200
  end
  object spDataTrava: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    I.DATATRAVA'
      'FROM'
      '    INVENTAR I,'
      '    QTDECONT Q'
      'WHERE'
      '    (I.CONTAGEMENCERRADA <> '#39'T'#39')'
      'AND (Q.CODARTIGO       = :CODARTIGO)'
      'AND (I.CODALMOXARIFADO = :CODALMOXARIFADO)'
      'AND (I.IDINVENTARIO    = Q.IDINVENTARIO)'
      ' ')
    Left = 40
    Top = 248
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 8
  end
  object spGetDataImplantacao: TCMSqlParams
    SQL.Strings = (
      'SELECT DATAIMPLANTA'
      'FROM PARALMOX '
      'WHERE '
      '            (IDPESSOA = :IDPESSOA)')
    Left = 152
    Top = 8
  end
  object spValidade: TCMSqlParams
    SQL.Strings = (
      'SELECT  P. LOTEVALIDADE'
      'FROM PRODUTO P, ARTIGO A'
      'WHERE  '
      '               (A.CODARTIGO = :CODARTIGO)'
      '     AND  (A.CODPRODUTO = P.CODPRODUTO)      ')
    Left = 152
    Top = 56
  end
  object spSaldoRepresado: TCMSqlParams
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
      '                      (CODARTIGO = :CODARTIGO )'
      '                  AND ( DATAMOV < :DATAMOV )'
      '                  AND (CODALMOXARIFADO = :CODALMOXARIFADO)'
      '              ) SUB'
      '        WHERE'
      '               (CODARTIGO = :CODARTIGO)'
      '           AND (M.DATAMOV =  SUB.DATAMOV )'
      '           AND (CODALMOXARIFADO = :CODALMOXARIFADO)'
      '        ) AUX'
      ' WHERE'
      '        (M.IDMOV = AUX.MAXIDMOV)')
    Left = 152
    Top = 104
  end
  object spAtualizaSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      IDMOV,'
      '      DATAMOV,'
      '      QTDEMOV,'
      '      SALDOQTDEMOV'
      'FROM'
      '      MOVIMENT'
      'WHERE'
      '    (CODARTIGO = :CODARTIGO)'
      'AND (DATAMOV >= :DATAMOV )'
      'AND (CODALMOXARIFADO  = :CODALMOXARIFADO)'
      'ORDER BY DATAMOV,IDMOV')
    Left = 152
    Top = 152
  end
  object spUpdSaldoMov: TCMSqlParams
    SQL.Strings = (
      'UPDATE MOVIMENT SET'
      '     SALDOQTDEMOV  = :SALDOQTDEMOV '
      'WHERE'
      '     ( IDMOV  = :IDMOV)')
    Left = 152
    Top = 200
  end
  object spCustoMed: TCMSqlParams
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
      '                    (M.CODARTIGO = :CODARTIGO)'
      '                AND (M.DATAMOV < :DATAMOV )'
      '                AND (M.IDPESSOA = :IDPESSOA)'
      '                AND (M.CODALMOXARIFADO  = A.CODALMOXARIFADO)'
      '              GROUP BY A.CODCUSTEIO'
      '            ) SUB'
      '       WHERE'
      '              (M.CODARTIGO = :CODARTIGO )'
      '          AND (M.DATAMOV = SUB.DATAMOV )'
      '          AND (A.CODCUSTEIO = SUB.CODCUSTEIO)'
      '          AND (A.CODALMOXARIFADO = M.CODALMOXARIFADO)'
      '          GROUP BY A.CODCUSTEIO ) AUX'
      'WHERE'
      '       (M.IDMOV = AUX.MAXIDMOV)'
      '   AND (A.CODALMOXARIFADO = M.CODALMOXARIFADO)'
      'GROUP BY A.CODCUSTEIO,M.CUSTOMEDIOMOV'
      ''
      ' ')
    Left = 152
    Top = 248
  end
  object spSaldoUC: TCMSqlParams
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
      '                  (CODARTIGO = :CODARTIGO )'
      '              AND (DATAMOV < :DATAMOV )'
      
        '              AND (CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FR' +
        'OM ALMOX WHERE (CODCUSTEIO = :CODCUSTEIO )))'
      '              AND (IDPESSOA = :IDPESSOA)'
      '            GROUP BY CODALMOXARIFADO'
      '          ) SUB'
      '    WHERE'
      '           (M.CODARTIGO = :CODARTIGO )'
      '       AND (M.DATAMOV = SUB.DATAMOV )'
      '       AND (M.CODALMOXARIFADO = SUB.CODALMOXARIFADO)'
      
        '       AND (M.CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FROM AL' +
        'MOX WHERE (CODCUSTEIO = :CODCUSTEIO )))'
      '     GROUP BY M.CODALMOXARIFADO ) AUX'
      'WHERE'
      '     (M.IDMOV = AUX.MAXIDMOV)'
      '')
    Left = 264
    Top = 8
  end
  object spMoviment: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     M.IDMOV,'
      '     M.CODTIPOMOV,'
      '     M.CODARTIGO,'
      '     M.CODALMOXARIFADO,'
      '     M.DATAMOV,'
      '     M.QTDEMOV,'
      '     M.VALORMOV,'
      '     M.CUSTOMEDIOMOV,'
      '     M.SALDOQTDEMOV,'
      '     M.IDPESSOA,'
      '     M.CODALMOXTRANSF,'
      '     M.FLGENTRADACUSTO,'
      '     A.CODCUSTEIO'
      'FROM'
      '      MOVIMENT M,'
      '      ALMOX A'
      'WHERE'
      '    (M.CODARTIGO = :CODARTIGO)'
      'AND (M.DATAMOV    >= :DATA)'
      'AND (M.DATAMOV    <= :DATAREPRESA)'
      'AND (M.IDPESSOA  = :IDPESSOA)'
      'AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)'
      'AND (M.IDPESSOA = A.IDPESSOA)'
      'ORDER BY M.DATAMOV, M.IDMOV'
      '')
    Left = 264
    Top = 56
  end
  object spUpdMoviment: TCMSqlParams
    SQL.Strings = (
      'UPDATE MOVIMENT SET'
      '   CUSTOMEDIOMOV   = :CUSTOMEDIOMOV'
      '  ,VALORMOV        = :VALORMOV'
      'WHERE'
      '   (IDMOV = :IDMOV)')
    Left = 264
    Top = 104
  end
  object spUpdCustoMed: TCMSqlParams
    SQL.Strings = (
      'UPDATE CUSTOMED SET'
      '   CUSTOMEDIO   = :CUSTOMEDIO'
      '  ,SALDOQTDEUC  = :SALDOQTDEUC'
      'WHERE'
      '       (CODARTIGO  = :CODARTIGO )'
      '   AND (CODCUSTEIO = :CODCUSTEIO)')
    Left = 264
    Top = 152
  end
  object spUltDataMovRepresado: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     MAX(DATAMOV) AS DATAMOV'
      'FROM'
      '     MOVIMENT'
      'WHERE'
      '       (CODARTIGO = :CODARTIGO)'
      '   AND (DATAMOV  <= :DATAMOV)')
    Left = 264
    Top = 200
  end
  object spGetCCAlmoxarifado: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODCENTROCUSTO,'
      '     IDEMPRESA'
      'FROM ALMOX'
      'WHERE (CODALMOXARIFADO = :CODALMOXARIFADO)')
    Left = 264
    Top = 248
  end
  object spInfoSaldoMov: TCMSqlParams
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
      '                  (CODARTIGO = :CODARTIGO)'
      '              AND (DATAMOV  <= :DATAMOV)'
      '              AND (CODALMOXARIFADO  = :CODALMOXARIFADO)'
      '           ) SUB1'
      '       WHERE'
      '            (CODARTIGO = :CODARTIGO)'
      '        AND (CODALMOXARIFADO  = :CODALMOXARIFADO)'
      '        AND (M.DATAMOV = SUB1.DATAMOV)'
      '      ) AUX'
      ' WHERE'
      '      (CODARTIGO = :CODARTIGO)'
      '  AND (CODALMOXARIFADO  = :CODALMOXARIFADO)'
      '  AND (M.IDMOV = AUX.IDMOV)'
      '')
    Left = 384
    Top = 8
  end
  object spTestaValidade: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '        LOTEVALIDADE '
      'FROM'
      '        PRODUTO'
      'WHERE '
      '       (CODPRODUTO = :CODPRODUTO )')
    Left = 384
    Top = 56
  end
end
