inherited frmCadTipAcao: TfrmCadTipAcao
  Left = 226
  Top = 261
  Caption = 'Cadastro dos Tipos de Ação em Processos'
  ClientHeight = 188
  ClientWidth = 334
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 334
  end
  inherited pnlFundo: TPanel [1]
    Width = 334
    Height = 102
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 52
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 26
      Width = 114
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDTIPOACAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 66
      Width = 301
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 149
    Width = 334
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 349
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 182
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 276
    Top = 70
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 158
    Top = 57
  end
  inherited ImlPadrao: TImageList
    Left = 276
    Top = 57
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 207
    Top = 70
  end
  inherited Cds: TCMClientDataSet
    Left = 130
    Top = 57
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Ação em Processos'
    Colunas.Strings = (
      'TIPOACAOPROCJUR.IDTIPOACAO'
      'TIPOACAOPROCJUR.DESCRICAO')
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
      'TIPOACAOPROCJUR')
    CamposChave.Strings = (
      'TIPOACAOPROCJUR.IDTIPOACAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 207
    Top = 57
  end
end
