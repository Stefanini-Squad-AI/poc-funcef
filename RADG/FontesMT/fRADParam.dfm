inherited frmRADParam: TfrmRADParam
  Left = 464
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configurações do RAD'
  ClientHeight = 345
  ClientWidth = 408
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 408
    Height = 306
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 406
      Height = 304
      ActivePage = tabGerais
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tabGerais: TTabSheet
        Caption = 'Configurações gerais'
        ImageIndex = 2
        object dbchk24h: TDBCheckBox
          Left = 8
          Top = 8
          Width = 385
          Height = 17
          Caption = 'Considerar para cálculo de prazos, 24h/dia, 7 dias por semana.'
          DataField = 'FLG24H'
          DataSource = DsRadParam
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchk24hClick
        end
        object grpExpediente: TGroupBox
          Left = 8
          Top = 36
          Width = 380
          Height = 59
          Caption = 'Horário de expediente'
          TabOrder = 1
          object Label7: TLabel
            Left = 45
            Top = 25
            Width = 38
            Height = 13
            Caption = 'Início:'
          end
          object Label8: TLabel
            Left = 205
            Top = 25
            Width = 50
            Height = 13
            Caption = 'Término:'
          end
          object dbedtHoraIniExp: TDBEdit
            Left = 85
            Top = 23
            Width = 68
            Height = 21
            DataField = 'HORAINIEXP'
            DataSource = DsRadParam
            TabOrder = 0
            OnChange = dbedtHoraIniExpChange
            OnExit = dbedtHoraIniExpExit
          end
          object dbedtHoraFimExp: TDBEdit
            Left = 256
            Top = 23
            Width = 68
            Height = 21
            DataField = 'HORAFIMEXP'
            DataSource = DsRadParam
            TabOrder = 1
            OnChange = dbedtHoraFimExpChange
            OnExit = dbedtHoraFimExpExit
          end
        end
      end
      object tabEMail: TTabSheet
        Caption = 'E-mail'
        object Label1: TLabel
          Left = 8
          Top = 35
          Width = 90
          Height = 13
          Caption = 'Servidor SMTP:'
          FocusControl = dbedtSMTPSERVER
        end
        object Label2: TLabel
          Left = 8
          Top = 179
          Width = 117
          Height = 13
          Caption = 'Nome para exibição:'
          FocusControl = dbedtNOMEEXIBICAO
        end
        object Label3: TLabel
          Left = 8
          Top = 83
          Width = 67
          Height = 13
          Caption = 'User Name:'
          FocusControl = dbedtUSERNAME
        end
        object Label4: TLabel
          Left = 8
          Top = 131
          Width = 59
          Height = 13
          Caption = 'Password:'
          FocusControl = dbedtPASSWORD
        end
        object Label6: TLabel
          Left = 8
          Top = 224
          Width = 35
          Height = 13
          Caption = 'Porta:'
          FocusControl = dbedtPORTA
        end
        object dbedtSMTPSERVER: TDBEdit
          Left = 8
          Top = 51
          Width = 380
          Height = 21
          DataField = 'SMTPSERVER'
          DataSource = dtsEMailConexao
          TabOrder = 1
        end
        object dbedtNOMEEXIBICAO: TDBEdit
          Left = 8
          Top = 195
          Width = 380
          Height = 21
          DataField = 'NOMEEXIBICAO'
          DataSource = dtsEMailConexao
          TabOrder = 4
        end
        object dbedtUSERNAME: TDBEdit
          Left = 8
          Top = 99
          Width = 380
          Height = 21
          DataField = 'USERNAME'
          DataSource = dtsEMailConexao
          TabOrder = 2
        end
        object dbedtPASSWORD: TDBEdit
          Left = 8
          Top = 147
          Width = 380
          Height = 21
          DataField = 'PASSWORD'
          DataSource = dtsEMailConexao
          PasswordChar = '*'
          TabOrder = 3
        end
        object dbedtPORTA: TDBEdit
          Left = 8
          Top = 243
          Width = 144
          Height = 21
          DataField = 'PORTA'
          DataSource = dtsEMailConexao
          TabOrder = 5
        end
        object dbchkAutenticacao: TDBCheckBox
          Left = 208
          Top = 244
          Width = 143
          Height = 17
          Caption = 'Requer autenticação'
          DataField = 'FLGAUTENTIC'
          DataSource = dtsEMailConexao
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkEmail: TDBCheckBox
          Left = 8
          Top = 8
          Width = 161
          Height = 17
          Caption = 'Ativa o envio de e-mail.'
          DataField = 'FLGENVIAEMAIL'
          DataSource = DsRadParam
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbChkEmailClick
        end
      end
      object tabMensCM: TTabSheet
        Caption = 'Mensagens CM'
        object Label5: TLabel
          Left = 8
          Top = 36
          Width = 88
          Height = 13
          Caption = 'Remetente CM:'
        end
        object dbchkMensagem: TDBCheckBox
          Left = 8
          Top = 8
          Width = 313
          Height = 17
          Caption = 'Ativa o envio de mensagens no Padrão CM.'
          DataField = 'FLGENVIACM'
          DataSource = DsRadParam
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkMensagemClick
        end
        object cmpRemetente: TCMProcura
          Left = 8
          Top = 52
          Width = 380
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MostraMensagens = True
          Mensagens.EmBranco = 'Grupo não pode estar em branco'
          Mensagens.NaoExiste = 'Grupo não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          DataSource = DsRadParam
          DataField = 'IDREMETENTE'
          LookupChave = 'IDPESSOA'
          LookupDescricao = 'NOME'
          MontaSelect = MSGrupo
          LookupTabela = 'PESSOA'
          DataBaseName = 'BaseDados'
          ReadOnly = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 306
    Width = 408
    inherited tb97Fundo: TToolbar97
      Left = 236
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 99
    Top = 217
  end
  object cdsEMailConexao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = cdsEMailConexaoAfterInsert
    BeforePost = cdsEMailConexaoBeforePost
    Left = 32
    Top = 224
    object cdsEMailConexaoIDEMAILCONEXAO: TFloatField
      FieldName = 'IDEMAILCONEXAO'
    end
    object cdsEMailConexaoSMTPSERVER: TStringField
      FieldName = 'SMTPSERVER'
      Size = 100
    end
    object cdsEMailConexaoNOMEEXIBICAO: TStringField
      FieldName = 'NOMEEXIBICAO'
      Size = 100
    end
    object cdsEMailConexaoUSERNAME: TStringField
      DisplayWidth = 100
      FieldName = 'USERNAME'
      Size = 100
    end
    object cdsEMailConexaoPASSWORD: TStringField
      DisplayWidth = 100
      FieldName = 'PASSWORD'
      Size = 100
    end
    object cdsEMailConexaoFLGAUTENTIC: TFloatField
      FieldName = 'FLGAUTENTIC'
    end
    object cdsEMailConexaoPORTA: TFloatField
      FieldName = 'PORTA'
    end
    object cdsEMailConexaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dtsEMailConexao: TDataSource
    DataSet = cdsEMailConexao
    Left = 29
    Top = 153
  end
  object cdsRADParam: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDEMAILCONEXAO'
        DataType = ftFloat
      end
      item
        Name = 'FLGENVIAEMAIL'
        DataType = ftFloat
      end
      item
        Name = 'FLGENVIACM'
        DataType = ftFloat
      end
      item
        Name = 'HORAINIEXP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORAFIMEXP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'FLG24H'
        DataType = ftFloat
      end
      item
        Name = 'IDREMETENTE'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterInsert = cdsRADParamAfterInsert
    BeforePost = cdsRADParamBeforePost
    Left = 77
    Top = 153
    object cdsRADParamIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object cdsRADParamIDEMAILCONEXAO: TFloatField
      FieldName = 'IDEMAILCONEXAO'
    end
    object cdsRADParamFLGENVIAEMAIL: TFloatField
      FieldName = 'FLGENVIAEMAIL'
    end
    object cdsRADParamFLGENVIACM: TFloatField
      FieldName = 'FLGENVIACM'
    end
    object cdsRADParamFLG24H: TFloatField
      FieldName = 'FLG24H'
    end
    object cdsRADParamIDREMETENTE: TFloatField
      FieldName = 'IDREMETENTE'
    end
    object cdsRADParamHORAINIEXP: TStringField
      FieldName = 'HORAINIEXP'
      EditMask = '99:99;1; '
      Size = 5
    end
    object cdsRADParamHORAFIMEXP: TStringField
      FieldName = 'HORAFIMEXP'
      EditMask = '99:99;1; '
      Size = 5
    end
  end
  object DsRadParam: TDataSource
    DataSet = cdsRADParam
    Left = 125
    Top = 153
  end
  object MSGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Remetente'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'F'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    OperComparador.Strings = (
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 185
    Top = 233
  end
end
