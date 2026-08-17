inherited frmCadLocalizacao: TfrmCadLocalizacao
  Left = 86
  Top = 170
  HelpContext = 720103
  Caption = 'Cadastro de Localizações'
  ClientHeight = 299
  ClientWidth = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 213
    BorderWidth = 2
    object lblNome: TLabel
      Left = 16
      Top = 10
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object Label2: TLabel
      Left = 16
      Top = 147
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object dbeNome: TwwDBEdit
      Left = 16
      Top = 26
      Width = 603
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeResponsavel: TwwDBEdit
      Left = 16
      Top = 68
      Width = 578
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = dsResponsavel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object spdSelResponsavel: TBitBtn
      Left = 598
      Top = 68
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
      Left = 16
      Top = 94
      Width = 603
      Height = 47
      Caption = ' Centro de Custo '
      TabOrder = 3
      object dbeCentroCusto: TwwDBEdit
        Left = 8
        Top = 16
        Width = 105
        Height = 21
        Color = clGray
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object spdCentroCusto: TBitBtn
        Left = 575
        Top = 16
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
      object edDescCentroCusto: TEdit
        Left = 120
        Top = 16
        Width = 449
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object dbedObserv: TwwDBEdit
      Left = 16
      Top = 161
      Width = 603
      Height = 43
      AutoSize = False
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 635
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 465
      DockPos = 535
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 298
      DockPos = 366
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 194
    TargetsData = (
      1
      1
      (
        '*'
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 284
    Top = 1
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
    Left = 336
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 256
    Top = 1
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
      'Tipo de Área'
      'Código C. Custo'
      'Nome C. Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALIZACAO'
      'CENTCUST'
      'TIPOAREA')
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
    Left = 413
    Top = 1
  end
  object msResponsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Responsável'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'RESPONSAVEL.IDRESPONSAVEL')
    Filtro.Strings = (
      'RESPONSAVEL.FLGATIVOFIXO = 1'
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA')
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
    Left = 491
    Top = 1
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 248
    Top = 194
  end
  object cdsTipoArea: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 88
    Top = 194
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 194
  end
  object dsResponsavel: TwwDataSource
    AutoEdit = False
    DataSet = cdsResponsavel
    Left = 168
    Top = 180
  end
  object dsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsCentroCusto
    Left = 248
    Top = 180
  end
  object msCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.STATUSGRUPOCDC'
      'CENTCUST.CODREDUZIDO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Centro de Custo'
      'Descrição'
      'Tipo'
      'Cod. Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    Filtro.Strings = (
      'CENTCUST.ATIVO = '#39'S'#39
      'CENTCUST.STATUSGRUPOCDC = '#39'A'#39)
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 576
    Top = 1
  end
end
