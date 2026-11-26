object DtmCmBackImposto: TDtmCmBackImposto
  OldCreateOrder = True
  OnDestroy = DtmImpostoDestroy
  Left = 178
  Top = 161
  Height = 479
  Width = 741
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 34
    Top = 8
  end
  object QrySimulaImposto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  (0) AS IDIMPOSTO,'
      '  (0) AS VALORIMPOSTO,'
      '  (0) AS PERCIMPOSTO,'
      '  (0) AS VALORBASE'
      'FROM'
      '  TIPOAGRE'
      'WHERE'
      '  1=2')
    UpdateObject = UpdSimulaImposto
    ValidateWithMask = True
    Left = 99
    Top = 8
    object QrySimulaImpostoIDIMPOSTO: TFloatField
      FieldName = 'IDIMPOSTO'
    end
    object QrySimulaImpostoVALORIMPOSTO: TFloatField
      FieldName = 'VALORIMPOSTO'
    end
    object QrySimulaImpostoPERCIMPOSTO: TFloatField
      FieldName = 'PERCIMPOSTO'
    end
    object QrySimulaImpostoVALORBASE: TFloatField
      FieldName = 'VALORBASE'
    end
  end
  object UpdSimulaImposto: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOAGRE'
      'set'
      '  IDIMPOSTO = :IDIMPOSTO'
      'where'
      '  IDIMPOSTO = :OLD_IDIMPOSTO')
    InsertSQL.Strings = (
      'insert into TIPOAGRE'
      '  (IDIMPOSTO)'
      'values'
      '  (:IDIMPOSTO)')
    DeleteSQL.Strings = (
      'delete from TIPOAGRE'
      'where'
      '  IDIMPOSTO = :OLD_IDIMPOSTO')
    Left = 99
    Top = 56
  end
  object QryDadosLancImpPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.DESCCUSTAGREG,'
      '  T.CODTIPDOC,'
      '  T.CODTIPRECDES,'
      '  T.RECPAG,'
      '  T.CODCENTRORESPON,'
      '  T.UNIDNEGOC,'
      '  T.IDFORCLI,'
      '  C.CODSUBCONTA AS CODSUBCONTACONTAB,'
      '  C.UNIDNEGOC AS UNIDNEGOCCONTAB,'
      '  C.CODCENTROCUSTO,'
      '  C.PLANO,'
      '  C.PLACONTA,'
      '  E.CONTACFORN AS CONTACLIFOR,'
      '  E.CODCENTROCUSTO AS CCUSTOCLIFOR,'
      '  E.UNIDNEGOC AS UNIDNEGOCCLIFOR,'
      '  E.CODSUBCONTA AS SUBCONTACLIFOR,'
      '  P.RAZAOSOCIAL'
      'FROM'
      '  TIPOAGRE T,'
      '  TIPCUSTAGREGCONTA C,'
      '  EMPRESAFORN E,'
      '  PESSOA P'
      'WHERE'
      '  (T.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG) AND'
      '  (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND'
      '  (T.IDFORCLI = E.IDFORCLI(+)) AND'
      '  (E.IDFORCLI = P.IDPESSOA(+))  AND'
      '  ((E.IDPESSOA = :IDPESSOA) OR (E.IDPESSOA IS NULL))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 172
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODTIPOCUSTAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryDadosLancImpPagDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object QryDadosLancImpPagCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object QryDadosLancImpPagCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object QryDadosLancImpPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object QryDadosLancImpPagCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object QryDadosLancImpPagUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object QryDadosLancImpPagIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDadosLancImpPagCODSUBCONTACONTAB: TFloatField
      FieldName = 'CODSUBCONTACONTAB'
    end
    object QryDadosLancImpPagUNIDNEGOCCONTAB: TFloatField
      FieldName = 'UNIDNEGOCCONTAB'
    end
    object QryDadosLancImpPagCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object QryDadosLancImpPagPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object QryDadosLancImpPagPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object QryDadosLancImpPagCONTACLIFOR: TStringField
      FieldName = 'CONTACLIFOR'
      Size = 18
    end
    object QryDadosLancImpPagCCUSTOCLIFOR: TStringField
      FieldName = 'CCUSTOCLIFOR'
      Size = 10
    end
    object QryDadosLancImpPagUNIDNEGOCCLIFOR: TFloatField
      FieldName = 'UNIDNEGOCCLIFOR'
    end
    object QryDadosLancImpPagSUBCONTACLIFOR: TFloatField
      FieldName = 'SUBCONTACLIFOR'
    end
    object QryDadosLancImpPagRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
  object QryDadosLancImpRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.DESCCUSTAGREG,'
      '  T.CODTIPDOC,'
      '  T.CODTIPRECDES,'
      '  T.RECPAG,'
      '  T.CODCENTRORESPON,'
      '  T.UNIDNEGOC,'
      '  T.IDFORCLI,'
      '  C.CODSUBCONTA AS CODSUBCONTACONTAB,'
      '  C.UNIDNEGOC AS UNIDNEGOCCONTAB,'
      '  C.CODCENTROCUSTO,'
      '  C.PLANO,'
      '  C.PLACONTA,'
      '  E.CONTACCLIENTE AS CONTACLIFOR,'
      '  E.CODCENTROCUSTO AS CCUSTOCLIFOR,'
      '  E.UNIDNEGOC AS UNIDNEGOCCLIFOR,'
      '  E.CODSUBCONTA AS SUBCONTACLIFOR,'
      '  P.RAZAOSOCIAL'
      'FROM'
      '  TIPOAGRE T,'
      '  TIPCUSTAGREGCONTA C,'
      '  EMPRESACLIENTE E,'
      '  PESSOA P'
      'WHERE'
      '  (T.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG) AND'
      '  (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND'
      '  (T.IDFORCLI = E.IDFORCLI(+)) AND'
      '  ((E.IDPESSOA = :IDPESSOA) OR (E.IDPESSOA IS NULL)) AND'
      '  (E.IDFORCLI = P.IDPESSOA(+))'
      ' ')
    ValidateWithMask = True
    Left = 172
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODTIPOCUSTAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryDadosLancImpRecDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object QryDadosLancImpRecCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object QryDadosLancImpRecCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object QryDadosLancImpRecRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object QryDadosLancImpRecCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object QryDadosLancImpRecUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object QryDadosLancImpRecIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDadosLancImpRecCODSUBCONTACONTAB: TFloatField
      FieldName = 'CODSUBCONTACONTAB'
    end
    object QryDadosLancImpRecUNIDNEGOCCONTAB: TFloatField
      FieldName = 'UNIDNEGOCCONTAB'
    end
    object QryDadosLancImpRecCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object QryDadosLancImpRecPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object QryDadosLancImpRecPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object QryDadosLancImpRecCONTACLIFOR: TStringField
      FieldName = 'CONTACLIFOR'
      Size = 18
    end
    object QryDadosLancImpRecCCUSTOCLIFOR: TStringField
      FieldName = 'CCUSTOCLIFOR'
      Size = 10
    end
    object QryDadosLancImpRecUNIDNEGOCCLIFOR: TFloatField
      FieldName = 'UNIDNEGOCCLIFOR'
    end
    object QryDadosLancImpRecSUBCONTACLIFOR: TFloatField
      FieldName = 'SUBCONTACLIFOR'
    end
    object QryDadosLancImpRecRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
  object DsDadosLancImp: TwwDataSource
    DataSet = QryDadosLancImpRec
    Left = 172
    Top = 105
  end
  object QryImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC,' +
        ' T.CODALTERADOR,'
      
        ' T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOI' +
        'MPOSTO,'
      
        ' T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIM' +
        'POSTO, QTOTALPORDESEMB.VALORIMPOSTO AS VALORIMPOSTO,'
      
        ' T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, ('#39'S'#39') FLGCALCULAIMPOST' +
        'O'
      'FROM'
      ' TIPOAGRE T, FORCLIXAGREG F, TIPOALTERADOR TA,'
      ' (SELECT'
      '   SUM(((:VALORLANCADO * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO'
      ' FROM'
      '   (SELECT'
      '      DOC.NUMFATURA,'
      '      LAN.VALOR'
      '   FROM'
      '      DOCUMENTO DOC,'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '     (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      '  (SELECT'
      '    D.NUMFATURA,'
      '    RD.VALOR'
      '   FROM'
      '    RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD'
      '   WHERE'
      '    (D.NUMFATURA IS NOT NULL) AND'
      '    (TRD.FLGCALCULAIMPOSTO = '#39'S'#39') AND'
      '    (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '    (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND'
      '    (RD.RECPAG       = TRD.RECPAG) AND'
      '    (RD.IDPESSOA     = TRD.IDPESSOA)) Q2,'
      '   (SELECT'
      '     D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '    FROM'
      '     LANCTODOCUM L, DOCUMENTO D'
      '    WHERE'
      '     ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.NUMFATURA IS NOT NULL)'
      '    GROUP BY D.NUMFATURA) Q3'
      ' WHERE'
      '   (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '   (Q3.NUMFATURA = Q2.NUMFATURA)) QTOTALPORDESEMB'
      'WHERE'
      ' (F.IDPESSOA = :IDPESSOA)  AND'
      ' (F.IDFORCLI = :IDFORCLI)  AND'
      ' (F.RECPAG = :RECPAG)       AND'
      ' (T.CODALTERADOR = TA.CODALTERADOR(+)) AND'
      ' (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 238
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORLANCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object QryImpostoCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'TIPOAGRE.CODTIPOCUSTAGREG'
    end
    object QryImpostoFLGACUMULA: TStringField
      FieldName = 'FLGACUMULA'
      Origin = 'TIPOAGRE.FLGACUMULA'
      Size = 1
    end
    object QryImpostoVLRABATFIXO: TFloatField
      FieldName = 'VLRABATFIXO'
      Origin = 'TIPOAGRE.VLRABATFIXO'
    end
    object QryImpostoFLGTIPOCALC: TStringField
      FieldName = 'FLGTIPOCALC'
      Origin = 'TIPOAGRE.FLGTIPOCALC'
      Size = 1
    end
    object QryImpostoCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOAGRE.CODALTERADOR'
    end
    object QryImpostoVLRMINIMO: TFloatField
      FieldName = 'VLRMINIMO'
      Origin = 'TIPOAGRE.VLRMINIMO'
    end
    object QryImpostoDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Origin = 'TIPOAGRE.DESCCUSTAGREG'
      Size = 60
    end
    object QryImpostoVALPORDEPENDENTE: TFloatField
      FieldName = 'VALPORDEPENDENTE'
    end
    object QryImpostoLANCAMENTOIMPOSTO: TStringField
      FieldName = 'LANCAMENTOIMPOSTO'
      Size = 1
    end
    object QryImpostoCODTRATFISCD: TStringField
      FieldName = 'CODTRATFISCD'
      Size = 1
    end
    object QryImpostoFLGCALCVALBRUTO: TStringField
      FieldName = 'FLGCALCVALBRUTO'
      Size = 1
    end
    object QryImpostoACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Size = 1
    end
    object QryImpostoFLGLANCAIMPOSTO: TStringField
      FieldName = 'FLGLANCAIMPOSTO'
      Size = 1
    end
    object QryImpostoVALORIMPOSTO: TFloatField
      FieldName = 'VALORIMPOSTO'
    end
    object QryImpostoFLGALTERARETENCAO: TStringField
      FieldName = 'FLGALTERARETENCAO'
      Size = 1
    end
    object QryImpostoFLGSEMPRECALCULA: TStringField
      FieldName = 'FLGSEMPRECALCULA'
      Size = 1
    end
    object QryImpostoFLGCALCULAIMPOSTO: TStringField
      FieldName = 'FLGCALCULAIMPOSTO'
      FixedChar = True
      Size = 1
    end
  end
  object QryFaixaImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' VLRINICIALFAIXA, VLRFINALFAIXA,'
      ' VLRABATVALOR, VLRABATCALC, PERCCUSTAGREG, VLRFIXO, PERCBASE'
      'FROM'
      ' FAIXATIPOAGREG'
      'WHERE'
      ' (CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND'
      ' (VLRINICIALFAIXA <= :PVLRINICIALFAIXA)  AND'
      ' ((VLRFINALFAIXA >= :PVLRINICIALFAIXA) OR (VLRFINALFAIXA = 0))')
    ValidateWithMask = True
    Left = 238
    Top = 105
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODTIPOCUSTAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRINICIALFAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRINICIALFAIXA'
        ParamType = ptUnknown
      end>
    object QryFaixaImpostoVLRINICIALFAIXA: TFloatField
      FieldName = 'VLRINICIALFAIXA'
      Origin = 'FAIXATIPOAGREG.VLRINICIALFAIXA'
    end
    object QryFaixaImpostoVLRFINALFAIXA: TFloatField
      FieldName = 'VLRFINALFAIXA'
      Origin = 'FAIXATIPOAGREG.VLRFINALFAIXA'
    end
    object QryFaixaImpostoVLRABATVALOR: TFloatField
      FieldName = 'VLRABATVALOR'
      Origin = 'FAIXATIPOAGREG.VLRABATVALOR'
    end
    object QryFaixaImpostoVLRABATCALC: TFloatField
      FieldName = 'VLRABATCALC'
      Origin = 'FAIXATIPOAGREG.VLRABATCALC'
    end
    object QryFaixaImpostoPERCCUSTAGREG: TFloatField
      FieldName = 'PERCCUSTAGREG'
      Origin = 'FAIXATIPOAGREG.PERCCUSTAGREG'
    end
    object QryFaixaImpostoVLRFIXO: TFloatField
      FieldName = 'VLRFIXO'
      Origin = 'FAIXATIPOAGREG.VLRFIXO'
    end
    object QryFaixaImpostoPERCBASE: TFloatField
      FieldName = 'PERCBASE'
    end
  end
  object QryBaseMes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VLRBASE) AS VALORBASE, SUM(VLRRETIDO) AS VALORRETIDO'
      'FROM IMPOSTORETIDO'
      'WHERE'
      ' (CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND'
      ' (IDFORCLI = :PIDFORCLI)                 AND'
      ' (IDPESSOA = :PIDPESSOA)                 AND'
      ' (RECPAG   = :PRECPAG)                   AND'
      ' (TO_CHAR(DATARETENCAO,'#39'MM/YYYY'#39') = :PDATARETENCAO)')
    ValidateWithMask = True
    Left = 238
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODTIPOCUSTAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDATARETENCAO'
        ParamType = ptUnknown
      end>
    object QryBaseMesVALORBASE: TFloatField
      FieldName = 'VALORBASE'
    end
    object QryBaseMesVALORRETIDO: TFloatField
      FieldName = 'VALORRETIDO'
    end
  end
  object QryAtuImpostoRetido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO IMPOSTORETIDO'
      ' (IDIMPOSTORETIDO,DATARETENCAO,CODTIPOCUSTAGREG,VLRBASE,'
      
        '  VLRRETIDO,IDFORCLI,IDPESSOA,CODDOCUMENTO,RECPAG,NUMLANCTO,NUML' +
        'ANCTOORIGEM,'
      '  CODDOCLANCADO,NUMLOTE,NUMLOTEMANUAL)'
      'VALUES'
      ' (:PIDIMPOSTORETIDO,:PDATARETENCAO,:PCODTIPOCUSTAGREG,:PVLRBASE,'
      
        '  :PVLRRETIDO,:PIDFORCLI,:PIDPESSOA,:PCODDOCUMENTO,:PRECPAG,:PNU' +
        'MLANCTO,:PNUMLANCTOORIGEM,'
      '  :CODDOCLANCADO,:NUMLOTE,:NUMLOTEMANUAL)'
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 105
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDIMPOSTORETIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATARETENCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCODTIPOCUSTAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRBASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRRETIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PNUMLANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PNUMLANCTOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCLANCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTEMANUAL'
        ParamType = ptUnknown
      end>
  end
  object QryImpParcEngob: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.CODDOCUMENTO,'
      
        '   SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR * -1,L.VA' +
        'LOR), DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1, L.VALOR))) AS VALOR,'
      
        '   SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VLRLIQUIDO * -1' +
        ',L.VLRLIQUIDO), DECODE(L.DEBCRE,'#39'C'#39',L.VLRLIQUIDO * -1,L.VLRLIQUI' +
        'DO)))) AS VLRLIQUIDO'
      'FROM'
      '    DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   (D.OPERACAO = '#39'1'#39') AND'
      
        '   (D.NUMFATURA = (SELECT NUMFATURA FROM DOCUMENTO WHERE CODDOCU' +
        'MENTO = :CODDOCUMENTO)) AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      'GROUP BY'
      '    D.CODDOCUMENTO'
      ''
      '')
    ValidateWithMask = True
    Left = 34
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryImpParcEngobCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryImpParcEngobVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryImpParcEngobVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
  end
  object QryCalculaRateioImp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  ((:VALORLANCADO * QRATEIO.VALOR)/QDOCINI.VALOR) AS VALORIMPOST' +
        'O,'
      '  QRATEIO.CODTIPRECDES'
      'FROM'
      ' (SELECT'
      '    SUM(R.VALOR) AS VALOR, R.CODDOCUMENTO, R.CODTIPRECDES'
      '  FROM'
      '    RATEIODOCUM R,'
      '    TIPORECEBDESEMB TRD'
      '  WHERE'
      '    (R.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '    (R.CODTIPRECDES = TRD.CODTIPRECDES) AND'
      '    (R.RECPAG       = TRD.RECPAG) AND'
      '    (R.IDPESSOA     = TRD.IDPESSOA) AND'
      '    (TRD.FLGCALCULAIMPOSTO = '#39'S'#39')'
      '  GROUP BY'
      '    R.CODDOCUMENTO, R.CODTIPRECDES) QRATEIO,'
      ' (SELECT'
      '    L.VALOR, L.CODDOCUMENTO'
      '  FROM'
      '    DOCUMENTO D, LANCTODOCUM L'
      '  WHERE'
      '    (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO)) QDOCINI'
      'WHERE'
      '  QRATEIO.CODDOCUMENTO = QDOCINI.CODDOCUMENTO')
    ValidateWithMask = True
    Left = 238
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORLANCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryCalculaRateioImpVALORIMPOSTO: TFloatField
      FieldName = 'VALORIMPOSTO'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object QryCalculaRateioImpCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
  end
  object QryCalculaRateioImp3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  SUM(((:VALORLANCADO * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO,'
      '  Q2.CODTIPRECDES'
      'FROM'
      '  (SELECT'
      '     DOC.NUMFATURA,'
      '     LAN.VALOR'
      '  FROM'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN'
      '  WHERE'
      '    (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '    ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '     (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      ' (SELECT'
      '   D.NUMFATURA,'
      '   RD.CODTIPRECDES,'
      '   RD.VALOR'
      '  FROM'
      '   RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD'
      '  WHERE'
      '   (D.NUMFATURA IS NOT NULL) AND'
      '   (TRD.FLGCALCULAIMPOSTO = '#39'S'#39') AND'
      '   (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '   (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND'
      '   (RD.RECPAG       = TRD.RECPAG) AND'
      '   (RD.IDPESSOA     = TRD.IDPESSOA)) Q2,'
      '  (SELECT'
      '    D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '   FROM'
      '    LANCTODOCUM L, DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      'WHERE'
      '  (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '  (Q3.NUMFATURA = Q2.NUMFATURA)'
      'GROUP BY Q2.CODTIPRECDES'
      '')
    ValidateWithMask = True
    Left = 308
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORLANCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryCalculaRateioImp3VALORIMPOSTO: TFloatField
      FieldName = 'VALORIMPOSTO'
    end
    object QryCalculaRateioImp3CODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
  end
  object QryAltNumLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '  IMPOSTORETIDO'
      'SET'
      '  NUMLANCTOORIGEM = :NEWNUMLANCTOORIGEM'
      'WHERE'
      '  IDIMPOSTORETIDO IN'
      '  (SELECT'
      '    I.IDIMPOSTORETIDO'
      '   FROM'
      '    IMPOSTORETIDO I, TIPOAGRE T'
      '   WHERE'
      '    (T.FLGLANCAIMPOSTO = '#39'B'#39')                  AND'
      '    (T.CODTIPOCUSTAGREG  = I.CODTIPOCUSTAGREG) AND'
      '    (I.NUMLANCTOORIGEM = :NUMLANCTOORIGEM))')
    ValidateWithMask = True
    Left = 308
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NEWNUMLANCTOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLANCTOORIGEM'
        ParamType = ptUnknown
      end>
  end
  object QryRateioImposto3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  Q2.DESCTDR, SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALOR,'
      '  Q2.CODTIPRECDES'
      'FROM'
      '  (SELECT'
      '     DOC.NUMFATURA,'
      '     LAN.VALOR'
      '  FROM'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN'
      '  WHERE'
      '    (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '    ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      ' (SELECT'
      '   D.NUMFATURA,'
      '   RD.VALOR,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   TDR.CODTIPRECDES'
      '  FROM'
      '   RATEIODOCUM RD,'
      '   TIPORECEBDESEMB TDR, DOCUMENTO D'
      '  WHERE'
      '   (D.NUMFATURA IS NOT NULL)                    AND'
      '   (D.CODDOCUMENTO        = RD.CODDOCUMENTO)    AND'
      '   (TDR.CODTIPRECDES(+)   = RD.CODTIPRECDES)    AND'
      '   (TDR.RECPAG(+)         = RD.RECPAG)          AND'
      '   (TDR.IDPESSOA(+)       = RD.IDPESSOA)) Q2,'
      '  (SELECT'
      '    D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '   FROM'
      '    LANCTODOCUM L, DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'GROUP BY'
      '   Q2.DESCTDR,'
      '   Q2.CODTIPRECDES'
      ' ')
    ValidateWithMask = True
    Left = 308
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryRateioImposto3DESCTDR: TStringField
      FieldName = 'DESCTDR'
      Size = 35
    end
    object QryRateioImposto3VALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryRateioImposto3CODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
  end
  object QryRateioImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' RD.VALOR AS VALOR,'
      ' TDR.DESCRICAO,'
      ' TDR.CODTIPRECDES'
      'FROM'
      ' RATEIODOCUM RD, TIPORECEBDESEMB TDR'
      'WHERE'
      ' (RD.CODDOCUMENTO = :CODDOCUMENTO)            AND'
      ' (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES)      AND'
      ' (TDR.RECPAG(+)       = RD.RECPAG)            AND'
      ' (TDR.IDPESSOA(+)     = RD.IDPESSOA)          '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 308
    Top = 105
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryRateioImpostoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryRateioImpostoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object QryRateioImpostoCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
  end
  object DsRateio: TwwDataSource
    DataSet = QryCalculaRateioImp
    Left = 308
    Top = 200
  end
  object QryClasFisRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCLASFISCLIFOR FROM CLIENTEPESS WHERE IDPESSOA = :IDPESS' +
        'OA')
    ValidateWithMask = True
    Left = 99
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryClasFisRecIDCLASFISCLIFOR: TFloatField
      FieldName = 'IDCLASFISCLIFOR'
      Origin = '"CM.CLIENTEPESS".IDCLASFISCLIFOR'
    end
  end
  object QryClasFisPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASFISCLIFOR FROM FORNSERV WHERE IDPESSOA =  :IDPESSOA')
    ValidateWithMask = True
    Left = 99
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryClasFisPagIDCLASFISCLIFOR: TFloatField
      FieldName = 'IDCLASFISCLIFOR'
      Origin = '"CM.FORNSERV".IDCLASFISCLIFOR'
    end
  end
  object DsClasFisCliFor: TwwDataSource
    DataSet = QryClasFisPag
    Left = 172
    Top = 200
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
    Left = 172
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
  object QryImpostoPorDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' T.CODTIPOCUSTAGREG, T.FLGCALCVALBRUTO, I.NUMLANCTO'
      'FROM'
      ' TIPOAGRE T, IMPOSTORETIDO I'
      'WHERE'
      ' (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG) AND'
      ' (I.CODDOCUMENTO = :CODDOCUMENTO)'
      ''
      '')
    ValidateWithMask = True
    Left = 99
    Top = 105
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryImpostoPorDocCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
    end
    object QryImpostoPorDocFLGCALCVALBRUTO: TStringField
      FieldName = 'FLGCALCVALBRUTO'
      Size = 1
    end
    object QryImpostoPorDocNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 34
    Top = 56
  end
  object QryLancAcumulaImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO IMPOSTORETIDO'
      
        '  (IDIMPOSTORETIDO,DATARETENCAO,CODTIPOCUSTAGREG,VLRBASE,VLRRETI' +
        'DO,IDFORCLI,IDPESSOA,CODDOCLANCADO,NUMLOTE,RECPAG, NUMLOTEMANUAL' +
        ')'
      'VALUES'
      
        '  (:IDIMPOSTORETIDO,:DATARETENCAO,:CODTIPOCUSTAGREG,:VLRBASE,:VL' +
        'RRETIDO,:IDFORCLI,:IDPESSOA,:CODDOCLANCADO,:NUMLOTE,:RECPAG,:NUM' +
        'LOTEMANUAL)')
    ValidateWithMask = True
    Left = 239
    Top = 202
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDIMPOSTORETIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATARETENCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODTIPOCUSTAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRBASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRRETIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCLANCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTEMANUAL'
        ParamType = ptUnknown
      end>
  end
end
