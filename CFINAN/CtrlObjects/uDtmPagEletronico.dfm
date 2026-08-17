object DTmPagEletronico: TDTmPagEletronico
  OldCreateOrder = False
  Left = 268
  Top = 167
  Height = 294
  Width = 597
  object QryLoteDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT L.NUMLOTE, D.NODOCUMENTO,L.VALOR, L.CODDOCUMENTO, L.CODBA' +
        'RRA, L.CODBARRAVALOR, LP.CODPORTFORMA'
      'FROM'
      'DOCUMENTO D,'
      'LOTEXDOCUM  L,'
      'PORTADORFORMA P,'
      'LOTEPAGTO LP'
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 37
    Top = 73
    object QryLoteDocNUMLOTE: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
      Origin = 'LOTEXDOCUM.NUMLOTE'
    end
    object QryLoteDocNODOCUMENTO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Número do~Documento'
      DisplayWidth = 9
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
    end
    object QryLoteDocVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
      Origin = 'LOTEXDOCUM.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object QryLoteDocCODBARRA: TStringField
      DisplayLabel = 'Código de Barra'
      DisplayWidth = 45
      FieldName = 'CODBARRA'
      Size = 60
    end
    object QryLoteDocCODBARRAVALOR: TStringField
      DisplayLabel = 'Representação Númerica'
      DisplayWidth = 45
      FieldName = 'CODBARRAVALOR'
      Size = 60
    end
    object QryLoteDocCODDOCUMENTO: TFloatField
      DisplayWidth = 60
      FieldName = 'CODDOCUMENTO'
      Origin = 'LOTEXDOCUM.CODDOCUMENTO'
      Visible = False
    end
    object QryLoteDocCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
    end
  end
  object sqlLoteDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   L.NUMLOTE, D.NODOCUMENTO,L.VALOR, '
      '   L.CODDOCUMENTO, L.CODBARRA, '
      '   L.CODBARRAVALOR, LP.CODPORTFORMA'
      'FROM'
      '   DOCUMENTO D,'
      '   LOTEXDOCUM  L,'
      '   PORTADORFORMA P,'
      '   LOTEPAGTO LP'
      'WHERE 1=2'
      '')
    Left = 39
    Top = 23
  end
  object CMSqlParams2: TCMSqlParams
    Left = 875
    Top = 30
  end
  object QryAtualizaBarras: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 119
    Top = 69
  end
  object SqlAtualizaBarras: TCMSqlParams
    Left = 122
    Top = 23
  end
  object sqlLotePagto: TCMSqlParams
    Left = 206
    Top = 23
  end
  object sqlDocumentos: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      ' PESS.IDPESSOA, PESS.NOME, PESS.RAZAOSOCIAL,'
      
        ' DECODE(PESS.TIPO,'#39'J'#39',DECODE(PESS.NUMDOCUMENTO,NULL,'#39'00000000000' +
        '000'#39',PESS.NUMDOCUMENTO),DECODE(PESS.NUMDOCUMENTO,NULL,'#39'000000000' +
        '00'#39',PESS.NUMDOCUMENTO)) AS NUMDOCUMENTO,'
      
        '-- C.CONTACORRENTE, BA.NUMBANCO AS CODBANCOFAVORECIDO, AG.NUMAGE' +
        'NCIA,'
      
        ' E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, CID.NOME AS CI' +
        'DADE, ES.CODESTADO,'
      ' E.CEP, DOC.IDFORCLI, DOC.CODDOCUMENTO, LOTEX.VALOR,'
      
        ' DOC.VALORDESCONTO, DOC.VALORJUROS, DOC.DATAVENCTO, DOC.DATAPROG' +
        'RAMADA,'
      
        ' DOC.MOECODIGO AS TIPOMOEDA, LP.NUMLOTE, LP.CODPORTFORMA, PF.COD' +
        'FORMAPAGTO, PF.CODTIPOPAGTO,'
      
        ' PF.FLGEMITEAVISO, PF.CODARQUIVOREMESSA, PC.IDBANCO, PC.NOCONTAC' +
        'ORR, pf.codportador  ,'
      
        ' LOTEX.CODBARRA, LOTEX.CODBARRAVALOR, DOC.NODOCUMENTO, DOC.COMPL' +
        'DOCUMENTO, PESS.TIPO, PF.NUMEMPRESABANCO, TD.DEBCRE, '#39'          ' +
        '               '#39' as livre'
      '-- , PAG.NOME AS NOMEAGENCIA'
      '-- C.TIPOCONTA'
      'FROM'
      '-- PESSOA PAG,'
      
        ' PESSOA PESS, LOTEPAGTO LP, LOTEXDOCUM LOTEX, DOCUMENTO DOC, PAR' +
        'AMCAP PAR,'
      
        ' PORTADORFORMA PF, PORTADORCONTA PC, TIPODOCRECPAG TD, CIDADES C' +
        'ID, ESTADO ES,'
      ' ENDPESS E,'
      '-- CONTABANCARIA C,'
      ' MOEDA M'
      '-- AGENCIABANCARIA AG,'
      '-- BANCO BA'
      'WHERE 1=2'
      '')
    Left = 289
    Top = 23
  end
  object sqlPortadorForma: TCMSqlParams
    Left = 39
    Top = 123
  end
  object sqlModelosCnab: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMODELOSCNAB,DESCRICAO '
      'FROM MODELOSCNAB '
      'WHERE RECPAG = '#39'P'#39
      'ORDER BY DESCRICAO'
      '')
    Left = 123
    Top = 123
  end
  object sqlAux: TCMSqlParams
    Left = 206
    Top = 123
  end
end
