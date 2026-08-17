inherited frmWebConfiguracao: TfrmWebConfiguracao
  Left = 281
  Top = 111
  HelpContext = 4650004
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parâmetros do Auto-Atendimento'
  ClientHeight = 446
  ClientWidth = 650
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 407
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 648
      Height = 405
      ActivePage = tabGerais
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tabGerais: TTabSheet
        Caption = 'Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object lblFundacao: TLabel
          Left = 16
          Top = 16
          Width = 233
          Height = 13
          AutoSize = False
          Caption = 'Fundação'
        end
        object lblNomeBase: TLabel
          Left = 16
          Top = 72
          Width = 353
          Height = 13
          AutoSize = False
          Caption = 'Nome da base (identificação para transferências de dados):'
          FocusControl = dbedtNomeBase
        end
        object dblkpEmpresaProp: TDBLookupComboBox
          Left = 16
          Top = 32
          Width = 535
          Height = 21
          DataField = 'IDFUNDACAO'
          DataSource = dtsWebConfiguracao
          KeyField = 'IDPESSOA'
          ListField = 'NOMEEMPRESA'
          ListSource = dtsEmpresaProp
          TabOrder = 0
        end
        object dbedtNomeBase: TDBEdit
          Left = 16
          Top = 88
          Width = 535
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOMEBASE'
          DataSource = dtsWebConfiguracao
          TabOrder = 1
        end
      end
      object tabSenha: TTabSheet
        Caption = 'Senha'
        ImageIndex = 2
        object lblTxtSenhaMin: TLabel
          Left = 16
          Top = 16
          Width = 161
          Height = 13
          AutoSize = False
          Caption = 'Tamanho mínimo da senha:'
        end
        object lblTxtSenhaMax: TLabel
          Left = 16
          Top = 68
          Width = 161
          Height = 13
          AutoSize = False
          Caption = 'Tamanho máximo da senha:'
        end
        object lblTxtNumSenhaBlq: TLabel
          Left = 364
          Top = 16
          Width = 269
          Height = 13
          AutoSize = False
          Caption = 'Número de tentativas de conexão até bloqueio:'
        end
        object edtSenhaMin: TEdit
          Left = 16
          Top = 32
          Width = 73
          Height = 21
          TabOrder = 0
          Text = '3'
          OnExit = edtSenhaMinExit
          OnKeyPress = edtSenhaMinKeyPress
        end
        object updSenhaMin: TUpDown
          Left = 89
          Top = 32
          Width = 16
          Height = 21
          Associate = edtSenhaMin
          Min = 3
          Max = 20
          Position = 3
          TabOrder = 1
          Thousands = False
          Wrap = False
        end
        object edtSenhaMax: TEdit
          Left = 16
          Top = 84
          Width = 73
          Height = 21
          TabOrder = 2
          Text = '20'
          OnExit = edtSenhaMaxExit
          OnKeyPress = edtSenhaMaxKeyPress
        end
        object updSenhaMax: TUpDown
          Left = 89
          Top = 84
          Width = 16
          Height = 21
          Associate = edtSenhaMax
          Min = 3
          Max = 20
          Position = 20
          TabOrder = 3
          Thousands = False
          Wrap = False
        end
        object dbchkSenhaCripto: TDBCheckBox
          Left = 364
          Top = 89
          Width = 227
          Height = 17
          Caption = 'Senha criptografada.'
          DataField = 'SENHACRIPTO'
          DataSource = dtsWebConfiguracao
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkSenhaCase: TDBCheckBox
          Left = 364
          Top = 61
          Width = 226
          Height = 17
          Caption = 'Distinguir maiúsculas / minúsculas.'
          DataField = 'SENHACASE'
          DataSource = dtsWebConfiguracao
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edtNumSenhaBlq: TEdit
          Left = 364
          Top = 32
          Width = 73
          Height = 21
          TabOrder = 4
          Text = '0'
          OnExit = edtNumSenhaBlqExit
          OnKeyPress = edtNumSenhaBlqKeyPress
        end
        object updNumSenhaBlq: TUpDown
          Left = 437
          Top = 32
          Width = 16
          Height = 21
          Associate = edtNumSenhaBlq
          Min = 0
          Max = 10
          Position = 0
          TabOrder = 5
          Thousands = False
          Wrap = False
        end
        object rgrEnvio: TDBRadioGroup
          Left = 16
          Top = 120
          Width = 609
          Height = 89
          Caption = 'Forma de envio da senha na opção "Esqueci minha Senha"'
          DataField = 'FLGENVIOSENHA'
          DataSource = dtsWebConfiguracao
          Items.Strings = (
            'Lembrete na tela   (RECOMENDÁVEL)'
            'E-mail do usuário')
          TabOrder = 8
          Values.Strings = (
            'L'
            'E')
          OnChange = rgrEnvioChange
        end
        object grpMsgContexto: TGroupBox
          Left = 16
          Top = 216
          Width = 609
          Height = 121
          Caption = 'Configuração para envio de senha para o e-mail do usuário'
          TabOrder = 9
          object lblEmailConexao: TLabel
            Left = 33
            Top = 33
            Width = 118
            Height = 13
            Caption = 'Conexão com e-mail:'
          end
          object lblAssuntoMsg: TLabel
            Left = 32
            Top = 97
            Width = 132
            Height = 13
            Caption = 'Assunto da Mensagem:'
          end
          object Label5: TLabel
            Left = 32
            Top = 64
            Width = 132
            Height = 13
            Caption = 'Mensagem pré-definida'
          end
          object dblkpConexaEmail: TwwDBLookupCombo
            Left = 176
            Top = 25
            Width = 414
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'IDEMAILCONEXAO'
            DataSource = dtsMsgContexto
            LookupTable = cdsEmailConexao
            LookupField = 'IDEMAILCONEXAO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dbedtAssuntoMsg: TDBEdit
            Left = 176
            Top = 92
            Width = 412
            Height = 21
            DataField = 'ASSUNTOMSG'
            DataSource = dtsMsgContexto
            TabOrder = 1
          end
          object dblkpMsgPreDef: TwwDBLookupCombo
            Left = 176
            Top = 57
            Width = 414
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'IDMSGPREDEF'
            DataSource = dtsMsgContexto
            LookupTable = cdsMsgPreDef
            LookupField = 'IDMSGPREDEF'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Button1: TButton
            Left = 352
            Top = 0
            Width = 75
            Height = 17
            Caption = 'Teste'
            TabOrder = 3
            Visible = False
            OnClick = Button1Click
          end
        end
      end
      object tabAcessos: TTabSheet
        Caption = 'Acessos'
        ImageIndex = 2
        object GroupBox1: TGroupBox
          Left = 80
          Top = 16
          Width = 425
          Height = 145
          Caption = ' Acesso Master '
          TabOrder = 0
          object lblLoginMaster: TLabel
            Left = 16
            Top = 16
            Width = 78
            Height = 13
            Caption = 'Login Master:'
            FocusControl = dbedtLOGINMASTER
          end
          object lblSenhMaster: TLabel
            Left = 16
            Top = 72
            Width = 79
            Height = 13
            Caption = 'Senha Master'
          end
          object dbedtLOGINMASTER: TDBEdit
            Left = 16
            Top = 32
            Width = 377
            Height = 21
            DataField = 'LOGINMASTER'
            DataSource = dtsWebConfiguracao
            TabOrder = 0
          end
          object edtSenhaMaster: TEdit
            Left = 16
            Top = 88
            Width = 377
            Height = 21
            PasswordChar = '*'
            TabOrder = 1
          end
        end
        object gbAutoEmprestimo: TGroupBox
          Left = 80
          Top = 176
          Width = 425
          Height = 161
          Caption = ' Acesso Auto-Empréstimo'
          TabOrder = 1
          object Label7: TLabel
            Left = 16
            Top = 16
            Width = 36
            Height = 13
            Caption = 'Login:'
            FocusControl = dbedtLOGINAUTOEMP
          end
          object Label8: TLabel
            Left = 16
            Top = 72
            Width = 37
            Height = 13
            Caption = 'Senha'
          end
          object dbedtLOGINAUTOEMP: TDBEdit
            Left = 16
            Top = 32
            Width = 377
            Height = 21
            DataField = 'LOGINAUTOEMP'
            DataSource = dtsWebConfiguracao
            TabOrder = 0
          end
          object edtSenhaAutoEmp: TEdit
            Left = 16
            Top = 88
            Width = 377
            Height = 21
            PasswordChar = '*'
            TabOrder = 1
          end
          object chkAutoEmprestimo: TDBCheckBox
            Left = 18
            Top = 128
            Width = 226
            Height = 17
            Caption = 'Ativar Auto-Empréstimo'
            DataField = 'FLGATIVOAUTOEMP'
            DataSource = dtsWebConfiguracao
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tabModulos: TTabSheet
        Caption = 'Módulos'
        ImageIndex = 3
        object dbchkFlgCtrChqAtv: TDBCheckBox
          Left = 11
          Top = 16
          Width = 406
          Height = 17
          Caption = 'Disponibilizar Contra-Cheques apenas para participantes ativos.'
          DataField = 'FLGCTRCHQATV'
          DataSource = dtsWebConfiguracao
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkFlgInfRendAtv: TDBCheckBox
          Left = 11
          Top = 56
          Width = 438
          Height = 17
          Caption = 
            'Disponibilizar Informe de Rendimentos apenas para participantes ' +
            'ativos.'
          DataField = 'FLGINFRENDATV'
          DataSource = dtsWebConfiguracao
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkFlgExtEmpAtv: TDBCheckBox
          Left = 11
          Top = 96
          Width = 430
          Height = 17
          Caption = 
            'Disponibilizar Extrato de Empréstimos apenas para empréstimos at' +
            'ivos.'
          DataField = 'FLGEXTEMPTMOATV'
          DataSource = dtsWebConfiguracao
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tabExportacaoSenhas: TTabSheet
        Caption = 'Exportação de Senhas'
        ImageIndex = 4
        object Label1: TLabel
          Left = 17
          Top = 11
          Width = 382
          Height = 13
          Caption = 
            'Texto a ser inserido no início do arquivo de exportação de senha' +
            's:'
        end
        object Label2: TLabel
          Left = 17
          Top = 136
          Width = 374
          Height = 13
          Caption = 
            'Texto a ser inserido no final do arquivo de exportação de senhas' +
            ':'
        end
        object dbmemPreTextExporta: TDBMemo
          Left = 16
          Top = 30
          Width = 600
          Height = 80
          DataField = 'PRETEXTOEXPORTA'
          DataSource = dtsWebConfiguracao
          TabOrder = 0
        end
        object dbmemPosTextExporta: TDBMemo
          Left = 16
          Top = 157
          Width = 600
          Height = 80
          DataField = 'POSTEXTOEXPORTA'
          DataSource = dtsWebConfiguracao
          TabOrder = 1
        end
      end
      object tbsNovoUsuario: TTabSheet
        Caption = 'Validação de Usuário e Geração de Login'
        ImageIndex = 5
        object PageControl1: TPageControl
          Left = 8
          Top = 24
          Width = 625
          Height = 321
          ActivePage = TabSheet2
          TabOrder = 0
          object TabSheet2: TTabSheet
            Caption = 'Geração do login do novo usuário'
            ImageIndex = 1
            object Label3: TLabel
              Left = 8
              Top = 22
              Width = 45
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Regra:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object spbRegraLogin: TSpeedButton
              Left = 563
              Top = 38
              Width = 23
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                0E030000424D0E030000000000003600000028000000110000000E0000000100
                180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
                FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
                2121000000000000000000000000FFFFFF000000000000000000636363212121
                000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
                0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
                FF000000C6C6C642424200000000000000000031313100000000000063636363
                6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
                0000000000000063636300000000000063636363636342424200000000000000
                0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
                00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
                0000002121210000000000000000000000000000000000000000000000002121
                21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
                000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
                000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
                0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
              ParentFont = False
              OnClick = spbRegraLoginClick
            end
            object spbLimpaRegraLogin: TSpeedButton
              Left = 586
              Top = 38
              Width = 22
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spbLimpaRegraLoginClick
            end
            object Label4: TLabel
              Left = 8
              Top = 69
              Width = 109
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Query de Entrada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtRegraLogin: TEdit
              Left = 14
              Top = 38
              Width = 549
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbmemQRYLOGIN: TDBMemo
              Left = 14
              Top = 86
              Width = 595
              Height = 195
              DataField = 'QRYLOGIN'
              DataSource = dtsWebConfiguracao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'Validação de dados do usuário'
            object lblIDREGRAVALIDA: TLabel
              Left = 8
              Top = 22
              Width = 45
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Regra:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object spbRegra: TSpeedButton
              Left = 563
              Top = 38
              Width = 23
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                0E030000424D0E030000000000003600000028000000110000000E0000000100
                180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
                FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
                2121000000000000000000000000FFFFFF000000000000000000636363212121
                000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
                0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
                FF000000C6C6C642424200000000000000000031313100000000000063636363
                6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
                0000000000000063636300000000000063636363636342424200000000000000
                0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
                00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
                0000002121210000000000000000000000000000000000000000000000002121
                21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
                000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
                000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
                0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
              ParentFont = False
              OnClick = spbRegraClick
            end
            object spbLimpa: TSpeedButton
              Left = 586
              Top = 38
              Width = 22
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spbLimpaClick
            end
            object lblQUERYVALIDA: TLabel
              Left = 8
              Top = 69
              Width = 109
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Query de Entrada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtNOMEREGRA: TEdit
              Left = 14
              Top = 38
              Width = 549
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbmemQRYNOVOUSU: TDBMemo
              Left = 14
              Top = 86
              Width = 595
              Height = 195
              DataField = 'QRYNOVOUSU'
              DataSource = dtsWebConfiguracao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Permissão de acesso do usuário'
            ImageIndex = 2
            object Label6: TLabel
              Left = 16
              Top = 21
              Width = 593
              Height = 13
              AutoSize = False
              Caption = 
                'Query de Entrada (As regras são definidas na configuração de pág' +
                'inas e campos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbmemQRYACESSO: TDBMemo
              Left = 14
              Top = 40
              Width = 595
              Height = 241
              DataField = 'QRYACESSO'
              DataSource = dtsWebConfiguracao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 650
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 255
    Top = 367
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsWebConfiguracao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 367
    object cdsWebConfiguracaoIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
    object cdsWebConfiguracaoNOMEBASE: TStringField
      FieldName = 'NOMEBASE'
      Size = 10
    end
    object cdsWebConfiguracaoSENHAMIN: TFloatField
      FieldName = 'SENHAMIN'
    end
    object cdsWebConfiguracaoSENHAMAX: TFloatField
      FieldName = 'SENHAMAX'
    end
    object cdsWebConfiguracaoSENHACASE: TStringField
      FieldName = 'SENHACASE'
      Size = 1
    end
    object cdsWebConfiguracaoSENHACRIPTO: TStringField
      FieldName = 'SENHACRIPTO'
      Size = 1
    end
    object cdsWebConfiguracaoLOGINMASTER: TStringField
      FieldName = 'LOGINMASTER'
    end
    object cdsWebConfiguracaoSENHAMASTER: TStringField
      FieldName = 'SENHAMASTER'
    end
    object cdsWebConfiguracaoFLGCTRCHQATV: TStringField
      FieldName = 'FLGCTRCHQATV'
      Size = 1
    end
    object cdsWebConfiguracaoFLGINFRENDATV: TStringField
      FieldName = 'FLGINFRENDATV'
      Size = 1
    end
    object cdsWebConfiguracaoFLGEXTEMPTMOATV: TStringField
      FieldName = 'FLGEXTEMPTMOATV'
      Size = 1
    end
    object cdsWebConfiguracaoNUMSENHABLQ: TFloatField
      FieldName = 'NUMSENHABLQ'
    end
    object cdsWebConfiguracaoPRETEXTOEXPORTA: TStringField
      FieldName = 'PRETEXTOEXPORTA'
      Size = 200
    end
    object cdsWebConfiguracaoPOSTEXTOEXPORTA: TStringField
      FieldName = 'POSTEXTOEXPORTA'
      Size = 200
    end
    object cdsWebConfiguracaoQRYNOVOUSU: TBlobField
      FieldName = 'QRYNOVOUSU'
      BlobType = ftBlob
      Size = 4000
    end
    object cdsWebConfiguracaoREGRANOVOUSU: TFloatField
      FieldName = 'REGRANOVOUSU'
    end
    object cdsWebConfiguracaoREGRALOGIN: TFloatField
      FieldName = 'REGRALOGIN'
    end
    object cdsWebConfiguracaoQRYLOGIN: TBlobField
      FieldName = 'QRYLOGIN'
      BlobType = ftBlob
      Size = 4000
    end
    object cdsWebConfiguracaoQRYACESSO: TBlobField
      FieldName = 'QRYACESSO'
      BlobType = ftBlob
      Size = 4000
    end
    object cdsWebConfiguracaoFLGENVIOSENHA: TStringField
      FieldName = 'FLGENVIOSENHA'
    end
    object cdsWebConfiguracaoLOGINAUTOEMP: TStringField
      FieldName = 'LOGINAUTOEMP'
    end
    object cdsWebConfiguracaoSENHAAUTOEMP: TStringField
      FieldName = 'SENHAAUTOEMP'
    end
    object cdsWebConfiguracaoFLGATIVOAUTOEMP: TStringField
      FieldName = 'FLGATIVOAUTOEMP'
      FixedChar = True
      Size = 1
    end
  end
  object dtsWebConfiguracao: TDataSource
    DataSet = cdsWebConfiguracao
    Left = 56
    Top = 368
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 368
    object cdsEmpresaPropIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsEmpresaPropNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 60
    end
  end
  object dtsEmpresaProp: TDataSource
    DataSet = cdsEmpresaProp
    Left = 184
    Top = 368
  end
  object msRegra: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Regra'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Id. Regra'
      'Nome da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 312
    Top = 367
  end
  object cdsMsgContexto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 367
    object cdsMsgContextoIDMSGCONTEXTO: TFloatField
      FieldName = 'IDMSGCONTEXTO'
    end
    object cdsMsgContextoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object cdsMsgContextoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsMsgContextoIDEMAILCONEXAO: TFloatField
      FieldName = 'IDEMAILCONEXAO'
    end
    object cdsMsgContextoFLGCONFIGPROPRIA: TFloatField
      FieldName = 'FLGCONFIGPROPRIA'
    end
    object cdsMsgContextoFLGTIPOENVIO: TFloatField
      FieldName = 'FLGTIPOENVIO'
    end
    object cdsMsgContextoASSUNTOMSG: TStringField
      FieldName = 'ASSUNTOMSG'
      Size = 100
    end
    object cdsMsgContextoIDMSGPREDEF: TFloatField
      FieldName = 'IDMSGPREDEF'
    end
  end
  object dtsMsgContexto: TDataSource
    DataSet = cdsMsgContexto
    Left = 432
    Top = 368
  end
  object cdsEmailConexao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 520
    Top = 368
  end
  object cdsMsgPreDef: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 576
    Top = 368
  end
  object sqlAutoEmprestimo: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMODULO'
      '    FROM MODULO'
      ' WHERE IDMODULO = 739')
    ClientDataSet = cdsAutoEmprestimo
    Left = 493
    Top = 281
  end
  object cdsAutoEmprestimo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 493
    Top = 265
  end
end
