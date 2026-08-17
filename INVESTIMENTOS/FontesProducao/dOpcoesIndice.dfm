object DMOpcoesIndice: TDMOpcoesIndice
  OldCreateOrder = False
  Left = 65526
  Top = 19
  Height = 579
  Width = 808
  object qryBuscaValorCesta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VALOR) AS VALORTOTAL '
      'FROM CESTAOPCIND'
      'WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      '  AND DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)'
      '                      FROM CESTAOPCIND'
      '                      WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      
        '                        AND DATAVIGENCIA <= TO_DATE(:DATAVIGENCI' +
        'A,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 54
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryBuscaValorCestaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
  end
  object qryInsOrdemOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ORDEMOPCIND'
      
        '(IDORDEMOPCIND,DATAORDEM,IDCORRETVALORES,IDBOLETA,IDINVESTIMENTO' +
        ','
      'IDTIPOOPERACAO,IDTIPOINVEST,QUANTIDADE,PREMIO,VALOR,OBSERVACAO,'
      'STATUS,IDUSUARIO,IDPLANPREVCTBPATR,STACONFIRMA,STAAUTORIZA,'
      'IDCESTAOPCIND,IDCARTEIRAGERENC)'
      'VALUES'
      
        '(:IDORDEMOPCIND,:DATAORDEM,:IDCORRETVALORES,:IDBOLETA,:IDINVESTI' +
        'MENTO,'
      
        ':IDTIPOOPERACAO,:IDTIPOINVEST,:QUANTIDADE,:PREMIO,:VALOR,:OBSERV' +
        'ACAO,'
      ':STATUS,:IDUSUARIO,:IDPLANPREVCTBPATR,:STACONFIRMA,:STAAUTORIZA,'
      ':IDCESTAOPCIND,:IDCARTEIRAGERENC)'
      ' ')
    ValidateWithMask = True
    Left = 375
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDORDEMOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAORDEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PREMIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STACONFIRMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STAAUTORIZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
  end
  object qryInsOperOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOOPCIND'
      
        '   (IDOPEROPCIND,IDINVESTIMENTO,DATAOPERACAO,QUANTIDADE,PREMIO,V' +
        'ALOR,'
      
        '    IDCORRETVALORES,IDCARTEIRAINVEST,IDBOLETA,IDTIPOOPERACAO,IDT' +
        'IPOINVEST,'
      '    IDPLANPREVCTBPATR,IDCARTEIRAGERENC,IDLOTE)'
      'VALUES'
      
        '   (:IDOPEROPCIND,:IDINVESTIMENTO,:DATAOPERACAO,:QUANTIDADE,:PRE' +
        'MIO,:VALOR,'
      
        '    :IDCORRETVALORES,:IDCARTEIRAINVEST,:IDBOLETA,:IDTIPOOPERACAO' +
        ',:IDTIPOINVEST,'
      '    :IDPLANPREVCTBPATR,:IDCARTEIRAGERENC,:IDLOTE)')
    ValidateWithMask = True
    Left = 375
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPEROPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PREMIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTOPCIND'
      
        '   (IDHISTOPCIND,IDBOLETA,IDOPEROPCIND,IDINVESTIMENTO,IDCARTEIRA' +
        'INVEST,IDTIPOOPERACAO,'
      
        '    IDTIPOINVEST,DATAHISTOPCIND,HISTORICO,IDPLANPREVCTBPATR,PLNC' +
        'ODIGO,VLRHISTOPCIND,'
      
        '    SLDVLRHISTOPCIND,QTDHISTOPCIND,SLDQTDHISTOPCIND,TIPMOVHISTOP' +
        'CIND,IDLOTE,IDCARTEIRAGERENC,'
      '    FLGCALCULA)'
      'VALUES'
      
        '   (:IDHISTOPCIND,:IDBOLETA,:IDOPEROPCIND,:IDINVESTIMENTO,:IDCAR' +
        'TEIRAINVEST,:IDTIPOOPERACAO,'
      
        '    :IDTIPOINVEST,:DATAHISTOPCIND,:HISTORICO,:IDPLANPREVCTBPATR,' +
        ':PLNCODIGO,:VLRHISTOPCIND,'
      
        '    :SLDVLRHISTOPCIND,:QTDHISTOPCIND,:SLDQTDHISTOPCIND,:TIPMOVHI' +
        'STOPCIND,:IDLOTE,:IDCARTEIRAGERENC,'
      '    :FLGCALCULA)'
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPEROPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SLDVLRHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SLDQTDHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOVHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCALCULA'
        ParamType = ptUnknown
      end>
  end
  object qryInsItemOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ITEMOPCIND'
      '(IDITEMOPCIND,DESITEMOPCIND,IDREGRA)'
      'VALUES'
      '(:IDITEMOPCIND,:DESITEMOPCIND,:IDREGRA)'
      '')
    ValidateWithMask = True
    Left = 377
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESITEMOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptUnknown
      end>
  end
  object qryInsHistOpcIndXItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTOPCINDXITENS'
      
        '(IDHISTOPCIND,IDITEMOPCIND,VLRHISTOPCIND,SLDHISTOPCIND,IDREGRAUS' +
        'ADA)'
      'VALUES'
      
        '(:IDHISTOPCIND,:IDITEMOPCIND,:VLRHISTOPCIND,:SLDHISTOPCIND,:IDRE' +
        'GRAUSADA)')
    ValidateWithMask = True
    Left = 377
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SLDHISTOPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRAUSADA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 382
    Top = 342
  end
  object qryInsDespOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESPOPEROPCIND'
      
        '(IDDESPOPEROPCIND,IDTIPOOPERACAO,IDTIPODESPINVEST,IDOPEROPCIND,V' +
        'LRDESPESA,IDREGRA,IDBOLETA)'
      'VALUES'
      
        '(:IDDESPOPEROPCIND,:IDTIPOOPERACAO,:IDTIPODESPINVEST,:IDOPEROPCI' +
        'ND,:VLRDESPESA,:IDREGRA,:IDBOLETA)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDESPOPEROPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPEROPCIND'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRDESPESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaSaldoHistOpcInd: TwwQuery
    AfterOpen = qryBuscaSaldoHistOpcIndAfterOpen
    AfterScroll = qryBuscaSaldoHistOpcIndAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   H1.IDHISTOPCIND,    H1.IDBOLETA,         H1.IDOPEROPCIND,    ' +
        'H1.IDINVESTIMENTO,'
      
        '   H1.IDCARTEIRAINVEST,H1.IDTIPOOPERACAO,   H1.IDTIPOINVEST,    ' +
        'H1.DATAHISTOPCIND,'
      
        '   H1.HISTORICO,       H1.IDPLANPREVCTBPATR,H1.PLNCODIGO,       ' +
        'H1.VLRHISTOPCIND,'
      
        '   H1.SLDVLRHISTOPCIND,H1.QTDHISTOPCIND,    H1.SLDQTDHISTOPCIND,' +
        'H1.TIPMOVHISTOPCIND,'
      '   H1.IDLOTE,          H1.IDCARTEIRAGERENC, H1.FLGCALCULA,'
      '   IV.DESCINVESTIMENTO,'
      
        '   OC.DTAVENCTO,       OC.VLRPRECOEX,       OC.STATPAMERICANA,  ' +
        'OC.STAOPCCOMPRA,'
      '   OC.TIPCOTVENC,      OC.VLRSTRIKEPUT,     OC.VLRPONTO,'
      
        '   (H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRPRECOEX) AS VLRVEN' +
        'CTO,'
      
        '   (H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRSTRIKEPUT) AS VLRC' +
        'OMPRA,'
      '   (OC.DTAVENCTO - OP.DATAOPERACAO) AS DIASCORRIDOS,'
      
        '   (TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') - OP.DATAOPERACAO) AS DIASATE' +
        'HOJE,'
      '   ROUND((((H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRPRECOEX) -'
      
        '           (H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRSTRIKEPUT)' +
        ')/(OC.DTAVENCTO - OP.DATAOPERACAO)),2) AS AJUSTEDIA,'
      
        '   ROUND(((ROUND((((H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRPR' +
        'ECOEX) -'
      
        '                   (H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRST' +
        'RIKEPUT))/(OC.DTAVENCTO - OP.DATAOPERACAO)),2)) *'
      
        '                   (TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') - OP.DATAOPER' +
        'ACAO)),2) +'
      
        '         ROUND((H1.SLDQTDHISTOPCIND * OC.VLRPONTO * OC.VLRSTRIKE' +
        'PUT),2) AS VLRATEHOJE,'
      '   OP.DATAOPERACAO, OD.IDCESTAOPCIND, OP.IDCORRETVALORES'
      'FROM'
      
        '   HISTOPCIND  H1, INVESTIMENTO IV, OPCOES OC, OPERACAOOPCIND OP' +
        ', ORDEMOPCIND OD'
      'WHERE'
      
        '      (((:IDINVESTIMENTO IS NOT NULL) AND (H1.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR (:IDINVESTIMENTO IS NULL))'
      
        '  AND (((:IDBOLETA IS NOT NULL) AND (H1.IDBOLETA = :IDBOLETA)) O' +
        'R (:IDBOLETA IS NULL))'
      
        '  AND (((:IDLOTE IS NOT NULL) AND (H1.IDLOTE = :IDLOTE)) OR (:ID' +
        'LOTE IS NULL))'
      '  AND (H1.IDHISTOPCIND IN'
      '               (SELECT MAX(H2.IDHISTOPCIND)'
      '                FROM HISTOPCIND H2'
      '                WHERE'
      
        '                      (((:IDINVESTIMENTO IS NOT NULL) AND (H2.ID' +
        'INVESTIMENTO = :IDINVESTIMENTO)) OR (:IDINVESTIMENTO IS NULL))'
      
        '                  AND (((:IDBOLETA IS NOT NULL) AND (H2.IDBOLETA' +
        ' = :IDBOLETA)) OR (:IDBOLETA IS NULL))'
      
        '                  AND (((:IDLOTE IS NOT NULL) AND (H2.IDLOTE = :' +
        'IDLOTE)) OR (:IDLOTE IS NULL))'
      '                  AND (H2.DATAHISTOPCIND IN'
      '                               (SELECT MAX(H3.DATAHISTOPCIND)'
      '                                FROM HISTOPCIND H3'
      '                                WHERE'
      
        '                                      (((:IDINVESTIMENTO IS NOT ' +
        'NULL) AND (H3.IDINVESTIMENTO = :IDINVESTIMENTO)) OR (:IDINVESTIM' +
        'ENTO IS NULL))'
      
        '                                  AND (((:IDBOLETA IS NOT NULL) ' +
        'AND (H3.IDBOLETA = :IDBOLETA)) OR (:IDBOLETA IS NULL))'
      
        '                                  AND (((:IDLOTE IS NOT NULL) AN' +
        'D (H3.IDLOTE = :IDLOTE)) OR (:IDLOTE IS NULL))'
      
        '                                  AND ((H3.DATAHISTOPCIND < TO_D' +
        'ATE(:DATAREF,'#39'DD/MM/YYYY'#39')) OR'
      
        '                                       ((H3.DATAHISTOPCIND = TO_' +
        'DATE(:DATAREF,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                        ((H3.TIPMOVHISTOPCIND <>' +
        ' '#39'OPE'#39') OR (H3.IDTIPOOPERACAO IN (-84,-85,-89,-90) ) )))'
      '                                GROUP BY H3.IDINVESTIMENTO ))'
      '                GROUP BY H2.IDINVESTIMENTO ) )'
      '  AND (H1.SLDQTDHISTOPCIND > 0)'
      '  AND (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (H1.IDINVESTIMENTO = OC.IDINVESTIMENTO)'
      '  AND (H1.IDOPEROPCIND   = OP.IDOPEROPCIND)'
      '  AND (H1.IDBOLETA = OD.IDBOLETA)'
      '  AND (H1.IDINVESTIMENTO = OD.IDINVESTIMENTO)'
      
        'ORDER BY H1.DATAHISTOPCIND, H1.IDBOLETA, H1.IDLOTE, IV.DESCINVES' +
        'TIMENTO'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 54
    Top = 1
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
    object qryBuscaSaldoHistOpcIndIDHISTOPCIND: TFloatField
      FieldName = 'IDHISTOPCIND'
    end
    object qryBuscaSaldoHistOpcIndIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaSaldoHistOpcIndIDOPEROPCIND: TFloatField
      FieldName = 'IDOPEROPCIND'
    end
    object qryBuscaSaldoHistOpcIndIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaSaldoHistOpcIndIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaSaldoHistOpcIndIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryBuscaSaldoHistOpcIndDATAHISTOPCIND: TDateTimeField
      FieldName = 'DATAHISTOPCIND'
    end
    object qryBuscaSaldoHistOpcIndHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object qryBuscaSaldoHistOpcIndIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaSaldoHistOpcIndPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaSaldoHistOpcIndVLRHISTOPCIND: TFloatField
      FieldName = 'VLRHISTOPCIND'
    end
    object qryBuscaSaldoHistOpcIndSLDVLRHISTOPCIND: TFloatField
      FieldName = 'SLDVLRHISTOPCIND'
    end
    object qryBuscaSaldoHistOpcIndQTDHISTOPCIND: TFloatField
      FieldName = 'QTDHISTOPCIND'
    end
    object qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND: TFloatField
      FieldName = 'SLDQTDHISTOPCIND'
    end
    object qryBuscaSaldoHistOpcIndTIPMOVHISTOPCIND: TStringField
      FieldName = 'TIPMOVHISTOPCIND'
      Size = 3
    end
    object qryBuscaSaldoHistOpcIndIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaSaldoHistOpcIndIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaSaldoHistOpcIndFLGCALCULA: TStringField
      FieldName = 'FLGCALCULA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldoHistOpcIndDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaSaldoHistOpcIndDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
    end
    object qryBuscaSaldoHistOpcIndVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
    end
    object qryBuscaSaldoHistOpcIndSTATPAMERICANA: TStringField
      FieldName = 'STATPAMERICANA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldoHistOpcIndSTAOPCCOMPRA: TStringField
      FieldName = 'STAOPCCOMPRA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldoHistOpcIndTIPCOTVENC: TStringField
      FieldName = 'TIPCOTVENC'
      FixedChar = True
      Size = 1
    end
    object qryBuscaSaldoHistOpcIndVLRSTRIKEPUT: TFloatField
      FieldName = 'VLRSTRIKEPUT'
    end
    object qryBuscaSaldoHistOpcIndVLRPONTO: TFloatField
      FieldName = 'VLRPONTO'
    end
    object qryBuscaSaldoHistOpcIndVLRVENCTO: TFloatField
      FieldName = 'VLRVENCTO'
    end
    object qryBuscaSaldoHistOpcIndVLRCOMPRA: TFloatField
      FieldName = 'VLRCOMPRA'
    end
    object qryBuscaSaldoHistOpcIndDIASCORRIDOS: TFloatField
      FieldName = 'DIASCORRIDOS'
    end
    object qryBuscaSaldoHistOpcIndDIASATEHOJE: TFloatField
      FieldName = 'DIASATEHOJE'
    end
    object qryBuscaSaldoHistOpcIndAJUSTEDIA: TFloatField
      FieldName = 'AJUSTEDIA'
    end
    object qryBuscaSaldoHistOpcIndVLRATEHOJE: TFloatField
      FieldName = 'VLRATEHOJE'
    end
    object qryBuscaSaldoHistOpcIndDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaSaldoHistOpcIndIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
    end
    object qryBuscaSaldoHistOpcIndIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
  end
  object qryUpdStatusOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE ORDEMOPCIND SET STATUS=:STATUS'
      'WHERE IDBOLETA = :IDBOLETA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 271
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object qryInsBoletaOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BOLETA'
      
        '(IDBOLETA,STATUS,DATABOLETA,IDFORCLI,PLANO, PLNCODIGO,CODDOCUMEN' +
        'TO,TIPMOVBOLETA)'
      'VALUES'
      
        '(:IDBOLETA,:STATUS,:DATABOLETA,:IDFORCLI,:PLANO,:PLNCODIGO,:CODD' +
        'OCUMENTO,:TIPMOVBOLETA)')
    ValidateWithMask = True
    Left = 377
    Top = 244
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATABOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end>
  end
  object qrySelHistExclusao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OD.IDINVESTIMENTO, OD.IDBOLETA, BO.PLNCODIGO, BO.CODDOCUMENTO'
      'FROM'
      '   ORDEMOPCIND OD, BOLETA BO'
      'WHERE'
      '   (OD.IDBOLETA = :IDBOLETA) AND'
      '   (OD.IDBOLETA = BO.IDBOLETA)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 166
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qrySelHistExclusaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.ORDEMOPCIND.IDINVESTIMENTO'
    end
    object qrySelHistExclusaoIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS."CM.ORDEMOPCIND".IDBOLETA'
      Size = 30
    end
    object qrySelHistExclusaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.BOLETA.PLNCODIGO'
    end
    object qrySelHistExclusaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.BOLETA.CODDOCUMENTO'
    end
  end
  object qrySelOperExclusao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HI.IDHISTOPCIND,HI.IDOPEROPCIND,HI.IDINVESTIMENTO,HI.IDBOLETA'
      'FROM'
      '   HISTOPCIND HI'
      'WHERE'
      '   (HI.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (HI.TIPMOVHISTOPCIND = '#39'OPE'#39') AND'
      '   (HI.DATAHISTOPCIND >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')) AND'
      '   (HI.IDBOLETA = :IDBOLETA)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 166
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qrySelOperExclusaoIDHISTOPCIND: TFloatField
      FieldName = 'IDHISTOPCIND'
    end
    object qrySelOperExclusaoIDOPEROPCIND: TFloatField
      FieldName = 'IDOPEROPCIND'
    end
    object qrySelOperExclusaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qrySelOperExclusaoIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
  end
  object qrySelAtuExclusao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HI.IDHISTOPCIND,HI.IDOPEROPCIND,HI.IDINVESTIMENTO,HI.IDBOLETA' +
        ',HI.PLNCODIGO,'
      '   HI.DATAHISTOPCIND'
      'FROM'
      '   HISTOPCIND HI'
      'WHERE'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (TIPMOVHISTOPCIND = '#39'ATU'#39') AND'
      '   (DATAHISTOPCIND >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')) AND'
      '   (IDBOLETA = :IDBOLETA)'
      'ORDER BY DATAHISTOPCIND DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 166
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qrySelAtuExclusaoIDHISTOPCIND: TFloatField
      FieldName = 'IDHISTOPCIND'
    end
    object qrySelAtuExclusaoIDOPEROPCIND: TFloatField
      FieldName = 'IDOPEROPCIND'
    end
    object qrySelAtuExclusaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qrySelAtuExclusaoIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qrySelAtuExclusaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qrySelAtuExclusaoDATAHISTOPCIND: TDateTimeField
      FieldName = 'DATAHISTOPCIND'
    end
  end
  object qryDelHistOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTOPCIND'
      'WHERE IDHISTOPCIND = :IDHISTOPCIND')
    ValidateWithMask = True
    Left = 480
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptUnknown
      end>
  end
  object qryDelHistOpcIndXItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTOPCINDXITENS'
      'WHERE IDHISTOPCIND = :IDHISTOPCIND')
    ValidateWithMask = True
    Left = 481
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptUnknown
      end>
  end
  object qryDelOperOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERACAOOPCIND'
      'WHERE IDOPEROPCIND = :IDOPEROPCIND')
    ValidateWithMask = True
    Left = 482
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPEROPCIND'
        ParamType = ptUnknown
      end>
  end
  object qryDelBoletaHistOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BOLETA'
      'WHERE IDBOLETA = :IDBOLETA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 482
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object qryItensOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDITEMOPCIND,DESITEMOPCIND, IDREGRA'
      'FROM'
      '   ITEMOPCIND'
      'WHERE'
      
        '   (((:IDITEMOPCIND IS NOT NULL) AND (IDITEMOPCIND = :IDITEMOPCI' +
        'ND)) OR'
      '     (:IDITEMOPCIND IS NULL)) '
      'ORDER BY IDITEMOPCIND DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptResult
      end>
    object qryItensOpcIndIDITEMOPCIND: TFloatField
      FieldName = 'IDITEMOPCIND'
      Origin = 'BASEDADOS."CM.ITEMOPCIND".IDITEMOPCIND'
    end
    object qryItensOpcIndDESITEMOPCIND: TStringField
      FieldName = 'DESITEMOPCIND'
      Origin = 'BASEDADOS."CM.ITEMOPCIND".DESITEMOPCIND'
      Size = 60
    end
    object qryItensOpcIndIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.ITEMOPCIND.IDREGRA'
    end
  end
  object QryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTO WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 483
    Top = 245
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 483
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryRateioDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 484
    Top = 386
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object FloatField121: TFloatField
      FieldName = 'IDPARAMINVEST'
      Origin = 'PARAMINVEST.IDPARAMINVEST'
    end
    object StringField32: TStringField
      FieldName = 'MASCSETOREMISSOR'
      Origin = 'PARAMINVEST.MASCSETOREMISSOR'
      Size = 15
    end
    object FloatField122: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'PARAMINVEST.MOECODIGO'
    end
    object StringField33: TStringField
      FieldName = 'MASCCLASSIFINV'
      Origin = 'PARAMINVEST.MASCCLASSIFINV'
      Size = 15
    end
    object FloatField123: TFloatField
      FieldName = 'VLRDIVERG'
      Origin = 'PARAMINVEST.VLRDIVERG'
    end
    object FloatField124: TFloatField
      FieldName = 'VLRCOTAINICART'
      Origin = 'PARAMINVEST.VLRCOTAINICART'
    end
    object DateTimeField15: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'PARAMINVEST.DATAULTFECH'
    end
    object StringField34: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'PARAMINVEST.FLGORDMOVINV'
      Size = 1
    end
    object FloatField125: TFloatField
      FieldName = 'PERCPUORDMOVINV'
      Origin = 'PARAMINVEST.PERCPUORDMOVINV'
    end
    object FloatField126: TFloatField
      FieldName = 'PERCIMPRENDA'
      Origin = 'PARAMINVEST.PERCIMPRENDA'
    end
    object FloatField127: TFloatField
      FieldName = 'MOEDAATU'
      Origin = 'PARAMINVEST.MOEDAATU'
    end
    object FloatField128: TFloatField
      FieldName = 'PERCPARTICEMPR'
      Origin = 'PARAMINVEST.PERCPARTICEMPR'
    end
    object FloatField129: TFloatField
      FieldName = 'PERCPARTICRECUR'
      Origin = 'PARAMINVEST.PERCPARTICRECUR'
    end
    object FloatField130: TFloatField
      FieldName = 'IDPARAMPATRLIQ'
      Origin = 'PARAMINVEST.IDPARAMPATRLIQ'
    end
    object StringField35: TStringField
      FieldName = 'TIPOMENU'
      Origin = 'PARAMINVEST.TIPOMENU'
      Size = 1
    end
    object DateTimeField16: TDateTimeField
      FieldName = 'DATAULTFECHRF'
      Origin = 'PARAMINVEST.DATAULTFECHRF'
    end
    object FloatField131: TFloatField
      FieldName = 'IDTIPODESPIRAPU'
      Origin = 'PARAMINVEST.IDTIPODESPIRAPU'
    end
    object FloatField132: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PARAMINVEST.IDTIPODESPINVEST'
    end
    object FloatField133: TFloatField
      FieldName = 'MOEDAGER'
      Origin = 'PARAMINVEST.MOEDAGER'
    end
    object StringField36: TStringField
      FieldName = 'FLGPROVISIONAIRRF'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRF'
      Size = 1
    end
    object StringField37: TStringField
      FieldName = 'FLGPROVISIONAIRRV'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRV'
      Size = 1
    end
    object FloatField134: TFloatField
      FieldName = 'PUCDB'
      Origin = 'PARAMINVEST.PUCDB'
    end
    object DateTimeField17: TDateTimeField
      FieldName = 'DATAMOVCDBLIB'
      Origin = 'PARAMINVEST.DATAMOVCDBLIB'
    end
    object FloatField135: TFloatField
      FieldName = 'IDTIPODESPIRPROV'
      Origin = 'PARAMINVEST.IDTIPODESPIRPROV'
    end
    object FloatField136: TFloatField
      FieldName = 'MOEDAATULIT'
      Origin = 'PARAMINVEST.MOEDAATULIT'
    end
    object FloatField137: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'PARAMINVEST.IDPROGRAMA'
    end
    object FloatField138: TFloatField
      FieldName = 'IDTIPOCLIENTECOR'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOCLIENTECOR'
    end
    object FloatField139: TFloatField
      FieldName = 'IDTIPOOPERDIRINC'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRINC'
    end
    object FloatField140: TFloatField
      FieldName = 'IDTIPOOPERDIRCIS'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRCIS'
    end
    object FloatField141: TFloatField
      FieldName = 'IDTIPOOPERDIRDES'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRDES'
    end
    object FloatField142: TFloatField
      FieldName = 'IDTIPOOPERDIRGRU'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRGRU'
    end
    object FloatField143: TFloatField
      FieldName = 'IDTIPOOPERDIRPER'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRPER'
    end
    object FloatField144: TFloatField
      FieldName = 'IDTIPOOPERDIRBON'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRBON'
    end
    object FloatField145: TFloatField
      FieldName = 'IDTIPOOPERDIRDIV'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRDIV'
    end
    object FloatField146: TFloatField
      FieldName = 'IDTIPOOPERDIRSUB'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRSUB'
    end
    object FloatField147: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOINVEST'
    end
    object FloatField148: TFloatField
      FieldName = 'IDTIPOOPERDIRJUR'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRJUR'
    end
    object FloatField149: TFloatField
      FieldName = 'IDTIPOCLIENTEEMI'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOCLIENTEEMI'
    end
    object FloatField150: TFloatField
      FieldName = 'IDTIPOCLIENTECUS'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOCLIENTECUS'
    end
    object FloatField151: TFloatField
      FieldName = 'IDTIPOCONTRRF'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOCONTRRF'
    end
    object FloatField152: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOINVESTIDOR'
    end
    object FloatField153: TFloatField
      FieldName = 'IDBVSP'
      Origin = 'BASEDADOS.PARAMINVEST.IDBVSP'
    end
    object FloatField154: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.PARAMINVEST.IDMERCADO'
    end
    object FloatField155: TFloatField
      FieldName = 'IDTIPOOPERLIQPEND'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERLIQPEND'
    end
    object FloatField156: TFloatField
      FieldName = 'IDBMF'
      Origin = 'BASEDADOS.PARAMINVEST.IDBMF'
    end
    object FloatField157: TFloatField
      FieldName = 'IDTIPOCONTRFIN'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOCONTRFIN'
    end
    object DateTimeField18: TDateTimeField
      FieldName = 'DATAULTFECHFDO'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTFECHFDO'
    end
    object DateTimeField19: TDateTimeField
      FieldName = 'DATAULTFECHBMF'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTFECHBMF'
    end
    object FloatField158: TFloatField
      FieldName = 'IDTPPERIODICIDADE'
      Origin = 'BASEDADOS.PARAMINVEST.IDTPPERIODICIDADE'
    end
    object DateTimeField20: TDateTimeField
      FieldName = 'DATAULTIMPCOT'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTIMPCOT'
    end
    object FloatField159: TFloatField
      FieldName = 'IDTIPOOPERDIRALT'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRALT'
    end
    object FloatField160: TFloatField
      FieldName = 'IDRAMOFORCOR'
      Origin = 'BASEDADOS.PARAMINVEST.IDRAMOFORCOR'
    end
    object FloatField161: TFloatField
      FieldName = 'IDRAMOFOREMI'
      Origin = 'BASEDADOS.PARAMINVEST.IDRAMOFOREMI'
    end
    object FloatField162: TFloatField
      FieldName = 'IDRAMOFORCUS'
      Origin = 'BASEDADOS.PARAMINVEST.IDRAMOFORCUS'
    end
    object StringField38: TStringField
      FieldName = 'FLGLIBERAIDLOTE'
      Origin = 'BASEDADOS.PARAMINVEST.FLGLIBERAIDLOTE'
      FixedChar = True
      Size = 1
    end
    object FloatField163: TFloatField
      FieldName = 'IDTIPOOPERDIRRES'
    end
    object DateTimeField21: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.PARAMINVEST.TRGDTINCLUSAO'
    end
    object StringField39: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.PARAMINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object StringField40: TStringField
      FieldName = 'FLGUSASUBCONTA'
      Origin = 'BASEDADOS.PARAMINVEST.FLGUSASUBCONTA'
      FixedChar = True
      Size = 1
    end
    object FloatField164: TFloatField
      FieldName = 'PERCDEVRV'
      Origin = 'BASEDADOS.PARAMINVEST.PERCDEVRV'
    end
    object FloatField165: TFloatField
      FieldName = 'PERCDEVBMF'
      Origin = 'BASEDADOS.PARAMINVEST.PERCDEVBMF'
    end
    object StringField41: TStringField
      FieldName = 'DIASEMANACPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DIASEMANACPMF'
      Size = 7
    end
    object FloatField166: TFloatField
      FieldName = 'DIASUTEISCPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DIASUTEISCPMF'
    end
    object FloatField167: TFloatField
      FieldName = 'IDCUSTODIARENFIX'
      Origin = 'BASEDADOS.PARAMINVEST.IDCUSTODIARENFIX'
    end
    object FloatField168: TFloatField
      FieldName = 'IDTIPOREGRARV'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRARV'
    end
    object FloatField169: TFloatField
      FieldName = 'IDTIPOREGRARF'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRARF'
    end
    object FloatField170: TFloatField
      FieldName = 'IDTIPOREGRABMF'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRABMF'
    end
    object StringField42: TStringField
      FieldName = 'FLGIMPLANTRF'
      FixedChar = True
      Size = 1
    end
    object StringField43: TStringField
      FieldName = 'FLGCONTABILIZA'
      FixedChar = True
      Size = 1
    end
    object StringField44: TStringField
      FieldName = 'FLGINTCAPCAR'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCAPCAR'
      FixedChar = True
      Size = 1
    end
    object FloatField171: TFloatField
      FieldName = 'IDCONTRAPARTERF'
      Origin = 'BASEDADOS.PARAMINVEST.IDCONTRAPARTERF'
    end
    object FloatField172: TFloatField
      FieldName = 'IDAUTORIZAORDEM'
      Origin = 'BASEDADOS.PARAMINVEST.IDAUTORIZAORDEM'
    end
    object FloatField173: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.PARAMINVEST.IDCLASSETIT'
    end
    object StringField45: TStringField
      FieldName = 'FLGEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMPACOES'
      FixedChar = True
      Size = 1
    end
    object FloatField174: TFloatField
      FieldName = 'IDCARTEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTEMPACOES'
    end
    object FloatField175: TFloatField
      FieldName = 'IDREGRAEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.IDREGRAEMPACOES'
    end
    object FloatField176: TFloatField
      FieldName = 'IDMOTBLOQEMPAC'
      Origin = 'BASEDADOS.PARAMINVEST.IDMOTBLOQEMPAC'
    end
    object StringField46: TStringField
      FieldName = 'FLGCARTGERENC'
      Origin = 'BASEDADOS.PARAMINVEST.FLGCARTGERENC'
      FixedChar = True
      Size = 1
    end
    object FloatField177: TFloatField
      FieldName = 'IDINDEXPOUPANCA'
      Origin = 'BASEDADOS.PARAMINVEST.IDINDEXPOUPANCA'
    end
    object FloatField178: TFloatField
      FieldName = 'JUROSPOUPANCA'
      Origin = 'BASEDADOS.PARAMINVEST.JUROSPOUPANCA'
    end
  end
  object QryPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PLANILHA WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 483
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryLotexDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'DELETE FROM LOTEXDOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO AND FLG' +
        'BAIXA = '#39'C'#39' ')
    ValidateWithMask = True
    Left = 484
    Top = 433
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DOCUMENTO WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 483
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryRecbtoPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RECBTOPAGTO WHERE CODDOCUMENTO =:CODDOCUMENTO')
    ValidateWithMask = True
    Left = 164
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaOperacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OC.IDORDEMOPCIND,OC.DATAORDEM,OC.IDCORRETVALORES,OC.IDBOLETA,' +
        'OC.IDINVESTIMENTO,'
      
        '   OC.IDTIPOOPERACAO,OC.IDTIPOINVEST,OC.QUANTIDADE,OC.PREMIO,OC.' +
        'VALOR,'
      
        '   OC.OBSERVACAO,OC.STATUS,OC.IDUSUARIO,OC.IDPLANPREVCTBPATR,OC.' +
        'STACONFIRMA,OC.STAAUTORIZA,'
      
        '   OC.IDCARTEIRAINVEST,OC.IDCARTEIRAGERENC,OC.IDLOTE,OC.IDCESTAO' +
        'PCIND,'
      '   IV.DESCINVESTIMENTO, CI.DESCCARTINVEST, CV.SGLCORRETVALORES,'
      
        '   TP.DESCTIPOOPERACAO,TP.VENCIMENTO,TP.NATUREZAOPERACAO,TP.CODT' +
        'IPDOC,'
      
        '   OP.DTAVENCTO,OP.VLRPRECOEX,OP.STATPAMERICANA,OP.STAOPCCOMPRA,' +
        'OP.TIPCOTVENC,'
      '   OP.VLRSTRIKEPUT,OP.VLRPONTO,'
      
        '   X.TOTALORDEM, OO.IDOPEROPCIND, BL.PLNCODIGO, BL.CODDOCUMENTO,' +
        ' BL.PLANO'
      'FROM'
      
        '   ORDEMOPCIND OC, INVESTIMENTO IV, TIPOOPERACAO TP, OPCOES OP, ' +
        'CARTEIRAINVEST CI,'
      '   CORRETVALORES CV, OPERACAOOPCIND OO, BOLETA BL,'
      '   (SELECT'
      
        '       SUM(DECODE(TI.NATUREZAOPERACAO,'#39'A'#39',OD.VALOR*-1,OD.VALOR))' +
        ' AS TOTALORDEM, IDCORRETVALORES'
      '    FROM'
      '       ORDEMOPCIND OD, TIPOOPERACAO TI'
      '    WHERE'
      '       (OD.DATAORDEM = TO_DATE(:DATAORDEM,'#39'DD/MM/YYYY'#39')) AND'
      
        '       (((:IDCORRETVALORES IS NOT NULL) AND (OD.IDCORRETVALORES ' +
        '= :IDCORRETVALORES)) OR'
      '         (:IDCORRETVALORES IS NULL)) AND'
      
        '       (((:IDBOLETA IS NOT NULL) AND (OD.IDBOLETA = :IDBOLETA)) ' +
        'OR'
      '         (:IDBOLETA IS NULL)) AND'
      '       (((:IDLOTE IS NOT NULL) AND (OD.IDLOTE = :IDLOTE)) OR'
      '         (:IDLOTE IS NULL)) AND'
      '       (TI.NATUREZAOPERACAO <> '#39'E'#39') AND'
      '       (OD.IDTIPOOPERACAO = TI.IDTIPOOPERACAO)'
      '    GROUP BY IDCORRETVALORES) X'
      'WHERE'
      '   (OC.DATAORDEM = TO_DATE(:DATAORDEM,'#39'DD/MM/YYYY'#39')) AND'
      
        '   (((:IDCORRETVALORES IS NOT NULL) AND (OC.IDCORRETVALORES = :I' +
        'DCORRETVALORES)) OR'
      '     (:IDCORRETVALORES IS NULL)) AND'
      '   (((:IDBOLETA IS NOT NULL) AND (OC.IDBOLETA = :IDBOLETA)) OR'
      '     (:IDBOLETA IS NULL)) AND'
      '   (((:IDLOTE IS NOT NULL) AND (OC.IDLOTE = :IDLOTE)) OR'
      '     (:IDLOTE IS NULL)) AND'
      '   (OC.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (OC.IDINVESTIMENTO = OP.IDINVESTIMENTO) AND'
      '   (CI.IDCARTEIRAINVEST = OC.IDCARTEIRAINVEST) AND'
      '   (CV.IDCORRETVALORES  = OC.IDCORRETVALORES)  AND'
      '   (OC.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (OC.IDCORRETVALORES = X.IDCORRETVALORES) AND'
      '   (OC.IDINVESTIMENTO = OO.IDINVESTIMENTO(+)) AND'
      '   (OC.IDBOLETA = BL.IDBOLETA(+))'
      'ORDER BY IDBOLETA, IDLOTE, IDTIPOOPERACAO'
      '')
    UpdateObject = updBuscaOperacoes
    ValidateWithMask = True
    Left = 38
    Top = 385
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDEM'
        ParamType = ptUnknown
        Value = '05/06/2003'
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
        Value = '305649'
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAORDEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end>
    object qryBuscaOperacoesIDORDEMOPCIND: TFloatField
      FieldName = 'IDORDEMOPCIND'
    end
    object qryBuscaOperacoesDATAORDEM: TDateTimeField
      FieldName = 'DATAORDEM'
    end
    object qryBuscaOperacoesIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaOperacoesIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaOperacoesIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaOperacoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaOperacoesIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryBuscaOperacoesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,##0'
    end
    object qryBuscaOperacoesPREMIO: TFloatField
      FieldName = 'PREMIO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaOperacoesVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaOperacoesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryBuscaOperacoesSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object qryBuscaOperacoesIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaOperacoesSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesSTAAUTORIZA: TStringField
      FieldName = 'STAAUTORIZA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaOperacoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaOperacoesDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
    end
    object qryBuscaOperacoesVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaOperacoesSTATPAMERICANA: TStringField
      FieldName = 'STATPAMERICANA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesSTAOPCCOMPRA: TStringField
      FieldName = 'STAOPCCOMPRA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesTIPCOTVENC: TStringField
      FieldName = 'TIPCOTVENC'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesVLRSTRIKEPUT: TFloatField
      FieldName = 'VLRSTRIKEPUT'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaOperacoesVLRPONTO: TFloatField
      FieldName = 'VLRPONTO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaOperacoesVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object qryBuscaOperacoesTOTALORDEM: TFloatField
      FieldName = 'TOTALORDEM'
    end
    object qryBuscaOperacoesNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaOperacoesIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaOperacoesIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
    end
    object qryBuscaOperacoesCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryBuscaOperacoesDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBuscaOperacoesSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object qryBuscaOperacoesIDOPEROPCIND: TFloatField
      FieldName = 'IDOPEROPCIND'
    end
    object qryBuscaOperacoesPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaOperacoesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBuscaOperacoesPLANO: TFloatField
      FieldName = 'PLANO'
    end
  end
  object updBuscaOperacoes: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ORDEMOPCIND'
      'SET VALOR = :VALOR'
      'WHERE IDORDEMOPCIND = :IDORDEMOPCIND'
      ' ')
    Left = 54
    Top = 398
  end
  object dsBuscaOperacoes: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaOperacoes
    Left = 67
    Top = 409
  end
  object qryBuscaBoletaOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DP.IDDESPOPEROPCIND,DP.IDTIPOOPERACAO,DP.IDTIPODESPINVEST,'
      '   DP.IDOPEROPCIND,DP.VLRDESPESA,DP.IDREGRA,DP.IDBOLETA,'
      '   TP.DESCTIPODESPINV'
      'FROM'
      '   DESPOPEROPCIND DP, TIPODESPINVEST TP'
      'WHERE'
      '   (IDBOLETA = :IDBOLETA) AND'
      '   (DP.IDTIPODESPINVEST = TP.IDTIPODESPINVEST(+))'
      ' '
      ' ')
    UpdateObject = UpdBuscaBoletaOper
    ValidateWithMask = True
    Left = 41
    Top = 311
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qryBuscaBoletaOperIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.DESPOPEROPCIND.IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletaOperIDDESPOPEROPCIND: TFloatField
      FieldName = 'IDDESPOPEROPCIND'
      Origin = 'BASEDADOS.DESPOPEROPCIND.IDDESPOPEROPCIND'
    end
    object qryBuscaBoletaOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.DESPOPEROPCIND.IDTIPOOPERACAO'
    end
    object qryBuscaBoletaOperIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'BASEDADOS.DESPOPEROPCIND.IDTIPODESPINVEST'
    end
    object qryBuscaBoletaOperIDOPEROPCIND: TFloatField
      FieldName = 'IDOPEROPCIND'
      Origin = 'BASEDADOS.DESPOPEROPCIND.IDOPEROPCIND'
    end
    object qryBuscaBoletaOperVLRDESPESA: TFloatField
      FieldName = 'VLRDESPESA'
      Origin = 'BASEDADOS.DESPOPEROPCIND.VLRDESPESA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaBoletaOperIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.DESPOPEROPCIND.IDREGRA'
    end
    object qryBuscaBoletaOperDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
  end
  object dsBuscaBoletaOper: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaBoletaOper
    Left = 54
    Top = 323
  end
  object UpdBuscaBoletaOper: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DESPOPEROPCIND'
      'SET VLRDESPESA = :VLRDESPESA'
      'WHERE IDBOLETA = :IDBOLETA')
    Left = 71
    Top = 337
  end
  object qryNumDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLETA'
      'FROM ORDEMOPCIND'
      'WHERE DATAORDEM = TO_DATE(:DATAORDEM,'#39'DD/MM/YYYY'#39') AND'
      '      IDCORRETVALORES = :IDCORRETVALORES AND'
      '      IDBOLETA IS NOT NULL'
      'GROUP BY IDBOLETA')
    ValidateWithMask = True
    Left = 164
    Top = 341
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end>
    object qryNumDocumentoIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
  end
  object qryVlrMaxCesta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.VLRSTRIKEPUT, OD.QUANTIDADE, OP.VLRPONTO,'
      '   (OP.VLRPRECOEX * OD.QUANTIDADE * OP.VLRPONTO) AS VALMAX'
      'FROM ORDEMOPCIND OD, OPCOES OP'
      'WHERE OD.IDORDEMOPCIND = :IDORDEMOPCIND'
      '  AND OD.IDINVESTIMENTO = OP.IDINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 165
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDORDEMOPCIND'
        ParamType = ptResult
      end>
    object qryVlrMaxCestaVLRSTRIKEPUT: TFloatField
      FieldName = 'VLRSTRIKEPUT'
      Origin = 'BASEDADOS."CM.OPCOES".VLRSTRIKEPUT'
    end
    object qryVlrMaxCestaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS."CM.ORDEMOPCIND".QUANTIDADE'
    end
    object qryVlrMaxCestaVLRPONTO: TFloatField
      FieldName = 'VLRPONTO'
      Origin = 'BASEDADOS."CM.OPCOES".VLRPONTO'
    end
    object qryVlrMaxCestaVALMAX: TFloatField
      FieldName = 'VALMAX'
      Origin = 'BASEDADOS."CM.OPCOES".VLRSTRIKEPUT'
    end
  end
  object qryBuscaCestaOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CE.IDINVESTIMENTO,CE.QUANTIDADE,CE.IDCUSTODIANTE,CE.IDCARTEIR' +
        'AINVEST,CE.IDCARTEIRAGERENC,'
      '   IV.IDEMISSOR, IV.DESCINVESTIMENTO'
      'FROM'
      '   CESTAOPCIND CE, INVESTIMENTO IV'
      'WHERE'
      '   (IDCESTAOPCIND = :IDCESTAOPCIND)  AND'
      '   (DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)'
      '                      FROM CESTAOPCIND'
      '                      WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      
        '                        AND DATAVIGENCIA <= TO_DATE(:DATAVIGENCI' +
        'A,'#39'DD/MM/YYYY'#39'))) AND'
      '   (CE.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 53
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryBuscaCestaOpcIndIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaCestaOpcIndQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryBuscaCestaOpcIndIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaCestaOpcIndIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaCestaOpcIndIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaCestaOpcIndIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaCestaOpcIndDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
  end
  object qryBuscaTRCCesta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERCUSTODIA,IDHISTCARTINVDEST,IDHISTCARTINVORIG'
      'FROM   OPERCUSTODIA OP, ORDEMOPCIND OD, CESTAOPCIND CO'
      'WHERE  OD.IDBOLETA = :IDBOLETA'
      '  AND  OD.IDCESTAOPCIND = CO.IDCESTAOPCIND'
      '  AND  OD.DATAORDEM = CO.DATAVIGENCIA'
      '  AND  CO.IDBOLETA = OP.IDBOLETA'
      
        'GROUP BY OP.IDOPERCUSTODIA, OP.IDHISTCARTINVDEST, OP.IDHISTCARTI' +
        'NVORIG'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 52
    Top = 242
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qryBuscaTRCCestaIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDOPERCUSTODIA'
    end
    object qryBuscaTRCCestaIDHISTCARTINVDEST: TFloatField
      FieldName = 'IDHISTCARTINVDEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDHISTCARTINVDEST'
    end
    object qryBuscaTRCCestaIDHISTCARTINVORIG: TFloatField
      FieldName = 'IDHISTCARTINVORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDHISTCARTINVORIG'
    end
  end
  object qryUpdStatusBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET STATUS=:STATUS,'
      '        TIPMOVBOLETA = :TIPMOVBOLETA,'
      '        PLANO = :PLANO,'
      '        PLNCODIGO = :PLNCODIGO,'
      '        CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE IDBOLETA = :IDBOLETA'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 54
    ParamData = <
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
  end
  object qryBuscaSaldoHistXItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDHISTOPCIND,IDITEMOPCIND,VLRHISTOPCIND,SLDHISTOPCIND,IDREGRA' +
        'USADA'
      'FROM'
      '   HISTOPCINDXITENS'
      'WHERE'
      '   IDHISTOPCIND = :IDHISTOPCIND'
      'ORDER BY IDITEMOPCIND DESC')
    ValidateWithMask = True
    Left = 54
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptResult
      end>
    object qryBuscaSaldoHistXItensIDHISTOPCIND: TFloatField
      FieldName = 'IDHISTOPCIND'
      Origin = 'BASEDADOS.HISTOPCINDXITENS.IDHISTOPCIND'
    end
    object qryBuscaSaldoHistXItensIDITEMOPCIND: TFloatField
      FieldName = 'IDITEMOPCIND'
      Origin = 'BASEDADOS.HISTOPCINDXITENS.IDITEMOPCIND'
    end
    object qryBuscaSaldoHistXItensVLRHISTOPCIND: TFloatField
      FieldName = 'VLRHISTOPCIND'
      Origin = 'BASEDADOS.HISTOPCINDXITENS.VLRHISTOPCIND'
    end
    object qryBuscaSaldoHistXItensSLDHISTOPCIND: TFloatField
      FieldName = 'SLDHISTOPCIND'
      Origin = 'BASEDADOS.HISTOPCINDXITENS.SLDHISTOPCIND'
    end
    object qryBuscaSaldoHistXItensIDREGRAUSADA: TFloatField
      FieldName = 'IDREGRAUSADA'
      Origin = 'BASEDADOS.HISTOPCINDXITENS.IDREGRAUSADA'
    end
  end
  object qryVerificaCestaInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM CESTAOPCIND'
      'WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      '  AND DATAVIGENCIA = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '  AND IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      
        '  AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (IDCARTEIRAGERENC = ' +
        ':IDCARTEIRAGERENC)) OR'
      '        (:IDCARTEIRAGERENC IS NULL))'
      '  AND IDCUSTODIANTE = :IDCUSTODIANTE'
      '  AND IDINVESTIMENTO = :IDINVESTIMENTO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 291
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
  object qryBuscaVlrAtuCesta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VALOR) AS SALDOCESTA'
      'FROM (SELECT'
      '         CE.IDINVESTIMENTO,'
      
        '         ROUND(DECODE(NVL(G.PARIDADE,0),0,CE.QUANTIDADE,CE.QUANT' +
        'IDADE*G.PARIDADE),0) AS QUANTIDADE,'
      '         CI.VLRCONTABIL,'
      
        '         ROUND(((ROUND(DECODE(NVL(G.PARIDADE,0),0,CE.QUANTIDADE,' +
        'CE.QUANTIDADE*G.PARIDADE),0) * CI.VLRCONTABIL)/CI.QTDTITLOTE ),2' +
        ') AS VALOR'
      '      FROM'
      '         CESTAOPCIND CE, INVESTIMENTO IV,'
      '         (SELECT IDINVESTIMENTO, VLRCONTABIL, QTDTITLOTE'
      '          FROM COTACAOINVEST'
      
        '          WHERE DATACOTACAO || IDINVESTIMENTO IN (SELECT MAX(DAT' +
        'ACOTACAO) || IDINVESTIMENTO'
      
        '                                                  FROM COTACAOIN' +
        'VEST'
      
        '                                                  WHERE DATACOTA' +
        'CAO <= TO_DATE(:DATAATU,'#39'DD/MM/YYYY'#39')'
      
        '                                                  GROUP BY IDINV' +
        'ESTIMENTO)) CI,'
      '        (SELECT DISTINCT OD.PARIDADE, OI.IDINVESTIMENTO, DATACOM'
      
        '         FROM OPERACAODIREITO OD, OPERDIREITOXINV OI, PARAMINVES' +
        'T PI'
      '         WHERE OD.DATACOM > (SELECT MAX(DATAVIGENCIA)'
      '                             FROM CESTAOPCIND'
      
        '                             WHERE DATAVIGENCIA < TO_DATE(:DATAA' +
        'TU,'#39'DD/MM/YYYY'#39')) AND'
      
        '               OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO    AN' +
        'D'
      
        '               OD.IDTIPOOPERACAO    = PI.IDTIPOOPERDIRGRU     AN' +
        'D'
      
        '               OD.DATACOM          <= TO_DATE(:DATAATU,'#39'DD/MM/YY' +
        'YY'#39')) G'
      '      WHERE'
      '         (IDCESTAOPCIND = :IDCESTAOPCIND)  AND'
      '         (DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)'
      '                          FROM CESTAOPCIND'
      '                          WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      
        '                            AND DATAVIGENCIA <= TO_DATE(:DATAATU' +
        ','#39'DD/MM/YYYY'#39'))) AND'
      '         (CE.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '         (CE.IDINVESTIMENTO = CI.IDINVESTIMENTO) AND'
      '         (CE.IDINVESTIMENTO = G.IDINVESTIMENTO(+)))'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 53
    Top = 141
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptResult
      end>
    object qryBuscaVlrAtuCestaSALDOCESTA: TFloatField
      FieldName = 'SALDOCESTA'
    end
  end
  object qryBuscaOrdemLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDORDEMOPCIND, IDCESTAOPCIND, DATAORDEM, IDINVESTIMENTO, ' +
        'PREMIO, QUANTIDADE'
      'FROM ORDEMOPCIND'
      'WHERE IDLOTE = :IDLOTE'
      '  AND DATAORDEM = TO_DATE(:DATAORDEM, '#39'DD/MM/YYYY'#39')'
      '  AND IDCORRETVALORES = :IDCORRETVALORES'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 291
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAORDEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end>
    object qryBuscaOrdemLoteIDORDEMOPCIND: TFloatField
      FieldName = 'IDORDEMOPCIND'
      Origin = 'BASEDADOS."CM.ORDEMOPCIND".IDORDEMOPCIND'
    end
    object qryBuscaOrdemLoteIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
      Origin = 'BASEDADOS."CM.ORDEMOPCIND".IDCESTAOPCIND'
    end
    object qryBuscaOrdemLoteDATAORDEM: TDateTimeField
      FieldName = 'DATAORDEM'
      Origin = 'BASEDADOS."CM.ORDEMOPCIND".DATAORDEM'
    end
    object qryBuscaOrdemLoteIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.ORDEMOPCIND.IDINVESTIMENTO'
    end
    object qryBuscaOrdemLotePREMIO: TFloatField
      FieldName = 'PREMIO'
      Origin = 'BASEDADOS.ORDEMOPCIND.PREMIO'
    end
    object qryBuscaOrdemLoteQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS.ORDEMOPCIND.QUANTIDADE'
    end
  end
  object qryUpdHistOpcIndXItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTOPCINDXITENS'
      'SET VLRHISTOPCIND = :VLRHISTOPCIND,'
      '    SLDHISTOPCIND = :SLDHISTOPCIND,'
      '    IDREGRAUSADA  = :IDREGRAUSADA'
      'WHERE'
      '    (IDHISTOPCIND = :IDHISTOPCIND) AND'
      '    (IDITEMOPCIND = :IDITEMOPCIND)'
      ' ')
    ValidateWithMask = True
    Left = 274
    Top = 102
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRHISTOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SLDHISTOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRAUSADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMOPCIND'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaSaldoAjuste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SLDHISTOPCIND AS SALDOAJUSTE'
      'FROM   HISTOPCINDXITENS'
      'WHERE  IDHISTOPCIND = :IDHISTOPCIND'
      '  AND  IDITEMOPCIND = -8'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 347
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTOPCIND'
        ParamType = ptResult
      end>
    object qryBuscaSaldoAjusteSALDOAJUSTE: TFloatField
      FieldName = 'SALDOAJUSTE'
    end
  end
  object qryUpdPlanilhaHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTOPCIND'
      'SET PLNCODIGO = :PLNCODIGO'
      'WHERE'
      '   (IDBOLETA = :IDBOLETA) AND'
      '   (IDLOTE = :IDLOTE) AND'
      '   (TIPMOVHISTOPCIND = '#39'ATU'#39') AND'
      '   (DATAHISTOPCIND = TO_DATE(:DATAHISTOPCIND,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 275
    Top = 150
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAHISTOPCIND'
        ParamType = ptUnknown
      end>
  end
  object qryDelDespesOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DESPOPEROPCIND'
      'WHERE IDBOLETA = :IDBOLETA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 406
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaBoletaAberta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLETA, DATAVIGENCIA AS DATA'
      'FROM  CESTAOPCIND'
      'WHERE DATAVIGENCIA < TO_DATE(:DATAFIM, '#39'DD/MM/YYYY'#39')'
      '  AND IDBOLETA IS NULL'
      'GROUP BY IDBOLETA, DATAVIGENCIA'
      ''
      'UNION'
      ''
      'SELECT IDBOLETA, DATAORDEM AS DATA'
      'FROM ORDEMOPCIND'
      'WHERE STATUS = '#39'A'#39
      '  AND DATAORDEM BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                        TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      'GROUP BY IDBOLETA, DATAORDEM'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 286
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object qryBuscaBoletaAbertaIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletaAbertaDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object qryBuscaHistAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTOPCIND'
      'FROM HISTOPCIND'
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND DATAHISTOPCIND = TO_DATE(:DATAMOV,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 276
    Top = 204
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
  end
  object QryCestaOpcDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCESTAOPCIND, C.DATAVIGENCIA, I.DESCINVESTIMENTO, C.QU' +
        'ANTIDADE,'
      
        '       C.IDCARTEIRAINVEST, I.IDINVESTIMENTO, I.IDEMISSOR, C.IDCU' +
        'STODIANTE'
      'FROM   CESTAOPCIND C, INVESTIMENTO I, ORDEMOPCIND O'
      'WHERE  C.DATAVIGENCIA   = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '  AND  C.IDCESTAOPCIND = :IDCESTAOPCIND'
      '  AND  I.IDINVESTIMENTO = C.IDINVESTIMENTO'
      '  AND  O.IDCESTAOPCIND = C.IDCESTAOPCIND'
      'ORDER  BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 276
    Top = 252
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end>
  end
  object QryCestaOpcDiaAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     *'
      'FROM'
      '   CESTAOPCIND'
      'WHERE'
      '   (IDCESTAOPCIND  = :IDCESTAOPCIND)  AND'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)'
      '                      FROM  CESTAOPCIND'
      '                      WHERE IDCESTAOPCIND  = :IDCESTAOPCIND'
      '                        AND IDINVESTIMENTO = :IDINVESTIMENTO'
      
        '                        AND DATAVIGENCIA   < TO_DATE(:DATAVIGENC' +
        'IA,'#39'DD/MM/YYYY'#39'))) '
      ''
      ' ')
    ValidateWithMask = True
    Left = 276
    Top = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
  end
  object QryCestaDeletadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     *'
      'FROM'
      '   CESTAOPCIND C, INVESTIMENTO I, ORDEMOPCIND O'
      'WHERE'
      
        '   (C.IDINVESTIMENTO||C.DATAVIGENCIA IN (SELECT IDINVESTIMENTO||' +
        'MAX(DATAVIGENCIA)'
      #9#9#9'                 '#9'     FROM  CESTAOPCIND'
      
        '            '#9#9#9#9'     WHERE DATAVIGENCIA   < TO_DATE(:DATAVIGENCI' +
        'A,'#39'DD/MM/YYYY'#39')'
      #9#9#9'    '#9' '#9'     GROUP BY IDINVESTIMENTO ))  AND'
      'C.IDINVESTIMENTO NOT IN (SELECT  C.IDINVESTIMENTO'
      '                         FROM      CESTAOPCIND C,'
      
        '                                '#9'(SELECT IDCESTAOPCIND, IDINVEST' +
        'IMENTO'
      '                                '#9' FROM   CESTAOPCIND'
      '                                     '#9' WHERE'
      
        '                                    '#9'        DATAVIGENCIA   = TO' +
        '_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '                                  '#9' ORDER BY IDCESTAOPCIND)  DIA'
      '                         WHERE'
      
        '                                (C.IDINVESTIMENTO||C.DATAVIGENCI' +
        'A IN (SELECT IDINVESTIMENTO||MAX(DATAVIGENCIA)'
      #9#9#9'                                '#9'      FROM  CESTAOPCIND'
      
        #9#9#9#9'          '#9'                      WHERE DATAVIGENCIA   < TO_D' +
        'ATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      
        #9#9#9#9#9'                              GROUP BY IDINVESTIMENTO ))  A' +
        'ND'
      
        '                                DIA.IDINVESTIMENTO = C.IDINVESTI' +
        'MENTO(+)                          AND'
      
        '                                DIA.IDCESTAOPCIND  = C.IDCESTAOP' +
        'CIND(+)'
      '                                )    AND'
      'I.IDINVESTIMENTO = C.IDINVESTIMENTO  AND'
      'O.IDCESTAOPCIND  = C.IDCESTAOPCIND'
      ''
      'ORDER BY C.IDCESTAOPCIND')
    ValidateWithMask = True
    Left = 390
    Top = 430
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
  end
  object qryBuscaOpcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDOPCAO, IDINVESTIMENTO, DTAVENCTO, VLRPRECOEX, IDBOLSAVA' +
        'LORES, IDINVESTBASE,'
      
        '       STATPAMERICANA, STAOPCCOMPRA, IDTIPOOPCAO, TIPCOTVENC, VL' +
        'RSTRIKEPUT, VLRPONTO'
      'FROM OPCOES'
      
        'WHERE (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO)) OR'
      '        (:IDINVESTIMENTO IS NULL))'
      '  AND (((:IDOPCAO IS NOT NULL) AND (IDOPCAO = :IDOPCAO)) OR'
      '        (:IDOPCAO IS NULL))'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPCAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPCAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPCAO'
        ParamType = ptResult
      end>
    object qryBuscaOpcaoIDOPCAO: TFloatField
      FieldName = 'IDOPCAO'
      Origin = 'BASEDADOS.OPCOES.IDOPCAO'
    end
    object qryBuscaOpcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPCOES.IDINVESTIMENTO'
    end
    object qryBuscaOpcaoDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
      Origin = 'BASEDADOS.OPCOES.DTAVENCTO'
    end
    object qryBuscaOpcaoVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
      Origin = 'BASEDADOS.OPCOES.VLRPRECOEX'
    end
    object qryBuscaOpcaoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.OPCOES.IDBOLSAVALORES'
    end
    object qryBuscaOpcaoIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
      Origin = 'BASEDADOS.OPCOES.IDINVESTBASE'
    end
    object qryBuscaOpcaoSTATPAMERICANA: TStringField
      FieldName = 'STATPAMERICANA'
      Origin = 'BASEDADOS.OPCOES.STATPAMERICANA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOpcaoSTAOPCCOMPRA: TStringField
      FieldName = 'STAOPCCOMPRA'
      Origin = 'BASEDADOS.OPCOES.STAOPCCOMPRA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOpcaoIDTIPOOPCAO: TFloatField
      FieldName = 'IDTIPOOPCAO'
      Origin = 'BASEDADOS.OPCOES.IDTIPOOPCAO'
    end
    object qryBuscaOpcaoTIPCOTVENC: TStringField
      FieldName = 'TIPCOTVENC'
      Origin = 'BASEDADOS.OPCOES.TIPCOTVENC'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOpcaoVLRSTRIKEPUT: TFloatField
      FieldName = 'VLRSTRIKEPUT'
      Origin = 'BASEDADOS.OPCOES.VLRSTRIKEPUT'
    end
    object qryBuscaOpcaoVLRPONTO: TFloatField
      FieldName = 'VLRPONTO'
      Origin = 'BASEDADOS.OPCOES.VLRPONTO'
    end
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 382
    Top = 390
  end
  object qryBuscaPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT L.PLANO, L.PLNCODIGO'
      'FROM LANCAMENTO L'
      'WHERE L.IDMODULO = 79'
      '  AND L.PLNCODIGO = :PLNCODIGO')
    ValidateWithMask = True
    Left = 280
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptResult
      end>
    object qryBuscaPlanoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.LANCAMENTO.PLANO'
    end
    object qryBuscaPlanoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCAMENTO.PLNCODIGO'
    end
  end
  object qryBuscaTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDINVESTIMENTO, H.IDTIPOOPERACAO, H.IDCARTEIRAINVEST, I' +
        '.IDEMISSOR,'
      '       H.DATAMOVCARTINV, H.MOVIMAQUI, H.VLRVARIACAO,'
      '       B.PLANO, B.PLNCODIGO,'
      '       H.PLANO AS PLANOHIST, H.PLNCODIGO AS PLANILHAHIST'
      'FROM HISTCARTINV H, INVESTIMENTO I, BOLETA B'
      
        'WHERE H.IDHISTCARTINV IN (SELECT IDHISTCARTINVDEST AS IDHISTCART' +
        'INV'
      '                          FROM OPERCUSTODIA'
      '                          WHERE IDBOLETA = :IDBOLETA'
      '                          UNION'
      
        '                          SELECT IDHISTCARTINVORIG AS IDHISTCART' +
        'INV'
      '                          FROM OPERCUSTODIA'
      '                          WHERE IDBOLETA = :IDBOLETA)'
      '  AND H.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '  AND B.IDBOLETA = :IDBOLETA'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
    object qryBuscaTransfIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaTransfIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaTransfIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryBuscaTransfMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object qryBuscaTransfVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
    end
    object qryBuscaTransfPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBuscaTransfPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaTransfPLANOHIST: TFloatField
      FieldName = 'PLANOHIST'
    end
    object qryBuscaTransfPLANILHAHIST: TFloatField
      FieldName = 'PLANILHAHIST'
    end
    object qryBuscaTransfIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaTransfDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
  end
end
