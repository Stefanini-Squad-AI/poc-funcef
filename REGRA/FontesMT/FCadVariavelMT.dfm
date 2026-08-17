inherited FrmCadVariavelMT: TFrmCadVariavelMT
  Left = 254
  Top = 218
  Height = 326
  HelpContext = 450013
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Variáveis MT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 202
    inherited dbGrd: TwwDBGrid [0]
      Height = 200
      Selected.Strings = (
        'IDCAMPO'#9'16'#9'Código'
        'DESCRICAODOCAMPO'#9'65'#9'Descrição da Variável')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
    inherited pnlControles: TPanel [1]
      Height = 200
      object Label1: TLabel
        Left = 12
        Top = 32
        Width = 99
        Height = 13
        Caption = 'Código Resumido'
      end
      object Label3: TLabel
        Left = 12
        Top = 92
        Width = 126
        Height = 13
        Caption = 'Descrição da Variável'
      end
      object EdCodigo: TwwDBEdit
        Left = 12
        Top = 48
        Width = 197
        Height = 21
        CharCase = ecUpperCase
        DataField = 'IDCAMPO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object EdDescricao: TwwDBEdit
        Left = 12
        Top = 108
        Width = 467
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAODOCAMPO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 249
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 282
    Top = 55
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 328
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 384
    Top = 71
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    Left = 432
    Top = 23
    object CdsIDCAMPO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 16
      FieldName = 'IDCAMPO'
      Size = 15
    end
    object CdsDESCRICAODOCAMPO: TStringField
      DisplayLabel = 'Descrição da Variável'
      DisplayWidth = 65
      FieldName = 'DESCRICAODOCAMPO'
      Size = 60
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição da Variável')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO')
    Filtro.Strings = (
      'CMPBD.CAMPODOBANCO = 0 ')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '60')
    ExibePergunta = False
    Left = 456
    Top = 55
  end
end
