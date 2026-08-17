object DtmIntegraSaf: TDtmIntegraSaf
  OldCreateOrder = True
  Left = 265
  Top = 224
  Height = 479
  Width = 741
  object QryParam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '  IDPESSOA, DIRARQUIVO, DIRLOG, INTOPER, CODTIPDOCP,  CODTIPDOCR' +
        ', COMPLDOCUMENTO,'
      'IDTIPOCLIENTE, IDRAMOFORNECEDOR'
      'FROM '
      '  PARAMINTEGRASAF WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 47
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryParamIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMINTEGRASAF.IDPESSOA'
    end
    object QryParamDIRARQUIVO: TStringField
      FieldName = 'DIRARQUIVO'
      Origin = 'PARAMINTEGRASAF.DIRARQUIVO'
      Size = 255
    end
    object QryParamDIRLOG: TStringField
      FieldName = 'DIRLOG'
      Origin = 'PARAMINTEGRASAF.DIRLOG'
      Size = 255
    end
    object QryParamINTOPER: TFloatField
      FieldName = 'INTOPER'
      Origin = 'PARAMINTEGRASAF.INTOPER'
    end
    object QryParamCODTIPDOCP: TFloatField
      FieldName = 'CODTIPDOCP'
    end
    object QryParamCODTIPDOCR: TFloatField
      FieldName = 'CODTIPDOCR'
    end
    object QryParamCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
    object QryParamIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = '"CM.PARAMINTEGRASAF".IDTIPOCLIENTE'
    end
    object QryParamIDRAMOFORNECEDOR: TFloatField
      FieldName = 'IDRAMOFORNECEDOR'
      Origin = '"CM.PARAMINTEGRASAF".IDRAMOFORNECEDOR'
    end
  end
  object QryTipoDocP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  RECPAG = '#39'P'#39
      'ORDER BY'
      '  DEBCRE, DESCRICAO')
    ValidateWithMask = True
    Left = 151
    Top = 16
    object QryTipoDocPDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object QryTipoDocPDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Size = 1
    end
    object QryTipoDocPCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object QryTipoDocR: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  RECPAG = '#39'R'#39
      'ORDER BY'
      '  DEBCRE DESC, DESCRICAO')
    ValidateWithMask = True
    Left = 151
    Top = 67
    object QryTipoDocRDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object QryTipoDocRDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Size = 1
    end
    object QryTipoDocRCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object QryBuscaCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA FROM CLIENTEPESS WHERE CODCLIENTE = :CODCORRESP')
    ValidateWithMask = True
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CODCORRESP'
        ParamType = ptUnknown
      end>
    object QryBuscaClienteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CLIENTEPESS.IDPESSOA'
    end
  end
  object QryBuscaFornecedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA FROM FORNSERV WHERE CODCORRESP = :CODCORRESP'
      '')
    ValidateWithMask = True
    Left = 240
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODCORRESP'
        ParamType = ptUnknown
      end>
    object QryBuscaFornecedorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORNSERV.IDPESSOA'
    end
  end
  object QryTipoCLiente: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOCLIENTE, DESCRICAO'
      'FROM'
      ' TIPOCLIENTE'
      'ORDER BY'
      ' DESCRICAO')
    ValidateWithMask = True
    Left = 327
    Top = 16
    object QryTipoCLienteDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object QryTipoCLienteIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.IDTIPOCLIENTE'
      Visible = False
    end
  end
  object QryRamoForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR '
      'FROM'
      '  RAMOFORNECEDOR'
      'ORDER BY'
      '  DESCRAMOFORNECEDOR ')
    ValidateWithMask = True
    Left = 327
    Top = 67
    object QryRamoFornDESCRAMOFORNECEDOR: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCRAMOFORNECEDOR'
      Origin = 'RAMOFORNECEDOR.DESCRAMOFORNECEDOR'
      Size = 30
    end
    object QryRamoFornIDRAMOFORNECEDOR: TFloatField
      FieldName = 'IDRAMOFORNECEDOR'
      Origin = 'RAMOFORNECEDOR.IDRAMOFORNECEDOR'
      Visible = False
    end
  end
  object QryTipoRecebDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  T.CODTIPRECDES, T.PLACONTACREDITO, T.PLANO'
      'FROM'
      '  TIPORDCORRESP TC, TIPORECEBDESEMB T'
      'WHERE'
      '  T.RECPAG = :RECPAG AND'
      '  T.IDPESSOA = :IDPESSOA AND'
      '  TC.CODCORRESP = :CODCORRESP AND'
      '  TC.CODTIPRECDES = T.CODTIPRECDES AND'
      '  TC.RECPAG = T.RECPAG AND'
      '  TC.IDPESSOA = T.IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCORRESP'
        ParamType = ptUnknown
      end>
    object QryTipoRecebDesembCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object QryTipoRecebDesembPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 18
    end
    object QryTipoRecebDesembPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPORECEBDESEMB.PLANO'
    end
  end
  object QryCentCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  (IDEMPRESA = :IDEMPRESA) AND'
      '  (CODCORRESP = :CODCORRESP) AND'
      '  (ATIVO = '#39'S'#39') AND'
      '  (STATUSGRUPOCDC = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCORRESP'
        ParamType = ptUnknown
      end>
    object QryCentCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
  end
  object QryCentRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTRORESPON'
      'FROM'
      '  CENTRESPON'
      'WHERE'
      '  RTRIM(NOME) = :NOME AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  ANALITICOSINTET = '#39'A'#39' AND'
      '  ATIVO = '#39'S'#39)
    ValidateWithMask = True
    Left = 47
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryCentResponCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
  end
  object QryObrigaSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PLASUBCONTA '
      'FROM '
      '  PLANOCONTA '
      'WHERE '
      '  PLANO =:PLANO AND '
      '  RTRIM(PLACONTA) = :PLACONTA ')
    ValidateWithMask = True
    Left = 47
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
    object QryObrigaSubContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Size = 1
    end
  end
  object QryBuscaDadosBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  C.IDCBANCARIA'
      'FROM'
      '  CONTABANCARIA C, BANCO B, AGENCIABANCARIA A'
      'WHERE'
      '  C.IDAGENCIA = A.IDPESSOA AND'
      '  A.IDBANCO = B.IDPESSOA AND'
      '  RTRIM(B.NUMBANCO) = :NUMBANCO AND'
      '  RTRIM(A.NUMAGENCIA) = :NUMAGENCIA AND'
      '  C.CONTACORRENTE = :CONTACORRENTE')
    ValidateWithMask = True
    Left = 151
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMAGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTACORRENTE'
        ParamType = ptUnknown
      end>
    object QryBuscaDadosBancoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'CONTABANCARIA.IDCBANCARIA'
    end
  end
  object QryInsBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BANCO'
      '(IDPESSOA, NUMBANCO, FLGVALIDACC)'
      'VALUES'
      '(:IDPESSOA, :NUMBANCO, :FLGVALIDACC)')
    ValidateWithMask = True
    Left = 151
    Top = 117
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGVALIDACC'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'CONTABANCARIA.IDCBANCARIA'
    end
  end
  object QryInsAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO AGENCIABANCARIA '
      '(IDPESSOA, IDBANCO, NUMAGENCIA)'
      'VALUES'
      '(:IDPESSOA, :IDBANCO, :NUMAGENCIA)')
    ValidateWithMask = True
    Left = 240
    Top = 116
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMAGENCIA'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'CONTABANCARIA.IDCBANCARIA'
    end
  end
  object QryTxt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  D.IDFORCLI, D.RECPAG, D.NODOCUMENTO, D.DATAVENCTO, L.DATALANCT' +
        'O, L.VALOR,'
      
        '  R.CODTIPRECDES, ('#39'N'#39') AS CONTABILIZA, R.CODCENTRORESPON, D.OPE' +
        'RACAO, P.NOME,'
      
        '  P.TIPO, P.NUMDOCUMENTO, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRE' +
        'NTE,'
      
        '  E.LOGRADOURO, C.NOME AS NOMECIDADE, E.CEP, E.IDPESSOA AS NUMEM' +
        'PRESA,'
      '  D.NUMAPGR AS NUMAP'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  RATEIODOCUM R,'
      '  PESSOA P,'
      '  BANCO B,'
      '  AGENCIABANCARIA A,'
      '  ENDPESS E,'
      '  CIDADES C,'
      '  CONTABANCARIA C'
      'WHERE'
      '  1=2'
      '')
    UpdateObject = UpdTxt
    ValidateWithMask = True
    Left = 48
    Top = 222
    object QryTxtIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
    end
    object QryTxtRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Size = 1
    end
    object QryTxtNODOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
    end
    object QryTxtDATAVENCTO: TDateTimeField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
    end
    object QryTxtDATALANCTO: TDateTimeField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object QryTxtVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR'
    end
    object QryTxtCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object QryTxtCONTABILIZA: TStringField
      DisplayWidth = 1
      FieldName = 'CONTABILIZA'
      Size = 1
    end
    object QryTxtCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object QryTxtOPERACAO: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Size = 2
    end
    object QryTxtNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object QryTxtTIPO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPO'
      Size = 1
    end
    object QryTxtNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object QryTxtNUMBANCO: TStringField
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object QryTxtNUMAGENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object QryTxtCONTACORRENTE: TStringField
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object QryTxtLOGRADOURO: TStringField
      DisplayWidth = 60
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object QryTxtNOMECIDADE: TStringField
      DisplayWidth = 50
      FieldName = 'NOMECIDADE'
      Size = 50
    end
    object QryTxtCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object QryTxtNUMEMPRESA: TFloatField
      FieldName = 'NUMEMPRESA'
    end
    object QryTxtNUMAP: TFloatField
      FieldName = 'NUMAP'
    end
  end
  object UpdTxt: TUpdateSQL
    Left = 152
    Top = 222
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 327
    Top = 117
  end
  object QryBuscaCCForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CONTACFORN'
      'FROM'
      '  EMPRESAFORN'
      'WHERE'
      '  IDFORCLI = :IDFORCLI AND'
      '  IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 239
    Top = 167
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryBuscaCCFornCONTACFORN: TStringField
      FieldName = 'CONTACFORN'
      Origin = 'EMPRESAFORN.CONTACFORN'
      Size = 18
    end
  end
  object QryBuscaCCCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CONTACCLIENTE'
      'FROM'
      '  EMPRESACLIENTE'
      'WHERE'
      '  IDFORCLI = :IDFORCLI AND'
      '  IDPESSOA = :IDPESSOA ')
    ValidateWithMask = True
    Left = 47
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryBuscaCCCliCONTACCLIENTE: TStringField
      FieldName = 'CONTACCLIENTE'
      Origin = 'EMPRESACLIENTE.CONTACCLIENTE'
      Size = 18
    end
  end
  object QryPlanopatro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPLANOPREV, IDPATRO'
      'FROM'
      '  PLANPATROXSAF'
      'WHERE'
      '  IDPESSOA = :IDPESSOA AND'
      '  NUMEMPRESA = :NUMEMPRESA')
    ControlType.Strings = (
      'IDPLANOPREV;CustomEdit;CmbPlano'
      'IDPATRO;CustomEdit;CmbPatro')
    ValidateWithMask = True
    Left = 424
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMEMPRESA'
        ParamType = ptUnknown
      end>
    object QryPlanopatroIDPLANOPREV: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 25
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPATROXSAF.IDPLANOPREV'
      Required = True
    end
    object QryPlanopatroIDPATRO: TFloatField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'IDPATRO'
      Origin = 'PLANPATROXSAF.IDPATRO'
      Required = True
    end
  end
  object QryBuscaAlterador: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   TA.CODALTERADOR, TA.ACRESDECRES'
      'FROM '
      '   HISTSAFXALTERADOR H, TIPOALTERADOR TA'
      'WHERE'
      '  H.IDHISTORICOSAF = :IDHISTORICOSAF AND'
      '  TA.CODALTERADOR = H.CODALTERADOR')
    ValidateWithMask = True
    Left = 424
    Top = 118
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTORICOSAF'
        ParamType = ptUnknown
      end>
    object QryBuscaAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
    end
    object QryBuscaAlteradorACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Origin = 'TIPOALTERADOR.ACRESDECRES'
      Size = 1
    end
  end
  object QryBuscaValorDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  L.VALOR'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  ROUND(L.VALOR,2) = ROUND(:VALOR,2) AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '  D.OPERACAO = L.OPERACAO AND'
      '  L.ESTORNO IS NULL')
    ValidateWithMask = True
    Left = 328
    Top = 169
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end>
    object QryBuscaValorDocVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = '"CM.LANCTODOCUM".VALOR'
    end
  end
  object QryDocsOpen: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   D.CODDOCUMENTO, D.NODOCUMENTO, L.PLNCODIGO, L.DATALANCTO, D.C' +
        'OMPLDOCUMENTO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   (IDMODULO = :IDMODULO) AND'
      '   (L.DATALANCTO BETWEEN :DATAINI AND :DATAFIM) AND'
      '   (RTRIM(D.STATUS) <> '#39'2'#39' OR D.STATUS IS NULL) AND'
      '   (L.ESTORNO IS NULL) AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.OPERACAO = L.OPERACAO)'
      '')
    UpdateObject = UpdDocsOpen
    ValidateWithMask = True
    Left = 240
    Top = 222
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object QryDocsOpenCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryDocsOpenNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object QryDocsOpenPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object QryDocsOpenDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object QryDocsOpenCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
  end
  object UpdDocsOpen: TUpdateSQL
    Left = 328
    Top = 222
  end
  object QryExcDoc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 424
    Top = 220
  end
  object QryHistoricoSaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FLGBLOQUEADO FROM HISTORICOSAF WHERE IDHISTORICOSAF =  :I' +
        'DHISTORICOSAF')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 157
    Top = 293
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTORICOSAF'
        ParamType = ptUnknown
      end>
    object QryHistoricoSafFLGBLOQUEADO: TStringField
      FieldName = 'FLGBLOQUEADO'
      Origin = 'BASEDADOS.HISTORICOSAF.FLGBLOQUEADO'
      FixedChar = True
      Size = 1
    end
  end
end
