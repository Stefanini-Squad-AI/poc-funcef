inherited frmExecRecalcAtraso: TfrmExecRecalcAtraso
  Left = 134
  Top = 197
  Caption = 'Recalcula Atraso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inline molContrato1: TmolContrato
      Left = 27
      Top = 24
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 235
  end
  object cdsParc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 24
  end
  object sqlParc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     DECODE(PF.NUMPARCELA,0,NULL,PF.NUMPARCELA) AS NUMPARCELA,'
      '     PF.DATAVENCIMENTO,'
      
        '     DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO) ' +
        'AS VLRPRESTACAO,'
      '     PF.VLRPAGO,'
      '     PF.DATAPAGAMENTO,'
      '     PF.FLGTIPOLANC,'
      '     PF.FLGLANCINTEGRA,'
      '     PF.FLGCONCILIADO,'
      '     PF.DATALIMITE,'
      '     PF.VLRCORRIGIDOATRASO,'
      '     PF.VLRMULTAATRASO,'
      '     PF.VLRMORAATRASO,'
      '     PF.VLRPRESTCORRIG,'
      '     PF.VLRMULTACORRIG,'
      '     PF.VLRJUROSCORRIG,'
      ''
      '     CI.IDCIDADES         AS IDCIDADES,'
      '     CI.IDPAIS            AS IDPAIS,'
      '     CI.CODESTADO         AS CODESTADO,'
      '     CI.FLGTIPODIATOLERA  AS FLGTIPODIATOLERA,'
      '     CI.CONDIASTOLERANCIA AS CONDIASTOLERANCIA,'
      '     CI.CONDIASREPASSE    AS CONDIASREPASSE,'
      '     CI.CONVLRMULTA       AS CONVLRMULTA,'
      '     CI.CONMOEDAMULTA     AS CONMOEDAMULTA,'
      '     CI.CONPERCENTMULTA   AS CONPERCENTMULTA,'
      '     CI.CONVLRMORA        AS CONVLRMORA,'
      '     CI.CONMOEDAMORA      AS CONMOEDAMORA,'
      '     CI.CONPERCENTMORA    AS CONPERCENTMORA,'
      '     CI.FLGMORAPROPORC    AS FLGMORAPROPORC,'
      '     CI.CONPERMORA        AS CONPERMORA,'
      '     CI.IDINDCORRECAO     AS IDINDCORRECAO'
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '      (PF.FLGTIPOLANC IN(2,3,5,6,7,9) )'
      '  AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      
        '  AND ((:IDCONTRATOIMOVEL IS NULL) OR (CP.IDCONTRATOIMOVEL = :ID' +
        'CONTRATOIMOVEL))'
      ''
      'ORDER BY PF.DATAVENCIMENTO, PF.NUMPARCELA'
      ''
      ' ')
    ClientDataSet = cdsParc
    Left = 456
    Top = 80
  end
end
