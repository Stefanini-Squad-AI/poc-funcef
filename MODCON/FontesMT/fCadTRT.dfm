inherited frmCadTRT: TfrmCadTRT
  Left = 233
  Top = 265
  Caption = 'Cadastro de TRTs'
  ClientHeight = 192
  ClientWidth = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 106
    BorderWidth = 2
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 24
      Top = 55
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 251
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Região'
      FocusControl = dbedRegiao
    end
    object dbedCodigo: TDBEdit
      Left = 24
      Top = 27
      Width = 114
      Height = 21
      DataField = 'CODIGOTRT'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 24
      Top = 70
      Width = 288
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedRegiao: TDBEdit
      Left = 251
      Top = 27
      Width = 61
      Height = 21
      DataField = 'REGIAOTRT'
      DataSource = ds
      MaxLength = 3
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 337
  end
  inherited Dock971: TDock97
    Top = 153
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 167
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 199
    Top = 1
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 158
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 199
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 261
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 130
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona TRT'
    Colunas.Strings = (
      'TRT.CODIGOTRT'
      'TRT.DESCRICAO'
      'TRT.REGIAOTRT')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Região')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TRT')
    CamposChave.Strings = (
      'TRT.CODIGOTRT')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '17'
      '45'
      '05')
    ExibePergunta = False
    Left = 261
    Top = 13
  end
end
