inherited FrmInserePart: TFrmInserePart
  Left = 86
  Top = 142
  Caption = 'Inserir Novo Participante'
  ClientHeight = 388
  ClientWidth = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 655
    Height = 302
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 123
      Height = 13
      Caption = 'Nome do Participante'
    end
    object lblFalecido: TLabel
      Left = 144
      Top = 8
      Width = 62
      Height = 13
      Caption = 'lblFalecido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 448
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Nº Inscrição'
    end
    object Label4: TLabel
      Left = 552
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Nº Matrícula'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label5: TLabel
      Left = 224
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object Label6: TLabel
      Left = 448
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Est.Civil'
    end
    object Label7: TLabel
      Left = 8
      Top = 88
      Width = 113
      Height = 13
      Caption = 'Nascimento / Idade'
    end
    object Label8: TLabel
      Left = 224
      Top = 88
      Width = 29
      Height = 13
      Caption = 'Sexo'
    end
    object Label10: TLabel
      Left = 320
      Top = 88
      Width = 118
      Height = 13
      Caption = 'Plano Previdênciário'
    end
    object Label11: TLabel
      Left = 536
      Top = 88
      Width = 63
      Height = 13
      Caption = 'Inscrito em'
    end
    object Label9: TLabel
      Left = 8
      Top = 128
      Width = 69
      Height = 13
      Caption = 'Depedência'
    end
    object Label12: TLabel
      Left = 120
      Top = 128
      Width = 37
      Height = 13
      Caption = 'Banco'
    end
    object Label13: TLabel
      Left = 304
      Top = 128
      Width = 86
      Height = 13
      Caption = 'Conta Corrente'
    end
    object Label14: TLabel
      Left = 8
      Top = 168
      Width = 111
      Height = 13
      Caption = 'Endereço Completo'
    end
    object Label48: TLabel
      Left = 8
      Top = 208
      Width = 104
      Height = 13
      Caption = 'Plano Assistencial'
    end
    object Label16: TLabel
      Left = 248
      Top = 208
      Width = 72
      Height = 13
      Caption = 'Identificador'
    end
    object Label15: TLabel
      Left = 336
      Top = 208
      Width = 111
      Height = 13
      Caption = 'Forma de Cobrança'
    end
    object Label44: TLabel
      Left = 8
      Top = 248
      Width = 79
      Height = 13
      Caption = 'Beneficiário ?'
    end
    object Label49: TLabel
      Left = 120
      Top = 248
      Width = 102
      Height = 13
      Caption = 'Data de Inscrição'
    end
    object EdNome: TEdit
      Left = 8
      Top = 24
      Width = 393
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdNumInsc: TEdit
      Left = 448
      Top = 24
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdMat: TEdit
      Left = 552
      Top = 24
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdPatro: TEdit
      Left = 8
      Top = 64
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdSituacao: TEdit
      Left = 224
      Top = 64
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdEstCivil: TEdit
      Left = 448
      Top = 64
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object EdNascimento: TEdit
      Left = 8
      Top = 104
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object EdSexo: TEdit
      Left = 224
      Top = 104
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object EdPlano: TEdit
      Left = 320
      Top = 104
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object EdDataInsc: TEdit
      Left = 536
      Top = 104
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object EdDepend: TEdit
      Left = 8
      Top = 144
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object EdBanco: TEdit
      Left = 120
      Top = 144
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object EdConta: TEdit
      Left = 304
      Top = 144
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object EdEndereco: TEdit
      Left = 8
      Top = 184
      Width = 633
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object dblkPlano: TwwDBLookupCombo
      Left = 8
      Top = 224
      Width = 233
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'5'#9'Plano')
      LookupTable = CdsPlanos
      LookupField = 'IDPLANASS'
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblkPlanoChange
    end
    object EdOpcaoB: TEdit
      Left = 248
      Top = 224
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object CmbCobra: TComboBox
      Left = 336
      Top = 224
      Width = 303
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 16
      Items.Strings = (
        'Folha Pagamento/Benefício/Débito Automático '
        'Boleto Bancário')
    end
    object CbBenef: TComboBox
      Left = 8
      Top = 264
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 17
      Items.Strings = (
        'SIM'
        'NÃO')
    end
    object DTInscricao: TDateTimePicker
      Left = 120
      Top = 264
      Width = 97
      Height = 21
      CalAlignment = dtaLeft
      Date = 23748.4725606482
      Time = 23748.4725606482
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 18
    end
    object ChkOpcaoA: TCheckBox
      Left = 256
      Top = 264
      Width = 169
      Height = 17
      Caption = 'Cobrança Diferenciada'
      TabOrder = 19
      Visible = False
    end
    object chkBenef: TCheckBox
      Left = 448
      Top = 264
      Width = 193
      Height = 17
      Caption = 'CADASTRAR BENEFICIÁRIOS'
      TabOrder = 20
    end
  end
  inherited Dock972: TDock97
    Width = 655
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 120
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 180
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 60
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 655
    inherited tb97Fundo: TToolbar97
      Left = 465
      DockPos = 465
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 298
      DockPos = 298
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 266
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 409
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 304
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider1'
    Left = 380
    Top = 7
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object CdsINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object CdsIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object CdsSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object CdsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object CdsIDADE: TFloatField
      FieldName = 'IDADE'
    end
    object CdsSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object CdsIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object CdsRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 60
    end
    object CdsESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Size = 13
    end
    object CdsPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object CdsDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 50
    end
    object CdsDEPENDENCIA: TStringField
      FieldName = 'DEPENDENCIA'
      Size = 15
    end
    object CdsLEGAL: TStringField
      FieldName = 'LEGAL'
      Size = 8
    end
    object CdsIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object CdsPREVIDENCIARIO: TStringField
      FieldName = 'PREVIDENCIARIO'
      Size = 50
    end
    object CdsINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object CdsENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 180
    end
    object CdsCONTA: TStringField
      FieldName = 'CONTA'
      Size = 48
    end
    object CdsBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object CdsIDNUCLEO: TFloatField
      FieldName = 'IDNUCLEO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Insere Novo Participante no Assistencial'
    Colunas.Strings = (
      'PV.INSCRICAONUMERO'
      'EL.MATRICULA'
      'PE.NOME'
      'DECODE(PF.DATAMORTE, NULL, '#39'NÃO'#39','#39'SIM'#39') AS FALECIDO'
      'PL.NOME'
      'PJ.NOME AS PATROCINADORA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Inscrição'
      'Matrícula'
      'Nome'
      'Falecido ?'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'PESSOA PJ'
      'PESSOAFISICA PF'
      'DEPENTIT DP'
      'ELEGPATRO EL'
      'PARTPREVPLAN PV'
      'PLANPREV PL'
      'NUCLEOFAMASS NF')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'PE.IDPESSOA'
      'NF.IDRESPONSAVEL'
      'PF.DATAMORTE')
    Filtro.Strings = (
      'DP.IDPESSOA        = DP.IDPESSOA'
      'DP.IDTITULAR       = PE.IDPESSOA'
      'PV.IDPESSOA        = PE.IDPESSOA'
      'PF.IDPESSOA        = PV.IDPESSOA'
      'EL.IDPESSJUR       = PJ.IDPESSOA'
      'EL.IDPESSOA        = PV.IDPESSOA'
      'PV.IDPESSJUR       = EL.IDPESSJUR'
      'PV.IDPLANOPREV     = PL.IDPLANOPREV'
      'PV.IDSITPART       = PV.IDSITPART'
      'PV.FLGDESATIVADO   = 0'
      'NF.IDTITULAR(+)    = PV.IDPESSOA'
      'NVL(NF.IDTITULAR,DP.IDTITULAR)  = DP.IDPESSOA'
      '( PV.DATACANCELAMENTO IS NULL ) '
      
        'PV.IDPESSOA NOT IN ( SELECT IDPESSOA FROM PARTASS WHERE DATACANC' +
        'ELAMENTO IS NULL)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '13'
      '60'
      '1'
      '50'
      '50')
    Left = 555
    Top = 9
  end
  object RegraADM: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 600
    Top = 8
  end
  object CdsContribass: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 354
  end
  object CdsPlanos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 354
  end
  object CdsIdRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 354
  end
  object CdsRegraAdm: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'FLGPARTBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'DataSetProvider2'
    Left = 106
    Top = 354
  end
  object CdsPlanosPart: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 141
    Top = 354
  end
  object CdsParticipante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 7
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 213
    Top = 354
  end
  object Skt: TSocketConnection
    ServerGUID = '{99C58BF5-F272-4E62-8101-F2AB2DD454BA}'
    ServerName = 'SvrAlmoxarifado.RdmAlmoxarifado'
    Host = 'LocalHost'
    Left = 456
    Top = 7
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      '   EL.IDPESSOA,'
      '   EL.MATRICULA,'
      '   PV.INSCRICAONUMERO,'
      '   PV.IDPESSJUR,'
      '   UPPER(SP.DESCRICAO) AS SITUACAO,'
      '   PE.NOME,'
      '   PF.DATANASC,'
      '   TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'
      '   PF.SEXO,'
      '   NF.IDRESPONSAVEL,'
      '   NF.IDNUCLEO,'
      '   UPPER(PS.NOME) AS RESPONSAVEL,'
      '   DECODE(PF.ESTCIVIL,'#39'S'#39','#39'SOLTEIRO(A)'#39','
      '                      '#39'C'#39','#39'CASADO(A)'#39','
      '                      '#39'D'#39','#39'DIVORCIADO(A)'#39','
      '                      '#39'V'#39','#39'VIÚVO(A)'#39','
      '                      '#39'O'#39','#39'OUTROS'#39') AS ESTCIVIL,'
      '   PJ.NOME AS PATROCINADORA,'
      '   SD.DESCRICAO AS DEPENDENTE,'
      '   UPPER(DP.DESCRICAO) AS DEPENDENCIA,'
      '   DECODE(FLGDEPLEGAL, 0, '#39'NÃO'#39','
      '                       1, '#39'SIM'#39','
      '                    NULL, '#39'AGREGADO'#39') AS LEGAL,'
      '   PL.IDPLANOPREV,'
      '   PL.NOME PREVIDENCIARIO,'
      '   PV.INSCRICAODATA,'
      
        '   RTRIM(EP.LOGRADOURO) || '#39' '#39'|| RTRIM(EP.NUMERO) || '#39' '#39' || RTRI' +
        'M(EP.COMPLEMENTO) || '#39' '#39' || RTRIM(EP.BAIRRO) || '#39' '#39' || RTRIM(CD.' +
        'NOME) || '#39' '#39' || RTRIM(UF.CODESTADO) || '#39' CEP: '#39' || RTRIM(EP.CEP)' +
        ' AS ENDERECO,'
      
        '   '#39'AGÊNCIA '#39' || RTRIM(AB.NUMAGENCIA) || '#39' - C/C Nº '#39'|| CB.CONTA' +
        'CORRENTE AS CONTA,'
      '   PB.NOME AS BANCO'
      ''
      'FROM'
      ''
      '   PESSOA          PE,       /* PESSOA TITULAR     */'
      '   PESSOA          PB,       /* PESSOA BANCO       */'
      '   PESSOA          PJ,       /* PESSOA JURIDICA    */'
      '   PESSOA          PS,       /* PESSOA RESPONSAVEL */'
      '   PESSOAFISICA    PF,'
      '   DEPENTIT        DT,'
      '   DEPENDENTE      DE,'
      '   ELEGPATRO       EL,'
      '   ENDPESS         EP,'
      '   PARTPREVPLAN    PV,'
      '   CONTABANCARIA   CB,'
      '   AGENCIABANCARIA AB,'
      '   CIDADES         CD,'
      '   BANCO           BC,'
      '   ESTADO          UF,'
      '   DEPEN           DP,'
      '   SITDEPENDENTE   SD,'
      '   SITPART         SP,'
      '   PLANPREV        PL,'
      '   NUCLEOFAMASS    NF'
      ''
      'WHERE'
      ''
      '--  FILTRA PESSOA  ( MONTASELECT TRAZ DA PESSOA )'
      '   (PE.IDPESSOA    = :IDPESSOA)                     AND'
      ''
      '--  JOIN PESSOAFISICA COM PESSOA'
      '   (PF.IDPESSOA    = NVL(NF.IDRESPONSAVEL,PE.IDPESSOA)) AND'
      ''
      '--  JOIN DEPENTIT COM PESSOA'
      '   (DT.IDPESSOA    = PE.IDPESSOA)                   AND'
      '   (DT.IDTITULAR   = PE.IDPESSOA)                   AND'
      '   (DT.IDDEPENDENCIA = DP.IDDEPENDENCIA)            AND'
      ''
      '--  JOIN DEPENDENTE COM SITDEPENDENTE'
      '   (DE.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))     AND'
      ''
      '--  JOIN NUCLEOFAMILIAR COM PESSOA'
      '   (PE.IDPESSOA    = NF.IDTITULAR(+))               AND'
      ''
      '--  JOIN NUCLEOFAMILIAR COM PESSOA PENSIONISTA'
      '   (NF.IDRESPONSAVEL= PS.IDPESSOA(+))                  AND'
      ''
      '--  JOIN DEPENDENTE COM PESSOA'
      '   (DE.IDPESSOA    = PE.IDPESSOA)                   AND'
      ''
      '--  JOIN PARTPREVPLAN COM PESSOA (JURIDICA)'
      '   (PV.IDPESSJUR   = PJ.IDPESSOA)                   AND'
      ''
      '--  JOIN ELEGPATRO COM PARTPREVPLAN'
      '   (EL.IDPESSOA    = DT.IDTITULAR)                  AND'
      '   (EL.IDPESSJUR   = PV.IDPESSJUR)                  AND'
      ''
      '-- JOIN ENDPESS COM PESSOA'
      '   (PF.IDPESSOA         = EP.IDPESSOA(+))           AND'
      ''
      '--  JOIN PARTPREVPLAN COM PLANPREV'
      '   (PV.IDPLANOPREV = PL.IDPLANOPREV)                AND'
      ''
      '--  JOIN PARTPREVPLAN COM PARTPREVPLAN'
      '   (PV.IDSITPART   = PV.IDSITPART)                  AND'
      '   (PV.IDPESSOA    = DT.IDTITULAR)                  AND'
      '   (PV.SEQPROPOSTA = PV.SEQPROPOSTA)                AND'
      ''
      '--  FILTRO PARTPREVPLAN'
      '   (PV.FLGDESATIVADO = 0)                           AND'
      ''
      '--  JOIN CONTABANCARIA COM PESSOA'
      '   (CB.IDPESSOA(+) = PE.IDPESSOA)                   AND'
      '   (CB.FLGCONTAPREF(+) = 1)                         AND'
      ''
      '--  JOIN AGENCIABANCARIA COM CONTABANCARIA'
      '   (AB.IDPESSOA(+) = CB.IDAGENCIA)                  AND'
      ''
      '-- JOIN CIDADES COM ENDEPESS'
      '   (CD.IDCIDADES   =  EP.IDCIDADES)                 AND'
      '   (CD.IDESTADO    =  CD.IDESTADO)                  AND'
      ''
      '--  JOIN BANCO COM AGENCIABANCARIA'
      '   (BC.IDPESSOA(+) = AB.IDBANCO)                    AND'
      ''
      '--  JOIN BANCO COM PESSOA (BANCO)'
      '   (BC.IDPESSOA = PB.IDPESSOA(+))                   AND'
      ''
      '-- JOIN ESTADO COM CIDADES'
      '   (UF.IDESTADO     = CD.IDESTADO)                  AND'
      ''
      '-- FILTRO UF'
      '   (UF.IDPAIS       = 1)                            AND'
      ''
      '--  JOIN PESSOA COM ELEGPATRO'
      '   (PE.IDPESSOA = EL.IDPESSOA)                      AND'
      ''
      '--  JOIN DEPEN COM DEPENTIT'
      '   (DP.IDDEPENDENCIA = DT.IDDEPENDENCIA)            AND'
      ''
      '--  JOIN SITPART COM PARTPREVPLAN'
      '   (SP.IDSITPART     = PV.IDSITPART)'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 146
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRegraADM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  DATANASC,'
      '  P.IDPESSOA,'
      '  PPP.*,'
      '  SP.FLGINTERNO,'
      '  SPP.FLGINTERNO,'
      '  PF.*,'
      '  SP.DESCRICAO,'
      '  SPP.DESCRICAO,'
      '  E.*,'
      '  SF.FLGINTERNO,'
      '  B.IDBENEFICIO,'
      '  :FLGPARTBENEF as FLGPARTBENEF ,'
      '  :pMESREF as MESREF'
      ''
      'FROM'
      '  PESSOA           P,'
      '  PESSOAFISICA     PF,'
      '  PARTPREVPLAN     PPP,'
      '  SITPART          SP,'
      '  SITPLANOPREV     SPP,'
      '  ELEGPATRO        E,'
      '  SITFUNC          SF,'
      '  BENEFBFCIARIO    B'
      '  '
      'WHERE'
      ' (PPP.IDPLANOPREV = :IDPLANOPREV)          AND'
      ' (PPP.IDPESSJUR = :IDPESSJUR)              AND'
      ' (P.IDPESSOA =  :IDPESSOA)                 AND'
      ' (P.IDPESSOA  = PF.IDPESSOA)               AND'
      ' (PPP.IDPESSOA = P.IDPESSOA)               AND'
      ' (PPP.IDSITPART = SP.IDSITPART)            AND'
      ' (PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV) AND'
      ' (E.IDSITFUNC = SF.IDSITFUNC)              AND'
      ' (E.IDPESSOA = P.IDPESSOA)                 AND'
      ' (E.IDPESSJUR = PPP.IDPESSJUR)             AND'
      ' (B.IDPLANOPREV(+) = PPP.IDSITPLANOPREV)   AND'
      ' (B.IDTITULAR(+) = PPP.IDPESSOA)           AND'
      ' (B.IDPESSJUR(+) = PPP.IDPESSJUR)          AND'
      ' (B.IDPESSOA(+) = PPP.IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FLGPARTBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qry
    Constraints = True
    Left = 176
    Top = 199
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = qryRegraADM
    Constraints = True
    Left = 176
    Top = 231
  end
end
