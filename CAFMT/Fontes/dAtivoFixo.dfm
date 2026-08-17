object dtmAtivoFixo: TdtmAtivoFixo
  OldCreateOrder = True
  OnCreate = dtmAtivoFixoCreate
  OnDestroy = dtmAtivoFixoDestroy
  Top = 98
  Height = 474
  Width = 799
  object qryRegistraMovimentacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTORICOMOVIMENTACAO'
      '           (IDMOVIMENTACAO,'
      '            IDBEM,'
      '            IDPESSOA,'
      '            IDMODULO,'
      '            IDTIPOMOVIMENTACAO,'
      '            DATAMOVIMENTACAO,'
      '            IDREAVALACRESC,'
      '            VALOFI,'
      '            VALFIS,'
      '            VALGER,'
      '            DATAULTDEP,'
      '            IDGRUPANT,'
      '            IDCONJANT,'
      '            IDLOCALANT,'
      '            IDRESPANT,'
      '            PLACAANT,'
      '            TAXADEPANT,'
      '            VALORGLAUDO,'
      '            OBSREAVAL,'
      '            PLNCODIGO,'
      '            FLGNCAF,'
      '            TIPDEPPRORATA)'
      'VALUES     (:MOVIMENTACAO,'
      '            :BEM,'
      '            :EMPRESAPROP,'
      '            :MODULO,'
      '            :TIPOMOVIMENTACAO,'
      '            :DATAMOVIMENTACAO,'
      '            :IDREAVALACRESC,'
      '            :VALOFI,'
      '            :VALFIS,'
      '            :VALGER,'
      '            :DATAULTDEP,'
      '            :IDGRUPANT,'
      '            :IDCONJANT,'
      '            :IDLOCALANT,'
      '            :IDRESPANT,'
      '            :PLACAANT,'
      '            :TAXADEPANT,'
      '            :VALORGLAUDO,'
      '            :OBSREAVAL,'
      '            :PLANILHA,'
      '            :FLGNCAF,'
      '            :TIPDEPPRORATA)'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 205
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDREAVALACRESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDGRUPANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONJANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDLOCALANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLACAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TAXADEPANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORGLAUDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANILHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGNCAF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPDEPPRORATA'
        ParamType = ptUnknown
      end>
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM,B.IDPESSOA,B.IDCONJUNTO,B.IDTERCEIRO,B.IDGRUPO,'
      '       B.CODSUBCONTA,B.IDCLASSEBEM,B.IDMODULO,B.IDITENSRECDEV,'
      
        '       B.IDFORNSERV,B.IDSITUACAO,B.IDIMAGEM,B.REGISTRO,B.CONTROL' +
        'E,'
      
        '       B.PLACA,B.DESBEM,B.IDNOTA,B.COMPLNOTA,B.DTANOTA,B.NUMSERI' +
        'E,'
      
        '       B.DTAINCLUSAO,B.VALHISTORICO,B.VALORG,B.CMBEM,B.VALFIS,B.' +
        'VALGER,'
      
        '       B.DATAINICIODEP,B.VALDEPINI,B.TAXADEP,B.DEPLANC,B.CMDEP,B' +
        '.DEPFIS,'
      '       B.DEPGER,B.DATAULTDEP,B.DATARECALCDEP,B.FLGDEPREC,'
      '       B.PROPBAIXA,B.BAIXATOTAL,B.IDOPCIONAL,B.UNIDNEGOC,'
      
        '       B.PROCESSOAQUIS,B.EMPENHOAQUIS,B.PUBAUTOR,B.PUBEDITORA,B.' +
        'PUBANO,'
      '       B.PRIORIDADE,B.DATAINSTALACAO,B.DATATERMINOGAR,'
      '       ((B.VALORG + B.CMBEM) - (B.DEPLANC + B.CMDEP)) AS VALCTB,'
      '       B.FLGBEMINTCONTAB, B.DTACONTAB, G.FLGIMOVEL,'
      '       C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM BEM B,'
      '     GRUPO G,'
      '     CONJUNTO C'
      'WHERE (B.IDBEM = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '')
    UpdateObject = updBem
    ValidateWithMask = True
    Left = 364
    Top = 202
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDTERCEIRO = :IDTERCEIRO,'
      '  IDGRUPO = :IDGRUPO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDCLASSEBEM = :IDCLASSEBEM,'
      '  IDMODULO = :IDMODULO,'
      '  IDITENSRECDEV = :IDITENSRECDEV,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  IDSITUACAO = :IDSITUACAO,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  REGISTRO = :REGISTRO,'
      '  CONTROLE = :CONTROLE,'
      '  PLACA = :PLACA,'
      '  DESBEM = :DESBEM,'
      '  IDNOTA = :IDNOTA,'
      '  COMPLNOTA = :COMPLNOTA,'
      '  DTANOTA = :DTANOTA,'
      '  NUMSERIE = :NUMSERIE,'
      '  DTAINCLUSAO = :DTAINCLUSAO,'
      '  VALHISTORICO = :VALHISTORICO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  DATAINICIODEP = :DATAINICIODEP,'
      '  VALDEPINI = :VALDEPINI,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  DATARECALCDEP = :DATARECALCDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  PROPBAIXA = :PROPBAIXA,'
      '  BAIXATOTAL = :BAIXATOTAL,'
      '  IDOPCIONAL = :IDOPCIONAL,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  PROCESSOAQUIS = :PROCESSOAQUIS,'
      '  EMPENHOAQUIS = :EMPENHOAQUIS,'
      '  PUBAUTOR = :PUBAUTOR,'
      '  PUBEDITORA = :PUBEDITORA,'
      '  PUBANO = :PUBANO,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  DATAINSTALACAO = :DATAINSTALACAO,'
      '  DATATERMINOGAR = :DATATERMINOGAR,'
      '  FLGBEMINTCONTAB = :FLGBEMINTCONTAB,'
      '  DTACONTAB = :DTACONTAB'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into BEM'
      
        '  (IDBEM, IDPESSOA, IDCONJUNTO, IDTERCEIRO, IDGRUPO, CODSUBCONTA' +
        ', IDCLASSEBEM, '
      
        '   IDMODULO, IDITENSRECDEV, IDFORNSERV, IDSITUACAO, IDIMAGEM, RE' +
        'GISTRO, '
      
        '   CONTROLE, PLACA, DESBEM, IDNOTA, COMPLNOTA, DTANOTA, NUMSERIE' +
        ', DTAINCLUSAO, '
      
        '   VALHISTORICO, VALORG, CMBEM, VALFIS, VALGER, DATAINICIODEP, V' +
        'ALDEPINI, '
      
        '   TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, DATARECA' +
        'LCDEP, '
      
        '   FLGDEPREC, PROPBAIXA, BAIXATOTAL, IDOPCIONAL, UNIDNEGOC, PROC' +
        'ESSOAQUIS, '
      
        '   EMPENHOAQUIS, PUBAUTOR, PUBEDITORA, PUBANO, PRIORIDADE, DATAI' +
        'NSTALACAO, '
      '   DATATERMINOGAR, FLGBEMINTCONTAB, DTACONTAB)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :IDCONJUNTO, :IDTERCEIRO, :IDGRUPO, :CODSU' +
        'BCONTA, '
      
        '   :IDCLASSEBEM, :IDMODULO, :IDITENSRECDEV, :IDFORNSERV, :IDSITU' +
        'ACAO, :IDIMAGEM, '
      
        '   :REGISTRO, :CONTROLE, :PLACA, :DESBEM, :IDNOTA, :COMPLNOTA, :' +
        'DTANOTA, '
      
        '   :NUMSERIE, :DTAINCLUSAO, :VALHISTORICO, :VALORG, :CMBEM, :VAL' +
        'FIS, :VALGER, '
      
        '   :DATAINICIODEP, :VALDEPINI, :TAXADEP, :DEPLANC, :CMDEP, :DEPF' +
        'IS, :DEPGER, '
      
        '   :DATAULTDEP, :DATARECALCDEP, :FLGDEPREC, :PROPBAIXA, :BAIXATO' +
        'TAL, :IDOPCIONAL, '
      
        '   :UNIDNEGOC, :PROCESSOAQUIS, :EMPENHOAQUIS, :PUBAUTOR, :PUBEDI' +
        'TORA, :PUBANO, '
      
        '   :PRIORIDADE, :DATAINSTALACAO, :DATATERMINOGAR, :FLGBEMINTCONT' +
        'AB, :DTACONTAB)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 236
    Top = 226
  end
  object qryRegistraValorMovimentacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO VALORMOVIMENTACAO'
      '               (IDMOVIMENTACAO,'
      '                VALOFI,'
      '                VALGER,'
      '                VALFIS)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PVALOFI,'
      '                :PVALGER,'
      '                :PVALFIS)')
    ValidateWithMask = True
    Left = 308
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALOFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end>
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE (C.IDPESSOA = :PIDPESSOA)'
      '  AND (C.IDPESSOA = I.IDPESSOA(+))'
      '  AND (C.IDPESSOA = PC.IDPESSOA(+))'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 292
    Top = 335
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
    end
    object qryParamCafMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
    end
    object qryParamCafMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
    end
    object qryParamCafNUMDIASANO: TFloatField
      FieldName = 'NUMDIASANO'
    end
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      FixedChar = True
    end
    object qryParamCafALUGUELINTERNO: TFloatField
      FieldName = 'ALUGUELINTERNO'
    end
    object qryParamCafGERARREQMAT: TFloatField
      FieldName = 'GERARREQMAT'
    end
    object qryParamCafDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryParamCafDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
    end
    object qryParamCafDTAULTALUG: TDateTimeField
      FieldName = 'DTAULTALUG'
    end
    object qryParamCafSEQBEMEMP: TFloatField
      FieldName = 'SEQBEMEMP'
    end
    object qryParamCafEDITACODBEM: TFloatField
      FieldName = 'EDITACODBEM'
    end
    object qryParamCafEDITACODGRUPO: TFloatField
      FieldName = 'EDITACODGRUPO'
    end
    object qryParamCafSISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Size = 8
    end
    object qryParamCafDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
    end
    object qryParamCafULTTXTCONTAB: TDateTimeField
      FieldName = 'ULTTXTCONTAB'
    end
    object qryParamCafFLGCALCCM: TFloatField
      FieldName = 'FLGCALCCM'
    end
    object qryParamCafFLGTIPOCALC: TStringField
      FieldName = 'FLGTIPOCALC'
      FixedChar = True
      Size = 1
    end
    object qryParamCafMASCARACLASSE: TStringField
      FieldName = 'MASCARACLASSE'
      FixedChar = True
      Size = 15
    end
    object qryParamCafINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      FixedChar = True
      Size = 1
    end
    object qryParamCafINTEGRACAP: TStringField
      FieldName = 'INTEGRACAP'
      FixedChar = True
      Size = 1
    end
    object qryParamCafINTEGRACAR: TStringField
      FieldName = 'INTEGRACAR'
      FixedChar = True
      Size = 1
    end
    object qryParamCafPLANOVIGENTE: TFloatField
      FieldName = 'PLANOVIGENTE'
    end
    object qryParamCafFLGREAVAL: TStringField
      FieldName = 'FLGREAVAL'
      FixedChar = True
      Size = 1
    end
    object qryParamCafTIPOPERCTB: TStringField
      FieldName = 'TIPOPERCTB'
      FixedChar = True
      Size = 2
    end
    object qryParamCafFLGREMOVEPLANCTB: TStringField
      FieldName = 'FLGREMOVEPLANCTB'
      FixedChar = True
      Size = 1
    end
    object qryParamCafATIVPROJETO: TFloatField
      FieldName = 'ATIVPROJETO'
    end
    object qryParamCafPROXIMAPLACA: TFloatField
      FieldName = 'PROXIMAPLACA'
    end
    object qryParamCafFLGCLSDESBEM: TFloatField
      FieldName = 'FLGCLSDESBEM'
    end
    object qryParamCafDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
    object qryParamCafPATROPADRAO: TFloatField
      FieldName = 'PATROPADRAO'
    end
    object qryParamCafPLANPREVPADRAO: TFloatField
      FieldName = 'PLANPREVPADRAO'
    end
    object qryParamCafTIPATUSALDOCONTAB: TFloatField
      FieldName = 'TIPATUSALDOCONTAB'
    end
    object qryParamCafDTANCAF: TDateTimeField
      FieldName = 'DTANCAF'
    end
    object qryParamCafFLGINTCAFCONT: TFloatField
      FieldName = 'FLGINTCAFCONT'
    end
    object qryParamCafTIPOCONJUNTO: TFloatField
      FieldName = 'TIPOCONJUNTO'
    end
    object qryParamCafFLGCONTABFECHAM: TFloatField
      FieldName = 'FLGCONTABFECHAM'
    end
    object qryParamCafPACDOBRADA: TStringField
      FieldName = 'PACDOBRADA'
      FixedChar = True
      Size = 1
    end
    object qryParamCafFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      FixedChar = True
      Size = 1
    end
  end
  object qryCCrd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDCONJUNTO,'
      '       R.CODCENTROCUSTO,'
      '       R.PARTICIPACAO,'
      '       R.DTAINICIO,'
      '       R.DTAFIM,'
      '       CC.NOME,'
      '       CC.STATUSGRUPOCDC AS TIPO'
      'FROM RATEIODEPRECIACAO R,'
      '     CENTCUST CC'
      'WHERE (R.IDCONJUNTO     = :PIDCONJUNTO)'
      '  AND (R.IDEMPRESA      = :PIDEMPRESA)'
      '  AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      'ORDER BY R.CODCENTROCUSTO'
      ''
      '')
    ValidateWithMask = True
    Left = 484
    Top = 474
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryCCrdIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryCCrdCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCCrdPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
    end
    object qryCCrdDTAINICIO: TDateTimeField
      FieldName = 'DTAINICIO'
    end
    object qryCCrdDTAFIM: TDateTimeField
      FieldName = 'DTAFIM'
    end
    object qryCCrdNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryCCrdTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object qryPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLATIPCONVGER,PLATIPCONVOFICIAL,PLANO,PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE (PLANO           = :PPLANO)'
      '  AND (RTRIM(PLACONTA) = :PPLACONTA)'
      ''
      '')
    ValidateWithMask = True
    Left = 228
    Top = 474
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end>
    object qryPlanoContaPLATIPCONVGER: TStringField
      FieldName = 'PLATIPCONVGER'
      Origin = 'PLANOCONTA.PLATIPCONVGER'
      Size = 1
    end
    object qryPlanoContaPLATIPCONVOFICIAL: TStringField
      FieldName = 'PLATIPCONVOFICIAL'
      Origin = 'PLANOCONTA.PLATIPCONVOFICIAL'
      Size = 1
    end
    object qryPlanoContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryPlanoContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'PLANOCONTA.PLACCUST'
      Size = 1
    end
  end
  object qryConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,PLACONTA,CODCENTROCUSTO,IDGRUPO,'
      '       IDTIPOMOVIMENTACAO,TIPOLANCAMENTO'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO            = :PIDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO = :PIDTIPOMOVIMENTACAO)'
      '  AND (TIPOLANCAMENTO     = :PTIPOLANCAMENTO)'
      '  AND (PLANO              = :PPLANO)')
    ValidateWithMask = True
    Left = 428
    Top = 474
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.PLANO'
    end
    object qryContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.PLACONTA'
      Size = 18
    end
    object qryContaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.CODCENTROCUSTO'
      Size = 10
    end
    object qryContaIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.IDGRUPO'
    end
    object qryContaIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO'
    end
    object qryContaTIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.TIPOLANCAMENTO'
      Size = 1
    end
  end
  object qryGrupoCtb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.NOME'
      'FROM    GRUPO G,'
      '               PLANOGRUPO   PG'
      'WHERE (G.IDGRUPO     = :PIDGRUPO)'
      '      AND (PG.IDPESSOA = :PIDPESSOA)'
      '      AND (G.TIPO             = '#39'A'#39' )'
      '      AND (G.STATUS       = '#39'A'#39' )'
      '      AND (G.IDGRUPO     = PG.IDGRUPO)'
      'ORDER BY G.NOME'
      '')
    ValidateWithMask = True
    Left = 92
    Top = 474
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMontaCtb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,'
      '       PLACONTA, LACDEBCRE, CODCENTROCUSTO, CODSUBCONTA,'
      '       ('#39'                  '#39') AS PLACONTADEB,'
      '       ('#39'                  '#39') AS PLACONTACRE,'
      '       ('#39'          '#39') AS CODCENTROCUSTODEB,'
      '       ('#39'          '#39') AS CODCENTROCUSTOCRE,'
      '       (0) AS CODSUBCONTADEB,'
      '       (0) AS CODSUBCONTACRE,'
      '       UNIDNEGOC, IDPLANOPREV, IDPATRO,'
      '       ('#39' '#39') AS PLATIPCONVOFIDEB,'
      '       ('#39' '#39') AS PLATIPCONVGERDEB,'
      '       ('#39' '#39') AS PLATIPCONVOFICRE,'
      '       ('#39' '#39') AS PLATIPCONVGERCRE,'
      
        '       LACNUMDOC, LACHIST1, LACHIST2, LACHIST3, LACHIST4, LACHIS' +
        'T5,'
      '       LACVALOR, LACVALOFICIAL, LACVALGERENCIAL'
      'FROM LANCAMENTO'
      'WHERE (PLNCODIGO = 0)'
      ''
      ' ')
    UpdateObject = updMontaCtb
    ValidateWithMask = True
    Left = 44
    Top = 466
    object qryMontaCtbPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryMontaCtbPLACONTA: TStringField
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryMontaCtbLACDEBCRE: TStringField
      FieldName = 'LACDEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryMontaCtbCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryMontaCtbCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryMontaCtbPLACONTADEB: TStringField
      FieldName = 'PLACONTADEB'
      FixedChar = True
      Size = 18
    end
    object qryMontaCtbPLACONTACRE: TStringField
      FieldName = 'PLACONTACRE'
      FixedChar = True
      Size = 18
    end
    object qryMontaCtbCODCENTROCUSTODEB: TStringField
      FieldName = 'CODCENTROCUSTODEB'
      FixedChar = True
      Size = 10
    end
    object qryMontaCtbCODCENTROCUSTOCRE: TStringField
      FieldName = 'CODCENTROCUSTOCRE'
      FixedChar = True
      Size = 10
    end
    object qryMontaCtbCODSUBCONTADEB: TFloatField
      FieldName = 'CODSUBCONTADEB'
    end
    object qryMontaCtbCODSUBCONTACRE: TFloatField
      FieldName = 'CODSUBCONTACRE'
    end
    object qryMontaCtbUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryMontaCtbIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMontaCtbIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryMontaCtbPLATIPCONVOFIDEB: TStringField
      FieldName = 'PLATIPCONVOFIDEB'
      FixedChar = True
      Size = 1
    end
    object qryMontaCtbPLATIPCONVGERDEB: TStringField
      FieldName = 'PLATIPCONVGERDEB'
      FixedChar = True
      Size = 1
    end
    object qryMontaCtbPLATIPCONVOFICRE: TStringField
      FieldName = 'PLATIPCONVOFICRE'
      FixedChar = True
      Size = 1
    end
    object qryMontaCtbPLATIPCONVGERCRE: TStringField
      FieldName = 'PLATIPCONVGERCRE'
      FixedChar = True
      Size = 1
    end
    object qryMontaCtbLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Size = 15
    end
    object qryMontaCtbLACHIST1: TStringField
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryMontaCtbLACHIST2: TStringField
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryMontaCtbLACHIST3: TStringField
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryMontaCtbLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Size = 40
    end
    object qryMontaCtbLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Size = 40
    end
    object qryMontaCtbLACVALOR: TFloatField
      FieldName = 'LACVALOR'
    end
    object qryMontaCtbLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
    end
    object qryMontaCtbLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
    end
  end
  object updMontaCtb: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  PLACONTA = :PLACONTA,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  PLANO = :PLANO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO'
      'where'
      '  LACDEBCRE = :OLD_LACDEBCRE and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  PLACONTA = :OLD_PLACONTA and'
      '  PLANO = :OLD_PLANO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPATRO = :OLD_IDPATRO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (LACNUMDOC, LACDEBCRE, LACHIST1, LACHIST2, LACHIST3, LACHIST4,' +
        ' LACHIST5, '
      
        '   CODCENTROCUSTO, UNIDNEGOC, PLACONTA, LACVALOR, LACVALOFICIAL,' +
        ' LACVALGERENCIAL, '
      '   PLANO, CODSUBCONTA, IDPLANOPREV, IDPATRO)'
      'values'
      
        '  (:LACNUMDOC, :LACDEBCRE, :LACHIST1, :LACHIST2, :LACHIST3, :LAC' +
        'HIST4, '
      
        '   :LACHIST5, :CODCENTROCUSTO, :UNIDNEGOC, :PLACONTA, :LACVALOR,' +
        ' :LACVALOFICIAL, '
      
        '   :LACVALGERENCIAL, :PLANO, :CODSUBCONTA, :IDPLANOPREV, :IDPATR' +
        'O)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  LACDEBCRE = :OLD_LACDEBCRE and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  PLACONTA = :OLD_PLACONTA and'
      '  PLANO = :OLD_PLANO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPATRO = :OLD_IDPATRO')
    Left = 284
    Top = 474
  end
  object qryRegistraReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVAL'
      '               (IDMOVIMENTACAO,'
      '                VALORGLAUDO,'
      '                VALORGANT,'
      '                TAXADEPANT,'
      '                OBS)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PVALORGLAUDO,'
      '                :PVALORGANT,'
      '                :PTAXADEPORG,'
      '                :POBS)')
    ValidateWithMask = True
    Left = 412
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORGLAUDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORGANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEPORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALIACAO'
      '        (IDREAVALIACAO,'
      '         IDMOVIMENTACAO,'
      '         IDBEM,'
      '         IDPESSOA,'
      '         DATAREAVALIACAO,'
      '         VALORG,'
      '         CMBEM,'
      '         VALFIS,'
      '         VALGER,'
      '         TAXADEP,'
      '         DEPLANC,'
      '         CMDEP,'
      '         DEPFIS,'
      '         DEPGER,'
      '         DATAULTDEP,'
      '         FLGDEPREC,'
      '         FLGULTREAVAL)'
      'VALUES (:PIDREAVALIACAO,'
      '        :PIDMOVIMENTACAO,'
      '        :PIDBEM,'
      '        :PIDPESSOA,'
      '        :PDATAREAVALIACAO,'
      '        :PVALORG,'
      '        :PCMBEM,'
      '        :PVALFIS,'
      '        :PVALGER,'
      '        :PTAXADEP,'
      '        :PDEPLANC,'
      '        :PCMDEP,'
      '        :PDEPFIS,'
      '        :PDEPGER,'
      '        :PDATAULTDEP,'
      '        :PFLGDEPREC,'
      '        :PFLGULTREAVAL)'
      '')
    ValidateWithMask = True
    Left = 548
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGULTREAVAL'
        ParamType = ptUnknown
      end>
  end
  object qryReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREAVALIACAO,IDBEM,IDPESSOA,IDMOVIMENTACAO,'
      '               DATAREAVALIACAO,VALORG,CMBEM,VALFIS,VALGER,'
      '               DEPLANC,CMDEP,DEPFIS,DEPGER,DATAULTDEP,'
      '               FLGDEPREC,TAXADEP,FLGULTREAVAL,'
      '               ((VALORG + CMBEM)-(DEPLANC + CMDEP)) AS VALCTB'
      'FROM    REAVALIACAO'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '      AND (IDBEM        = :PIDBEM)'
      'ORDER BY FLGULTREAVAL, IDREAVALIACAO')
    UpdateObject = updReavaliacao
    ValidateWithMask = True
    Left = 148
    Top = 450
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
  end
  object updReavaliacao: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  IDREAVALIACAO = :IDREAVALIACAO,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAREAVALIACAO = :DATAREAVALIACAO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  TAXADEP = :TAXADEP,'
      '  FLGULTREAVAL = :FLGULTREAVAL'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      
        '  (IDREAVALIACAO, IDBEM, IDPESSOA, IDMOVIMENTACAO, DATAREAVALIAC' +
        'AO, VALORG, '
      
        '   CMBEM, VALFIS, VALGER, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAUL' +
        'TDEP, FLGDEPREC, '
      '   TAXADEP, FLGULTREAVAL)'
      'values'
      
        '  (:IDREAVALIACAO, :IDBEM, :IDPESSOA, :IDMOVIMENTACAO, :DATAREAV' +
        'ALIACAO, '
      
        '   :VALORG, :CMBEM, :VALFIS, :VALGER, :DEPLANC, :CMDEP, :DEPFIS,' +
        ' :DEPGER, '
      '   :DATAULTDEP, :FLGDEPREC, :TAXADEP, :FLGULTREAVAL)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 340
    Top = 152
  end
  object qryRegistraBaixaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BAIXABEM'
      '               (IDMOVIMENTACAO,'
      '                IDMOTIVOBAIXA,'
      '                PROPBAIXAR,'
      '                OBS,'
      '                IDREAVAL)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PIDMOTIVOBAIXA,'
      '                :PPROPBAIXAR,'
      '                :POBS,'
      '                :PIDREAVAL)'
      '')
    ValidateWithMask = True
    Left = 324
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOTIVOBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPROPBAIXAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVAL'
        ParamType = ptUnknown
      end>
  end
  object qryHistCtb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO  '
      'SET PLNCODIGO = :PPLNCODIGO'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)')
    ValidateWithMask = True
    Left = 436
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qrySldContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.TAXADEP, B.DATAULTDEP,'
      
        '       SB.VALORG                                            AS V' +
        'ALORG0,'
      
        '       SB.REAVVALORG                                        AS V' +
        'ALREAVACUM0,'
      
        '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0))         AS C' +
        'MBEMATU0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM)                            AS C' +
        'MBEMACUM0,'
      
        '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0))       AS D' +
        'EPLANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC)                        AS D' +
        'EPLANCACUM0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP)                            AS C' +
        'MDEPLANCACUM0,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      
        '        SB.REAVDEPLANC - SB.REAVCMDEP)                      AS V' +
        'ALCTB0,'
      ''
      
        '       SB.ULTREAVVALORG                                     AS V' +
        'ALULTREAVACUM1,'
      
        '       NVL(ATU.VALCMULTREAV,0)                              AS V' +
        'ALULTCMREAVATU,'
      
        '       SB.ULTREAVCMBEM                                      AS V' +
        'ALULTCMREAVACUM1,'
      
        '       NVL(ATU.VALDEPULTREAV,0)                             AS V' +
        'ALULTDEPREAVATU,'
      
        '       SB.ULTREAVDEPLANC                                    AS V' +
        'ALULTDEPREAVACUM1,'
      
        '       SB.ULTREAVCMDEP                                      AS V' +
        'ALULTCMDEPREAVACUM1,'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS V' +
        'ALCTB1,'
      ''
      
        '       (SB.REAVVALORG + SB.ULTREAVVALORG)                   AS S' +
        'UMPARCREAV,'
      '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0) +'
      
        '        NVL(ATU.VALCMULTREAV,0))                            AS S' +
        'UMCMBEMATU,'
      '       (SB.CMBEM + SB.REAVCMBEM +'
      
        '        SB.ULTREAVCMBEM)                                    AS S' +
        'UMCMBEMACUM,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                           AS S' +
        'UMDEPATU,'
      '       (SB.DEPLANC + SB.REAVDEPLANC +'
      
        '        SB.ULTREAVDEPLANC)                                  AS S' +
        'UMDEPACUM,'
      '       (SB.CMDEP + SB.REAVCMDEP +'
      
        '        SB.ULTREAVCMDEP)                                    AS S' +
        'UMCMDEPACUM,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP) +'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS S' +
        'UMVALCTB,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.REAVVALORG + SB.REAVCMBEM) +'
      
        '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM)                 AS S' +
        'UMVALCTBIMOB,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,'
      '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATAMOV)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.IDBEM = :PIDBEM)'
      '        AND (SCB.IDPESSOA = :PIDPESSOA)'
      '        AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.IDBEM = :PIDBEM)'
      '               AND (HM.IDPESSOA = :PIDPESSOA)'
      '               AND (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.IDBEM = :PIDBEM)'
      '                 AND (HM.IDPESSOA = :PIDPESSOA)'
      '                 AND (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.IDBEM = :PIDBEM)'
      '                 AND (HM.IDPESSOA = :PIDPESSOA)'
      '                 AND (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G, CONJUNTO C'
      ''
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO(+))'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 420
    Top = 440
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEPERIODICIDADE, MOEDESC'
      'FROM   MOEDA'
      'WHERE (MOECODIGO = :PMOEDA)')
    ValidateWithMask = True
    Left = 492
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end>
    object qryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Size = 1
    end
    object qryMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
  end
  object qryMoedaM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR               '
      'FROM COTACAOMOEDA         '
      'WHERE (MOECODIGO = :PMOEDA)'
      '      AND (COTMESREF = :PCOTMES)')
    ValidateWithMask = True
    Left = 289
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOTMES'
        ParamType = ptUnknown
      end>
    object qryMoedaMCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
  end
  object qryMoedaD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR               '
      'FROM COTACAOMOEDA         '
      'WHERE (MOECODIGO = :PMOEDA)'
      '      AND (COTDATA      = :PCOTDATA)')
    ValidateWithMask = True
    Left = 236
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PCOTDATA'
        ParamType = ptUnknown
      end>
    object qryMoedaDCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
  end
  object qryPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME, FLGFORNSERV '
      'FROM PESSOA'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 212
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryPessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryPessoaFLGFORNSERV: TFloatField
      FieldName = 'FLGFORNSERV'
      Origin = 'PESSOA.FLGFORNSERV'
    end
  end
  object qryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,NOME,DEPRECIACAO AS TAXADEP,CLASSE,FLGSEMPLACA'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'A'#39')'
      '  AND (IDGRUPO = :PIDGRUPO)')
    ValidateWithMask = True
    Left = 300
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGruposIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryGruposNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGruposTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryGruposCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGruposFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
      Origin = 'GRUPO.FLGSEMPLACA'
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPESSOA, CODSUBCONTA, NOMESUBCONTA'
      'FROM     SUBCONTA'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '      AND  (CODSUBCONTA = :PIDSUBCONTA)')
    ValidateWithMask = True
    Left = 380
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSUBCONTA'
        ParamType = ptUnknown
      end>
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACA, DESBEM, IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PIDPLACA)')
    ValidateWithMask = True
    Left = 524
    Top = 328
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPLACA'
        ParamType = ptUnknown
      end>
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDSITUACAO, DESCSITUACAO'
      'FROM     SITUACAO'
      'WHERE  (IDSITUACAO = :PIDSITUACAO)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 220
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDSITUACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BEM (IDBEM,'
      '                 IDPESSOA,'
      '                 IDCONJUNTO,'
      '                 IDTERCEIRO,'
      '                 IDGRUPO,'
      '                 CODSUBCONTA,'
      '                 IDCLASSEBEM,'
      '                 IDMODULO,'
      '                 IDITENSRECDEV,'
      '                 IDFORNSERV,'
      '                 IDSITUACAO,'
      '                 IDIMAGEM,'
      '                 REGISTRO,'
      '                 CONTROLE,'
      '                 PLACA,'
      '                 NUMSERIE,'
      '                 DESBEM,'
      '                 IDNOTA,'
      '                 COMPLNOTA,'
      '                 DTANOTA,'
      '                 DTAINCLUSAO,'
      '                 VALHISTORICO,'
      '                 VALORG,'
      '                 CMBEM,'
      '                 VALFIS,'
      '                 VALGER,'
      '                 DATAINICIODEP,'
      '                 VALDEPINI,'
      '                 TAXADEP,'
      '                 DEPLANC,'
      '                 CMDEP,'
      '                 DEPFIS,'
      '                 DEPGER,'
      '                 DATAULTDEP,'
      '                 DATARECALCDEP,'
      '                 FLGDEPREC,'
      '                 PROPBAIXA,'
      '                 BAIXATOTAL,'
      '                 PRIORIDADE,'
      '                 DATAINSTALACAO,'
      '                 DATATERMINOGAR,'
      '                 IDOPCIONAL,'
      '                 UNIDNEGOC,'
      '                 PROCESSOAQUIS,'
      '                 EMPENHOAQUIS,'
      '                 PUBAUTOR,'
      '                 PUBEDITORA,'
      '                 PUBANO,'
      '                 FLGBEMINTCONTAB,'
      '                 DTACONTAB)'
      'VALUES          (:PIDBEM,'
      '                 :PIDPESSOA,'
      '                 :PIDCONJUNTO,'
      '                 :PIDTERCEIRO,'
      '                 :PIDGRUPO,'
      '                 :PSUBCONTA,'
      '                 :PIDCLASSEBEM,'
      '                 :PIDMODULO,'
      '                 :PIDITENSRECDEV,'
      '                 :PIDFORNSERV,'
      '                 :PIDSITUACAO,'
      '                 :PIDIMAGEM,'
      '                 :PREGISTRO,'
      '                 :PCONTROLE,'
      '                 :PPLACA,'
      '                 :PNUMSERIE,'
      '                 :PDESBEM,'
      '                 :PIDNOTA,'
      '                 :PCOMPLNOTA,'
      '                 :PDTANOTA,'
      '                 :PDTAINCLUSAO,'
      '                 :PVALHISTORICO,'
      '                 :PVALORG,'
      '                 :PCMBEM,'
      '                 :PVALFIS,'
      '                 :PVALGER,'
      '                 :PDATAINICIODEP,'
      '                 :PVALDEPINI,'
      '                 :PTAXADEP,'
      '                 :PDEPLANC,'
      '                 :PCMDEP,'
      '                 :PDEPFIS,'
      '                 :PDEPGER,'
      '                 :PDATAULTDEP,'
      '                 :PDATARECALCDEP,'
      '                 :PFLGDEPREC,'
      '                 :PPROPBAIXA,'
      '                 :PBAIXATOTAL,'
      '                 :PPRIORIDADE,'
      '                 :PDATAINSTALACAO,'
      '                 :PDATATERMINOGAR,'
      '                 :PIDOPCIONAL,'
      '                 :PUNIDNEGOC,'
      '                 :PPROCESSOAQUIS,'
      '                 :PEMPENHOAQUIS,'
      '                 :PPUBAUTOR,'
      '                 :PPUBEDITORA,'
      '                 :PPUBANO,'
      '                 :PFLGBEMINTCONTAB,'
      '                 :PDTACONTAB)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 228
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTERCEIRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDITENSRECDEV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORNSERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PREGISTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCONTROLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDESBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOMPLNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTANOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALDEPINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATARECALCDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPROPBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPRIORIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINSTALACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATATERMINOGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDOPCIONAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PUNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPROCESSOAQUIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PEMPENHOAQUIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPUBAUTOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPUBEDITORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPUBANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGBEMINTCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDTACONTAB'
        ParamType = ptUnknown
      end>
  end
  object qryClasseBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSEBEM,ANASINT,DESCRICAO'
      'FROM CLASSEDEBEM'
      'WHERE (IDCLASSEBEM = :PIDCLASSEBEM)')
    ValidateWithMask = True
    Left = 572
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end>
    object qryClasseBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEDEBEM".IDCLASSEBEM'
    end
    object qryClasseBemANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = '"CM.CLASSEDEBEM".ANASINT'
      Size = 1
    end
    object qryClasseBemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
  end
  object qryContasxCc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO FROM CONTASXCC'
      'WHERE (IDEMPRESA             = :PIDEMPRESA)'
      '  AND (PLANO                 = :PPLANO)'
      '  AND (RTRIM(PLACONTA)       = :PPLACONTA)'
      '  AND (RTRIM(CODCENTROCUSTO) = :PCODCENTROCUSTO)')
    ValidateWithMask = True
    Left = 460
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end>
    object qryContasxCcCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CONTASXCC.CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryContasxSubC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA FROM CONTASXSUBC '
      'WHERE (IDPESSOA        = :PIDEMPRESA)'
      '  AND (PLANO           = :PPLANO)'
      '  AND (RTRIM(PLACONTA) = :PPLACONTA)'
      '  AND (CODSUBCONTA     = :PCODSUBCONTA)')
    ValidateWithMask = True
    Left = 92
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODSUBCONTA'
        ParamType = ptUnknown
      end>
    object qryContasxSubCCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'CONTASXSUBC.CODSUBCONTA'
    end
  end
  object qryRegistraBemTotal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BEM'
      'SET CODSUBCONTA   = :PSUBCONTA,'
      '    UNIDNEGOC     = :PUNIDNEGOC,'
      '    CONTROLE      = '#39'T'#39','
      '    VALHISTORICO  = :PVALHISTORICO,'
      '    VALORG        = :PVALORG,'
      '    CMBEM         = 0,'
      '    VALFIS        = :PVALFIS,'
      '    VALGER        = :PVALGER,'
      '    VALDEPINI     = 0,'
      '    DEPLANC       = 0,'
      '    CMDEP         = 0,'
      '    DEPFIS        = 0,'
      '    DEPGER        = 0,'
      '    DATAINICIODEP = :PDATAINICIODEP,'
      '    DATAULTDEP    = :PDATAULTDEP,'
      '    DATARECALCDEP = :PDATARECALCDEP'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 396
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PUNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATARECALCDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ACRESCIMOVALOR'
      '                (IDACRESCIMO,'
      '                 IDPESSOA, '
      '                 IDBEM, '
      '                 IDMOVIMENTACAO, '
      '                 DATAACRESCIMO, '
      '                 VALORG, '
      '                 CMBEM,'
      '                 VALFIS, '
      '                 VALGER, '
      '                 TAXADEP,'
      '                 DEPLANC, '
      '                 CMDEP, '
      '                 DEPFIS, '
      '                 DEPGER, '
      '                 DATAULTDEP,'
      '                 FLGDEPREC)'
      'VALUES  (:PIDACRESCIMO,'
      '                 :PIDPESSOA, '
      '                 :PIDBEM, '
      '                 :PIDMOVIMENTACAO, '
      '                 :PDATAACRESCIMO, '
      '                 :PVALORG, '
      '                 :PCMBEM,'
      '                 :PVALFIS, '
      '                 :PVALGER,'
      '                 :PTAXADEP, '
      '                 :PDEPLANC, '
      '                 :PCMDEP, '
      '                 :PDEPFIS, '
      '                 :PDEPGER, '
      '                 :PDATAULTDEP,'
      '                 :PFLGDEPREC)')
    ValidateWithMask = True
    Left = 244
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ACRESCVALOR'
      '           (IDMOVIMENTACAO,'
      '            IDTIPODESPESA,'
      '            OBS)'
      'VALUES     (:PIDMOVIMENTACAO,'
      '            :PIDTIPODESPESA,'
      '            :POBS)')
    ValidateWithMask = True
    Left = 204
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPODESPESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDespAV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPODESPESA,DESTIPODESPESA'
      'FROM    TIPODESPESAAV')
    ValidateWithMask = True
    Left = 156
    Top = 368
    object qryTipoDespAVIDTIPODESPESA: TFloatField
      FieldName = 'IDTIPODESPESA'
      Origin = 'TIPODESPESAAV.IDTIPODESPESA'
    end
    object qryTipoDespAVDESTIPODESPESA: TStringField
      FieldName = 'DESTIPODESPESA'
      Origin = 'TIPODESPESAAV.DESTIPODESPESA'
      Size = 50
    end
  end
  object qryAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDACRESCIMO,IDPESSOA,IDBEM,IDMOVIMENTACAO,'
      '       DATAACRESCIMO,VALORG,CMBEM,VALFIS,VALGER,'
      '       TAXADEP,DEPLANC,CMDEP,DEPFIS,DEPGER,DATAULTDEP,'
      '       FLGDEPREC,'
      '       ((VALORG + CMBEM)-(DEPLANC + CMDEP)) AS VALCTB'
      'FROM   ACRESCIMOVALOR'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (IDBEM    = :PIDBEM)'
      '       '
      ' ')
    UpdateObject = updAcrescimo
    ValidateWithMask = True
    Left = 404
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
  end
  object updAcrescimo: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  IDACRESCIMO = :IDACRESCIMO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBEM = :IDBEM,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAACRESCIMO = :DATAACRESCIMO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      
        '  (IDACRESCIMO, IDPESSOA, IDBEM, IDMOVIMENTACAO, DATAACRESCIMO, ' +
        'VALORG, '
      
        '   CMBEM, VALFIS, VALGER, TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGE' +
        'R, DATAULTDEP, '
      '   FLGDEPREC)'
      'values'
      
        '  (:IDACRESCIMO, :IDPESSOA, :IDBEM, :IDMOVIMENTACAO, :DATAACRESC' +
        'IMO, :VALORG, '
      
        '   :CMBEM, :VALFIS, :VALGER, :TAXADEP, :DEPLANC, :CMDEP, :DEPFIS' +
        ', :DEPGER, '
      '   :DATAULTDEP, :FLGDEPREC)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 362
    Top = 336
  end
  object qryRegistraReavalReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALREAVAL'
      '               (IDMOVIMENTACAO,'
      '                IDREAVALIACAO,'
      '                TAXADEPORG)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PIDREAVALIACAO,'
      '                :PTAXADEPORG)')
    ValidateWithMask = True
    Left = 508
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEPORG'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraReavalAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALACRESC'
      '               (IDMOVIMENTACAO,'
      '                IDACRESCIMO,'
      '                TAXADEPORG)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PIDACRESCIMO,'
      '                :PTAXADEPORG)')
    ValidateWithMask = True
    Left = 172
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEPORG'
        ParamType = ptUnknown
      end>
  end
  object qryTipoMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO,'
      '               LANCAMENTO, IDCONTAB'
      'FROM TIPOMOVIMENTACAO')
    UpdateObject = updTipoMov
    ValidateWithMask = True
    Left = 364
    Top = 8
    object qryTipoMovIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO'
    end
    object qryTipoMovDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Origin = 'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryTipoMovLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Origin = 'TIPOMOVIMENTACAO.LANCAMENTO'
      Size = 1
    end
    object qryTipoMovIDCONTAB: TFloatField
      FieldName = 'IDCONTAB'
      Origin = 'TIPOMOVIMENTACAO.IDCONTAB'
    end
  end
  object updTipoMov: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOMOVIMENTACAO'
      'set'
      '  IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO,'
      '  DESCTIPOMOVIMENTACAO = :DESCTIPOMOVIMENTACAO,'
      '  LANCAMENTO = :LANCAMENTO,'
      '  IDCONTAB = :IDCONTAB'
      'where'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    InsertSQL.Strings = (
      'insert into TIPOMOVIMENTACAO'
      
        '  (IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO, LANCAMENTO, IDCONTA' +
        'B)'
      'values'
      
        '  (:IDTIPOMOVIMENTACAO, :DESCTIPOMOVIMENTACAO, :LANCAMENTO, :IDC' +
        'ONTAB)')
    DeleteSQL.Strings = (
      'delete from TIPOMOVIMENTACAO'
      'where'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    Left = 508
    Top = 40
  end
  object qryDeprecBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOBEM '
      '               (IDMOVIMENTACAO,'
      '                DATAULTDEP)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PDATAULTDEP)')
    ValidateWithMask = True
    Left = 460
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryDeprecReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOREAVAL'
      '              (IDMOVIMENTACAO, '
      '               IDREAVALIACAO,'
      '               DATAULTDEP)'
      'VALUES (:PIDMOVIMENTACAO, '
      '                :PIDREAVALIACAO,'
      '                :PDATAULTDEP)')
    ValidateWithMask = True
    Left = 300
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryDeprecAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOACRESC '
      '                        (IDMOVIMENTACAO,'
      '                         IDACRESCIMO,'
      '                         DATAULTDEP)'
      '         VALUES (:PIDMOVIMENTACAO,'
      '                         :PIDACRESCIMO,'
      '                         :PDATAULTDEP)')
    ValidateWithMask = True
    Left = 498
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryMotivoBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM MOTIVOBAIXA')
    ValidateWithMask = True
    Left = 498
    Top = 240
    object qryMotivoBaixaIDMOTIVOBAIXA: TFloatField
      FieldName = 'IDMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.IDMOTIVOBAIXA'
    end
    object qryMotivoBaixaDESCMOTIVOBAIXA: TStringField
      FieldName = 'DESCMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.DESCMOTIVOBAIXA'
      Size = 30
    end
  end
  object qryEstornaMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '  AND (IDMOVIMENTACAO = :PIDMOVIM)'
      '')
    ValidateWithMask = True
    Left = 498
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDMOVIM'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALIACAO'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)')
    ValidateWithMask = True
    Left = 490
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 114
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReavalReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALREAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 266
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReavalAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALACRESC'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 426
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryUltMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDBEM    = :PIDBEM)'
      '')
    ValidateWithMask = True
    Left = 306
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryUltMovDATAULTMOV: TDateTimeField
      FieldName = 'DATAULTMOV'
      Origin = '"CM.HISTORICOMOVIMENTACAO".DATAMOVIMENTACAO'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 162
    Top = 272
  end
  object qryEstornaBaixaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BAIXABEM'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 162
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraTransfLocal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFLOCAL'
      '            (IDMOVIMENTACAO,'
      '             IDLOCALANT,'
      '             IDRESPANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PIDLOCALANT,'
      '             :PIDRESPANT)')
    ValidateWithMask = True
    Left = 170
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDLOCALANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDRESPANT'
        ParamType = ptUnknown
      end>
  end
  object qryConjunto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCONJUNTO, IDPESSOA, DESCCONJUNTO, IDLOCALIZACAO, IDRESP' +
        'ONSAVEL,'
      '       DISPONIVEL, ALUGADO'
      'FROM CONJUNTO'
      'WHERE (IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (IDPESSOA   = :PIDPESSOA)'
      '  ')
    UpdateObject = updConjunto
    ValidateWithMask = True
    Left = 32
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updConjunto: TUpdateSQL
    ModifySQL.Strings = (
      'update CONJUNTO'
      'set'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  DESCCONJUNTO = :DESCCONJUNTO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  DISPONIVEL = :DISPONIVEL,'
      '  ALUGADO = :ALUGADO'
      'where'
      '  IDCONJUNTO = :OLD_IDCONJUNTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CONJUNTO'
      
        '  (IDCONJUNTO, IDPESSOA, DESCCONJUNTO, IDLOCALIZACAO, IDRESPONSA' +
        'VEL, DISPONIVEL, '
      '   ALUGADO)'
      'values'
      
        '  (:IDCONJUNTO, :IDPESSOA, :DESCCONJUNTO, :IDLOCALIZACAO, :IDRES' +
        'PONSAVEL, '
      '   :DISPONIVEL, :ALUGADO)')
    DeleteSQL.Strings = (
      'delete from CONJUNTO'
      'where'
      '  IDCONJUNTO = :OLD_IDCONJUNTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 32
    Top = 417
  end
  object qryLocalizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO, IDPESSOA, IDRESPONSAVEL,'
      '       NOME, CODCENTROCUSTO'
      'FROM LOCALIZACAO'
      'WHERE (IDPESSOA      = :PIDPESSOA)'
      '  AND (IDLOCALIZACAO = :PIDLOCALIZACAO)'
      '  ')
    ValidateWithMask = True
    Left = 266
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptUnknown
      end>
    object qryLocalizacaoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.LOCALIZACAO".IDLOCALIZACAO'
    end
    object qryLocalizacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.LOCALIZACAO".IDPESSOA'
    end
    object qryLocalizacaoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.LOCALIZACAO".IDRESPONSAVEL'
    end
    object qryLocalizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryLocalizacaoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.LOCALIZACAO".CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryEstornaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BEM'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 109
    Top = 417
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM ACRESCIMOVALOR'
      'WHERE (IDBEM       = :PIDBEM)'
      '  AND (IDPESSOA    = :PIDPESSOA)'
      '  AND (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      '')
    ValidateWithMask = True
    Left = 218
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaAcrescValor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM ACRESCVALOR'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 274
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraTransfConj: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFCONJUNTO'
      '            (IDMOVIMENTACAO,'
      '             IDCONJANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PIDCONJANT)')
    ValidateWithMask = True
    Left = 394
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJANT'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraTransfGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFGRUPO'
      '            (IDMOVIMENTACAO,'
      '             IDGRUPANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PIDGRUPANT)')
    ValidateWithMask = True
    Left = 492
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPANT'
        ParamType = ptUnknown
      end>
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRESPONSAVEL, P.NOME AS NOMERESPONSAVEL'
      'FROM RESPONSAVEL R, PESSOA P'
      'WHERE (R.IDRESPONSAVEL = :PIDRESP)'
      '  AND (R.IDRESPONSAVEL = P.IDPESSOA(+))'
      '')
    ValidateWithMask = True
    Left = 388
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESP'
        ParamType = ptUnknown
      end>
    object qryResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryResponsavelNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
  end
  object qryRegistraTransfPlaca: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFPLACA'
      '            (IDMOVIMENTACAO,'
      '             PLACAANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PPLACAANT)')
    ValidateWithMask = True
    Left = 314
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLACAANT'
        ParamType = ptUnknown
      end>
  end
  object qryUltDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTDEP'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDBEM    = :PIDBEM)'
      '  AND  (IDTIPOMOVIMENTACAO IN (14,18,35))'
      ' ')
    ValidateWithMask = True
    Left = 292
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryUltDepDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
  end
  object qryRatPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PPB.IDPLANOPREV,'
      '       PP.NOME AS DESCPLANOPREV,'
      '       PPB.IDPATRO,'
      '       P.NOME AS DESCPATRO,'
      '       PPB.PPBPERCRATEIO'
      'FROM PLANOPATROXBEM PPB,'
      '     PLANPREVCONTABIL PP,'
      '     PESSOA P'
      'WHERE (PPB.IDBEM    = :PIDBEM)'
      '  AND (PPB.IDPESSOA = :PIDEMPRESA)'
      '  AND (PPB.IDPLANOPREV = PP.IDPLANOPREV)'
      '  AND (PPB.IDPATRO     = P.IDPESSOA)'
      ''
      '')
    ValidateWithMask = True
    Left = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryRatPPIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.PLANOPATROXBEM".IDPLANOPREV'
    end
    object qryRatPPDESCPLANOPREV: TStringField
      FieldName = 'DESCPLANOPREV'
      Origin = 'PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryRatPPIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = '"CM.PLANOPATROXBEM".IDPATRO'
    end
    object qryRatPPDESCPATRO: TStringField
      FieldName = 'DESCPATRO'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryRatPPPPBPERCRATEIO: TFloatField
      FieldName = 'PPBPERCRATEIO'
      Origin = '"CM.PLANOPATROXBEM".PPBPERCRATEIO'
    end
  end
  object sqlScript: TCMSQLScript
    Commit = ctNone
    DataBaseName = 'Basedados'
    Left = 258
    Top = 40
  end
  object qryUltReav: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDBEM    = :PIDBEM)'
      '  AND  (IDTIPOMOVIMENTACAO IN (08,32))'
      '  AND  (DATAMOVIMENTACAO = :PDATAMOV)')
    ValidateWithMask = True
    Left = 324
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryUltReavIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
  end
  object qryRegistraDesmembramento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESMEMBRAMENTO'
      '           (IDMOVIMENTACAO,'
      '            IDBEMRESULTANTE,'
      '            PROPORCAO)'
      'VALUES     (:IDMOVIMENTACAO,'
      '            :IDBEMRESULTANTE,'
      '            :PROPORCAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 146
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEMRESULTANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PROPORCAO'
        ParamType = ptUnknown
      end>
  end
  object qryBensResultantes: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT DM.IDBEMRESULTANTE AS IDBEM'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     DESMEMBRAMENTO DM'
      'WHERE (HM.IDBEM = :PIDBEMORIG)'
      '  AND (HM.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      '  AND (HM.IDMOVIMENTACAO = DM.IDMOVIMENTACAO)')
    ValidateWithMask = True
    Left = 250
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEMORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end>
    object qryBensResultantesIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.DESMEMBRAMENTO.IDBEMRESULTANTE'
    end
  end
  object updSaldoContabBem: TUpdateSQL
    ModifySQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  REAVVALORG = :REAVVALORG,'
      '  REAVCMBEM = :REAVCMBEM,'
      '  REAVDEPLANC = :REAVDEPLANC,'
      '  REAVCMDEP = :REAVCMDEP,'
      '  ULTREAVVALORG = :ULTREAVVALORG,'
      '  ULTREAVCMBEM = :ULTREAVCMBEM,'
      '  ULTREAVDEPLANC = :ULTREAVDEPLANC,'
      '  ULTREAVCMDEP = :ULTREAVCMDEP,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATASLDBEM = :OLD_DATASLDBEM')
    InsertSQL.Strings = (
      'insert into SALDOCONTABBEM'
      
        '  (IDBEM, IDPESSOA, DATASLDBEM, VALORG, CMBEM, DEPLANC, CMDEP, R' +
        'EAVVALORG, '
      
        '   REAVCMBEM, REAVDEPLANC, REAVCMDEP, ULTREAVVALORG, ULTREAVCMBE' +
        'M, ULTREAVDEPLANC, '
      '   ULTREAVCMDEP, IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :DATASLDBEM, :VALORG, :CMBEM, :DEPLANC, :C' +
        'MDEP, :REAVVALORG, '
      
        '   :REAVCMBEM, :REAVDEPLANC, :REAVCMDEP, :ULTREAVVALORG, :ULTREA' +
        'VCMBEM, '
      
        '   :ULTREAVDEPLANC, :ULTREAVCMDEP, :IDGRUPO, :IDLOCALIZACAO, :ID' +
        'RESPONSAVEL)')
    DeleteSQL.Strings = (
      'delete from SALDOCONTABBEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATASLDBEM = :OLD_DATASLDBEM')
    Left = 186
    Top = 44
  end
  object qrySaldoContabBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,'
      '       SCB.VALORG, SCB.CMBEM, SCB.DEPLANC, SCB.CMDEP,'
      
        '       SCB.REAVVALORG, SCB.REAVCMBEM, SCB.REAVDEPLANC, SCB.REAVC' +
        'MDEP,'
      
        '       SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM, SCB.ULTREAVDEPLANC, ' +
        'SCB.ULTREAVCMDEP,'
      '       SCB.IDGRUPO, SCB.IDLOCALIZACAO, SCB.IDRESPONSAVEL,'
      '       ((SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP) -'
      
        '        (SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC - SCB.' +
        'REAVCMDEP) -'
      
        '        (SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM - SCB.ULTREAVDEPLA' +
        'NC - SCB.ULTREAVCMDEP)) AS VALOR'
      'FROM SALDOCONTABBEM SCB,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE (IDBEM = :PIDBEM)'
      '        AND (IDPESSOA = :PIDPESSOA)'
      '        AND (DATASLDBEM <= :PDATASLD)'
      '      GROUP BY IDBEM) DTAMAX'
      'WHERE (SCB.IDBEM = :PIDBEM)'
      '  AND (SCB.IDPESSOA = :PIDPESSOA)'
      '  AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '  AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      'ORDER BY DATASLDBEM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updSaldoContabBem
    ValidateWithMask = True
    Left = 186
    Top = 30
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySaldoContabBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySaldoContabBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySaldoContabBemDATASLDBEM: TDateTimeField
      FieldName = 'DATASLDBEM'
    end
    object qrySaldoContabBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qrySaldoContabBemCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qrySaldoContabBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qrySaldoContabBemCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qrySaldoContabBemREAVVALORG: TFloatField
      FieldName = 'REAVVALORG'
    end
    object qrySaldoContabBemREAVCMBEM: TFloatField
      FieldName = 'REAVCMBEM'
    end
    object qrySaldoContabBemREAVDEPLANC: TFloatField
      FieldName = 'REAVDEPLANC'
    end
    object qrySaldoContabBemREAVCMDEP: TFloatField
      FieldName = 'REAVCMDEP'
    end
    object qrySaldoContabBemULTREAVVALORG: TFloatField
      FieldName = 'ULTREAVVALORG'
    end
    object qrySaldoContabBemULTREAVCMBEM: TFloatField
      FieldName = 'ULTREAVCMBEM'
    end
    object qrySaldoContabBemULTREAVDEPLANC: TFloatField
      FieldName = 'ULTREAVDEPLANC'
    end
    object qrySaldoContabBemULTREAVCMDEP: TFloatField
      FieldName = 'ULTREAVCMDEP'
    end
    object qrySaldoContabBemVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qrySaldoContabBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySaldoContabBemIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySaldoContabBemIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle'
      'Valor Residual')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 114
    Top = 8
  end
  object sprSaldoContabBem: TwwStoredProc
    DatabaseName = 'Basedados'
    StoredProcName = 'SPRSALDOCONTABBEM'
    ValidateWithMask = True
    Left = 314
    Top = 20
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDBEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATASLDBEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVALORG'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PCMBEM'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PDEPLANC'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PCMDEP'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVVALORG'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVCMBEM'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVDEPLANC'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVCMDEP'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVVALORG'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVCMBEM'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVDEPLANC'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVCMDEP'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PCODMOV'
        ParamType = ptInput
        Value = 0
      end>
  end
  object qryMovContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT'
      '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO,'
      ''
      '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM -'
      
        '       VBEM.BXVALBEMACUM + VBEM.BXVALACRESACUM)                 ' +
        '        AS VALORG,'
      '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM  -'
      
        '       VBEM.BXVALCMBEMACUM  - VBEM.BXVALCMACRESACUM)            ' +
        '        AS CMBEM,'
      '   SUM(VBEM.VALDEPBEMACUM  + VBEM.VALDEPACRESACUM -'
      
        '       VBEM.BXVALDEPBEMACUM  - VBEM.BXVALDEPACRESACUM)          ' +
        '        AS DEPLANC,'
      '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM -'
      
        '       VBEM.BXVALCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM)       ' +
        '        AS CMDEP,'
      ''
      
        '   SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)                   ' +
        '        AS REAVVALORG,'
      
        '   SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)               ' +
        '        AS REAVCMBEM,'
      
        '   SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)             ' +
        '        AS REAVDEPLANC,'
      
        '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM)         ' +
        '        AS REAVCMDEP,'
      ''
      
        '   SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)             ' +
        '        AS ULTREAVVALORG,'
      
        '   SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)         ' +
        '        AS ULTREAVCMBEM,'
      
        '   SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)       ' +
        '        AS ULTREAVDEPLANC,'
      
        '   SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM)   ' +
        '        AS ULTREAVCMDEP'
      ''
      'FROM'
      '  ((SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(HM.VALOFI,0),'
      '                                            41,NVL(HM.VALOFI,0),'
      
        '                                            07,NVL(HM.VALOFI,0),' +
        '0)) AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,0),'
      
        '                                            49,NVL(HM.VALOFI,0),' +
        '0)) AS  VALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.VALOFI,0),'
      
        '                                            42,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,0),'
      
        '                                            50,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.VALOFI,0),'
      '                                            17,NVL(HM.VALOFI,0),'
      
        '                                            43,NVL(HM.VALOFI,0),' +
        '0)) AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,0),'
      
        '                                            51,NVL(HM.VALOFI,0),' +
        '0)) AS  VALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(HM.VALOFI,0),'
      
        '                                            44,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,0),'
      
        '                                            52,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(HM.VALOFI,0),'
      
        '                                            13,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALCMREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALDEPACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALCMDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM'
      '    WHERE (HM.IDBEM =  :PIDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      ''
      '   ((SELECT'
      '            HM.IDBEM,'
      '            HM.IDPESSOA,'
      '            HM.DATAMOVIMENTACAO,'
      
        '            (0)                                                 ' +
        '     AS  VALBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             32,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             45,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             46,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             33,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             47,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             48,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTCMDEPREAVACUM'
      '     FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '     WHERE (HM.IDBEM =  :PIDBEM)'
      '       AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '       AND (R.FLGULTREAVAL = 0)'
      '       AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '     GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      ''
      '    (SELECT'
      '            HM.IDBEM,'
      '            HM.IDPESSOA,'
      '            HM.DATAMOVIMENTACAO,'
      
        '            (0)                                                 ' +
        '     AS  VALBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPACRESACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             32,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             45,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             46,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTCMREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             33,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             47,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             48,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTCMDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTCMREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTCMDEPREAVACUM'
      '     FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '     WHERE (HM.IDBEM =  :PIDBEM)'
      '       AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '       AND (R.FLGULTREAVAL = 1)'
      '       AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '     GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO))'
      '  )  VBEM'
      ''
      'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qryMovContabBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryMovContabBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovContabBemDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryMovContabBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryMovContabBemCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryMovContabBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryMovContabBemCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryMovContabBemREAVVALORG: TFloatField
      FieldName = 'REAVVALORG'
    end
    object qryMovContabBemREAVCMBEM: TFloatField
      FieldName = 'REAVCMBEM'
    end
    object qryMovContabBemREAVDEPLANC: TFloatField
      FieldName = 'REAVDEPLANC'
    end
    object qryMovContabBemREAVCMDEP: TFloatField
      FieldName = 'REAVCMDEP'
    end
    object qryMovContabBemULTREAVVALORG: TFloatField
      FieldName = 'ULTREAVVALORG'
    end
    object qryMovContabBemULTREAVCMBEM: TFloatField
      FieldName = 'ULTREAVCMBEM'
    end
    object qryMovContabBemULTREAVDEPLANC: TFloatField
      FieldName = 'ULTREAVDEPLANC'
    end
    object qryMovContabBemULTREAVCMDEP: TFloatField
      FieldName = 'ULTREAVCMDEP'
    end
  end
  object qryHistTrf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO'
      'SET TRFVALORG      = :PTRFVALORG,'
      '    TRFCMBEM       = :PTRFCMBEM,'
      '    TRFDEPLANC     = :PTRFDEPLANC,'
      '    TRFCMDEP       = :PTRFCMDEP,'
      '    TRFREAVVALORG  = :PTRFREAVVALORG,'
      '    TRFREAVCMBEM   = :PTRFREAVCMBEM,'
      '    TRFREAVDEPLANC = :PTRFREAVDEPLANC,'
      '    TRFREAVCMDEP   = :PTRFREAVCMDEP,'
      '    TRFAVVALORG    = :PTRFAVVALORG,'
      '    TRFAVCMBEM     = :PTRFAVCMBEM,'
      '    TRFAVDEPLANC   = :PTRFAVDEPLANC,'
      '    TRFAVCMDEP     = :PTRFAVCMDEP'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 204
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'PTRFVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFREAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFREAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFREAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFREAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PTRFAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemValMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM VALORMOVIMENTACAO'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 477
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemDepBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOBEM'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 477
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemDepReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOREAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 477
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemDepAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOACRESC'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 477
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemTrfGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TRANSFGRUPO'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 46
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemTrfConj: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TRANSFCONJUNTO'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 46
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemTrfLocal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TRANSFLOCAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)')
    ValidateWithMask = True
    Left = 46
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)')
    ValidateWithMask = True
    Left = 46
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemReavReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALREAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)')
    ValidateWithMask = True
    Left = 46
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryLegRemReavAcres: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALACRESC'
      'WHERE (IDMOVIMENTACAO = :PIDMOV)')
    ValidateWithMask = True
    Left = 46
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOV'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraLancObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CAFOBRALANC (IDOBRALANC,'
      '                         IDMODULO,'
      '                         IDCAFOBRA,'
      '                         IDPESSOA,'
      '                         IDOBRATIPOETAPA,'
      '                         PLNCODIGO,'
      '                         DTANOTA,'
      '                         NUMNOTA,'
      '                         COMPLNOTA,'
      '                         DTALANCAMENTO,'
      '                         VALOFI,'
      '                         VALFIS,'
      '                         VALGER,'
      '                         VALGERB,'
      '                         IDGRUPO,'
      '                         CODSUBCONTA,'
      '                         UNIDNEGOC)'
      'VALUES                  (:IDOBRALANC,'
      '                         :IDMODULO,'
      '                         :IDCAFOBRA,'
      '                         :IDPESSOA,'
      '                         :IDOBRATIPOETAPA,'
      '                         :PLNCODIGO,'
      '                         :DTANOTA,'
      '                         :NUMNOTA,'
      '                         :COMPLNOTA,'
      '                         :DTALANCAMENTO,'
      '                         :VALOFI,'
      '                         :VALFIS,'
      '                         :VALGER,'
      '                         :VALGERB,'
      '                         :IDGRUPO,'
      '                         :CODSUBCONTA,'
      '                         :UNIDNEGOC)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOBRALANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDOBRATIPOETAPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DTANOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DTALANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALOFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALGERB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDCAFOBRA'
    end
    object FloatField2: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField3: TFloatField
      FieldName = 'IDGRUPO'
    end
    object FloatField4: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object FloatField5: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object StringField1: TStringField
      FieldName = 'DESCCAFOBRA'
      Size = 250
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
    end
    object FloatField6: TFloatField
      FieldName = 'FLGOBRA'
    end
    object StringField2: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DESCATIVPROJ'
      Size = 25
    end
    object StringField4: TStringField
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
  end
  object qryCafObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDCAFOBRA, O.IDPESSOA, O.IDMODULO, O.IDGRUPO, O.CODSUBC' +
        'ONTA, O.UNIDNEGOC,'
      
        '       O.DESCCAFOBRA, O.DTAINICIOOBRA, O.DTAENCERRAOBRA, O.FLGOB' +
        'RA,'
      
        '       G.NOME AS DESCGRUPO, AV.NOME AS DESCATIVPROJ, SC.NOMESUBC' +
        'ONTA'
      'FROM   CAFOBRA O,'
      '       GRUPO G,'
      '       PLANOGRUPO PG,'
      '       UNIDNEGOCIO AV,'
      '       SUBCONTA SC'
      'WHERE  (O.IDCAFOBRA   = :PIDCAFOBRA)'
      '  AND  (O.IDPESSOA    = :PIDPESSOA)'
      '  AND  (O.IDGRUPO     = PG.IDGRUPO)'
      '  AND  (O.IDPESSOA    = PG.IDPESSOA)'
      '  AND  (PG.IDGRUPO    = G.IDGRUPO)'
      '  AND  (O.IDPESSOA    = AV.IDPESSOA(+))'
      '  AND  (O.UNIDNEGOC   = AV.UNIDNEGOC(+))'
      '  AND  (O.IDPESSOA    = SC.IDPESSOA(+))'
      '  AND  (O.CODSUBCONTA = SC.CODSUBCONTA(+))'
      ''
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 40
    Top = 228
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCafObraIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
    end
    object qryCafObraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCafObraIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryCafObraCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryCafObraUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryCafObraDESCCAFOBRA: TStringField
      FieldName = 'DESCCAFOBRA'
      Size = 250
    end
    object qryCafObraDTAINICIOOBRA: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
    end
    object qryCafObraDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
    end
    object qryCafObraFLGOBRA: TFloatField
      FieldName = 'FLGOBRA'
    end
    object qryCafObraDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryCafObraDESCATIVPROJ: TStringField
      FieldName = 'DESCATIVPROJ'
      Size = 25
    end
    object qryCafObraNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
    object qryCafObraIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
  end
  object qryCCRo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDCAFOBRA,'
      '       R.IDPESSOA,'
      '       R.CODCENTROCUSTO,'
      '       R.IDEMPRESA,'
      '       R.PARTICIPACAO,'
      '       CC.NOME,'
      '       CC.STATUSGRUPOCDC AS TIPO'
      'FROM CAFOBRARATEIO R,'
      '     CENTCUST CC'
      'WHERE (R.IDCAFOBRA  = :PIDCAFOBRA)'
      '  AND (R.IDPESSOA   = :PIDPESSOA)'
      '  AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (R.IDEMPRESA      = CC.IDEMPRESA)'
      'ORDER BY R.CODCENTROCUSTO'
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 182
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCCRoIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRARATEIO.IDCAFOBRA'
    end
    object qryCCRoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CAFOBRARATEIO.IDPESSOA'
    end
    object qryCCRoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CAFOBRARATEIO.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryCCRoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.CAFOBRARATEIO.IDEMPRESA'
    end
    object qryCCRoPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
      Origin = 'BASEDADOS.CAFOBRARATEIO.PARTICIPACAO'
    end
    object qryCCRoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object qryCCRoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.CENTCUST.STATUSGRUPOCDC'
      FixedChar = True
      Size = 1
    end
  end
  object qryLancObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT L.IDOBRALANC, L.IDCAFOBRA, L.IDPESSOA, L.IDMODULO, L.IDOB' +
        'RATIPOETAPA,'
      
        '       EO.DESCOBRATIPOETAPA, L.PLNCODIGO, L.DTANOTA, L.NUMNOTA, ' +
        'L.COMPLNOTA,'
      '       L.DTALANCAMENTO, L.VALOFI, L.VALFIS, L.VALGER, L.VALGERB'
      'FROM   CAFOBRALANC L,'
      '       CAFOBRATIPOETAPA EO'
      'WHERE  (L.IDCAFOBRA   = :PIDCAFOBRA)'
      '  AND  (L.IDPESSOA    = :PIDPESSOA)'
      '  AND  (L.IDOBRATIPOETAPA = EO.IDOBRATIPOETAPA)'
      '')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLancObraDESCOBRATIPOETAPA: TStringField
      DisplayLabel = 'Etapa da Obra'
      DisplayWidth = 34
      FieldName = 'DESCOBRATIPOETAPA'
      Size = 50
    end
    object qryLancObraDTALANCAMENTO: TDateTimeField
      DisplayLabel = 'Lançamento'
      DisplayWidth = 12
      FieldName = 'DTALANCAMENTO'
    end
    object qryLancObraVALOFI: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOFI'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryLancObraNUMNOTA: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 13
      FieldName = 'NUMNOTA'
      Size = 13
    end
    object qryLancObraCOMPLNOTA: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 5
      FieldName = 'COMPLNOTA'
      Size = 5
    end
    object qryLancObraDTANOTA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DTANOTA'
    end
    object qryLancObraIDOBRALANC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOBRALANC'
      Visible = False
    end
    object qryLancObraIDCAFOBRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCAFOBRA'
      Visible = False
    end
    object qryLancObraIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryLancObraIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryLancObraIDOBRATIPOETAPA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOBRATIPOETAPA'
      Visible = False
    end
    object qryLancObraPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryLancObraVALFIS: TFloatField
      DisplayWidth = 10
      FieldName = 'VALFIS'
      Visible = False
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryLancObraVALGER: TFloatField
      DisplayWidth = 10
      FieldName = 'VALGER'
      Visible = False
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryLancObraVALGERB: TFloatField
      DisplayWidth = 10
      FieldName = 'VALGERB'
      Visible = False
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object qryHistEncerraObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO'
      'SET IDCAFOBRA = :PIDCAFOBRA'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 191
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEncerraObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CAFOBRA'
      'SET DTAENCERRAOBRA = :PDTAENCERRAOBRA,'
      '    FLGOBRA        = :PFLGOBRA'
      'WHERE (IDCAFOBRA = :PIDCAFOBRA)'
      '  AND (IDPESSOA  = :PIDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 178
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDTAENCERRAOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 202
    Top = 288
  end
  object qrySldCtbBemAnt: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT SCB.IDGRUPO, SCB.IDLOCALIZACAO, SCB.IDRESPONSAVEL'
      'FROM SALDOCONTABBEM SCB,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE (IDBEM = :PIDBEM)'
      '        AND (IDPESSOA = :PIDPESSOA)'
      '        AND (DATASLDBEM < :PDATASLD)'
      '      GROUP BY IDBEM) DTAMAX'
      'WHERE (SCB.IDBEM = :PIDBEM)'
      '  AND (SCB.IDPESSOA = :PIDPESSOA)'
      '  AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '  AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      'ORDER BY DATASLDBEM'
      ''
      ' '
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
    Left = 186
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySldCtbBemAntIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySldCtbBemAntIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySldCtbBemAntIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qryMovTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DATAMOVIMENTACAO,'
      '       IDGRUPANT, IDLOCALANT, IDRESPANT'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDTIPOMOVIMENTACAO = 05) OR'
      '       (IDTIPOMOVIMENTACAO = 11) OR'
      '       (IDTIPOMOVIMENTACAO = 12))'
      'ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 187
    Top = 3
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryMovTransfDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
    object qryMovTransfIDGRUPANT: TFloatField
      FieldName = 'IDGRUPANT'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDGRUPANT'
    end
    object qryMovTransfIDLOCALANT: TFloatField
      FieldName = 'IDLOCALANT'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDLOCALANT'
    end
    object qryMovTransfIDRESPANT: TFloatField
      FieldName = 'IDRESPANT'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDRESPANT'
    end
    object qryMovTransfIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDMOVIMENTACAO'
    end
    object qryMovTransfIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDTIPOMOVIMENTACAO'
    end
  end
  object qryAtuBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.VALORG, B.CMBEM, B.DEPLANC, B.CMDEP, B.PLACA,'
      ''
      
        '       (NVL(BEMACUM.VALBEMACUM,0) - NVL(BXBEMACUM.BXVALBEMACUM,0' +
        ')) AS VALORG0,'
      
        '       (NVL(CMBEMACUM.VALCMBEMACUM,0) - NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) - NVL(BXDEPBEMACUM.BXVAL' +
        'DEPBEMACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) - NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0)) AS CMDEP0'
      ''
      'FROM BEM B, GRUPO G,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41,07))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (6,13))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM'
      ''
      
        'WHERE ((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NUL' +
        'L))'
      ''
      ''
      ''
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAtuBem
    ValidateWithMask = True
    Left = 40
    Top = 280
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryAtuBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryAtuBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryAtuBemCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryAtuBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryAtuBemCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryAtuBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryAtuBemVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryAtuBemCMBEM0: TFloatField
      FieldName = 'CMBEM0'
    end
    object qryAtuBemDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
    end
    object qryAtuBemCMDEP0: TFloatField
      FieldName = 'CMDEP0'
    end
  end
  object updAtuBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM')
    InsertSQL.Strings = (
      'insert into BEM'
      '  (VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM')
    Left = 40
    Top = 294
  end
  object qryAtuReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT R.IDBEM, R.IDREAVALIACAO, R.VALORG, R.CMBEM, R.DEPLANC, R' +
        '.CMDEP, B.PLACA,'
      ''
      
        '       (NVL(REAVACUM.VALREAVACUM,0) - NVL(BXREAVACUM.BXVALREAVAC' +
        'UM,0)) AS VALORG0,'
      
        '       (NVL(CMREAVACUM.VALCMREAVACUM,0) - NVL(BXCMREAVACUM.BXVAL' +
        'CMREAVACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPREAVACUM.VALDEPREAVACUM,0) - NVL(BXDEPREAVACUM.BX' +
        'VALDEPREAVACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) - NVL(BXCMDEPREAVA' +
        'CUM.BXVALCMDEPREAVACUM,0)) AS CMDEP0'
      ''
      'FROM REAVALIACAO R, BEM B, GRUPO G,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) REAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMREAVACU' +
        'M,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) DEPREAVAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMDEPREAV' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXREAVACU' +
        'M,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMREAVA' +
        'CUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXDEPREAV' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPRE' +
        'AVACUM'
      ''
      
        'WHERE ((R.DATAREAVALIACAO <= :PDATAMOV) OR (R.DATAREAVALIACAO IS' +
        ' NULL))'
      ''
      ''
      ''
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (R.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = REAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = DEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMDEPREAVACUM.IDREAVALACRESC(+))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAtuReavaliacao
    ValidateWithMask = True
    Left = 120
    Top = 280
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryAtuReavaliacaoIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryAtuReavaliacaoIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object qryAtuReavaliacaoVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryAtuReavaliacaoCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryAtuReavaliacaoDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryAtuReavaliacaoCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryAtuReavaliacaoPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryAtuReavaliacaoVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryAtuReavaliacaoCMBEM0: TFloatField
      FieldName = 'CMBEM0'
    end
    object qryAtuReavaliacaoDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
    end
    object qryAtuReavaliacaoCMDEP0: TFloatField
      FieldName = 'CMDEP0'
    end
  end
  object updAtuReavaliacao: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      '  (VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 120
    Top = 294
  end
  object updAtuAcrescimo: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      '  (IDBEM, IDACRESCIMO, VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:IDBEM, :IDACRESCIMO, :VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 216
    Top = 293
  end
  object qryAtuAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT A.IDBEM, A.IDACRESCIMO, A.VALORG, A.CMBEM, A.DEPLANC, A.C' +
        'MDEP, B.PLACA,'
      ''
      
        '       (NVL(ACRESACUM.VALACRESACUM,0) - NVL(BXACRESACUM.BXVALACR' +
        'ESACUM,0)) AS VALORG0,'
      
        '       (NVL(CMACRESACUM.VALCMACRESACUM,0) - NVL(BXCMACRESACUM.BX' +
        'VALCMACRESACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPACRESACUM.VALDEPACRESACUM,0) - NVL(BXDEPACRESACUM' +
        '.BXVALDEPACRESACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) - NVL(BXCMDEPACR' +
        'ESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0'
      ''
      'FROM ACRESCIMOVALOR A, BEM B, GRUPO G,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO, SUM(HM.VALO' +
        'FI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO) ACRESACUM' +
        ','
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMACRESAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) DEPACRESA' +
        'CUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMDEPACRE' +
        'SACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXACRESAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMACRES' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXDEPACRE' +
        'SACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPAC' +
        'RESACUM'
      ''
      
        'WHERE ((A.DATAACRESCIMO <= :PDATAMOV) OR (A.DATAACRESCIMO IS NUL' +
        'L))'
      ''
      ''
      '  '
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (A.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (A.IDMOVIMENTACAO = ACRESACUM.IDMOVIMENTACAO(+))'
      '  AND (A.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = DEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMDEPACRESACUM.IDREAVALACRESC(+))'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAtuAcrescimo
    ValidateWithMask = True
    Left = 216
    Top = 280
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryAtuAcrescimoIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryAtuAcrescimoIDACRESCIMO: TFloatField
      FieldName = 'IDACRESCIMO'
    end
    object qryAtuAcrescimoVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryAtuAcrescimoCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryAtuAcrescimoDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryAtuAcrescimoCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryAtuAcrescimoPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryAtuAcrescimoVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryAtuAcrescimoCMBEM0: TFloatField
      FieldName = 'CMBEM0'
    end
    object qryAtuAcrescimoDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
    end
    object qryAtuAcrescimoCMDEP0: TFloatField
      FieldName = 'CMDEP0'
    end
  end
  object qryMoedaA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR'
      'FROM COTACAOMOEDA'
      'WHERE (MOECODIGO = :PMOEDA)'
      '  AND (SUBSTR(COTMESREF,3,4) = :PCOTANO)')
    ValidateWithMask = True
    Left = 353
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOTANO'
        ParamType = ptUnknown
      end>
    object FloatField7: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
  end
  object qryContaSemCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, CODCENTROCUSTO, IDEMPRESA'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO              = :IDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO   = :IDTIPOMOVIMENTACAO)'
      '  AND (TIPOLANCAMENTO       = :TIPOLANCAMENTO)'
      '  AND (PLANO                = :PLANO)'
      '  AND (IDPESSOA             = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 364
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryContaComCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO              = :IDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO   = :IDTIPOMOVIMENTACAO)'
      '  AND (TIPOLANCAMENTO       = :TIPOLANCAMENTO)'
      '  AND (PLANO                = :PLANO)'
      '  AND (IDPESSOA             = :IDPESSOA)'
      '  AND (TRIM(CODCENTROCUSTO) = :CODCENTROCUSTO)'
      '  AND (IDEMPRESA            = :IDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 412
    Top = 381
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, MASCARACC'
      'FROM     PARAMGLOBAL'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 476
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
    object qryParamGlobalMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = 'PARAMGLOBAL.MASCARACC'
      Size = 18
    end
  end
end
