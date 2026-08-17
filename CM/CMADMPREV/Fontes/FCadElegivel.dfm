inherited frmCadElegivel: TfrmCadElegivel
  Top = 8
  BorderIcons = [biMinimize, biMaximize, biHelp]
  Caption = 'Elegivel'
  ClientHeight = 625
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 539
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 54
      Height = 484
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados Pessoais'
        'Dados Funcionais'
        'Planos Previdenciários'
        'Contas Bancárias'
        'Fundações'
        'Outras Informações'
        'Representante Legal'
        'Perfil de Investimento')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        'dbgrdElegivel'
        'dbgrdPlanosPrev'
        'dbgrdContaBancaria'
        'dbgrdFundacoes'
        'dbgrdOutrasInforms'
        'dbgrdReprLegal'
        'dbgrdPerfilinvest')
      inherited pgctrlDetalhe: TPageControl
        Height = 425
        ActivePage = tbsPlanosPrev
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 397
            ActivePage = TbsDadosPessoais_Padrao
            inherited TbsDadosPessoais_Padrao: TTabSheet
              inherited EdtvlrPensao_Padrao: TDBRealEdit
                Lines.Strings = (
                  '0,00')
              end
              inherited EdtlrlINSS_Padrao: TDBRealEdit
                Lines.Strings = (
                  '0,00')
              end
            end
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 397
            inherited lstDocumentos: TListView [0]
              Height = 395
              OnClick = lstDocumentosClick
            end
            inherited pnlItemsDoc: TPanel [1]
              Height = 395
              inherited pnlOrgao: TPanel
                inherited wwDBEdit1: TwwDBEdit
                  CharCase = ecUpperCase
                end
              end
              inherited pnlUF: TPanel
                inherited dbcmbEstadoDoc: TCMDBLookupCombo
                  CharCase = ecUpperCase
                end
              end
              inherited pnlNumDoc: TPanel
                inherited edDocNumDocumento: TwwDBEdit
                  CharCase = ecUpperCase
                  OnEnter = edDocNumDocumentoEnter
                end
              end
              inherited pnlCategoria: TPanel
                inherited edtCategoria: TwwDBEdit
                  CharCase = ecUpperCase
                end
              end
            end
            inherited pnlFoto: TPanel [2]
              Height = 395
              inherited Bevel1: TBevel
                Height = 429
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 429
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 429
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Height = 397
            Selected.Strings = (
              'NOME'#9'20'#9'Local'#9'F'
              'LOGRADOURO'#9'20'#9'Logradouro'#9'F'
              'TIPOEND_PADRAO'#9'20'#9'Tipo de Endereço'#9'F'
              'NUMERO'#9'8'#9'Número'#9'F'
              'COMPLEMENTO'#9'10'#9'Complemento'#9'F'
              'BAIRRO'#9'10'#9'Bairro'#9'F'
              'CEP'#9'10'#9'CEP'#9'F'
              'NOMECIDADE'#9'20'#9'Cidade'#9'F'
              'NOMEESTADO'#9'20'#9'Estado'#9'F'
              'NOMEPAIS'#9'20'#9'Pais'#9'F')
          end
          inherited pnlControlesDet: TPanel
            Height = 397
            inherited lblBairro: TLabel
              Left = 241
            end
            inherited lblPdPais: TLabel
              Left = 15
              Top = 171
            end
            object Label57: TLabel [9]
              Left = 402
              Top = 129
              Width = 17
              Height = 13
              Caption = 'UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited dbedNomeEndereco: TDBEdit
              CharCase = ecUpperCase
            end
            inherited dbedLogradouro: TDBEdit
              CharCase = ecUpperCase
            end
            inherited DBEDCOMPLEMENTO: TwwDBEdit
              CharCase = ecUpperCase
            end
            inherited dbedEstado: TwwDBEdit
              Left = 241
              CharCase = ecUpperCase
            end
            inherited dbedBairro: TwwDBEdit
              Left = 241
              CharCase = ecUpperCase
            end
            inherited DBNUMERO: TDBEdit
              CharCase = ecUpperCase
            end
            inherited dbedCEP: TwwDBEdit
              CharCase = ecUpperCase
            end
            inherited dbedPais: TwwDBEdit
              Left = 15
              Top = 184
              Width = 210
              CharCase = ecUpperCase
            end
            inherited cmbCidade: TCMDBLookupCombo
              CharCase = ecUpperCase
              Selected.Strings = (
                'NOMECIDADE'#9'40'#9'Cidade'#9'F'
                'CODESTADO'#9'3'#9'Estado'#9'F')
              OnCloseUp = cmbCidadeCloseUp
            end
            inherited grpTipoEnd: TGroupBox
              Height = 397
            end
            object dbeCodEstado: TwwDBEdit
              Left = 402
              Top = 142
              Width = 70
              Height = 21
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'CODESTADO'
              DataSource = dsEndereco
              ReadOnly = True
              TabOrder = 10
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object btnBuscarEndereco: TButton
              Left = 14
              Top = 224
              Width = 145
              Height = 25
              Caption = 'Buscar endereço'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              OnClick = btnBuscarEnderecoClick
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 397
          end
          inherited Panel1: TPanel
            Height = 397
            inherited GroupBox5: TGroupBox [3]
              Width = 415
              Height = 323
              inherited dbgTelefoneRamal: TwwDBGrid
                Left = 5
                Top = 49
                Width = 405
                Height = 114
                Selected.Strings = (
                  'NOME'#9'20'#9'Nome'#9'F'
                  'CARGO'#9'10'#9'Cargo'#9'F'
                  'SETOR'#9'10'#9'Setor'#9'F'
                  'EMAIL'#9'30'#9'Email'#9'F')
                DataSource = dsContatoTel
              end
              object Panel8: TPanel [1]
                Left = 1
                Top = 45
                Width = 413
                Height = 277
                TabOrder = 3
                object Label63: TLabel
                  Left = 14
                  Top = 6
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label64: TLabel
                  Left = 14
                  Top = 51
                  Width = 35
                  Height = 13
                  Caption = 'E-mail'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label65: TLabel
                  Left = 274
                  Top = 51
                  Width = 67
                  Height = 13
                  Caption = 'Nascimento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label66: TLabel
                  Left = 276
                  Top = 97
                  Width = 31
                  Height = 13
                  Caption = 'Setor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label67: TLabel
                  Left = 14
                  Top = 142
                  Width = 69
                  Height = 13
                  Caption = 'Observação'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label68: TLabel
                  Left = 14
                  Top = 97
                  Width = 34
                  Height = 13
                  Caption = 'Cargo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbedEmailContato: TDBEdit
                  Left = 14
                  Top = 65
                  Width = 208
                  Height = 21
                  CharCase = ecLowerCase
                  DataField = 'EMAIL'
                  DataSource = dsContato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object DBEdit8: TDBEdit
                  Left = 14
                  Top = 20
                  Width = 381
                  Height = 21
                  DataField = 'NOME'
                  DataSource = dsContato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CMDateTimePicker5: TCMDateTimePicker
                  Left = 274
                  Top = 65
                  Width = 121
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'NASCIMENTO'
                  DataSource = dsContato
                  Epoch = 1950
                  ButtonGlyph.Data = {
                    06050000424D06050000000000003604000028000000100000000D0000000100
                    080000000000D000000000000000000000000001000000000000000000000000
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
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                    000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                    A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                    FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                    04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                    000000000000000000FF}
                  ShowButton = True
                  TabOrder = 2
                end
                object DBEdit9: TDBEdit
                  Left = 274
                  Top = 112
                  Width = 121
                  Height = 21
                  DataField = 'SETOR'
                  DataSource = dsContato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object DBEdit10: TDBEdit
                  Left = 15
                  Top = 112
                  Width = 205
                  Height = 21
                  DataField = 'CARGO'
                  DataSource = dsContato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object DBMemo3: TDBMemo
                  Left = 14
                  Top = 156
                  Width = 380
                  Height = 54
                  DataField = 'OBS'
                  DataSource = dsContato
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  OnKeyPress = DBMemoKeyPress
                end
                object BitBtn2: TBitBtn
                  Left = 80
                  Top = 224
                  Width = 78
                  Height = 33
                  Caption = '&Ok'
                  Default = True
                  ModalResult = 1
                  TabOrder = 6
                  OnClick = BitBtn2Click
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                    88888887788888778F88887222222222088888788888888878F887A228822222
                    208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                    22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                    22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                    220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                    2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                    8888888778FFFF77888888888777778888888888877777888888}
                  NumGlyphs = 2
                end
                object BitBtn3: TBitBtn
                  Left = 166
                  Top = 224
                  Width = 81
                  Height = 33
                  Cancel = True
                  Caption = '&Cancelar'
                  ModalResult = 2
                  TabOrder = 7
                  OnClick = BitBtn3Click
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                    88888887788888778F88887991919191088888788888888878F8879919191919
                    108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                    19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                    19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                    190878F877787778887887917F919F71908887F88788878887F8879919191919
                    1088878F88888888878888799191919108888878FF88888F7888888779999977
                    8888888778FFFF77888888888777778888888888877777888888}
                  NumGlyphs = 2
                end
                object BitBtn4: TBitBtn
                  Left = 254
                  Top = 224
                  Width = 81
                  Height = 33
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 8
                  OnClick = BitBtn4Click
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                    C8807FF7777777777FF700000000000000007777777777777777333333333333
                    3333333333333333333333333333333333333333333333333333}
                  NumGlyphs = 2
                end
              end
              inherited dblcContato: TCMDBLookupCombo
                Left = 67
                Top = 65
                CharCase = ecUpperCase
              end
              object Dock976: TDock97
                Left = 2
                Top = 15
                Width = 411
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar973: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object ToolbarButtonInsereContato: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolbarButtonInsereContatoClick
                  end
                  object ToolbarButtonAlteraContato: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolbarButtonAlteraContatoClick
                  end
                  object ToolbarButtonExcluiContato: TToolbarButton97
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = ToolbarButtonExcluiContatoClick
                  end
                end
                object Edit1: TEdit
                  Left = 85
                  Top = 4
                  Width = 508
                  Height = 21
                  BorderStyle = bsNone
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindow
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
              end
            end
            inherited DBEDDDI: TDBEdit [4]
            end
            inherited DBEDDDD: TDBEdit [5]
              MaxLength = 2
              OnKeyPress = DBEDDDDKeyPress
            end
            inherited DBEDNUMERO: TwwDBEdit [6]
              MaxLength = 9
              OnKeyPress = DBEDNUMEROKeyPress
            end
            inherited GroupBox4: TGroupBox [7]
            end
            object chkAssociaEnd: TCheckBox
              Left = 24
              Top = 185
              Width = 196
              Height = 17
              Caption = 'Associar telefone ao endereço'
              TabOrder = 5
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited dbgContato: TwwDBGrid [0]
            Height = 397
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'CARGO'#9'10'#9'Cargo'#9'No'
              'SETOR'#9'10'#9'Setor'#9'No'
              'Telefone'#9'20'#9'Telefone'
              'EMAIL'#9'40'#9'E-mail'#9'F')
          end
          inherited Panel2: TPanel [1]
            Height = 397
            inherited dbedcontatoemail: TDBEdit
              CharCase = ecUpperCase
            end
            inherited DBEdit2: TDBEdit
              CharCase = ecUpperCase
            end
            inherited DBEdit3: TDBEdit
              CharCase = ecUpperCase
            end
            inherited dblcTelefone: TCMDBLookupCombo
              CharCase = ecUpperCase
            end
            inherited DBMemo1: TDBMemo
              OnKeyPress = DBMemoKeyPress
            end
            inherited dbedContatoNome: TDBEdit
              CharCase = ecUpperCase
              OnKeyPress = dbedNomeFantasiaKeyPress
            end
          end
        end
        object tbsPessFis: TTabSheet
          Caption = 'Dados Pessoais'
          object pnlPessFis: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object spbDependente: TSpeedButton
              Left = 363
              Top = 238
              Width = 238
              Height = 28
              Caption = 'Dependentes'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555000050000005555544F00BFBFBF0555544F0BFBF0000055544F0FBFBFBFB
                F05544F0BFBF0000000544F0F000FBFBF00544F0B0B000000F000000F0F000FB
                FB0F555500BFBFBFB0F455555500FBFB0F44555555550000F44455555555550F
                4444555555555550044455555555555550045555555555555550}
              OnClick = spbDependenteClick
            end
            object Label16: TLabel
              Left = 5
              Top = 199
              Width = 68
              Height = 13
              Caption = 'Estado Civil'
            end
            object spBtnLogin: TSpeedButton
              Left = 363
              Top = 269
              Width = 238
              Height = 28
              Caption = '&Login/Senha do Auto-Atendimento'
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5000555555555555577755555555555550B0555555555555F7F7555555555550
                00B05555555555577757555555555550B3B05555555555F7F557555555555000
                3B0555555555577755755555555500B3B0555555555577555755555555550B3B
                055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
                555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
                55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
                555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
                55555575FFFF7755555555570000755555555557777775555555}
              NumGlyphs = 2
              OnClick = spBtnLoginClick
            end
            object Label58: TLabel
              Left = 613
              Top = 255
              Width = 132
              Height = 26
              Caption = 'INSS e Suplementação juntos  '
              WordWrap = True
            end
            object Label62: TLabel
              Left = 6
              Top = 148
              Width = 107
              Height = 13
              Caption = 'Grau de Instrução:'
            end
            object dbrgrpSexo: TDBRadioGroup
              Left = 505
              Top = 96
              Width = 171
              Height = 45
              Caption = 'Sexo'
              Columns = 2
              DataField = 'SEXO'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 7
              TabStop = True
              Values.Strings = (
                'M'
                'F')
              OnEnter = dbrgrpSexoEnter
              OnExit = dbrgrpSexoExit
            end
            object grpFiliacao: TGroupBox
              Left = 3
              Top = -1
              Width = 355
              Height = 146
              TabOrder = 0
              object Label25: TLabel
                Left = 6
                Top = 15
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object Label26: TLabel
                Left = 6
                Top = 57
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object lblNmConjuge: TLabel
                Left = 6
                Top = 99
                Width = 101
                Height = 13
                Caption = 'Nome do Cônjuge'
              end
              object wwDBEdit2: TwwDBEdit
                Left = 6
                Top = 27
                Width = 340
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NOMEPAI'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit3: TwwDBEdit
                Left = 6
                Top = 69
                Width = 340
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NOMEMAE'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbeNmConjuge: TwwDBEdit
                Left = 6
                Top = 111
                Width = 340
                Height = 21
                DataField = 'NOMECONJUGE'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grpNaturalidade: TGroupBox
              Left = 362
              Top = -1
              Width = 431
              Height = 92
              TabOrder = 1
              object Label27: TLabel
                Left = 164
                Top = 15
                Width = 73
                Height = 13
                Caption = 'Naturalidade'
              end
              object Label28: TLabel
                Left = 12
                Top = 51
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object Label19: TLabel
                Left = 12
                Top = 15
                Width = 40
                Height = 13
                Caption = 'Estado'
              end
              object edtNacionalidade: TEdit
                Left = 13
                Top = 64
                Width = 140
                Height = 21
                CharCase = ecUpperCase
                Color = cl3DLight
                TabOrder = 1
              end
              object edtNaturalidade: TEdit
                Left = 165
                Top = 29
                Width = 220
                Height = 21
                CharCase = ecUpperCase
                Color = cl3DLight
                TabOrder = 2
              end
              object edtEstado: TEdit
                Left = 13
                Top = 29
                Width = 140
                Height = 21
                CharCase = ecUpperCase
                Color = cl3DLight
                TabOrder = 0
              end
            end
            object grpDataNasc: TGroupBox
              Left = 363
              Top = 96
              Width = 138
              Height = 137
              TabOrder = 5
              object Label29: TLabel
                Left = 8
                Top = 12
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object Label30: TLabel
                Left = 8
                Top = 87
                Width = 92
                Height = 13
                Caption = 'Tipo Sanguíneo'
              end
              object Label6: TLabel
                Left = 8
                Top = 48
                Width = 118
                Height = 13
                Caption = 'Data do Falecimento'
              end
              object wwDBEdit4: TwwDBEdit
                Left = 8
                Top = 102
                Width = 88
                Height = 21
                CharCase = ecUpperCase
                DataField = 'TIPOSANG'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbdtNasc: TCMDateTimePicker
                Left = 8
                Top = 27
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATANASC'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
              object dbdtMorte: TCMDateTimePicker
                Left = 8
                Top = 63
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clInactiveBorder
                ButtonStyle = cbsCustom
                DataField = 'DATAMORTE'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 2
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
            end
            object grpDependentes: TGroupBox
              Left = 195
              Top = 193
              Width = 163
              Height = 137
              TabOrder = 4
              object Label31: TLabel
                Left = 9
                Top = 12
                Width = 108
                Height = 13
                Caption = 'Nº Dep. para IRRF'
              end
              object Label32: TLabel
                Left = 9
                Top = 48
                Width = 146
                Height = 13
                Caption = 'Nº Dep. para Sal. Família'
              end
              object Label33: TLabel
                Left = 9
                Top = 87
                Width = 145
                Height = 13
                Caption = 'Nº Total de Dependentes'
              end
              object dbNDepIRRF: TwwDBSpinEdit
                Left = 9
                Top = 27
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPIRRF'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbNDepSALFAM: TwwDBSpinEdit
                Left = 9
                Top = 63
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPSALF'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
              object dbNDepTOTAL: TwwDBSpinEdit
                Left = 9
                Top = 102
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPTOT'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                UnboundDataType = wwDefault
              end
            end
            object GroupBox3: TGroupBox
              Left = 4
              Top = 241
              Width = 184
              Height = 89
              TabOrder = 10
              object Label11: TLabel
                Left = 16
                Top = 10
                Width = 89
                Height = 13
                Caption = 'Início Invalidez'
              end
              object Label12: TLabel
                Left = 16
                Top = 49
                Width = 75
                Height = 13
                Caption = 'Fim Invalidez'
              end
              object CMDateTimePicker3: TCMDateTimePicker
                Left = 16
                Top = 25
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'INICIOINVALIDEZ'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
              object CMDateTimePicker4: TCMDateTimePicker
                Left = 16
                Top = 64
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'FIMINVALIDEZ'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
            end
            object DbChbSomaIR: TDBCheckBox
              Left = 613
              Top = 238
              Width = 142
              Height = 17
              Caption = 'Desconta IR sobre '
              DataField = 'FLGSOMAIRSUPINSS'
              DataSource = dsPessoaFisica
              TabOrder = 11
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object BitBtn1: TBitBtn
              Tag = 8888
              Left = 528
              Top = 56
              Width = 75
              Height = 25
              Caption = 'Buscar'
              TabOrder = 6
              OnClick = BitBtn1Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
            end
            object dblkGrauInstrucao: TwwDBLookupCombo
              Left = 5
              Top = 166
              Width = 349
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO'#9'T')
              DataField = 'IDGRINSTR'
              DataSource = dsPessoaFisica
              LookupTable = qryGrauInstrucao
              LookupField = 'IDGRINSTR'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object grpContaSalario: TGroupBox
              Left = 680
              Top = 96
              Width = 441
              Height = 46
              TabOrder = 8
              object lblDtSolicitacao: TLabel
                Left = 225
                Top = 12
                Width = 64
                Height = 26
                Caption = 'Data de'#13#10'Solicitação'
              end
              object dbchkcontasalario: TDBCheckBox
                Left = 39
                Top = 88
                Width = 146
                Height = 17
                Caption = 'Solicita Conta Salário'
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchksolicitacontasalario: TDBCheckBox
                Left = 14
                Top = 16
                Width = 147
                Height = 17
                Caption = 'Solicitar Conta Salário'
                DataField = 'FLGSOLICITACONTASALARIO'
                DataSource = dsPessoaFisica
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbchksolicitacontasalarioClick
              end
              object dtsolicitacontasalario: TCMDateTimePicker
                Left = 316
                Top = 9
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTSOLICITACONTASALARIO'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 2
              end
            end
            object grpContaProcessada: TGroupBox
              Left = 680
              Top = 142
              Width = 442
              Height = 45
              TabOrder = 9
              object lbldtprocessada: TLabel
                Left = 221
                Top = 10
                Width = 87
                Height = 26
                Caption = 'Data de'#13#10'Processamento'
              end
              object dbchk2: TDBCheckBox
                Left = 39
                Top = 88
                Width = 146
                Height = 17
                Caption = 'Solicita Conta Salário'
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchkSalarioProcessado: TDBCheckBox
                Left = 13
                Top = 16
                Width = 174
                Height = 15
                Caption = 'Conta Salário Processada'
                DataField = 'FLGCONTASALARIOPROCESSADA'
                DataSource = dsPessoaFisica
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbchkSalarioProcessadoClick
              end
              object dtcontasalarioprocessada: TCMDateTimePicker
                Left = 316
                Top = 9
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTCONTASALARIOPROCESSADA'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 2
              end
            end
            object cmbEstCiv: TwwDBLookupCombo
              Left = 4
              Top = 215
              Width = 184
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
              DataField = 'ESTCIVIL'
              DataSource = dsPessoaFisica
              LookupTable = qryEstCivil
              LookupField = 'ESTCIVIL'
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object pnlMolestiaIR: TPanel
            Left = 0
            Top = 334
            Width = 1258
            Height = 129
            BevelOuter = bvNone
            TabOrder = 1
            object Panel9: TPanel
              Left = 4
              Top = 0
              Width = 171
              Height = 76
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 1
              object wwDBCBIsentoIrrf: TwwDBComboBox
                Left = 5
                Top = 49
                Width = 162
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = True
                AllowClearKey = False
                CharCase = ecUpperCase
                DataField = 'TIPOISENCAOIRRF'
                DataSource = dsPessoaFisica
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Espécie de Benefício 92'#9'0'
                  'Ação Judicial'#9'1'
                  'Moléstia Grave'#9'2')
                Sorted = False
                TabOrder = 0
                UnboundDataType = wwDefault
                OnCloseUp = wwDBCBIsentoIrrfCloseUp
              end
            end
            object dbrgrpIsentoIR: TDBRadioGroup
              Left = 4
              Top = 0
              Width = 171
              Height = 45
              Caption = 'Pessoa Isenta de IR ?'
              Columns = 2
              DataField = 'FLGISENTOIRRF'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 0
              Values.Strings = (
                '1'
                '0')
              OnClick = dbrgrpIsentoIRClick
            end
            object Panel6: TPanel
              Left = 3
              Top = 74
              Width = 171
              Height = 39
              BevelInner = bvLowered
              TabOrder = 2
              object BitBtnHistorico: TButton
                Left = 4
                Top = 7
                Width = 163
                Height = 26
                Caption = 'Histórico de moléstia grave'
                Enabled = False
                TabOrder = 0
                OnClick = BitBtnHistoricoClick
              end
              object Panel7: TPanel
                Left = 2
                Top = 71
                Width = 166
                Height = 6
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
            object dbrgrpMolestiaGrave: TGroupBox
              Left = 180
              Top = 0
              Width = 276
              Height = 71
              Caption = 'Moléstia Grave '
              Enabled = False
              TabOrder = 3
              Visible = False
              object Label22: TLabel
                Left = 13
                Top = 18
                Width = 34
                Height = 13
                Caption = 'Início'
              end
              object Label45: TLabel
                Left = 141
                Top = 18
                Width = 46
                Height = 13
                Caption = 'Término'
              end
              object dbdtMolestiaGrave: TCMDateTimePicker
                Left = 4
                Top = 34
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = cl3DLight
                ButtonStyle = cbsCustom
                DataField = 'DATAMOLESTIAGRAVE'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
              end
              object dbdtFimMolestia: TCMDateTimePicker
                Left = 140
                Top = 34
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = cl3DLight
                ButtonStyle = cbsCustom
                DataField = 'DATAFIMMOLESTIA'
                DataSource = dsPessoaFisica
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
              end
            end
          end
        end
        object tbsElegivel: TTabSheet
          Caption = 'Dados Funcionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object dbgrdElegivel: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Selected.Strings = (
              'MATRICULA'#9'11'#9'Matrícula'#9'F'
              'PATROCINADORA'#9'25'#9'Patrocinadora'#9'F'
              'FILIAL'#9'25'#9'Filial'#9'F'
              'DTNOMEACAO'#9'18'#9'Data Nomeação'#9'F'
              'DTEXONERACAO'#9'18'#9'Data Exoneração'#9'F'
              'DATAADMISSAO'#9'12'#9'Data de ~Admissão'#9'F'
              'DATADEMISSAO'#9'18'#9'Data de~Demissão'#9'F'
              'DATAREADMISSAO'#9'18'#9'Data de~Readmissão'#9'F'
              'SITFUNC'#9'11'#9'Situação do Empregrado ~na Patrocinadora'#9'F'
              'DESCRICAO'#9'40'#9'Vinculação~Funcional'#9'F'
              'SALTOTAL'#9'10'#9'Salário'#9'F'
              'NIVEL'#9'5'#9'Nível'#9'F'
              'CODCARGO'#9'15'#9'Cargo ~Atual(Cód)'#9'F'
              'CARGO'#9'40'#9'Cargo ~Atual'#9'F'
              'CODFUNCAO'#9'15'#9'Função ~Atual(Cód)'#9'F'
              'FUNCAO'#9'40'#9'Função ~Atual'#9'F'
              'CODGRUPO'#9'15'#9'Grupo Função ~Atual(Cód)'#9'F'
              'MODOFUNCAO'#9'21'#9'Modo Função ~Atual'#9'F'
              'CODCENTROCUSTO'#9'13'#9'Centro de Custo'#9'F'
              'FLGDIRETOR'#9'10'#9'Exerceu Cargo~de Diretoria'#9'F'
              'TEMPOSERVANTERIOR'#9'10'#9'Tempo de ~Serviço Anterior'#9'F'
              'TEMPONAOCREDITADO'#9'10'#9'Tempo de ~Contrib. Não Cred.'#9'F'
              'VALORBASE1'#9'10'#9'Opção 1'#9'F'
              'VALORBASE2'#9'10'#9'Opçaõ 2'#9'F'
              'VALORBASE3'#9'10'#9'Opção 3'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsElegPatro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesElegivel: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object GroupBox8: TGroupBox
              Left = 6
              Top = 1
              Width = 253
              Height = 156
              TabOrder = 0
              object lblPatro: TLabel
                Left = 6
                Top = 8
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object lblSitFunc: TLabel
                Left = 6
                Top = 80
                Width = 241
                Height = 13
                Caption = 'Situação do Empregrado na Patrocinadora'
              end
              object Labelfilial: TLabel
                Left = 6
                Top = 44
                Width = 27
                Height = 13
                Caption = 'Filial'
              end
              object Label8: TLabel
                Left = 6
                Top = 116
                Width = 123
                Height = 13
                Caption = 'Vinculação Funcional'
              end
              object dblkpcmbPatro: TwwDBLookupCombo
                Left = 5
                Top = 22
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Patrocinadora')
                DataField = 'IDPESSJUR'
                DataSource = dsElegPatro
                LookupTable = qryPatro
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbPatroCloseUp
              end
              object dblkpcmbSitPatro: TwwDBLookupCombo
                Left = 5
                Top = 93
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Situação do Funcionário'#9'F')
                DataField = 'IDSITFUNC'
                DataSource = dsElegPatro
                LookupTable = qrySitFunc
                LookupField = 'IDSITFUNC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbSitPatroCloseUp
              end
              object cmbfilial: TwwDBLookupCombo
                Left = 5
                Top = 58
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDESTAB'
                DataSource = dsElegPatro
                LookupTable = qryfilial
                LookupField = 'IDPESSOA'
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = cmbfilialCloseUp
              end
              object dblkpcmbVinculaFunc: TwwDBLookupCombo
                Left = 5
                Top = 129
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Vinculação Funcional'#9'F')
                DataField = 'CODVINCULAFUNC'
                DataSource = dsElegPatro
                LookupTable = qryVinculaFunc
                LookupField = 'CODVINCULAFUNC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
            object GroupBox9: TGroupBox
              Left = 6
              Top = 159
              Width = 253
              Height = 91
              Caption = ' Cargo Atual na Patrocinadora '
              TabOrder = 1
              object lblCargo: TLabel
                Left = 9
                Top = 15
                Width = 67
                Height = 13
                Caption = 'Cargo Atual'
              end
              object Label43: TLabel
                Left = 125
                Top = 49
                Width = 32
                Height = 13
                Caption = 'Nível'
              end
              object Label9: TLabel
                Left = 9
                Top = 49
                Width = 40
                Height = 13
                Caption = 'Código'
              end
              object dblkpcmbCargo: TwwDBLookupCombo
                Left = 9
                Top = 28
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TITULO'#9'30'#9'Cargo')
                DataField = 'IDCARGOEXT'
                DataSource = dsElegPatro
                LookupTable = qryCargo
                LookupField = 'IDCARGOEXT'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbCargoCloseUp
              end
              object dbedNivel: TwwDBEdit
                Left = 125
                Top = 62
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NIVEL'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object edtCodCargo: TEdit
                Left = 9
                Top = 61
                Width = 89
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
            end
            object GroupBox10: TGroupBox
              Left = 262
              Top = 1
              Width = 408
              Height = 200
              TabOrder = 2
              object lblMatricula: TLabel
                Left = 8
                Top = 8
                Width = 55
                Height = 13
                Caption = 'Matrícula'
              end
              object Label13: TLabel
                Left = 261
                Top = 8
                Width = 103
                Height = 13
                Caption = 'Data de Admissão'
              end
              object lblDataDemissao: TLabel
                Left = 261
                Top = 44
                Width = 104
                Height = 13
                Caption = 'Data de Demissão'
              end
              object Label14: TLabel
                Left = 114
                Top = 8
                Width = 141
                Height = 13
                Caption = 'Salário na Patrocinadora'
              end
              object Label7: TLabel
                Left = 8
                Top = 44
                Width = 79
                Height = 13
                Caption = 'Órgão / Setor'
              end
              object Label10: TLabel
                Left = 261
                Top = 80
                Width = 118
                Height = 13
                Caption = 'Data da Readmissão'
              end
              object Label15: TLabel
                Left = 8
                Top = 80
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object Label41: TLabel
                Left = 8
                Top = 116
                Width = 346
                Height = 13
                Caption = 'Tempo de Contribuição à Previdência Social anterior à Caixa'
                WordWrap = True
              end
              object Label42: TLabel
                Left = 220
                Top = 133
                Width = 24
                Height = 13
                Caption = 'dias'
              end
              object Label24: TLabel
                Left = 47
                Top = 132
                Width = 33
                Height = 13
                AutoSize = False
                Caption = 'anos'
              end
              object Label37: TLabel
                Left = 128
                Top = 133
                Width = 36
                Height = 13
                Caption = 'meses'
              end
              object lblDataNomeacao: TLabel
                Left = 8
                Top = 154
                Width = 110
                Height = 13
                Caption = 'Data de Nomeação'
              end
              object lblDataExoneracao: TLabel
                Left = 144
                Top = 154
                Width = 117
                Height = 13
                Caption = 'Data de Exoneração'
              end
              object dbedMatricula: TDBEdit
                Left = 8
                Top = 22
                Width = 100
                Height = 21
                CharCase = ecUpperCase
                DataField = 'MATRICULA'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbdtAdesao: TCMDateTimePicker
                Left = 261
                Top = 22
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAADMISSAO'
                DataSource = dsElegPatro
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 2
                OnEnter = dbdtAdesaoEnter
                OnExit = dbdtAdesaoExit
              end
              object dbDataDemissao: TCMDateTimePicker
                Left = 261
                Top = 58
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clMenu
                ButtonStyle = cbsCustom
                DataField = 'DATADEMISSAO'
                DataSource = dsElegPatro
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 4
              end
              object dbedSalario: TDBEdit
                Left = 114
                Top = 22
                Width = 135
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SALTOTAL'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dblkOrgPrev: TwwDBLookupCombo
                Left = 8
                Top = 58
                Width = 242
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Órgão')
                LookupTable = qryOrgaoPrev
                LookupField = 'NOME'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkOrgPrevCloseUp
              end
              object edtDataReadmissao: TCMDateTimePicker
                Left = 261
                Top = 93
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAREADMISSAO'
                DataSource = dsElegPatro
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 6
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
              object dblkpcmbCCusto: TwwDBLookupCombo
                Left = 8
                Top = 93
                Width = 242
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Centro de Custo')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsElegPatro
                LookupTable = qryCCusto
                LookupField = 'CODCENTROCUSTO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dbedTempoServAnterior: TwwDBEdit
                Left = 396
                Top = 161
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'TEMPOSERVANTERIOR'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnEnter = dbedTempoServAnteriorEnter
                OnExit = dbedTempoServAnteriorExit
              end
              object dbedTempoNaoCreditado: TwwDBEdit
                Left = 396
                Top = 137
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                Color = clSilver
                DataField = 'TEMPONAOCREDITADO'
                DataSource = dsElegPatro
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object edtDataNomeacao: TCMDateTimePicker
                Left = 8
                Top = 167
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTNOMEACAO'
                DataSource = dsElegPatro
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 9
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
              object edtDataExoneracao: TCMDateTimePicker
                Left = 144
                Top = 167
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTEXONERACAO'
                DataSource = dsElegPatro
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 10
                OnEnter = dbdtNascEnter
                OnExit = dbdtNascExit
              end
              object dbedAnos: TwwDBEdit
                Left = 8
                Top = 130
                Width = 40
                Height = 21
                DataField = 'TEMPOSERVTOTAL'
                DataSource = dsElegPatro
                TabOrder = 11
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyPress = dbedAnosKeyPress
              end
              object dbedMeses: TwwDBEdit
                Left = 89
                Top = 130
                Width = 40
                Height = 21
                DataField = 'TEMPOSERVTOTMES'
                DataSource = dsElegPatro
                TabOrder = 12
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyPress = dbedAnosKeyPress
              end
              object dbedDias: TwwDBEdit
                Left = 180
                Top = 130
                Width = 40
                Height = 21
                DataField = 'TEMPOSERVTOTDIA'
                DataSource = dsElegPatro
                TabOrder = 13
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyPress = dbedAnosKeyPress
              end
            end
            object GroupBox11: TGroupBox
              Left = 262
              Top = 205
              Width = 408
              Height = 91
              Caption = ' Função Atual na Patrocinadora '
              TabOrder = 3
              object Label52: TLabel
                Left = 9
                Top = 15
                Width = 43
                Height = 13
                Caption = 'Função'
                Color = clBtnFace
                ParentColor = False
              end
              object Label53: TLabel
                Left = 93
                Top = 49
                Width = 35
                Height = 13
                Caption = 'Grupo'
                Color = clBtnFace
                ParentColor = False
              end
              object Label54: TLabel
                Left = 9
                Top = 49
                Width = 40
                Height = 13
                Caption = 'Código'
                Color = clBtnFace
                ParentColor = False
              end
              object Label55: TLabel
                Left = 175
                Top = 49
                Width = 32
                Height = 13
                Caption = 'Modo'
                Color = clBtnFace
                ParentColor = False
              end
              object Label56: TLabel
                Left = 254
                Top = 15
                Width = 69
                Height = 13
                Caption = 'Cedido para'
                Color = clBtnFace
                ParentColor = False
              end
              object edCodFuncaoAtual: TEdit
                Left = 9
                Top = 62
                Width = 79
                Height = 21
                CharCase = ecUpperCase
                Color = clInactiveBorder
                Enabled = False
                TabOrder = 0
              end
              object edFuncaoAtual: TEdit
                Left = 9
                Top = 28
                Width = 238
                Height = 21
                CharCase = ecUpperCase
                Color = clInactiveBorder
                Enabled = False
                TabOrder = 1
              end
              object edGrupoFuncaoAtual: TEdit
                Left = 94
                Top = 62
                Width = 75
                Height = 21
                CharCase = ecUpperCase
                Color = clInactiveBorder
                Enabled = False
                TabOrder = 2
              end
              object edModoFuncaoAtual: TEdit
                Left = 175
                Top = 62
                Width = 91
                Height = 21
                CharCase = ecUpperCase
                Color = clInactiveBorder
                Enabled = False
                TabOrder = 3
              end
              object cboxCedidoPatro: TwwDBLookupCombo
                Left = 254
                Top = 27
                Width = 143
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'45'#9'Patrocinadora'#9'F')
                DataField = 'IDPESSJURCEDIDO'
                DataSource = dsElegPatro
                LookupTable = qryCedidoPatro
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dbrgrpDiretor: TDBRadioGroup
                Left = 276
                Top = 51
                Width = 123
                Height = 32
                Caption = 'Cargo de Diretoria ?'
                Columns = 2
                DataField = 'FLGDIRETOR'
                DataSource = dsElegPatro
                Items.Strings = (
                  'Não'
                  'Sim')
                TabOrder = 5
                Values.Strings = (
                  '0'
                  '1')
              end
            end
          end
        end
        object tbsPlanosPrev: TTabSheet
          Caption = 'Planos Previdenciários'
          object dbgrdPlanosPrev: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Selected.Strings = (
              'PLANO'#9'28'#9'Plano'
              'SITPART'#9'18'#9'Situação na Fundação'
              'SITPLANO'#9'14'#9'Situação no Plano'
              'INSCRICAONUMERO'#9'9'#9'Número de ~Inscrição'
              'INSCRICAODATA'#9'12'#9'Data de Evento~(Inscrição)'
              'REQUERIMENTODATA'#9'11'#9'Data de ~Requerimento'
              'INSCRICAOTIPO'#9'7'#9'Tipo de ~Inscrição'
              'SALINSCRICAO'#9'16'#9'Salário na Inscrição'
              'FLGFITESPECIAL'#9'10'#9'Situação ~Especial'
              'DATACANCELAMENTO'#9'18'#9'Data de ~Cancelamento'
              'FLGDESATIVADO'#9'10'#9'Situação ~do Plano'
              'DATAOPCAOIR'#9'18'#9'Data ~Opção de IR'
              'TIPO'#9'18'#9'Tabela ~Opção de IR'
              'SALMANTIDO'#9'11'#9'Salário de ~Manutenção')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPlanosPrev
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesPlanos: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            object bbtnContribuicoes: TBitBtn
              Left = 504
              Top = 12
              Width = 109
              Height = 40
              Hint = 'Editar Contribuições do Participante neste Plano'
              Caption = '&Contribuições'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = bbtnContribuicoesClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              NumGlyphs = 2
            end
            object memAvisoContrib: TMemo
              Left = 474
              Top = 6
              Width = 163
              Height = 58
              Color = clSilver
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                'AVISO : '
                'As contribuições do participante '
                'serão associadas na '
                'confirmação final das operações.')
              ParentFont = False
              TabOrder = 12
            end
            object grpInscricao: TGroupBox
              Left = 6
              Top = 3
              Width = 319
              Height = 176
              TabOrder = 0
              object Label17: TLabel
                Left = 9
                Top = 11
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
              end
              object Label23: TLabel
                Left = 9
                Top = 50
                Width = 219
                Height = 13
                Caption = 'Situação do Participante na Fundação'
              end
              object Label2: TLabel
                Left = 9
                Top = 89
                Width = 195
                Height = 13
                Caption = 'Situação do Participante no Plano'
              end
              object dblkpcmbPlano: TwwDBLookupCombo
                Left = 9
                Top = 24
                Width = 304
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Plano Previdenciário')
                DataField = 'IDPLANOPREV'
                DataSource = dsPlanosPrev
                LookupTable = qryPlanPrev
                LookupField = 'IDPLANOPREV'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbPlanoCloseUp
              end
              object dblkpcmbSitPart: TwwDBLookupCombo
                Left = 9
                Top = 63
                Width = 304
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Situação do Participante na Fundação')
                DataField = 'IDSITPART'
                DataSource = dsPlanosPrev
                LookupTable = qrySitPart
                LookupField = 'IDSITPART'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbSitPartCloseUp
              end
              object dblkpcmbSitPlanoPrev: TwwDBLookupCombo
                Left = 9
                Top = 102
                Width = 304
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
                DataField = 'IDSITPLANOPREV'
                DataSource = dsPlanosPrev
                LookupTable = qrySitPlanoPrev
                LookupField = 'IDSITPLANOPREV'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbSitPlanoPrevCloseUp
              end
              object dbrgrpSitEspecial: TDBRadioGroup
                Left = 6
                Top = 129
                Width = 151
                Height = 44
                Caption = 'Situação Especial '
                Columns = 2
                DataField = 'FLGFITESPECIAL'
                DataSource = dsPlanosPrev
                Items.Strings = (
                  'Não'
                  'Sim')
                TabOrder = 3
                Values.Strings = (
                  '0'
                  '1')
              end
              object grpDataManutencao: TGroupBox
                Left = 159
                Top = 129
                Width = 157
                Height = 44
                Caption = 'Data Inscrição INSS'
                TabOrder = 4
                object dbDataInscricaoInss: TCMDateTimePicker
                  Left = 11
                  Top = 17
                  Width = 121
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATACONTRIBINSS'
                  DataSource = dsPlanosPrev
                  Epoch = 1950
                  ButtonGlyph.Data = {
                    06050000424D06050000000000003604000028000000100000000D0000000100
                    080000000000D000000000000000000000000001000000000000000000000000
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
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                    000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                    A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                    FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                    04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                    000000000000000000FF}
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 0
                end
              end
            end
            object dbrgrpTipoInsc: TDBRadioGroup
              Left = 332
              Top = 134
              Width = 305
              Height = 44
              Caption = 'Tipo de Inscrição'
              Columns = 2
              DataField = 'INSCRICAOTIPO'
              DataSource = dsPlanosPrev
              Items.Strings = (
                'Fundador'
                'Não Fundador'
                'Retardatário'
                'Outros')
              TabOrder = 6
              Values.Strings = (
                'F'
                'N'
                'R'
                'O')
            end
            object GroupBox1: TGroupBox
              Left = 332
              Top = 66
              Width = 305
              Height = 67
              TabOrder = 5
              object Label21: TLabel
                Left = 171
                Top = 11
                Width = 94
                Height = 13
                Caption = 'Data de Evento '
              end
              object Label18: TLabel
                Left = 11
                Top = 23
                Width = 132
                Height = 13
                Caption = 'Data de Requerimento '
              end
              object Label3: TLabel
                Left = 171
                Top = 23
                Width = 61
                Height = 13
                Caption = '(Inscrição)'
              end
              object dbdtInscricao: TCMDateTimePicker
                Left = 171
                Top = 38
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'INSCRICAODATA'
                DataSource = dsPlanosPrev
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                OnEnter = dbdtInscricaoEnter
                OnExit = dbdtInscricaoExit
              end
              object dbdtRequerimento: TCMDateTimePicker
                Left = 11
                Top = 38
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'REQUERIMENTODATA'
                DataSource = dsPlanosPrev
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
              end
            end
            object GroupBox2: TGroupBox
              Left = 332
              Top = 3
              Width = 137
              Height = 58
              TabOrder = 4
              object Label20: TLabel
                Left = 7
                Top = 12
                Width = 118
                Height = 13
                Caption = 'Número de Inscrição'
              end
              object dbedInscNumero: TwwDBEdit
                Left = 7
                Top = 27
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'INSCRICAONUMERO'
                DataSource = dsPlanosPrev
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object gpDataCancelamento: TGroupBox
              Left = 6
              Top = 179
              Width = 157
              Height = 47
              TabOrder = 1
              object Label35: TLabel
                Left = 12
                Top = 8
                Width = 130
                Height = 13
                Caption = 'Data de Cancelamento'
              end
              object dbDataCancelamento: TCMDateTimePicker
                Left = 12
                Top = 21
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATACANCELAMENTO'
                DataSource = dsPlanosPrev
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
              end
            end
            object gpDataManutencao: TGroupBox
              Left = 8
              Top = 275
              Width = 157
              Height = 47
              TabOrder = 10
              Visible = False
              object Label34: TLabel
                Left = 16
                Top = 8
                Width = 120
                Height = 13
                Caption = 'Data de Manutenção'
              end
              object dbDataInicioManut: TCMDateTimePicker
                Left = 16
                Top = 21
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIOMANUT'
                DataSource = dsPlanosPrev
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ShowButton = True
                TabOrder = 0
              end
            end
            object GroupBox7: TGroupBox
              Left = 332
              Top = 179
              Width = 305
              Height = 47
              Caption = 'Salário de Participação'
              TabOrder = 7
              object Label36: TLabel
                Left = 173
                Top = 11
                Width = 30
                Height = 13
                Caption = 'Atual'
              end
              object Label44: TLabel
                Left = 10
                Top = 11
                Width = 72
                Height = 13
                Caption = 'Na inscrição'
              end
              object dbedSalPartInsc: TwwDBEdit
                Left = 10
                Top = 23
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                DataField = 'SALPARTICIPACAO'
                DataSource = dsPlanosPrev
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = dbedSalPartInscExit
              end
              object edSalarioPart: TEditNum
                Left = 173
                Top = 23
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                Color = clSilver
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                IntDigits = 12
                Signal = False
                DecDigits = 2
                Numeric = True
                Alignment = taRightJustify
              end
            end
            object grpTipoOpIR: TGroupBox
              Left = 6
              Top = 226
              Width = 319
              Height = 39
              Caption = 'Opção de Tributação de IR'
              TabOrder = 3
              object Label60: TLabel
                Left = 6
                Top = 18
                Width = 28
                Height = 13
                Caption = 'Data'
              end
              object Label61: TLabel
                Left = 134
                Top = 18
                Width = 40
                Height = 13
                Caption = 'Tabela'
              end
              object cmbTipoOpIR: TwwDBComboBox
                Left = 177
                Top = 14
                Width = 136
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = True
                AllowClearKey = False
                CharCase = ecUpperCase
                DataField = 'TIPOOPCAOIR'
                DataSource = dsPlanosPrev
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Tabela Progressiva'#9'1'
                  'Tabela Regressiva'#9'2')
                Sorted = False
                TabOrder = 1
                UnboundDataType = wwDefault
                OnCloseUp = cmbTipoOpIRCloseUp
              end
              object dbDataOpcaoIR: TCMDateTimePicker
                Left = 37
                Top = 14
                Width = 92
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAOPCAOIR'
                DataSource = dsPlanosPrev
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
              end
            end
            object grpHistIr: TGroupBox
              Left = 665
              Top = 7
              Width = 409
              Height = 206
              Caption = 'Histórico de Tributação de IR'
              TabOrder = 9
              object spbtHistipoIrAlterar: TSpeedButton
                Left = 2
                Top = 17
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  56080000424D560800000000000036000000280000001A0000001A0000000100
                  1800000000002008000000000000000000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF0000FFFFFFA0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                  A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                  A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000000000000000F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08484848484
                  84FFFFFFFFFFFF000000848484F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0848484848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFFFFFFFFFF
                  FF848484848484FFFFFF000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0848484FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFF000000
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000000000000FFFFFFFFFF
                  FFFFFFFF000000FFFFFFFFFFFF000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
                  0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                  000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF0000FFFFFF000000FFFFFFFFFFFFFFFFFF000000F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F084
                  8484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FFFFFF
                  FFFFFFFFFFFF000000F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF0000FFFFFF000000FFFFFF848484848484F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF
                  FFFFFF000000F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF848484848484F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFFFFFF848484848484F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08484
                  84848484848484F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                  F0F0A0A0A0FFFFFF0000FFFFFFF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
                OnClick = spbtHistipoIrAlterarClick
              end
              object spbtHistipoIrExcluir: TSpeedButton
                Left = 29
                Top = 17
                Width = 22
                Height = 25
                Flat = True
                Glyph.Data = {
                  56080000424D560800000000000036040000280000001F000000210000000100
                  0800000000002004000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6A4A4F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F60000FF00F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F60000FFFFFF00F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F60000FFFFFFFFFFFF00F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6A4FFFFFFFFFFFCFF00F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F60101010101FCFCFFFFFF00F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F601F9F9F9F9F901FFFFFCFF00F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F9F9F9F9F9F9F9F901FCFFFFFF00F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F9F9F6FFF9FFFFF901FFFFFCFFFF00F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F9F9F9F6FFFFF9F901FCFCFFFFFFFF00F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F9F9F9FFFFF6F9F901FFFFFFFFA4A4F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F9F9F6FFF9FFFFF901FFFFA4A4F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F9F9F9F9F9F901A4A4A4F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F9F9F9F9F9F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFF6F6
                  F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
                OnClick = SpeedButton3Click
              end
              object grdHistoricoTipoIr: TwwDBGrid
                Left = 1
                Top = 46
                Width = 405
                Height = 168
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = dsHistoricoTipoIr
                KeyOptions = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
            object GroupBox12: TGroupBox
              Left = 332
              Top = 226
              Width = 156
              Height = 48
              Caption = 'Salário de Manutenção'
              TabOrder = 8
              object dbedSalMantido: TwwDBEdit
                Left = 9
                Top = 18
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SALMANTIDO'
                DataSource = dsPlanosPrev
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grbSitPlano: TGroupBox
              Left = 167
              Top = 179
              Width = 157
              Height = 47
              TabOrder = 2
              object Label75: TLabel
                Left = 9
                Top = 2
                Width = 121
                Height = 13
                Caption = '  Situação do Plano  '
              end
              object dbchkSitPlano: TDBCheckBox
                Left = 18
                Top = 23
                Width = 126
                Height = 17
                Caption = 'Desativar o Plano'
                DataField = 'FLGDESATIVADO'
                DataSource = dsPlanosPrev
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
        end
        object tbsContaBancaria: TTabSheet
          Caption = 'Contas Bancárias'
          object dbgrdContaBancaria: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Selected.Strings = (
              'BANCO'#9'30'#9'Banco'
              'NUMAGENCIA'#9'15'#9'Nº Agência'
              'AGENCIA'#9'50'#9'Agência'
              'CONTACORRENTE'#9'15'#9'Conta Corrente'
              'FLGCONTAPREF'#9'10'#9'Conta Preferencial'
              'TIPOCONTA'#9'1'#9'Conta Salário')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContaBancaria
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object GroupBoxBanco: TGroupBox
              Left = 18
              Top = 10
              Width = 447
              Height = 184
              TabOrder = 0
              TabStop = True
              object Label38: TLabel
                Left = 93
                Top = 65
                Width = 47
                Height = 13
                Caption = 'Agência'
              end
              object Label39: TLabel
                Left = 93
                Top = 19
                Width = 37
                Height = 13
                Caption = 'Banco'
              end
              object Label40: TLabel
                Left = 93
                Top = 112
                Width = 86
                Height = 13
                Caption = 'Conta Corrente'
              end
              object Label4: TLabel
                Left = 12
                Top = 18
                Width = 55
                Height = 13
                Caption = 'Banco Nº'
              end
              object Label5: TLabel
                Left = 12
                Top = 65
                Width = 65
                Height = 13
                Caption = 'Agência Nº'
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 93
                Top = 78
                Width = 340
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'30'#9'Agência'
                  'NUMAGENCIA'#9'15'#9'Nº')
                DataField = 'IDAGENCIA'
                DataSource = dsContaBancaria
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkpcmbAgenciaCloseUp
              end
              object dblkpcmbBanco: TwwDBLookupCombo
                Left = 93
                Top = 32
                Width = 340
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'35'#9'Banco'
                  'NUMBANCO'#9'10'#9'Nº ')
                DataField = 'BANCO'
                DataSource = dsContaBancaria
                LookupTable = qryBanco
                LookupField = 'BANCO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkpcmbBancoCloseUp
              end
              object dbedContaCorrente: TwwDBEdit
                Left = 93
                Top = 125
                Width = 139
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CONTACORRENTE'
                DataSource = dsContaBancaria
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = dbedContaCorrenteExit
              end
              object edDigBanco: TEditNum
                Left = 12
                Top = 32
                Width = 64
                Height = 21
                Hint = 'Digite este campo caso deseje procurar o banco por número'
                CharCase = ecUpperCase
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnExit = edDigBancoExit
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
              object edDigAgencia: TEditNum
                Left = 12
                Top = 78
                Width = 64
                Height = 21
                Hint = 'Digite este campo caso deseje procurar a agência por número'
                CharCase = ecUpperCase
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnExit = edDigAgenciaExit
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
            end
            object rgrpTipoConta: TDBRadioGroup
              Left = 480
              Top = 10
              Width = 142
              Height = 103
              Caption = 'Tipo'
              DataField = 'TIPOCONTA'
              DataSource = dsContaBancaria
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Conta Corrente'
                'Conta Salário'
                'Poupança'
                'OP/Recibo')
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                '1'
                '2'
                '3'
                '4')
            end
            object dbgrpContaPref: TDBRadioGroup
              Left = 480
              Top = 116
              Width = 142
              Height = 36
              Caption = 'Conta Preferencial'
              Columns = 2
              DataField = 'FLGCONTAPREF'
              DataSource = dsContaBancaria
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object dbgrpContaConj: TDBRadioGroup
              Left = 480
              Top = 158
              Width = 142
              Height = 36
              Caption = 'Conta Conjunta'
              Columns = 2
              DataField = 'FLGCONTACONJUNTA'
              DataSource = dsContaBancaria
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'N'
                'S')
            end
            object dbRdgContaResgate: TDBRadioGroup
              Left = 480
              Top = 201
              Width = 142
              Height = 36
              Caption = 'Conta Resgate'
              Columns = 2
              DataField = 'FLGCONTARESGATE'
              DataSource = dsContaBancaria
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 4
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
          end
        end
        object tbshtFundacao: TTabSheet
          Caption = 'Fundações'
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object lblfund: TLabel
              Left = 40
              Top = 40
              Width = 57
              Height = 13
              Caption = 'Fundação'
            end
            object lblinsc: TLabel
              Left = 40
              Top = 104
              Width = 118
              Height = 13
              Caption = 'Número de Inscrição'
            end
            object dblkpcmbFundacao: TwwDBLookupCombo
              Left = 40
              Top = 56
              Width = 265
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDFUNDACAO'
              DataSource = dsfundacoes
              LookupTable = qryfundacao
              LookupField = 'IDPESSOA'
              ParentFont = False
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblkpcmbFundacaoCloseUp
            end
            object dbedinsc: TDBEdit
              Left = 40
              Top = 120
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMINSC'
              DataSource = dsfundacoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = dbedinscExit
            end
          end
          object dbgrdFundacoes: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Selected.Strings = (
              'NOME'#9'60'#9'Fundação'
              'NUMINSC'#9'15'#9'Número de Inscrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsfundacoes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsOutrasInforms: TTabSheet
          Caption = 'Outras Informações'
          ImageIndex = 9
          object dbgrdOutrasInforms: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 145
            Selected.Strings = (
              'DESCRICAO'#9'37'#9'Parâmetro'
              'IDPARAM'#9'10'#9'Código'
              'DATAINICIO'#9'10'#9'Data início'
              'DATAFIM'#9'10'#9'Data Fim'
              'VALOR'#9'30'#9'Conteúdo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = dsOutrasInforms
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object dbgrInfoAdicionais: TwwDBGrid
            Left = 0
            Top = 182
            Width = 1236
            Height = 113
            Selected.Strings = (
              
                'CARGOEMPFUNC'#9'55'#9'Ocupação Profissional - Cargo, Empresa ou Função' +
                ' Pública'
              'ENTIDADE'#9'55'#9'Entidade'
              'RENDA'#9'15'#9'Renda'
              'DTINICIO'#9'15'#9'Data Início'
              'DTFIM'#9'15'#9'Data Fim')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsOcupacao
            TabOrder = 4
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel5: TPanel
            Left = 0
            Top = 182
            Width = 1236
            Height = 113
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Label46: TLabel
              Left = 24
              Top = 40
              Width = 58
              Height = 13
              Caption = 'Parâmetro'
            end
            object Label47: TLabel
              Left = 24
              Top = 102
              Width = 55
              Height = 13
              Caption = 'Conteúdo'
            end
            object Label48: TLabel
              Left = 24
              Top = 153
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object Label49: TLabel
              Left = 195
              Top = 155
              Width = 51
              Height = 13
              Caption = 'Data Fim'
            end
            object Label50: TLabel
              Left = 411
              Top = 101
              Width = 57
              Height = 13
              Caption = 'Validação'
            end
            object Label51: TLabel
              Left = 364
              Top = 122
              Width = 44
              Height = 13
              Caption = '<---------'
            end
            object Label59: TLabel
              Left = 411
              Top = 143
              Width = 50
              Height = 13
              Caption = 'Legenda'
            end
            object lblCartaEnvio: TLabel
              Left = 1020
              Top = 102
              Width = 85
              Height = 13
              Caption = 'Carta de Envio'
            end
            object lblNup: TLabel
              Left = 1020
              Top = 143
              Width = 27
              Height = 13
              Caption = 'NUP'
            end
            object dblkParamPessoa: TwwDBLookupCombo
              Left = 24
              Top = 56
              Width = 337
              Height = 21
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Parâmetro'#9'F'
                'IDPARAM'#9'10'#9'Código'#9'F')
              DataField = 'IDPARAM'
              DataSource = dsOutrasInforms
              LookupTable = qryParamPessoa
              LookupField = 'IDPARAM'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblkParamPessoaCloseUp
            end
            object dbedValor: TwwDBEdit
              Left = 24
              Top = 118
              Width = 337
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR'
              DataSource = dsOutrasInforms
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dtInicio: TCMDateTimePicker
              Left = 24
              Top = 170
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsOutrasInforms
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
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
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object DtFim: TCMDateTimePicker
              Left = 195
              Top = 170
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFIM'
              DataSource = dsOutrasInforms
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
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
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 3
            end
            object edValida: TEdit
              Left = 411
              Top = 118
              Width = 255
              Height = 21
              CharCase = ecUpperCase
              Color = clInfoBk
              Enabled = False
              TabOrder = 4
            end
            object DBMemo2: TDBMemo
              Left = 411
              Top = 157
              Width = 255
              Height = 67
              DataField = 'LEGENDA'
              DataSource = dsParamPessoa
              Enabled = False
              MaxLength = 200
              TabOrder = 5
              OnKeyPress = DBMemoKeyPress
            end
            object edtCartaEnvio: TwwDBEdit
              Left = 1020
              Top = 118
              Width = 141
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CE'
              DataSource = dsOutrasInforms
              MaxLength = 18
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtNup: TwwDBEdit
              Left = 1020
              Top = 157
              Width = 141
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUP'
              DataSource = dsOutrasInforms
              MaxLength = 9
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object gbxInforAdicionais: TGroupBox
              Left = 246
              Top = 125
              Width = 501
              Height = 197
              Caption = 'Informações Adicionais'
              TabOrder = 8
              Visible = False
              object Label70: TLabel
                Left = 20
                Top = 36
                Width = 339
                Height = 13
                Caption = 'Ocupação Profissional - Cargo, Empresa ou Função Pública'
              end
              object Label71: TLabel
                Left = 20
                Top = 88
                Width = 51
                Height = 13
                Caption = 'Entidade'
              end
              object Label72: TLabel
                Left = 20
                Top = 148
                Width = 38
                Height = 13
                Caption = 'Renda'
              end
              object Label73: TLabel
                Left = 160
                Top = 148
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object Label74: TLabel
                Left = 332
                Top = 148
                Width = 51
                Height = 13
                Caption = 'Data Fim'
              end
              object dbeOcupProfissional: TwwDBEdit
                Left = 20
                Top = 52
                Width = 457
                Height = 21
                DataField = 'CARGOEMPFUNC'
                DataSource = dsOcupacao
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbeEntidade: TwwDBEdit
                Left = 20
                Top = 104
                Width = 457
                Height = 21
                DataField = 'ENTIDADE'
                DataSource = dsOcupacao
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dtpDataInicio: TCMDateTimePicker
                Left = 160
                Top = 164
                Width = 150
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTINICIO'
                DataSource = dsOcupacao
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 3
              end
              object dtpDataFim: TCMDateTimePicker
                Left = 328
                Top = 164
                Width = 150
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTFIM'
                DataSource = dsOcupacao
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 4
              end
              object dbeRenda: TDBRealEdit
                Left = 20
                Top = 164
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'RENDA'
                DataSource = dsOcupacao
              end
            end
          end
          object pnlMemo: TPanel
            Left = 0
            Top = 295
            Width = 1236
            Height = 102
            Align = alBottom
            TabOrder = 3
            object lblInfoAdicionais: TLabel
              Left = 1
              Top = 2
              Width = 132
              Height = 13
              Align = alBottom
              Caption = 'Informações Adicionais'
            end
            object dbMemInfoAdicionais: TDBMemo
              Left = 1
              Top = 15
              Width = 1234
              Height = 86
              Align = alBottom
              DataField = 'INFOADICIONAIS'
              DataSource = dsPF2
              TabOrder = 0
            end
          end
          object gbxBotoes: TGroupBox
            Left = 0
            Top = 145
            Width = 1236
            Height = 37
            Align = alTop
            TabOrder = 2
            object tb97BotoesDetalhe2: TPanel
              Left = 3
              Top = 6
              Width = 77
              Height = 30
              TabOrder = 0
              object sbtnInsDet2: TToolbarButton97
                Left = -1
                Top = 3
                Width = 25
                Height = 25
                Hint = 'Inserir'
                AllowAllUp = True
                GroupIndex = 2
                ImageIndex = 0
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnInsDet2Click
              end
              object sbtnAltDet2: TToolbarButton97
                Left = 24
                Top = 3
                Width = 25
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                ImageIndex = 1
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAltDet2Click
              end
              object sbtnExcluiDet2: TToolbarButton97
                Left = 49
                Top = 3
                Width = 25
                Height = 25
                Hint = 'Excluir'
                AllowAllUp = True
                ImageIndex = 2
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnExcluiDet2Click
              end
            end
            object edPaiDetalhe2: TEdit
              Left = 85
              Top = 14
              Width = 508
              Height = 21
              BorderStyle = bsNone
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = 'Informações Adicionais (Pessoa Politicamente Exposta)'
            end
          end
        end
        object tbsReprLegal: TTabSheet
          Caption = 'Representante Legal'
          ImageIndex = 10
          object pnlReprLegal: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            TabOrder = 0
            object grpResponsavel: TGroupBox
              Left = 6
              Top = 10
              Width = 595
              Height = 110
              Caption = 'Responsável'
              TabOrder = 0
              object sbtnSelResponsavel: TSpeedButton
                Left = 536
                Top = 32
                Width = 25
                Height = 25
                Hint = 'Selecionar Responsável já cadastrado'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
                  300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
                  330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
                  333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
                  339977FF777777773377000BFB03333333337773FF733333333F333000333333
                  3300333777333333337733333333333333003333333333333377333333333333
                  333333333333333333FF33333333333330003333333333333777333333333333
                  3000333333333333377733333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnSelResponsavelClick
              end
              object sbtnCadResponsavel: TSpeedButton
                Left = 564
                Top = 32
                Width = 25
                Height = 25
                Hint = 'Cadastra Novo Responsável'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                  333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                  0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                  07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                  0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                  33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                  B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                  3BB33773333773333773B333333B3333333B7333333733333337}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnCadResponsavelClick
              end
              object Labellbl1: TLabel
                Left = 156
                Top = 17
                Width = 128
                Height = 13
                Caption = 'Nome do Responsável'
              end
              object Labellbl2: TLabel
                Left = 8
                Top = 60
                Width = 121
                Height = 13
                Caption = 'Tipo de Responsável'
              end
              object LabelCPFRes: TLabel
                Left = 8
                Top = 17
                Width = 24
                Height = 13
                Caption = 'CPF'
              end
              object dbeResponsavel: TDBEdit
                Left = 155
                Top = 34
                Width = 366
                Height = 21
                TabStop = False
                CharCase = ecUpperCase
                Color = clBtnFace
                DataField = 'NOMERESPONSAVEL'
                DataSource = dsReprLegal
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object lkpcmbTipoRecebedor: TCMDBLookupCombo
                Left = 8
                Top = 77
                Width = 377
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Tipo de Recebedor'#9'F'
                  'CODTIPORECEBEDOR'#9'5'#9'Código'#9'F')
                DataField = 'CODTIPORESPONSAVEL'
                DataSource = dsReprLegal
                LookupTable = qryTipoRecebedor
                LookupField = 'CODTIPORECEBEDOR'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object DBeCPFRes: TwwDBEdit
                Left = 8
                Top = 34
                Width = 136
                Height = 21
                CharCase = ecUpperCase
                Color = clBtnFace
                DataField = 'NUMDOCUMENTO'
                DataSource = dsReprLegal
                Enabled = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grp1: TGroupBox
              Left = 5
              Top = 124
              Width = 595
              Height = 72
              Caption = 'Informações'
              TabOrder = 1
              object Labellbl5: TLabel
                Left = 8
                Top = 18
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object Labellbl3: TLabel
                Left = 143
                Top = 18
                Width = 65
                Height = 13
                Caption = 'Data Limite'
              end
              object tmpckrDATAINICIO: TCMDateTimePicker
                Left = 8
                Top = 36
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
                DataSource = dsReprLegal
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
                OnCloseUp = timepickerDATAChange
                OnExit = timepickerDATAChange
              end
              object rgSituacaoAtual: TRadioGroup
                Left = 297
                Top = 14
                Width = 257
                Height = 43
                Caption = 'Situação Atual'
                Columns = 3
                Items.Strings = (
                  'Vigente'
                  'Vencida'
                  'Extinta')
                TabOrder = 2
                OnClick = rgSituacaoAtualClick
              end
              object tmpckrDATAtermino: TCMDateTimePicker
                Left = 143
                Top = 36
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATATERMINO'
                DataSource = dsReprLegal
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                OnCloseUp = timepickerDATAChange
                OnExit = timepickerDATAChange
              end
            end
            object grpObs: TGroupBox
              Left = 5
              Top = 203
              Width = 595
              Height = 80
              Caption = 'Observações'
              TabOrder = 2
              object dbmmoOBSERVACAO: TDBMemo
                Left = 8
                Top = 16
                Width = 577
                Height = 48
                DataField = 'OBSERVACAO'
                DataSource = dsReprLegal
                MaxLength = 500
                ScrollBars = ssVertical
                TabOrder = 0
                OnKeyPress = DBMemoKeyPress
              end
            end
          end
          object pnlGrdReprLegal: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            TabOrder = 1
            object dbgrdLogReprLegal: TwwDBGrid
              Left = 1
              Top = 171
              Width = 1234
              Height = 225
              Selected.Strings = (
                'ACAO'#9'18'#9'Ação'
                'NUMDOCUMENTO'#9'18'#9'CPF do Responsável'
                'NOMERESPONSAVEL'#9'19'#9'Nome do Responsável'
                'TIPORESPONSAVEL'#9'18'#9'Tipo de Responsável'
                'DATAINICIO'#9'10'#9'Data Início'
                'DATATERMINO'#9'10'#9'Data Limite'
                'SITUACAO'#9'8'#9'Situação'
                'OBSERVACAO100'#9'10'#9'Observação'
                'NOMERECEBEDOR'#9'19'#9'Nome do Recebedor'
                'TRGDTINCLUSAO'#9'13'#9'Data Inclusão'
                'NOMEUSUARIO'#9'16'#9'Usuário Inclusão')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alBottom
              DataSource = dsLogReprLegal
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object dbgrdReprLegal: TwwDBGrid
              Left = 1
              Top = 1
              Width = 1234
              Height = 170
              Selected.Strings = (
                'NUMDOCUMENTO'#9'18'#9'CPF do Responsável'
                'NOMERESPONSAVEL'#9'19'#9'Nome do Responsável'
                'TIPORESPONSAVEL'#9'18'#9'Tipo de Responsável'
                'DATAINICIO'#9'10'#9'Data Início'
                'DATATERMINO'#9'10'#9'Data Limite'
                'SITUACAO'#9'8'#9'Situação'
                'OBSERVACAO100'#9'10'#9'Observação'
                'NOMERECEBEDOR'#9'19'#9'Nome do Recebedor'
                'TRGDTINCLUSAO'#9'13'#9'Data Alteração'
                'NOMEUSUARIO'#9'16'#9'Usuário Alteração')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsReprLegal
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
        object tbsPerfilInvest: TTabSheet
          Caption = 'Perfil de Investimento'
          ImageIndex = 11
          object dbgrdPerfilinvest: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Selected.Strings = (
              'PLANPREV'#9'30'#9'Plano Previdenciário'
              'NOMEPERFIL'#9'30'#9'Nome do Perfil'
              'PLANCONTABIL'#9'30'#9'Plano Contábil'
              'DTINICIO'#9'15'#9'Data Início'
              'DTFIM'#9'15'#9'Data Fim')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPerfilInvest
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlPerfilInvest: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 397
            Align = alClient
            TabOrder = 0
            object gpPerfilInvest: TGroupBox
              Left = 12
              Top = 12
              Width = 329
              Height = 209
              Caption = 'Informações'
              TabOrder = 0
              object lblPlanPrev: TLabel
                Left = 11
                Top = 24
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
              end
              object lnlNomePerfil: TLabel
                Left = 11
                Top = 69
                Width = 84
                Height = 13
                Caption = 'Nome do Perfil'
              end
              object lblDtiniPI: TLabel
                Left = 11
                Top = 159
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object lbldtFimPI: TLabel
                Left = 159
                Top = 159
                Width = 51
                Height = 13
                Caption = 'Data Fim'
              end
              object lblPlanoCont: TLabel
                Left = 11
                Top = 111
                Width = 83
                Height = 13
                Caption = 'Plano Contábil'
              end
              object lckupNomePerfilPI: TwwDBLookupCombo
                Left = 11
                Top = 84
                Width = 277
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEPERFIL'#9'60'#9'Nome do Perfil'#9'F')
                DataField = 'IDPERFILINVEST'
                DataSource = dsPerfilInvest
                LookupTable = qryNomePI
                LookupField = 'IDPERFILINVEST'
                Options = [loTitles]
                AutoSelect = False
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = lckupNomePerfilPICloseUp
              end
              object dtDtIniPI: TCMDateTimePicker
                Left = 11
                Top = 172
                Width = 130
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTINICIO'
                DataSource = dsPerfilInvest
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 3
              end
              object dtDtFimPI: TCMDateTimePicker
                Left = 159
                Top = 172
                Width = 130
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTFIM'
                DataSource = dsPerfilInvest
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 4
              end
              object lckupPlanPrevPI: TwwDBLookupCombo
                Left = 11
                Top = 39
                Width = 277
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                CharCase = ecUpperCase
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Plano Previdenciário')
                DataField = 'IDPP'
                DataSource = dsPerfilInvest
                LookupTable = qryPlanPrevPI
                LookupField = 'IDPLANOPREV'
                Options = [loTitles]
                AutoSelect = False
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = lckupPlanPrevPICloseUp
              end
              object edtPlanoContPI: TEdit
                Left = 11
                Top = 126
                Width = 276
                Height = 21
                Color = clSilver
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        object lblNomePai: TLabel [0]
          Left = 413
          Top = 9
          Width = 9
          Height = 13
          Align = alLeft
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited tb97BotoesDetalhe: TToolbar97
          object sbtnConsContrib: TSpeedButton
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Consultar contribuições'
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000012000000120000000100
              040000000000D800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDD
              00DDDDD00DDDDD000000DDDD070000070DDDDD000000DDD0707777700DDDDD00
              0000DD077777777770DDDD000000DD07777777777F0DDD000000D07777777777
              700DDD000000D0777777777777700D000000D0777777777777770D000000D077
              00777770F7770D000000DD07FF00077F7700DD000000DDD007FFF77770DDDD00
              0000DDDDD00000700DDDDD000000DDDDDDDDDD00DDDDDD000000DDDDDDDDDDD0
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            Layout = blGlyphTop
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sbtnConsContribClick
          end
        end
        inherited tb97TituloDetalhe: TToolbar97
          Left = 104
          DockPos = 104
        end
      end
      inherited Dock974: TDock97
        Height = 425
        inherited tb97Detalhe: TToolbar97
          object bbtnOpcoes: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Hint = 'Verificar Regra de Concessão do Benefício'
            Cancel = True
            Caption = '&Opções'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnOpcoesClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
              F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
              0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
              00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
              DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
              0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
              DDDDD0000000}
          end
        end
      end
    end
    inherited pnlMestre: TPanel
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
      inherited lblDocumento: TLabel
        Width = 24
        Caption = 'CPF'
      end
      inherited lblEMail: TLabel
        Left = 448
      end
      inherited LblHomePage_Padrao: TLabel
        Left = 768
      end
      inherited lblMsg: TLabel
        Left = 944
        Top = 28
      end
      object Label69: TLabel [8]
        Left = 592
        Top = 8
        Width = 114
        Height = 13
        Caption = 'Email base FUNCEF'
      end
      inherited dbedNomeFantasia: TDBEdit
        OnKeyPress = dbedNomeFantasiaKeyPress
      end
      inherited dbedDocumento: TwwDBEdit
        OnEnter = dbedDocumentoEnter
      end
      inherited dbedRazaoSocial: TDBEdit
        TabOrder = 5
      end
      inherited dbedemail: TwwDBEdit
        Left = 448
        Width = 137
      end
      inherited edDBGrupo: TwwDBEdit
        TabOrder = 6
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 768
        Width = 169
        TabOrder = 4
      end
      object EdtEmailParticular: TEdit
        Left = 592
        Top = 23
        Width = 169
        Height = 21
        TabOrder = 3
      end
    end
    object ImportPanel: TPanel
      Left = 1061
      Top = 2
      Width = 297
      Height = 51
      BevelOuter = bvNone
      TabOrder = 2
      object LblImportarArquivo: TLabel
        Left = 12
        Top = 29
        Width = 94
        Height = 13
        Caption = 'Importar Arquivo'
      end
      object EdtImportarArquivo: TEdit
        Left = 109
        Top = 23
        Width = 153
        Height = 21
        TabOrder = 0
      end
      object Buscar: TBitBtn
        Left = 263
        Top = 22
        Width = 25
        Height = 21
        TabOrder = 1
        OnClick = BuscarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = True
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 586
    inherited tb97Fundo: TToolbar97
      Left = 568
      DockPos = 568
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 399
      DockPos = 399
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 126
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = frmPessoa.qryEndereco
    Left = 322
    Top = 29
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 711
    Top = 16
  end
  inherited upd: TUpdateSQL
    Left = 269
    Top = 568
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Elegível/Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NOME'
      'PLANPREV.NOME'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'SITFUNC.DESCRICAO'
      'PESSJUR.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição Número'
      'Nome'
      'Plano '
      'Sit. na Fundação'
      'Sit. no Plano '
      'Sit. na Patrocinadora'
      'Patrocinadora'
      'CPF')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      
        '(SELECT NOME,PE.IDPESSOA FROM PESSOA PE,PATRO PA WHERE PE.IDPESS' +
        'OA = PA.IDPESSOA)PESSJUR'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'ELEGIVEL'
      'SITPART'
      'SITPLANOPREV'
      'SITFUNC'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGIVEL.IDPESSOA'
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=ELEGIVEL.IDPESSOA'
      'ELEGIVEL.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA'
      '( PARTPREVPLAN.IDPESSOA(+) = ELEGPATRO.IDPESSOA )'
      '( PARTPREVPLAN.IDPESSJUR(+) = ELEGPATRO.IDPESSJUR )'
      '( SITPART.IDSITPART(+) = PARTPREVPLAN.IDSITPART )'
      '( SITPLANOPREV.IDSITPLANOPREV(+) = PARTPREVPLAN.IDSITPLANOPREV )'
      '( SITFUNC.IDSITFUNC(+) = ELEGPATRO.IDSITFUNC )'
      ' PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '50'
      '40'
      '40'
      '40'
      '20'
      '18')
    Left = 504
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 713
    Top = 168
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 141
    Top = 201
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      ' PESSOA.IDPESSOA ,'
      ' PESSOA.IDIMAGEM,'
      ' PESSOA.NOME ,'
      ' PESSOA.TIPO ,'
      ' PESSOA.RAZAOSOCIAL ,'
      ' PESSOA.NUMDOCUMENTO ,'
      ' PESSOA.IDDOCUMENTO ,'
      ' PESSOA.EMAIL ,'
      ' PESSOA.IDGRUPO,'
      ' PESSOA.IDENDCOMERCIAL,'
      ' PESSOA.IDENDRESIDENCIAL,'
      ' PESSOA.IDENDENTREGA,'
      ' PESSOA.IDENDCOBRANCA,'
      ' PESSOA.IDENDCORRESP,'
      ' G.NOME AS NOMEGRUPO,'
      ' PESSOA.HOMEPAGE,'
      ' PESSOA.IDMODULORESPON,'
      ' MODULO.NOMEMODULO'
      ''
      'FROM PESSOA, PESSOA g, MODULO'
      'WHERE ( PESSOA.IDPESSOA =:IdPessoa )  AND'
      '      ( PESSOA.IDGRUPO = G.IDPESSOA(+)  ) AND'
      '      ( PESSOA.IDMODULORESPON = MODULO.IDMODULO(+) )'
      ''
      ' '
      '')
    Left = 916
    Top = 205
    inherited qryNUMDOCUMENTO: TStringField
      DisplayWidth = 30
      Size = 30
    end
  end
  object qryElegPatro: TwwQuery [11]
    CachedUpdates = True
    BeforePost = qryElegPatroBeforePost
    AfterScroll = qryElegPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT distinct E.IDPESSJUR ,             E.IDPESSOA ,          ' +
        '            E.IDSITFUNC ,'
      
        '       E.CODCENTROCUSTO ,        E.IDCARGOEXT ,                 ' +
        '   E.MATRICULA ,'
      
        '       E.DATAADMISSAO ,          E.SALTOTAL ,                   ' +
        '   E.PARTICIPPREVID ,'
      
        '       E.PARTICIPASSIST ,        E.IDEMPRESAPROP ,              ' +
        '   E.NIVEL,'
      '       E.DATAINICIOAFAST,        E.DATAFIMAFAST,'
      
        '       E.IDESTAB,                E.TEMPONAOCREDITADO,           ' +
        '   E.TEMPOSERVANTERIOR,'
      '       E.TEMPOSERVANTREAL,'
      '       E.DATADEMISSAO,'
      '       E.TEMPOSITESPECIAL,        E.VALORBASE1,    E.VALORBASE2,'
      '       E.VALORBASE3, E.VALORBASE4, E.VALORBASE5, E.VALORBASE6,'
      '       E.IDPESSJURORGAO, E.SIGLA, E.FLGDIRETOR,    VF.DESCRICAO,'
      '       E.CODVINCULAFUNC,'
      '       P.NOME AS PATROCINADORA,'
      '       SITFUNC.DESCRICAO AS SITFUNC,'
      '       E.DATAREADMISSAO,'
      '       FILIAL.NOME FILIAL,'
      
        '       DECODE(:FLGVEIODOMENU,1,E.DATADEMISSAO,NULL) AS DATADEMIS' +
        'SAO,'
      '       G.CODIGO AS CODGRUPO,'
      '       F.CODIGO AS CODFUNCAO,'
      '       F.TITULO AS FUNCAO,'
      '       C.CODIGO AS CODCARGO,'
      '       C.TITULO AS CARGO,'
      '       DECODE(EV.MODOFUNCAO,'
      '                      '#39'EF'#39', '#39'EFETIVA'#39','
      '                      '#39'AS'#39', '#39'ASSEGURADA'#39'       ,'
      '                      '#39'ES'#39', '#39'EVENTUAL/SUBSTITUIÇÃO'#39' ,'
      '                      '#39'DP'#39', '#39'DESIGNAÇÃO POR PRAZO'#39'  ,'
      '                      '#39'FA'#39', '#39'FACULTATIVA'#39'           ,'
      '                      '#39'BF'#39', '#39'BOLSA DE FUNÇÃO'#39'       ,'
      '                      '#39'NE'#39', '#39'NÃO EFETIVA'#39'           , '
      '                      '#39'ET'#39', '#39'ESTRATÉGICA'#39') AS MODOFUNCAO,'
      '       E.IDPESSJURCEDIDO,'
      '       E.DTNOMEACAO,'
      '       E.DTEXONERACAO,'
      '      --SIG 37689 -INICIO'
      '      E.TEMPOSERVTOTAL,'
      '      E.TEMPOSERVTOTMES,'
      '      E.TEMPOSERVTOTDIA'
      '     --SIG 37689 -FIM'
      
        'FROM  PESSOA P, PESSOA FILIAL, ELEGPATRO E, SITFUNC SITFUNC, VIN' +
        'CULAFUNC VF,'
      '      CARGOEXT C, CARGOEXT F, EVOLFUNCPREV EV, GRUPOFUNC G,'
      '      ( SELECT MAX(DATAINICIO) DATAFUNCAO FROM EVOLFUNCPREV'
      '                               WHERE  IDPESSOA = :IDPESSOA'
      '                               AND    IDFUNCAO IS NOT NULL'
      '                               AND    PERCFUNCAO IS NOT NULL'
      
        '                               AND    MODOFUNCAO = '#39'EF'#39') MAIORDA' +
        'TA'
      'WHERE E.IDPESSOA           = :IDPESSOA'
      
        'AND   ( (-1 = :IDPESSJUR) OR (-1 <> :IDPESSJUR AND E.IDPESSJUR =' +
        ' :IDPESSJUR) )'
      'AND   P.IDPESSOA           = E.IDPESSJUR'
      'AND   FILIAL.IDPESSOA(+)   = E.IDESTAB'
      'AND   SITFUNC.IDSITFUNC(+) = E.IDSITFUNC'
      'AND   VF.CODVINCULAFUNC(+) = E.CODVINCULAFUNC'
      'AND   C.IDCARGOEXT(+)      = E.IDCARGOEXT'
      'AND   C.IDPESSJUR(+)       = E.IDPESSJUR'
      'AND   F.IDCARGOEXT(+)      = E.IDFUNCAOEXT'
      'AND   F.IDPESSJUR(+)       = E.IDPESSJUR'
      'AND   EV.IDPESSJUR(+)'#9'   = E.IDPESSJUR'
      'AND   EV.IDPESSOA(+)       = E.IDPESSOA'
      
        '/*AND   EV.IDFUNCAO(+)       = E.IDFUNCAOEXT   Sol 94243 / Kinta' +
        'na 409689*/'
      'AND   EV.IDFUNCAO(+)       = E.IDFUNCAOEXT'
      'AND   EV.Idcargoext(+)       = E.Idcargoext'
      
        'AND   ((EV.DATAINICIO      = MAIORDATA.DATAFUNCAO ) OR (EV.DATAI' +
        'NICIO IS NULL) )'
      'AND   G.IDGRUPOFUNC(+)     = EV.IDGRUPOFUNC')
    UpdateObject = updElegPatro
    ControlType.Strings = (
      'PARTICIPPREVID;CheckBox;1;0'
      'PARTICIPASSIST;CheckBox;1;0'
      'FLGDIRETOR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 667
    Top = 182
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FLGVEIODOMENU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '2037'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryElegPatroMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 11
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryElegPatroPATROCINADORA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryElegPatroFILIAL: TStringField
      DisplayLabel = 'Filial'
      DisplayWidth = 25
      FieldName = 'FILIAL'
      Size = 60
    end
    object qryElegPatroDTNOMEACAO: TDateTimeField
      DisplayLabel = 'Data Nomeação'
      DisplayWidth = 18
      FieldName = 'DTNOMEACAO'
    end
    object qryElegPatroDTEXONERACAO: TDateTimeField
      DisplayLabel = 'Data Exoneração'
      DisplayWidth = 18
      FieldName = 'DTEXONERACAO'
    end
    object qryElegPatroDATAADMISSAO: TDateTimeField
      DisplayLabel = 'Data de ~Admissão'
      DisplayWidth = 12
      FieldName = 'DATAADMISSAO'
    end
    object qryElegPatroDATADEMISSAO: TDateTimeField
      DisplayLabel = 'Data de~Demissão'
      DisplayWidth = 18
      FieldName = 'DATADEMISSAO'
    end
    object qryElegPatroDATAREADMISSAO: TDateTimeField
      DisplayLabel = 'Data de~Readmissão'
      DisplayWidth = 18
      FieldName = 'DATAREADMISSAO'
    end
    object qryElegPatroSITFUNC: TStringField
      DisplayLabel = 'Situação do Empregrado ~na Patrocinadora'
      DisplayWidth = 11
      FieldName = 'SITFUNC'
      Size = 60
    end
    object qryElegPatroDESCRICAO: TStringField
      DisplayLabel = 'Vinculação~Funcional'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryElegPatroSALTOTAL: TFloatField
      DisplayLabel = 'Salário'
      DisplayWidth = 10
      FieldName = 'SALTOTAL'
      DisplayFormat = '##0.00'
      AttributeSet = 'Salary'
    end
    object qryElegPatroNIVEL: TStringField
      DisplayLabel = 'Nível'
      DisplayWidth = 5
      FieldName = 'NIVEL'
      Size = 15
    end
    object qryElegPatroCODCARGO: TStringField
      DisplayLabel = 'Cargo ~Atual(Cód)'
      DisplayWidth = 15
      FieldName = 'CODCARGO'
      Size = 15
    end
    object qryElegPatroCARGO: TStringField
      DisplayLabel = 'Cargo ~Atual'
      DisplayWidth = 40
      FieldName = 'CARGO'
      Size = 40
    end
    object qryElegPatroCODFUNCAO: TStringField
      DisplayLabel = 'Função ~Atual(Cód)'
      DisplayWidth = 15
      FieldName = 'CODFUNCAO'
      Size = 15
    end
    object qryElegPatroFUNCAO: TStringField
      DisplayLabel = 'Função ~Atual'
      DisplayWidth = 40
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryElegPatroCODGRUPO: TStringField
      DisplayLabel = 'Grupo Função ~Atual(Cód)'
      DisplayWidth = 15
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryElegPatroMODOFUNCAO: TStringField
      DisplayLabel = 'Modo Função ~Atual'
      DisplayWidth = 21
      FieldName = 'MODOFUNCAO'
      Size = 21
    end
    object qryElegPatroCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 13
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryElegPatroFLGDIRETOR: TFloatField
      DisplayLabel = 'Exerceu Cargo~de Diretoria'
      DisplayWidth = 10
      FieldName = 'FLGDIRETOR'
    end
    object qryElegPatroTEMPOSERVANTERIOR: TFloatField
      DisplayLabel = 'Tempo de ~Serviço Anterior'
      DisplayWidth = 10
      FieldName = 'TEMPOSERVANTERIOR'
    end
    object qryElegPatroTEMPONAOCREDITADO: TFloatField
      DisplayLabel = 'Tempo de ~Contrib. Não Cred.'
      DisplayWidth = 10
      FieldName = 'TEMPONAOCREDITADO'
    end
    object qryElegPatroVALORBASE1: TFloatField
      DisplayLabel = 'Opção 1'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
    end
    object qryElegPatroVALORBASE2: TFloatField
      DisplayLabel = 'Opçaõ 2'
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
    end
    object qryElegPatroVALORBASE3: TFloatField
      DisplayLabel = 'Opção 3'
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
    end
    object qryElegPatroIDSITFUNC: TFloatField
      DisplayLabel = 'idsitfunc'
      DisplayWidth = 10
      FieldName = 'IDSITFUNC'
      Visible = False
    end
    object qryElegPatroPARTICIPPREVID: TFloatField
      DisplayLabel = 'Participante ~Previdenciário'
      DisplayWidth = 12
      FieldName = 'PARTICIPPREVID'
      Visible = False
    end
    object qryElegPatroPARTICIPASSIST: TFloatField
      DisplayLabel = 'Participante ~Assistencial'
      DisplayWidth = 10
      FieldName = 'PARTICIPASSIST'
      Visible = False
    end
    object qryElegPatroCODVINCULAFUNC: TStringField
      DisplayWidth = 5
      FieldName = 'CODVINCULAFUNC'
      Visible = False
      Size = 5
    end
    object qryElegPatroIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryElegPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryElegPatroIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryElegPatroIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Visible = False
    end
    object qryElegPatroDATAINICIOAFAST: TDateTimeField
      FieldName = 'DATAINICIOAFAST'
      Visible = False
    end
    object qryElegPatroDATAFIMAFAST: TDateTimeField
      FieldName = 'DATAFIMAFAST'
      Visible = False
    end
    object qryElegPatroIDESTAB: TFloatField
      FieldName = 'IDESTAB'
      Visible = False
    end
    object qryElegPatroTEMPOSERVANTREAL: TFloatField
      FieldName = 'TEMPOSERVANTREAL'
      Visible = False
    end
    object qryElegPatroTEMPOSITESPECIAL: TFloatField
      FieldName = 'TEMPOSITESPECIAL'
      Visible = False
    end
    object qryElegPatroVALORBASE4: TFloatField
      FieldName = 'VALORBASE4'
      Visible = False
    end
    object qryElegPatroVALORBASE5: TFloatField
      FieldName = 'VALORBASE5'
      Visible = False
    end
    object qryElegPatroVALORBASE6: TFloatField
      FieldName = 'VALORBASE6'
      Visible = False
    end
    object qryElegPatroIDPESSJURORGAO: TFloatField
      FieldName = 'IDPESSJURORGAO'
      Visible = False
    end
    object qryElegPatroSIGLA: TStringField
      FieldName = 'SIGLA'
      Visible = False
      Size = 15
    end
    object qryElegPatroIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
      Visible = False
    end
    object qryElegPatroTEMPOSERVTOTAL: TFloatField
      FieldName = 'TEMPOSERVTOTAL'
    end
    object qryElegPatroTEMPOSERVTOTMES: TFloatField
      FieldName = 'TEMPOSERVTOTMES'
    end
    object qryElegPatroTEMPOSERVTOTDIA: TFloatField
      FieldName = 'TEMPOSERVTOTDIA'
    end
  end
  object dsElegPatro: TwwDataSource [12]
    DataSet = qryElegPatro
    Left = 437
    Top = 9
  end
  object qryPatro: TwwQuery [13]
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA,         P.NOME,              PT.IDREGRAMATRIC' +
        'ULA,'
      '       PT.NUMOPCOES,'
      
        '       PT.NOMEVALORBASE1,   PT.NOMEVALORBASE2,   PT.NOMEVALORBAS' +
        'E3,'
      '       PT.FLGOBRIGAOP1,     PT.FLGOBRIGAOP2,   PT.FLGOBRIGAOP3,'
      '       PT.FLGEDITAOP1,      PT.FLGEDITAOP2,   PT.FLGEDITAOP3,'
      
        '       PT.IDREGRACALCOP1,   PT.IDREGRACALCOP2,   PT.IDREGRACALCO' +
        'P3,'
      
        '       PT.IDREGRAVALIDAOP1, PT.IDREGRAVALIDAOP2,  PT.IDREGRAVALI' +
        'DAOP3,'
      
        '       PT.NOMEVALORBASE4,   PT.NOMEVALORBASE5,   PT.NOMEVALORBAS' +
        'E6,'
      '       PT.FLGOBRIGAOP4,     PT.FLGOBRIGAOP5,   PT.FLGOBRIGAOP6,'
      '       PT.FLGEDITAOP4,      PT.FLGEDITAOP5,   PT.FLGEDITAOP6,'
      
        '       PT.IDREGRACALCOP4,   PT.IDREGRACALCOP5,   PT.IDREGRACALCO' +
        'P6,'
      
        '       PT.IDREGRAVALIDAOP4, PT.IDREGRAVALIDAOP5,  PT.IDREGRAVALI' +
        'DAOP6'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  P.IDPESSOA = PT.IDPESSOA'
      'AND    PT.IDFUNDACAO =:IDFUNDACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 189
    Top = 133
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qrySitFunc: TwwQuery [14]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITFUNC,DESCRICAO'
      'FROM SITFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 23
    Top = 491
    object qrySitFuncDESCRICAO: TStringField
      DisplayLabel = 'Situação do Funcionário'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'SITFUNC.DESCRICAO'
      Size = 60
    end
    object qrySitFuncIDSITFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITFUNC'
      Origin = 'SITFUNC.IDSITFUNC'
      Visible = False
    end
  end
  object qryCargo: TwwQuery [15]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGOEXT, TITULO, CODIGO'
      'FROM   CARGOEXT'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'ORDER BY TITULO')
    ValidateWithMask = True
    Left = 612
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryCCusto: TwwQuery [16]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CENTCUST."IDEMPRESA" , '
      ' CENTCUST."CODCENTROCUSTO" , '
      ' CENTCUST."IDUSUARIOINCLUSAO" , '
      ' CENTCUST."NOME" , '
      ' CENTCUST."STATUSGRUPOCDC" , '
      ' CENTCUST."RESPONSAVEL" , '
      ' CENTCUST."CODREDUZIDO" , '
      ' CENTCUST."ATIVO"'
      'FROM "CENTCUST" CENTCUST'
      'WHERE CENTCUST.IDEMPRESA = :IDEMPRESA')
    ValidateWithMask = True
    Left = 507
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object updElegPatro: TUpdateSQL [17]
    ModifySQL.Strings = (
      'update ELEGPATRO'
      'set'
      '  IDSITFUNC = :IDSITFUNC,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  MATRICULA = :MATRICULA,'
      '  DATAADMISSAO = :DATAADMISSAO,'
      '  SALTOTAL = :SALTOTAL,'
      '  PARTICIPPREVID = :PARTICIPPREVID,'
      '  PARTICIPASSIST = :PARTICIPASSIST,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  NIVEL = :NIVEL,'
      '  DATAINICIOAFAST = :DATAINICIOAFAST,'
      '  DATAFIMAFAST = :DATAFIMAFAST,'
      '  IDESTAB = :IDESTAB,'
      '  TEMPONAOCREDITADO = :TEMPONAOCREDITADO,'
      '  TEMPOSERVANTERIOR = :TEMPOSERVANTERIOR,'
      '  TEMPOSERVANTREAL = :TEMPOSERVANTREAL,'
      '  DATADEMISSAO = :DATADEMISSAO,'
      '  TEMPOSITESPECIAL = :TEMPOSITESPECIAL,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  VALORBASE4 = :VALORBASE4,'
      '  VALORBASE5 = :VALORBASE5,'
      '  VALORBASE6 = :VALORBASE6,'
      '  IDPESSJURORGAO = :IDPESSJURORGAO,'
      '  SIGLA = :SIGLA,'
      '  FLGDIRETOR = :FLGDIRETOR,'
      '  CODVINCULAFUNC = :CODVINCULAFUNC,'
      '  DATAREADMISSAO = :DATAREADMISSAO,'
      '  IDPESSJURCEDIDO = :IDPESSJURCEDIDO,'
      '  DTNOMEACAO = :DTNOMEACAO,'
      '  DTEXONERACAO = :DTEXONERACAO,'
      '  TEMPOSERVTOTAL = :TEMPOSERVTOTAL,'
      '  TEMPOSERVTOTMES = :TEMPOSERVTOTMES,'
      '  TEMPOSERVTOTDIA = :TEMPOSERVTOTDIA '
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into ELEGPATRO'
      
        '  (IDPESSOA, IDPESSJUR, IDSITFUNC, CODCENTROCUSTO, IDCARGOEXT, M' +
        'ATRICULA, DATAADMISSAO, SALTOTAL,'
      
        '   PARTICIPPREVID, PARTICIPASSIST, IDEMPRESAPROP, NIVEL, DATAINI' +
        'CIOAFAST,'
      
        '   DATAFIMAFAST, IDESTAB, TEMPONAOCREDITADO, TEMPOSERVANTERIOR, ' +
        'TEMPOSERVANTREAL,'
      
        '   DATADEMISSAO, TEMPOSITESPECIAL, VALORBASE1, VALORBASE2, VALOR' +
        'BASE3,'
      '   VALORBASE4, VALORBASE5, VALORBASE6,'
      
        '   IDPESSJURORGAO, SIGLA, FLGDIRETOR, CODVINCULAFUNC, DATAREADMI' +
        'SSAO, IDPESSJURCEDIDO, DTNOMEACAO, DTEXONERACAO,'
      '  TEMPOSERVTOTAL,TEMPOSERVTOTMES,TEMPOSERVTOTDIA)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR,:IDSITFUNC, :CODCENTROCUSTO, :IDCARGOEX' +
        'T, :MATRICULA, :DATAADMISSAO,'
      
        '   :SALTOTAL, :PARTICIPPREVID, :PARTICIPASSIST, :IDEMPRESAPROP, ' +
        ':NIVEL,'
      
        '   :DATAINICIOAFAST, :DATAFIMAFAST, :IDESTAB, :TEMPONAOCREDITADO' +
        ', :TEMPOSERVANTERIOR,'
      '   :TEMPOSERVANTREAL, :DATADEMISSAO, :TEMPOSITESPECIAL,'
      '   :VALORBASE1, :VALORBASE2,  :VALORBASE3,'
      '   :VALORBASE4, :VALORBASE5,  :VALORBASE6,'
      '   :IDPESSJURORGAO, :SIGLA, :FLGDIRETOR, :CODVINCULAFUNC,'
      
        '   :DATAREADMISSAO, :IDPESSJURCEDIDO, :DTNOMEACAO, :DTEXONERACAO' +
        ','
      '   :TEMPOSERVTOTAL,:TEMPOSERVTOTMES,:TEMPOSERVTOTDIA)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from ELEGPATRO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 861
    Top = 229
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 375
    Top = 237
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update "ELEGIVEL"'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "ELEGIVEL"'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from "ELEGIVEL"'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 859
    Top = 187
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT ELEGIVEL."IDPESSOA"'
      'FROM "ELEGIVEL" ELEGIVEL'
      'WHERE ELEGIVEL."IDPESSOA" = :IDPESSOA')
    Left = 818
    Top = 596
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020312C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203436332C203333322C203435352C203132332C2C2C2C0D0A4241
      4E434F2C42414E434F2C32302C2031302C203133302C203133352C2C2C2C2C0D
      0A20202020322C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C
      2C0D0A4944504553534F412C42414E434F2C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020312C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A3D3A4964506573736F61
      2C20202020362C2C2C2C2C2C0D0A4E554D42414E434F2C42414E434F2C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A20202020202C202D204E756D626572206F66204A6F696E732C2C2C2C2C2C0D
      0A0D0A2253454C4543542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A
      53454C4543540942414E434F2E224944504553534F4122202C2042414E434F2E
      224E554D42414E434F220D0A46524F4D092242414E434F222042414E434F0D0A
      574845524509282042414E434F2E224944504553534F4122203D3A4964506573
      736F6120292C2C2C2C2C2C2C0D0A}
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsSubTipo: TwwDataSource
    Left = 599
    Top = 233
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 41
    Top = 321
  end
  inherited updPessoaFisica: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDSINDICATO = :IDSINDICATO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDFONTRECR = :IDFONTRECR,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  IDPROFISS = :IDPROFISS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF,'
      '  NUMDEPTOT = :NUMDEPTOT,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF,'
      '  IDESTADO = :IDESTADO,'
      '  CORPESSOA = :CORPESSOA,'
      '  FLGDEFICIENTE = :FLGDEFICIENTE,'
      '  FLGMOLESTIAGRAVE = :FLGMOLESTIAGRAVE,'
      '  DATAMOLESTIAGRAVE = :DATAMOLESTIAGRAVE,'
      '  FLGSOMAIRSUPINSS = :FLGSOMAIRSUPINSS,'
      '  FLGDESTCC = :FLGDESTCC,'
      '  IDCIDADES = :IDCIDADES,'
      '  PERCIRRFJUD = :PERCIRRFJUD,'
      '  STATUSPROCJUD = :STATUSPROCJUD,'
      '  DATACONCLIMINAR = :DATACONCLIMINAR,'
      '  DATACONCJULG = :DATACONCJULG,'
      '  VLRTOTCOMPIR = :VLRTOTCOMPIR,'
      '  VLRPARCCOMPIR = :VLRPARCCOMPIR,'
      '  INICIOCOMPIR = :INICIOCOMPIR,'
      '  VLRENQUADRAMENTO = :VLRENQUADRAMENTO,'
      '  INICIOINVALIDEZ = :INICIOINVALIDEZ,'
      '  FIMINVALIDEZ = :FIMINVALIDEZ,'
      '  VLRINSS = :VLRINSS,'
      '  VLRPENSAO = :VLRPENSAO,'
      '  DATAFIMMOLESTIA = :DATAFIMMOLESTIA,  '
      '  FLGCONTASALARIOPROCESSADA = :FLGCONTASALARIOPROCESSADA,'
      '  FLGSOLICITACONTASALARIO = :FLGSOLICITACONTASALARIO,'
      '  DTCONTASALARIOPROCESSADA = :DTCONTASALARIOPROCESSADA,'
      '  DTSOLICITACONTASALARIO = :DTSOLICITACONTASALARIO,'
      '  TIPOISENCAOIRRF = :TIPOISENCAOIRRF,'
      '  EMAILFUNCEF = :EMAILFUNCEF,'
      '  NOMECONJUGE = :NOMECONJUGE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDSINDICATO, EMAILFUNCEF, IDPESSOA, CODESTADO, IDPAIS, IDFONT' +
        'RECR, IDGRINSTR,'
      'IDPROFISS, '
      
        '   NOMEPAI, NOMEMAE, DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIV' +
        'IL, '
      'NUMDEPIRRF,'
      '   NUMDEPSALF, NUMDEPTOT, FLGISENTOIRRF, IDESTADO, CORPESSOA,'
      'FLGDEFICIENTE, '
      '   FLGMOLESTIAGRAVE, DATAMOLESTIAGRAVE, FLGSOMAIRSUPINSS, '
      'FLGDESTCC, IDCIDADES, '
      '   PERCIRRFJUD, STATUSPROCJUD, DATACONCLIMINAR, DATACONCJULG, '
      'VLRTOTCOMPIR, '
      
        '   VLRPARCCOMPIR, INICIOCOMPIR, VLRENQUADRAMENTO, INICIOINVALIDE' +
        'Z, '
      'FIMINVALIDEZ, '
      '   VLRINSS, VLRPENSAO, DATAFIMMOLESTIA,'
      
        '  DTCONTASALARIOPROCESSADA,FLGSOLICITACONTASALARIO,FLGCONTASALAR' +
        'IOPROCESSADA,'
      '  DTSOLICITACONTASALARIO,TIPOISENCAOIRRF,NOMECONJUGE)'
      'values'
      
        '  (:IDSINDICATO, :EMAILFUNCEF, :IDPESSOA, :CODESTADO, :IDPAIS, :' +
        'IDFONTRECR, '
      ':IDGRINSTR, '
      
        '   :IDPROFISS, :NOMEPAI, :NOMEMAE, :DATAMORTE, :DATANASC, :SEXO,' +
        ' '
      ':TIPOSANG,'
      
        '   :ESTCIVIL, :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT, :FLGISENTOIR' +
        'RF, '
      ':IDESTADO, '
      '   :CORPESSOA, :FLGDEFICIENTE, :FLGMOLESTIAGRAVE, '
      ':DATAMOLESTIAGRAVE, :FLGSOMAIRSUPINSS, '
      '   :FLGDESTCC, :IDCIDADES, :PERCIRRFJUD, :STATUSPROCJUD, '
      ':DATACONCLIMINAR, '
      '   :DATACONCJULG, :VLRTOTCOMPIR, :VLRPARCCOMPIR, :INICIOCOMPIR, '
      ':VLRENQUADRAMENTO, '
      '   :INICIOINVALIDEZ, :FIMINVALIDEZ, :VLRINSS, :VLRPENSAO, '
      ':DATAFIMMOLESTIA,'
      
        ':DTCONTASALARIOPROCESSADA,:FLGSOLICITACONTASALARIO,:FLGCONTASALA' +
        'RIOPROCESSADA,'
      '  :DTSOLICITACONTASALARIO,:TIPOISENCAOIRRF,:NOMECONJUGE)'
      ''
      ' '
      ' '
      ' ')
    Left = 73
    Top = 212
  end
  inherited qryPessoaFisica: TwwQuery
    BeforePost = qryPessoaFisicaBeforePost
    AfterScroll = qryPessoaFisicaAfterScroll
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      
        '   VLRINSS, VLRPENSAO, IDCIDADES, PERCIRRFJUD, STATUSPROCJUD, DA' +
        'TACONCLIMINAR, DATACONCJULG,'
      
        '   VLRTOTCOMPIR, VLRPARCCOMPIR, INICIOCOMPIR, VLRENQUADRAMENTO, ' +
        'INICIOINVALIDEZ, FIMINVALIDEZ,'
      
        '   FLGDESTCC, IDSINDICATO, IDPESSOA, CODESTADO, IDPAIS, IDFONTRE' +
        'CR, IDGRINSTR, IDPROFISS, NOMEPAI,'
      
        '   NOMEMAE, DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIVIL, NUMDE' +
        'PIRRF, NUMDEPSALF, NUMDEPTOT,'
      
        '   FLGISENTOIRRF, IDESTADO, CORPESSOA, FLGDEFICIENTE, FLGMOLESTI' +
        'AGRAVE, DATAMOLESTIAGRAVE,'
      
        '   FLGSOMAIRSUPINSS, DATAFIMMOLESTIA, DTCONTASALARIOPROCESSADA, ' +
        'DTSOLICITACONTASALARIO, FLGSOLICITACONTASALARIO, FLGCONTASALARIO' +
        'PROCESSADA, EMAILFUNCEF,'
      'TIPOISENCAOIRRF,         DECODE(TIPOISENCAOIRRF,'
      '              '#39'0'#39','
      '              '#39'Espécie de Benefício 92'#39','
      '              '#39'1'#39','
      '              '#39'Ação Judicial'#39','
      '              '#39'2'#39','
      '              '#39'Moléstia Grave'#39') AS TPISENCAOIRRF,'
      ' NOMECONJUGE'
      'FROM'
      '   PESSOAFISICA'
      'WHERE'
      '   ( PESSOAFISICA.IDPESSOA =:IdPessoa )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 41
    Top = 268
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaFisicaDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAFIMMOLESTIA'
    end
    object qryPessoaFisicaFLGSOLICITACONTASALARIO: TFloatField
      FieldName = 'FLGSOLICITACONTASALARIO'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGSOLICITACONTASALARIO'
    end
    object qryPessoaFisicaFLGCONTASALARIOPROCESSADA: TFloatField
      FieldName = 'FLGCONTASALARIOPROCESSADA'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGCONTASALARIOPROCESSADA'
    end
    object dtmfldPessoaFisicaDTSOLICITACONTASALARIO: TDateTimeField
      FieldName = 'DTSOLICITACONTASALARIO'
      Origin = 'BASEDADOS.PESSOAFISICA.DTSOLICITACONTASALARIO'
    end
    object dtmfldPessoaFisicaDTCONTASALARIOPROCESSADA: TDateTimeField
      FieldName = 'DTCONTASALARIOPROCESSADA'
      Origin = 'BASEDADOS.PESSOAFISICA.DTCONTASALARIOPROCESSADA'
    end
    object qryPessoaFisicaEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Origin = 'BASEDADOS.PESSOAFISICA.EMAILFUNCEF'
      Size = 100
    end
    object qryPessoaFisicaTIPOISENCAOIRRF: TFloatField
      FieldName = 'TIPOISENCAOIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.TIPOISENCAOIRRF'
    end
    object qryPessoaFisicaTPISENCAOIRRF: TStringField
      FieldName = 'TPISENCAOIRRF'
      Size = 23
    end
    object qryPessoaFisicaNOMECONJUGE: TStringField
      FieldName = 'NOMECONJUGE'
      Size = 60
    end
  end
  inherited ImageList1: TImageList
    Left = 697
    Top = 243
    Bitmap = {
      494C010169006E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000C0010000010020000000000000C0
      0100000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      840000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000C00100000100010000000000000E00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080070000000000000003000000000000
      0001000000000000801000000000000000000000000000000000000000000000
      8000000000000000800000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001000000000000C001000000000000
      C007000000000000E3FF000000000000FFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8F00000000000000000000000000000000
      000000000000}
  end
  inherited qryTelefone: TwwQuery
    AfterInsert = qryTelefoneAfterInsert
    SQL.Strings = (
      'SELECT TELENDPESS.IDTELEFONE , '
      ' TELENDPESS.IDPESSOA , '
      ' TELENDPESS.IDENDERECO , '
      ' TELENDPESS.DDI , TELENDPESS.DDD , '
      ' TELENDPESS.NUMERO , '
      ' TELENDPESS.TIPO'
      'FROM TELENDPESS'
      'WHERE '
      ' ( TELENDPESS.IDPESSOA =:IdPessoa )')
    Left = 842
    Top = 507
    inherited qryTelefoneDDI: TStringField
      DisplayWidth = 2
      Size = 2
    end
  end
  inherited updTelefone: TUpdateSQL
    InsertSQL.Strings = (
      'insert into TELENDPESS'
      '  (IDTELEFONE, IDENDERECO, DDI, DDD, NUMERO, TIPO, IDPESSOA)'
      'values'
      
        '  (:IDTELEFONE, :IDENDERECO, :DDI, :DDD, :NUMERO, :TIPO, :IDPESS' +
        'OA)')
    Left = 303
    Top = 504
  end
  inherited dsTelefone: TwwDataSource
    Left = 499
    Top = 5
  end
  inherited dsEndereco: TwwDataSource
    Left = 566
    Top = 17
  end
  inherited updEndereco: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDENDERECO = :IDENDERECO,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  NOME = :NOME,'
      '  CEP = :CEP,'
      '  IDPAIS =:IDPAIS,'
      '  CODESTADO = :CODESTADO'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      
        '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, COMPLEME' +
        'NTO, BAIRRO, '
      '   CIDADE, NOME, CEP, CODESTADO)'
      'values'
      
        '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :NUMERO, :CO' +
        'MPLEMENTO, '
      '   :BAIRRO, :CIDADE, :NOME, :CEP, :CODESTADO)')
    Left = 994
    Top = 265
  end
  inherited qryEndereco: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  ENDPESS.IDPESSOA ,'
      '  ENDPESS.IDENDERECO ,'
      '  ENDPESS.IDCIDADES ,'
      '  ENDPESS.LOGRADOURO ,'
      '  ENDPESS.NUMERO ,'
      '  ENDPESS.COMPLEMENTO ,'
      '  ENDPESS.BAIRRO ,'
      '  ENDPESS.CIDADE ,'
      '  ENDPESS.NOME ,'
      '  ENDPESS.CEP ,'
      '  ENDPESS.IDCIDADES,'
      '  ENDPESS.IDPAIS,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS,'
      '  E.CODESTADO'
      'FROM'
      '  ENDPESS,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P'
      'WHERE'
      ' (E.IDPAIS = P.IDPAIS(+)) AND'
      ' (E.IDESTADO(+) = C.IDESTADO) AND'
      ' (C.IDCIDADES(+) = ENDPESS.IDCIDADES ) AND'
      ' ( ENDPESS.IDPESSOA = :IdPessoa )')
    Left = 593
    Top = 331
    inherited qryEnderecoCOMPLEMENTO: TStringField
      Size = 200
    end
    object qryEnderecoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEnderecoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'ENDPESS.IDPAIS'
    end
  end
  inherited qryContato: TwwQuery
    Left = 718
    Top = 181
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203331302C2C2C2C0D0A434D
      2E434F4E5441544F504553532C434F4E5441544F504553532C32302C2032302C
      203133302C203134352C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3135302C2032302C203236302C203134352C2C2C2C2C0D0A2020202037
      2C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494443
      4F4E5441544F2C434F4E5441544F504553532C20202020202020202020202020
      202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D
      626572206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020312C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C
      2C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C2020202020
      2020202020202020202020202020312C20202020202C202C2C2C0D0A20202020
      202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E
      4F4D452C434F4E5441544F504553532C20202020202020202020202020202020
      202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572
      206F662043726974657269612C2C2C2C2C2C0D0A454D41494C2C434F4E544154
      4F504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A434152474F2C434F4E5441544F504553532C20202020
      202020202020202020202020202020312C20202020202C202C2C2C0D0A202020
      20202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A
      5345544F522C434F4E5441544F504553532C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E
      756D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944454E44455245434F
      2C434F4E5441544F504553532C4944454E44455245434F2C454E44504553532C
      202020202020202020202C202020202020202020202C2C0D0A0D0A2253454C45
      43542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C4543540943
      4F4E5441544F504553532E224944434F4E5441544F22202C200D0A09454E4450
      4553532E224944504553534F4122202C200D0A09434F4E5441544F504553532E
      224944454E44455245434F22202C200D0A09434F4E5441544F504553532E224E
      4F4D4522202C200D0A09434F4E5441544F504553532E22454D41494C22202C20
      0D0A09434F4E5441544F504553532E22434152474F22202C200D0A09434F4E54
      41544F504553532E225345544F52220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E44504553530D0A5748455245092820434F4E5441544F5045
      53532E4944454E44455245434F203D20454E44504553532E4944454E44455245
      434F20290D0A0909414E440D0A09280D0A092820454E44504553532E22494450
      4553534F4122203D3A4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updContato: TUpdateSQL
    Left = 178
    Top = 165
  end
  inherited dsContato: TwwDataSource
    Left = 639
    Top = 12
  end
  inherited qryRamal: TwwQuery
    SQL.Strings = (
      'SELECT'
      ' TELCONTATO.IDTELCONTATO,'
      ' TELCONTATO.IDCONTATO , '
      ' TELCONTATO.IDTELEFONE , '
      ' TELCONTATO.RAMAL , '
      ' TELENDPESS.NUMERO , '
      ' CONTATOPESS.NOME'
      'FROM CONTATOPESS '
      
        '   JOIN ENDPESS    ON ENDPESS.IDENDERECO   = CONTATOPESS.IDENDER' +
        'ECO'
      
        '   JOIN TELCONTATO ON TELCONTATO.IDCONTATO = CONTATOPESS.IDCONTA' +
        'TO'
      
        '   JOIN TELENDPESS ON TELENDPESS.IDTELEFONE = TELCONTATO.IDTELEF' +
        'ONE'
      'WHERE '
      ' ( TELENDPESS.IDPESSOA = :IdPessoa )'
      ' AND '
      ' (TELCONTATO.IDCONTATO = :IdContato)'
      ' '
      ' ')
    Left = 539
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdContato'
        ParamType = ptUnknown
      end>
  end
  object qryPlanosPrev: TwwQuery [36]
    CachedUpdates = True
    AfterInsert = qryPlanosPrevAfterInsert
    BeforePost = qryPlanosPrevBeforePost
    AfterPost = qryPlanosPrevAfterPost
    AfterScroll = qryPlanosPrevAfterScroll
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  PP.IDPESSJUR,'
      
        '  DECODE(PP.FLGDESATIVADO, 0, '#39'Ativado   '#39', '#39'Desativado'#39') AS STA' +
        'TUS,'
      '  PP.FLGDESATIVADO,'
      '  PP.SEQPROPOSTA,'
      '  PP.IDPLANOPREV,'
      '  PP.IDPESSOA,'
      '  PP.IDSITPART,'
      '  PP.IDSITPLANOPREV,'
      '  PP.REQUERIMENTODATA,'
      '  PP.INSCRICAONUMERO,'
      '  PP.INSCRICAODATA,'
      '  PP.INSCRICAOTIPO,'
      '  PP.SALINSCRICAO,'
      '  PP.SALPARTICIPACAO,'
      '  PP.DATACANCELAMENTO,'
      '  PP.DATAINICIOMANUT,'
      '  PP.DTINICIOINSC,'
      '  PP.FLGFITESPECIAL,'
      '  PL.NOME AS PLANO,'
      '  SITPART.DESCRICAO AS SITPART,'
      '  SITPLANO.DESCRICAO AS SITPLANO,'
      '  PP.DATACONTRIBINSS,'
      '  PP.TIPOOPCAOIR,'
      '  PP.DATAOPCAOIR,'
      '  PP.SALMANTIDO,'
      '  PL.FLGNGRAVACONTZERO,'
      
        '  DECODE(PP.TIPOOPCAOIR, 0, '#39'Sem Opção'#39', 1, '#39'Tabela Progressiva'#39 +
        ', 2, '#39'Tabela Regressiva'#39', '#39#39') AS TIPO'
      'FROM'
      '  SITPART SITPART,'
      '  SITPLANOPREV SITPLANO,'
      '  PLANPREV PL,'
      '  PARTPREVPLAN PP'
      ''
      'WHERE PP.IDPESSOA       = :IDPESSOA'
      '  AND PP.IDPLANOPREV    = PL.IDPLANOPREV'
      '  AND PP.IDSITPART      = SITPART.IDSITPART'
      '  AND PP.IDSITPLANOPREV = SITPLANO.IDSITPLANOPREV'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updPlanosPrev
    ControlType.Strings = (
      'FLGFITESPECIAL;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 1033
    Top = 514
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPlanosPrev: TwwDataSource [37]
    DataSet = qryPlanosPrev
    OnStateChange = dsPlanosPrevStateChange
    Left = 403
    Top = 9
  end
  object updPlanosPrev: TUpdateSQL [38]
    ModifySQL.Strings = (
      'update PARTPREVPLAN'
      'set'
      '  IDSITPART = :IDSITPART,'
      '  IDSITPLANOPREV = :IDSITPLANOPREV,'
      '  REQUERIMENTODATA = :REQUERIMENTODATA,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  INSCRICAODATA = :INSCRICAODATA,'
      '  INSCRICAOTIPO = :INSCRICAOTIPO,'
      '  SALINSCRICAO = :SALINSCRICAO,'
      '  SALPARTICIPACAO = :SALPARTICIPACAO,'
      '  SALMANTIDO = :SALMANTIDO,'
      '  DTINICIOINSC = :DTINICIOINSC,'
      '  FLGFITESPECIAL = :FLGFITESPECIAL,'
      '  DATACONTRIBINSS = :DATACONTRIBINSS,'
      '  TIPOOPCAOIR = :TIPOOPCAOIR,'
      '  DATAOPCAOIR = :DATAOPCAOIR,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  DATACANCELAMENTO = :DATACANCELAMENTO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into PARTPREVPLAN'
      '  (IDPESSJUR, SEQPROPOSTA, IDPLANOPREV, IDPESSOA, IDSITPART, '
      'IDSITPLANOPREV, REQUERIMENTODATA, INSCRICAONUMERO, '
      'INSCRICAODATA, '
      '   INSCRICAOTIPO, SALINSCRICAO, SALPARTICIPACAO, DTINICIOINSC, '
      'FLGFITESPECIAL, SALMANTIDO,'
      
        '   DATACONTRIBINSS, TIPOOPCAOIR, DATAOPCAOIR, FLGDESATIVADO, DAT' +
        'ACANCELAMENTO)'
      'values'
      
        '  (:IDPESSJUR, :SEQPROPOSTA, :IDPLANOPREV, :IDPESSOA, :IDSITPART' +
        ','
      ':IDSITPLANOPREV, :REQUERIMENTODATA,'
      ':INSCRICAONUMERO, :INSCRICAODATA,'
      
        '   :INSCRICAOTIPO, :SALINSCRICAO, :SALPARTICIPACAO, :DTINICIOINS' +
        'C,'
      ':FLGFITESPECIAL, :SALMANTIDO,'
      
        '   :DATACONTRIBINSS, :TIPOOPCAOIR, :DATAOPCAOIR, :FLGDESATIVADO,' +
        ' :DATACANCELAMENTO)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PARTPREVPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 639
    Top = 564
  end
  object qryPlanPrev: TwwQuery [39]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANPREV."IDPLANOPREV" , '
      ' PLANPREV."IDFUNDACAO" , '
      ' PLANPREV."NOME" , '
      ' PLANPREV."IDREGRAADMISSAO" , '
      ' PLANPREV."FLGAUTONUMINSC",'
      ' PLANPREV."NUMINSCINICIAL",'
      ' PP.DATAINSC, '
      ' PP."FLGATIVO"'
      'FROM "PLANPREV" PLANPREV,'
      '           "PLANPREVPATRO" PP'
      'WHERE PP."IDPESSJUR" = :IDPESSJUR AND'
      '               PP."IDPLANOPREV" = PLANPREV."IDPLANOPREV" '
      ''
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qrySitPart: TwwQuery [40]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPART,DESCRICAO, FLGINTERNO'
      'FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 847
    Top = 452
  end
  object qryAux: TwwQuery [41]
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 235
    Top = 296
  end
  object qryDepen: TwwQuery [42]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DEPENDENTE."IDPESSOA"'
      'FROM "CM"."DEPENDENTE" DEPENDENTE'
      'WHERE DEPENDENTE."IDPESSOA" = :IDPESSOA')
    UpdateObject = updDepen
    ValidateWithMask = True
    Left = 485
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepen: TUpdateSQL [43]
    ModifySQL.Strings = (
      'update "CM"."DEPENDENTE"'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "CM"."DEPENDENTE"'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from "CM"."DEPENDENTE"'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 291
    Top = 178
  end
  object qryDepenTit: TwwQuery [44]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DEPENTIT."IDTITULAR" ,'
      ' DEPENTIT."IDPESSOA" , '
      ' DEPENTIT."IDDEPENDENCIA" , '
      ' DEPENTIT."NUMSEQUENCIA" , '
      ' DEPENTIT."FLGCONTAIMPOSTOR" , '
      ' DEPENTIT."FLGCONTASALARIOF" , '
      ' DEPENTIT."FLGBENEFICIARIO",'
      ' DEPENTIT."MATRICULA"'
      'FROM "CM"."DEPENTIT" DEPENTIT'
      'WHERE DEPENTIT."IDPESSOA" = :IDPESSOA AND'
      '              DEPENTIT."IDTITULAR" = DEPENTIT."IDPESSOA"'
      ' ')
    UpdateObject = updDepentit
    ValidateWithMask = True
    Left = 508
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepentit: TUpdateSQL [45]
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  NUMSEQUENCIA = :NUMSEQUENCIA,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  MATRICULA = :MATRICULA'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      
        '  (IDTITULAR, IDPESSOA, IDDEPENDENCIA, NUMSEQUENCIA, FLGCONTAIMP' +
        'OSTOR, '
      '   FLGCONTASALARIOF, FLGBENEFICIARIO, MATRICULA)'
      'values'
      
        '  (:IDTITULAR, :IDPESSOA, :IDDEPENDENCIA, :NUMSEQUENCIA, :FLGCON' +
        'TAIMPOSTOR, '
      '   :FLGCONTASALARIOF, :FLGBENEFICIARIO, :MATRICULA)')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 267
    Top = 356
  end
  object qryGrava: TwwQuery [46]
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 570
    Top = 187
  end
  object qryAux2: TwwQuery [47]
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 916
    Top = 251
  end
  object qrySitPlanoPrev: TwwQuery [48]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOPREV, DESCRICAO'
      'FROM SITPLANOPREV'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 109
    Top = 502
  end
  object dsNaturalidade: TwwDataSource [49]
    DataSet = qryNaturalidade
    Left = 757
    Top = 88
  end
  object qryNaturalidade: TwwQuery [50]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ESTADO."CODESTADO" , '
      ' ESTADO."NOMEESTADO" , PAIS."IDPAIS" , '
      ' PAIS."NOMEPAIS", PAIS."NOMENACIONALIDADE",'
      'ESTADO.IDESTADO'
      'FROM "ESTADO" ESTADO , "PAIS" PAIS'
      'WHERE ( ESTADO.IDPAIS = PAIS.IDPAIS )'
      'ORDER BY'
      ' ESTADO."NOMEESTADO"'
      '')
    ValidateWithMask = True
    Left = 207
    Top = 462
  end
  object qryContaBancaria: TwwQuery [51]
    CachedUpdates = True
    AfterOpen = qryContaBancariaAfterOpen
    AfterEdit = qryContaBancariaAfterEdit
    BeforePost = qryContaBancariaBeforePost
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT CONTABANCARIA.IDCBANCARIA,'
      '       CONTABANCARIA.CONTACORRENTE,'
      '       CONTABANCARIA.IDAGENCIA,'
      '       CONTABANCARIA.FLGCONTAPREF,'
      '       CONTABANCARIA.IDPESSOA,'
      '       CONTABANCARIA.TIPOCONTA,'
      '       CONTABANCARIA.FLGCONTACONJUNTA,'
      '       AGENCIA.NOME AS AGENCIA,'
      '       BANCO.NOME AS BANCO,'
      '       AGENCIABANCARIA.IDBANCO,'
      '       AGENCIABANCARIA.NUMAGENCIA,'
      '       B.NUMBANCO,'
      '       CONTABANCARIA.FLGCONTARESGATE,'
      '       CONTABANCARIA.IDTITULAR,'
      '       CONTABANCARIA.ROWID '
      
        'FROM   CONTABANCARIA, PESSOA AGENCIA,PESSOA BANCO, AGENCIABANCAR' +
        'IA ,BANCO B'
      'WHERE  CONTABANCARIA.IDPESSOA   = :IDPESSOA'
      'AND    CONTABANCARIA.IDAGENCIA  = AGENCIA.IDPESSOA'
      'AND    CONTABANCARIA.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA'
      'AND    AGENCIABANCARIA.IDBANCO  =  BANCO.IDPESSOA'
      'AND    AGENCIABANCARIA.IDBANCO  = B.IDpessoa'
      ''
      ''
      '')
    UpdateObject = updContaBancaria
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0'
      'TIPOCONTA;CheckBox;2;0')
    ValidateWithMask = True
    Left = 156
    Top = 433
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsContaBancaria: TwwDataSource [52]
    DataSet = qryContaBancaria
    Left = 215
    Top = 374
  end
  object updContaBancaria: TUpdateSQL [53]
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA,'
      '  FLGCONTARESGATE  =:FLGCONTARESGATE'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ', TIPOCONTA, '
      '   FLGCONTACONJUNTA,FLGCONTARESGATE)'
      'values'
      
        '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, :IDP' +
        'ESSOA, '
      '   :TIPOCONTA, :FLGCONTACONJUNTA, :FLGCONTARESGATE)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 388
    Top = 471
  end
  object qryAgencia: TwwQuery [54]
    AfterScroll = qryAgenciaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA, '
      '               AGENCIABANCARIA.NUMAGENCIA'
      'FROM  PESSOA AGENCIA ,AGENCIABANCARIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '               AGENCIABANCARIA.IDBANCO=:pIdBanco'
      'order by AGENCIABANCARIA.NUMAGENCIA')
    ValidateWithMask = True
    Left = 315
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery [55]
    AfterScroll = qryBancoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO,'
      '       BANCO.NUMBANCO, BANCO.FLGVALIDACC'
      'FROM PESSOA, BANCO'
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 103
    Top = 509
  end
  object qryfilial: TwwQuery [56]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.IDPESSOA'
      'FROM PESSOA P , FILIALPESSOA F'
      'WHERE P.IDPESSOA = F.IDFILIALPESSOA'
      'AND P.IDGRUPO =  :IDPESSOA')
    ValidateWithMask = True
    Left = 391
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dspatro: TwwDataSource [57]
    AutoEdit = False
    Left = 393
    Top = 173
  end
  object qryfundacao: TwwQuery [58]
    BeforeOpen = qryfundacaoBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,PE.IDPESSOA'
      'FROM   PESSOA PE, FUNDACAO FU'
      'WHERE  PE.IDPESSOA = FU.IDPESSOA'
      'AND    PE.IDPESSOA NOT IN('
      '                           SELECT IDFUNDACAO FROM PESSOAXFUND'
      '                           WHERE IDPESSOA = :IDPESSOA'
      '                         )'
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 500
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object dsfundacoes: TwwDataSource [59]
    DataSet = qryfundacoes
    OnStateChange = dsfundacoesStateChange
    Left = 497
    Top = 224
  end
  object qryfundacoes: TwwQuery [60]
    CachedUpdates = True
    AfterInsert = qryfundacoesAfterInsert
    BeforePost = qryfundacoesBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , NUMINSC ,IDFUNDACAO , '
      'PESSOAXFUND.IDPESSOA'
      'FROM PESSOA , PESSOAXFUND'
      'WHERE '
      'PESSOAXFUND.IDFUNDACAO = PESSOA.IDPESSOA'
      'AND PESSOAXFUND.IDPESSOA = :IDPESSOA')
    UpdateObject = updfundacoes
    ValidateWithMask = True
    Left = 316
    Top = 277
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object updfundacoes: TUpdateSQL [61]
    ModifySQL.Strings = (
      'update PESSOAXFUND'
      'set'
      '  NUMINSC = :NUMINSC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    InsertSQL.Strings = (
      'insert into PESSOAXFUND'
      '  (IDPESSOA , IDFUNDACAO ,NUMINSC)'
      'values'
      '  ( :IDPESSOA ,  :IDFUNDACAO ,:NUMINSC)')
    DeleteSQL.Strings = (
      'delete from PESSOAXFUND'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    Left = 537
    Top = 467
  end
  object qryGrava2: TwwQuery [62]
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 644
    Top = 460
  end
  object qryBenefPlanoPart: TwwQuery [63]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBENEFICIO, IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOST' +
        'A'
      'FROM   BENEFPLANOPART'
      'WHERE  IDPESSOA = :IDPESSOA')
    UpdateObject = updBenefPlanoPart
    ValidateWithMask = True
    Left = 640
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updBenefPlanoPart: TUpdateSQL [64]
    ModifySQL.Strings = (
      'update BENEFPLANOPART'
      'set'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  SEQPROPOSTA = :SEQPROPOSTA'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BENEFPLANOPART'
      '  (IDBENEFICIO, IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA)'
      'values'
      
        '  (:IDBENEFICIO, :IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :SEQPROPOS' +
        'TA)')
    DeleteSQL.Strings = (
      'delete from BENEFPLANOPART'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 603
    Top = 491
  end
  object qryEventosPrev: TwwQuery [65]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOSPREV,IDPESSJUR,IDPESSOA,IDPLANOPREV,SEQPROPOSTA,'
      
        '       DATAALTERADO,DATAEFETIVADO,DATAEVENTO,DATAREGISTRO,DATAVO' +
        'LTA,'
      
        '       FLGEFETIVADO,FLGSITFUNCIMED,FLGSITPARTIMED,FLGSITPLANOIME' +
        'D,'
      '       FLGTPDEMISSAO,IDBENEFICIO,IDEVENTOGERADOR,'
      '       IDSITFUNCATUAL,IDSITPARTATUAL,IDSITPLANOATUAL,'
      
        '       IDSITFUNCNOVO,IDSITPARTNOVO,IDSITPLANONOVO,INSCRICAONUMER' +
        'O'
      'FROM   EVENTOSPREV'
      'WHERE  IDEVENTOSPREV  = :IDEVENTOSPREV')
    UpdateObject = updEventosPrev
    ValidateWithMask = True
    Left = 692
    Top = 475
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object updEventosPrev: TUpdateSQL [66]
    ModifySQL.Strings = (
      'update EVENTOSPREV'
      'set'
      '  IDEVENTOSPREV = :IDEVENTOSPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  DATAALTERADO = :DATAALTERADO,'
      '  DATAEFETIVADO = :DATAEFETIVADO,'
      '  DATAEVENTO = :DATAEVENTO,'
      '  DATAREGISTRO = :DATAREGISTRO,'
      '  DATAVOLTA = :DATAVOLTA,'
      '  FLGEFETIVADO = :FLGEFETIVADO,'
      '  FLGSITFUNCIMED = :FLGSITFUNCIMED,'
      '  FLGSITPARTIMED = :FLGSITPARTIMED,'
      '  FLGSITPLANOIMED = :FLGSITPLANOIMED,'
      '  FLGTPDEMISSAO = :FLGTPDEMISSAO,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  IDSITFUNCATUAL = :IDSITFUNCATUAL,'
      '  IDSITPARTATUAL = :IDSITPARTATUAL,'
      '  IDSITPLANOATUAL = :IDSITPLANOATUAL,'
      '  IDSITFUNCNOVO = :IDSITFUNCNOVO,'
      '  IDSITPARTNOVO = :IDSITPARTNOVO,'
      '  IDSITPLANONOVO = :IDSITPLANONOVO,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO'
      'where'
      '  IDEVENTOSPREV = :OLD_IDEVENTOSPREV')
    InsertSQL.Strings = (
      'insert into EVENTOSPREV'
      
        '  (IDEVENTOSPREV, IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA,' +
        ' DATAALTERADO, '
      
        '   DATAEFETIVADO, DATAEVENTO, DATAREGISTRO, DATAVOLTA, FLGEFETIV' +
        'ADO, FLGSITFUNCIMED, '
      
        '   FLGSITPARTIMED, FLGSITPLANOIMED, FLGTPDEMISSAO, IDBENEFICIO, ' +
        'IDEVENTOGERADOR, '
      
        '   IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, IDSITFUNCNOV' +
        'O, IDSITPARTNOVO, '
      '   IDSITPLANONOVO, INSCRICAONUMERO)'
      'values'
      
        '  (:IDEVENTOSPREV, :IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :SEQPROP' +
        'OSTA, :DATAALTERADO, '
      
        '   :DATAEFETIVADO, :DATAEVENTO, :DATAREGISTRO, :DATAVOLTA, :FLGE' +
        'FETIVADO, '
      
        '   :FLGSITFUNCIMED, :FLGSITPARTIMED, :FLGSITPLANOIMED, :FLGTPDEM' +
        'ISSAO, '
      
        '   :IDBENEFICIO, :IDEVENTOGERADOR, :IDSITFUNCATUAL, :IDSITPARTAT' +
        'UAL, :IDSITPLANOATUAL, '
      
        '   :IDSITFUNCNOVO, :IDSITPARTNOVO, :IDSITPLANONOVO, :INSCRICAONU' +
        'MERO)')
    DeleteSQL.Strings = (
      'delete from EVENTOSPREV'
      'where'
      '  IDEVENTOSPREV = :OLD_IDEVENTOSPREV')
    Left = 736
    Top = 420
  end
  object qryHstContEventosPR: TwwQuery [67]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOSPREV,IDASSOCIACAO,FLGASSOCIADA,'
      '       IDCONTRIBUICAOF,IDEVENTOGERADORF,IDPLANOPREVF,TIPO'
      'FROM   HSTCONTEVENTOSPR'
      'WHERE  IDEVENTOSPREV = :IDEVENTOSPREV'
      'AND    IDASSOCIACAO  = :IDASSOCIACAO')
    UpdateObject = updHstContEventosPR
    ValidateWithMask = True
    Left = 199
    Top = 525
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDASSOCIACAO'
        ParamType = ptUnknown
      end>
  end
  object updHstContEventosPR: TUpdateSQL [68]
    ModifySQL.Strings = (
      'update HSTCONTEVENTOSPR'
      'set'
      '  IDEVENTOSPREV = :IDEVENTOSPREV,'
      '  IDASSOCIACAO = :IDASSOCIACAO,'
      '  FLGASSOCIADA = :FLGASSOCIADA,'
      '  IDCONTRIBUICAOF = :IDCONTRIBUICAOF,'
      '  IDEVENTOGERADORF = :IDEVENTOGERADORF,'
      '  IDPLANOPREVF = :IDPLANOPREVF,'
      '  TIPO = :TIPO'
      'where'
      '  IDEVENTOSPREV = :OLD_IDEVENTOSPREV and'
      '  IDASSOCIACAO = :OLD_IDASSOCIACAO')
    InsertSQL.Strings = (
      'insert into HSTCONTEVENTOSPR'
      
        '  (IDEVENTOSPREV, IDASSOCIACAO, FLGASSOCIADA, IDCONTRIBUICAOF, I' +
        'DEVENTOGERADORF, '
      '   IDPLANOPREVF, TIPO)'
      'values'
      
        '  (:IDEVENTOSPREV, :IDASSOCIACAO, :FLGASSOCIADA, :IDCONTRIBUICAO' +
        'F, :IDEVENTOGERADORF, '
      '   :IDPLANOPREVF, :TIPO)')
    DeleteSQL.Strings = (
      'delete from HSTCONTEVENTOSPR'
      'where'
      '  IDEVENTOSPREV = :OLD_IDEVENTOSPREV and'
      '  IDASSOCIACAO = :OLD_IDASSOCIACAO')
    Left = 257
    Top = 251
  end
  object qryContribPrevPartP: TwwQuery [69]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CPP.IDPESSOA,CPP.IDPESSJUR,CPP.IDPLANOPREV,CPP.SEQPROPOST' +
        'A,'
      
        '       CPP.IDCONTRIBUICAO,CPP.DATAFINAL,CPP.DATAINICIO,CPP.DIAVE' +
        'NCIMENTO,'
      
        '       CPP.FLGCOBRA,CPP.FLGDESCFOLHA,CPP.IDTPPERIODICIDADE,CPP.U' +
        'LTMESPREPARO,'
      '       CPP.VALORBASE1,CPP.VALORBASE2,CPP.VALORBASE3,'
      '       CPP.ASSOC1OP1, CPP.ASSOC1OP2, CPP.ASSOC1OP3,'
      '       CPP.ASSOC2OP1, CPP.ASSOC2OP2, CPP.ASSOC2OP3,'
      '       CPP.ASSOC3OP1, CPP.ASSOC3OP2, CPP.ASSOC3OP3,'
      '       CPP.QTDEPARCELAS, CPP.CODPORTFORMA,'
      '       CPP.ULTANO13,'
      '       TP.NOME AS PERIODICIDADE, C.NOME, CP.NOMEVALORBASE1,'
      '       CP.NOMEVALORBASE2, CP.NOMEVALORBASE3,CP.NUMOPCOES'
      
        'FROM   CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C, TPPERI' +
        'ODICIDADE TP'
      'WHERE  CPP.IDPESSOA = :IDPESSOA'
      'AND    CPP.IDPESSJUR = :IDPESSJUR'
      'AND    CPP.IDPLANOPREV = :IDPLANOPREV'
      'AND    CPP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'AND    CPP.IDPLANOPREV    = CP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO'
      'AND    CPP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)')
    UpdateObject = updContribPrevPartP
    ValidateWithMask = True
    Left = 398
    Top = 504
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object updContribPrevPartP: TUpdateSQL [70]
    ModifySQL.Strings = (
      'update CONTRIBPREVPARTP'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  DATAFINAL = :DATAFINAL,'
      '  DATAINICIO = :DATAINICIO,'
      '  DIAVENCIMENTO = :DIAVENCIMENTO,'
      '  FLGCOBRA = :FLGCOBRA,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  IDTPPERIODICIDADE = :IDTPPERIODICIDADE,'
      '  ULTMESPREPARO = :ULTMESPREPARO,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  ASSOC1OP1 = :ASSOC1OP1,'
      '  ASSOC1OP2 = :ASSOC1OP2,'
      '  ASSOC1OP3 = :ASSOC1OP3,'
      '  ASSOC2OP1 = :ASSOC2OP1,'
      '  ASSOC2OP2 = :ASSOC2OP2,'
      '  ASSOC2OP3 = :ASSOC2OP3,'
      '  ASSOC3OP1 = :ASSOC3OP1,'
      '  ASSOC3OP2 = :ASSOC3OP2,'
      '  ASSOC3OP3 = :ASSOC3OP3,'
      '  QTDEPARCELAS = :QTDEPARCELAS,'
      '  ULTANO13 = :ULTANO13'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTRIBPREVPARTP'
      
        '  (IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, IDCONTRIBUICAO' +
        ', DATAFINAL, '
      
        '   DATAINICIO, DIAVENCIMENTO, FLGCOBRA, FLGDESCFOLHA, IDTPPERIOD' +
        'ICIDADE, '
      
        '   ULTMESPREPARO, VALORBASE1, VALORBASE2, VALORBASE3, ASSOC1OP1,' +
        ' ASSOC1OP2, '
      
        '   ASSOC1OP3, ASSOC2OP1, ASSOC2OP2, ASSOC2OP3, ASSOC3OP1, ASSOC3' +
        'OP2, ASSOC3OP3, '
      '   QTDEPARCELAS, ULTANO13)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :IDPLANOPREV, :SEQPROPOSTA, :IDCONTRIB' +
        'UICAO, '
      
        '   :DATAFINAL, :DATAINICIO, :DIAVENCIMENTO, :FLGCOBRA, :FLGDESCF' +
        'OLHA, :IDTPPERIODICIDADE, '
      
        '   :ULTMESPREPARO, :VALORBASE1, :VALORBASE2, :VALORBASE3, :ASSOC' +
        '1OP1, :ASSOC1OP2, '
      
        '   :ASSOC1OP3, :ASSOC2OP1, :ASSOC2OP2, :ASSOC2OP3, :ASSOC3OP1, :' +
        'ASSOC3OP2, '
      '   :ASSOC3OP3, :QTDEPARCELAS, :ULTANO13)')
    DeleteSQL.Strings = (
      'delete from CONTRIBPREVPARTP'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 318
    Top = 463
  end
  object qryHstContribPrev: TwwQuery [71]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HST.NUMRECEBIMENTO,HST.MESREFERENCIA,HST.MESCOBRANCA,HST.' +
        'IDMOTIVO,'
      
        '       HST.IDPESSJUR,HST.IDPESSOA,HST.IDPLANOPREV,HST.IDCONTRIBU' +
        'ICAO,HST.SEQPROPOSTA,'
      
        '       HST.CODPORTFORMA,HST.DATAFINAL,HST.DATAINICIO,HST.DATAPRE' +
        'VISAORECE,'
      
        '       HST.DATARECEBIMENTO,HST.FLGCALCRESERVA,HST.FLGDESCFOLHA,H' +
        'ST.FLGSITFUNDACAO,'
      
        '       HST.IDLOTE,HST.IDREGRACALCULO,HST.PARCELA,HST.SITRECEBIME' +
        'NTO,HST.TIPO,'
      
        '       HST.VALORCALCULADO,HST.VALORESPERADO,HST.VALOROP1,HST.VAL' +
        'OROP2,HST.VALOROP3,'
      '       HST.FLGEVENTO,  HST.VALORRECEBIDO, HST.FLGINTEVENTO,'
      '       C.NOME, HST.FOLHAORIGEM'
      'FROM   HSTCONTRIBPREV HST, CONTRIBUICAO C'
      'WHERE  HST.MESREFERENCIA = :MESREFERENCIA'
      'AND    HST.IDPESSOA      = :IDPESSOA'
      'AND    HST.IDPESSJUR     = :IDPESSJUR'
      'AND    HST.IDPLANOPREV   = :IDPLANOPREV'
      'AND    HST.SEQPROPOSTA   = :SEQPROPOSTA'
      'AND    HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'ORDER BY HST.MESREFERENCIA, HST.IDCONTRIBUICAO'
      ''
      ' ')
    UpdateObject = updHstContribPrev
    ValidateWithMask = True
    Left = 539
    Top = 539
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object updHstContribPrev: TUpdateSQL [72]
    ModifySQL.Strings = (
      'update HSTCONTRIBPREV'
      'set'
      '  NUMRECEBIMENTO = :NUMRECEBIMENTO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  DATAFINAL = :DATAFINAL,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAPREVISAORECE = :DATAPREVISAORECE,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  FLGCALCRESERVA = :FLGCALCRESERVA,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  FLGSITFUNDACAO = :FLGSITFUNDACAO,'
      '  IDLOTE = :IDLOTE,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  PARCELA = :PARCELA,'
      '  SITRECEBIMENTO = :SITRECEBIMENTO,'
      '  TIPO = :TIPO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VALORESPERADO = :VALORESPERADO,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  FLGEVENTO = :FLGEVENTO,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  FLGINTEVENTO = :FLGINTEVENTO,'
      '  FOLHAORIGEM = :FOLHAORIGEM'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDMOTIVO = :OLD_IDMOTIVO'
      ' ')
    InsertSQL.Strings = (
      'insert into HSTCONTRIBPREV'
      
        '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, IDPESSJ' +
        'UR, IDPESSOA, '
      
        '   IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA, CODPORTFORMA, DATAF' +
        'INAL, DATAINICIO, '
      
        '   DATAPREVISAORECE, DATARECEBIMENTO, FLGCALCRESERVA, FLGDESCFOL' +
        'HA, FLGSITFUNDACAO, '
      
        '   IDLOTE, IDREGRACALCULO, PARCELA, SITRECEBIMENTO, TIPO, VALORC' +
        'ALCULADO, '
      
        '   VALORESPERADO, VALOROP1, VALOROP2, VALOROP3, FLGEVENTO, VALOR' +
        'RECEBIDO, '
      '   FLGINTEVENTO, FOLHAORIGEM)'
      'values'
      
        '  (:NUMRECEBIMENTO, :MESREFERENCIA, :MESCOBRANCA, :IDMOTIVO, :ID' +
        'PESSJUR,'
      
        '   :IDPESSOA, :IDPLANOPREV, :IDCONTRIBUICAO, :SEQPROPOSTA, :CODP' +
        'ORTFORMA,'
      
        '   :DATAFINAL, :DATAINICIO, :DATAPREVISAORECE, :DATARECEBIMENTO,' +
        ' :FLGCALCRESERVA,'
      
        '   :FLGDESCFOLHA, :FLGSITFUNDACAO, :IDLOTE, :IDREGRACALCULO, :PA' +
        'RCELA,'
      
        '   :SITRECEBIMENTO, :TIPO, :VALORCALCULADO, :VALORESPERADO, :VAL' +
        'OROP1,'
      
        '   :VALOROP2, :VALOROP3, :FLGEVENTO, :VALORRECEBIDO, :FLGINTEVEN' +
        'TO,'
      '   :FOLHAORIGEM)'
      ' ')
    DeleteSQL.Strings = (
      'delete from HSTCONTRIBPREV'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    Left = 62
    Top = 162
  end
  object qryHstAtrasoContrib: TwwQuery [73]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HST.IDMOTIVO,HST.MESCOBRANCA,HST.MESREFERENCIA,HST.NUMREC' +
        'EBIMENTO,'
      
        '       HST.FLGTIPO,HST.CODALTERADOR,HST.FLGRETROATIVO, HST.VALOR' +
        ', HST.FLGEVENTO,'
      '       TA.DESCRICAO'
      'FROM   HSTATRASOCONTRIB HST, TIPOALTERADOR TA'
      'WHERE  HST.NUMRECEBIMENTO = :NUMRECEBIMENTO'
      'AND    HST.CODALTERADOR   = TA.CODALTERADOR(+)'
      '')
    UpdateObject = updHstAtrasoContrib
    ValidateWithMask = True
    Left = 355
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMRECEBIMENTO'
        ParamType = ptUnknown
      end>
  end
  object updHstAtrasoContrib: TUpdateSQL [74]
    ModifySQL.Strings = (
      'update HSTATRASOCONTRIB'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  NUMRECEBIMENTO = :NUMRECEBIMENTO,'
      '  FLGTIPO = :FLGTIPO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  FLGRETROATIVO = :FLGRETROATIVO,'
      '  VALOR = :VALOR,'
      '  FLGEVENTO = :FLGEVENTO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  FLGTIPO = :OLD_FLGTIPO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into HSTATRASOCONTRIB'
      
        '  (IDMOTIVO, MESCOBRANCA, MESREFERENCIA, NUMRECEBIMENTO, FLGTIPO' +
        ', CODALTERADOR, '
      '   FLGRETROATIVO, VALOR, FLGEVENTO)'
      'values'
      
        '  (:IDMOTIVO, :MESCOBRANCA, :MESREFERENCIA, :NUMRECEBIMENTO, :FL' +
        'GTIPO, '
      '   :CODALTERADOR, :FLGRETROATIVO, :VALOR, :FLGEVENTO)')
    DeleteSQL.Strings = (
      'delete from HSTATRASOCONTRIB'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  FLGTIPO = :OLD_FLGTIPO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    Left = 464
    Top = 470
  end
  object qryCtrlInterface: TwwQuery [75]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, IDPESSOA, DATAIDAINTERFACE,DATAIDATMP, DATAPREPAR' +
        'O,'
      '       DATAVOLTAINTERFA, DATAVOLTATMP, DESCRICAO,'
      '       FLGATRASODEVOL, FLGIDAINTERFACE,FLGIDATMP,'
      '       FLGPREPARADO,FLGVOLTAINTERFACE,FLGVOLTATMP,'
      '       MESREFERENCIA,NUMREG, TIPO, VLRTOTAL'
      'FROM   CTRLINTERFACE'
      'WHERE  IDLOTE = :IDLOTE'
      '')
    UpdateObject = updCtrlInterface
    ValidateWithMask = True
    Left = 439
    Top = 548
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object updCtrlInterface: TUpdateSQL [76]
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  IDLOTE = :IDLOTE,'
      '  IDPESSOA = :IDPESSOA,'
      '  DATAIDAINTERFACE = :DATAIDAINTERFACE,'
      '  DATAIDATMP = :DATAIDATMP,'
      '  DATAPREPARO = :DATAPREPARO,'
      '  DATAVOLTAINTERFA = :DATAVOLTAINTERFA,'
      '  DATAVOLTATMP = :DATAVOLTATMP,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  FLGIDAINTERFACE = :FLGIDAINTERFACE,'
      '  FLGIDATMP = :FLGIDATMP,'
      '  FLGPREPARADO = :FLGPREPARADO,'
      '  FLGVOLTAINTERFACE = :FLGVOLTAINTERFACE,'
      '  FLGVOLTATMP = :FLGVOLTATMP,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  NUMREG = :NUMREG,'
      '  TIPO = :TIPO,'
      '  VLRTOTAL = :VLRTOTAL'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CTRLINTERFACE'
      
        '  (IDLOTE, IDPESSOA, DATAIDAINTERFACE, DATAIDATMP, DATAPREPARO, ' +
        'DATAVOLTAINTERFA, '
      
        '   DATAVOLTATMP, DESCRICAO, FLGATRASODEVOL, FLGIDAINTERFACE, FLG' +
        'IDATMP, '
      
        '   FLGPREPARADO, FLGVOLTAINTERFACE, FLGVOLTATMP, MESREFERENCIA, ' +
        'NUMREG, '
      '   TIPO, VLRTOTAL)'
      'values'
      
        '  (:IDLOTE, :IDPESSOA, :DATAIDAINTERFACE, :DATAIDATMP, :DATAPREP' +
        'ARO, :DATAVOLTAINTERFA, '
      
        '   :DATAVOLTATMP, :DESCRICAO, :FLGATRASODEVOL, :FLGIDAINTERFACE,' +
        ' :FLGIDATMP, '
      
        '   :FLGPREPARADO, :FLGVOLTAINTERFACE, :FLGVOLTATMP, :MESREFERENC' +
        'IA, :NUMREG, '
      '   :TIPO, :VLRTOTAL)')
    DeleteSQL.Strings = (
      'delete from CTRLINTERFACE'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 702
    Top = 355
  end
  object qryHstRubSal: TwwQuery [77]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODPROVDESC,         FLGCOMPOEREMTOTAL,       FLGCOMPOESA' +
        'LBENEF,'
      '       FLGCOMPOESALPART,    FLGIRRF,                 FLGPREVIA,'
      '       FLGSRB,              IDMOTIVO,                IDPATRO,'
      '       IDPESSJUR,           IDPESSOA,                IDRUBRICA,'
      '       MES,                 MESCOBRANCA,             REFERENCIA,'
      '       SEQRUBRICA,          VALORPROVENTO,           IDMODULO'
      'FROM   HISTRUBSAL'
      'WHERE  IDPESSJUR   = :IDPESSJUR'
      'AND    IDPESSOA    = :IDPESSOA'
      'ORDER BY MES, IDRUBRICA'
      '')
    UpdateObject = updHstRubSal
    ValidateWithMask = True
    Left = 777
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updHstRubSal: TUpdateSQL [78]
    ModifySQL.Strings = (
      'update HISTRUBSAL'
      'set'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGIRRF = :FLGIRRF,'
      '  FLGPREVIA = :FLGPREVIA,'
      '  FLGSRB = :FLGSRB,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDPATRO = :IDPATRO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  MES = :MES,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  REFERENCIA = :REFERENCIA,'
      '  SEQRUBRICA = :SEQRUBRICA,'
      '  VALORPROVENTO = :VALORPROVENTO,'
      '  IDMODULO = :IDMODULO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    InsertSQL.Strings = (
      'insert into HISTRUBSAL'
      
        '  (CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOES' +
        'ALPART, '
      
        '   FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDP' +
        'ESSOA, '
      
        '   IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPRO' +
        'VENTO,'
      '   IDMODULO)'
      'values'
      
        '  (:CODPROVDESC, :FLGCOMPOEREMTOTAL, :FLGCOMPOESALBENEF, :FLGCOM' +
        'POESALPART,'
      
        '   :FLGIRRF, :FLGPREVIA, :FLGSRB, :IDMOTIVO, :IDPATRO, :IDPESSJU' +
        'R, :IDPESSOA,'
      
        '   :IDRUBRICA, :MES, :MESCOBRANCA, :REFERENCIA, :SEQRUBRICA, :VA' +
        'LORPROVENTO,'
      '   :IDMODULO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from HISTRUBSAL'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  SEQRUBRICA = :OLD_SEQRUBRICA')
    Left = 764
    Top = 340
  end
  inherited updRamal: TUpdateSQL
    Left = 612
    Top = 383
  end
  inherited dsRamal: TwwDataSource
    Left = 558
    Top = 19
  end
  inherited qryDocumento: TwwQuery
    Left = 841
    Top = 292
    inherited qryDocumentoNUMDOCUMENTO: TStringField
      DisplayWidth = 30
      Size = 30
    end
  end
  object qryHstRubricaXPess: TwwQuery [82]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MESREFERENCIA, IDRUBRICA, VALORACUMULADO, IDPESSOA, IDPLA' +
        'NOPREV'
      'FROM   HSTRUBRICAXPESS'
      'WHERE  IDPESSOA      = :IDPESSOA'
      'AND    IDPLANOPREV   = :IDPLANOPREV'
      'AND    MESREFERENCIA = :MESREFERENCIA'
      'AND    IDRUBRICA     = :IDRUBRICA')
    UpdateObject = updHstRubricaXPess
    ValidateWithMask = True
    Left = 92
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object updHstRubricaXPess: TUpdateSQL [83]
    ModifySQL.Strings = (
      'update HSTRUBRICAXPESS'
      'set'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  VALORACUMULADO = :VALORACUMULADO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into HSTRUBRICAXPESS'
      
        '  (MESREFERENCIA, IDRUBRICA, VALORACUMULADO, IDPESSOA, IDPLANOPR' +
        'EV)'
      'values'
      
        '  (:MESREFERENCIA, :IDRUBRICA, :VALORACUMULADO, :IDPESSOA, :IDPL' +
        'ANOPREV)')
    DeleteSQL.Strings = (
      'delete from HSTRUBRICAXPESS'
      'where'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 224
    Top = 194
  end
  object qryOrgaoPrev: TwwQuery [84]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPESSJUR, SIGLA, NOME'
      'FROM ORGAOPREV'
      'WHERE IDPESSJUR = :ELG_IDPESSJUR')
    ValidateWithMask = True
    Left = 344
    Top = 558
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ELG_IDPESSJUR'
        ParamType = ptUnknown
        Value = 3982
      end>
  end
  inherited dsDocumento: TwwDataSource
    Left = 803
    Top = 246
  end
  inherited updDocumento: TUpdateSQL
    Left = 707
    Top = 404
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 710
    Top = 147
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 535
    Top = 65524
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpFisica
    SubTipo = stElegivel
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 324
    Top = 104
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 610
    Top = 65512
  end
  inherited qryImagem: TwwQuery
    Left = 167
    Top = 354
  end
  inherited updImagem: TUpdateSQL
    Left = 1005
    Top = 572
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 1009
    Top = 390
  end
  inherited qryImagensDoc: TwwQuery
    Left = 79
    Top = 501
  end
  inherited dsImagem: TwwDataSource
    Left = 463
    Top = 7
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 351
    Top = 31
  end
  inherited qryTipoDoc: TwwQuery
    Left = 142
    Top = 502
  end
  object qryVinculaFunc: TwwQuery [98]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODVINCULAFUNC, DESCRICAO'
      'FROM VINCULAFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 75
    Top = 478
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
    Left = 802
    Top = 112
  end
  inherited qryEstado: TwwQuery
    Left = 177
    Top = 565
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203531382C203339352C203531302C203136392C2C2C2C0D0A4553
      5441444F2C45535441444F2C32302C2031302C203133372C203133352C2C2C2C
      2C0D0A504149532C504149532C3135372C2031302C203333312C203133352C2C
      2C2C2C0D0A20202020342C202D204E756D626572206F6620436F6C756D6E732C
      2C2C2C2C2C0D0A434F4445535441444F2C45535441444F2C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D45
      45535441444F2C45535441444F2C202020202020202020202020202020202020
      36352C20202020202C202C2C312C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A4944504149532C504149532C20
      202020202020202020202020202020202020312C20202020202C202C2C2C0D0A
      20202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C
      2C0D0A4E4F4D45504149532C504149532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E75
      6D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944504149532C45535441
      444F2C4944504149532C504149532C202020202020202020202C202020202020
      202020202C2C0D0A0D0A2253454C4543542053746174656D656E74220D0A2C2C
      2C2C2C2C2C0D0A53454C4543540945535441444F2E22434F4445535441444F22
      202C200D0A0945535441444F2E224E4F4D4545535441444F22202C2050414953
      2E2249445041495322202C200D0A09504149532E224E4F4D4550414953220D0A
      46524F4D092245535441444F222045535441444F202C20225041495322205041
      49530D0A574845524509282045535441444F2E494450414953203D2050414953
      2E49445041495320290D0A4F524445522042590D0A0945535441444F2E224E4F
      4D4545535441444F222C2C2C2C2C2C2C0D0A}
  end
  inherited qryCidade: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO ,'
      '  E.NOMEESTADO ,'
      '  P.IDPAIS ,'
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL'
      'FROM'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P'
      'WHERE'
      '  ( ( :IDESTADO IS NULL ) OR ( C.IDESTADO = :IDESTADO ) ) AND'
      '  ( C.IDESTADO = E.IDESTADO ) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY C.NOME'
      ' ')
    Left = 294
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDESTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDESTADO'
        ParamType = ptInput
      end>
  end
  inherited dsCidade: TwwDataSource
    Left = 379
    Top = 31
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 680
    Top = 138
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 1108
    Top = 506
  end
  inherited qryTipoDocOficial: TwwQuery
    Left = 1396
    Top = 730
  end
  inherited qQueryAux: TwwQuery
    Left = 169
    Top = 332
  end
  object qryHistFuncPrev: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,  IDPESSJUR, SEQHISTFUNC, DATAINICIO,'
      '       DATAFINAL, FLGCONTATS, FLGCONCOMITANTE, DATAPROCESSO,'
      '       MATRICULA, IDDOCUMENTO, CODTPINSALUBRI, CARGO,'
      '       FUNCAO, TEMPOCALCINSALUB, EMPRESA, VALORCARGO,'
      '       NUMDOCUMENTO, VINCEMPREG, TEMPOCALC'
      'FROM   HISTFUNCPREV'
      'WHERE  IDPESSJUR   = :IDPESSJUR'
      'AND    IDPESSOA    = :IDPESSOA'
      ' ')
    UpdateObject = updHistFuncPrev
    ValidateWithMask = True
    Left = 913
    Top = 518
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updHistFuncPrev: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNCPREV'
      'set'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  FLGCONTATS = :FLGCONTATS,'
      '  FLGCONCOMITANTE = :FLGCONCOMITANTE,'
      '  DATAPROCESSO = :DATAPROCESSO,'
      '  MATRICULA = :MATRICULA,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  CODTPINSALUBRI = :CODTPINSALUBRI,'
      '  CARGO = :CARGO,'
      '  FUNCAO = :FUNCAO,'
      '  TEMPOCALCINSALUB = :TEMPOCALCINSALUB,'
      '  EMPRESA = :EMPRESA,'
      '  VALORCARGO = :VALORCARGO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  VINCEMPREG = :VINCEMPREG,'
      '  TEMPOCALC = :TEMPOCALC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'insert into HISTFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, DATAINICIO, DATAFINAL, FLGC' +
        'ONTATS, '
      
        '   FLGCONCOMITANTE, DATAPROCESSO, MATRICULA, IDDOCUMENTO, CODTPI' +
        'NSALUBRI, '
      
        '   CARGO, FUNCAO, TEMPOCALCINSALUB, EMPRESA, VALORCARGO, NUMDOCU' +
        'MENTO, '
      '   VINCEMPREG, TEMPOCALC)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :DATAINICIO, :DATAFINAL,' +
        ' :FLGCONTATS, '
      
        '   :FLGCONCOMITANTE, :DATAPROCESSO, :MATRICULA, :IDDOCUMENTO, :C' +
        'ODTPINSALUBRI, '
      
        '   :CARGO, :FUNCAO, :TEMPOCALCINSALUB, :EMPRESA, :VALORCARGO, :N' +
        'UMDOCUMENTO, '
      '   :VINCEMPREG, :TEMPOCALC)')
    DeleteSQL.Strings = (
      'delete from HISTFUNCPREV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    Left = 876
    Top = 356
  end
  object dsOutrasInforms: TwwDataSource
    DataSet = qryOutrasInforms
    Left = 429
    Top = 216
  end
  object qryOutrasInforms: TwwQuery
    CachedUpdates = True
    BeforePost = qryOutrasInformsBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSOA, PP.IDPARAM, PP.DATAINICIO, PP.DATAFIM, PP.VA' +
        'LOR,'
      
        '       PF.DESCRICAO, PF.TIPO, PF.VALIDACAO, PF.LEGENDA, PP.CE, P' +
        'P.NUP'
      'FROM PESSOAPARAM PP, PARAMFLAGPESSOA PF'
      'WHERE  PP.IDPESSOA = :IdPessoa AND'
      '       PP.IDPARAM  = PF.IDPARAM'
      'ORDER BY PF.DESCRICAO')
    UpdateObject = updOutrasInforms
    ValidateWithMask = True
    Left = 411
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 52462
      end>
  end
  object updOutrasInforms: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAPARAM'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPARAM = :IDPARAM,'
      '  VALOR = :VALOR,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFIM = :DATAFIM,'
      '  CE = :CE,'
      '  NUP = :NUP'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPARAM = :OLD_IDPARAM AND '
      '  DATAINICIO = :OLD_DATAINICIO'
      '')
    InsertSQL.Strings = (
      'insert into PESSOAPARAM'
      '  (IDPESSOA, IDPARAM, VALOR, DATAINICIO, DATAFIM, CE, NUP)'
      'values'
      
        '  (:IDPESSOA, :IDPARAM, :VALOR, :DATAINICIO, :DATAFIM, :CE, :NUP' +
        ')')
    DeleteSQL.Strings = (
      'delete from PESSOAPARAM'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPARAM = :OLD_IDPARAM AND '
      '  DATAINICIO = :OLD_DATAINICIO')
    Left = 989
    Top = 440
  end
  object qryParamPessoa: TwwQuery
    AfterScroll = qryAgenciaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARAM, DESCRICAO, TIPO, VALIDACAO, LEGENDA'
      'FROM PARAMFLAGPESSOA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 427
    Top = 418
  end
  object qryCedidoPatro: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT PA.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, PATRO PA'
      'WHERE PE.IDPESSOA = PA.IDPESSOA'
      '  AND PE.IDPESSOA <> :IDPATRO'
      'ORDER BY PE.NOME')
    ValidateWithMask = True
    Left = 275
    Top = 463
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
  end
  object qryWebAcesso: TwwQuery
    CachedUpdates = True
    ValidateWithMask = True
    Left = 954
    Top = 488
  end
  object dsParamPessoa: TwwDataSource
    AutoEdit = False
    DataSet = qryParamPessoa
    Left = 467
    Top = 346
  end
  object MontaSelectEndereco: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.NOMEESTADO'
      'ESTADO.CODESTADO'
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Cidade'
      'Estado'
      'UF'
      'País')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ESTADO'
      'PAIS'
      'CIDADES')
    CamposChave.Strings = (
      'ESTADO.IDESTADO'
      'PAIS.IDPAIS'
      'CIDADES.IDCIDADES'
      'ESTADO.NOMEESTADO'
      'CIDADES.NOME'
      'PAIS.NOMENACIONALIDADE')
    Filtro.Strings = (
      'CIDADES.IDESTADO = ESTADO.IDESTADO'
      'ESTADO.IDPAIS = PAIS.IDPAIS')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '30'
      '3'
      '30')
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
    Left = 763
    Top = 268
  end
  object qryLocalNascimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO ,'
      '  E.NOMEESTADO ,'
      '  P.IDPAIS ,'
      '  P.NOMEPAIS,'
      '  P.NOMENACIONALIDADE,'
      '  E.IDESTADO'
      'FROM'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P,'
      '  PESSOAFISICA PF'
      'WHERE'
      '  ( IDPESSOA = :IDPESSOA)  AND'
      '  ( PF.IDPAIS = P.IDPAIS ) AND'
      '  --BRUNO AZEVEDO SOL 187357 KINTANA 1767650'
      '  --( PF.IDESTADO = E.IDESTADO) AND'
      '  ( PF.IDCIDADES = C.IDCIDADES ) AND'
      '  ( C.IDESTADO = E.IDESTADO ) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 763
    Top = 203
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryGrauInstrucao: TwwQuery
    CachedUpdates = True
    BeforePost = qryOutrasInformsBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRINSTR, DESCRICAO FROM grinstr'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 164
    Top = 277
  end
  object QryHistoricoTipoIr: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(NVL(TIPOOPCAOIR,0),0,'#39'Sem Opção '#39',1,'#39'Tabela Progre' +
        'ssiva'#39', 2, '#39'Tabela Regressiva'#39') AS NOME, '
      'DTINICIO, DTFIM, IDHISTOPIR, min(DTINICIO) over () As MenorData'
      'FROM HISTOPIR'
      'WHERE IDPESSOA = :IDPESSOA'
      'AND IDPLANPREV = :IDPLANPREV'
      'ORDER BY DTINICIO DESC, DTFIM DESC')
    UpdateObject = UpdhstOpcaoIr
    Left = 840
    Top = 386
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREV'
        ParamType = ptUnknown
      end>
    object QryHistoricoTipoIrNOME: TStringField
      DisplayLabel = 'Tipo de Tributação'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 18
    end
    object QryHistoricoTipoIrDTINICIO: TDateTimeField
      DisplayLabel = 'Data da Opção'
      DisplayWidth = 13
      FieldName = 'DTINICIO'
    end
    object QryHistoricoTipoIrDTFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 13
      FieldName = 'DTFIM'
    end
    object QryHistoricoTipoIrMENORDATA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'MENORDATA'
    end
    object QryHistoricoTipoIrIDHISTOPIR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTOPIR'
      Visible = False
    end
  end
  object dsHistoricoTipoIr: TDataSource
    DataSet = QryHistoricoTipoIr
    Left = 741
    Top = 458
  end
  object QryContaResgate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        #39'                                                               ' +
        '                                               '#39'  AS IDROWID'
      'FROM DUAL')
    UpdateObject = updContaResgate
    ValidateWithMask = True
    Left = 345
    Top = 396
  end
  object updContaResgate: TUpdateSQL
    Left = 339
    Top = 342
  end
  object qryMolestiaGrave: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DTINICIO, DTFINAL'
      '  FROM HSTMOLESTIAGRAVE'
      ' WHERE IDPESSOA = :IdPessoa'
      'ORDER BY DTINICIO DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 793
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object dsMolestiaGrave: TwwDataSource
    DataSet = qryMolestiaGrave
    Left = 793
    Top = 532
  end
  object qryContatoTel: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  TELENDPESS.IDTELEFONE,'
      '   CONTATOPESS.IDCONTATO , '
      '   ENDPESS.IDPESSOA , '
      '   CONTATOPESS.IDENDERECO , '
      '   CONTATOPESS.NOME , '
      '   CONTATOPESS.EMAIL , '
      '   CONTATOPESS.CARGO , '
      '   CONTATOPESS.SETOR,'
      '   CONTATOPESS.NASCIMENTO,'
      '   CONTATOPESS.OBS'
      'FROM TELENDPESS,CONTATOPESS,ENDPESS,TELCONTATO WHERE'
      '  CONTATOPESS.IDENDERECO = TELENDPESS.IDENDERECO'
      'AND  ENDPESS.IDENDERECO = CONTATOPESS.IDENDERECO  '
      'AND  TELCONTATO.IDCONTATO = CONTATOPESS.IDCONTATO'
      'AND  TELCONTATO.IDTELEFONE = TELENDPESS.IDTELEFONE'
      'AND   ENDPESS.IDPESSOA = :IdPessoa'
      'AND TELENDPESS.IDTELEFONE = :IdTelefone'
      '  ')
    ValidateWithMask = True
    Left = 737
    Top = 525
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdTelefone'
        ParamType = ptUnknown
      end>
  end
  object dsContatoTel: TwwDataSource
    DataSet = qryContatoTel
    Left = 682
    Top = 290
  end
  object UpdhstOpcaoIr: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTOPIR'
      'set'
      '  DTINICIO = :DTINICIO,'
      '  DTFIM = :DTFIM'
      'where'
      '  IDHISTOPIR = :OLD_IDHISTOPIR')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      'delete from HISTOPIR'
      'where'
      '  IDHISTOPIR = :OLD_IDHISTOPIR')
    Left = 980
    Top = 196
  end
  object CDShistIrLocal: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1048
    Top = 185
    Data = {
      600000009619E0BD010000001800000004000000000003000000600008445449
      4E4943494F040006000000000005445446494D04000600000000000A49444849
      53544F50495208000400000000000B5449504F4F5043414F4952080004000000
      00000000}
    object CDShistIrLocalTIPOOPCAOIR: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOOPCAOIR'
    end
    object CDShistIrLocalDTINICIO: TDateField
      DisplayLabel = 'Data da Opção'
      DisplayWidth = 13
      FieldName = 'DTINICIO'
    end
    object CDShistIrLocalDTFIM: TDateField
      DisplayWidth = 13
      FieldName = 'DTFIM'
    end
    object CDShistIrLocalIDHISTOPIR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTOPIR'
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = CDShistIrLocal
    Left = 965
    Top = 338
  end
  object QryhstOpcaoIr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateMode = upWhereKeyOnly
    PictureMasks.Strings = (
      'NOMEGRUPO'#9'*@'#9'T'#9'F')
    ValidateWithMask = True
    Left = 1092
    Top = 525
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos texto (*.txt)|*.txt|Todos os arquivos|*.*'
    Left = 1128
    Top = 104
  end
  object dsLogReprLegal: TwwDataSource
    AutoEdit = False
    DataSet = qryLogReprLegal
    Left = 444
    Top = 522
  end
  object qryLogReprLegal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRESP.NUMDOCUMENTO AS NUMDOCUMENTO,'
      '       PRESP.NOME AS NOMERESPONSAVEL,'
      '       PREC.NOME AS NOMERECEBEDOR,'
      '       T.DESCRICAO  AS TIPORESPONSAVEL,'
      '       L.CODTIPORESPONSAVEL,'
      
        '       DECODE(L.SITATUAL, 1, '#39'Vigente'#39', 2, '#39'Vencida'#39', '#39'Extinta'#39')' +
        ' AS SITUACAO,'
      '       L.SITATUAL,'
      '       L.IDPESSJUR,'
      '       L.IDTITULAR,'
      '       L.IDPLANOORIGEM,'
      '       L.IDPESSOA,'
      '       L.SEQPROPOSTA,'
      '       L.IDPLANOPREV,'
      '       L.IDRESPONSAVEL,     '
      '       L.IDRECEBEDOR,'
      '       L.DATAINICIO,'
      '       L.DATATERMINO,     '
      
        '       CAST(SUBSTR(L.OBSERVACAO, 1, 100) AS VARCHAR2(100)) AS OB' +
        'SERVACAO100,'
      '       L.OBSERVACAO,'
      '       L.ACAO,'
      '       L.TRGDTINCLUSAO,'
      '       (SELECT U.NOMEUSUARIO'
      '          FROM USUARIOSISTEMA U'
      
        '         WHERE TO_CHAR(U.IDUSUARIO) = SUBSTR(L.TRGUSERINCLUSAO, ' +
        '3, 10)) AS NOMEUSUARIO'
      ''
      '  FROM LOGREPRLEGAL L'
      ''
      ' LEFT JOIN PESSOA PRESP'
      '    ON PRESP.IDPESSOA = L.IDRESPONSAVEL'
      '    '
      '     LEFT JOIN PESSOA PREC'
      '    ON PREC.IDPESSOA = L.IDRECEBEDOR'
      ''
      '  LEFT JOIN TIPORECEBEDOR T'
      '    ON T.CODTIPORECEBEDOR = L.CODTIPORESPONSAVEL'
      ''
      ' WHERE L.IDPESSJUR = :IDPESSJUR'
      '   AND L.IDPESSOA =  :IDPESSOA'
      '   AND L.IDTITULAR = :IDTITULAR'
      '  '
      ''
      ' ORDER BY L.TRGDTINCLUSAO DESC')
    ValidateWithMask = True
    Left = 454
    Top = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryLogReprLegalNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryLogReprLegalNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qryLogReprLegalNOMERECEBEDOR: TStringField
      FieldName = 'NOMERECEBEDOR'
      Size = 60
    end
    object qryLogReprLegalTIPORESPONSAVEL: TStringField
      FieldName = 'TIPORESPONSAVEL'
      Size = 60
    end
    object qryLogReprLegalCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      Size = 5
    end
    object qryLogReprLegalSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 7
    end
    object qryLogReprLegalSITATUAL: TFloatField
      FieldName = 'SITATUAL'
    end
    object qryLogReprLegalIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryLogReprLegalIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryLogReprLegalIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryLogReprLegalIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryLogReprLegalSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryLogReprLegalIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryLogReprLegalIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryLogReprLegalIDRECEBEDOR: TFloatField
      FieldName = 'IDRECEBEDOR'
    end
    object qryLogReprLegalDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryLogReprLegalDATATERMINO: TDateTimeField
      FieldName = 'DATATERMINO'
    end
    object qryLogReprLegalOBSERVACAO100: TStringField
      FieldName = 'OBSERVACAO100'
      Size = 100
    end
    object qryLogReprLegalOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryLogReprLegalACAO: TStringField
      FieldName = 'ACAO'
      Size = 30
    end
    object qryLogReprLegalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryLogReprLegalNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
  end
  object updReprLegal: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTREPRLEGAL'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDRECEBEDOR = :IDRECEBEDOR,'
      '  CODTIPORESPONSAVEL = :CODTIPORESPONSAVEL,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATATERMINO = :DATATERMINO,'
      '  SITATUAL = :SITATUAL,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO '
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    InsertSQL.Strings = (
      'insert into HSTREPRLEGAL'
      
        '  (IDPESSJUR, IDTITULAR, IDPLANOORIGEM, IDPESSOA, SEQPROPOSTA, I' +
        'DPLANOPREV, '
      
        '   IDRESPONSAVEL,IDRECEBEDOR, CODTIPORESPONSAVEL, DATAINICIO, DA' +
        'TATERMINO, SITATUAL, '
      '   OBSERVACAO)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOORIGEM, :IDPESSOA, :SEQPROPOS' +
        'TA, :IDPLANOPREV, '
      
        '   :IDRESPONSAVEL, :IDRECEBEDOR, :CODTIPORESPONSAVEL, :DATAINICI' +
        'O, :DATATERMINO, :SITATUAL, '
      '   :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from HSTREPRLEGAL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    Left = 552
    Top = 511
  end
  object qryReprLegal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryReprLegalAfterOpen
    BeforePost = qryReprLegalBeforePost
    AfterDelete = qryReprLegalAfterDelete
    AfterScroll = qryReprLegalAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRESP.NUMDOCUMENTO AS NUMDOCUMENTO,'
      '       PRESP.NOME AS NOMERESPONSAVEL,'
      '       PREC.NOME AS NOMERECEBEDOR,'
      '       T.DESCRICAO AS TIPORESPONSAVEL,'
      '       H.CODTIPORESPONSAVEL,'
      
        '       DECODE(H.SITATUAL, 1, '#39'Vigente'#39', 2, '#39'Vencida'#39', '#39'Extinta'#39')' +
        ' AS SITUACAO,'
      '       H.SITATUAL,'
      '       H.IDPESSJUR,'
      '       H.IDTITULAR,'
      '       H.IDPLANOORIGEM,'
      '       H.IDPESSOA,'
      '       H.SEQPROPOSTA,'
      '       H.IDPLANOPREV,'
      '       H.IDRESPONSAVEL,     '
      '       H.IDRECEBEDOR,'
      '       H.DATAINICIO,'
      '       H.DATATERMINO,     '
      
        '       CAST(SUBSTR(H.OBSERVACAO, 1, 100) AS VARCHAR2(100)) AS OB' +
        'SERVACAO100,'
      '       H.OBSERVACAO,'
      '       H.TRGDTINCLUSAO,'
      '       (SELECT U.NOMEUSUARIO'
      '          FROM USUARIOSISTEMA U'
      
        '         WHERE TO_CHAR(U.IDUSUARIO) = SUBSTR(H.TRGUSERINCLUSAO, ' +
        '3, 10)) AS NOMEUSUARIO'
      ''
      '  FROM HSTREPRLEGAL H'
      ''
      'LEFT JOIN PESSOA PRESP'
      '    ON PRESP.IDPESSOA = H.IDRESPONSAVEL'
      '    '
      ' LEFT JOIN PESSOA PREC'
      '    ON PREC.IDPESSOA = H.IDRECEBEDOR'
      ''
      '  LEFT JOIN TIPORECEBEDOR T'
      '    ON T.CODTIPORECEBEDOR = H.CODTIPORESPONSAVEL'
      ''
      ' WHERE H.IDPESSJUR = :IDPESSJUR'
      '   AND H.IDPESSOA = :IDPESSOA'
      '   AND H.IDTITULAR = :IDTITULAR'
      ''
      ''
      ' ORDER BY H.TRGDTINCLUSAO DESC')
    UpdateObject = updReprLegal
    ValidateWithMask = True
    Left = 537
    Top = 525
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryReprLegalNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryReprLegalNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qryReprLegalNOMERECEBEDOR: TStringField
      FieldName = 'NOMERECEBEDOR'
      Size = 60
    end
    object qryReprLegalTIPORESPONSAVEL: TStringField
      FieldName = 'TIPORESPONSAVEL'
      Size = 60
    end
    object qryReprLegalCODTIPORESPONSAVEL: TStringField
      FieldName = 'CODTIPORESPONSAVEL'
      Size = 5
    end
    object qryReprLegalSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 7
    end
    object qryReprLegalSITATUAL: TFloatField
      FieldName = 'SITATUAL'
    end
    object qryReprLegalIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryReprLegalIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryReprLegalIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryReprLegalIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryReprLegalSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryReprLegalIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryReprLegalIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryReprLegalIDRECEBEDOR: TFloatField
      FieldName = 'IDRECEBEDOR'
    end
    object qryReprLegalDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryReprLegalDATATERMINO: TDateTimeField
      FieldName = 'DATATERMINO'
    end
    object qryReprLegalOBSERVACAO100: TStringField
      FieldName = 'OBSERVACAO100'
      Size = 100
    end
    object qryReprLegalOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryReprLegalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryReprLegalNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
  end
  object dsReprLegal: TwwDataSource
    AutoEdit = False
    DataSet = qryReprLegal
    Left = 527
    Top = 511
  end
  object qryTipoRecebedor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPORECEBEDOR,'
      '        DESCRICAO'
      'FROM TIPORECEBEDOR'
      'ORDER BY DESCRICAO')
    Left = 598
    Top = 511
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Responsável/Recebedor'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'RESPONSAVEL.IDRESPONSAVEL'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = RESPONSAVEL.IDRESPONSAVEL'
      'RESPONSAVEL.FLGADMPREV = 1')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 572
    Top = 7
  end
  object qryBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  B.IDTITULAR,  B.IDPESSOA,  B.IDRESPONSAVEL,  B.IDRESPONN' +
        'AOREC, '
      
        ' B.CODTIPORECEBEDOR , B.IDBENEFICIO, B.Datafimreceb  FROM BFCIAR' +
        'IOTITPLAN B'
      'WHERE'
      'B.IDPESSJUR = :IDPESSJUR'
      'AND B.IDPESSOA = :IDPESSOA'
      '   AND B.IDTITULAR = :IDTITULAR')
    ValidateWithMask = True
    Left = 521
    Top = 421
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryBenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.IDTITULAR'
    end
    object qryBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.IDPESSOA'
    end
    object qryBenefIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.IDRESPONSAVEL'
    end
    object qryBenefIDRESPONNAOREC: TFloatField
      FieldName = 'IDRESPONNAOREC'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.IDRESPONNAOREC'
    end
    object qryBenefCODTIPORECEBEDOR: TStringField
      FieldName = 'CODTIPORECEBEDOR'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.CODTIPORECEBEDOR'
      Size = 5
    end
    object qryBenefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.IDBENEFICIO'
    end
    object qryBenefDATAFIMRECEB: TDateTimeField
      FieldName = 'DATAFIMRECEB'
      Origin = 'BASEDADOS.BFCIARIOTITPLAN.DATAFIMRECEB'
    end
  end
  object dsBenef: TwwDataSource
    AutoEdit = False
    DataSet = qryBenef
    Left = 505
    Top = 407
  end
  object qryEstCivil: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT '
      '    T.ESTCIVIL, T.DESCRICAO '
      '          FROM'
      '            ESTADOCIVIL T'
      '              WHERE T.FLGATIVO = 1')
    ValidateWithMask = True
    Left = 1088
    Top = 448
  end
  object dsEstCivil: TwwDataSource
    DataSet = qryEstCivil
    Left = 1140
    Top = 538
  end
  object CMValidaCPF: TCMValidaDoc
    TipoDocumento = tdCPF
    Mensagem.ExibeMensagem = False
    Mensagem.Texto = 'Número de Documento Inválido'
    Left = 473
    Top = 64
  end
  object qryPF2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PF.IDPESSOA,PF.INFOADICIONAIS '
      'FROM '
      '  CM.PESSOAFISICA PF '
      'WHERE '
      '  IDPESSOA = :IDPESSOA')
    UpdateObject = updPf2
    ValidateWithMask = True
    Left = 13
    Top = 540
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPf2: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.PESSOAFISICA'
      'set'
      '  INFOADICIONAIS = :INFOADICIONAIS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CM.PESSOAFISICA'
      '  (INFOADICIONAIS)'
      'values'
      '  (:INFOADICIONAIS)')
    DeleteSQL.Strings = (
      'delete from CM.PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 45
    Top = 540
  end
  object dsPF2: TwwDataSource
    DataSet = qryPF2
    Left = 76
    Top = 540
  end
  object qryOcupacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOAPPE,'
      
        '       CAST(SUBSTR(P.CARGOEMPFUNC,1,200) AS VARCHAR2(200)) AS CA' +
        'RGOEMPFUNC,'
      '       P.ENTIDADE,'
      '       P.RENDA,'
      '       P.DTINICIO,'
      '       P.DTFIM,'
      '       P.IDPESSOA'
      ' FROM CM.PESSOAPPE P '
      ' WHERE P.IDPESSOA =  :IDPESSOA'
      ' ORDER BY  P.DTINICIO, P.CARGOEMPFUNC')
    UpdateObject = updOcupacao
    ValidateWithMask = True
    Left = 13
    Top = 372
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryOcupacaoIDPESSOAPPE: TFloatField
      FieldName = 'IDPESSOAPPE'
    end
    object qryOcupacaoCARGOEMPFUNC: TStringField
      FieldName = 'CARGOEMPFUNC'
      Size = 200
    end
    object qryOcupacaoRENDA: TFloatField
      FieldName = 'RENDA'
      DisplayFormat = '#,##0.00'
    end
    object qryOcupacaoENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Size = 150
    end
    object qryOcupacaoDTINICIO: TDateTimeField
      FieldName = 'DTINICIO'
    end
    object qryOcupacaoDTFIM: TDateTimeField
      FieldName = 'DTFIM'
    end
    object qryOcupacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object dsOcupacao: TwwDataSource
    DataSet = qryOcupacao
    Left = 40
    Top = 372
  end
  object updOcupacao: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE CM.PESSOAPPE'
      '   SET CARGOEMPFUNC   =  :CARGOEMPFUNC,'
      '       ENTIDADE                  =  :ENTIDADE,'
      '       RENDA                        =  :RENDA,'
      '       DTINICIO                     =  :DTINICIO,'
      '       DTFIM                          =  :DTFIM,'
      '       IDPESSOA                   =  :IDPESSOA'
      ' WHERE '
      '      IDPESSOAPPE   = :OLD_IDPESSOAPPE '
      '      AND IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'INSERT INTO CM.PESSOAPPE'
      '  (IDPESSOAPPE,'
      '   CARGOEMPFUNC,'
      '   ENTIDADE,'
      '   RENDA,'
      '   DTINICIO,'
      '   DTFIM,'
      '   IDPESSOA)'
      'VALUES'
      '  (:IDPESSOAPPE,'
      '   :CARGOEMPFUNC,'
      '   :ENTIDADE,'
      '   :RENDA,'
      '   :DTINICIO,'
      '   :DTFIM,'
      '   :IDPESSOA)')
    DeleteSQL.Strings = (
      'DELETE FROM CM.PESSOAPPE '
      'WHERE '
      '  IDPESSOAPPE   = :OLD_IDPESSOAPPE '
      '  AND IDPESSOA = :OLD_IDPESSOA')
    Left = 69
    Top = 372
  end
  object qryNomePI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   PI.IDPERFILINVEST,'
      '   PI.NOME NOMEPERFIL,'
      '   PI.DESCRICAO,'
      '   PI.IDPLANOPREV,'
      '   PP.NOME as PlanPrev,'
      '   PI.IDPLANPREVCONTAB,'
      '   PPC.NOME as PlanContabil,   '
      '   PI.FLGATIVO'
      'FROM'
      '    PERFILINVEST PI,'
      '    PLANPREV PP,'
      '    PLANPREVCONTABIL PPC'
      'WHERE '
      '  PI.IDPLANOPREV = :IDPLANOPREV AND'
      '  PI.IDPLANOPREV = PP.IDPLANOPREV AND'
      '  PI.IDPLANPREVCONTAB = PPC.IDPLANOPREV'
      '  '
      ' ')
    ValidateWithMask = True
    Left = 1198
    Top = 573
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsPerfilInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryPerfilInvest
    Left = 1194
    Top = 524
  end
  object qryPerfilInvest: TwwQuery
    CachedUpdates = True
    BeforePost = qryPerfilInvestBeforePost
    AfterPost = qryPerfilInvestAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   PIE.*,'
      '   PI.NOME NOMEPERFIL,'
      '   PP.IDPLANOPREV IDPP,'
      '   PP.NOME PLANPREV,'
      '   PPC.IDPLANOPREV IDPPC,'
      '   PPC.NOME PLANCONTABIL'
      'FROM'
      '    PERFILINVXELEG PIE,'
      '    PERFILINVEST PI,'
      '    PLANPREV PP,'
      '    PLANPREVCONTABIL PPC'
      'WHERE '
      '  PIE.IDPESSOA = :IDPESSOA AND'
      '  PIE.IDPESSJUR = :IDPESSJUR AND'
      '  PIE.IDPERFILINVEST = PI.IDPERFILINVEST AND'
      '  PI.IDPLANOPREV = PP.IDPLANOPREV AND'
      '  PI.IDPLANPREVCONTAB = PPC.IDPLANOPREV')
    UpdateObject = updPerfilInvest
    ValidateWithMask = True
    Left = 1193
    Top = 477
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPrevPI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPLANOPREV , '
      ' P.IDFUNDACAO , '
      ' P.NOME , '
      ' P.IDREGRAADMISSAO , '
      ' P.FLGAUTONUMINSC,'
      ' P.NUMINSCINICIAL,'
      ' PP.DATAINSC, '
      ' PP.FLGATIVO'
      'FROM PLANPREV P, PLANPREVPATRO PP, '
      '     PARTPREVPLAN PPP'
      'WHERE PP.IDPESSJUR = :IDPESSJUR AND'
      '     PP.IDPLANOPREV = P.IDPLANOPREV AND'
      '     PPP.IDPLANOPREV = PP.IDPLANOPREV AND'
      '     PPP.IDPESSJUR = PP.IDPESSJUR AND'
      '     PPP.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 1194
    Top = 433
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPerfilInvest: TUpdateSQL
    ModifySQL.Strings = (
      'update PERFILINVXELEG'
      'set'
      '  IDPERFILINVXELEG = :IDPERFILINVXELEG,'
      '  IDPERFILINVEST = :IDPERFILINVEST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  DTINICIO = :DTINICIO,'
      '  DTFIM = :DTFIM'
      'where'
      '  IDPERFILINVXELEG = :OLD_IDPERFILINVXELEG')
    InsertSQL.Strings = (
      'insert into PERFILINVXELEG'
      '  (IDPERFILINVXELEG, IDPERFILINVEST, IDPESSOA, IDPESSJUR, '
      'SEQPROPOSTA, '
      '   IDPLANOPREV, DTINICIO, DTFIM)'
      'values'
      '  (:IDPERFILINVXELEG, :IDPERFILINVEST, :IDPESSOA, :IDPESSJUR, '
      ':SEQPROPOSTA, '
      '   :IDPLANOPREV, :DTINICIO, :DTFIM)')
    DeleteSQL.Strings = (
      'delete from PERFILINVXELEG'
      'where'
      '  IDPERFILINVXELEG = :OLD_IDPERFILINVXELEG')
    Left = 1197
    Top = 385
  end
  object qryPerfilAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   PIE.*'
      'FROM'
      '    PERFILINVXELEG PIE'
      'WHERE '
      '  PIE.IDPESSOA = :IDPESSOA AND'
      '  PIE.IDPESSJUR = :IDPESSJUR')
    UpdateObject = updPerfilAux
    ValidateWithMask = True
    Left = 1201
    Top = 345
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object updPerfilAux: TUpdateSQL
    ModifySQL.Strings = (
      'update PERFILINVXELEG'
      'set'
      '  IDPERFILINVXELEG = :IDPERFILINVXELEG,'
      '  IDPERFILINVEST = :IDPERFILINVEST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  DTINICIO = :DTINICIO,'
      '  DTFIM = :DTFIM'
      'where'
      '  IDPERFILINVXELEG = :OLD_IDPERFILINVXELEG')
    InsertSQL.Strings = (
      'insert into PERFILINVXELEG'
      '  (IDPERFILINVXELEG, IDPERFILINVEST, IDPESSOA, IDPESSJUR, '
      'SEQPROPOSTA, '
      '   IDPLANOPREV, DTINICIO, DTFIM)'
      'values'
      
        '  (SEQPERFILINVXELEG.NEXTVAL, :IDPERFILINVEST, :IDPESSOA, :IDPES' +
        'SJUR, '
      ':SEQPROPOSTA, '
      '   :IDPLANOPREV, :DTINICIO, :DTFIM)')
    DeleteSQL.Strings = (
      'delete from PERFILINVXELEG'
      'where'
      '  IDPERFILINVXELEG = :OLD_IDPERFILINVXELEG')
    Left = 1205
    Top = 309
  end
end
