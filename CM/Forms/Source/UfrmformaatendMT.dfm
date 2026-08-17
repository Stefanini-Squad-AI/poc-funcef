inherited frmformaatendMT: TfrmformaatendMT
  Left = 209
  Top = 92
  Caption = 'frmformaatendMT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label2: TLabel
      Left = 58
      Top = 61
      Width = 181
      Height = 13
      Caption = 'Nome da Forma de Atendimento'
    end
  end
  object DbeDescricao: TDBEdit [3]
    Left = 58
    Top = 136
    Width = 425
    Height = 21
    DataField = 'NOME'
    DataSource = ds
    TabOrder = 3
  end
  object DBCheckBox1: TDBCheckBox [4]
    Left = 58
    Top = 176
    Width = 257
    Height = 17
    Caption = 'Emite Rubs no momento do atendimento'
    DataField = 'FLGEMITERUBS'
    DataSource = ds
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 75
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
    Left = 340
    Top = 51
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
    Left = 460
    Top = 23
  end
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{F58E7AA8-FAEA-11D5-B75A-0050DA8266C0}'
    ServerName = 'Project1.ServidorCentralApTeste'
    Left = 388
    Top = 3
  end
end
