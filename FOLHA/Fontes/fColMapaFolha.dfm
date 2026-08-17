inherited FrmColMapaFolha: TFrmColMapaFolha
  Left = 167
  Top = 278
  Caption = 'Coluna do mapa de folha'
  ClientHeight = 189
  ClientWidth = 475
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 475
    Height = 103
    object lblCodInterno: TLabel
      Left = 8
      Top = 4
      Width = 84
      Height = 13
      Caption = 'Código Interno'
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedtCodInterno: TwwDBEdit
      Left = 8
      Top = 20
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Color = clMenu
      DataField = 'IDCOLUNAMAPA'
      DataSource = ds
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedtDescricao: TwwDBEdit
      Left = 8
      Top = 72
      Width = 417
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbedtDescricaoExit
    end
  end
  inherited Dock972: TDock97
    Width = 475
  end
  inherited Dock971: TDock97
    Top = 150
    Width = 475
    inherited tb97Fundo: TToolbar97
      Left = 303
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 134
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 434
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 264
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 332
    Top = 7
    object CdsIDCOLUNAMAPA: TFloatField
      FieldName = 'IDCOLUNAMAPA'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'COLUNAMAPA.IDCOLUNAMAPA'
      'COLUNAMAPA.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'COLUNAMAPA')
    CamposChave.Strings = (
      'COLUNAMAPA.IDCOLUNAMAPA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 296
    Top = 7
  end
end
