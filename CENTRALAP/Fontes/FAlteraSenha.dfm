inherited frmAlteraSenha: TfrmAlteraSenha
  Left = 246
  Top = 134
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Alteração da Senha do Participante'
  ClientHeight = 290
  ClientWidth = 456
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 456
    Height = 251
    object Label1: TLabel
      Left = 18
      Top = 17
      Width = 32
      Height = 13
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 179
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object grpConteudo: TGroupBox
      Left = 14
      Top = 60
      Width = 429
      Height = 173
      Caption = 'Definição de conteúdo'
      TabOrder = 2
      object rbConteudoUnico: TRadioButton
        Left = 16
        Top = 24
        Width = 217
        Height = 17
        Caption = 'Preencher senhas com a palavra:'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbConteudoUnicoClick
      end
      object rbConteudoDinamico: TRadioButton
        Left = 16
        Top = 48
        Width = 209
        Height = 17
        Caption = 'Preencher senhas com o campo:'
        TabOrder = 1
        OnClick = rbConteudoDinamicoClick
      end
      object edtPalavraSenha: TEdit
        Left = 232
        Top = 22
        Width = 137
        Height = 21
        MaxLength = 20
        TabOrder = 2
      end
      object pnlCampo: TPanel
        Left = 35
        Top = 66
        Width = 337
        Height = 90
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Enabled = False
        TabOrder = 3
        object rbDtNasc: TRadioButton
          Left = 8
          Top = 64
          Width = 209
          Height = 17
          Caption = 'Data de nascimento no formato:'
          TabOrder = 2
          OnClick = rbDtNascClick
        end
        object rbMatricula: TRadioButton
          Left = 8
          Top = 8
          Width = 113
          Height = 17
          Caption = 'Matrícula'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbMatriculaClick
        end
        object cmbFormatoData: TComboBox
          Left = 213
          Top = 61
          Width = 116
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          Sorted = True
          TabOrder = 3
          Items.Strings = (
            'DDMMAA'
            'DDMMAAAA')
        end
        object rbLogin: TRadioButton
          Left = 8
          Top = 36
          Width = 113
          Height = 17
          Caption = 'Login'
          TabOrder = 1
          OnClick = rbLoginClick
        end
      end
    end
    object DbedtNOME: TwwDBEdit
      Left = 177
      Top = 32
      Width = 265
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBedtLogin: TwwDBEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBedtLoginChange
      OnExit = DBedtLoginExit
    end
    object BitBtn1: TBitBtn
      Left = 137
      Top = 32
      Width = 22
      Height = 22
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  inherited Dock971: TDock97
    Top = 251
    Width = 456
    inherited tb97Fundo: TToolbar97
      Left = 284
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 115
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 342
    Top = 191
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 192
  end
  object dbWeb: TCMDatabase
    DatabaseName = 'dbWeb'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=refer'
      'USER NAME=CM'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=TRUE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=CMSOL')
    SessionName = 'Default'
    Left = 192
    Top = 180
  end
  object MsLogin: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Login Pessoal'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'WEBACESSO.LOGINPESSOAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Login Pessoal'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'WEBACESSO')
    CamposChave.Strings = (
      'WEBACESSO.IDPESSOA'
      'WEBACESSO.LOGINPESSOAL'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PESSOA.IDPESSOA = WEBACESSO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '20'
      '45')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 280
    Top = 128
  end
end
