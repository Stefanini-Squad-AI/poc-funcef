object DtmCompras: TDtmCompras
  OldCreateOrder = True
  OnCreate = DtmComprasCreate
  OnDestroy = DtmComprasDestroy
  Left = 65518
  Top = 85
  Height = 479
  Width = 741
  object qryOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      NUMOC,'
      '      IDFORCLI,'
      '      IDPESSOA,'
      '      OCATENDIDA,'
      '      FLGIMPRESSA,'
      '      FLGCOMSEMOC,'
      '      FLGCOMSEMCOT,'
      '      OBSOC,'
      '      DATAOC,'
      '      IDPROCESSO,'
      '      FLGTIPOFRETE,'
      '      CONTATO,'
      '      (0) AS VALOROC'
      'FROM'
      '      OC'
      'WHERE'
      '      (NUMOC = :pNUMOC)'
      ' ')
    UpdateObject = updOC
    ValidateWithMask = True
    Left = 16
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMOC'
        ParamType = ptUnknown
      end>
    object qryOCNUMOC: TFloatField
      FieldName = 'NUMOC'
      Origin = 'OC.NUMOC'
    end
    object qryOCIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'OC.IDFORCLI'
    end
    object qryOCIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'OC.IDPESSOA'
    end
    object qryOCOCATENDIDA: TStringField
      FieldName = 'OCATENDIDA'
      Origin = 'OC.OCATENDIDA'
      Size = 1
    end
    object qryOCFLGIMPRESSA: TStringField
      FieldName = 'FLGIMPRESSA'
      Origin = 'OC.FLGIMPRESSA'
      Size = 1
    end
    object qryOCFLGCOMSEMOC: TStringField
      FieldName = 'FLGCOMSEMOC'
      Origin = 'OC.FLGCOMSEMOC'
      Size = 1
    end
    object qryOCOBSOC: TStringField
      FieldName = 'OBSOC'
      Origin = 'OC.OBSOC'
      Size = 250
    end
    object qryOCDATAOC: TDateTimeField
      FieldName = 'DATAOC'
      Origin = 'OC.DATAOC'
    end
    object qryOCIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'OC.IDPROCESSO'
    end
    object qryOCFLGCOMSEMCOT: TStringField
      FieldName = 'FLGCOMSEMCOT'
      Size = 1
    end
    object qryOCVALOROC: TFloatField
      FieldName = 'VALOROC'
    end
    object qryOCFLGTIPOFRETE: TFloatField
      FieldName = 'FLGTIPOFRETE'
    end
    object qryOCCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
  end
  object qryItemOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IT.IDITEMOC,'
      '     IT.NUMOC,'
      '     IT.CODARTIGO,'
      '     IT.CODMEDIDA,'
      '     IT.QTDEPEDIDA,'
      '     IT.QTDERECEBIDA,'
      '     IT.VALORUN,'
      '     IT.FLGITEMATENDIDO,'
      '     IT.OBSITEMOC,'
      '     IT.IDPRODVARI,'
      '     IT.IDRESERVAORCAMEN,'
      
        '     SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60) AS DESCRICAO,'
      '     P.CODPRODUTO,'
      '     P.CODGRUPOPROD'
      'FROM'
      '     ITEMOC IT,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     PRODVARI PV'
      'WHERE'
      '       (IT.NUMOC = :pNUMOC)'
      '   AND (IT.CODARTIGO    = A.CODARTIGO)'
      '   AND (A.CODPRODUTO    = P.CODPRODUTO)'
      '   AND (IT.IDPRODVARI   = PV.IDPRODVARI(+))'
      'ORDER BY DESCRICAO'
      ' ')
    UpdateObject = updItemOC
    ValidateWithMask = True
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMOC'
        ParamType = ptUnknown
      end>
    object qryItemOCCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = 'ITEMOC.CODARTIGO'
      Size = 14
    end
    object qryItemOCDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryItemOCQTDEPEDIDA: TFloatField
      DisplayLabel = 'Quant. Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      Origin = 'ITEMOC.QTDEPEDIDA'
      DisplayFormat = '#,##0.00'
    end
    object qryItemOCCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'ITEMOC.CODMEDIDA'
      Size = 4
    end
    object qryItemOCVALORUN: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 10
      FieldName = 'VALORUN'
      Origin = 'ITEMOC.VALORUN'
      DisplayFormat = '#,##0.00'
    end
    object qryItemOCIDITEMOC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMOC'
      Origin = 'ITEMOC.IDITEMOC'
      Visible = False
    end
    object qryItemOCNUMOC: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMOC'
      Origin = 'ITEMOC.NUMOC'
      Visible = False
    end
    object qryItemOCQTDERECEBIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDERECEBIDA'
      Origin = 'ITEMOC.QTDERECEBIDA'
      Visible = False
    end
    object qryItemOCFLGITEMATENDIDO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGITEMATENDIDO'
      Origin = 'ITEMOC.FLGITEMATENDIDO'
      Visible = False
      Size = 1
    end
    object qryItemOCOBSITEMOC: TStringField
      DisplayWidth = 200
      FieldName = 'OBSITEMOC'
      Origin = 'ITEMOC.OBSITEMOC'
      Visible = False
      Size = 200
    end
    object qryItemOCIDPRODVARI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRODVARI'
      Origin = 'ITEMOC.IDPRODVARI'
      Visible = False
    end
    object qryItemOCCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Size = 6
    end
    object qryItemOCIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object qryItemOCCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Size = 10
    end
  end
  object qryPrazoEntOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDITEMOC,'
      '      PARCELAENTREGA,'
      '      PRAZOENTREGA,'
      '      QTDEENTREGA,'
      '      PERIODOPRAZO,'
      '      DATAENTREGA'
      'FROM'
      '      PRAZOENTREGAOC'
      'WHERE'
      '     (IDITEMOC = :pIDITEMOC)')
    UpdateObject = updPrazoEntOC
    ValidateWithMask = True
    Left = 136
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDITEMOC'
        ParamType = ptUnknown
      end>
    object qryPrazoEntOCQTDEENTREGA: TFloatField
      DisplayLabel = 'Qtde. Entrega'
      DisplayWidth = 10
      FieldName = 'QTDEENTREGA'
      Origin = 'PRAZOENTREGAOC.QTDEENTREGA'
    end
    object qryPrazoEntOCPRAZOENTREGA: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOENTREGA'
      Origin = 'PRAZOENTREGAOC.PRAZOENTREGA'
    end
    object qryPrazoEntOCDATAENTREGA: TDateTimeField
      DisplayLabel = 'Data Entrega'
      DisplayWidth = 10
      FieldName = 'DATAENTREGA'
      Origin = 'PRAZOENTREGAOC.DATAENTREGA'
    end
    object qryPrazoEntOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'PRAZOENTREGAOC.IDITEMOC'
      Visible = False
    end
    object qryPrazoEntOCPARCELAENTREGA: TFloatField
      FieldName = 'PARCELAENTREGA'
      Origin = 'PRAZOENTREGAOC.PARCELAENTREGA'
      Visible = False
    end
    object qryPrazoEntOCPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGAOC.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
  end
  object qryPrazoPagOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDITEMOC,'
      '      PARCELAPGTO,'
      '      PRAZOPGTO,'
      '      PERIODOPRAZO,'
      '      PERCPAGTO,'
      '      DATAPAGTO'
      'FROM'
      '      PRAZOPGTOOC'
      'WHERE'
      '     (IDITEMOC = :pIDITEMOC)')
    UpdateObject = updPrazoPagOC
    ValidateWithMask = True
    Left = 216
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDITEMOC'
        ParamType = ptUnknown
      end>
    object qryPrazoPagOCPERCPAGTO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCPAGTO'
      Origin = 'PRAZOPGTOOC.PERCPAGTO'
    end
    object qryPrazoPagOCPRAZOPGTO: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTOOC.PRAZOPGTO'
    end
    object qryPrazoPagOCDATAPAGTO: TDateTimeField
      DisplayLabel = 'Data Pagamento'
      DisplayWidth = 10
      FieldName = 'DATAPAGTO'
      Origin = 'PRAZOPGTOOC.DATAPAGTO'
    end
    object qryPrazoPagOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'PRAZOPGTOOC.IDITEMOC'
      Visible = False
    end
    object qryPrazoPagOCPARCELAPGTO: TFloatField
      FieldName = 'PARCELAPGTO'
      Origin = 'PRAZOPGTOOC.PARCELAPGTO'
      Visible = False
    end
    object qryPrazoPagOCPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTOOC.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
  end
  object qryAgregItemOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      AI.IDITEMOC,'
      '      AI.IDAGREGITEMOC,'
      '      AI.CODTIPOCUSTAGREG,'
      '      AI.ALIQUOTA,'
      '      AI.BASECALCULO,'
      '      AI.VLRAGREGITEM,'
      '      TA.DESCCUSTAGREG'
      'FROM'
      '      AGREGITEMOC AI,'
      '      TIPOAGRE TA'
      'WHERE'
      '     (AI.IDITEMOC = :pIDITEMOC)'
      ' AND (TA.FLGINCIDECOMPRA = '#39'S'#39')'
      ' AND (AI.CODTIPOCUSTAGREG(+) = TA.CODTIPOCUSTAGREG)'
      'ORDER BY TA.DESCCUSTAGREG')
    UpdateObject = updAgregItemOC
    ValidateWithMask = True
    Left = 304
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDITEMOC'
        ParamType = ptUnknown
      end>
    object qryAgregItemOCDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object qryAgregItemOCALIQUOTA: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
      Origin = 'AGREGITEMOC.ALIQUOTA'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregItemOCBASECALCULO: TFloatField
      DisplayLabel = 'Base'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
      Origin = 'AGREGITEMOC.BASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregItemOCVLRAGREGITEM: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAGREGITEM'
      Origin = 'AGREGITEMOC.VLRAGREGITEM'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregItemOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'AGREGITEMOC.IDITEMOC'
      Visible = False
    end
    object qryAgregItemOCIDAGREGITEMOC: TFloatField
      FieldName = 'IDAGREGITEMOC'
      Origin = 'AGREGITEMOC.IDAGREGITEMOC'
      Visible = False
    end
    object qryAgregItemOCCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'AGREGITEMOC.CODTIPOCUSTAGREG'
      Visible = False
    end
  end
  object qryAgregOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDAGREGTOTOC,'
      '      NUMOC,'
      '      CODTIPOCUSTAGREG,'
      '      ALIQUOTA,'
      '      BASECALCULO,'
      '      VLRAGREGTOT'
      'FROM'
      '      AGREGTOTOC'
      'WHERE'
      '     (NUMOC  = :pNUMOC)'
      '')
    UpdateObject = updAgregOC
    ValidateWithMask = True
    Left = 384
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMOC'
        ParamType = ptUnknown
      end>
    object qryAgregOCIDAGREGTOTOC: TFloatField
      FieldName = 'IDAGREGTOTOC'
      Origin = 'AGREGTOTOC.IDAGREGTOTOC'
    end
    object qryAgregOCNUMOC: TFloatField
      FieldName = 'NUMOC'
      Origin = 'AGREGTOTOC.NUMOC'
    end
    object qryAgregOCCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'AGREGTOTOC.CODTIPOCUSTAGREG'
    end
    object qryAgregOCALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'AGREGTOTOC.ALIQUOTA'
    end
    object qryAgregOCBASECALCULO: TFloatField
      FieldName = 'BASECALCULO'
      Origin = 'AGREGTOTOC.BASECALCULO'
    end
    object qryAgregOCVLRAGREGTOT: TFloatField
      FieldName = 'VLRAGREGTOT'
      Origin = 'AGREGTOTOC.VLRAGREGTOT'
    end
  end
  object dsOC: TwwDataSource
    DataSet = qryOC
    Left = 16
    Top = 72
  end
  object dsItemOC: TwwDataSource
    DataSet = qryItemOC
    Left = 72
    Top = 72
  end
  object dsPrazoEntOC: TwwDataSource
    DataSet = qryPrazoEntOC
    Left = 136
    Top = 72
  end
  object dsPrazoPagOC: TwwDataSource
    DataSet = qryPrazoPagOC
    Left = 216
    Top = 72
  end
  object dsAgregItemOC: TwwDataSource
    DataSet = qryAgregItemOC
    Left = 304
    Top = 72
  end
  object dsAgregOC: TwwDataSource
    DataSet = qryAgregOC
    Left = 384
    Top = 72
  end
  object updOC: TUpdateSQL
    ModifySQL.Strings = (
      'update OC'
      'set'
      '  NUMOC = :NUMOC,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDPESSOA = :IDPESSOA,'
      '  OCATENDIDA = :OCATENDIDA,'
      '  FLGIMPRESSA = :FLGIMPRESSA,'
      '  FLGCOMSEMOC = :FLGCOMSEMOC,'
      '  FLGCOMSEMCOT = :FLGCOMSEMCOT,'
      '  OBSOC = :OBSOC,'
      '  DATAOC = :DATAOC,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  FLGTIPOFRETE = :FLGTIPOFRETE,'
      '  CONTATO = :CONTATO'
      'where'
      '  NUMOC = :OLD_NUMOC')
    InsertSQL.Strings = (
      'insert into OC'
      
        '  (NUMOC, IDFORCLI, IDPESSOA, OCATENDIDA, FLGIMPRESSA, FLGCOMSEM' +
        'OC, FLGCOMSEMCOT, '
      '   OBSOC, DATAOC, IDPROCESSO, FLGTIPOFRETE, CONTATO)'
      'values'
      
        '  (:NUMOC, :IDFORCLI, :IDPESSOA, :OCATENDIDA, :FLGIMPRESSA, :FLG' +
        'COMSEMOC, '
      
        '   :FLGCOMSEMCOT, :OBSOC, :DATAOC, :IDPROCESSO, :FLGTIPOFRETE, :' +
        'CONTATO)')
    DeleteSQL.Strings = (
      'delete from OC'
      'where'
      '  NUMOC = :OLD_NUMOC')
    Left = 16
    Top = 120
  end
  object updItemOC: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMOC'
      'set'
      '  IDITEMOC = :IDITEMOC,'
      '  NUMOC = :NUMOC,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  QTDERECEBIDA = :QTDERECEBIDA,'
      '  VALORUN = :VALORUN,'
      '  FLGITEMATENDIDO = :FLGITEMATENDIDO,'
      '  OBSITEMOC = :OBSITEMOC,'
      '  IDPRODVARI = :IDPRODVARI,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC')
    InsertSQL.Strings = (
      'insert into ITEMOC'
      '  (IDITEMOC, NUMOC, CODARTIGO, CODMEDIDA, QTDEPEDIDA, '
      'QTDERECEBIDA, VALORUN, '
      '   FLGITEMATENDIDO, OBSITEMOC, IDPRODVARI, IDRESERVAORCAMEN)'
      'values'
      '  (:IDITEMOC, :NUMOC, :CODARTIGO, :CODMEDIDA, :QTDEPEDIDA, '
      ':QTDERECEBIDA, '
      '   :VALORUN, :FLGITEMATENDIDO, :OBSITEMOC, :IDPRODVARI, '
      ':IDRESERVAORCAMEN)')
    DeleteSQL.Strings = (
      'delete from ITEMOC'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC')
    Left = 72
    Top = 120
  end
  object updPrazoEntOC: TUpdateSQL
    ModifySQL.Strings = (
      'update PRAZOENTREGAOC'
      'set'
      '  IDITEMOC = :IDITEMOC,'
      '  PARCELAENTREGA = :PARCELAENTREGA,'
      '  PRAZOENTREGA = :PRAZOENTREGA,'
      '  QTDEENTREGA = :QTDEENTREGA,'
      '  PERIODOPRAZO = :PERIODOPRAZO,'
      '  DATAENTREGA = :DATAENTREGA'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC and'
      '  PARCELAENTREGA = :OLD_PARCELAENTREGA')
    InsertSQL.Strings = (
      'insert into PRAZOENTREGAOC'
      
        '  (IDITEMOC, PARCELAENTREGA, PRAZOENTREGA, QTDEENTREGA, PERIODOP' +
        'RAZO, DATAENTREGA)'
      'values'
      
        '  (:IDITEMOC, :PARCELAENTREGA, :PRAZOENTREGA, :QTDEENTREGA, :PER' +
        'IODOPRAZO, '
      '   :DATAENTREGA)')
    DeleteSQL.Strings = (
      'delete from PRAZOENTREGAOC'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC and'
      '  PARCELAENTREGA = :OLD_PARCELAENTREGA')
    Left = 136
    Top = 120
  end
  object updPrazoPagOC: TUpdateSQL
    ModifySQL.Strings = (
      'update PRAZOPGTOOC'
      'set'
      '  IDITEMOC = :IDITEMOC,'
      '  PARCELAPGTO = :PARCELAPGTO,'
      '  PRAZOPGTO = :PRAZOPGTO,'
      '  PERIODOPRAZO = :PERIODOPRAZO,'
      '  PERCPAGTO = :PERCPAGTO,'
      '  DATAPAGTO = :DATAPAGTO'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC and'
      '  PARCELAPGTO = :OLD_PARCELAPGTO')
    InsertSQL.Strings = (
      'insert into PRAZOPGTOOC'
      
        '  (IDITEMOC, PARCELAPGTO, PRAZOPGTO, PERIODOPRAZO, PERCPAGTO, DA' +
        'TAPAGTO)'
      'values'
      
        '  (:IDITEMOC, :PARCELAPGTO, :PRAZOPGTO, :PERIODOPRAZO, :PERCPAGT' +
        'O, :DATAPAGTO)')
    DeleteSQL.Strings = (
      'delete from PRAZOPGTOOC'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC and'
      '  PARCELAPGTO = :OLD_PARCELAPGTO')
    Left = 216
    Top = 120
  end
  object updAgregItemOC: TUpdateSQL
    ModifySQL.Strings = (
      'update AGREGITEMOC'
      'set'
      '  IDITEMOC = :IDITEMOC,'
      '  IDAGREGITEMOC = :IDAGREGITEMOC,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  ALIQUOTA = :ALIQUOTA,'
      '  BASECALCULO = :BASECALCULO,'
      '  VLRAGREGITEM = :VLRAGREGITEM'
      'where'
      '  IDAGREGITEMOC = :OLD_IDAGREGITEMOC')
    InsertSQL.Strings = (
      'insert into AGREGITEMOC'
      
        '  (IDITEMOC, IDAGREGITEMOC, CODTIPOCUSTAGREG, ALIQUOTA, BASECALC' +
        'ULO, VLRAGREGITEM)'
      'values'
      
        '  (:IDITEMOC, :IDAGREGITEMOC, :CODTIPOCUSTAGREG, :ALIQUOTA, :BAS' +
        'ECALCULO, '
      '   :VLRAGREGITEM)')
    DeleteSQL.Strings = (
      'delete from AGREGITEMOC'
      'where'
      '  IDAGREGITEMOC = :OLD_IDAGREGITEMOC')
    Left = 304
    Top = 120
  end
  object updAgregOC: TUpdateSQL
    ModifySQL.Strings = (
      'update AGREGTOTOC'
      'set'
      '  IDAGREGTOTOC = :IDAGREGTOTOC,'
      '  NUMOC = :NUMOC,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  ALIQUOTA = :ALIQUOTA,'
      '  BASECALCULO = :BASECALCULO,'
      '  VLRAGREGTOT = :VLRAGREGTOT'
      'where'
      '  IDAGREGTOTOC = :OLD_IDAGREGTOTOC')
    InsertSQL.Strings = (
      'insert into AGREGTOTOC'
      
        '  (IDAGREGTOTOC, NUMOC, CODTIPOCUSTAGREG, ALIQUOTA, BASECALCULO,' +
        ' '
      'VLRAGREGTOT)'
      'values'
      '  (:IDAGREGTOTOC, :NUMOC, :CODTIPOCUSTAGREG, :ALIQUOTA, '
      ':BASECALCULO, :VLRAGREGTOT)')
    DeleteSQL.Strings = (
      'delete from AGREGTOTOC'
      'where'
      '  IDAGREGTOTOC = :OLD_IDAGREGTOTOC')
    Left = 384
    Top = 120
  end
  object qrySCItemOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDITEMOC,'
      '      NUMSOLCOMPRA,'
      '      IDITEMSOLI'
      'FROM'
      '      SCITEMOC'
      'WHERE'
      '     (IDITEMOC = :pIDITEMOC)')
    UpdateObject = updSCItemOC
    ValidateWithMask = True
    Left = 448
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDITEMOC'
        ParamType = ptUnknown
      end>
    object qrySCItemOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'SCITEMOC.IDITEMOC'
    end
    object qrySCItemOCNUMSOLCOMPRA: TFloatField
      FieldName = 'NUMSOLCOMPRA'
      Origin = 'SCITEMOC.NUMSOLCOMPRA'
    end
    object qrySCItemOCIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
      Origin = 'SCITEMOC.IDITEMSOLI'
    end
  end
  object dsSCItemOC: TwwDataSource
    DataSet = qrySCItemOC
    Left = 448
    Top = 72
  end
  object updSCItemOC: TUpdateSQL
    ModifySQL.Strings = (
      'update SCITEMOC'
      'set'
      '  IDITEMOC = :IDITEMOC,'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  IDITEMSOLI = :IDITEMSOLI'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC and'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA and'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into SCITEMOC'
      '  (IDITEMOC, NUMSOLCOMPRA, IDITEMSOLI)'
      'values'
      '  (:IDITEMOC, :NUMSOLCOMPRA, :IDITEMSOLI)')
    DeleteSQL.Strings = (
      'delete from SCITEMOC'
      'where'
      '  IDITEMOC = :OLD_IDITEMOC and'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA and'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 448
    Top = 120
  end
  object qryEndCobEnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      P.NUMDOCUMENTO,'
      '      P.IDIMAGEM,'
      '      EC.LOGRADOURO  AS ENDCOB,'
      '      EC.NUMERO      AS NUMCOB,'
      '      EC.COMPLEMENTO AS COMPLCOB,'
      '      CC.NOME        AS CIDADECOB,'
      '      EC.BAIRRO      AS BAIRROCOB,'
      '      CC.CODESTADO   AS UFCOB,'
      '      EC.CEP         AS CEPCOB,'
      '      TC.DDD         AS DDDCOB,'
      '      TC.NUMERO      AS TELCOB,'
      '      FC.DDD         AS DDDFAXCOB,'
      '      FC.NUMERO      AS FAXCOB,'
      '      EE.LOGRADOURO  AS ENDENT,'
      '      EE.NUMERO      AS NUMENT,'
      '      EE.COMPLEMENTO AS COMPLENT,'
      '      CE.NOME        AS CIDADEENT,'
      '      EE.BAIRRO      AS BAIRROENT,'
      '      CE.CODESTADO   AS UFENT,'
      '      EE.CEP         AS CEPENT,'
      '      TE.DDD         AS DDDENT,'
      '      TE.NUMERO      AS TELENT,'
      '      FE.DDD         AS DDDFAXENT,'
      '      FE.NUMERO      AS FAXENT,'
      '      TD.MASCARA'
      'FROM'
      '      PESSOA P,'
      '      ENDPESS EC,'
      '      ENDPESS EE,'
      '      CIDADES CC,'
      '      CIDADES CE,'
      '      TELENDPESS TC,'
      '      TELENDPESS TE,'
      '      TELENDPESS FC,'
      '      TELENDPESS FE,'
      '      TIPODOCPESSOA TD'
      'WHERE'
      '       (P.IDPESSOA = :IDPESSOA)'
      '   AND (P.IDDOCUMENTO = TD.IDDOCUMENTO(+))'
      '   AND (TC.TIPO(+) LIKE '#39'%C%'#39')'
      '   AND (TE.TIPO(+) LIKE '#39'%C%'#39')'
      '   AND (FC.TIPO(+) LIKE '#39'%F%'#39')'
      '   AND (FE.TIPO(+) LIKE '#39'%F%'#39')'
      '   AND (P.IDENDENTREGA  = EE.IDENDERECO(+))'
      '   AND (P.IDENDCOBRANCA = EC.IDENDERECO(+))'
      '   AND (P.IDENDENTREGA  = TE.IDENDERECO(+))'
      '   AND (P.IDENDCOBRANCA = TC.IDENDERECO(+))'
      '   AND (P.IDENDENTREGA  = FE.IDENDERECO(+))'
      '   AND (P.IDENDCOBRANCA = FC.IDENDERECO(+))'
      '   AND (CE.IDCIDADES(+) = EE.IDCIDADES)'
      '   AND (CC.IDCIDADES(+) = EC.IDCIDADES)'
      ''
      '')
    ValidateWithMask = True
    Left = 24
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEndCobEntNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryEndCobEntENDCOB: TStringField
      FieldName = 'ENDCOB'
      Size = 60
    end
    object qryEndCobEntNUMCOB: TStringField
      FieldName = 'NUMCOB'
      Size = 8
    end
    object qryEndCobEntCOMPLCOB: TStringField
      FieldName = 'COMPLCOB'
    end
    object qryEndCobEntCIDADECOB: TStringField
      FieldName = 'CIDADECOB'
      Size = 50
    end
    object qryEndCobEntBAIRROCOB: TStringField
      FieldName = 'BAIRROCOB'
    end
    object qryEndCobEntUFCOB: TStringField
      FieldName = 'UFCOB'
      Size = 3
    end
    object qryEndCobEntENDENT: TStringField
      FieldName = 'ENDENT'
      Size = 60
    end
    object qryEndCobEntNUMENT: TStringField
      FieldName = 'NUMENT'
      Size = 8
    end
    object qryEndCobEntCOMPLENT: TStringField
      FieldName = 'COMPLENT'
    end
    object qryEndCobEntCIDADEENT: TStringField
      FieldName = 'CIDADEENT'
      Size = 50
    end
    object qryEndCobEntBAIRROENT: TStringField
      FieldName = 'BAIRROENT'
    end
    object qryEndCobEntUFENT: TStringField
      FieldName = 'UFENT'
      Size = 3
    end
    object qryEndCobEntCEPCOB: TStringField
      FieldName = 'CEPCOB'
      Size = 8
    end
    object qryEndCobEntCEPENT: TStringField
      FieldName = 'CEPENT'
      Size = 8
    end
    object qryEndCobEntDDDCOB: TStringField
      FieldName = 'DDDCOB'
      Size = 5
    end
    object qryEndCobEntTELCOB: TStringField
      FieldName = 'TELCOB'
    end
    object qryEndCobEntDDDFAXCOB: TStringField
      FieldName = 'DDDFAXCOB'
      Size = 5
    end
    object qryEndCobEntFAXCOB: TStringField
      FieldName = 'FAXCOB'
    end
    object qryEndCobEntDDDENT: TStringField
      FieldName = 'DDDENT'
      Size = 5
    end
    object qryEndCobEntTELENT: TStringField
      FieldName = 'TELENT'
    end
    object qryEndCobEntDDDFAXENT: TStringField
      FieldName = 'DDDFAXENT'
      Size = 5
    end
    object qryEndCobEntFAXENT: TStringField
      FieldName = 'FAXENT'
    end
    object qryEndCobEntMASCARA: TStringField
      FieldName = 'MASCARA'
      Size = 30
    end
    object qryEndCobEntIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 152
    Top = 208
  end
  object qryDelPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODDOCUMENTO'
      'FROM'
      '    DOCUMENTO'
      'WHERE'
      '       (NODOCUMENTO = :IDNUMOC)'
      '   AND (IDMODULO = 113)'
      '   AND (OPERACAO = '#39'12'#39')'
      '   AND (IDPESSOA = :IDPESSOA)'
      '   AND (RECPAG = '#39'P'#39')')
    ValidateWithMask = True
    Left = 101
    Top = 180
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDNUMOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
