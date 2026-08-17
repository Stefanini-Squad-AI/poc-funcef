inherited frmCadGrpObjeto: TfrmCadGrpObjeto
  Left = 186
  Caption = 'Cadastro de Grupos de Objeto Reclamado em Processos'
  ClientHeight = 187
  ClientWidth = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 397
    Height = 101
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 51
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      DataField = 'IDGRUPOOBJETO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 65
      Width = 365
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 397
  end
  inherited Dock971: TDock97
    Top = 148
    Width = 397
    inherited tb97Fundo: TToolbar97
      Left = 227
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 296
    Top = 64
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 318
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 296
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 228
    Top = 64
  end
  inherited Cds: TCMClientDataSet
    Left = 290
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo de Objeto Reclamado'
    Colunas.Strings = (
      'GRPOBJPROCJUR.IDGRUPOOBJETO'
      'GRPOBJPROCJUR.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRPOBJPROCJUR')
    CamposChave.Strings = (
      'GRPOBJPROCJUR.IDGRUPOOBJETO')
    Filtro.Strings = (
      'ClasseObj = '#39'1'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 228
    Top = 51
  end
end
