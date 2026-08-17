inherited frmMTCadLocalizacao: TfrmMTCadLocalizacao
  Left = 80
  Top = 112
  Caption = 'Cadastro de Localizações'
  ClientHeight = 392
  ClientWidth = 649
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 649
    Height = 306
    object lblNome: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Endereço'
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
      LookupTable = cdsTipoArea
      LookupField = 'IDTIPOAREA'
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeResponsavel: TwwDBEdit
      Left = 24
      Top = 112
      Width = 585
      Height = 21
      DataField = 'NOME'
      DataSource = dsResponsavel
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object spdSelResponsavel: TBitBtn
      Left = 607
      Top = 112
      Width = 21
      Height = 21
      TabOrder = 2
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
    object gbDescrCCusto: TGroupBox
      Left = 24
      Top = 138
      Width = 281
      Height = 65
      Caption = ' Centro de Custo '
      TabOrder = 3
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
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object spdCentroCusto: TBitBtn
        Left = 252
        Top = 20
        Width = 21
        Height = 21
        TabOrder = 0
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
    object gbxSaidaTemp: TGroupBox
      Left = 24
      Top = 205
      Width = 281
      Height = 41
      TabOrder = 4
      object ckbSaidaTemp: TDBCheckBox
        Left = 19
        Top = 16
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
    object pnlTreeCentroCusto: TPanel
      Left = 312
      Top = 142
      Width = 315
      Height = 147
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 7
      object treeCentroCusto: TCMTreeViewMT
        Left = 2
        Top = 2
        Width = 311
        Height = 143
        PodeNavegar = True
        DataSource = dsCentroCusto
        CampoChave = 'CODCENTROCUSTO'
        CampoDescricao = 'NOME'
        CampoTipo = 'STATUSGRUPOCDC'
        OnDblClick = treeCentroCustoDblClick
        OnExit = treeCentroCustoExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 649
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 649
    inherited tb97Fundo: TToolbar97
      Left = 479
      DockPos = 535
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 312
      DockPos = 366
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 706
    Top = 455
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 648
    Top = 456
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 336
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
    Left = 504
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 352
    Top = 256
  end
  object cdsTipoArea: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 216
    Top = 288
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 360
    Top = 136
  end
  object dsResponsavel: TwwDataSource
    AutoEdit = False
    DataSet = cdsResponsavel
    Left = 360
    Top = 122
  end
  object dsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsCentroCusto
    Left = 352
    Top = 242
  end
end
