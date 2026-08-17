inherited FrmCadastroMT1: TFrmCadastroMT1
  Left = 220
  Top = 125
  Caption = 'FrmCadastroMT1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 16
      Top = 97
      Width = 181
      Height = 13
      Caption = 'Nome da Forma de Atendimento'
    end
    object DbeDescricao: TDBEdit
      Left = 16
      Top = 115
      Width = 425
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 155
      Width = 257
      Height = 17
      Caption = 'Emite Rubs no momento do atendimento'
      DataField = 'FLGEMITERUBS'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited ds: TwwDataSource
    Left = 286
    Top = 19
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'dspTipoAtend'
    RemoteServer = DCOMConnection1
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
      '')
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
    Left = 308
    Top = 87
  end
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{F58E7AA8-FAEA-11D5-B75A-0050DA8266C0}'
    ServerName = 'Project1.ServidorCentralApTeste'
    Left = 380
    Top = 5
  end
end
