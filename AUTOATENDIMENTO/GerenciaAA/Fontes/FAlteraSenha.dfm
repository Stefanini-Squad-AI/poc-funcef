inherited frmAlteraSenha: TfrmAlteraSenha
  Left = 385
  Top = 220
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Alteração da Senha do Participante'
  ClientHeight = 317
  ClientWidth = 456
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 456
    Height = 278
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
      TabOrder = 3
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
        Width = 350
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
          Left = 221
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
      TabOrder = 2
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        AE040000424DAE0400000000000036040000280000000A0000000A0000000100
        080000000000780000008F0000008F0000000001000000000000FFFFFF00FFFF
        00000080800000000000FFFFFF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030304040404
        0404040400000302030404040404040400000403020304040404040400000404
        0302030303030304000004040403030104010303000004040403010401040103
        0000040404030401040104030000040404030404040401030000040404030304
        040103030000040404040303030303040000}
    end
    object chkBloqueada: TCheckBox
      Left = 14
      Top = 246
      Width = 139
      Height = 17
      Caption = 'Senha bloqueada.'
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Left = 181
      Top = 246
      Width = 265
      Height = 17
      Caption = 'Exigir troca de senha na próxima conexão.'
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 278
    Width = 456
    inherited tb97Fundo: TToolbar97
      Left = 286
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 119
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
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
      'WEBACESSO.IDPESSOA = ELEGPATRO.IDPESSOA'
      'WEBACESSO.IDPESSOA = PESSOA.IDPESSOA')
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
    Left = 408
    Top = 80
  end
end
