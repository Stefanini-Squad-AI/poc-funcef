inherited FrmCadUnidMedida: TFrmCadUnidMedida
  Left = 208
  Top = 159
  Caption = 'Cadastro Unidade de Medida'
  ClientHeight = 228
  ClientWidth = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 389
    Height = 142
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 32
      Top = 72
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodMed: TDBEdit
      Left = 32
      Top = 40
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODMEDIDA'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescMed: TDBEdit
      Left = 32
      Top = 88
      Width = 321
      Height = 21
      DataField = 'DESCMEDIDA'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 389
  end
  inherited Dock971: TDock97
    Top = 189
    Width = 389
    inherited tb97Fundo: TToolbar97
      Left = 219
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 52
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 762
    Top = 55
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 760
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 352
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    ProviderName = ''
    Left = 300
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UNMEDIDA.CODMEDIDA'
      'UNMEDIDA.DESCMEDIDA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'UNMEDIDA')
    CamposChave.Strings = (
      'UNMEDIDA.CODMEDIDA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '4'
      '25')
    Left = 424
    Top = 65535
  end
end
