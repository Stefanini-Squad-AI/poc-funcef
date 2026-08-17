inherited frmCadLocali: TfrmCadLocali
  Left = 89
  Top = 115
  HelpContext = 70015
  Caption = 'Cadastro de Localização'
  ClientHeight = 393
  ClientWidth = 650
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 307
    object lblNome: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object lblArea: TLabel
      Left = 24
      Top = 251
      Width = 74
      Height = 13
      Caption = 'Tipo de Área'
    end
    object Label1: TLabel
      Left = 24
      Top = 96
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Endereço'
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 32
      Width = 601
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
      Top = 267
      Width = 280
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
    object gbDescrCCusto: TGroupBox
      Left = 24
      Top = 138
      Width = 281
      Height = 65
      Caption = ' Centro de Custo '
      TabOrder = 5
      object lbDescCentroCusto: TLabel
        Left = 10
        Top = 44
        Width = 263
        Height = 17
        AutoSize = False
        Caption = 'Descrição'
      end
      object dbeCentroCusto: TwwDBEdit
        Left = 8
        Top = 20
        Width = 244
        Height = 21
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnChange = dbeCentroCustoExit
        OnExit = dbeCentroCustoExit
      end
      object spdCentroCusto: TBitBtn
        Left = 252
        Top = 20
        Width = 21
        Height = 21
        TabOrder = 1
        OnClick = spdCentroCustoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
    end
    object dbeEndereco: TwwDBEdit
      Left = 24
      Top = 72
      Width = 601
      Height = 21
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object spdSelResponsavel: TBitBtn
      Left = 607
      Top = 112
      Width = 21
      Height = 21
      TabOrder = 3
      OnClick = spdSelResponsavelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object dbeResponsavel: TwwDBEdit
      Left = 24
      Top = 112
      Width = 585
      Height = 21
      DataField = 'DESCRESPONSAVEL'
      DataSource = dsResp
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object pnlTree: TPanel
      Left = 312
      Top = 142
      Width = 315
      Height = 147
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 6
      object treeCentroCusto: TCMTreeView
        Left = 2
        Top = 2
        Width = 311
        Height = 143
        PodeNavegar = True
        DataSource = dsCentroCusto
        CampoChave = qryCentroCustoCODCENTROCUSTO
        CampoDescricao = qryCentroCustoNOME
        CampoTipo = qryCentroCustoSTATUSGRUPOCDC
        OnDblClick = treeCentroCustoDblClick
        OnExit = treeCentroCustoExit
        Align = alClient
        Visible = False
      end
    end
    object gbxSaidaTemp: TGroupBox
      Left = 24
      Top = 205
      Width = 281
      Height = 41
      TabOrder = 7
      object ckbSaidaTemp: TCheckBox
        Left = 17
        Top = 15
        Width = 240
        Height = 17
        Caption = 'Localização para Saídas Temporárias'
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 650
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 650
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
      '')
    Left = 255
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
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
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
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
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMPRESA, CODCENTROCUSTO, NOME, STATUSGRUPOCDC'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :PIDEMPRESA)'
      '  AND (ATIVO = '#39'S'#39')'
      'ORDER BY CODCENTROCUSTO'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'CENTCUST.STATUSGRUPOCDC'
      Size = 1
    end
  end
  object dsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = qryCentroCusto
    Left = 448
    Top = 288
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
  object MSResponsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Responsável')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RESPONSAVEL'
      'PESSOA')
    CamposChave.Strings = (
      'RESPONSAVEL.IDRESPONSAVEL')
    Filtro.Strings = (
      'RESPONSAVEL.FLGATIVOFIXO = 1'
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 448
    Top = 1
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
end
