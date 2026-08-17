inherited frmConfigRubs: TfrmConfigRubs
  Left = 292
  Top = 157
  HelpContext = 190041
  Caption = 'Configuração de RUBS'
  ClientHeight = 266
  ClientWidth = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 550
    Height = 180
    inherited PnlImprime: TPanel
      Width = 548
      Height = 178
      inherited Label2: TLabel
        Top = 13
      end
      inherited CmbModelo: TCMDBLookupCombo
        Left = 20
        Top = 34
        Width = 407
        LookupTable = qryModelos
      end
      object GpRubs: TGroupBox
        Left = 12
        Top = 74
        Width = 408
        Height = 46
        Caption = ' Número da RUBS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label3: TLabel
          Left = 32
          Top = 20
          Width = 17
          Height = 13
          Caption = 'De'
        end
        object Label4: TLabel
          Left = 226
          Top = 20
          Width = 20
          Height = 13
          Caption = 'Até'
        end
        object EdtRubIni: TRealEdit
          Left = 76
          Top = 16
          Width = 88
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object EdtRubFin: TRealEdit
          Left = 301
          Top = 16
          Width = 88
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
    end
    inherited PnlCadastro: TPanel
      Width = 548
      Height = 178
      inherited DeRelatorio: TwwDBEdit
        DataField = 'MODELOCARTA'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 550
  end
  inherited Dock971: TDock97
    Top = 227
    Width = 550
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 199
      inherited BtnImprime: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 160
    Top = 206
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 261
    Top = 59
  end
  inherited upd: TUpdateSQL
    DeleteSQL.Strings = ()
    Left = 232
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CARTACOBRANCA.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome Modelo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA'
      'CONFIGRUBS')
    CamposChave.Strings = (
      'CARTACOBRANCA.IDCARTACOBRANCA'
      'CARTACOBRANCA.MODELOCARTA'
      'CONFIGRUBS.IDCONFIGRUBS')
    Filtro.Strings = (
      'CARTACOBRANCA.FLGTIPOCARTA = '#39'Z'#39
      'CONFIGRUBS.IDCARTACOBRANCA = CARTACOBRANCA.IDCARTACOBRANCA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 486
    Top = 19
  end
  inherited ImlPadrao: TImageList
    Left = 121
    Top = 206
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 454
  end
  inherited qry: TwwQuery
    AfterPost = qryAfterPost
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (IDCARTACOBRANCA = :IDCARTACOBRANCA) AND'
      '  (FLGTIPOCARTA = '#39'Z'#39')'
      ''
      ''
      '')
    Left = 196
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTACOBRANCA'
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
  inherited DsgnCM: TppDesigner
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion, scSubReport, scSystemVariable, scVariable]
    OnClose = DsgnCMClose
    Top = 165
  end
  inherited MergeMenu: TMainMenu
    Left = 9
    Top = 53
  end
  inherited qryReports: TwwQuery
    Left = 38
    Top = 125
  end
  inherited PpDados: TppBDEPipeline
    Left = 256
    Top = 125
  end
  inherited DsDados: TwwDataSource
    Left = 252
    Top = 157
  end
  inherited QryDados: TwwQuery
    SQL.Strings = (
      'SELECT'
      '        AXA.IDASSUNTOXATEND,'
      '        EL.VALORBASE1 AS  OPCAO_DE_MIGRACAO, '
      '        DECODE (TO_CHAR(SYSDATE, '#39'MM'#39'),    '
      '          '#39'01'#39', '#39'JANEIRO  '#39',          '
      '          '#39'02'#39', '#39'FEVEREIRO'#39',          '
      '          '#39'03'#39', '#39'MARÇO    '#39',          '
      '          '#39'04'#39', '#39'ABRIL    '#39',          '
      '          '#39'05'#39', '#39'MAIO     '#39',          '
      '          '#39'06'#39', '#39'JUNHO    '#39',          '
      '          '#39'07'#39', '#39'JULHO    '#39',          '
      '          '#39'08'#39', '#39'AGOSTO   '#39',          '
      '          '#39'09'#39', '#39'SETEMBRO '#39',          '
      '          '#39'10'#39', '#39'OUTUBRO  '#39',          '
      '          '#39'11'#39', '#39'NOVEMBRO '#39',          '
      '          '#39'12'#39', '#39'DEZEMBRO '#39') AS MESNOMINAL,          '
      #39'     '#39' AS DEPENDENTES_DO_IRRF,  '
      #39'     '#39' AS DEPENDENTES_LEGAIS,   '
      '       SITPLANOPREV.DESCRICAO AS SITUACAO_NO_PLANO,  '
      '       SITPART.DESCRICAO AS SITUACAO_NA_FUNDACAO,    '
      '       USU.NOMEUSUARIO AS ATENDENTE,                 '
      '       RUBS.IDRUBS AS IDRUB,                         '
      '       A.IDATEND,                                    '
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,          '
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,          '
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,        '
      '       P.IDPESSOA AS IDPARTICIPANTE,                 '
      '       P.NOME AS PARTICIPANTE,                       '
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,         '
      '       X.LOGRADOURO AS ENDERECO,                     '
      '       X.NUMERO AS NUMERO,                           '
      '       X.COMPLEMENTO AS COMPLEMENTO,                 '
      '       EST.CODESTADO AS ESTADO,                      '
      '       X.BAIRRO,                                     '
      '       CID.NOME AS CIDADE,                           '
      '       X.CEP,                                        '
      '       TE.DDD AS DDD_TEL_PARTICIP,'
      '       TE.NUMERO AS TELEFONE_PARTICIP,               '
      '       A.NOMESOLICITANTE,                            '
      '       A.LOGRADOURO AS ENDERECO_SOLICIT,             '
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,          '
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLIC,          '
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,          '
      '       A.CEPSOLIC AS CEP_SOLICITANTE,                '
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,          '
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,          '
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,      '
      '       A.NUMDOCUMENTOCPF AS CPF_SOLICITANTE,         '
      '       A.NUMDOCUMENTORG AS RG_SOLICITANTE,           '
      '       A.EMAIL AS EMAIL_SOLICITANTE,                 '
      '       A.PERGUNTA AS PERGUNTA_SOLICITANTE,           '
      '       A.RESPOSTA AS RESPOSTA_SOLICITANTE,           '
      '       A.OBSERVACAO AS OBSERVACAO_SOLICITANTE,       '
      '       EL.MATRICULA ,                                '
      '       PP.INSCRICAONUMERO AS INSCRICAO,              '
      '       PP.INSCRICAODATA AS DATAINSCRICAO,            '
      '       EL.DATAADMISSAO AS ADMISSAO,                  '
      '       EL.IDPESSJUR AS IDPATROCINADORA,              '
      '       PJ.NOME AS PATROCINADORA,                     '
      '       PL.IDPLANOPREV AS IDPLANO,                    '
      '       PL.NOME AS PLANO,                             '
      '       PF.NOMEPAI AS NOME_DO_PAI,                    '
      '       PF.NOMEMAE AS NOME_DA_MAE,                    '
      '       PF.DATAMORTE AS DATA_MORTE,                   '
      '       PF.DATANASC AS DATA_NASCIMENTO,               '
      '       PF.SEXO,                                      '
      '       PF.TIPOSANG AS TIPO_SANGUINIO,                '
      '       PF.ESTCIVIL AS ESTADO_CIVIL,                  '
      '       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,             '
      '       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,           '
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,           '
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF ,             '
      '       BAN.NUMBANCO  AS NUMERO_BANCO,                '
      '       PB.NOME  AS NOME_BANCO,                       '
      '       AG.NUMAGENCIA  AS NUMERO_AGENCIA,             '
      '       PA.NOME  AS NOME_AGENCIA,                     '
      '       CONT.CONTACORRENTE ,                          '
      '       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,      '
      '       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,      '
      '       CID.NOME AS  NOME_CIDADE,                     '
      '       DEPEN.DESCRICAO AS TIPO_DEPENDENTE,           '
      '       BEN_SERV.NOME_BEN_SERV,                       '
      '       BEN_SERV.IDBENEFICIO,                         '
      '       BEN_SERV.IDSITBENEF,                         '
      #39'ADRIANA WESTPHALEN VESCIA     '#39' AS BENEFICIARIOS,  '
      '       TO_CHAR(EL.DATAADMISSAO, '#39'DD/MM/YYYY'#39') AS DATA_ADMISSAO, '
      '       TO_CHAR(EL.DATADEMISSAO, '#39'DD/MM/YYYY'#39') AS DATA_DEMISSAO, '
      
        '       ENDERECOAG.CIDADE_AG_BANCARIA AS CIDADE_AG_BANCARIA,     ' +
        '  '
      
        '       ENDERECOAG.UF_AG_BANCARIA AS UF_AG_BANCARIA,             ' +
        '  '
      
        '       DEPEN.DESCRICAO AS PARENTESCO,                           ' +
        '  '
      
        '       INICBENEF.DATA_INIC_BENEFICIO AS DATA_INIC_BENEFICIO,    ' +
        '  '
      
        '       TO_CHAR(EL.DATAINICIOAFAST, '#39'DD/MM/YYYY'#39') AS DATA_INIC_AF' +
        'ASTAMENTO, '
      
        '       TO_CHAR(EL.DATAFIMAFAST, '#39'DD/MM/YYYY'#39') AS DATA_FIM_AFASTA' +
        'MENTO      '
      ' FROM  PESSOA P, '
      '       PESSOA PJ, '
      '       ELEGPATRO EL, '
      '       PLANPREV PL, '
      '       PATRO PT, '
      '       PARTPREVPLAN PP, '
      '       PESSOAFISICA PF, '
      '       ENDPESS X, '
      '       CIDADES CID, '
      '       ESTADO EST, '
      '       ATEND A, '
      '       ASSUNTOXATEND AXA, '
      '       RUBS, '
      
        '       (SELECT TEP.IDENDERECO, TEP.DDD, TEP.NUMERO FROM TELENDPE' +
        'SS TEP '
      
        '        WHERE TEP.IDTELEFONE IN (SELECT MAX(T.IDTELEFONE) AS IDT' +
        'ELEFONE FROM PESSOA P, TELENDPESS T  '
      
        '                                WHERE P.IDENDRESIDENCIAL = T.IDE' +
        'NDERECO GROUP BY T.IDENDERECO)) TE,'
      '       BANCO BAN,  '
      '       AGENCIABANCARIA AG, '
      '       CONTABANCARIA  CONT, '
      '       PESSOA  PB, '
      '       PESSOA  PA, '
      '       PAIS PI , '
      '       DEPEN DEPEN, '
      '       DEPENTIT, '
      '       USUARIOSISTEMA USU, '
      '       SITPART, '
      '       SITPLANOPREV, '
      '       (                                             '
      
        '          SELECT RB.IDRUBS, RB.IDBENEFICIO, RB.IDSITBENEF,      ' +
        '         '
      
        '             DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_' +
        'BEN_SERV '
      
        '          FROM                                                  ' +
        '         '
      '             RUBXBENEFICIO RB, BENEFICIO BE '
      '          WHERE '
      '             (RB.IDBENEFICIO = BE.IDBENEFICIO) '
      '          UNION '
      '          SELECT RB.IDRUBS, RB.IDBENEFICIO, RB.IDSITBENEF,'
      '             SERV.NOME AS NOME_BEN_SERV '
      '          FROM '
      '             RUBXBENEFICIO RB, SERVICO SERV '
      '          WHERE '
      '             (RB.IDBENEFICIO = SERV.IDSERVICOS) '
      '       ) BEN_SERV, '
      ''
      
        '       ( SELECT BE.IDPESSOA, RB.IDRUBS, RB.IDBENEFICIO, DATAINIC' +
        'IOFUND AS DATA_INIC_BENEFICIO '
      
        '       FROM RUBXBENEFICIO RB, BENEFBFCIARIO BE                  ' +
        '                 '
      
        '       WHERE (RB.IDBENEFICIO = BE.IDBENEFICIO) AND (RB.IDPESSOA ' +
        '= BE.IDPESSOA) AND BE.IDPESSOA = 8)INICBENEF,                   ' +
        '    '
      ''
      
        '       ( SELECT ENDAG.IDPESSOA, CIDAG.NOME AS CIDADE_AG_BANCARIA' +
        ', ESTADOAG.CODESTADO AS UF_AG_BANCARIA '
      
        '       FROM  ENDPESS ENDAG, CIDADES CIDAG, ESTADO ESTADOAG, PESS' +
        'OA PESSAG                              '
      
        '       WHERE      (ENDAG.IDCIDADES = CIDAG.IDCIDADES(+))        ' +
        '                                       '
      
        '       AND (CIDAG.IDESTADO = ESTADOAG.IDESTADO(+))              ' +
        '                                       '
      
        '       AND (ENDAG.IDPESSOA = PESSAG.IDPESSOA)                   ' +
        '                                       '
      
        '       AND (PESSAG.IDENDCOMERCIAL = ENDAG.IDENDERECO)) ENDERECOA' +
        'G      '
      '                               '
      ' WHERE '
      '      (RUBS.IDRUBS = 4434 ) '
      ' AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      ' AND   ( P.IDENDCORRESP = X.IDENDERECO(+)) '
      ' AND   (  X.IDCIDADES = CID.IDCIDADES(+)  ) '
      ' AND   (  EST.IDESTADO (+) = CID.IDESTADO) '
      ' AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND) '
      ' AND   (AXA.IDATEND = A.IDATEND)'
      ''
      ' AND   (PJ.IDPESSOA    = PT.IDPESSOA) '
      ' AND   (PT.IDPESSOA    = EL.IDPESSJUR) '
      ' AND   (P.IDPESSOA     = EL.IDPESSOA) '
      ' AND   (P.IDPESSOA     = PF.IDPESSOA) '
      ' AND   (PP.IDPESSJUR   = PT.IDPESSOA) '
      ' AND   (PP.IDPESSOA    = P.IDPESSOA) '
      ' AND   (PP.IDPLANOPREV = PL.IDPLANOPREV) '
      ''
      
        ' AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.' +
        'IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSO' +
        'A AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (' +
        '0, NULL) ) '
      
        ' AND (PP.INSCRICAODATA = (SELECT MAX(PP2.INSCRICAODATA) FROM PAR' +
        'TPREVPLAN PP2 WHERE PP2.IDPESSOA = PP.IDPESSOA))'
      ''
      ' AND   (A.IDTITULAR = P.IDPESSOA) '
      ' AND   (A.IDPESSJUR = PP.IDPESSJUR) '
      ' AND   (A.IDATEND = AXA.IDATEND) '
      ' AND   (EST.IDESTADO (+) = CID.IDESTADO) '
      ' AND   (CONT.IDPESSOA (+) = A.IDBENEFICIARIO) '
      ' AND   (CONT.FLGCONTAPREF(+)  = 1) '
      ' AND   (CONT.IDAGENCIA = AG.IDPESSOA(+)) '
      ' AND   (BAN.IDPESSOA(+) = AG.IDBANCO) '
      ' AND   (PB.IDPESSOA(+) = AG.IDBANCO) '
      ' AND   (PA.IDPESSOA(+) = AG.IDPESSOA) '
      ' AND   (PI.IDPAIS(+) = PF.IDPAIS) '
      ''
      ' AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO) '
      ' AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA) '
      ' AND   (A.CODATENDENTE = USU.IDUSUARIO(+)) '
      ' AND   (PP.IDSITPART = SITPART.IDSITPART(+)) '
      ' AND   (PP.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV(+)) '
      ' AND   (RUBS.IDRUBS = BEN_SERV.IDRUBS) '
      ' AND   (AG.IDPESSOA = ENDERECOAG.IDPESSOA(+)) '
      ' AND   (RUBS.IDRUBS = INICBENEF.IDRUBS(+)) '
      ' '
      ''
      '  '
      ''
      ' ')
    Left = 257
    Top = 157
  end
  inherited RptModelo: TppReport
    AutoStop = True
    DataPipeline = nil
    Template.DatabaseSettings.DataPipeline = PpDados
    ModalPreview = False
    Left = 355
    Top = 117
    DataPipelineName = ''
    inherited ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmHeight = 19050
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 5292
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 51858
        mmTop = 5027
        mmWidth = 17198
        BandType = 4
      end
    end
  end
  inherited QryCadModelo: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  IDCARTACOBRANCA = :IDCARTACOBRANCA AND'
      '  (FLGTIPOCARTA = '#39'Z'#39')'
      'ORDER BY'
      '  MODELOCARTA'
      ''
      '')
    Left = 380
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTACOBRANCA'
        ParamType = ptInput
      end>
    object QryCadModeloIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object QryCadModeloMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object QryCadModeloIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object QryCadModeloORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object QryCadModeloFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  object MsModelosRubs: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
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
      'CONFIGRUBS.DESCRUB'
      'CONFIGRUBS.IDCONFIGRUBS'
      'CONFIGRUBS.IDCARTACOBRANCA')
    Filtro.Strings = (
      
        'CONFIGRUBS.IDCARTACOBRANCA NOT IN ( SELECT IDCARTACOBRANCA FROM ' +
        'CARTACOBRANCA) OR (CONFIGRUBS.IDCARTACOBRANCA IS NULL)')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 286
    Top = 3
  end
  object qryConfigRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  idconfigRubs,'
      '  idcartacobranca '
      'from configRUBS'
      'where idconfigRubs = :idconfigrubs')
    UpdateObject = updConfigRubs
    ValidateWithMask = True
    Left = 365
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idconfigrubs'
        ParamType = ptInput
      end>
    object qryConfigRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryConfigRubsIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
    end
  end
  object updConfigRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update configRUBS'
      'set'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  IDCARTACOBRANCA = :IDCARTACOBRANCA'
      'where'
      '  IDCONFIGRUBS = :OLD_IDCONFIGRUBS')
    InsertSQL.Strings = (
      'insert into configRUBS'
      '  (IDCONFIGRUBS, IDCARTACOBRANCA)'
      'values'
      '  (:IDCONFIGRUBS, :IDCARTACOBRANCA)')
    DeleteSQL.Strings = (
      'delete from configRUBS'
      'where'
      '  IDCONFIGRUBS = :OLD_IDCONFIGRUBS')
    Left = 416
    Top = 1
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
    Left = 433
    Top = 165
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDRUBS,'
      '  HL.FLGSTATUS,'
      '  CC.IDREPORTS,'
      '  C.IDCONFIGRUBS,'
      '  C.DESCRUB,'
      '  C.NOMETXTRUB,'
      '  C.NOMEDOCRUB,'
      '  C.SEPARADORCOLUNAS,'
      '  C.NUMDIASCARTAAVISO,'
      '  C.FLGDELIMITALINHA,'
      '  C.IDCARTACOBRANCA'
      'FROM'
      '  CONFIGRUBS C,'
      '  RUBS R,'
      '  ASSUNTO A,'
      '  ASSUNTOXATEND AXA,'
      '  CARTACOBRANCA CC,'
      '  HISTMOVRUBS HL'
      'WHERE'
      '  R.IDRUBS = -1 AND'
      '  R.IDRUBS = HL.IDRUBS AND'
      '  R.IDASSUNTOXATEND = AXA.IDASSUNTOXATEND(+)  AND'
      '  A.IDASSUNTO = AXA.IDASSUNTO  AND'
      '  A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND'
      '  C.IDCONFIGRUBS = A.IDCONFIGRUBS AND'
      '  CC.IDCARTACOBRANCA = C.IDCARTACOBRANCA')
    UpdateObject = UpdBuscaRubs
    ValidateWithMask = True
    Left = 141
    Top = 124
    object qryBuscaRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
    end
    object qryBuscaRubsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Size = 2
    end
    object qryBuscaRubsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object qryBuscaRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryBuscaRubsDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Size = 60
    end
    object qryBuscaRubsNOMETXTRUB: TStringField
      FieldName = 'NOMETXTRUB'
      Size = 60
    end
    object qryBuscaRubsNOMEDOCRUB: TStringField
      FieldName = 'NOMEDOCRUB'
      Size = 60
    end
    object qryBuscaRubsSEPARADORCOLUNAS: TStringField
      FieldName = 'SEPARADORCOLUNAS'
      FixedChar = True
      Size = 1
    end
    object qryBuscaRubsNUMDIASCARTAAVISO: TFloatField
      FieldName = 'NUMDIASCARTAAVISO'
    end
    object qryBuscaRubsFLGDELIMITALINHA: TStringField
      FieldName = 'FLGDELIMITALINHA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaRubsIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
    end
  end
  object qryModelos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM  CARTACOBRANCA'
      'WHERE'
      '  FLGTIPOCARTA = '#39'Z'#39
      'ORDER BY MODELOCARTA'
      ''
      '')
    ValidateWithMask = True
    Left = 309
    Top = 60
    object qryModelosIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryModelosMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryModelosIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDREPORTS'
    end
    object qryModelosORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'BASEDADOS.CARTACOBRANCA.ORIGEMCM'
    end
    object qryModelosFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.FLGTIPOCARTA'
      FixedChar = True
      Size = 1
    end
  end
  object UpdBuscaRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVRUBS'
      'set'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    InsertSQL.Strings = (
      '')
    Left = 141
    Top = 172
  end
  object qrylimpa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 493
    Top = 148
  end
  object UpdGravaTemplate: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.REPORTS'
      'set'
      '  NAME = :NAME,'
      '  IDREPORTS = :IDREPORTS,'
      '  ORIGEMCM = :ORIGEMCM,'
      '  TEMPLATE = :TEMPLATE'
      'where'
      '  NAME = :OLD_NAME and'
      '  IDREPORTS = :OLD_IDREPORTS and'
      '  ORIGEMCM = :OLD_ORIGEMCM and'
      '  TEMPLATE = :OLD_TEMPLATE')
    InsertSQL.Strings = (
      'insert into CM.REPORTS'
      '  (NAME, IDREPORTS, ORIGEMCM, TEMPLATE)'
      'values'
      '  (:NAME, :IDREPORTS, :ORIGEMCM, :TEMPLATE)')
    DeleteSQL.Strings = (
      'delete from CM.REPORTS'
      'where'
      '  NAME = :OLD_NAME and'
      '  IDREPORTS = :OLD_IDREPORTS and'
      '  ORIGEMCM = :OLD_ORIGEMCM and'
      '  TEMPLATE = :OLD_TEMPLATE')
    Left = 85
    Top = 172
  end
  object qryGravaTemplate: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 46
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end>
    object qryGravaTemplateNAME: TStringField
      FieldName = 'NAME'
      Origin = 'BASEDADOS.REPORTS.NAME'
      Size = 100
    end
    object qryGravaTemplateIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS.REPORTS.IDREPORTS'
    end
    object qryGravaTemplateORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'BASEDADOS.REPORTS.ORIGEMCM'
    end
    object qryGravaTemplateTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'BASEDADOS.REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object qryDetDocs: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT '
      'TP.NOMEDOCUMENTO,'
      'TB.IDPESSOA,'
      'TB.IDPLANOPREV,'
      'TB.IDBENEFICIO,'
      'TB.IDSITBENEF,'
      'TB.IDDOCUMENTO,'
      'TB.IDTIPODOCXBENEF'
      'FROM DOCUMENTOS TP, TIPODOCXBENEF TB'
      'WHERE (TB.IDPESSOA    = :IDPATROCINADORA)  AND'
      '      (TB.IDPLANOPREV = :IDPLANO) AND'
      '      (TB.IDBENEFICIO = :IDBENEFICIO)AND'
      '      (TB.IDSITBENEF  = :IDSITBENEF) AND'
      '      (TB.IDDOCUMENTO = TP.IDDOCUMENTO)'
      'ORDER BY TP.NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 497
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPATROCINADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end>
  end
  object ppdetalhe_documentos: TppBDEPipeline
    DataSource = dsDetDocs
    UserName = 'detalhe_documentos'
    Left = 417
    Top = 120
  end
  object dsDetDocs: TwwDataSource
    DataSet = qryDetDocs
    Left = 529
    Top = 200
  end
  object qryDetDependIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT D.NUMSEQUENCIA, P.NOME,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       DP.DESCRICAO AS DEPENDENCIA,'
      
        '       DECODE(D.FLGCONTAIMPOSTOR, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDIRRF' +
        ','
      
        '       DECODE(D.FLGCONTASALARIOF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDSALA' +
        'RIOFAMILIA, '
      
        '       DECODE (DECODE(BF.IDPESSOA, NULL, 0, 1 ), 1, '#39'SIM'#39', '#39'NÃO'#39 +
        ') AS BENEFICIARIO, '
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      '       DECODE(D.FLGDESIGNADO, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DESIGNADO,'
      
        '       DECODE(D.FLGDEPLEGAL, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDENTE_LEGA' +
        'L,                                      '
      '       D.MATRICULA,'
      '       D.INICIOIMPOSTOR AS DATA_INICIO_IRRF,'
      '       D.FIMIMPOSTOR AS DATA_FIM_IRRF,'
      
        '       D.INICIOSALARIOF AS DT_INI_SAL_FAMILIA,                  ' +
        '                                          '
      '       D.FIMSALARIOF AS DT_FIM_SAL_FAMILIA,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.NOMEPAI AS NOME_PAI,'
      '       PF.NOMEMAE AS NOME_MAE,'
      '       DECODE(PF.SEXO, '#39'M'#39', '#39'MASCULINO'#39', '#39'FEMININO'#39') AS SEXO,'
      
        '       DECODE(PF.FLGMOLESTIAGRAVE, 1, '#39'SIM'#39', '#39'NÃO'#39') AS POSSUI_MO' +
        'LESTIA_GRAVE, '
      '       PF.DATAMOLESTIAGRAVE AS DATA_MOLESTIA_GRAVE,'
      '       DECODE(PF.FLGISENTOIRRF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS ISENOT_IRRF,'
      '       SIT.DESCRICAO AS SITUACAO_DEPENDENTE'
      
        'FROM   PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP, D' +
        'EPENDENTE DEP, DEPENTIT D, (SELECT DISTINCT IDTITULAR,IDPESSOA F' +
        'ROM BENEFBFCIARIO'
      
        'WHERE IDTITULAR     = :idtitular AND IDSITBENEFICIO IN (1,2,4)) ' +
        'BF'
      'WHERE  D.IDTITULAR     = :idtitular'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    BF.IDTITULAR(+) = D.IDTITULAR'
      'AND    BF.IDPESSOA(+)  = D.IDPESSOA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'AND    D.FLGCONTAIMPOSTOR = 1'
      'ORDER BY D.NUMSEQUENCIA         ')
    ValidateWithMask = True
    Left = 273
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end>
  end
  object dsDetDependIRRF: TwwDataSource
    DataSet = qryDetDependIRRF
    Left = 217
    Top = 208
  end
  object ppDetalhe_Dependente_IRRF: TppBDEPipeline
    DataSource = dsDetDependIRRF
    UserName = 'Detalhe_Dependente_IRRF'
    Left = 312
    Top = 202
  end
  object ppDetalhe_Telefones: TppBDEPipeline
    DataSource = dsDetTelefones
    UserName = 'Detalhe_Telefones'
    Left = 180
    Top = 122
  end
  object qryDetTelefones: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT'
      '  EP.IDPESSOA AS IDBENFICIARIO,'
      '  TEL.DDI,'
      '  TEL.DDD,'
      '  TEL.NUMERO,'
      '  TEL.TIPO,'
      'DECODE(SUBSTR(TEL.TIPO,  1, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  2, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  3, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  4, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') ||'
      'DECODE(SUBSTR(TEL.TIPO,  5, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39','
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') ||'
      'DECODE(SUBSTR(TEL.TIPO,  6, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39','
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') AS DESCTIPO'
      'FROM ENDPESS EP, TELENDPESS TEL'
      'WHERE EP.IDPESSOA = :IDBENFICIARIO AND'
      '      TEL.IDENDERECO = EP.IDENDERECO'
      ' ')
    ValidateWithMask = True
    Left = 203
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idbenficiario'
        ParamType = ptInput
      end>
  end
  object dsDetTelefones: TwwDataSource
    DataSet = qryDetTelefones
    Left = 203
    Top = 164
  end
  object qryDetDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT D.NUMSEQUENCIA, P.NOME,'
      '       P.NUMDOCUMENTO AS CPF,'
      '       DP.DESCRICAO AS DEPENDENCIA,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      '       DECODE(D.FLGDESIGNADO, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DESIGNADO,'
      
        '       DECODE(D.FLGDEPLEGAL, 1, '#39'SIM'#39', '#39'NÃO'#39') AS DEPENDENTE_LEGA' +
        'L,                                      '
      '       D.MATRICULA,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.NOMEPAI AS NOME_PAI,'
      '       PF.NOMEMAE AS NOME_MAE,'
      '       DECODE(PF.SEXO, '#39'M'#39', '#39'MASCULINO'#39', '#39'FEMININO'#39') AS SEXO,'
      
        '       DECODE(PF.FLGMOLESTIAGRAVE, 1, '#39'SIM'#39', '#39'NÃO'#39') AS POSSUI_MO' +
        'LESTIA_GRAVE, '
      '       PF.DATAMOLESTIAGRAVE AS DATA_MOLESTIA_GRAVE,'
      '       SIT.DESCRICAO AS SITUACAO_DEPENDENTE'
      'FROM   PESSOA P, '
      '       PESSOAFISICA PF, '
      '       SITDEPENDENTE SIT, '
      '       DEPEN DP, '
      '       DEPENDENTE DEP, '
      '       DEPENTIT D'
      'WHERE  D.IDTITULAR     = :IDTITULAR'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'ORDER BY D.NUMSEQUENCIA')
    ValidateWithMask = True
    Left = 8
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object dtsDetDependentes: TwwDataSource
    DataSet = qryDetDependentes
    Left = 16
    Top = 208
  end
  object ppDetalhe_Dependente: TppBDEPipeline
    DataSource = dtsDetDependentes
    UserName = 'Detalhe_Dependente'
    Left = 352
    Top = 202
  end
  object dtsDetBeneficiarios: TwwDataSource
    DataSet = qryDetBeneficiarios
    Left = 96
    Top = 136
  end
  object ppDetalhe_Beneficiario: TppBDEPipeline
    DataSource = dtsDetBeneficiarios
    UserName = 'Detalhe_Beneficiario'
    Left = 300
    Top = 134
  end
  object qryDetBeneficiarios: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT P.IDPESSOA,'
      '       P.NOME, '
      '       DP.DESCRICAO AS DEPENDENCIA,       '
      '       DECODE( F.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL, '
      '       F.DATANASC, '
      '       DECODE( F.SEXO, '#39'M'#39', '#39'MASCULINO'#39', '#39'FEMININO'#39' ) AS SEXO '
      'FROM   PESSOA        P,'
      '       BENEFBFCIARIO B, '
      '       PESSOAFISICA  F,'
      '       DEPENTIT      D,'
      '       DEPEN         DP '
      'WHERE  P.IDPESSOA      = B.IDPESSOA '
      '  AND  P.IDPESSOA      = F.IDPESSOA'
      '  AND  D.IDTITULAR     = B.IDTITULAR (+)'
      '  AND  D.IDPESSOA      = B.IDPESSOA'
      '  AND  D.IDDEPENDENCIA <> '#39'PRP'#39
      '  AND  D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      '  AND  B.IDTITULAR     = :IDTITULAR'
      '  AND  B.IDBENEFICIO   = :IDBENEFICIO'
      '  AND  B.IDPLANOPREV   = :IDPLANO'
      '  AND  B.IDPESSJUR     = :IDPATROCINADORA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATROCINADORA'
        ParamType = ptInput
      end>
  end
end
