inherited frmConfigModeloRUBS: TfrmConfigModeloRUBS
  Left = 166
  Top = 148
  Caption = 'Configuração de Modelo de RUBS'
  ClientHeight = 241
  ClientWidth = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    Height = 155
    inherited PnlImprime: TPanel
      Width = 549
      Height = 153
    end
    inherited PnlCadastro: TPanel
      Width = 549
      Height = 153
      inherited DeRelatorio: TwwDBEdit
        DataField = 'MODELOCARTA'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 551
  end
  inherited Dock971: TDock97
    Top = 202
    Width = 551
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 376
    Top = 54
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONFIGRUBS.DESCRUB')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Modelo de RUBS')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CONFIGRUBS')
    CamposChave.Strings = (
      'CONFIGRUBS.IDCONFIGRUBS'
      'CONFIGRUBS.DESCRUB'
      'CONFIGRUBS.IDREPORTS')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
  end
  inherited ImlPadrao: TImageList
    Left = 313
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (IDREPORTS = :IDREPORTS) AND'
      '  (FLGTIPOCARTA = '#39'R'#39')'
      ' '
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDREPORTS'
        ParamType = ptInput
      end>
    object qryIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDREPORTS'
    end
    object qryORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'BASEDADOS.CARTACOBRANCA.ORIGEMCM'
    end
    object qryFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.FLGTIPOCARTA'
      FixedChar = True
      Size = 1
    end
  end
  inherited MergeMenu: TMainMenu
    Left = 297
    Top = 125
  end
  inherited qryReports: TwwQuery
    Left = 30
    Top = 157
  end
  inherited PpDados: TppBDEPipeline
    Left = 136
  end
  inherited DsDados: TwwDataSource
    Left = 76
  end
  inherited QryDados: TwwQuery
    SQL.Strings = (
      'SELECT'
      '       RUBS.IDRUBS AS IDRUB,'
      '       A.IDATEND,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,'
      '       X.LOGRADOURO AS ENDERECO,'
      '       X.NUMERO AS NUMERO,'
      '       X.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       X.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       X.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIP,'
      '       A.NOMESOLICITANTE,'
      '       A.LOGRADOURO AS ENDERECO_SOLICIT,'
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,'
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLIC,'
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,'
      '       A.CEPSOLIC AS CEP_SOLICITANTE,'
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,'
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,'
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,'
      '       A.NUMDOCUMENTOCPF AS CPF_SOLICITANTE,'
      '       A.NUMDOCUMENTORG AS RG_SOLICITANTE,'
      '       A.EMAIL AS EMAIL_SOLICITANTE,'
      '       EL.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF ,'
      '       BAN.NUMBANCO  AS NUMERO_BANCO,'
      '       PB.NOME  AS NOME_BANCO,'
      '       AG.NUMAGENCIA  AS NUMERO_AGENCIA,'
      '       PA.NOME  AS NOME_AGENCIA,'
      '       CONT.CONTACORRENTE ,'
      '       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,'
      '       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,'
      '       CID.NOME AS  NOME_CIDADE,'
      '       DEPEN.DESCRICAO AS TIPO_DEPENDENTE,'
      '       ('
      '          SELECT'
      
        '             DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_' +
        'BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, BENEFICIO BE'
      '          WHERE'
      '             (RB.IDRUBS = RUBS.IDRUBS) AND'
      '             (RB.IDBENEFICIO = BE.IDBENEFICIO)'
      '          UNION'
      '          SELECT'
      '             SERV.NOME AS NOME_BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, SERVICO SERV'
      '          WHERE'
      '             (RB.IDRUBS = RUBS.IDRUBS) AND'
      '             (RB.IDBENEFICIO = SERV.IDSERVICOS)'
      '       )  AS NOME_BEN_SERV'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS X,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       ATEND A,'
      '       ASSUNTOXATEND AXA,'
      '       RUBS,'
      '       TELENDPESS TE,'
      '       BANCO BAN,'
      '       AGENCIABANCARIA AG,'
      '       CONTABANCARIA  CONT,'
      '       PESSOA  PB,'
      '       PESSOA  PA,'
      '       PAIS PI ,'
      '       DEPEN DEPEN,'
      '       DEPENTIT   DEPENTIT'
      'WHERE'
      '      (RUBS.IDRUBS =  :IDRUBS)'
      'AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      'AND   ( P.IDENDCORRESP = X.IDENDERECO(+))'
      'AND   (  X.IDCIDADES = CID.IDCIDADES(+)  )'
      'AND   (  EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = EL.IDPESSOA)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = P.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND   (A.IDTITULAR = P.IDPESSOA)'
      'AND   (A.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (A.IDATEND = AXA.IDATEND)'
      'AND   (EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (CONT.IDPESSOA (+) = P.IDPESSOA)'
      'AND   (CONT.FLGCONTAPREF  = 1 OR CONT.FLGCONTAPREF IS NULL)'
      'AND   (CONT.IDAGENCIA = AG.IDPESSOA(+))'
      'AND   (BAN.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PB.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PA.IDPESSOA(+) = AG.IDPESSOA)'
      'AND   (PI.IDPAIS(+) = PF.IDPAIS)'
      'AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO)'
      'AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA)')
    Left = 105
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBS'
        ParamType = ptInput
      end>
  end
  inherited RptModelo: TppReport
    Left = 187
    Top = 133
    DataPipelineName = 'PpDados'
  end
  inherited QryCadModelo: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (FLGTIPOCARTA = '#39'Z'#39')'
      'ORDER BY'
      '  MODELOCARTA')
    Left = 452
    Top = 181
  end
  object QryCamposRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.CAMPODETALHE'
      'FROM'
      '  DETALHERUBS D'
      'WHERE'
      '  D.IDCONFIGRUBS = :IDCONFIGRUBS'
      '')
    ValidateWithMask = True
    Left = 204
    Top = 170
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
  end
  object qryConfigRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCONFIGRUBS,'
      '  DESCRUB,'
      '  IDREPORTS,'
      '  ORIGEMCM'
      'FROM CONFIGRUBS '
      'WHERE IDCONFIGRUBS = :IDCONFIGRUBS'
      ''
      ''
      '')
    UpdateObject = UpdConfigRubs
    ValidateWithMask = True
    Left = 405
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONFIGRUBS'
        ParamType = ptInput
      end>
    object qryConfigRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryConfigRubsDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Size = 60
    end
    object qryConfigRubsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object qryConfigRubsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
    end
  end
  object UpdConfigRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update CONFIGRUBS'
      'set'
      '  IDREPORTS = :IDREPORTS'
      'where'
      '  IDCONFIGRUBS = :OLD_IDCONFIGRUBS')
    InsertSQL.Strings = (
      'insert into CONFIGRUBS'
      '  (IDREPORTS)'
      'values'
      '  (:IDREPORTS)')
    DeleteSQL.Strings = (
      'delete from CONFIGRUBS'
      'where'
      '  IDCONFIGRUBS = :OLD_IDCONFIGRUBS')
    Left = 485
    Top = 140
  end
end
