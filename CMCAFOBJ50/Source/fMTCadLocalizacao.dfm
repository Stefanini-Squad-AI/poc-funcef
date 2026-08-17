inherited frmMTCadLocalizacao: TfrmMTCadLocalizacao
  Left = 70
  Top = 145
  Caption = 'Cadastro de Localizações'
  ClientHeight = 327
  ClientWidth = 652
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 296
    Top = 232
    Width = 92
    Height = 13
    Caption = 'Centro de Custo'
  end
  inherited pnlFundo: TPanel
    Width = 652
    Height = 241
    object lblNome: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object Label2: TLabel
      Left = 24
      Top = 112
      Width = 55
      Height = 13
      Caption = 'Endereço'
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object Label3: TLabel
      Left = 24
      Top = 184
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label4: TLabel
      Left = 373
      Top = 64
      Width = 74
      Height = 13
      Caption = 'Tipo de Área'
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 32
      Width = 516
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeResponsavel: TwwDBEdit
      Left = 24
      Top = 80
      Width = 315
      Height = 21
      DataField = 'NOME'
      DataSource = dsResponsavel
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object spdSelResponsavel: TBitBtn
      Left = 339
      Top = 80
      Width = 21
      Height = 21
      TabOrder = 1
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
    object dbmEndereco: TDBMemo
      Left = 24
      Top = 128
      Width = 337
      Height = 41
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 373
      Top = 128
      Width = 258
      Height = 42
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object ckbSaidaTemp: TDBCheckBox
        Left = 10
        Top = 13
        Width = 241
        Height = 17
        Caption = 'Localização para Saídas Temporárias'
        DataField = 'FLGLOCSAITEMP'
        DataSource = ds
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object dbrgInativo: TDBRadioGroup
      Left = 552
      Top = 8
      Width = 75
      Height = 58
      Caption = ' Inativa '
      DataField = 'INATIVO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 5
      Values.Strings = (
        '1'
        '0')
    end
    object spdCentroCusto: TBitBtn
      Left = 340
      Top = 200
      Width = 21
      Height = 21
      TabOrder = 6
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
    object dbeCentroCusto: TwwDBEdit
      Left = 24
      Top = 200
      Width = 315
      Height = 21
      DataField = 'NOMECCUSTO'
      DataSource = dsCentroCusto
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipoArea: TwwDBLookupCombo
      Left = 373
      Top = 80
      Width = 258
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOAREA'#9'30'#9'Tipo de Área')
      DataField = 'IDTIPOAREA'
      DataSource = ds
      LookupTable = cdsTipoArea
      LookupField = 'IDTIPOAREA'
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 652
  end
  inherited Dock971: TDock97
    Top = 288
    Width = 652
    inherited tb97Fundo: TToolbar97
      Left = 480
      DockPos = 535
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 311
      DockPos = 366
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 746
    Top = 519
    TargetsData = (
      1
      2
      (
        '*'
        'Items'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 296
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 648
    Top = 456
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 352
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 256
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Localização'
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'TIPOAREA.DESCTIPOAREA'
      'CENTCUST.CODEXTERNO'
      'CENTCUST.NOME'
      'TO_CHAR(DECODE(NVL(LOCALIZACAO.INATIVO,0),0,'#39'N'#39','#39'S'#39'))')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Tipo de Area'
      'Código C Custo'
      'Nome C Custo'
      'Inativo (S/N)')
    SensivelACaixa.Strings = (
      'N'
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
      ''
      '')
    Larguras.Strings = (
      '40'
      '15'
      '10'
      '30'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 421
    Top = 0
  end
  object MSResponsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Responsável'
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
    MultiSelect = False
    Left = 504
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 248
    object cdsCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object cdsCentroCustoCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
    object cdsCentroCustoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object cdsCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsCentroCustoNOMECCUSTO: TStringField
      FieldName = 'NOMECCUSTO'
      Size = 41
    end
  end
  object cdsTipoArea: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 568
    Top = 120
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 272
    Top = 104
  end
  object dsResponsavel: TwwDataSource
    AutoEdit = False
    DataSet = cdsResponsavel
    Left = 272
    Top = 90
  end
  object dsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsCentroCusto
    Left = 168
    Top = 234
  end
  object MSCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODEXTERNO'
      'CENTCUST.NOME'
      'CENTCUST.STATUSGRUPOCDC'
      'CENTCUST.CODREDUZIDO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo'
      'Cod.Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA'
      'CENTCUST.STATUSGRUPOCDC'
      'CENTCUST.CODEXTERNO')
    Filtro.Strings = (
      'CENTCUST.ATIVO='#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '1'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 256
    Top = 224
  end
  object sqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT CC.CODCENTROCUSTO, CC.CODEXTERNO, CC.IDEMPRESA, CC.NOME,'
      
        '       CONCAT(CONCAT(LTRIM(RTRIM(CC.CODEXTERNO)),'#39' '#39'), CC.NOME) ' +
        'AS NOMECCUSTO'
      'FROM CENTCUST CC'
      
        'WHERE LTRIM(RTRIM(CC.CODCENTROCUSTO)) = LTRIM(RTRIM(:CODCENTROCU' +
        'STO))'
      '  AND CC.IDEMPRESA = :IDEMPRESA'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsCentroCusto
    Left = 168
    Top = 220
  end
end
