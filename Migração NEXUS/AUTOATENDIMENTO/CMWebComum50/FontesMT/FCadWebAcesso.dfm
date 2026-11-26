inherited frmCadWebAcesso: TfrmCadWebAcesso
  Left = 502
  Top = 138
  HelpContext = 4650013
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Acesso ao Auto-Atendimento'
  ClientHeight = 447
  ClientWidth = 470
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 470
    Height = 408
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 468
      Height = 62
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object grpUsuario: TGroupBox
        Left = 5
        Top = 1
        Width = 450
        Height = 61
        Caption = 'Usuário'
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 14
          Width = 32
          Height = 13
          Caption = 'Login'
        end
        object Label2: TLabel
          Left = 139
          Top = 14
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object DBedtLogin: TwwDBEdit
          Left = 9
          Top = 29
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DbedtNOME: TwwDBEdit
          Left = 139
          Top = 29
          Width = 280
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object btnProcurar: TBitBtn
          Left = 419
          Top = 29
          Width = 22
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnProcurarClick
          Glyph.Data = {
            AE040000424DAE0400000000000036040000280000000A0000000A0000000100
            080000000000780000008F0000008F0000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070007070707
            0707070700000003000707070707070700000700030007070707070700000707
            000300000000000700000707070000FEFFFE0000000007070700FEFFFEFFFE00
            000007070700FFFEFFFEFF00000007070700FFFFFFFFFE0000000707070000FF
            FFFE00000000070707070000000000070000}
        end
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 63
      Width = 468
      Height = 344
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Login: TGroupBox
        Left = 5
        Top = 2
        Width = 450
        Height = 72
        Caption = 'Login'
        TabOrder = 0
        object rbMatricLogin: TRadioButton
          Left = 8
          Top = 15
          Width = 113
          Height = 17
          Caption = 'Matrícula'
          TabOrder = 0
          OnClick = rbMatricLoginClick
        end
        object rbInscLogin: TRadioButton
          Left = 8
          Top = 31
          Width = 113
          Height = 17
          Caption = 'Inscrição'
          TabOrder = 1
          OnClick = rbInscLoginClick
        end
        object rbOutro: TRadioButton
          Left = 8
          Top = 47
          Width = 113
          Height = 17
          Caption = 'Outro conteúdo:'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbOutroClick
        end
        object edtConteudo: TEdit
          Left = 127
          Top = 44
          Width = 315
          Height = 21
          TabOrder = 3
        end
      end
      object grpStatus: TRadioGroup
        Left = 5
        Top = 261
        Width = 450
        Height = 70
        Caption = 'Status da conexão'
        Items.Strings = (
          'Senha desbloqueada.'
          'Senha bloqueada.'
          'Exigir troca de senha na próxima conexão.')
        TabOrder = 2
      end
      object PageControl: TPageControl
        Left = 5
        Top = 80
        Width = 451
        Height = 177
        ActivePage = tbsDefinido
        TabOrder = 1
        TabPosition = tpBottom
        object tbsDefinido: TTabSheet
          Caption = 'Conteúdo definido'
          object Senha: TGroupBox
            Left = 3
            Top = -2
            Width = 428
            Height = 145
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Senha'
            TabOrder = 0
            object rbConteudoUnico: TRadioButton
              Left = 9
              Top = 18
              Width = 217
              Height = 17
              Caption = 'Preencher a senha com a palavra:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbConteudoUnicoClick
            end
            object rbConteudoDinamico: TRadioButton
              Left = 9
              Top = 39
              Width = 209
              Height = 17
              Caption = 'Preencher a senha com o campo:'
              TabOrder = 1
              OnClick = rbConteudoDinamicoClick
            end
            object pnlCampo: TPanel
              Left = 28
              Top = 57
              Width = 394
              Height = 75
              BevelInner = bvLowered
              BevelOuter = bvSpace
              Enabled = False
              TabOrder = 2
              object rbDtNasc: TRadioButton
                Left = 8
                Top = 48
                Width = 203
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
                Left = 214
                Top = 45
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
                Top = 28
                Width = 113
                Height = 17
                Caption = 'Login'
                TabOrder = 1
                OnClick = rbLoginClick
              end
            end
            object edtSenha: TwwDBEdit
              Left = 231
              Top = 16
              Width = 190
              Height = 21
              PasswordChar = '*'
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = edtSenhaChange
            end
          end
        end
        object tbsAleatorio: TTabSheet
          Caption = 'Conteúdo Aleatório'
          ImageIndex = 1
          object grpCompoSenha: TGroupBox
            Left = 3
            Top = -2
            Width = 435
            Height = 145
            Caption = 'Composição da Senha'
            TabOrder = 0
            object lblNumMin: TLabel
              Left = 10
              Top = 20
              Width = 129
              Height = 13
              Caption = 'Mínimo de Caracteres:'
            end
            object lblNumMax: TLabel
              Left = 9
              Top = 45
              Width = 130
              Height = 13
              Caption = 'Máximo de Caracteres:'
            end
            object edtNumMin: TEdit
              Left = 142
              Top = 18
              Width = 35
              Height = 21
              TabOrder = 0
              OnKeyPress = edtNumMinKeyPress
            end
            object edtNumMax: TEdit
              Left = 142
              Top = 42
              Width = 35
              Height = 21
              TabOrder = 1
              OnKeyPress = edtNumMaxKeyPress
            end
            object cbMaiusculas: TCheckBox
              Left = 258
              Top = 20
              Width = 129
              Height = 17
              Caption = 'Todas maiúsculas.'
              TabOrder = 3
            end
            object cbComecaComChar: TCheckBox
              Left = 258
              Top = 44
              Width = 169
              Height = 17
              Caption = 'Começando com caracter.'
              TabOrder = 2
            end
            object rgbTipoSenha: TRadioGroup
              Left = 10
              Top = 67
              Width = 415
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
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 470
    inherited tb97Fundo: TToolbar97
      Left = 298
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 129
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object btnExclui: TBitBtn
      Left = 2
      Top = 1
      Width = 114
      Height = 35
      Caption = 'E&xcluir Acesso'
      Enabled = False
      TabOrder = 2
      OnClick = btnExcluiClick
      Glyph.Data = {
        26050000424D260500000000000036040000280000000F0000000F0000000100
        080000000000F0000000120B0000120B0000000100001D00000000000000CCCC
        CC008484840066666600A4A4A40052525200FFFFFF0044444400737373003333
        330099999900BBBBBB00E3E3E3002A2A2A00B5B5B5001E1E1E005A5A5A007A7A
        7A004A4A4A00DDDDDD008C8C8C00EEEEEE00AEAEAE00C5C5C5003A3A3A006666
        660099999900F8F8F8000A0A0A00000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000060606060E11
        0D0D0F111706060606000606060E10020A0411030D0106060600060606030A14
        10081003050B060606000606151102030308101205100606060006060E020308
        180A18100503060606000606040A1011031305030510150606000606080A0814
        1217120807050E0606000606080803160716030907050B060600061702031104
        11081114031208060600060B0302101212120907100510060600061718031011
        0A0A020309070506060006020202040A0B0B0E04040318010600060E05171600
        18051C180C02031506000606011102111008100A08041B060600060606061610
        12070502150606060600}
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 251
    Top = 83
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'LOGINPESSOAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SENHAPESSOAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DTALTERA'
        DataType = ftDateTime
      end
      item
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 316
    Top = 159
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsLOGINPESSOAL: TStringField
      FieldName = 'LOGINPESSOAL'
    end
    object CdsSENHAPESSOAL: TStringField
      FieldName = 'SENHAPESSOAL'
    end
    object CdsDTALTERA: TDateTimeField
      FieldName = 'DTALTERA'
    end
    object CdsIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object CdsFLGSTATUS: TFloatField
      FieldName = 'FLGSTATUS'
    end
    object CdsNUMTENTACESS: TFloatField
      FieldName = 'NUMTENTACESS'
    end
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 310
    Top = 79
  end
  object cdsWebConfig: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 374
    Top = 84
    object cdsWebConfigSENHACRIPTO: TStringField
      FieldName = 'SENHACRIPTO'
      FixedChar = True
      Size = 1
    end
  end
  object MsLogin: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'WEBACESSO.LOGINPESSOAL'
      'PESSOA.NOME'
      
        'DECODE( DEPENTIT.IDPESSOA, DEPENTIT.IDTITULAR, '#39'TITULAR'#39', '#39'DEPEN' +
        'DENTE'#39' )')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Login Pessoal'
      'Nome'
      'Tipo de Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'WEBACESSO'
      'DEPENTIT')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA AS C4'
      'WEBACESSO.LOGINPESSOAL AS C5'
      'PESSOA.NOME AS C6'
      'DEPENTIT.IDTITULAR AS C7'
      'WEBACESSO.IDTITULAR AS C8')
    Filtro.Strings = (
      'DEPENTIT.IDPESSOA = PESSOA.IDPESSOA'
      'WEBACESSO.IDPESSOA (+)= DEPENTIT.IDPESSOA'
      'WEBACESSO.IDTITULAR (+)= DEPENTIT.IDTITULAR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '20'
      '45'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 352
    Top = 8
  end
end
