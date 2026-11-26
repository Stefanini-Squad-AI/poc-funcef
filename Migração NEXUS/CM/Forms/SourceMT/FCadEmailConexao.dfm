inherited frmCadEmailConexao: TfrmCadEmailConexao
  Left = 520
  Top = 197
  HelpContext = 230091
  Caption = 'Cadastro de Conexão de E-Mail'
  ClientHeight = 380
  ClientWidth = 413
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 413
    Height = 294
    object Label1: TLabel
      Left = 13
      Top = 57
      Width = 90
      Height = 13
      Caption = 'Servidor SMTP:'
      FocusControl = dbedtSMTPSERVER
    end
    object Label2: TLabel
      Left = 13
      Top = 201
      Width = 117
      Height = 13
      Caption = 'Nome para exibição:'
      FocusControl = dbedtNOMEEXIBICAO
    end
    object Label3: TLabel
      Left = 13
      Top = 105
      Width = 67
      Height = 13
      Caption = 'User Name:'
      FocusControl = dbedtUSERNAME
    end
    object Label4: TLabel
      Left = 13
      Top = 153
      Width = 59
      Height = 13
      Caption = 'Password:'
      FocusControl = dbedtPASSWORD
    end
    object Label6: TLabel
      Left = 13
      Top = 244
      Width = 35
      Height = 13
      Caption = 'Porta:'
      FocusControl = dbedtPORTA
    end
    object Label5: TLabel
      Left = 13
      Top = 10
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedtDESCRICAO
    end
    object dbedtSMTPSERVER: TDBEdit
      Left = 13
      Top = 73
      Width = 380
      Height = 21
      DataField = 'SMTPSERVER'
      DataSource = ds
      TabOrder = 1
    end
    object dbedtNOMEEXIBICAO: TDBEdit
      Left = 13
      Top = 217
      Width = 380
      Height = 21
      DataField = 'NOMEEXIBICAO'
      DataSource = ds
      TabOrder = 4
    end
    object dbedtUSERNAME: TDBEdit
      Left = 13
      Top = 121
      Width = 380
      Height = 21
      DataField = 'USERNAME'
      DataSource = ds
      TabOrder = 2
    end
    object dbedtPASSWORD: TDBEdit
      Left = 13
      Top = 169
      Width = 380
      Height = 21
      DataField = 'PASSWORD'
      DataSource = ds
      PasswordChar = '*'
      TabOrder = 3
    end
    object dbedtPORTA: TDBEdit
      Left = 13
      Top = 259
      Width = 144
      Height = 21
      DataField = 'PORTA'
      DataSource = ds
      TabOrder = 5
    end
    object dbchkAutenticacao: TDBCheckBox
      Left = 213
      Top = 260
      Width = 143
      Height = 17
      Caption = 'Requer autenticação'
      DataField = 'FLGAUTENTIC'
      DataSource = ds
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbedtDESCRICAO: TDBEdit
      Left = 13
      Top = 26
      Width = 380
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 413
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 413
    inherited tb97Fundo: TToolbar97
      Left = 241
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230091
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 72
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 114
    Top = 23
  end
  inherited ds: TwwDataSource
    Left = 214
    Top = 23
  end
  inherited ImlPadrao: TImageList
    Left = 160
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 360
    Top = 23
  end
  inherited Cds: TCMClientDataSet
    AfterInsert = CdsAfterInsert
    Left = 268
    Top = 23
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona conexão de e-mail'
    Colunas.Strings = (
      'EMAILCONEXAO.DESCRICAO'
      'EMAILCONEXAO.USERNAME'
      'EMAILCONEXAO.NOMEEXIBICAO'
      'EMAILCONEXAO.SMTPSERVER')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'User name'
      'Nome para exibição'
      'SMTPServer')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EMAILCONEXAO')
    CamposChave.Strings = (
      'EMAILCONEXAO.IDEMAILCONEXAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '15'
      '20'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 320
    Top = 23
  end
end
