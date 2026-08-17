inherited frmDesenhoRelAvisoCobranca: TfrmDesenhoRelAvisoCobranca
  Left = 166
  Top = 153
  HelpContext = 640005
  Caption = 'Configuração de Aviso de Cobrança'
  ClientHeight = 247
  ClientWidth = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 577
    Height = 179
    inherited Label1: TLabel
      Top = 10
    end
    inherited Label2: TLabel
      Top = 58
    end
    inherited DBedtNomeModelo: TwwDBEdit
      Top = 24
      DataField = 'MODELOCARTA'
    end
    inherited memReports: TMemo
      Top = 24
    end
    inherited btnDesenho: TBitBtn
      Top = 114
    end
    inherited edtArquivoModelo: TEdit
      Top = 72
    end
    inherited btnLimpaArquivo: TBitBtn
      Top = 72
      Width = 24
    end
    inherited btnAbreArquivo: TBitBtn
      Left = 512
      Top = 72
    end
    object DBrdgTipoCobranca: TDBRadioGroup
      Left = 16
      Top = 115
      Width = 393
      Height = 41
      Caption = ' Tipo do Modelo '
      Columns = 3
      DataField = 'FLGTIPOCARTA'
      DataSource = ds
      Items.Strings = (
        'Analítico'
        'Consolidado'
        'Discriminado')
      TabOrder = 6
      Values.Strings = (
        'I'
        'S'
        'D')
    end
  end
  inherited Dock972: TDock97
    Width = 577
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Novo'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 577
  end
  inherited ds: TwwDataSource
    Left = 536
    Top = 32
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARTACOBRANCA'
      'set'
      '  IDCARTACOBRANCA = :IDCARTACOBRANCA,'
      '  MODELOCARTA = :MODELOCARTA,'
      '  IDREPORTS = :IDREPORTS,'
      '  ORIGEMCM = :ORIGEMCM,'
      '  FLGTIPOCARTA = :FLGTIPOCARTA'
      'where'
      '  IDCARTACOBRANCA = :OLD_IDCARTACOBRANCA')
    InsertSQL.Strings = (
      'insert into CARTACOBRANCA'
      
        '  (IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCAR' +
        'TA)'
      'values'
      
        '  (:IDCARTACOBRANCA, :MODELOCARTA, :IDREPORTS, :ORIGEMCM, :FLGTI' +
        'POCARTA)')
    DeleteSQL.Strings = (
      'delete from CARTACOBRANCA'
      'where'
      '  IDCARTACOBRANCA = :OLD_IDCARTACOBRANCA')
    Left = 304
    Top = 80
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CC.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA CC')
    CamposChave.Strings = (
      'CC.IDCARTACOBRANCA')
    Filtro.Strings = (
      'CC.IDREPORTS IS NOT NULL'
      
        '(CC.FLGTIPOCARTA = '#39'I'#39' OR CC.FLGTIPOCARTA = '#39'S'#39' OR CC.FLGTIPOCAR' +
        'TA = '#39'D'#39')')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 237
    Top = 32
  end
  inherited ImlPadrao: TImageList
    Left = 369
    Top = 80
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 366
    Top = 32
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA, MODELOCARTA,'
      '   IDREPORTS, ORIGEMCM, FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '   ( IDCARTACOBRANCA = :PCARTACOBRANCA )'
      '   AND'
      '   ('
      '   (FLGTIPOCARTA = '#39'I'#39') OR'
      '   (FLGTIPOCARTA = '#39'S'#39') OR'
      '   (FLGTIPOCARTA = '#39'D'#39')'
      '   )')
    Left = 504
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCARTACOBRANCA'
        ParamType = ptUnknown
      end>
    object qryIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object qryORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object qryFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  inherited dlgAbreArquivo: TOpenDialog
    Left = 433
    Top = 86
  end
  inherited ppConsulta: TppBDEPipeline
    Left = 160
    Top = 20
  end
  inherited DsgnCM: TppDesigner
    AllowDataSettingsChange = True
    Left = 304
    Top = 32
  end
  inherited dsConsulta: TwwDataSource
    Left = 160
    Top = 66
  end
  inherited MergeMenu: TMainMenu
    Left = 433
    Top = 32
    inherited mniFile: TMenuItem
      inherited Sair1: TMenuItem
        OnClick = nil
      end
    end
  end
  inherited qryReports: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PREPORT) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)'
      ' ')
    Left = 237
    Top = 80
  end
  object qryCobranca: TwwQuery [16]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IMONOME, IM.IMONOME AS NOME_MESTRE,'
      
        '   CI.CONNUMERO, CI.CONNOME, CI.CONDIASTOLERANCIA, CI.FLGTIPODIA' +
        'TOLERA,'
      
        '   CI.CODESTADO, CI.CONDATAREAJUSTE, CI.CONVLRAJUSTADO AS VLR_AT' +
        'UAL_CONTRATO,'
      '   CI.CONVLRTOTAL AS VLR_ANT_CONTRATO,'
      '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE,'
      ''
      
        '   DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, CX.CIMDESCRICAO) AS ' +
        'NOME_IMOVEL,'
      ''
      
        '   IM.IMONOME||'#39' - '#39'||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, C' +
        'X.CIMDESCRICAO) AS NOME_EXTENSO,'
      ''
      '   P.RAZAOSOCIAL,'
      '   CP.NOME AS NOME_CONTATO,'
      
        '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO AS ENDERECO' +
        ','
      ''
      '   -- Marchetti - Pendencia 19889'
      '   E.CEP,'
      '   I.IMOAREA AS AREA_LOCADA,'
      '   D.DATAPROGRAMADA,'
      '   -- Fim Marchetti - Pendencia 19889'
      ''
      '   PC.NOCONTACORR AS CONTA_CORRENTE,'
      '   PB.NOME AS NOME_BANCO,'
      '   PA.NOME AS NOME_AGENCIA,'
      '   B.NUMBANCO, A.NUMAGENCIA,'
      ''
      '   LI.VLRMULTA, LI.VLRJUROS, LI.VLRCORRECAOMON,'
      '   LI.MESREFERENCIA, LI.ANOREFERENCIA,'
      '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO,'
      '   LI.DATACORRECAO, D.DATAPROGRAMADA,'
      ''
      '   TR.DESCCUSTORECIMO,'
      '   LD.OPERACAO, LD.DATALANCTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO) AS DATA,'
      '   TA.DESCRICAO,'
      '   DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1) AS VALOR'
      ''
      'FROM'
      '   LANCAMENTOSIMOVEL LI, TIPOCUSTORECIMOV  TR,'
      '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL CI,'
      '   PORTADORFORMA PF, PORTADORCONTA PC,'
      '   IMOVEL I, IMOVEL IM, ENDPESS E, DOCUMENTO D,'
      '   PESSOA P, LANCTODOCUM LD, TIPOALTERADOR TA,'
      '   PESSOA PB, PESSOA PA, BANCO B, AGENCIABANCARIA A,'
      ''
      '   ('
      '   SELECT'
      '      CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '   FROM'
      '      CONTATOPESS CXP,'
      '      ('
      '      SELECT'
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '      FROM'
      '         CONTATOPESS'
      '      GROUP BY'
      '         IDENDERECO'
      '      ) CON'
      '   WHERE'
      '      ( CON.IDCONTATO = CXP.IDCONTATO )'
      '   ) CP'
      ''
      'WHERE'
      '   ( LI.RECPAG = '#39'R'#39' )'
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO)'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '   AND ( LI.IDIMOVEL = CX.IDIMOVEL )'
      '   AND ( LI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( CI.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( P.IDENDCORRESP = E.IDENDERECO(+) )'
      '   AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '   AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      ''
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      '   AND ( CI.CODPORTFORMA = PF.CODPORTFORMA )'
      '   AND ( PF.CODPORTADOR = PC.CODPORTADOR )'
      '   AND ( PC.IDAGENCIA = PA.IDPESSOA )'
      '   AND ( PC.IDAGENCIA = A.IDPESSOA )'
      '   AND ( A.IDBANCO = PB.IDPESSOA )'
      '   AND ( A.IDBANCO = B.IDPESSOA )'
      '   AND ( ROWNUM < 20 )'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, LI.IDIMOVEL'
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
    Left = 136
    Top = 128
    object qryCobrancaDESCALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 25
      Calculated = True
    end
    object qryCobrancaDataPagamento: TDateField
      FieldKind = fkCalculated
      FieldName = 'DataPagamento'
      Calculated = True
    end
    object qryCobrancadataatual: TStringField
      FieldKind = fkCalculated
      FieldName = 'dataatual'
      Size = 60
      Calculated = True
    end
    object qryCobrancadatajuros: TStringField
      FieldKind = fkCalculated
      FieldName = 'datajuros'
      Size = 10
      Calculated = True
    end
    object qryCobrancadatames: TStringField
      FieldKind = fkCalculated
      FieldName = 'datames'
      Size = 15
      Calculated = True
    end
    object qryCobrancaContratoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 120
      Calculated = True
    end
    object qryCobrancaIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryCobrancaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryCobrancaCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryCobrancaCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryCobrancaFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Size = 1
    end
    object qryCobrancaNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryCobrancaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryCobrancaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qryCobrancaCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object qryCobrancaNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 60
    end
    object qryCobrancaNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryCobrancaNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryCobrancaVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
    end
    object qryCobrancaVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryCobrancaVLRCORRECAOMON: TFloatField
      FieldName = 'VLRCORRECAOMON'
    end
    object qryCobrancaMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryCobrancaANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryCobrancaMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryCobrancaANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryCobrancaDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryCobrancaDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCobrancaDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
    end
    object qryCobrancaDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryCobrancaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryCobrancaDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryCobrancaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryCobrancaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCobrancaNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 60
    end
    object qryCobrancaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCobrancaNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCobrancaNOME_EXTENSO: TStringField
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object qryCobrancaCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryCobrancadesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc'
      Size = 1000
      Calculated = True
    end
    object qryCobrancaValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qryCobrancames: TStringField
      FieldKind = fkCalculated
      FieldName = 'mes'
      Size = 200
      Calculated = True
    end
    object qryCobrancaCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryCobrancaVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qryCobrancaVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qryCobrancaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qryCobrancaCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryCobrancaCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryCobrancaDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryCobrancaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryCobrancaAREA_LOCADA: TFloatField
      FieldName = 'AREA_LOCADA'
    end
    object qryCobrancaDatasAnteriores: TStringField
      FieldKind = fkCalculated
      FieldName = 'DatasAnteriores'
      Calculated = True
    end
    object qryCobrancaDATAPROGRAMADA_1: TDateTimeField
      FieldName = 'DATAPROGRAMADA_1'
    end
    object qryCobrancaImovelLocado: TStringField
      FieldKind = fkCalculated
      FieldName = 'ImovelLocado'
      Calculated = True
    end
  end
  object qryConsolidado: TwwQuery [17]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/* Consolidado */'
      'SELECT'
      '   TR.DESCCUSTORECIMO,'
      ''
      
        '   CI.CONNUMERO, CI.CONNOME, CI.CONDIASTOLERANCIA, CI.FLGTIPODIA' +
        'TOLERA,'
      
        '   CI.CODESTADO, CI.CONDATAREAJUSTE, CI.CONVLRAJUSTADO AS VLR_AT' +
        'UAL_CONTRATO,'
      '   CI.CONVLRTOTAL AS VLR_ANT_CONTRATO,'
      
        '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE, I.AREA AS AREA_LOCAD' +
        'A,'
      ''
      '   P.RAZAOSOCIAL,'
      '   CP.NOME AS NOME_CONTATO,'
      
        '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO AS ENDERECO' +
        ','
      '   CD.NOME || '#39' - '#39' || UF.CODESTADO AS NOME_CIDADE, E.CEP,'
      '   PC.NOCONTACORR AS CONTA_CORRENTE,'
      '   PB.NOME AS NOME_BANCO,'
      '   PA.NOME AS NOME_AGENCIA,'
      '   B.NUMBANCO,'
      '   A.NUMAGENCIA,'
      ''
      '   LI.MESREFERENCIA, LI.ANOREFERENCIA, LI.MESCOMPETENCIA,'
      '   LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.DATACORRECAO,'
      ''
      '   LD.OPERACAO, LD.DATALANCTO, D.DATAPROGRAMADA,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO)) AS DATA,'
      ''
      '   TA.DESCRICAO,'
      '   SUM(DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, LD.VALOR * -1)) AS VALOR'
      ''
      'FROM'
      '   PESSOA P, PESSOA PB, PESSOA PA,'
      '   LANCAMENTOSIMOVEL LI, TIPOCUSTORECIMOV  TR,'
      '   CONTRATOIMOVEL CI,'
      '   PORTADORFORMA PF, PORTADORCONTA PC,'
      '   DOCUMENTO D, ENDPESS E,'
      '   LANCTODOCUM LD, TIPOALTERADOR TA,'
      '   BANCO B, AGENCIABANCARIA A,'
      '   CIDADES CD, ESTADO UF,'
      '   ('
      '     SELECT'
      '        CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '     FROM'
      '        CONTATOPESS CXP,'
      '     ('
      '       SELECT'
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '       FROM'
      '         CONTATOPESS'
      '       GROUP BY'
      '         IDENDERECO'
      '     ) CON'
      '     WHERE'
      '     ( CON.IDCONTATO = CXP.IDCONTATO )'
      '     ) CP,'
      '   ('
      '    SELECT CXI.IDCONTRATOIMOVEL,'
      '           ROUND( SUM( DECODE(CXI.FLGRATEIO, 1,'
      
        '                              I.IMOAREA * (CXI.CIMPERCENTRATEIO/' +
        '100),'
      '                              I.IMOAREA) ), 2) AS AREA'
      '      FROM CONTRATOXIMOVEL CXI, IMOVEL I'
      '     WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '     GROUP BY CXI.IDCONTRATOIMOVEL'
      '    ) I  '
      '       '
      'WHERE'
      '   ( LI.RECPAG = '#39'R'#39' )'
      ''
      
        '   AND ((:PMESCOMPETENCIA IS NULL) OR (LI.MESCOMPETENCIA = :PMES' +
        'COMPETENCIA))'
      
        '   AND ((:PANOCOMPETENCIA IS NULL) OR (LI.ANOCOMPETENCIA = :PANO' +
        'COMPETENCIA))'
      
        '   AND ((:PIDCONTRATOIMOVEL IS NULL) OR (LI.IDCONTRATOIMOVEL = :' +
        'PIDCONTRATOIMOVEL))'
      
        '   AND ((:PIDLOCATARIO IS NULL) OR (CI.IDLOCATARIO = :PIDLOCATAR' +
        'IO))'
      
        '   AND ((:PDATAVENCIMENTO IS NULL) OR (LI.DATAVENCIMENTO = :PDAT' +
        'AVENCIMENTO))'
      ''
      '   AND'
      
        '   (((:STATUS = '#39'P'#39' AND RTRIM(D.STATUS) <> '#39'2'#39') OR (D.STATUS IS ' +
        'NULL))'
      '    OR (:STATUS IS NULL))'
      ''
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )'
      '   AND ( LI.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( LI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '   AND ( CI.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( CI.IDCONTRATOIMOVEL = I.IDCONTRATOIMOVEL(+) )'
      '   AND ( P.IDENDCOBRANCA = E.IDENDERECO(+) )'
      '   AND ( E.IDCIDADES = CD.IDCIDADES(+) )'
      '   AND ( CD.IDESTADO = UF.IDESTADO(+) )'
      '   AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '   AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      '   AND ( CI.CODPORTFORMA = PF.CODPORTFORMA )'
      '   AND ( PF.CODPORTADOR = PC.CODPORTADOR )'
      '   AND ( PC.IDAGENCIA = PA.IDPESSOA )'
      '   AND ( PC.IDAGENCIA = A.IDPESSOA )'
      '   AND ( A.IDBANCO = PB.IDPESSOA )'
      '   AND ( A.IDBANCO = B.IDPESSOA )'
      '   AND ( ROWNUM < 20 )'
      ''
      'GROUP BY'
      '   TR.DESCCUSTORECIMO,'
      ''
      
        '   CI.CONNUMERO, CI.CONNOME, CI.CONDIASTOLERANCIA, CI.FLGTIPODIA' +
        'TOLERA,'
      
        '   CI.CODESTADO, CI.CONDATAREAJUSTE, CI.CONVLRAJUSTADO, CI.CONVL' +
        'RTOTAL,'
      '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE, I.AREA,'
      ''
      '   P.RAZAOSOCIAL,'
      '   CP.NOME,'
      '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO,'
      '   CD.NOME || '#39' - '#39' || UF.CODESTADO, E.CEP,'
      ''
      '   PC.NOCONTACORR,'
      '   PB.NOME,'
      '   PA.NOME,'
      '   B.NUMBANCO,'
      '   A.NUMAGENCIA,'
      ''
      '   LI.MESREFERENCIA, LI.ANOREFERENCIA, LI.MESCOMPETENCIA,'
      '   LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.DATACORRECAO,'
      ''
      '   LD.OPERACAO, LD.DATALANCTO, D.DATAPROGRAMADA,'
      ''
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '          DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.' +
        'DATALANCTO)),'
      ''
      '   TA.DESCRICAO'
      ''
      'ORDER BY'
      '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA,'
      '   DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LI.DATAVENCIMENTO,'
      
        '   DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LI.DATAVENCIMENTO, LD.DATALAN' +
        'CTO))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end>
    object qryConsolidadoDESCALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCALC'
      Size = 25
      Calculated = True
    end
    object qryConsolidadoDataPagamento: TDateField
      FieldKind = fkCalculated
      FieldName = 'DataPagamento'
      Calculated = True
    end
    object qryConsolidadodataatual: TStringField
      FieldKind = fkCalculated
      FieldName = 'dataatual'
      Size = 60
      Calculated = True
    end
    object qryConsolidadodatajuros: TStringField
      FieldKind = fkCalculated
      FieldName = 'datajuros'
      Size = 10
      Calculated = True
    end
    object qryConsolidadodatames: TStringField
      FieldKind = fkCalculated
      FieldName = 'datames'
      Size = 15
      Calculated = True
    end
    object qryConsolidadoContratoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 120
      Calculated = True
    end
    object qryConsolidadodesc: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'desc'
      Size = 1000
      Calculated = True
    end
    object qryConsolidadoValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qryConsolidadomes: TStringField
      FieldKind = fkCalculated
      FieldName = 'mes'
      Size = 200
      Calculated = True
    end
    object qryConsolidadoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryConsolidadoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryConsolidadoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryConsolidadoCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryConsolidadoFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Size = 1
    end
    object qryConsolidadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryConsolidadoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryConsolidadoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qryConsolidadoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object qryConsolidadoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 60
    end
    object qryConsolidadoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 60
    end
    object qryConsolidadoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryConsolidadoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryConsolidadoMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryConsolidadoANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryConsolidadoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryConsolidadoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryConsolidadoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryConsolidadoDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
    end
    object qryConsolidadoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryConsolidadoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryConsolidadoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryConsolidadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryConsolidadoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryConsolidadoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryConsolidadoVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qryConsolidadoVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qryConsolidadoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qryConsolidadoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryConsolidadoCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryConsolidadoAREA_LOCADA: TFloatField
      FieldName = 'AREA_LOCADA'
    end
    object qryConsolidadoNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 56
    end
    object qryConsolidadoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryConsolidadoDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryConsolidadoDatasAnteriores: TStringField
      FieldName = 'DatasAnteriores'
    end
    object qryConsolidadoImovelLocado: TStringField
      FieldName = 'ImovelLocado'
    end
  end
  object qryDiscriminado: TwwQuery [18]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TR.DESCCUSTORECIMO, CI.CONNUMERO, CI.CONNOME, CI.IDCONTRA' +
        'TOIMOVEL, CI.CODESTADO, CI.CONDATAASSINATURA,'
      
        '       CI.CONDATAINICIO, CI.CONDATAREAJUSTE, CI.CONINDICEREAJUST' +
        'E, CI.CONPERREAJUSTE,'
      
        '       CI.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO, CI.CONVLRTOTAL A' +
        'S VLR_ANT_CONTRATO, P.RAZAOSOCIAL, CP.NOME AS NOME_CONTATO,'
      
        '       E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO AS ENDE' +
        'RECO, E.CEP, SUM(I.IMOAREA) AS AREA_LOCADA,'
      
        '       PC.NOCONTACORR AS CONTA_CORRENTE, PB.NOME AS NOME_BANCO, ' +
        'PA.NOME AS NOME_AGENCIA, B.NUMBANCO, A.NUMAGENCIA,'
      
        '       LI.MESREFERENCIA, LI.ANOREFERENCIA, LI.MESCOMPETENCIA, LI' +
        '.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.CODDOCUMENTO,'
      
        '       D.DATAPROGRAMADA,  LD.VALOR, LD.VALOR_BAIXA, LD.VALOR_MUL' +
        'TA, LD.VALOR_JUROS, LD.VALOR_CORRMON, LD.VALOR_OUTROS'
      
        'FROM PESSOA P, PESSOA PB, PESSOA PA, LANCAMENTOSIMOVEL LI, TIPOC' +
        'USTORECIMOV  TR, CONTRATOIMOVEL CI, PORTADORFORMA PF,'
      
        '     PORTADORCONTA PC, DOCUMENTO D, ENDPESS E, TIPOALTERADOR TA,' +
        ' BANCO B, AGENCIABANCARIA A, IMOVEL I,'
      '   ( SELECT L.CODDOCUMENTO,'
      
        '--            SUM(DECODE(L.CODALTERADOR,NULL,DECODE(L.DEBCRE,'#39'D'#39 +
        ',L.VALOR,L.VALOR*-1),0)) AS VALOR,'
      
        '            SUM(DECODE(TRIM(L.OPERACAO),'#39'2'#39',DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1),0)) AS VALOR,'
      
        '            SUM(DECODE(TRIM(L.OPERACAO),'#39'5'#39',DECODE(L.DEBCRE,'#39'C'#39',' +
        'L.VALOR,L.VALOR*-1),0)) AS VALOR_BAIXA,'
      ''
      '            SUM(DECODE(TI.CODALTMULTA,NULL,0,'
      '                       DECODE(L.CODALTERADOR,NULL,0,'
      
        '                              DECODE(L.CODALTERADOR,TI.CODALTMUL' +
        'TA,'
      
        '                                     DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1),0)))) AS VALOR_MULTA,'
      ''
      '            SUM(DECODE(TI.CODALTJUROS,NULL,0,'
      '                       DECODE(L.CODALTERADOR,NULL,0,'
      
        '                              DECODE(L.CODALTERADOR,TI.CODALTJUR' +
        'OS,'
      
        '                                     DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1),0)))) AS VALOR_JUROS,'
      ''
      '            SUM(DECODE(TI.CODALTCORRMON,NULL,0,'
      '                       DECODE(L.CODALTERADOR,NULL,0,'
      
        '                              DECODE(L.CODALTERADOR,TI.CODALTCOR' +
        'RMON,'
      
        '                                     DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1),0)))) AS VALOR_CORRMON,'
      ''
      
        '            SUM(DECODE(L.CODALTERADOR,NULL,0,TI.CODALTCORRMON,0,' +
        'TI.CODALTJUROS,0,TI.CODALTMULTA,0,'
      
        '                       DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)))' +
        ' AS VALOR_OUTROS'
      '     FROM LANCTODOCUM L, DOCUMENTO D, TIPOIMOVEL TI,'
      '        ( SELECT DISTINCT CODDOCUMENTO, CODTIPIMOVEL'
      '          FROM LANCAMENTOSIMOVEL'
      '          WHERE RECPAG = '#39'R'#39' ) LI'
      '     WHERE RTRIM(L.OPERACAO) IN('#39'2'#39','#39'4'#39')'
      '       AND D.CODDOCUMENTO  = L.CODDOCUMENTO'
      '       AND D.CODDOCUMENTO  = LI.CODDOCUMENTO'
      '       AND LI.CODTIPIMOVEL = TI.CODTIPIMOVEL'
      '       AND D.STATUS        = '#39'0'#39
      '       AND L.ESTORNO       IS NULL'
      '     GROUP BY L.CODDOCUMENTO ) LD,'
      ''
      '   ( SELECT CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '     FROM CONTATOPESS CXP,'
      '        ( SELECT MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '          FROM CONTATOPESS'
      '          GROUP BY IDENDERECO ) CON'
      '     WHERE ( CON.IDCONTATO = CXP.IDCONTATO ) ) CP'
      'WHERE ( LI.RECPAG = '#39'R'#39' )'
      
        '  AND ((:PMESCOMPETENCIA   IS NULL) OR (LI.MESCOMPETENCIA   = :P' +
        'MESCOMPETENCIA))'
      
        '  AND ((:PANOCOMPETENCIA   IS NULL) OR (LI.ANOCOMPETENCIA   = :P' +
        'ANOCOMPETENCIA))'
      
        '  AND ((:PIDCONTRATOIMOVEL IS NULL) OR (LI.IDCONTRATOIMOVEL = :P' +
        'IDCONTRATOIMOVEL))'
      
        '  AND ((:PIDLOCATARIO      IS NULL) OR (CI.IDLOCATARIO      = :P' +
        'IDLOCATARIO))'
      
        '  AND ((:DATAINI           IS NULL) OR (LI.DATAVENCIMENTO BETWEE' +
        'N :DATAINI AND :DATAFIM))'
      
        '  AND (((:STATUS = '#39'P'#39' AND RTRIM(D.STATUS) <> '#39'2'#39') OR (D.STATUS ' +
        'IS NULL)) OR (:STATUS IS NULL))'
      '  AND ( LI.CODDOCUMENTO      = LD.CODDOCUMENTO )'
      '  AND ( LD.CODDOCUMENTO      = D.CODDOCUMENTO )'
      '  AND ( LI.IDCONTRATOIMOVEL  = CI.IDCONTRATOIMOVEL )'
      '  AND ( CI.IDLOCATARIO       = P.IDPESSOA )'
      '  AND ( P.IDENDCOBRANCA      = E.IDENDERECO(+) )'
      '  AND ( P.IDPESSOA           = E.IDPESSOA(+) )'
      '  AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      '  AND ( P.IDENDCOBRANCA      = CP.IDENDERECO(+) )'
      '  AND ( CI.CODPORTFORMA      = PF.CODPORTFORMA )'
      '  AND ( PF.CODPORTADOR       = PC.CODPORTADOR )'
      '  AND ( PC.IDAGENCIA         = PA.IDPESSOA )'
      '  AND ( PC.IDAGENCIA         = A.IDPESSOA )'
      '  AND ( A.IDBANCO            = PB.IDPESSOA )'
      '  AND ( A.IDBANCO            = B.IDPESSOA )'
      '  AND ( CI.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO )'
      '  AND ( I.IDIMOVEL           = LI.IDIMOVEL )'
      
        'GROUP BY TR.DESCCUSTORECIMO, CI.CONNUMERO, CI.CONNOME, CI.IDCONT' +
        'RATOIMOVEL, CI.CODESTADO, CI.CONDATAASSINATURA,'
      
        '         CI.CONDATAINICIO, CI.CONDATAREAJUSTE, CI.CONINDICEREAJU' +
        'STE, CI.CONPERREAJUSTE, CI.CONVLRAJUSTADO, CI.CONVLRTOTAL,'
      
        '         P.RAZAOSOCIAL, CP.NOME, E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39 +
        ', '#39'||E.COMPLEMENTO, E.CEP, PC.NOCONTACORR, PB.NOME, PA.NOME,'
      
        '         B.NUMBANCO, A.NUMAGENCIA, LI.MESREFERENCIA, LI.ANOREFER' +
        'ENCIA, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      
        '         LI.DATAVENCIMENTO, LI.CODDOCUMENTO, D.DATAPROGRAMADA, L' +
        'D.VALOR, LD.VALOR_BAIXA, LD.VALOR_MULTA, LD.VALOR_JUROS, LD.VALO' +
        'R_CORRMON, LD.VALOR_OUTROS'
      
        'ORDER BY CI.CONNOME, LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, LI.CO' +
        'DDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 123
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end>
    object qryDiscriminadoValorTotal2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorTotal'
      Calculated = True
    end
    object qryDiscriminadoMes2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Mes'
      Size = 15
      Calculated = True
    end
    object qryDiscriminadoValorExtenso2: TStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 200
      Calculated = True
    end
    object qryDiscriminadoContratoExtenso2: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 120
      Calculated = True
    end
    object qryDiscriminadoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryDiscriminadoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryDiscriminadoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryDiscriminadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryDiscriminadoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryDiscriminadoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qryDiscriminadoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object qryDiscriminadoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 60
    end
    object qryDiscriminadoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 60
    end
    object qryDiscriminadoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryDiscriminadoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryDiscriminadoMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryDiscriminadoANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryDiscriminadoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryDiscriminadoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryDiscriminadoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryDiscriminadoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDiscriminadoVALOR_MULTA: TFloatField
      FieldName = 'VALOR_MULTA'
    end
    object qryDiscriminadoVALOR_JUROS: TFloatField
      FieldName = 'VALOR_JUROS'
    end
    object qryDiscriminadoVALOR_CORRMON: TFloatField
      FieldName = 'VALOR_CORRMON'
    end
    object qryDiscriminadoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryDiscriminadoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryDiscriminadoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryDiscriminadoVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qryDiscriminadoVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qryDiscriminadoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qryDiscriminadoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryDiscriminadoCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryDiscriminadoDesc: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'Desc'
      Size = 1000
      Calculated = True
    end
    object qryDiscriminadoDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryDiscriminadoDatasAnteriores: TStringField
      FieldName = 'DatasAnteriores'
    end
    object qryDiscriminadoImovelLocado: TStringField
      DisplayWidth = 1000
      FieldName = 'ImovelLocado'
      Size = 100
    end
    object qryDiscriminadoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryDiscriminadoAREA_LOCADA: TFloatField
      FieldName = 'AREA_LOCADA'
    end
    object qryDiscriminadoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryDiscriminadoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDiscriminadoVALOR_OUTROS: TFloatField
      FieldName = 'VALOR_OUTROS'
    end
    object qryDiscriminadoVALOR_BAIXA: TFloatField
      FieldName = 'VALOR_BAIXA'
    end
  end
  inherited RptCM: TppReport
    Left = 264
    DataPipelineName = 'ppConsulta'
  end
  object WordLetterContent1: TWordLetterContent
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 304
    Top = 147
  end
end
