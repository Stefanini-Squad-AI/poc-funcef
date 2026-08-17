object dtmLookImobiliario: TdtmLookImobiliario
  OldCreateOrder = True
  Left = 357
  Top = 113
  Height = 576
  Width = 911
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO, MOEDESC, MOESIGLA'
      'FROM'
      '   MOEDA'
      'ORDER BY'
      '   MOESIGLA')
    ValidateWithMask = True
    Left = 128
    Top = 176
    object qryLookMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
  end
  object qryLookMarca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMARCA, MRCNOME'
      'FROM'
      '  MARCAS'
      'ORDER BY'
      '  MRCNOME')
    ValidateWithMask = True
    Left = 128
    Top = 128
    object qryLookMarcaMRCNOME: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 40
      FieldName = 'MRCNOME'
      Origin = '"CM.MARCAS".MRCNOME'
      Size = 40
    end
    object qryLookMarcaIDMARCA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMARCA'
      Origin = '"CM.MARCAS".IDMARCA'
      Visible = False
    end
  end
  object qryLookAtividade: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   A.IDATIVIDADE, A.ATVDESCRICAO'
      ''
      'FROM'
      '   ATIVIDADE A'
      ''
      'ORDER BY'
      '   A.ATVDESCRICAO')
    ValidateWithMask = True
    Left = 40
    Top = 56
    object qryATVDESCRICAO: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 45
      FieldName = 'ATVDESCRICAO'
      Origin = 'ATIVIDADE.ATVDESCRICAO'
      Size = 60
    end
    object qryIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
      Origin = 'ATIVIDADE.IDATIVIDADE'
      Visible = False
    end
  end
  object qryLookProprietario: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PUH.IDPROPRIETARIOUH,'
      '   PP.NOME,'
      '   PP.RAZAOSOCIAL'
      ''
      'FROM'
      '   PESSOA PP, PROPRIETARIOUH PUH'
      ''
      'WHERE'
      '   PUH.IDPROPRIETARIOUH = PP.IDPESSOA'
      ''
      'ORDER BY'
      '   PP.NOME')
    ValidateWithMask = True
    Left = 336
    Top = 232
    object qryLookProprietarioNOME: TStringField
      DisplayLabel = 'Nome do(a) Proprietário(a)'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryLookProprietarioIDPROPRIETARIOUH: TFloatField
      FieldName = 'IDPROPRIETARIOUH'
      Origin = 'PROPRIETARIOUH.IDPROPRIETARIOUH'
      Visible = False
    end
    object qryLookProprietarioRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
  end
  object qryLookTipoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TI.CODTIPIMOVEL,'
      '   TI.DESCTIPOIMOVEL,'
      '   TI.IDGRUPOTERRENO,'
      '   TI.IDGRUPOEDIFICACAO,'
      '   TI.IDGRUPOINST,'
      '   TI.IDGRUPOELET,'
      '   TI.IDGRUPOAR,'
      '   TI.IDGRUPOVEICULO,'
      '   TI.IDGRUPOUTILITARIO,'
      '   TI.IDGRUPOMAQUINA,'
      '   TI.IDGRUPOMOVEL,'
      '   TI.CODALTMULTA,'
      '   TI.CODALTJUROS,'
      '   TI.CODALTCORRMON,'
      '   TAM.DESCRICAO AS ALTERADOR_MULTA,'
      '   TAJ.DESCRICAO AS ALTERADOR_JUROS,'
      '   TAR.DESCRICAO AS ALTERADOR_CORRECAO'
      ''
      'FROM'
      
        '   TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTE' +
        'RADOR TAR'
      'WHERE'
      
        '   ( (:PCODTIPIMOVEL IS NULL) OR (CODTIPIMOVEL = :PCODTIPIMOVEL)' +
        ' )'
      '   AND ( TI.CODALTMULTA = TAM.CODALTERADOR(+) )'
      '   AND ( TI.CODALTJUROS = TAJ.CODALTERADOR(+) )'
      '   AND ( TI.CODALTCORRMON = TAR.CODALTERADOR(+) )'
      'ORDER BY'
      '   DESCTIPOIMOVEL'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    object qryLookTipoImovelDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
    object qryLookTipoImovelCODTIPIMOVEL: TStringField
      DisplayLabel = 'Cod. Ti'
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryLookTipoImovelIDGRUPOTERRENO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOTERRENO'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOTERRENO'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOEDIFICACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOEDIFICACAO'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOEDIFICACAO'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOINST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOINST'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOINST'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOELET: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOELET'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOELET'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOAR'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOAR'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOVEICULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOVEICULO'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOVEICULO'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOUTILITARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOUTILITARIO'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOUTILITARIO'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOMAQUINA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOMAQUINA'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOMAQUINA'
      Visible = False
    end
    object qryLookTipoImovelIDGRUPOMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOMOVEL'
      Visible = False
    end
    object qryLookTipoImovelCODALTMULTA: TFloatField
      FieldName = 'CODALTMULTA'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODALTMULTA'
      Visible = False
    end
    object qryLookTipoImovelCODALTJUROS: TFloatField
      FieldName = 'CODALTJUROS'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODALTJUROS'
      Visible = False
    end
    object qryLookTipoImovelCODALTCORRMON: TFloatField
      FieldName = 'CODALTCORRMON'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODALTCORRMON'
      Visible = False
    end
    object qryLookTipoImovelALTERADOR_MULTA: TStringField
      FieldName = 'ALTERADOR_MULTA'
      Visible = False
      Size = 35
    end
    object qryLookTipoImovelALTERADOR_JUROS: TStringField
      FieldName = 'ALTERADOR_JUROS'
      Visible = False
      Size = 35
    end
    object qryLookTipoImovelALTERADOR_CORRECAO: TStringField
      FieldName = 'ALTERADOR_CORRECAO'
      Visible = False
      Size = 35
    end
  end
  object qryLookResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   R.IDRESPONSAVEL,'
      '   PR.NOME,'
      '   PR.RAZAOSOCIAL'
      ''
      'FROM'
      '   PESSOA PR, RESPONSAVEL R'
      ''
      'WHERE'
      
        '   ( (:PIDRESPONSAVEL IS NULL) OR (R.IDRESPONSAVEL = :PIDRESPONS' +
        'AVEL ))'
      '   AND ( R.FLGIMOBILIARIO = 1 )'
      '   AND ( R.IDRESPONSAVEL = PR.IDPESSOA )'
      ''
      'ORDER BY'
      '   PR.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end>
    object qryLookResponsavelNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryLookResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'RESPONSAVEL.IDRESPONSAVEL'
      Visible = False
    end
    object qryLookResponsavelRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
  end
  object qryLookOutroDadoXTipoImo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OXT.IDOUTRODADO, O.ODODESCRICAO'
      ''
      'FROM'
      '   OUTRODADOXTIPOIMO OXT, OUTRODADO O'
      ''
      'WHERE'
      '   (OXT.CODTIPIMOVEL =:PCODTIPIMOVEL )'
      '   AND ( OXT.IDOUTRODADO = O.IDOUTRODADO )'
      ''
      'ORDER BY'
      '   O.ODODESCRICAO')
    ValidateWithMask = True
    Left = 336
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    object qryLookOutroDadoXTipoImoODODESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Origin = 'OUTRODADO.ODODESCRICAO'
      Size = 40
    end
    object qryLookOutroDadoXTipoImoIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADO.IDOUTRODADO'
      Visible = False
    end
  end
  object qryLookIndicador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDINDICADORIMOVEL, INMDESCRICAO, FLGTIPOVALOR'
      ''
      'FROM'
      '  INDICADORIMOVEL'
      ''
      'ORDER BY'
      '  INMDESCRICAO')
    ValidateWithMask = True
    Left = 128
    Top = 80
    object qryLookIndicadorINMDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'INMDESCRICAO'
      Origin = 'INDICADORIMOVEL.INMDESCRICAO'
      Size = 60
    end
    object qryLookIndicadorIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Origin = 'INDICADORIMOVEL.IDINDICADORIMOVEL'
      Visible = False
    end
    object qryLookIndicadorFLGTIPOVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOVALOR'
      Origin = 'INDICADORIMOVEL.FLGTIPOVALOR'
      Visible = False
      Size = 1
    end
  end
  object qryLookOutroDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOUTRODADO, ODODESCRICAO'
      'FROM'
      '   OUTRODADO'
      'ORDER BY'
      '   ODODESCRICAO')
    ValidateWithMask = True
    Left = 128
    Top = 272
    object qryLookOutroDadoIDOUTRODADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOUTRODADO'
      Origin = '"CM.OUTRODADO".IDOUTRODADO'
    end
    object qryLookOutroDadoODODESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Origin = '"CM.OUTRODADO".ODODESCRICAO'
      Size = 40
    end
  end
  object qryLookIndicadorXTipoImo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXT.IDINDICADORIMOVEL,'
      '   I.INMDESCRICAO, I.FLGTIPOVALOR, I.RECPAG'
      ''
      'FROM'
      '   INDICADORXTIPOIMO IXT, INDICADORIMOVEL I'
      ''
      'WHERE'
      '   (IXT.CODTIPIMOVEL =:PCODTIPIMOVEL )'
      '   AND ( IXT.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL )'
      ''
      'ORDER BY'
      '   INMDESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 356
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    object qryLookIndicadorXTipoImoIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
      Origin = '"CM.INDICADORXTIPOIMO".IDINDICADORIMOVEL'
    end
    object qryLookIndicadorXTipoImoINMDESCRICAO: TStringField
      FieldName = 'INMDESCRICAO'
      Origin = '"CM.INDICADORIMOVEL".INMDESCRICAO'
      Size = 60
    end
    object qryLookIndicadorXTipoImoFLGTIPOVALOR: TStringField
      FieldName = 'FLGTIPOVALOR'
      Origin = '"CM.INDICADORIMOVEL".FLGTIPOVALOR'
      Size = 1
    end
    object qryLookIndicadorXTipoImoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.INDICADORIMOVEL.RECPAG'
      FixedChar = True
      Size = 1
    end
  end
  object qryLookGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.NOME,'
      '       G.CLASSE'
      '  FROM GRUPO G'
      ' WHERE G.FLGIMOVEL = 1'
      '   AND G.TIPO = '#39'A'#39
      '   AND ((:PIDGRUPO IS NULL) OR (G.IDGRUPO = :PIDGRUPO) )'
      ''
      'ORDER BY G.NOME, G.CLASSE'
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryLookGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryLookGrupoNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryLookGrupoCLASSE: TStringField
      Alignment = taRightJustify
      DisplayWidth = 7
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
  end
  object qryLookAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   T.CODALTERADOR, T.DESCRICAO,'
      '   T.RECPAG, T.ACRESDECRES'
      ''
      'FROM'
      '   TIPOALTERADOR T'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDEMPRESAPROP )'
      
        '   AND ( (:PACRESDECRES IS NULL) OR (T.ACRESDECRES =:PACRESDECRE' +
        'S) )'
      '   AND ( (:PRECPAG IS NULL) OR (T.RECPAG =:PRECPAG) )'
      ''
      'ORDER BY'
      '   T.DESCRICAO')
    ValidateWithMask = True
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PACRESDECRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PACRESDECRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end>
    object qryLookAlteradorCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
    end
    object qryLookAlteradorDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryLookAlteradorRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOALTERADOR.RECPAG'
      Size = 1
    end
    object qryLookAlteradorACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Origin = 'TIPOALTERADOR.ACRESDECRES'
      Size = 1
    end
  end
  object qryLookAlteradorXTipoImo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   AXT.CODTIPIMOVEL, AXT.CODALTERADOR,'
      '   T.DESCRICAO, T.ACRESDECRES, T.RECPAG,'
      '  T.PLANO, T.PLACONTA'
      
        '  , NVL(T.FLGLANCANFS, '#39'N'#39') AS FLGLANCANFS, NVL(T.FLGVALORBASE, ' +
        #39'N'#39') AS FLGVALORBASE'
      ''
      'FROM'
      '   ALTERADORXTIPOIMO AXT, TIPOALTERADOR T'
      ''
      'WHERE'
      '   ( AXT.CODTIPIMOVEL =:PCODTIPIMOVEL )'
      '   AND ( T.IDPESSOA =:PIDEMPRESAPROP )'
      
        '   AND ( (:PACRESDECRES IS NULL) OR (T.ACRESDECRES =:PACRESDECRE' +
        'S) )'
      '   AND ( (:PRECPAG IS NULL) OR (T.RECPAG =:PRECPAG) )'
      '   AND ( AXT.CODALTERADOR = T.CODALTERADOR )'
      ''
      'ORDER BY'
      '   T.DESCRICAO')
    ValidateWithMask = True
    Left = 336
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PACRESDECRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PACRESDECRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end>
    object qryLookAlteradorXTipoImoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = '"CM.ALTERADORXTIPOIMO".CODTIPIMOVEL'
      Size = 5
    end
    object qryLookAlteradorXTipoImoCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = '"CM.ALTERADORXTIPOIMO".CODALTERADOR'
    end
    object qryLookAlteradorXTipoImoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.TIPOALTERADOR".DESCRICAO'
      Size = 35
    end
    object qryLookAlteradorXTipoImoACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Origin = '"CM.TIPOALTERADOR".ACRESDECRES'
      Size = 1
    end
    object qryLookAlteradorXTipoImoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = '"CM.TIPOALTERADOR".RECPAG'
      Size = 1
    end
    object qryLookAlteradorXTipoImoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.TIPOALTERADOR.PLANO'
    end
    object qryLookAlteradorXTipoImoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.TIPOALTERADOR.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryLookAlteradorXTipoImoFLGLANCANFS: TStringField
      FieldName = 'FLGLANCANFS'
      Size = 1
    end
    object qryLookAlteradorXTipoImoFLGVALORBASE: TStringField
      FieldName = 'FLGVALORBASE'
      Size = 1
    end
  end
  object qryLookBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PB.NOME, PB.RAZAOSOCIAL,'
      '   B.NUMBANCO, B.IDPESSOA'
      'FROM'
      '   PESSOA PB, BANCO B'
      'WHERE'
      '   ( B.IDPESSOA = PB.IDPESSOA )'
      'ORDER BY'
      '   PB.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 40
    Top = 104
    object qryLookBancoRAZAOSOCIAL: TStringField
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryLookBancoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Visible = False
      Size = 60
    end
    object qryLookBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryLookBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BANCO.IDPESSOA'
      Visible = False
    end
  end
  object qryLookMsgBoleto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMSGBOLETO, MSGDESCRICAO'
      'FROM'
      '   MSGBOLETO'
      'WHERE'
      '   IDMODULO = :PIDMODULO'
      'ORDER BY'
      '   MSGDESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryLookMsgBoletoMSGDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'MSGDESCRICAO'
      Origin = 'MSGBOLETO.MSGDESCRICAO'
      Size = 60
    end
    object qryLookMsgBoletoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Origin = 'MSGBOLETO.IDMSGBOLETO'
      Visible = False
    end
  end
  object qryLookCidade: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCIDADES, CODESTADO, IDPAIS, NOME, CODMUNICIPIO, IDESTADO'
      'FROM'
      '   CIDADES'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 40
    Top = 296
    object qryLookCidadeNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'CIDADES.NOME'
      Size = 50
    end
    object qryLookCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'CIDADES.IDCIDADES'
      Visible = False
    end
    object qryLookCidadeCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'CIDADES.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryLookCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'CIDADES.IDPAIS'
      Visible = False
    end
    object qryLookCidadeCODMUNICIPIO: TStringField
      DisplayWidth = 10
      FieldName = 'CODMUNICIPIO'
      Origin = 'CIDADES.CODMUNICIPIO'
      Visible = False
      Size = 10
    end
    object qryLookCidadeIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'CIDADES.IDESTADO'
    end
  end
  object qryLookEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, CODESTADO, NOMEESTADO, IDESTADO'
      'FROM'
      '   ESTADO'
      'WHERE'
      '   IDPAIS =:PAIS'
      'ORDER BY'
      '   CODESTADO')
    ValidateWithMask = True
    Left = 40
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAIS'
        ParamType = ptUnknown
      end>
    object qryLookEstadoCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryLookEstadoNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryLookEstadoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
      Visible = False
    end
    object qryLookEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
    end
  end
  object qryLookPais: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, NOMEPAIS'
      'FROM'
      '   PAIS'
      'ORDER BY'
      '   NOMEPAIS')
    ValidateWithMask = True
    Left = 128
    Top = 320
    object qryLookPaisNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = 'PAIS.NOMEPAIS'
      Size = 30
    end
    object qryLookPaisIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'PAIS.IDPAIS'
      Visible = False
    end
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  UNIDNEGOC, NOME'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  ( IDPESSOA =:EMPRESAPROP )'
      '  AND ( UNETIPO = '#39'A'#39' )'
      ' AND (ATIVO = '#39'S'#39')'
      'ORDER BY'
      '  NOME'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookUnidNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryLookUnidNegocioUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryLookTipOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIPCODIGO, TIPDESCRICAO'
      'FROM'
      '  TIPOPER'
      'ORDER BY'
      '  TIPDESCRICAO')
    ValidateWithMask = True
    Left = 216
    Top = 200
    object qryLookTipOperTIPDESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Origin = 'TIPOPER.TIPDESCRICAO'
      Size = 25
    end
    object qryLookTipOperTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Origin = 'TIPOPER.TIPCODIGO'
      Visible = False
      Size = 2
    end
  end
  object qryLookCCDebCre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      ''
      'WHERE'
      '   ( X.PLANO =:PLANO )'
      '   AND ( RTRIM(X.PLACONTA) =:CONTA )'
      '   AND ( X.IDEMPRESA =:EMPRESAPROP )'
      '   AND ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      ''
      'ORDER BY'
      '   C.NOME'
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField2: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookCCResult: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      ''
      'WHERE'
      '   ( X.PLANO =:PLANO )'
      '   AND ( RTRIM(X.PLACONTA) =:CONTA )'
      '   AND ( X.IDEMPRESA =:EMPRESAPROP )'
      '   AND ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      '   '
      'ORDER BY'
      '   C.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object StringField6: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField7: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookSCResult: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA AS SUBCONTARESULT, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA')
    ValidateWithMask = True
    Left = 336
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookSCResultSUBCONTARESULT: TFloatField
      FieldName = 'SUBCONTARESULT'
      Origin = '"CM.SUBCONTA".CODSUBCONTA'
    end
    object qryLookSCResultNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = '"CM.SUBCONTA".NOMESUBCONTA'
      Size = 60
    end
  end
  object qryLookSCDebCre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA  AS SUBCONTADEBCRE, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA'
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookSCDebCreSUBCONTADEBCRE: TFloatField
      FieldName = 'SUBCONTADEBCRE'
      Origin = '"CM.SUBCONTA".CODSUBCONTA'
    end
    object qryLookSCDebCreNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = '"CM.SUBCONTA".NOMESUBCONTA'
      Size = 60
    end
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( ANALITICOSINTET = '#39'A'#39' )'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 40
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookTipoReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( RECPAG = '#39'R'#39' )'
      '   AND ( ANASINT = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryLookTipoRecebDESCRICAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryLookTipoRecebCODTIPRECDES: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryLookTipoRecebRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( RECPAG = '#39'P'#39' )'
      '   AND ( ANASINT = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryLookTipoDesembDESCRICAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDesembCODTIPRECDES: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryLookTipoDesembRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PF.CODPORTFORMA, PF.DESCRICAO, PF.IDCONFIGBARRAS'
      ''
      'FROM'
      '   PORTADORFORMA PF'
      ''
      'WHERE'
      '    ( PF.IDPESSOA =:PIDPESSOA )'
      'AND NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39
      'AND ( PF.RECPAG = '#39'R'#39' )'
      ''
      'ORDER BY'
      '   PF.DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLookPortadorFormaDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
    object qryLookPortadorFormaIDCONFIGBARRAS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGBARRAS'
      Origin = 'BASEDADOS.PORTADORFORMA.IDCONFIGBARRAS'
    end
  end
  object qryLookTipoRecDes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.CODTIPD' +
        'OC,'
      '   T.FLGOBRIGAORC, T.IDTIPODESPESA, T.FLGDIARIO'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '       ( (:PIDMODULO IS NULL) OR (T.IDMODULO =:PIDMODULO) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (T.IDTIPOCUSTORECIMO =' +
        ' :PIDTIPOCUSTORECIMO) )'
      '   AND ( (:PRECCUSTO IS NULL) OR (T.RECCUSTO =:PRECCUSTO) )'
      '   AND ('
      
        '              ( (:ACRESCIMO_VALOR IS NULL)     OR (IDTIPODESPESA' +
        ' IS NOT NULL) )'
      
        '          AND ( (:NAO_ACRESCIMO_VALOR IS NULL) OR (IDTIPODESPESA' +
        ' IS NULL) )'
      '        )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACRESCIMO_VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAO_ACRESCIMO_VALOR'
        ParamType = ptUnknown
      end>
    object qryLookTipoRecDesDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 30
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryLookTipoRecDesIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryLookTipoRecDesRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Origin = 'TIPOCUSTORECIMOV.RECCUSTO'
      Visible = False
      Size = 1
    end
    object qryLookTipoRecDesCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOCUSTORECIMOV.CODTIPDOC'
      Visible = False
    end
    object qryLookTipoRecDesFLGOBRIGAORC: TFloatField
      FieldName = 'FLGOBRIGAORC'
      Origin = 'TIPOCUSTORECIMOV.FLGOBRIGAORC'
      Visible = False
    end
    object qryLookTipoRecDesIDTIPODESPESA: TFloatField
      FieldName = 'IDTIPODESPESA'
      Visible = False
    end
    object qryLookTipoRecDesFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryLookFormaRecPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FRP.CODFORMA,'
      '   FRP.RECPAG, FRP.DESCRICAO, FRP.IDPESSOA,'
      '   FRP.FLGDADOSBANCARIOS  -- S/N Obriga dados bancários '
      ''
      'FROM'
      '   FORMARECPAG FRP'
      ''
      'WHERE'
      '   ( FRP.IDPESSOA =:PIDPESSOA )'
      '   AND ( FRP.RECPAG =:PRECPAG )'
      ''
      'ORDER BY'
      '   FRP.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end>
    object qryLookFormaRecPagDESCRICAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryLookFormaRecPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object qryLookFormaRecPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookFormaRecPagIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORMARECPAG.IDPESSOA'
      Visible = False
    end
    object qryLookFormaRecPagFLGDADOSBANCARIOS: TStringField
      FieldName = 'FLGDADOSBANCARIOS'
      FixedChar = True
      Size = 1
    end
  end
  object qryLookGrupoRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   GR.IDGRUPORATEIO, GR.GRRDESCRICAO'
      ''
      'FROM'
      '   GRUPORATEIO GR'
      ''
      'WHERE'
      '   GR.IDMODULO = :PIDMODULO'
      ''
      'ORDER BY'
      '   GR.GRRDESCRICAO')
    ValidateWithMask = True
    Left = 128
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryLookGrupoRateioIDGRUPORATEIO: TFloatField
      FieldName = 'IDGRUPORATEIO'
      Origin = 'GRUPORATEIO.IDGRUPORATEIO'
    end
    object qryLookGrupoRateioGRRDESCRICAO: TStringField
      FieldName = 'GRRDESCRICAO'
      Origin = 'GRUPORATEIO.GRRDESCRICAO'
      Size = 60
    end
  end
  object qryLookCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CC.CODCENTROCUSTO, CC.NOME'
      ''
      'FROM'
      '   CENTCUST CC'
      ''
      'WHERE'
      '   ( CC.IDEMPRESA =:PIDEMPRESA )'
      '   AND ( STATUSGRUPOCDC = '#39'A'#39' )'
      '   AND ( ATIVO = '#39'S'#39' )'
      ''
      'ORDER BY'
      '   CC.NOME')
    ValidateWithMask = True
    Left = 40
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField4: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA'
      ''
      'FROM'
      '   CARTEIRAINVEST'
      ''
      'ORDER BY'
      '   DESCCARTINVEST')
    ValidateWithMask = True
    Left = 40
    Top = 152
    object qryLookCarteiraDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryLookCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryLookCarteiraIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
  end
  object qryLookPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLANO, PLANOME, PLACONTA, PLATIPO, PLACCUST'
      '   '
      'FROM'
      '   PLANOCONTA'
      ''
      'WHERE'
      '   PLANO =:PPLANO'
      '   AND ( PLAINATIVA = '#39'A'#39' )'
      ''
      'ORDER BY'
      '   PLACONTA'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryLookPlanoContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryLookPlanoContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryLookPlanoContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryLookPlanoContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
  end
  object qryLookUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   U.IDUSUARIO, U.NOMEUSUARIO,'
      '   PU.NOME,'
      '   PU.RAZAOSOCIAL'
      ''
      'FROM'
      '   PESSOA PU, USUARIOSISTEMA U'
      'WHERE'
      '   ( U.IDUSUARIO = PU.IDPESSOA )'
      '   AND ((:PIDUSUARIO IS NULL) OR (U.IDUSUARIO =:PIDUSUARIO)) '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryLookUsuarioIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.IDUSUARIO'
    end
    object qryLookUsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryLookUsuarioRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryLookUsuarioNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.NOMEUSUARIO'
      FixedChar = True
    end
  end
  object qryLookContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CB.IDCBANCARIA, CB.CONTACORRENTE,'
      '   CB.FLGCONTAPREF,    -- SE 1 CONTA PREFERENCIAL'
      '   AB.NUMAGENCIA, BC.NUMBANCO'
      ''
      'FROM'
      '   CONTABANCARIA CB, AGENCIABANCARIA AB, BANCO BC'
      ''
      'WHERE'
      '   ( CB.IDAGENCIA = AB.IDPESSOA )'
      '   AND ( AB.IDBANCO = BC.IDPESSOA )'
      
        '   AND ((:PIDCBANCARIA IS NULL) OR (CB.IDCBANCARIA =:PIDCBANCARI' +
        'A))'
      '   AND ((:PIDPESSOA IS NULL) OR (CB.IDPESSOA =:PIDPESSOA))'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 216
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLookContaBancariaCONTACORRENTE: TStringField
      DisplayLabel = 'Cta. Corrente'
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryLookContaBancariaNUMBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryLookContaBancariaNUMAGENCIA: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 10
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryLookContaBancariaFLGCONTAPREF: TFloatField
      DisplayLabel = '     Pref.'
      DisplayWidth = 5
      FieldName = 'FLGCONTAPREF'
    end
    object qryLookContaBancariaIDCBANCARIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCBANCARIA'
      Visible = False
    end
  end
  object qryLookIndicadorPorTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXI.DATAAPURADO,'
      '   IXI.VLRAPURADO,'
      ''
      '   TI.INMDESCRICAO, TI.FLGTIPOVALOR'
      ''
      'FROM'
      '  INDICADORXAPUR IXI, INDICADORIMOVEL TI'
      '  '
      'WHERE'
      '   (( :PIDIMOVEL IS NULL ) OR ( IXI.IDIMOVEL = :PIDMOVEL ))'
      '   AND (( :PIDUNIDAUT IS NULL ) OR ( IDUNIDAUT = :PIDUNIDAUT ))'
      '   AND ( IXI.IDINDICADORIMOVEL = TI.IDINDICADORIMOVEL )'
      ''
      'ORDER BY'
      '   TI.INMDESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 348
    Top = 430
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUNIDAUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUNIDAUT'
        ParamType = ptUnknown
      end>
    object qryLookIndicadorPorTipoDATAAPURADO: TDateTimeField
      FieldName = 'DATAAPURADO'
      Origin = 'BASEDADOS."CM.INDICADORXAPUR".DATAAPURADO'
    end
    object qryLookIndicadorPorTipoVLRAPURADO: TFloatField
      FieldName = 'VLRAPURADO'
      Origin = 'BASEDADOS."CM.INDICADORXAPUR".VLRAPURADO'
    end
    object qryLookIndicadorPorTipoINMDESCRICAO: TStringField
      FieldName = 'INMDESCRICAO'
      Origin = 'BASEDADOS."CM.INDICADORIMOVEL".INMDESCRICAO'
      Size = 60
    end
    object qryLookIndicadorPorTipoFLGTIPOVALOR: TStringField
      FieldName = 'FLGTIPOVALOR'
      Origin = 'BASEDADOS."CM.INDICADORIMOVEL".FLGTIPOVALOR'
      FixedChar = True
      Size = 1
    end
  end
  object qryLookIndicadorPorData: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXI.DATAAPURADO,'
      '   IXI.VLRAPURADO,'
      '   TI.INMDESCRICAO, TI.FLGTIPOVALOR'
      ''
      'FROM'
      '  INDICADORXAPUR IXI, INDICADORIMOVEL TI'
      ''
      'WHERE'
      '   (( :PIDIMOVEL IS NULL ) OR ( IXI.IDIMOVEL = :PIDMOVEL ))'
      '   AND (( :PIDUNIDAUT IS NULL ) OR ( IDUNIDAUT = :PIDUNIDAUT ))'
      '   AND ( IXI.IDINDICADORIMOVEL = TI.IDINDICADORIMOVEL )'
      ''
      'ORDER BY'
      '   IXI.DATAAPURADO DESC')
    ValidateWithMask = True
    Left = 349
    Top = 418
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUNIDAUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUNIDAUT'
        ParamType = ptUnknown
      end>
    object qryLookIndicadorPorDataDATAAPURADO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAAPURADO'
      Origin = 'BASEDADOS."CM.INDICADORXAPUR".DATAAPURADO'
    end
    object qryLookIndicadorPorDataINMDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'INMDESCRICAO'
      Origin = 'BASEDADOS."CM.INDICADORIMOVEL".INMDESCRICAO'
      Size = 60
    end
    object qryLookIndicadorPorDataVLRAPURADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAPURADO'
      Origin = 'BASEDADOS."CM.INDICADORXAPUR".VLRAPURADO'
    end
    object qryLookIndicadorPorDataFLGTIPOVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOVALOR'
      Origin = 'BASEDADOS."CM.INDICADORIMOVEL".FLGTIPOVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryLookLocalizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDLOCALIZACAO,'
      '   IDPESSOA,'
      '   IDTIPOAREA,'
      '   IDRESPONSAVEL,'
      '   IDEMPRESA,'
      '   NOME,'
      '   CODCENTROCUSTO,'
      '   ENDERECO,'
      '   TRGDTINCLUSAO,'
      '   TRGUSERINCLUSAO,'
      '   FLGLOCSAITEMP'
      'FROM'
      '   LOCALIZACAO'
      'WHERE'
      
        '   ( ( :PIDLOCALIZACAO IS NULL ) OR ( IDLOCALIZACAO = :PIDLOCALI' +
        'ZACAO ) )'
      '   AND ( ( :PIDPESSOA IS NULL ) OR ( IDPESSOA = :PIDPESSOA ) )'
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLookLocalizacaoNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.LOCALIZACAO.NOME'
      Size = 60
    end
    object qryLookLocalizacaoIDLOCALIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALIZACAO'
      Origin = 'BASEDADOS.LOCALIZACAO.IDLOCALIZACAO'
      Visible = False
    end
    object qryLookLocalizacaoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.LOCALIZACAO.IDPESSOA'
      Visible = False
    end
    object qryLookLocalizacaoIDTIPOAREA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOAREA'
      Origin = 'BASEDADOS.LOCALIZACAO.IDTIPOAREA'
      Visible = False
    end
    object qryLookLocalizacaoIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BASEDADOS.LOCALIZACAO.IDRESPONSAVEL'
      Visible = False
    end
    object qryLookLocalizacaoIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.LOCALIZACAO.IDEMPRESA'
      Visible = False
    end
    object qryLookLocalizacaoCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.LOCALIZACAO.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryLookLocalizacaoENDERECO: TStringField
      DisplayWidth = 120
      FieldName = 'ENDERECO'
      Origin = 'BASEDADOS.LOCALIZACAO.ENDERECO'
      Visible = False
      Size = 120
    end
    object qryLookLocalizacaoTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.LOCALIZACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryLookLocalizacaoTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.LOCALIZACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryLookLocalizacaoFLGLOCSAITEMP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGLOCSAITEMP'
      Origin = 'BASEDADOS.LOCALIZACAO.FLGLOCSAITEMP'
      Visible = False
    end
  end
  object qryLookClasseBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCLASSEBEM,'
      '   CODHIERARQ,'
      '   ANASINT,'
      '   DESCRICAO,'
      '   TRGDTINCLUSAO,'
      '   TRGUSERINCLUSAO,'
      '   IDGRUPO,'
      '   MASCARAIDOPCIONAL'
      'FROM'
      '   CLASSEDEBEM'
      'WHERE'
      
        '   ( ( :PIDCLASSEBEM IS NULL ) OR ( IDCLASSEBEM = :PIDCLASSEBEM ' +
        ') )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end>
    object qryLookClasseBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'BASEDADOS.CLASSEDEBEM.IDCLASSEBEM'
    end
    object qryLookClasseBemCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = 'BASEDADOS.CLASSEDEBEM.CODHIERARQ'
      FixedChar = True
      Size = 15
    end
    object qryLookClasseBemANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.CLASSEDEBEM.ANASINT'
      FixedChar = True
      Size = 1
    end
    object qryLookClasseBemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.CLASSEDEBEM.DESCRICAO'
      Size = 60
    end
    object qryLookClasseBemTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CLASSEDEBEM.TRGDTINCLUSAO'
    end
    object qryLookClasseBemTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CLASSEDEBEM.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLookClasseBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.CLASSEDEBEM.IDGRUPO'
    end
    object qryLookClasseBemMASCARAIDOPCIONAL: TStringField
      FieldName = 'MASCARAIDOPCIONAL'
      Origin = 'BASEDADOS.CLASSEDEBEM.MASCARAIDOPCIONAL'
    end
  end
  object qryLookLocatario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LC.IDLOCATARIO,'
      '   PP.NOME,'
      '   PP.RAZAOSOCIAL'
      ''
      'FROM'
      '   PESSOA PP, LOCATARIO LC'
      ''
      'WHERE'
      '   ( LC.IDLOCATARIO = PP.IDPESSOA )'
      
        '   AND ( (:PIDLOCATARIO IS NULL) OR (IDLOCATARIO = :PIDLOCATARIO' +
        ') )'
      ''
      'ORDER BY'
      '   PP.NOME')
    ValidateWithMask = True
    Left = 440
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end>
    object qryLookLocatarioIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = 'BASEDADOS.LOCATARIO.IDLOCATARIO'
    end
    object qryLookLocatarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryLookLocatarioRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
  end
  object qryLookSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDSITUACAO, DESCSITUACAO'
      'FROM'
      '   SITUACAO'
      'ORDER BY '
      '   DESCSITUACAO')
    ValidateWithMask = True
    Left = 440
    Top = 228
    object qryLookSituacaoIDSITUACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITUACAO'
      Origin = 'SITUACAO.IDSITUACAO'
      Visible = False
    end
    object qryLookSituacaoDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Origin = 'SITUACAO.DESCSITUACAO'
      Size = 45
    end
  end
  object qrySaldoBemXImovelouMestre: TwwQuery
    CachedUpdates = True
    OnCalcFields = qrySaldoBemXImovelouMestreCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENS' +
        'O,'
      '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'
      '   VW.IMOCODIGO, VW.IMOMATRICULA,'
      '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'
      
        '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO, VW.FLGSE' +
        'MPLACA,'
      '   VW.IDLOCALIZACAO, VW.IDRESPONSAVEL,'
      
        '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPER' +
        'CENTRATEIO,'
      
        '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOED' +
        'A_COMPRA,'
      
        '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOED' +
        'A_REAVAL,'
      
        '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.M' +
        'OEDA_MERCADO,'
      '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'
      
        '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW' +
        '.IDGRUPO,'
      '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'
      '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'
      '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'
      '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'
      '   VW.DESCCONJUNTO, VW.IDCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'
      '   VWT.SUMVALCTB,'
      '   VWT.SUMVALCTBIMOB'
      'FROM'
      '   VWBEMXIMOVEL VW,'
      '   ('
      '   SELECT'
      '      SCB.IDBEM, SCB.DATASLDBEM,'
      '      SCB.VALORG,'
      '      SCB.CMBEM,'
      '      SCB.DEPLANC,'
      '      SCB.CMDEP,'
      '      SCB.REAVVALORG,'
      '      SCB.REAVCMBEM,'
      '      SCB.REAVDEPLANC,'
      '      SCB.REAVCMDEP,'
      '      SCB.ULTREAVVALORG,'
      '      SCB.ULTREAVCMBEM,'
      '      SCB.ULTREAVDEPLANC,'
      '      SCB.ULTREAVCMDEP,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      '      ('
      '      SELECT'
      '         IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM'
      '         SALDOCONTABBEM'
      '      WHERE'
      '         ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '      GROUP BY'
      '         IDBEM'
      '      ) DTAMAX'
      '  WHERE'
      '      ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL) )'
      '      AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      '   ) VWT'
      'WHERE'
      
        '   ( (:PIDIMOVELMESTRE IS NULL) OR (VW.IDIMOVELMESTRE =:PIDIMOVE' +
        'LMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIDPESSOA IS NULL) OR (VW.IDPESSOA =:PIDPESSOA) )'
      '   AND ( VW.IDBEM = VWT.IDBEM )'
      'ORDER BY'
      '   VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.DESBEM')
    ValidateWithMask = True
    Left = 336
    Top = 288
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySaldoBemXImovelouMestre_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
    object qrySaldoBemXImovelouMestreIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qrySaldoBemXImovelouMestreNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qrySaldoBemXImovelouMestreIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySaldoBemXImovelouMestrePLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySaldoBemXImovelouMestreDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qrySaldoBemXImovelouMestreIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qrySaldoBemXImovelouMestreIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qrySaldoBemXImovelouMestreCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qrySaldoBemXImovelouMestreDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
    object qrySaldoBemXImovelouMestreFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qrySaldoBemXImovelouMestreSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
    end
    object qrySaldoBemXImovelouMestreIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySaldoBemXImovelouMestreIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qrySaldoBemXImovelouMestreIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qrySaldoBemXImovelouMestreIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qrySaldoBemXImovelouMestreIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qrySaldoBemXImovelouMestreIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qrySaldoBemXImovelouMestreIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qrySaldoBemXImovelouMestreIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qrySaldoBemXImovelouMestreIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qrySaldoBemXImovelouMestreMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qrySaldoBemXImovelouMestreIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qrySaldoBemXImovelouMestreIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qrySaldoBemXImovelouMestreIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qrySaldoBemXImovelouMestreMOEDA_REAVAL: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qrySaldoBemXImovelouMestreIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qrySaldoBemXImovelouMestreIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qrySaldoBemXImovelouMestreIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qrySaldoBemXImovelouMestreMOEDA_MERCADO: TStringField
      FieldName = 'MOEDA_MERCADO'
      Size = 10
    end
    object qrySaldoBemXImovelouMestreCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qrySaldoBemXImovelouMestreFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qrySaldoBemXImovelouMestreDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qrySaldoBemXImovelouMestreDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qrySaldoBemXImovelouMestreTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qrySaldoBemXImovelouMestreIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySaldoBemXImovelouMestreIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qrySaldoBemXImovelouMestreVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qrySaldoBemXImovelouMestreNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qrySaldoBemXImovelouMestreDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qrySaldoBemXImovelouMestreDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qrySaldoBemXImovelouMestreTIPOCCUSTO: TStringField
      FieldName = 'TIPOCCUSTO'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreCODCLASSEBEM: TStringField
      FieldName = 'CODCLASSEBEM'
      FixedChar = True
      Size = 15
    end
    object qrySaldoBemXImovelouMestreDESCCLASSEBEM: TStringField
      FieldName = 'DESCCLASSEBEM'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreTIPOCLASSEBEM: TStringField
      FieldName = 'TIPOCLASSEBEM'
      FixedChar = True
      Size = 1
    end
    object qrySaldoBemXImovelouMestreDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySaldoBemXImovelouMestreIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qrySaldoBemXImovelouMestreDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qrySaldoBemXImovelouMestreSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qrySaldoBemXImovelouMestreSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object qryLookFornecedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   F.IDFORCLI,'
      '   P.NOME,'
      '   P.RAZAOSOCIAL'
      ''
      'FROM'
      '   PESSOA P, EMPRESAFORN F'
      ''
      'WHERE'
      '   ( F.IDFORCLI = P.IDPESSOA )'
      '   AND ( (:PIDPESSOA IS NULL) OR (F.IDPESSOA = :PIDPESSOA) )'
      '   AND ( (:PIDFORCLI IS NULL) OR (F.IDFORCLI = :PIDFORCLI) )'
      ''
      'ORDER BY'
      '   P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end>
    object qryLookFornecedorIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.EMPRESAFORN.IDFORCLI'
    end
    object qryLookFornecedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryLookFornecedorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
  end
  object qryLookPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      '  FROM PLANPREVCONTABIL'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 440
    Top = 276
    object qryLookPlanoPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
    object qryLookPlanoPrevNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object qryLookPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      '  FROM PESSOA P, PATRO PT'
      ' WHERE PT.IDPESSOA   = P.IDPESSOA'
      '   AND PT.IDFUNDACAO = :pIdEmpresa'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 326
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdEmpresa'
        ParamType = ptUnknown
      end>
    object qryLookPatrocinadoraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryLookPatrocinadoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryLookSegmentoSPC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARTEIRASPC, '
      '  DESCARTEIRASPC  '
      'FROM'
      '  CARTEIRASPC'
      'WHERE'
      '  CODSEGMENTO = 3'
      'ORDER BY DESCARTEIRASPC      '
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 152
    object qryLookSegmentoSPCIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.IDCARTEIRASPC'
    end
    object qryLookSegmentoSPCDESCARTEIRASPC: TStringField
      FieldName = 'DESCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.DESCARTEIRASPC'
      Size = 60
    end
  end
  object qryLookUnidNegocioPerdida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  ( UNIDNEGOC=:pUNIDNEGOC)'
      'ORDER BY'
      '  NOME'
      ' ')
    ValidateWithMask = True
    Left = 448
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pUNIDNEGOC'
        ParamType = ptInput
      end>
    object qryLookUnidNegocioPerdidaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.UNIDNEGOCIO.NOME'
      Size = 25
    end
  end
  object qryLookTipoServico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT S.IDTIPOSERVICO, S.CODTIPOSERVICO, S.DESCRICAO '
      '  FROM TIPOSERVICO S'
      ' ORDER BY S.CODTIPOSERVICO ')
    ValidateWithMask = True
    Left = 448
    Top = 424
    object qryLookTipoServicoIDTIPOSERVICO: TFloatField
      FieldName = 'IDTIPOSERVICO'
      Origin = 'BASEDADOS.TIPOSERVICO.IDTIPOSERVICO'
    end
    object qryLookTipoServicoCODTIPOSERVICO: TStringField
      FieldName = 'CODTIPOSERVICO'
      Origin = 'BASEDADOS.TIPOSERVICO.CODTIPOSERVICO'
      FixedChar = True
      Size = 9
    end
    object qryLookTipoServicoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOSERVICO.DESCRICAO'
      Size = 100
    end
  end
  object qryLookProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROCESSO, NUMERO '
      '  FROM PROCESSOS '
      ' WHERE IDFORCLI = :PIDFORCLI')
    ValidateWithMask = True
    Left = 552
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptInput
      end>
    object qryLookProcessoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'BASEDADOS.PROCESSOS.IDPROCESSO'
    end
    object qryLookProcessoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.PROCESSOS.NUMERO'
      Size = 30
    end
  end
end
