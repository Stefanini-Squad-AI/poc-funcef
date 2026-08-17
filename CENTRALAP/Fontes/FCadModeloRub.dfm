inherited FrmCadModeloRub: TFrmCadModeloRub
  Left = 381
  Top = 128
  HelpContext = 190019
  Caption = 'Tipos de Arquivos'
  ClientHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 371
    inherited pnlMestre: TPanel
      Height = 170
      object Bevel2: TBevel
        Left = 14
        Top = 91
        Width = 459
        Height = 33
        Shape = bsFrame
      end
      object Bevel3: TBevel
        Left = 14
        Top = 127
        Width = 197
        Height = 33
        Shape = bsFrame
      end
      object LblRubs: TLabel
        Left = 12
        Top = 6
        Width = 121
        Height = 13
        Caption = 'Descrição do Modelo'
      end
      object LblArqTexto: TLabel
        Left = 12
        Top = 49
        Width = 134
        Height = 13
        Caption = 'Nome do Arquivo Texto'
      end
      object LblSep: TLabel
        Left = 28
        Top = 136
        Width = 126
        Height = 13
        Caption = 'Separador de Colunas'
      end
      object SpeedButton1: TSpeedButton
        Left = 337
        Top = 62
        Width = 25
        Height = 25
        Hint = 'Busca Arquivo Texto'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF7777777777777FF00000000000007FF0FB8B8B8B8B707F0FB8B8B8B8B
          8707F0F8B8B8B8B8B0070F8B8B8B8B8B70070FFFFFFFFFF70807000000000000
          0B07F0F0FFCFCFCFF007F0FB0FFCFCFCFF07F0F8B0FFCFCFF00FFF0FFF0FFCFF
          07FFFFF00070FFF07FFFFFFFFFFF0F07FFFFFFFFFFFFF07FFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object LblNunDiasCarta: TLabel
        Left = 25
        Top = 100
        Width = 183
        Height = 13
        Caption = 'Nº Dias Emissão de Carta/Aviso'
      end
      object Bevel1: TBevel
        Left = 216
        Top = 127
        Width = 257
        Height = 33
        Shape = bsFrame
      end
      object LblNumdDiasCancela: TLabel
        Left = 265
        Top = 100
        Width = 160
        Height = 13
        Caption = 'Nº Dias para cancelamento '
      end
      object EdtDescModeloRub: TwwDBEdit
        Left = 12
        Top = 22
        Width = 349
        Height = 21
        DataField = 'DESCRUB'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object EdtNomeArqTxt: TwwDBEdit
        Left = 12
        Top = 63
        Width = 324
        Height = 21
        Color = clWhite
        DataField = 'NOMETXTRUB'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object EdtSepCol: TwwDBEdit
        Left = 158
        Top = 133
        Width = 31
        Height = 21
        DataField = 'SEPARADORCOLUNAS'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object EdtDiasCarta: TwwDBEdit
        Left = 220
        Top = 97
        Width = 29
        Height = 21
        Color = clWhite
        DataField = 'NUMDIASCARTAAVISO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBCheckBox1: TDBCheckBox
        Left = 227
        Top = 135
        Width = 236
        Height = 17
        Caption = 'Delimita Fim de Linha Com Separador'
        DataField = 'FLGDELIMITALINHA'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object EdtDiasCancela: TwwDBEdit
        Left = 427
        Top = 97
        Width = 29
        Height = 21
        Color = clWhite
        DataField = 'NUMDIASCANCEL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object RgTipoArq: TDBRadioGroup
        Left = 365
        Top = 5
        Width = 107
        Height = 83
        Caption = ' Tipo Arquivo '
        DataField = 'FLGTIPOARQUIVO'
        DataSource = ds
        Items.Strings = (
          '&RUBS'
          '&Carta'
          '&Etiqueta'
          '&Termos')
        TabOrder = 6
        Values.Strings = (
          'R'
          'C'
          'E'
          'T')
        OnChange = RgTipoArqChange
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 171
      Height = 199
      Tabs.Strings = (
        'Composição do Arquivo Texto')
      inherited pgctrlDetalhe: TPageControl
        Height = 140
        inherited tbsDet: TTabSheet
          Caption = 'Composição do Arquivo Texto'
          inherited dbgrdDet: TwwDBGrid
            Height = 112
            Selected.Strings = (
              'LARGURACOLUNA'#9'5'#9'Largura'
              'DESCHEADERRUBS'#9'35'#9'Descrição do Header'
              'CAMPODETALHE'#9'35'#9'Nome da Coluna'#9'F')
          end
          inherited pnlControlesDet: TPanel
            Height = 112
            object Label4: TLabel
              Left = 6
              Top = 57
              Width = 121
              Height = 13
              Caption = 'Descrição do Header'
            end
            object Label1: TLabel
              Left = 9
              Top = 2
              Width = 94
              Height = 13
              Caption = 'Nome da Coluna'
            end
            object Label2: TLabel
              Left = 225
              Top = 57
              Width = 44
              Height = 13
              Caption = 'Largura'
            end
            object EdtDescHeader: TwwDBEdit
              Left = 4
              Top = 73
              Width = 208
              Height = 21
              DataField = 'DESCHEADERRUBS'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object EdtLargura: TwwDBEdit
              Left = 223
              Top = 73
              Width = 121
              Height = 21
              DataField = 'LARGURACOLUNA'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = EdtLarguraExit
            end
            object CmbNomeColuna: TwwDBComboBox
              Left = 7
              Top = 18
              Width = 337
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              AutoDropDown = True
              ShowMatchText = True
              DataField = 'CAMPODETALHE'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Sorted = True
              TabOrder = 2
              UnboundDataType = wwDefault
              OnExit = CmbNomeColuna1Exit
            end
          end
        end
      end
      inherited Dock974: TDock97
        Height = 140
      end
    end
  end
  inherited Dock971: TDock97
    Top = 418
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryCompoTxt
    Left = 169
    Top = 327
  end
  inherited ds: TwwDataSource
    Left = 136
    Top = 4
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONFIGRUBS'
      'set'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  DESCRUB = :DESCRUB,'
      '  NOMETXTRUB = :NOMETXTRUB,'
      '  SEPARADORCOLUNAS = :SEPARADORCOLUNAS,'
      '  NUMDIASCARTAAVISO = :NUMDIASCARTAAVISO,'
      '  NUMDIASCANCEL = :NUMDIASCANCEL,'
      '  FLGDELIMITALINHA = :FLGDELIMITALINHA,'
      '  FLGTIPOARQUIVO = :FLGTIPOARQUIVO'
      'where'
      '  IDCONFIGRUBS = :OLD_IDCONFIGRUBS')
    InsertSQL.Strings = (
      'insert into CONFIGRUBS'
      
        '  (IDCONFIGRUBS, DESCRUB, NOMETXTRUB, SEPARADORCOLUNAS, NUMDIASC' +
        'ARTAAVISO, '
      '   NUMDIASCANCEL, FLGDELIMITALINHA, FLGTIPOARQUIVO)'
      'values'
      
        '  (:IDCONFIGRUBS, :DESCRUB, :NOMETXTRUB, :SEPARADORCOLUNAS, :NUM' +
        'DIASCARTAAVISO, '
      '   :NUMDIASCANCEL, :FLGDELIMITALINHA, :FLGTIPOARQUIVO)')
    DeleteSQL.Strings = (
      'delete from CONFIGRUBS'
      'where'
      '  IDCONFIGRUBS = :OLD_IDCONFIGRUBS')
    Left = 161
    Top = 36
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONFIGRUBS.DESCRUB'
      'CONFIGRUBS.NOMETXTRUB'
      'CONFIGRUBS.SEPARADORCOLUNAS'
      'CONFIGRUBS.NUMDIASCARTAAVISO'
      'CONFIGRUBS.FLGTIPOARQUIVO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Nome Txt'
      'Separador Colunas'
      'Dias carta'
      'Tipo Arquivo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONFIGRUBS')
    CamposChave.Strings = (
      'CONFIGRUBS.IDCONFIGRUBS')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '1'
      '10'
      '1')
    Left = 232
    Top = 4
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT '
      '  IDCONFIGRUBS, DESCRUB, NOMETXTRUB, SEPARADORCOLUNAS,'
      
        '  NUMDIASCARTAAVISO, NUMDIASCANCEL, FLGDELIMITALINHA, FLGTIPOARQ' +
        'UIVO'
      'FROM '
      '  CONFIGRUBS'
      'WHERE IDCONFIGRUBS = :IDCONFIGRUBS')
    Left = 209
    Top = 52
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
    object qryDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Origin = 'RUBS.DESCRUB'
      Size = 60
    end
    object qryNOMETXTRUB: TStringField
      FieldName = 'NOMETXTRUB'
      Origin = 'RUBS.NOMETXTRUB'
      Size = 60
    end
    object qrySEPARADORCOLUNAS: TStringField
      FieldName = 'SEPARADORCOLUNAS'
      Origin = 'RUBS.SEPARADORCOLUNAS'
      Size = 1
    end
    object qryNUMDIASCARTAAVISO: TFloatField
      FieldName = 'NUMDIASCARTAAVISO'
      Origin = 'RUBS.NUMDIASCARTAAVISO'
    end
    object qryIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = 'CONFIGRUBS.IDCONFIGRUBS'
    end
    object qryNUMDIASCANCEL: TFloatField
      FieldName = 'NUMDIASCANCEL'
    end
    object qryFLGDELIMITALINHA: TStringField
      FieldName = 'FLGDELIMITALINHA'
      Size = 1
    end
    object qryFLGTIPOARQUIVO: TStringField
      FieldName = 'FLGTIPOARQUIVO'
      Size = 1
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 384
    Top = 204
  end
  object QryListaCampos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RUBS.IDRUBS AS IDRUB,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIPANTE,'
      '       EP.LOGRADOURO AS ENDERECO,'
      '       EP.NUMERO AS NUMERO,'
      '       EP.COMPLEMENTO AS COMPLEMENTO,'
      '       EP.CODESTADO AS ESTADO,'
      '       EP.BAIRRO,'
      '       EP.CIDADE,'
      '       EP.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIPANTE,'
      '       A.NOMESOLICITANTE,'
      '       A.LOGRADOURO AS ENDERECO_SOLICITANTE,'
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,'
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLICITANTE,'
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,'
      '       A.CEPSOLIC AS CEP_SOLICITANTE,'
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,'
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,'
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,'
      '       RB.IDCONFIGRUBS,'
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
      '       PF.NUMDEPIRRF AS NUMERO_DEPENDENTE_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEPENDENTES_SALFAMILIA,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF,'
      '       DOC.NOMEDOCUMENTO,'
      '       ('#39'SRV'#39')  AS NOME_BENEFICIO_SERVICO,'
      '       TD.NOMEDOCUMENTO AS NOME_DOCUMENTO_PARTICIPANTE,'
      '       DP.NUMDOCUMENTO AS NUMERO_DOCUMENTO_PARTICIPANTE'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS EP,'
      '       RUBXBENEFICIO RX,'
      '       TIPODOCXRUB TD,'
      '       CONFIGRUBS RB,'
      '       DOCUMENTOS DOC,'
      '       ATEND A,'
      '       RUBS,'
      '       TELENDPESS TE,'
      '       TIPODOCPESSOA TD,'
      '       DOCPESSOA DP'
      'WHERE  1=2'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 211
  end
  object DlgTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos Texto|*.txt'
    Title = 'Busca do Arquivo Texto'
    Left = 265
    Top = 5
  end
  object QryCompoTxt: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  IDCONFIGRUBS, CAMPODETALHE, LARGURACOLUNA, DESCHEADERRUBS, IDD' +
        'ETALHERUBS'
      'FROM'
      '  DETALHERUBS'
      'WHERE'
      '  IDCONFIGRUBS = :IDCONFIGRUBS'
      'ORDER BY CAMPODETALHE'
      ''
      '')
    UpdateObject = UpdCompoTxt
    ValidateWithMask = True
    Left = 213
    Top = 279
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
    object QryCompoTxtLARGURACOLUNA: TFloatField
      DisplayLabel = 'Largura'
      DisplayWidth = 5
      FieldName = 'LARGURACOLUNA'
      Origin = '"CM.DETALHERUBS".LARGURACOLUNA'
    end
    object QryCompoTxtDESCHEADERRUBS: TStringField
      DisplayLabel = 'Descrição do Header'
      DisplayWidth = 35
      FieldName = 'DESCHEADERRUBS'
      Origin = '"CM.HEADERRUBS".DESCHEADERRUBS'
      Required = True
      Size = 60
    end
    object QryCompoTxtCAMPODETALHE: TStringField
      DisplayLabel = 'Nome da Coluna'
      DisplayWidth = 35
      FieldName = 'CAMPODETALHE'
      Origin = '"CM.DETALHERUBS".CAMPODETALHE'
      Required = True
      Size = 60
    end
    object QryCompoTxtIDDETALHERUBS: TFloatField
      FieldName = 'IDDETALHERUBS'
      Origin = 'DETALHERUBS.IDDETALHERUBS'
      Visible = False
    end
    object QryCompoTxtIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = 'DETALHERUBS.IDCONFIGRUBS'
      Visible = False
    end
  end
  object UpdCompoTxt: TUpdateSQL
    ModifySQL.Strings = (
      'update DETALHERUBS'
      'set'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  CAMPODETALHE = :CAMPODETALHE,'
      '  LARGURACOLUNA = :LARGURACOLUNA,'
      '  DESCHEADERRUBS = :DESCHEADERRUBS,'
      '  IDDETALHERUBS = :IDDETALHERUBS'
      'where'
      '  IDDETALHERUBS = :OLD_IDDETALHERUBS')
    InsertSQL.Strings = (
      'insert into DETALHERUBS'
      
        '  (IDCONFIGRUBS, CAMPODETALHE, LARGURACOLUNA, DESCHEADERRUBS, ID' +
        'DETALHERUBS)'
      'values'
      
        '  (:IDCONFIGRUBS, :CAMPODETALHE, :LARGURACOLUNA, :DESCHEADERRUBS' +
        ', :IDDETALHERUBS)')
    DeleteSQL.Strings = (
      'delete from DETALHERUBS'
      'where'
      '  IDDETALHERUBS = :OLD_IDDETALHERUBS')
    Left = 282
    Top = 283
  end
  object qrylistecampo1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.VALORBASE1 AS  OPCAO_DE_MIGRACAO,'
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
      '       X.NUMERO AS NUMERO,'
      '       X.COMPLEMENTO AS COMPLEMENTO,                 '
      '       EST.CODESTADO AS ESTADO,                      '
      '       X.BAIRRO,                                     '
      '       CID.NOME AS CIDADE,                           '
      '       X.CEP,                                        '
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
      '       EL.MATRICULA ,                                '
      '       PP.INSCRICAONUMERO AS INSCRICAO,              '
      '       PP.INSCRICAODATA AS DATAINSCRICAO,            '
      '       EL.DATAADMISSAO AS ADMISSAO,                  '
      '       EL.IDPESSJUR AS IDPATROCINADORA,              '
      '       PJ.NOME AS PATROCINADORA,                     '
      '       PL.IDPLANOPREV AS IDPLANO,                    '
      '       PL.NOME AS PLANO,                             '
      '       PF.NOMEPAI AS NOME_DO_PAI,                    '
      '       PF.NOMEMAE AS NOME_DA_MAE,'
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
      '       BEN_SERV.NOME_BEN_SERV'
      ''
      ' FROM  PESSOA P, '
      '       PESSOA PJ, '
      '       ELEGPATRO EL, '
      '       PLANPREV PL, '
      '       PATRO PT, '
      '       PARTPREVPLAN PP, '
      '       PESSOAFISICA PF, '
      '       ENDPESS X,'
      '       CIDADES CID, '
      '       ESTADO EST, '
      '       ATEND A, '
      '       ASSUNTOXATEND AXA, '
      '       RUBS, '
      '       TELENDPESS TE,'
      '       BANCO BAN,'
      '       AGENCIABANCARIA AG,'
      '       CONTABANCARIA  CONT,'
      '       PESSOA  PB,'
      '       PESSOA  PA,'
      '       PAIS PI ,'
      '       DEPEN DEPEN,'
      '       DEPENTIT,'
      '       USUARIOSISTEMA USU,'
      '       SITPART,'
      '       SITPLANOPREV,'
      '       ('
      '          SELECT'
      '             RB.IDRUBS,'
      
        '             DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_' +
        'BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, BENEFICIO BE'
      '          WHERE'
      '             (RB.IDBENEFICIO = BE.IDBENEFICIO)'
      '          UNION'
      '          SELECT'
      '             RB.IDRUBS,'
      '             SERV.NOME AS NOME_BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, SERVICO SERV'
      '          WHERE'
      '             (RB.IDBENEFICIO = SERV.IDSERVICOS)'
      '       ) BEN_SERV'
      ''
      ' WHERE'
      '       (RUBS.IDRUBS = -1)'
      ' AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      ' AND   ( P.IDENDCORRESP = X.IDENDERECO(+))'
      ' AND   (  X.IDCIDADES = CID.IDCIDADES(+)  )'
      ' AND   (  EST.IDESTADO (+) = CID.IDESTADO)'
      ' AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND)'
      ' AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      ' AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      ' AND   (P.IDPESSOA     = EL.IDPESSOA)'
      ' AND   (P.IDPESSOA     = PF.IDPESSOA)'
      ' AND   (PP.IDPESSJUR   = PT.IDPESSOA) '
      ' AND   (PP.IDPESSOA    = P.IDPESSOA) '
      ' AND   (PP.IDPLANOPREV = PL.IDPLANOPREV) '
      
        ' AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.' +
        'IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSO' +
        'A AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (' +
        '0, NULL) ) '
      ' AND   (A.IDTITULAR = P.IDPESSOA) '
      ' AND   (A.IDPESSJUR = PP.IDPESSJUR) '
      ' AND   (A.IDATEND = AXA.IDATEND) '
      ' AND   (EST.IDESTADO (+) = CID.IDESTADO) '
      ' AND   (CONT.IDPESSOA (+) = P.IDPESSOA) '
      ' AND   (CONT.FLGCONTAPREF  = 1 OR CONT.FLGCONTAPREF IS NULL)'
      ' AND   (CONT.IDAGENCIA = AG.IDPESSOA(+))'
      ' AND   (BAN.IDPESSOA(+) = AG.IDBANCO)'
      ' AND   (PB.IDPESSOA(+) = AG.IDBANCO)'
      ' AND   (PA.IDPESSOA(+) = AG.IDPESSOA)'
      ' AND   (PI.IDPAIS(+) = PF.IDPAIS)'
      ' AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO)'
      ' AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA)'
      ' AND   (A.CODATENDENTE = USU.IDUSUARIO(+))'
      ' AND   (PP.IDSITPART = SITPART.IDSITPART(+))'
      ' AND   (PP.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV(+))'
      ' AND   (RUBS.IDRUBS = BEN_SERV.IDRUBS)'
      '')
    ValidateWithMask = True
    Left = 320
    Top = 275
  end
  object qryDetDocs: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dslistecampo1
    ValidateWithMask = True
    Left = 369
    Top = 345
  end
  object dslistecampo1: TwwDataSource
    DataSet = qrylistecampo1
    Left = 377
    Top = 321
  end
  object qryDetDependIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dslistecampo1
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
  object qryDetTelefones: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dslistecampo1
    SQL.Strings = (
      'SELECT'
      '  TEL.DDI, '
      '  TEL.DDD, '
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
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  5, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') || '
      'DECODE(SUBSTR(TEL.TIPO,  6, 1),'
      '        '#39'P'#39', '#39'PREFERENCIAL\'#39', '
      '        '#39'R'#39', '#39'RESIDENCIAL\'#39','
      '        '#39'C'#39', '#39'COMERCIAL\'#39','
      '        '#39'L'#39', '#39'CELULAR\'#39','
      '        '#39'F'#39', '#39'FAX\'#39','
      '        '#39'M'#39', '#39'MODEM\'#39','
      '        '#39'D'#39', '#39'RECADOS\'#39' , '#39#39') AS DESCTIPO'
      'FROM ENDPESS EP, TELENDPESS TEL'
      'WHERE EP.IDPESSOA = -1 AND'
      '      TEL.IDENDERECO = EP.IDENDERECO')
    ValidateWithMask = True
    Left = 280
    Top = 336
  end
  object dsDetTelefones: TwwDataSource
    DataSet = qryDetTelefones
    Left = 280
    Top = 344
  end
  object qryDetDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dslistecampo1
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
    Left = 272
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object qryDetBeneficiarios: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dslistecampo1
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
    Left = 304
    Top = 240
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
