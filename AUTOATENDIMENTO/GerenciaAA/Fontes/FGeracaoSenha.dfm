inherited frmGeracaoSenha: TfrmGeracaoSenha
  Left = 165
  Top = 58
  HelpContext = 4650012
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Geração Automática de Senha'
  ClientHeight = 464
  ClientWidth = 530
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 530
    Height = 425
    object PageControl: TPageControl
      Left = 1
      Top = 181
      Width = 528
      Height = 202
      ActivePage = tbsDefinido
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tbsDefinido: TTabSheet
        Caption = 'Conteúdo definido'
        object grpConteudo: TGroupBox
          Left = 0
          Top = 0
          Width = 510
          Height = 165
          Caption = 'Definição de conteúdo'
          TabOrder = 0
          object rbConteudoUnico: TRadioButton
            Left = 16
            Top = 21
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
            Top = 45
            Width = 209
            Height = 17
            Caption = 'Preencher senhas com o campo:'
            TabOrder = 1
            OnClick = rbConteudoDinamicoClick
          end
          object edtPalavraSenha: TEdit
            Left = 232
            Top = 19
            Width = 137
            Height = 21
            MaxLength = 20
            TabOrder = 2
          end
          object pnlCampo: TPanel
            Left = 35
            Top = 63
            Width = 462
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
              TabOrder = 0
              OnClick = rbDtNascClick
            end
            object rbMatricula: TRadioButton
              Left = 8
              Top = 8
              Width = 113
              Height = 17
              Caption = 'Matrícula'
              Checked = True
              TabOrder = 1
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
              TabOrder = 2
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
              TabOrder = 3
              OnClick = rbLoginClick
            end
          end
        end
      end
      object tbsAleatorio: TTabSheet
        Caption = 'Conteúdo Aleatório'
        ImageIndex = 1
        object grpCompoSenha: TGroupBox
          Left = 0
          Top = 0
          Width = 510
          Height = 165
          Caption = 'Composição da Senha'
          TabOrder = 0
          object lblNumMin: TLabel
            Left = 10
            Top = 20
            Width = 176
            Height = 13
            Caption = 'Número Mínimo de Caracteres:'
          end
          object lblNumMax: TLabel
            Left = 9
            Top = 45
            Width = 177
            Height = 13
            Caption = 'Número Máximo de Caracteres:'
          end
          object edtNumMin: TEdit
            Left = 195
            Top = 18
            Width = 62
            Height = 21
            TabOrder = 0
            OnKeyPress = edtNumMinKeyPress
          end
          object edtNumMax: TEdit
            Left = 195
            Top = 42
            Width = 62
            Height = 21
            TabOrder = 1
            OnKeyPress = edtNumMaxKeyPress
          end
          object cbMaiusculas: TCheckBox
            Left = 10
            Top = 68
            Width = 129
            Height = 17
            Caption = 'Todas maiúsculas.'
            TabOrder = 2
          end
          object cbComecaComChar: TCheckBox
            Left = 196
            Top = 68
            Width = 169
            Height = 17
            Caption = 'Começando com caracter.'
            TabOrder = 3
          end
          object rgbTipoSenha: TRadioGroup
            Left = 8
            Top = 89
            Width = 494
            Height = 67
            Caption = 'Senha composta por...'
            ItemIndex = 0
            Items.Strings = (
              '...caracteres e números.'
              '...somente caracteres.'
              '...somente números.')
            TabOrder = 4
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 528
      Height = 180
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object grpOpcoesGeracao: TGroupBox
        Left = 5
        Top = 64
        Width = 508
        Height = 97
        Caption = 'Gerar senhas...'
        TabOrder = 1
        object rbTodos: TRadioButton
          Left = 9
          Top = 18
          Width = 233
          Height = 17
          Caption = '...para todos os registros.'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbTodosClick
        end
        object rbLOGINPESSOAL: TRadioButton
          Left = 258
          Top = 18
          Width = 105
          Height = 17
          Caption = '...para o login:'
          TabOrder = 0
          OnClick = rbLOGINPESSOALClick
        end
        object edtLOGINPESSOAL: TEdit
          Left = 363
          Top = 16
          Width = 134
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object rbQuery: TRadioButton
          Left = 8
          Top = 44
          Width = 249
          Height = 17
          Caption = '...para os login'#39's retornados pela query:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = rbQueryClick
        end
        object memQuery: TMemo
          Left = 258
          Top = 43
          Width = 241
          Height = 40
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
      object rbgrpOperacao: TRadioGroup
        Left = 5
        Top = 3
        Width = 508
        Height = 59
        Caption = 'Operação'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Geração com criptografia'
          'Geração sem criptografia'
          'Criptografia'
          'Decriptografia')
        TabOrder = 0
        OnClick = rbgrpOperacaoClick
      end
      object cbTeste: TCheckBox
        Left = 6
        Top = 161
        Width = 379
        Height = 17
        Caption = 'Testar após cada registro.'
        TabOrder = 2
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 383
      Width = 528
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lblTotal: TLabel
        Left = 8
        Top = 4
        Width = 185
        Height = 13
        AutoSize = False
        Caption = 'Registros selecionados: 123456'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblAlterados: TLabel
        Left = 352
        Top = 4
        Width = 162
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Registros alterados: 123456'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object pgbProgresso: TProgressBar
        Left = 8
        Top = 20
        Width = 505
        Height = 16
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 0
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 530
    inherited tb97Fundo: TToolbar97
      Left = 358
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 189
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 326
    Top = 183
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsWebAcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 355
    Top = 183
  end
  object cdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 354
    Top = 213
  end
end
