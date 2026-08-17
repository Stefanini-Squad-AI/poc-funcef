inherited FrmCadCertificado: TFrmCadCertificado
  Left = 481
  Top = 271
  Caption = 'Certificado'
  ClientHeight = 204
  ClientWidth = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 118
    object lblCertificado: TLabel
      Left = 16
      Top = 16
      Width = 62
      Height = 13
      Caption = 'Certificado'
    end
    object lblSigla: TLabel
      Left = 16
      Top = 64
      Width = 29
      Height = 13
      Caption = 'Sigla'
    end
    object dbedtCertificado: TwwDBEdit
      Left = 16
      Top = 32
      Width = 305
      Height = 21
      DataField = 'descricao'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedtSigla: TwwDBEdit
      Left = 16
      Top = 80
      Width = 129
      Height = 21
      DataField = 'sigla'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 339
  end
  inherited Dock971: TDock97
    Top = 165
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 546
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 388
    Top = 17
  end
  inherited ImlPadrao: TImageList
    Left = 544
    Top = 47
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 328
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 388
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Certificado'
    Colunas.Strings = (
      'DESCRICAO'
      'SIGLA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CERTIFICADO')
    CamposChave.Strings = (
      'IDCERTIFICADO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '15')
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
    Left = 256
    Top = 7
  end
end
