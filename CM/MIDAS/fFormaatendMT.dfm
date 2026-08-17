inherited frmformaatendMT: TfrmformaatendMT
  Left = 231
  Top = 178
  Caption = 'frmformaatendMT'
  ClientHeight = 264
  ClientWidth = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
    Height = 178
    object Label2: TLabel
      Left = 15
      Top = 38
      Width = 181
      Height = 13
      Caption = 'Nome da Forma de Atendimento'
    end
  end
  inherited Dock972: TDock97
    Width = 462
  end
  inherited Dock971: TDock97
    Top = 225
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 125
    end
  end
  object DbeDescricao: TDBEdit [3]
    Left = 13
    Top = 109
    Width = 425
    Height = 21
    DataField = 'NOME'
    DataSource = ds
    TabOrder = 3
  end
  object DBCheckBox1: TDBCheckBox [4]
    Left = 13
    Top = 145
    Width = 257
    Height = 17
    Caption = 'Emite Rubs no momento do atendimento'
    DataField = 'FLGEMITERUBS'
    DataSource = ds
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 30
    Top = 167
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 75
  end
  inherited ImlPadrao: TImageList
    Left = 40
    Top = 35
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 272
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'dspTipoAtend'
    RemoteServer = DCOMConnection1
    BeforeOpen = CdsBeforeOpen
    Left = 348
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOATEND.IDTIPOATEND'
      'TIPOATEND.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOATEND')
    CamposChave.Strings = (
      'TIPOATEND.IDTIPOATEND')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 420
    Top = 55
  end
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{F58E7AA8-FAEA-11D5-B75A-0050DA8266C0}'
    ServerName = 'Project1.ServidorCentralApTeste'
    Left = 408
    Top = 3
  end
  object SocketConnection1: TSocketConnection
    Host = 'Cmmts'
    Left = 332
    Top = 1
  end
end
