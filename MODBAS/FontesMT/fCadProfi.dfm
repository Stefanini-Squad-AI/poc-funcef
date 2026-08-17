inherited frmCadProfi: TfrmCadProfi
  Left = 153
  Top = 237
  Caption = 'Cadastro de Profissões'
  ClientHeight = 190
  ClientWidth = 456
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 456
    Height = 104
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 26
      Width = 59
      Height = 21
      DataField = 'IDPROFISS'
      DataSource = ds
      MaxLength = 7
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 68
      Width = 425
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 456
  end
  inherited Dock971: TDock97
    Top = 151
    Width = 456
    inherited tb97Fundo: TToolbar97
      Left = 286
      DockPos = 409
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 119
      DockPos = 242
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 332
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 332
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 400
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    FieldDefs = <
      item
        Name = 'IDPROFISS'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    StoreDefs = True
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Profissão'
    Colunas.Strings = (
      'PROFISS.IDPROFISS'
      'PROFISS.DESCRICAO')
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
      'PROFISS')
    CamposChave.Strings = (
      'PROFISS.IDPROFISS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '65')
    ExibePergunta = False
    Left = 400
    Top = 1
  end
end
