inherited frmCadLocali: TfrmCadLocali
  Left = 70
  Top = 120
  HelpContext = 70015
  Caption = 'Cadastro de Localização'
  ClientHeight = 325
  ClientWidth = 647
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 647
    Height = 239
    object lblNome: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object lblArea: TLabel
      Left = 24
      Top = 180
      Width = 74
      Height = 13
      Caption = 'Tipo de Área'
    end
    object Label2: TLabel
      Left = 24
      Top = 112
      Width = 55
      Height = 13
      Caption = 'Endereço'
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 32
      Width = 600
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipoArea: TwwDBLookupCombo
      Left = 24
      Top = 196
      Width = 298
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOAREA'#9'30'#9'Tipo de Área')
      DataField = 'IDTIPOAREA'
      DataSource = ds
      LookupTable = qryArea
      LookupField = 'IDTIPOAREA'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object gbxSaidaTemp: TGroupBox
      Left = 328
      Top = 182
      Width = 297
      Height = 35
      TabOrder = 5
      object ckbSaidaTemp: TCheckBox
        Left = 31
        Top = 12
        Width = 240
        Height = 17
        Caption = 'Localização para Saídas Temporárias'
        TabOrder = 0
      end
    end
    object CMProcuraCCusto: TCMProcuraMask
      Left = 328
      Top = 114
      Width = 297
      Height = 65
      Caption = ' Centro de Custo '
      TabOrder = 3
      OnExit = CMProcuraCCustoExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'CODCENTROCUSTO'
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      Mensagens.Sintetica = 'Chave não pode ser sintética'
      Mensagens.Analitica = 'Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      MontaSelect = MSCentroCusto
      LookupQuery = cdsCentroCusto
      LookupSQLParams = sqlCentroCusto
      LookupParam = 'CODCENTROCUSTO'
      LookupChave = 'CODCENTROCUSTO'
      LookupTipo = 'STATUSGRUPOCDC'
      LookupDescricao = 'NOME'
    end
    object CMProcuraResp: TCMProcuraSubTipo
      Left = 24
      Top = 56
      Width = 601
      Height = 50
      Caption = ' Responsável '
      TabOrder = 1
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      DataSource = ds
      DataField = 'IDRESPONSAVEL'
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = True
      SubTipo = stResponsavel
      FiltraSubTipo = True
    end
    object dbeEndereco: TDBMemo
      Left = 24
      Top = 128
      Width = 297
      Height = 49
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 647
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 647
    inherited tb97Fundo: TToolbar97
      Left = 457
      DockPos = 457
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70015
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 289
      DockPos = 289
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDLOCALIZACAO,'
      '       IDPESSOA,'
      '       IDRESPONSAVEL,'
      '       IDEMPRESA,'
      '       CODCENTROCUSTO,'
      '       IDTIPOAREA,'
      '       NOME,'
      '       ENDERECO,'
      '       FLGLOCSAITEMP      '
      'FROM LOCALIZACAO'
      'WHERE (IDLOCALIZACAO = :PIDLOCALIZACAO)'
      '  AND (IDPESSOA = :IDPESSOA)'
      ''
      ' ')
    Left = 255
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'LOCALIZACAO.IDLOCALIZACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LOCALIZACAO.IDPESSOA'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'LOCALIZACAO.IDRESPONSAVEL'
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'LOCALIZACAO.IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LOCALIZACAO.CODCENTROCUSTO'
      Size = 10
    end
    object qryIDTIPOAREA: TFloatField
      FieldName = 'IDTIPOAREA'
      Origin = 'LOCALIZACAO.IDTIPOAREA'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'LOCALIZACAO.NOME'
      Size = 60
    end
    object qryENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'LOCALIZACAO.ENDERECO'
      Size = 120
    end
    object qryFLGLOCSAITEMP: TFloatField
      FieldName = 'FLGLOCSAITEMP'
      Origin = 'LOCALIZACAO.FLGLOCSAITEMP'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 459
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update Localizacao'
      'set'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDTIPOAREA = :IDTIPOAREA,'
      '  NOME = :NOME,'
      '  ENDERECO = :ENDERECO,'
      '  FLGLOCSAITEMP = :FLGLOCSAITEMP'
      'where'
      '  IDLOCALIZACAO = :OLD_IDLOCALIZACAO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into Localizacao'
      
        '  (IDLOCALIZACAO, IDPESSOA, IDRESPONSAVEL, IDEMPRESA, CODCENTROC' +
        'USTO, IDTIPOAREA, '
      '   NOME, ENDERECO, FLGLOCSAITEMP)'
      'values'
      
        '  (:IDLOCALIZACAO, :IDPESSOA, :IDRESPONSAVEL, :IDEMPRESA, :CODCE' +
        'NTROCUSTO, '
      '   :IDTIPOAREA, :NOME, :ENDERECO, :FLGLOCSAITEMP)')
    DeleteSQL.Strings = (
      'delete from Localizacao'
      'where'
      '  IDLOCALIZACAO = :OLD_IDLOCALIZACAO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 289
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'TIPOAREA.DESCTIPOAREA'
      'LOCALIZACAO.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Tipo de Area'
      'Código C Custo'
      'Nome C Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOAREA'
      'LOCALIZACAO'
      'CENTCUST')
    CamposChave.Strings = (
      'LOCALIZACAO.IDLOCALIZACAO'
      'LOCALIZACAO.IDPESSOA')
    Filtro.Strings = (
      'TIPOAREA.IDTIPOAREA=LOCALIZACAO.IDTIPOAREA'
      'CENTCUST.CODCENTROCUSTO=LOCALIZACAO.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA=LOCALIZACAO.IDEMPRESA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '15'
      '10'
      '30')
    Left = 373
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 325
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 689
    Top = 470
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 446
    Top = 2
  end
  object qryArea: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOAREA, IDTIPOAREA'
      'FROM TIPOAREA'
      'ORDER BY DESCTIPOAREA'
      '')
    ValidateWithMask = True
    Left = 608
    object qryAreaDESCTIPOAREA: TStringField
      FieldName = 'DESCTIPOAREA'
      Origin = 'TIPOAREA.DESCTIPOAREA'
      Size = 30
    end
    object qryAreaIDTIPOAREA: TFloatField
      FieldName = 'IDTIPOAREA'
      Origin = 'TIPOAREA.IDTIPOAREA'
    end
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCARACC'
      'FROM PARAMGLOBAL'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = 'PARAMGLOBAL.MASCARACC'
      Size = 18
    end
  end
  object MSCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.STATUSGRUPOCDC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Centro de Custo'
      'Nome'
      'S / A')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA')
    Filtro.Strings = (
      'CENTCUST.ATIVO='#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 536
    Top = 168
  end
  object qryResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRESPONSAVEL, P.NOME AS DESCRESPONSAVEL'
      'FROM RESPONSAVEL R, PESSOA P'
      'WHERE (R.IDRESPONSAVEL = :PIDRESP)'
      '  AND (R.IDRESPONSAVEL = P.IDPESSOA(+))'
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 520
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESP'
        ParamType = ptUnknown
      end>
    object qryRespIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryRespDESCRESPONSAVEL: TStringField
      FieldName = 'DESCRESPONSAVEL'
      Size = 60
    end
  end
  object dsResp: TwwDataSource
    DataSet = qryResp
    Left = 560
    Top = 1
  end
  object sqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT IDEMPRESA, CODCENTROCUSTO, NOME, STATUSGRUPOCDC'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :IDEMPRESA)'
      'AND (RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO)')
    ClientDataSet = cdsCentroCusto
    Left = 368
    Top = 189
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 176
  end
end
