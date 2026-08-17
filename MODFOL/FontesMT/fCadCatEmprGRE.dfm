inherited frmCadCatEmprGRE: TfrmCadCatEmprGRE
  Left = 141
  Top = 252
  HelpContext = 210045
  Caption = 'Cadastro de Categorias de Empregado para FGTS'
  ClientHeight = 155
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 520
    Height = 69
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 113
      Top = 14
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 29
      Width = 84
      Height = 21
      DataField = 'IDCATEMPRGRE'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 113
      Top = 29
      Width = 390
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 520
  end
  inherited Dock971: TDock97
    Top = 116
    Width = 520
    inherited tb97Fundo: TToolbar97
      Left = 350
      DockPos = 358
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      DockPos = 191
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 388
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 388
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 328
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Categoria de Empregado para FGTS'
    Colunas.Strings = (
      'CATEMPRGRE.IDCATEMPRGRE'
      'CATEMPRGRE.DESCRICAO')
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
      'CATEMPRGRE')
    CamposChave.Strings = (
      'CATEMPRGRE.IDCATEMPRGRE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 328
    Top = 1
  end
end
