inherited frmMTInvRegNaoEncontrados: TfrmMTInvRegNaoEncontrados
  Left = 123
  Top = 203
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Localização / Conjunto dos Bens não Localizados'
  ClientHeight = 158
  ClientWidth = 643
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 643
    Height = 119
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 641
      Height = 117
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label6: TLabel
        Left = 24
        Top = 8
        Width = 103
        Height = 13
        Caption = 'Nova Localização'
      end
      object Label8: TLabel
        Left = 24
        Top = 56
        Width = 85
        Height = 13
        Caption = 'Novo Conjunto'
      end
      object dbeSelLocal: TwwDBEdit
        Left = 24
        Top = 24
        Width = 545
        Height = 21
        DataField = 'NOME'
        DataSource = dsLocal
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelLocal: TBitBtn
        Left = 570
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 1
        OnClick = bbtnSelLocalClick
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
      object dbeConjunto: TwwDBEdit
        Left = 24
        Top = 72
        Width = 545
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsConjunto
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelConjunto: TBitBtn
        Left = 570
        Top = 72
        Width = 21
        Height = 21
        TabOrder = 3
        OnClick = bbtnSelConjuntoClick
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
      object bbtnGeraConjunto: TBitBtn
        Left = 591
        Top = 72
        Width = 21
        Height = 21
        TabOrder = 4
        OnClick = bbtnGeraConjuntoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888F88888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFCCCFFF
          08888887FF77788F7F88888B7FFFFFCF088888F77F88FF7878F88B8B7BFCCCFF
          F088878778F77788F78F888B87FFFFFCFF0888F7F7F88FF788788BBBBBFFCCCF
          FFF08777778F777888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
          78888787F7878FF77888888B8888777888888887888877788888888888888888
          8888888888888888888888888888888888888888888888888888}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 119
    Width = 643
    inherited tb97Fundo: TToolbar97
      Left = 471
      DockPos = 607
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 302
      DockPos = 438
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 418
    Top = 399
  end
  object dsLocal: TwwDataSource
    AutoEdit = False
    DataSet = cdsLocal
    Left = 392
    Top = 64
  end
  object dsConjunto: TwwDataSource
    AutoEdit = False
    DataSet = cdsConjunto
    Left = 392
    Top = 16
  end
  object cdsLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 328
    Top = 64
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 328
    Top = 16
  end
  object MSLocal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a Localização'
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'PESSOA.NOME'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Responsável'
      'Código do C Custo'
      'Nome do C Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALIZACAO'
      'PESSOA'
      'CENTCUST')
    CamposChave.Strings = (
      'LOCALIZACAO.IDLOCALIZACAO'
      'LOCALIZACAO.IDPESSOA')
    Filtro.Strings = (
      'LOCALIZACAO.IDRESPONSAVEL = PESSOA.IDPESSOA'
      'LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO'
      'LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 256
    Top = 64
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Conjunto'
    Colunas.Strings = (
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conjunto'
      'Localização'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTO'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'CONJUNTO.IDCONJUNTO')
    Filtro.Strings = (
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '200'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 256
    Top = 16
  end
end
