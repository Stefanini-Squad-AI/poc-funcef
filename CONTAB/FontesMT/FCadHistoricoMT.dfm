inherited frmCadHistoricoMT: TfrmCadHistoricoMT
  Left = 190
  Top = 181
  Caption = 'Cadastro de Históricos Padrão'
  ClientHeight = 299
  ClientWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 400
    Height = 213
    object Label1: TLabel
      Left = 24
      Top = 23
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 24
      Top = 67
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object Label3: TLabel
      Left = 24
      Top = 180
      Width = 248
      Height = 13
      Caption = 'Utilize o caracter "#" no lugar de textos substituíveis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbeCodigo: TwwDBEdit
      Left = 24
      Top = 36
      Width = 73
      Height = 21
      DataField = 'HITCODHIST'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object memHistPadrao: TDBMemo
      Left = 24
      Top = 80
      Width = 353
      Height = 87
      DataField = 'HITDESCR1'
      DataSource = ds
      MaxLength = 200
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 400
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 400
    inherited tb97Fundo: TToolbar97
      Left = 228
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 59
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 314
    Top = 63
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 262
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 352
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 320
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 220
    Top = 31
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'HISTOPADRAO.HITCODHIST'
      'HISTOPADRAO.HITDESCR1')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'HISTOPADRAO')
    CamposChave.Strings = (
      'HISTOPADRAO.HITCODHIST'
      'HISTOPADRAO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '4'
      '200')
    Left = 360
    Top = 119
  end
end
