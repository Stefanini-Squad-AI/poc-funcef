inherited frmCadPlanoOrcMT: TfrmCadPlanoOrcMT
  Left = 449
  Top = 73
  HelpContext = 520021
  Caption = 'Cadastro de Planos Orçamentários'
  ClientHeight = 283
  ClientWidth = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 468
    Height = 197
    object Label1: TLabel
      Left = 24
      Top = 26
      Width = 166
      Height = 13
      Caption = 'Nome do Plano Orçamentário'
    end
    object Label2: TLabel
      Left = 24
      Top = 82
      Width = 202
      Height = 13
      Caption = 'Máscara dos Grupos Orçamentários'
    end
    object Label3: TLabel
      Left = 24
      Top = 135
      Width = 76
      Height = 13
      Caption = 'Ano Vigência'
    end
    object dbedNomePlanoOrcamentario: TwwDBEdit
      Left = 24
      Top = 40
      Width = 400
      Height = 21
      DataField = 'NOMEPLANOORC'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBedtMascaraGrupo: TwwDBEdit
      Left = 24
      Top = 96
      Width = 209
      Height = 21
      DataField = 'MASCARAGRUPO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 24
      Top = 152
      Width = 121
      Height = 21
      DataField = 'ANO'
      DataSource = ds
      MaxLength = 4
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 468
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 468
    inherited tb97Fundo: TToolbar97
      Left = 296
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520021
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 127
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 880
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 944
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
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
    Colunas.Strings = (
      'PLANOORCAMENTARIO.IDPLANOORCAMEN'
      'PLANOORCAMENTARIO.NOMEPLANOORC')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código do Plano Orçamentário'
      'Nome do Plano Orçamentário')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOORCAMENTARIO')
    CamposChave.Strings = (
      'PLANOORCAMENTARIO.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 408
    Top = 0
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from planoorcamentario')
    ClientDataSet = Cds
    Left = 296
    Top = 119
  end
end
