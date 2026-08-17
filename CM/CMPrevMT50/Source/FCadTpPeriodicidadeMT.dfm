inherited FrmCadTpPeriodicidadeMT: TFrmCadTpPeriodicidadeMT
  Left = 314
  Top = 245
  Caption = 'Cadastro de Periodicidade'
  ClientHeight = 201
  ClientWidth = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 384
    Height = 115
    object Label2: TLabel
      Left = 8
      Top = 63
      Width = 174
      Height = 13
      Caption = 'Periodicidade em Nº de Meses'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 78
      Height = 13
      Caption = 'Periodicidade'
    end
    object dbedQtdeMeses: TwwDBEdit
      Left = 8
      Top = 78
      Width = 121
      Height = 21
      DataField = 'QTDEMESES'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDesc: TwwDBEdit
      Left = 8
      Top = 23
      Width = 238
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 384
  end
  inherited Dock971: TDock97
    Top = 162
    Width = 384
    inherited tb97Fundo: TToolbar97
      Left = 212
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 43
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 95
  end
  inherited ds: TwwDataSource
    Left = 54
    Top = 63
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 88
  end
  inherited Cds: TCMClientDataSet
    Left = 52
    Top = 95
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Periodicidade'
    Colunas.Strings = (
      'IDTPPERIODICIDADE'
      'NOME'
      'QTDEMESES')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Qtde. Meses')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TPPERIODICIDADE')
    CamposChave.Strings = (
      'IDTPPERIODICIDADE')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 88
    Top = 95
  end
end
