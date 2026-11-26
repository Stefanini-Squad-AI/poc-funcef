inherited frmCadDepenBenef: TfrmCadDepenBenef
  Left = 242
  Top = 177
  HelpContext = 160153
  Caption = 'Banco'
  ClientHeight = 680
  ClientWidth = 1262
  WindowState = wsMaximized
  OnActivate = bbtnCancelarClick
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 1262
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 120
        Width = 61
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 181
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97 [1]
    Top = 641
    Width = 1262
    inherited tb97Fundo: TToolbar97
      Left = 883
      DockPos = 883
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 714
      DockPos = 714
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 1262
    Height = 594
    inherited pnlMestre: TPanel
      Width = 1260
      Height = 61
      object lblParticipante: TLabel
        Left = 8
        Top = 1
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object lblMatricula: TLabel
        Left = 292
        Top = 33
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblPatro: TLabel
        Left = 8
        Top = 33
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblInscricao: TLabel
        Left = 519
        Top = 33
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object lblPlanoPrev: TLabel
        Left = 292
        Top = 1
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbTNome: TDBText
        Left = 8
        Top = 16
        Width = 47
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbTPatro: TDBText
        Left = 8
        Top = 48
        Width = 44
        Height = 13
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbTPlano: TDBText
        Left = 292
        Top = 16
        Width = 46
        Height = 13
        AutoSize = True
        DataField = 'NOMEPLANO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbTMatricula: TDBText
        Left = 292
        Top = 48
        Width = 62
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbTInscricao: TDBText
        Left = 519
        Top = 48
        Width = 62
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 519
        Top = 3
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
      end
      object dbSitPart: TDBText
        Left = 519
        Top = 15
        Width = 43
        Height = 13
        AutoSize = True
        DataField = 'SITPARTDESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTpDepen: TLabel
        Left = 800
        Top = 22
        Width = 123
        Height = 13
        Caption = 'Tipo de Dependência'
      end
      object btnListaDocsTitular: TBitBtn
        Left = 664
        Top = 34
        Width = 113
        Height = 25
        Hint = 'Visualiza relação de documentos do titular'
        Caption = 'Documentos'
        TabOrder = 0
        OnClick = btnListaDocsTitularClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000014000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007000000000000000000700000F77777777777777777000000F88
          8888887F8F7F877000000F8EE00EE8F88888877000000F8EE0EEE87F8F8F7870
          00000F8EE00EE8F7F7F7F77000000F8E0BF0E8788888787000000F8E0FB0E8F7
          F7F7777000000F8E0BF0E8788788887000000F8EE00EE8F7F7F7F77000000F8E
          EEEEE8788878887000000F88888888F7F7F7F77000000FFFFF7F7F7F7F7F7F70
          000070000000F7F7000000070000777777770000777777770000}
      end
      object wwDBTpDepen: TwwDBComboBox
        Left = 802
        Top = 38
        Width = 223
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Novo Plano'#9'74'
          'Reg/Replan'#9'2'
          'REB'#9'66'
          'Imposto de Renda'#9'1'
          'Todos'#9'0')
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
        OnChange = wwDBTpDepenChange
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 62
      Width = 1260
      Height = 531
      HotTrack = True
      Tabs.Strings = (
        'Dependentes'
        'Documentos'
        'Endereços'
        'Telefones'
        'Contatos'
        'Conta Bancária'
        'Benefícios'
        'Dependentes do Beneficiário'
        'Outras Informações'
        'Representante Legal')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        'dbgrdEndPess'
        'dbgTelefone'
        'dbgContato'
        'dbgrdContaBanco'
        'dbgrdBeneficiario'
        'dbgrdDepBen'
        'dbgrdOutrasInforms'
        'dbgrdReprLegal'
        'dbgrdLogReprLegal'
        'DbGrdNucleoFamiliar'
        '')
      object TLabel [0]
        Left = 280
        Top = 72
        Width = 5
        Height = 13
      end
      object lblPdCEP: TLabel [1]
        Left = 408
        Top = 191
        Width = 37
        Height = 13
        Caption = 'C.E.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 1162
        Height = 472
        ActivePage = tbsBeneficiario
        OnEnter = pgctrlDetalheEnter
        inherited tbsDet: TTabSheet
          Caption = 'Dependentes'
          inherited dbgrdDet: TwwDBGrid
            Width = 1154
            Height = 237
            Font.Style = []
            ParentFont = False
            TitleLines = 2
            OnCalcCellColors = dbgrdDetCalcCellColors
          end
          inherited pnlControlesDet: TPanel
            Width = 1154
            Height = 237
            object pgcDependente: TPageControl
              Left = 0
              Top = 0
              Width = 1154
              Height = 237
              ActivePage = tbsDet02
              Align = alClient
              TabOrder = 0
              object tbsDet01: TTabSheet
                Caption = 'Informações Principais'
                object lblNome: TLabel
                  Left = 7
                  Top = -2
                  Width = 33
                  Height = 13
                  Caption = 'Nome'
                end
                object Label1: TLabel
                  Left = 455
                  Top = -2
                  Width = 55
                  Height = 13
                  Caption = 'Matrícula'
                end
                object Label28: TLabel
                  Left = 5
                  Top = 74
                  Width = 24
                  Height = 13
                  Caption = 'CPF'
                end
                object lblTpSang: TLabel
                  Left = 579
                  Top = -2
                  Width = 52
                  Height = 13
                  Caption = 'Fator RH'
                end
                object lblNumSequencia: TLabel
                  Left = 642
                  Top = -2
                  Width = 45
                  Height = 13
                  Caption = 'Nº Seq.'
                end
                object Label43: TLabel
                  Left = 111
                  Top = 74
                  Width = 109
                  Height = 13
                  Caption = 'E-Mail Dependente'
                end
                object Label52: TLabel
                  Left = 8
                  Top = 334
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object Label61: TLabel
                  Left = 343
                  Top = 74
                  Width = 114
                  Height = 13
                  Caption = 'Email base FUNCEF'
                end
                object BtnMatricula: TSpeedButton
                  Left = 555
                  Top = 10
                  Width = 20
                  Height = 19
                  Hint = 'Gerar nova matricula '
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
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
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = BtnMatriculaClick
                end
                object lblNmConjuge: TLabel
                  Left = 6
                  Top = 36
                  Width = 101
                  Height = 13
                  Caption = 'Nome do Cônjuge'
                end
                object dbeNome: TDBEdit
                  Left = 6
                  Top = 11
                  Width = 445
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NOME'
                  DataSource = dsPessoa
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnExit = dbeNomeExit
                  OnKeyPress = dbeNomeKeyPress
                end
                object dbeMatricula: TDBEdit
                  Left = 454
                  Top = 11
                  Width = 98
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'MATRICULA'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object dbeCPF: TDBEdit
                  Left = 4
                  Top = 87
                  Width = 100
                  Height = 21
                  DataField = 'NUMDOCUMENTO'
                  DataSource = dsPessoa
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = dbeCPFExit
                end
                object dbeTipoSang: TDBEdit
                  Left = 580
                  Top = 11
                  Width = 49
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'TIPOSANG'
                  DataSource = dsPF
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object dbeNumSequencia: TDBEdit
                  Left = 642
                  Top = 11
                  Width = 47
                  Height = 21
                  Color = clScrollBar
                  DataField = 'NUMSEQUENCIA'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object grpDataNasc: TGroupBox
                  Left = 3
                  Top = 116
                  Width = 326
                  Height = 51
                  Caption = '  Data de ...  '
                  TabOrder = 7
                  object lblDtNascimento: TLabel
                    Left = 7
                    Top = 13
                    Width = 67
                    Height = 13
                    Caption = 'Nascimento'
                  end
                  object lblDataMorte: TLabel
                    Left = 224
                    Top = 13
                    Width = 69
                    Height = 13
                    Caption = 'Falecimento'
                  end
                  object Label42: TLabel
                    Left = 116
                    Top = 13
                    Width = 51
                    Height = 13
                    Caption = 'Cadastro'
                  end
                  object dbdeDataNasc: TCMDateTimePicker
                    Left = 7
                    Top = 26
                    Width = 98
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATANASC'
                    DataSource = dsPF
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
                    OnExit = dbdeDataNascExit
                  end
                  object dbdeDataMorte: TCMDateTimePicker
                    Left = 224
                    Top = 26
                    Width = 98
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAMORTE'
                    DataSource = dsPF
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
                  object dbdeDataCadastro: TCMDateTimePicker
                    Left = 116
                    Top = 26
                    Width = 98
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATACADASTRO'
                    DataSource = dsDet
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
                    OnExit = dbdeDataCadastroExit
                  end
                end
                object grpFiliacao: TGroupBox
                  Left = 0
                  Top = 175
                  Width = 665
                  Height = 54
                  Caption = '  Filiação  '
                  TabOrder = 8
                  object lblNomePai: TLabel
                    Left = 6
                    Top = 15
                    Width = 73
                    Height = 13
                    Caption = 'Nome do Pai'
                  end
                  object lblNomeMae: TLabel
                    Left = 350
                    Top = 16
                    Width = 79
                    Height = 13
                    Caption = 'Nome da Mãe'
                  end
                  object dbeNomePai: TDBEdit
                    Left = 7
                    Top = 28
                    Width = 310
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'NOMEPAI'
                    DataSource = dsPF
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnKeyPress = dbeNomeKeyPress
                  end
                  object dbeNomeMae: TDBEdit
                    Left = 349
                    Top = 29
                    Width = 310
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'NOMEMAE'
                    DataSource = dsPF
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    OnKeyPress = dbeNomeKeyPress
                  end
                end
                object dbrdgrpSituacao: TGroupBox
                  Left = 0
                  Top = 237
                  Width = 449
                  Height = 80
                  TabOrder = 9
                  object lblSitDependente: TLabel
                    Left = 7
                    Top = 7
                    Width = 124
                    Height = 13
                    Caption = 'Situação Dependente'
                  end
                  object lblTipoDepen: TLabel
                    Left = -42
                    Top = -10
                    Width = 5
                    Height = 13
                  end
                  object Label2: TLabel
                    Left = 237
                    Top = 9
                    Width = 114
                    Height = 13
                    Caption = 'Grau de Parentesco'
                  end
                  object Label29: TLabel
                    Left = 6
                    Top = 41
                    Width = 103
                    Height = 13
                    Caption = 'Grau de Instrução'
                  end
                  object Label20: TLabel
                    Left = 237
                    Top = 42
                    Width = 68
                    Height = 13
                    Caption = 'Estado Civil'
                  end
                  object dblkpcmbSitDependente: TwwDBLookupCombo
                    Left = 7
                    Top = 21
                    Width = 204
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'40'#9'dESCRIÇÃO')
                    DataField = 'IDSITDEPENDENTE'
                    DataSource = dsDepen
                    LookupTable = qrySitDependente
                    LookupField = 'IDSITDEPENDENTE'
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = False
                    ShowButton = True
                    AllowClearKey = True
                    OnCloseUp = dblkpcmbSitDependenteCloseUp
                  end
                  object dblkpcmbTipoDependencia: TCMDBLookupCombo
                    Left = 237
                    Top = 22
                    Width = 204
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição')
                    DataField = 'IDDEPENDENCIA'
                    DataSource = dsDet
                    LookupTable = qryDependencia
                    LookupField = 'IDDEPENDENCIA'
                    Options = [loTitles]
                    Style = csDropDownList
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                    OnChange = dblkpcmbTipoDependenciaChange
                  end
                  object dblkpcmbGrauInstr: TCMDBLookupCombo
                    Left = 6
                    Top = 54
                    Width = 204
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição')
                    DataField = 'IDGRINSTR'
                    DataSource = dsPF
                    LookupTable = qryGrau
                    LookupField = 'IDGRINSTR'
                    Options = [loTitles]
                    Style = csDropDownList
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                    OnExit = dblkpcmbGrauInstrExit
                  end
                  object cmbEstCiv: TwwDBLookupCombo
                    Left = 237
                    Top = 55
                    Width = 204
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
                    DataField = 'ESTCIVIL'
                    DataSource = dsPF
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
                object dbrdgrpSexo: TDBRadioGroup
                  Left = 456
                  Top = 239
                  Width = 207
                  Height = 78
                  Caption = ' Sexo '
                  DataField = 'SEXO'
                  DataSource = dsPF
                  Items.Strings = (
                    'Masculino'
                    'Feminino')
                  TabOrder = 10
                  TabStop = True
                  Values.Strings = (
                    'M'
                    'F')
                  OnChange = dbrdgrpSexoChange
                end
                object dbeEMail: TDBEdit
                  Left = 110
                  Top = 87
                  Width = 221
                  Height = 21
                  CharCase = ecLowerCase
                  DataField = 'EMAIL'
                  DataSource = dsPessoa
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 14
                  OnExit = dbeEMailExit
                end
                object dbeEmailParticular: TDBEdit
                  Left = 344
                  Top = 87
                  Width = 185
                  Height = 21
                  CharCase = ecLowerCase
                  DataField = 'EMAILFUNCEF'
                  DataSource = dsPF
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  OnExit = dbeEMailExit
                end
                object dbeNomeConjuge: TwwDBEdit
                  Left = 5
                  Top = 48
                  Width = 448
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NOMECONJUGE'
                  DataSource = dsPF
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object grpTelDepen: TGroupBox
                  Left = 712
                  Top = -2
                  Width = 251
                  Height = 158
                  Caption = 'Telefone'
                  TabOrder = 11
                  object Label66: TLabel
                    Left = 14
                    Top = 21
                    Width = 23
                    Height = 13
                    Caption = 'DDI'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label67: TLabel
                    Left = 66
                    Top = 21
                    Width = 28
                    Height = 13
                    Caption = 'DDD'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label68: TLabel
                    Left = 117
                    Top = 21
                    Width = 44
                    Height = 13
                    Caption = 'Número'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbedtDDIDepen: TDBEdit
                    Left = 14
                    Top = 37
                    Width = 40
                    Height = 21
                    DataField = 'DDI'
                    DataSource = dsPF
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object dbedtDDDDepen: TDBEdit
                    Left = 66
                    Top = 37
                    Width = 40
                    Height = 21
                    DataField = 'DDD'
                    DataSource = dsPF
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 3
                    ParentFont = False
                    TabOrder = 1
                    OnKeyPress = DBEDDDDKeyPress
                  end
                  object edtTelDepen: TwwDBEdit
                    Left = 117
                    Top = 37
                    Width = 121
                    Height = 21
                    DataField = 'NUMERO'
                    DataSource = dsPF
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 9
                    ParentFont = False
                    TabOrder = 2
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                    OnKeyPress = DBEDNUMEROKeyPress
                  end
                  object grbTipoTelDepen: TGroupBox
                    Left = 12
                    Top = 61
                    Width = 226
                    Height = 89
                    Caption = 'Tipo de Telefone'
                    TabOrder = 3
                    object chklstTipoTelDepen: TCheckListBox
                      Left = 8
                      Top = 18
                      Width = 215
                      Height = 69
                      BorderStyle = bsNone
                      Color = clBtnFace
                      Columns = 2
                      Ctl3D = False
                      ItemHeight = 22
                      Items.Strings = (
                        'Comercial'
                        'Particular'
                        'Fax'
                        'Celular'
                        'Recado')
                      ParentCtl3D = False
                      Style = lbOwnerDrawFixed
                      TabOrder = 0
                      OnClick = chklstTipoTelDepenClick
                    end
                  end
                end
                object grpBPlanPrev: TGroupBox
                  Left = 712
                  Top = 0
                  Width = 376
                  Height = 83
                  Caption = 'Plano Previdencíario'
                  TabOrder = 12
                  object lblDataCancelamentoREG: TLabel
                    Left = 8
                    Top = 38
                    Width = 112
                    Height = 13
                    Caption = 'Data Cancelamento'
                  end
                  object lblDataCancelamentoREB: TLabel
                    Left = 127
                    Top = 38
                    Width = 112
                    Height = 13
                    Caption = 'Data Cancelamento'
                  end
                  object lblDataCancelamentoNvPlan: TLabel
                    Left = 249
                    Top = 38
                    Width = 112
                    Height = 13
                    Caption = 'Data Cancelamento'
                  end
                  object DBCheckBox1: TDBCheckBox
                    Left = 39
                    Top = 88
                    Width = 146
                    Height = 17
                    Caption = 'Solicita Conta Salário'
                    TabOrder = 0
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                  end
                  object Chkregreplan: TCheckBox
                    Left = 8
                    Top = 18
                    Width = 113
                    Height = 17
                    Caption = 'REG/REPLAN'
                    TabOrder = 4
                    OnClick = ChkregreplanClick
                    OnMouseDown = ChkregreplanMouseDown
                  end
                  object Chkreb: TCheckBox
                    Left = 128
                    Top = 17
                    Width = 57
                    Height = 17
                    Caption = 'REB'
                    TabOrder = 5
                    OnClick = ChkrebClick
                    OnMouseDown = ChkrebMouseDown
                  end
                  object Chknovoplano: TCheckBox
                    Left = 250
                    Top = 18
                    Width = 113
                    Height = 17
                    Caption = 'NOVO PLANO'
                    TabOrder = 6
                    OnClick = ChknovoplanoClick
                    OnMouseDown = ChknovoplanoMouseDown
                  end
                  object DtCancReb: TCMDateTimePicker
                    Left = 127
                    Top = 52
                    Width = 113
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    Color = clScrollBar
                    ButtonStyle = cbsCustom
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
                    OnExit = dtCancREBExit
                  end
                  object dtCancRegReplan: TCMDateTimePicker
                    Left = 9
                    Top = 52
                    Width = 113
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    Color = clScrollBar
                    ButtonStyle = cbsCustom
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
                    TabOrder = 2
                    OnExit = dtCancRegReplanExit
                  end
                  object dtCancNovoPlano: TCMDateTimePicker
                    Left = 248
                    Top = 52
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    Color = clScrollBar
                    ButtonStyle = cbsCustom
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
                    TabOrder = 3
                    OnExit = dtCancNovoPlanoExit
                  end
                end
                object grpObsDepen: TGroupBox
                  Left = 712
                  Top = 83
                  Width = 421
                  Height = 109
                  Caption = 'Observações'
                  TabOrder = 13
                  object memObsDepen: TDBMemo
                    Left = 4
                    Top = 14
                    Width = 408
                    Height = 89
                    DataField = 'OBSERVACAO'
                    DataSource = dsDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnKeyPress = memObsDepenKeyPress
                  end
                end
              end
              object tbsDet02: TTabSheet
                Caption = 'Dados Pessoais'
                ImageIndex = 1
                object pnlPessFis: TPanel
                  Left = 0
                  Top = 0
                  Width = 1146
                  Height = 249
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object grpDependentes: TGroupBox
                    Left = 1
                    Top = 3
                    Width = 168
                    Height = 86
                    Caption = '  Nº Dependentes para  '
                    TabOrder = 0
                    object lblnDepIRRF: TLabel
                      Left = 4
                      Top = 42
                      Width = 30
                      Height = 13
                      Caption = 'IRRF'
                    end
                    object lblNDepSalFam: TLabel
                      Left = 58
                      Top = 42
                      Width = 50
                      Height = 13
                      Caption = 'Sal.Fam.'
                    end
                    object lblNTotalDep: TLabel
                      Left = 127
                      Top = 42
                      Width = 30
                      Height = 13
                      Caption = 'Total'
                    end
                    object dbseNumDepIRRF: TwwDBSpinEdit
                      Left = 4
                      Top = 56
                      Width = 38
                      Height = 21
                      Increment = 1
                      MaxValue = 100
                      DataField = 'NUMDEPIRRF'
                      DataSource = dsPF
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      UnboundDataType = wwDefault
                    end
                    object dbseNumDepSalF: TwwDBSpinEdit
                      Left = 58
                      Top = 56
                      Width = 52
                      Height = 21
                      Increment = 1
                      MaxValue = 100
                      DataField = 'NUMDEPSALF'
                      DataSource = dsPF
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      UnboundDataType = wwDefault
                    end
                    object dbseNumDepTot: TwwDBSpinEdit
                      Left = 127
                      Top = 56
                      Width = 34
                      Height = 21
                      Increment = 1
                      MaxValue = 100
                      DataField = 'NUMDEPTOT'
                      DataSource = dsPF
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      UnboundDataType = wwDefault
                    end
                    object rbNaoDepen: TRadioButton
                      Left = 78
                      Top = 21
                      Width = 53
                      Height = 17
                      Caption = 'Não'
                      TabOrder = 3
                    end
                    object rbSimDepen: TRadioButton
                      Left = 31
                      Top = 21
                      Width = 47
                      Height = 17
                      Caption = 'Sim'
                      TabOrder = 4
                    end
                  end
                  object grbNatural: TGroupBox
                    Left = 172
                    Top = 3
                    Width = 259
                    Height = 87
                    TabOrder = 1
                    object Label38: TLabel
                      Left = 6
                      Top = 8
                      Width = 73
                      Height = 13
                      Caption = 'Naturalidade'
                    end
                    object Label39: TLabel
                      Left = 86
                      Top = 8
                      Width = 82
                      Height = 13
                      Caption = 'Nacionalidade'
                    end
                    object Label41: TLabel
                      Left = 6
                      Top = 47
                      Width = 40
                      Height = 13
                      Caption = 'Cidade'
                    end
                    object dblkpcmbNaturalidade: TwwDBLookupCombo
                      Left = 6
                      Top = 21
                      Width = 74
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'CODESTADO'#9'3'#9'Sigla'#9'F')
                      DataField = 'idestado'
                      DataSource = dsPF
                      LookupTable = qryEstado
                      LookupField = 'IDESTADO'
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                    end
                    object dblkpcmbNacionalidade: TwwDBLookupCombo
                      Left = 86
                      Top = 21
                      Width = 167
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F')
                      DataField = 'IDPAIS'
                      DataSource = dsPF
                      LookupTable = qryPais
                      LookupField = 'IDPAIS'
                      ParentFont = False
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                      OnChange = dblkpcmbNacionalidadeChange
                      OnExit = dblkpcmbNacionalidadeExit
                    end
                    object dblkpcmbCidade: TwwDBLookupCombo
                      Left = 6
                      Top = 59
                      Width = 247
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'NOMECOMPLETO'#9'56'#9'Cidade (UF)'#9'F')
                      DataField = 'IDCIDADES'
                      DataSource = dsPF
                      LookupTable = qryCidade
                      LookupField = 'IDCIDADES'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                    end
                  end
                  object grpContaSalario: TGroupBox
                    Left = 435
                    Top = 3
                    Width = 443
                    Height = 45
                    TabOrder = 2
                    object lblDtSolicitacao: TLabel
                      Left = 225
                      Top = 11
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
                      Left = 16
                      Top = 16
                      Width = 147
                      Height = 17
                      Caption = 'Solicitar Conta Salário'
                      DataField = 'FLGSOLICITACONTASALARIO'
                      DataSource = dsPF
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
                      DataSource = dsPF
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
                    Left = 435
                    Top = 47
                    Width = 443
                    Height = 43
                    TabOrder = 3
                    object lbldtprocessada: TLabel
                      Left = 221
                      Top = 9
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
                      DataSource = dsPF
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
                      DataSource = dsPF
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
                  object dbrdgrpFlags: TGroupBox
                    Left = 1
                    Top = 89
                    Width = 192
                    Height = 125
                    TabOrder = 4
                    object dbchkbxDesignado: TDBCheckBox
                      Left = 3
                      Top = 6
                      Width = 180
                      Height = 17
                      Caption = 'Designado Para Resgate'
                      DataField = 'FLGDESIGNADO'
                      DataSource = dsDet
                      TabOrder = 0
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkbxFlgDepLegal: TDBCheckBox
                      Left = 3
                      Top = 60
                      Width = 180
                      Height = 17
                      Caption = 'Dependente Funcef'
                      DataField = 'FLGDEPLEGAL'
                      DataSource = dsDet
                      TabOrder = 1
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkbxFlgDepLegalClick
                    end
                    object dbchkbxFlgContaImpostoR: TDBCheckBox
                      Left = 3
                      Top = 42
                      Width = 180
                      Height = 17
                      Hint = 'Indica se o dependente conta para o cálculo do IR'
                      Caption = 'Imposto de Renda'
                      DataField = 'FLGCONTAIMPOSTOR'
                      DataSource = dsDet
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 3
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkbxContaSalarioF: TDBCheckBox
                      Left = 3
                      Top = 24
                      Width = 180
                      Height = 17
                      Hint = 'Indica se o dependente conta para o cálculo do Salário Família'
                      Caption = 'Salário Família'
                      DataField = 'FLGCONTASALARIOF'
                      DataSource = dsDet
                      TabOrder = 2
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkIsentoIR: TDBCheckBox
                      Left = 115
                      Top = 15
                      Width = 63
                      Height = 17
                      Hint = 'Indica se o dependente é isento de IR ou não'
                      Caption = 'Isento de Imposto de Renda'
                      DataField = 'FLGISENTOIRRF'
                      DataSource = dsDet
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 4
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      Visible = False
                    end
                    object DbCkElegivel: TDBCheckBox
                      Left = 251
                      Top = 89
                      Width = 137
                      Height = 17
                      Caption = 'Elegível a Benefício'
                      DataField = 'FLGELEGIVEL'
                      DataSource = dsDet
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 5
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      Visible = False
                    end
                    object DbChbIgnoraIR: TDBCheckBox
                      Left = 3
                      Top = 96
                      Width = 180
                      Height = 17
                      Caption = 'Ignora Imposto de Renda'
                      DataField = 'FLGIGNORAVALIR'
                      DataSource = dsDet
                      TabOrder = 6
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = DbChbIgnoraIRClick
                    end
                    object dbchkbxFlgPlanoSaude: TDBCheckBox
                      Left = 3
                      Top = 78
                      Width = 180
                      Height = 17
                      Caption = 'Plano de Saúde'
                      DataField = 'FLGPLANOSAUDE'
                      DataSource = dsDet
                      TabOrder = 7
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkbxFlgPlanoSaudeClick
                    end
                  end
                  object dbgrpDatas: TGroupBox
                    Left = 199
                    Top = 89
                    Width = 465
                    Height = 144
                    TabOrder = 5
                    object Label31: TLabel
                      Left = 5
                      Top = 18
                      Width = 82
                      Height = 13
                      Caption = 'Data Início IR'
                    end
                    object Label33: TLabel
                      Left = 5
                      Top = 66
                      Width = 68
                      Height = 13
                      Caption = 'Data Fim IR'
                    end
                    object Label34: TLabel
                      Left = 317
                      Top = 17
                      Width = 118
                      Height = 13
                      Caption = 'Data Inicio Invalidez'
                    end
                    object Label35: TLabel
                      Left = 317
                      Top = 67
                      Width = 106
                      Height = 13
                      Caption = 'Data Fim Invalidez'
                    end
                    object Label36: TLabel
                      Left = 161
                      Top = 17
                      Width = 128
                      Height = 13
                      Caption = 'Data Inicio Sal.Familia'
                    end
                    object Label37: TLabel
                      Left = 161
                      Top = 66
                      Width = 116
                      Height = 13
                      Caption = 'Data Fim Sal.Familia'
                    end
                    object dbdtInicioIR: TCMDateTimePicker
                      Left = 5
                      Top = 31
                      Width = 136
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'INICIOIMPOSTOR'
                      DataSource = dsDet
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
                    object dbdtFimIR: TCMDateTimePicker
                      Left = 5
                      Top = 80
                      Width = 136
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'FIMIMPOSTOR'
                      DataSource = dsDet
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
                      OnExit = dbdtFimIRExit
                    end
                    object dbdtInicioInvalidez: TCMDateTimePicker
                      Left = 317
                      Top = 31
                      Width = 136
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'INICIOINVALIDEZ'
                      DataSource = dsPF
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
                    object dbdtFimInvalidez: TCMDateTimePicker
                      Left = 317
                      Top = 80
                      Width = 136
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'FIMINVALIDEZ'
                      DataSource = dsPF
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
                      TabOrder = 5
                    end
                    object dbdtInicioSalFamilia: TCMDateTimePicker
                      Left = 161
                      Top = 31
                      Width = 136
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'INICIOSALARIOF'
                      DataSource = dsDet
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
                    object dbdtFimSalFamilia: TCMDateTimePicker
                      Left = 161
                      Top = 80
                      Width = 136
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'FIMSALARIOF'
                      DataSource = dsDet
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
                    object DbChbSomaIR: TDBCheckBox
                      Left = 8
                      Top = 119
                      Width = 313
                      Height = 17
                      Caption = 'Desconta IR sobre INSS e Suplementação juntos  '
                      DataField = 'FLGSOMAIRSUPINSS'
                      DataSource = dsPF
                      TabOrder = 6
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                  end
                end
                object pnlMolestiaIR: TPanel
                  Left = 0
                  Top = 249
                  Width = 1146
                  Height = 92
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object pnlOutrosItens: TPanel
                    Left = 1
                    Top = 4
                    Width = 199
                    Height = 88
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object wwDBCBIsentoIrrf: TwwDBComboBox
                      Left = 3
                      Top = 32
                      Width = 190
                      Height = 21
                      ShowButton = True
                      Style = csDropDown
                      MapList = True
                      AllowClearKey = False
                      DataField = 'TIPOISENCAOIRRF'
                      DataSource = dsPF
                      DropDownCount = 8
                      ItemHeight = 0
                      Items.Strings = (
                        'Espécie de Benefício 92'#9'0'
                        'Ação Judicial'#9'1'
                        'Moléstia Grave'#9'2')
                      Sorted = False
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      OnChange = wwDBCBIsentoIrrfChange
                    end
                    object BitBtnHistorico: TButton
                      Left = 4
                      Top = 53
                      Width = 188
                      Height = 26
                      Caption = 'Histórico de moléstia grave'
                      Enabled = False
                      TabOrder = 1
                      OnClick = BitBtnHistoricoClick
                    end
                  end
                  object dbrgrpIsentoIR: TDBRadioGroup
                    Left = 11
                    Top = 5
                    Width = 114
                    Height = 29
                    Caption = ' Isento de IR?'
                    Columns = 2
                    DataField = 'FLGISENTOIRRF'
                    DataSource = dsDet
                    Items.Strings = (
                      'Sim'
                      'Não')
                    TabOrder = 1
                    Values.Strings = (
                      '1'
                      '0')
                    OnClick = dbrgrpIsentoIRClick
                  end
                  object dbrgrpMolestiaGrave: TGroupBox
                    Left = 204
                    Top = -1
                    Width = 291
                    Height = 93
                    Caption = 'Moléstia Grave '
                    Enabled = False
                    TabOrder = 2
                    TabStop = True
                    object Label63: TLabel
                      Left = 13
                      Top = 17
                      Width = 34
                      Height = 13
                      Caption = 'Início'
                    end
                    object Label64: TLabel
                      Left = 141
                      Top = 17
                      Width = 46
                      Height = 13
                      Caption = 'Término'
                    end
                    object dbdtMolestiaGrave: TCMDateTimePicker
                      Left = 12
                      Top = 38
                      Width = 107
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      Color = cl3DLight
                      ButtonStyle = cbsCustom
                      DataField = 'DATAMOLESTIAGRAVE'
                      DataSource = dsPF
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
                    end
                    object CMDateTimePicker5: TCMDateTimePicker
                      Left = 141
                      Top = 38
                      Width = 107
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      Color = cl3DLight
                      ButtonStyle = cbsCustom
                      DataField = 'DATAFIMMOLESTIA'
                      DataSource = dsPF
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
              end
            end
          end
          object Panel6: TPanel
            Tag = 264
            Left = 0
            Top = 237
            Width = 1154
            Height = 207
            Align = alBottom
            Caption = 'Panel6'
            TabOrder = 2
            object btnSelecionaTodos: TSpeedButton
              Left = 32
              Top = 12
              Width = 31
              Height = 25
              Hint = 'Cadastrar todos os dependentes'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                66010000424D660100000000000076000000280000001F0000000F0000000100
                040000000000F0000000C40E0000C40E00001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888887777788
                8888888887777788888088877EEEEE778888888778FFFF778880887EE66666EE
                78888878FF88888F788087E6666666666088878F88888888878087E6FFFFFFF6
                608887F87777777887F07E666FFFFF66660878F88777778F88707E6666FFF666
                66087F88887778F888707E66666F666666087F8888878F8888707E66FFFFFFF6
                66087F887777777888707E666FFFFF6666087F888777778F8870876666FFF666
                60888788887778F887808766666F6666608887F888878F8887F0880666666666
                088888788888F88878F088800666660088888887788888778F80888880000088
                88888888F777778FF880}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnSelecionaTodosClick
            end
            object btnSelecionaAlguns: TSpeedButton
              Left = 72
              Top = 11
              Width = 31
              Height = 26
              Hint = 'Cadastrar os dependentes selecionados'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                D6050000424DD60500000000000036000000280000001F0000000F0000000100
                180000000000A0050000C40E0000C40E00000000000000000000C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0808080808080808080808080808080C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080
                8080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
                C0C0C0808080808080FFFF00FFFF00FFFF00FFFF00FFFF00808080808080C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080C0C0C0FFFFFFFF
                FFFFFFFFFFFFFFFF808080808080C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
                808080FFFF00FFFF00808000808000808000808000808000FFFF00FFFF008080
                80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0FFFFFFFFFFFFC0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C0000000C0C0C0808080
                FFFF008080008080008080008080008080008080008080008080008080008080
                00000000C0C0C0C0C0C0C0C0C0808080C0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0000000C0C0C0808080
                FFFF008080008080008080008080008080008080008080008080008080008080
                00000000C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFF000000808080FFFF00
                8080008080008080008080008080008080008080008080008080008080008080
                00808000000000C0C0C0808080C0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000000808080FFFF00
                808000808000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080008080
                00808000000000C0C0C0808080FFFFFFC0C0C0C0C0C080808080808080808080
                8080808080808080808080C0C0C0C0C0C0C0C0C0808080000000808080FFFF00
                808000808000808000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080008080008080
                00808000000000C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C080808080808080
                8080808080808080C0C0C0FFFFFFC0C0C0C0C0C0808080000000808080FFFF00
                808000808000808000808000FFFFFFFFFFFFFFFFFF8080008080008080008080
                00808000000000C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C080808080
                8080808080C0C0C0FFFFFFC0C0C0C0C0C0C0C0C0808080000000808080FFFF00
                808000808000808000808000808000FFFFFF8080008080008080008080008080
                00808000000000C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
                8080C0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0808080000000C0C0C0808080
                8080008080008080008080008080008080008080008080008080008080008080
                00000000C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0000000C0C0C0808080
                8080008080008080008080008080008080008080008080008080008080008080
                00000000C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFF000000C0C0C0C0C0C0
                0000008080008080008080008080008080008080008080008080008080000000
                00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0FFFFFF000000C0C0C0C0C0C0
                C0C0C0000000000000808000808000808000808000808000000000000000C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0808080808080C0C0C0FFFFFFC0C0C0000000C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0000000000000000000000000000000C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808080808080
                8080808080808080C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0000000}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnSelecionaAlgunsClick
            end
            object Label62: TLabel
              Left = 112
              Top = 16
              Width = 174
              Height = 13
              Caption = 'Dependentes não cadastrados'
            end
            object dbgrdDetnCadastrado: TwwDBGrid
              Left = 1
              Top = 49
              Width = 1152
              Height = 157
              ControlType.Strings = (
                'SELECIONADO;CheckBox;S;N'
                'ElegIvel;CheckBox;S;N'
                'BeneficiArio;CheckBox;S;N'
                'IDIR;CheckBox;S;N'
                'FLGCONTASALARIOF;CheckBox;S;N')
              Selected.Strings = (
                'SELECIONADO'#9'5'#9' '
                'SQDEP'#9'4'#9'Seq.'
                'NRMATREMP'#9'13'#9'Matrícula'
                'NODEP'#9'40'#9'Nome'
                'CDRELDEPND'#9'12'#9'Grau de ~Parentesco'
                'FLGISENTOIRRF'#9'11'#9'Isento~ de IR'
                'DTNASCDEP'#9'11'#9'Data de ~Nascimento'
                'TRGDTINCLUSAO'#9'11'#9'Cadastrado ~Em'
                'CANCELADO'#9'11'#9'Cancelado ~Em'
                'CDSEXO'#9'4'#9'Sexo'
                'ELEGIVEL'#9'10'#9'Elegível a~Benefício'
                'BENEFICIARIO'#9'11'#9'Beneficiário'
                'IDIR'#9'9'#9'Imposto ~de Renda'
                'DTINIRRF'#9'10'#9'Data Início ~     IRRF'
                'DTFIMIRRF'#9'10'#9'Data Fim ~   IRRF'
                'SALARIOFAM'#9'10'#9'Salário ~Família'
                'DINISALFAMÍLIA'#9'10'#9'Data Início~Salário Família'
                'DTFIMSAFAMÍLIA'#9'10'#9'Data Fim~Salário Família'
                'DESIGNADO'#9'10'#9'Designado ~Para Resgate'
                'DEPENDENTE'#9'12'#9'Dependente ~Funcef'
                'IDINVALIDEZ'#9'15'#9'Possui Moléstia ~Grave'
                'MOLESTIA'#9'18'#9'Moléstia ~Grave desde'
                'DTFIMMOLESTIA'#9'11'#9'Data Fim ~Moléstia Grave'
                'DTININVALIDEZ'#9'12'#9'Data Início~Invalidez'
                'DTFIMINVALIDEZ'#9'12'#9'Data Fim~Invalidez'
                'NOMEMÃE'#9'30'#9'Nome da Mãe'
                'NOMEPAI'#9'30'#9'Nome do Pai'
                'NUMDOCUMENTO'#9'18'#9'CPF'
                'SITUACAODEPEN'#9'50'#9'Situaçao ~Dependente'
                'DATAMORTE'#9'18'#9'Data do ~Falecimento'
                'DESCESTCIVIL'#9'20'#9'Estado ~Civil'
                'OPCAO1'#9'10'#9'Opção 1'
                'OPCAO2'#9'10'#9'Opção 2'
                'OPCAO3'#9'10'#9'Opção 3')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alBottom
              DataSource = dsDepeNaoCadastrado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnDblClick = dbgrdDetnCadastradoDblClick
              IndicatorColor = icBlack
            end
          end
        end
        object tbsDocumentos: TTabSheet
          Caption = 'Documentos'
          ImageIndex = 1
          object PnlDocumentos_Padrao: TPanel
            Left = 0
            Top = 27
            Width = 1154
            Height = 417
            Align = alClient
            TabOrder = 0
            object pnlItemsDoc: TPanel
              Left = 317
              Top = 1
              Width = 172
              Height = 415
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object pnlNomeDoc: TPanel
                Left = 0
                Top = 0
                Width = 172
                Height = 21
                Align = alTop
                TabOrder = 0
                object DBText1: TDBText
                  Left = 10
                  Top = 3
                  Width = 150
                  Height = 17
                  DataField = 'NOMEDOCUMENTO'
                  DataSource = dsDocumento
                end
              end
              object pnlOrgao: TPanel
                Left = 0
                Top = 95
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 1
                Visible = False
                object lblPdOrgao: TLabel
                  Left = 10
                  Top = 3
                  Width = 81
                  Height = 13
                  Caption = 'Orgão emissor'
                end
                object wwDBEdit1: TwwDBEdit
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'ORGAO'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlEmissao: TPanel
                Left = 0
                Top = 187
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 2
                Visible = False
                object lblPdEmiss: TLabel
                  Left = 10
                  Top = 3
                  Width = 96
                  Height = 13
                  Caption = 'Data da Emissão'
                end
                object CMDateTimePicker2: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAEMISSAO'
                  DataSource = dsDocumento
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
                  TabOrder = 0
                end
              end
              object pnlUF: TPanel
                Left = 0
                Top = 141
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 3
                Visible = False
                object lblPdUF: TLabel
                  Left = 10
                  Top = 3
                  Width = 130
                  Height = 13
                  Caption = 'Unidade da Federação'
                end
                object dbcmbEstadoDoc: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 49
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODESTADO'#9'4'#9'UF'
                    'NOMEESTADO'#9'15'#9'Estado'
                    'NOMEPAIS'#9'20'#9'Pais')
                  DataField = 'IDESTADO'
                  DataSource = dsDocumento
                  LookupTable = qryEstado
                  LookupField = 'IDESTADO'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbEstadoDocChange
                end
              end
              object pnlNumDoc: TPanel
                Left = 0
                Top = 21
                Width = 172
                Height = 28
                Align = alTop
                TabOrder = 4
                object edDocNumDocumento: TwwDBEdit
                  Left = 10
                  Top = 3
                  Width = 148
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NUMDOCUMENTO'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnEnter = edDocNumDocumentoEnter
                  OnExit = edDocNumDocumentoExit
                end
              end
              object PnlValidade: TPanel
                Left = 0
                Top = 233
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 5
                Visible = False
                object LblDtValidade: TLabel
                  Left = 10
                  Top = 3
                  Width = 99
                  Height = 13
                  Caption = 'Data de Validade'
                end
                object CMDateTimePicker1: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAVALIDADE'
                  DataSource = dsDocumento
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
                  TabOrder = 0
                end
              end
              object pnlDataHabilitacao: TPanel
                Left = 0
                Top = 325
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 6
                Visible = False
                object Label10: TLabel
                  Left = 10
                  Top = 3
                  Width = 160
                  Height = 13
                  Caption = 'Data da primeiro habilitação'
                end
                object cbxDataHabilitacao: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTPRIMEIRACNH'
                  DataSource = dsDocumento
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
                  TabOrder = 0
                end
              end
              object pnlCategoria: TPanel
                Left = 0
                Top = 279
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 7
                Visible = False
                object Label65: TLabel
                  Left = 10
                  Top = 3
                  Width = 55
                  Height = 13
                  Caption = 'Categoria'
                end
                object edtCategoria: TwwDBEdit
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CATEGCNH'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlTipoDocumento: TPanel
                Left = 0
                Top = 49
                Width = 172
                Height = 46
                Align = alTop
                Caption = 'pnlTipoDocumento'
                TabOrder = 8
                Visible = False
                object LbTpDocumento: TLabel
                  Left = 10
                  Top = 3
                  Width = 94
                  Height = 13
                  Caption = 'Tipo Documento'
                end
                object dbcmbTipoDocumento: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'10'#9'Tipo'
                    'MASCARA'#9'10'#9'Mascara')
                  DataField = 'IDTIPODOCPESSOAXMASC'
                  DataSource = dsDocumento
                  LookupTable = qryTipoDocumento
                  LookupField = 'IDTIPODOCPESSOAXMASC'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbTipoDocumentoChange
                end
              end
              object pnlPais: TPanel
                Left = 0
                Top = 371
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 9
                Visible = False
                object Label91: TLabel
                  Left = 10
                  Top = 3
                  Width = 27
                  Height = 13
                  Caption = 'País'
                end
                object dbcmdPais: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 151
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEPAIS'#9'20'#9'Pais')
                  DataField = 'IDPAIS'
                  DataSource = dsDocumento
                  LookupTable = qryPais
                  LookupField = 'IDPAIS'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbEstadoDocChange
                end
              end
            end
            object pnlFoto: TPanel
              Left = 489
              Top = 1
              Width = 664
              Height = 415
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              Visible = False
              object Bevel1: TBevel
                Left = 0
                Top = 0
                Width = 2
                Height = 382
                Align = alLeft
                Shape = bsRightLine
              end
              object PnlAssociaFoto_Padrao: TPanel
                Left = 0
                Top = 382
                Width = 664
                Height = 33
                Align = alBottom
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Ctl3D = True
                ParentCtl3D = False
                TabOrder = 0
                object btnAssociarimgPessoa: TButton
                  Left = 28
                  Top = 3
                  Width = 143
                  Height = 26
                  Caption = 'Associar &foto'
                  TabOrder = 0
                  OnClick = btnAssociarimgPessoaClick
                end
              end
              object SbImagePessoa_Padrao: TScrollBox
                Left = 2
                Top = 0
                Width = 662
                Height = 382
                Align = alClient
                BorderStyle = bsNone
                TabOrder = 1
                object imgPessoa: TDBImage
                  Left = -8
                  Top = 8
                  Width = 197
                  Height = 185
                  BorderStyle = bsNone
                  Center = False
                  DataField = 'IMAGEM'
                  DataSource = dsImagem
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  Visible = False
                end
              end
            end
            object lstDocumentos: TListView
              Left = 1
              Top = 1
              Width = 316
              Height = 415
              Align = alLeft
              Columns = <
                item
                  Caption = 'Documento'
                  Width = 170
                end
                item
                  Caption = 'Número'
                  Width = 140
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              RowSelect = True
              ParentFont = False
              SortType = stText
              TabOrder = 2
              ViewStyle = vsReport
              OnChange = lstDocumentosChange
              OnDblClick = lstDocumentosDblClick
              OnExit = lstDocumentosExit
            end
          end
          object Dock975: TDock97
            Left = 0
            Top = 0
            Width = 1154
            Height = 27
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar972: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object EdDependenteDocumento: TEdit
                Left = 0
                Top = 0
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
                TabOrder = 0
              end
            end
          end
        end
        object tbsEndereco: TTabSheet
          Caption = 'Endereços'
          object dbgrdEndPess: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'NOME'#9'40'#9'Local'#9'F'
              'LOGRADOURO'#9'60'#9'Logradouro'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'20'#9'Complemento'
              'BAIRRO'#9'20'#9'Bairro'
              'CEP'#9'8'#9'Cep')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEndPess
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
          object pnlControlesEndPess: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblNumero: TLabel
              Left = 420
              Top = 47
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCEP: TLabel
              Left = 420
              Top = 97
              Width = 37
              Height = 13
              Caption = 'C.E.P.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPais: TLabel
              Left = 421
              Top = 152
              Width = 25
              Height = 13
              Caption = 'Pais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblEstado: TLabel
              Left = 241
              Top = 152
              Width = 40
              Height = 13
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblBairro: TLabel
              Left = 240
              Top = 97
              Width = 34
              Height = 13
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCidade: TLabel
              Left = 15
              Top = 152
              Width = 40
              Height = 13
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblComplemento: TLabel
              Left = 15
              Top = 97
              Width = 76
              Height = 13
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblLogradouro: TLabel
              Left = 14
              Top = 47
              Width = 65
              Height = 13
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdLocal: TLabel
              Left = 14
              Top = 6
              Width = 32
              Height = 13
              Caption = 'Local'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object GroupBox1: TGroupBox
              Left = 506
              Top = 51
              Width = 129
              Height = 135
              Caption = 'Tipo'
              TabOrder = 9
              object chkbxComercial: TCheckBox
                Left = 8
                Top = 16
                Width = 97
                Height = 17
                Caption = 'Comercial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object chkbxEntrega: TCheckBox
                Left = 8
                Top = 64
                Width = 97
                Height = 17
                Caption = 'Entrega'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object chkbxCobranca: TCheckBox
                Left = 8
                Top = 88
                Width = 97
                Height = 17
                Caption = 'Cobrança'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object chkbxCorrespondencia: TCheckBox
                Left = 8
                Top = 112
                Width = 105
                Height = 17
                Caption = 'Correspondência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object chkbxResidencial: TCheckBox
                Left = 8
                Top = 40
                Width = 97
                Height = 17
                Caption = 'Residencial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object dbeNumero: TDBEdit
              Left = 420
              Top = 61
              Width = 70
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMERO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object cmbCidade: TCMDBLookupCombo
              Left = 15
              Top = 165
              Width = 211
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMECIDADE'#9'56'#9'Cidade'#9'F'
                'CODESTADO'#9'10'#9'UF'#9'F')
              DataField = 'IDCIDADES'
              DataSource = dsEndPess
              LookupTable = qryCidade
              LookupField = 'IDCIDADES'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = cmbCidadeCloseUp
            end
            object dbeLogradouro: TDBEdit
              Left = 14
              Top = 61
              Width = 387
              Height = 21
              CharCase = ecUpperCase
              DataField = 'LOGRADOURO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbeComplemento: TDBEdit
              Left = 15
              Top = 114
              Width = 211
              Height = 21
              CharCase = ecUpperCase
              DataField = 'COMPLEMENTO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbeBairro: TDBEdit
              Left = 239
              Top = 114
              Width = 162
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbeCEP: TDBEdit
              Left = 420
              Top = 114
              Width = 70
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CEP'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object dbeEstado: TDBEdit
              Left = 239
              Top = 165
              Width = 162
              Height = 21
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'NOMEESTADO'
              DataSource = dsCidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbePais: TDBEdit
              Left = 421
              Top = 165
              Width = 69
              Height = 21
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'NOMEPAIS'
              DataSource = dsCidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dbedNomeEndereco: TDBEdit
              Left = 14
              Top = 19
              Width = 386
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object btnBuscarEndereco: TButton
              Left = 14
              Top = 208
              Width = 145
              Height = 25
              Caption = 'Buscar endereço'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
              OnClick = btnBuscarEnderecoClick
            end
          end
        end
        object tbsTelefone: TTabSheet
          Caption = 'Telefones'
          ImageIndex = 7
          object dbgTelefone: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'NUMERO'#9'10'#9'NUMERO'
              'DDD'#9'5'#9'DDD'
              'DDI'#9'4'#9'DDI'
              'TComercial'#9'3'#9'Com'
              'TParticular'#9'3'#9'Part'
              'TFax'#9'3'#9'Fax'
              'TCelular'#9'3'#9'Cel'
              'TRecado'#9'3'#9'Rec')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsTelefone
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
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
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblDDI: TLabel
              Left = 25
              Top = 8
              Width = 23
              Height = 13
              Caption = 'DDI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDDD: TLabel
              Left = 77
              Top = 8
              Width = 28
              Height = 13
              Caption = 'DDD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNumTelefone: TLabel
              Left = 128
              Top = 8
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object GroupBox7: TGroupBox
              Left = 264
              Top = 9
              Width = 425
              Height = 328
              Caption = 'Contatos'
              TabOrder = 4
              object Panel4: TPanel
                Left = 1
                Top = 45
                Width = 423
                Height = 282
                TabOrder = 2
                object Label53: TLabel
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
                object Label54: TLabel
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
                object Label55: TLabel
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
                object Label56: TLabel
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
                object Label57: TLabel
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
                object Label58: TLabel
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
                object DBEdit7: TDBEdit
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
                object CMDateTimePicker3: TCMDateTimePicker
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
                object DBMemo2: TDBMemo
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
                end
                object BitBtn1: TBitBtn
                  Left = 80
                  Top = 224
                  Width = 78
                  Height = 33
                  Caption = '&Ok'
                  Default = True
                  ModalResult = 1
                  TabOrder = 6
                  OnClick = BitBtn1Click
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
                object BitBtn2: TBitBtn
                  Left = 166
                  Top = 224
                  Width = 81
                  Height = 33
                  Cancel = True
                  Caption = '&Cancelar'
                  ModalResult = 2
                  TabOrder = 7
                  OnClick = BitBtn2Click
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
                object BitBtn3: TBitBtn
                  Left = 254
                  Top = 224
                  Width = 81
                  Height = 33
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 8
                  OnClick = BitBtn3Click
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
              object dbgTelefoneRamal: TwwDBGrid
                Left = 5
                Top = 48
                Width = 414
                Height = 115
                Selected.Strings = (
                  'NOME'#9'20'#9'Nome'#9'F'
                  'CARGO'#9'10'#9'Cargo'#9'F'
                  'SETOR'#9'10'#9'Setor'#9'F'
                  'EMAIL'#9'40'#9'Email'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = dsRamal
                Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                UseTFields = False
                IndicatorColor = icBlack
              end
              object dblcContato: TCMDBLookupCombo
                Left = 75
                Top = 81
                Width = 121
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Nome'
                  'CARGO'#9'10'#9'Cargo')
                DataField = 'NOME'
                DataSource = dsRamal
                LookupTable = qryContato
                LookupField = 'NOME'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                ShowMatchText = True
              end
              object Dock976: TDock97
                Left = 2
                Top = 15
                Width = 421
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
            object DBEDDDI: TDBEdit
              Left = 25
              Top = 24
              Width = 40
              Height = 21
              DataField = 'DDI'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDDDD: TDBEdit
              Left = 77
              Top = 24
              Width = 40
              Height = 21
              DataField = 'DDD'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 1
              OnKeyPress = DBEDDDDKeyPress
            end
            object DBEDNUMERO: TwwDBEdit
              Left = 128
              Top = 24
              Width = 121
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 9
              ParentFont = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnKeyPress = DBEDNUMEROKeyPress
            end
            object GroupBox8: TGroupBox
              Left = 23
              Top = 60
              Width = 226
              Height = 112
              Caption = 'Tipo de Telefone'
              TabOrder = 3
              object chkTipoTelefone: TCheckListBox
                Left = 8
                Top = 18
                Width = 215
                Height = 71
                BorderStyle = bsNone
                Color = clBtnFace
                Columns = 2
                Ctl3D = False
                ItemHeight = 22
                Items.Strings = (
                  'Comercial'
                  'Particular'
                  'Fax'
                  'Celular'
                  'Recado')
                ParentCtl3D = False
                Style = lbOwnerDrawFixed
                TabOrder = 0
                OnClick = chkTipoTelefoneClick
              end
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
        object tbsContato: TTabSheet
          Caption = 'Contatos'
          ImageIndex = 9
          object dbgContato: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'CARGO'#9'10'#9'Cargo'#9'No'
              'SETOR'#9'10'#9'Setor'#9'No'
              'Telefone'#9'20'#9'Telefone'
              'EMAIL'#9'40'#9'E-mail'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContato
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object mnbm: TLabel
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
            object lblPdeMail: TLabel
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
            object lblPdNome: TLabel
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
            object lblPdSetor: TLabel
              Left = 207
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
            object lblNasc: TLabel
              Left = 207
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
            object lblObs: TLabel
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
            object dbedcontatoemail: TDBEdit
              Left = 14
              Top = 65
              Width = 173
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
              TabOrder = 1
              OnExit = dbeEMailExit
            end
            object DBEdit5: TDBEdit
              Left = 14
              Top = 112
              Width = 173
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CARGO'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 207
              Top = 112
              Width = 121
              Height = 21
              CharCase = ecUpperCase
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
            object GroupBox6: TGroupBox
              Left = 348
              Top = 9
              Width = 190
              Height = 163
              Caption = 'Telefones'
              TabOrder = 6
              object dbgContatoRamal: TwwDBGrid
                Left = 2
                Top = 46
                Width = 186
                Height = 115
                Selected.Strings = (
                  'NUMERO'#9'10'#9'Telefone'
                  'RAMAL'#9'5'#9'Ramal')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alBottom
                DataSource = dsRamal
                Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                UseTFields = False
                IndicatorColor = icBlack
              end
              object dbngContatoxTel: TDBNavigator
                Left = 9
                Top = 15
                Width = 120
                Height = 20
                DataSource = dsRamal
                VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit]
                Ctl3D = True
                Hints.Strings = (
                  ' '
                  'Anterior'
                  'Próximo'
                  ' '
                  'Vincular'
                  'Desvincular'
                  'Editar')
                ParentCtl3D = False
                ParentShowHint = False
                ConfirmDelete = False
                ShowHint = True
                TabOrder = 1
                BeforeAction = dbngContatoxTelBeforeAction
              end
            end
            object dblcTelefone: TCMDBLookupCombo
              Left = 363
              Top = 73
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NUMERO'#9'10'#9'Número'#9'No')
              DataField = 'NUMERO'
              DataSource = dsRamal
              LookupTable = qryTelefone
              LookupField = 'NUMERO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblcTelefoneCloseUp
            end
            object DBMemo1: TDBMemo
              Left = 14
              Top = 156
              Width = 314
              Height = 54
              DataField = 'OBS'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnKeyPress = memObsDepenKeyPress
            end
            object dbedContatoNome: TDBEdit
              Left = 14
              Top = 20
              Width = 314
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyPress = dbeNomeKeyPress
            end
            object DBDateEdit2: TCMDateTimePicker
              Left = 208
              Top = 66
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
              TabOrder = 7
            end
            object dbgContatoRamal1: TDBGrid
              Left = 544
              Top = 48
              Width = 193
              Height = 120
              DataSource = dsRamal
              TabOrder = 8
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Visible = False
              OnCellClick = dbgContatoRamal1CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NUMERO'
                  Title.Caption = 'Telefone'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAMAL'
                  Title.Caption = 'Ramal'
                  Width = 58
                  Visible = True
                end>
            end
          end
        end
        object tbsContaBanco: TTabSheet
          Caption = 'Conta Bancária'
          object dbgrdContaBanco: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'BANCO'#9'30'#9'Banco'
              'NUMAGENCIA'#9'15'#9'Nº Agência'#9'F'
              'AGENCIA'#9'30'#9'Agência'
              'CONTACORRENTE'#9'15'#9'Conta Corrente'
              'NOMETIPOCONTA'#9'14'#9'Tipo de ~Conta'#9'F'
              'FLGCONTAPREF'#9'10'#9'Conta ~Preferencial'
              'FLGCONTACONJUNTA'#9'1'#9'Conta ~Conjunta'#9'F'
              'FLGCONTARESGATE'#9'10'#9'Conta ~Resgate')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCBanco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlControlesContaBanco: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object GroupBox3: TGroupBox
              Left = 1
              Top = 7
              Width = 496
              Height = 173
              TabOrder = 0
              object Label6: TLabel
                Left = 93
                Top = 18
                Width = 37
                Height = 13
                Caption = 'Banco'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 93
                Top = 69
                Width = 47
                Height = 13
                Caption = 'Agência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 93
                Top = 116
                Width = 88
                Height = 13
                Caption = 'Conta Bancária'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 10
                Top = 18
                Width = 55
                Height = 13
                Caption = 'Banco Nº'
              end
              object Label5: TLabel
                Left = 10
                Top = 69
                Width = 65
                Height = 13
                Caption = 'Agência Nº'
              end
              object dbeContaCorrente: TDBEdit
                Left = 93
                Top = 130
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CONTACORRENTE'
                DataSource = dsCBanco
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnExit = dbeContaCorrenteExit
              end
              object lkpcmbbxBanco: TwwDBLookupCombo
                Left = 93
                Top = 32
                Width = 394
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'60'#9'Banco'
                  'NUMBANCO'#9'10'#9'Nº')
                DataField = 'IDBANCO'
                DataSource = dsCBanco
                LookupTable = qryBanco
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = lkpcmbbxBancoCloseUp
              end
              object lkpcmbbxAgencia: TwwDBLookupCombo
                Left = 93
                Top = 84
                Width = 394
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'60'#9'AGENCIA'
                  'NUMAGENCIA'#9'15'#9'NUMAGENCIA')
                DataField = 'IDAGENCIA'
                DataSource = dsCBanco
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = lkpcmbbxAgenciaCloseUp
              end
              object edDigBanco: TEditNum
                Left = 10
                Top = 32
                Width = 74
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
                Left = 10
                Top = 84
                Width = 74
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
              Left = 504
              Top = 7
              Width = 142
              Height = 77
              Caption = 'Tipo'
              DataField = 'TIPOCONTA'
              DataSource = dsCBanco
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
              Left = 504
              Top = 87
              Width = 142
              Height = 44
              Caption = 'Conta Preferencial'
              Columns = 2
              DataField = 'FLGCONTAPREF'
              DataSource = dsCBanco
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
              Left = 504
              Top = 136
              Width = 142
              Height = 44
              Caption = 'Conta Conjunta'
              Columns = 2
              DataField = 'FLGCONTACONJUNTA'
              DataSource = dsCBanco
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
            object dbgrpContaResg: TDBRadioGroup
              Left = 504
              Top = 187
              Width = 142
              Height = 44
              Caption = 'Conta Resgate'
              Columns = 2
              DataField = 'FLGCONTARESGATE'
              DataSource = dsCBanco
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
        object tbsBeneficiario: TTabSheet
          Caption = 'Benefícios'
          object dbgrdBeneficiario: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'PLANO'#9'25'#9'Plano'#9'F'
              'BENEFICIO'#9'40'#9'Benefício'
              'SITBENEFICIO'#9'20'#9'Situação ~do Benefício'
              'VALORATUAL'#9'10'#9'Valor ~Atual'
              'DATAINICIO'#9'18'#9'Data de Início'
              'RECEBEDOR'#9'40'#9'Recebedor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsBenef
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            OnColEnter = dbgrdBeneficiarioColEnter
            IndicatorColor = icBlack
          end
          object pnlBeneficiario: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object grpbxBeneficio: TGroupBox
              Left = 7
              Top = 86
              Width = 366
              Height = 50
              Caption = ' Benefício '
              TabOrder = 0
              object lkpcmbBeneficio: TCMDBLookupCombo
                Left = 10
                Top = 18
                Width = 348
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BENEFICIO'#9'60'#9'Beneficio'#9'F'
                  'PLANO'#9'30'#9'Plano'#9'F')
                DataField = 'IDBENEFICIO'
                DataSource = dsBenef
                LookupTable = qryBeneficio
                LookupField = 'IDBENEFICIO'
                Options = [loColLines, loRowLines, loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object grpbxPrioridade: TGroupBox
              Left = 378
              Top = 86
              Width = 82
              Height = 50
              Caption = ' Prioridade '
              TabOrder = 1
              object dbePrioridade: TDBEdit
                Left = 8
                Top = 20
                Width = 66
                Height = 21
                DataField = 'PRIORIDADE'
                DataSource = dsBenef
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
            object grpbxPercentual: TGroupBox
              Left = 466
              Top = 86
              Width = 84
              Height = 50
              Caption = ' Percentual '
              TabOrder = 2
              object dbePercentual: TDBEdit
                Left = 8
                Top = 20
                Width = 67
                Height = 21
                DataField = 'PERCENTUAL'
                DataSource = dsBenef
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
            object GroupBox2: TGroupBox
              Left = 10
              Top = 143
              Width = 738
              Height = 50
              Caption = ' Núcleo Familiar '
              TabOrder = 4
              Visible = False
              object DbLkcBuscaNucleo: TCMDBLookupCombo
                Left = 10
                Top = 20
                Width = 343
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Núcleo Familiar')
                DataField = 'IDNUCLEOFAMILIAR'
                DataSource = dsBenef
                LookupTable = QryBuscaNucleo
                LookupField = 'IDNUCLEOFAMILIAR'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object grpbxResp: TGroupBox
              Left = 7
              Top = 7
              Width = 740
              Height = 76
              Caption = ' Recebedor '
              TabOrder = 5
              object Label9: TLabel
                Left = 12
                Top = 35
                Width = 117
                Height = 13
                Caption = 'Nome do Recebedor'
              end
              object dbeRecebedor: TDBEdit
                Left = 12
                Top = 49
                Width = 377
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'RECEBEDOR'
                DataSource = dsBenef
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object rdbProprio: TRadioButton
                Left = 12
                Top = 15
                Width = 102
                Height = 17
                Caption = 'É o próprio'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = rdbProprioClick
              end
              object rdbOutro: TRadioButton
                Left = 166
                Top = 12
                Width = 153
                Height = 17
                Caption = 'É o Responsável'
                TabOrder = 1
                TabStop = True
                OnClick = rdbProprioClick
              end
            end
            object grpObserv: TGroupBox
              Left = 7
              Top = 197
              Width = 740
              Height = 104
              Caption = 'Observação'
              TabOrder = 6
              object dbmmoOBS: TDBMemo
                Left = 5
                Top = 15
                Width = 724
                Height = 82
                DataField = 'OBSERVACAO'
                DataSource = dsBenef
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnKeyPress = memObsDepenKeyPress
              end
            end
            object grpTipoOpIR: TGroupBox
              Left = 553
              Top = 86
              Width = 195
              Height = 49
              Caption = 'Tributação de IR'
              TabOrder = 3
              object Label75: TLabel
                Left = 6
                Top = 23
                Width = 40
                Height = 13
                Caption = 'Tabela'
              end
              object cmbTipoOpIR: TwwDBComboBox
                Left = 49
                Top = 19
                Width = 136
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = True
                AllowClearKey = False
                CharCase = ecUpperCase
                DataField = 'TIPOOPCAOIR'
                DataSource = dsBenef
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Tabela Progressiva'#9'1'
                  'Tabela Regressiva'#9'2')
                Sorted = False
                TabOrder = 0
                UnboundDataType = wwDefault
                OnCloseUp = cmbTipoOpIRCloseUp
              end
            end
          end
        end
        object tbsDepBen: TTabSheet
          Caption = 'Dependentes do Beneficiário'
          ImageIndex = 6
          object dbgrdDepBen: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'NUMSEQUENCIA'#9'7'#9'Nº Seq.'#9'F'
              'NOME'#9'60'#9'Nome do Dependente'#9'F'
              'DATANASC'#9'18'#9'Nascimento'#9'F'
              'PARENTESCO'#9'11'#9'Grau de ~Parentesco'#9'F'
              'SEXO'#9'5'#9'Sexo'#9'F'
              'NUMDEPIRRF'#9'8'#9'Nº Dep.~I.R.'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDepBen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
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
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label11: TLabel
              Left = 2
              Top = -2
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object Label12: TLabel
              Left = 532
              Top = -2
              Width = 79
              Height = 13
              Caption = 'Nº Sequência'
            end
            object dbeNomeDepBen: TDBEdit
              Left = 1
              Top = 11
              Width = 525
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = dsDepBenPessoa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyPress = dbeNomeKeyPress
            end
            object dbeNumSeqDepBen: TDBEdit
              Left = 532
              Top = 11
              Width = 76
              Height = 21
              TabStop = False
              Color = clScrollBar
              DataField = 'NUMSEQUENCIA'
              DataSource = dsDepBen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
            object GroupBox9: TGroupBox
              Left = 0
              Top = 32
              Width = 349
              Height = 45
              TabOrder = 1
              object Label13: TLabel
                Left = 7
                Top = 7
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object Label14: TLabel
                Left = 247
                Top = 7
                Width = 92
                Height = 13
                Caption = 'Tipo Sanguíneo'
              end
              object Label15: TLabel
                Left = 125
                Top = 7
                Width = 118
                Height = 13
                Caption = 'Data de Falecimento'
              end
              object dtpNascDepBen: TCMDateTimePicker
                Left = 7
                Top = 20
                Width = 114
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATANASC'
                DataSource = dsDepBenPF
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
              object CMDateTimePicker6: TCMDateTimePicker
                Left = 125
                Top = 20
                Width = 116
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAMORTE'
                DataSource = dsDepBenPF
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
              end
              object DBEdit1: TDBEdit
                Left = 248
                Top = 20
                Width = 93
                Height = 21
                CharCase = ecUpperCase
                DataField = 'TIPOSANG'
                DataSource = dsDepBenPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnKeyPress = dbeNomeKeyPress
              end
            end
            object GroupBox10: TGroupBox
              Left = 353
              Top = 32
              Width = 173
              Height = 45
              Caption = 'CPF'
              TabOrder = 9
              object DBEdit2: TDBEdit
                Left = 9
                Top = 14
                Width = 154
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NUMDOCUMENTO'
                DataSource = dsDepBenPessoa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnExit = DBEdit2Exit
              end
            end
            object dbrgrpMolGraveDepen: TDBRadioGroup
              Left = 531
              Top = 32
              Width = 150
              Height = 45
              Caption = 'Possui Moléstia Grave ?'
              Columns = 2
              DataField = 'FLGMOLESTIAGRAVE'
              DataSource = dsDepBenPF
              Items.Strings = (
                'Sim'
                'Nâo')
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '1'
                '0')
              OnClick = dbrgrpMolGraveDepenClick
            end
            object dbcSexoDepBen: TDBRadioGroup
              Left = 353
              Top = 120
              Width = 173
              Height = 34
              Caption = 'Sexo'
              Columns = 2
              DataField = 'SEXO'
              DataSource = dsDepBenPF
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 11
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object rgrpDtMolGraveDepen: TGroupBox
              Left = 533
              Top = 77
              Width = 150
              Height = 39
              Caption = 'Moléstia Grave desde '
              TabOrder = 5
              TabStop = True
              object dtMolGraveDepen: TCMDateTimePicker
                Left = 8
                Top = 14
                Width = 136
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAMOLESTIAGRAVE'
                DataSource = dsDepBenPF
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
            object GroupBox13: TGroupBox
              Left = 0
              Top = 77
              Width = 312
              Height = 77
              TabOrder = 3
              object Label23: TLabel
                Left = 6
                Top = 7
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object Label24: TLabel
                Left = 6
                Top = 40
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object DBEdit3: TDBEdit
                Left = 6
                Top = 20
                Width = 290
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NOMEPAI'
                DataSource = dsDepBenPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnKeyPress = dbeNomeKeyPress
              end
              object DBEdit4: TDBEdit
                Left = 6
                Top = 53
                Width = 290
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NOMEMAE'
                DataSource = dsDepBenPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnKeyPress = dbeNomeKeyPress
              end
            end
            object GroupBox15: TGroupBox
              Left = 533
              Top = 155
              Width = 150
              Height = 110
              ParentShowHint = False
              ShowHint = False
              TabOrder = 8
              object Label18: TLabel
                Left = 9
                Top = 8
                Width = 82
                Height = 13
                Caption = 'Data Início IR'
              end
              object Label19: TLabel
                Left = 9
                Top = 43
                Width = 68
                Height = 13
                Caption = 'Data Fim IR'
              end
              object dtInicioIRDepBen: TCMDateTimePicker
                Left = 9
                Top = 21
                Width = 136
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'INICIOIMPOSTOR'
                DataSource = dsDepBen
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
              object dtFimIRDepBen: TCMDateTimePicker
                Left = 9
                Top = 56
                Width = 136
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'FIMIMPOSTOR'
                DataSource = dsDepBen
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
              end
            end
            object GroupBox16: TGroupBox
              Left = 0
              Top = 155
              Width = 312
              Height = 110
              TabOrder = 6
              object Label25: TLabel
                Left = 6
                Top = 7
                Width = 124
                Height = 13
                Caption = 'Situação Dependente'
              end
              object Label26: TLabel
                Left = -42
                Top = -10
                Width = 5
                Height = 13
              end
              object Label27: TLabel
                Left = 141
                Top = 7
                Width = 114
                Height = 13
                Caption = 'Grau de Parentesco'
              end
              object Label30: TLabel
                Left = 6
                Top = 39
                Width = 103
                Height = 13
                Caption = 'Grau de Instrução'
              end
              object Label16: TLabel
                Left = 5
                Top = 72
                Width = 68
                Height = 13
                Caption = 'Estado Civil'
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 6
                Top = 20
                Width = 130
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'dESCRIÇÃO')
                DataField = 'IDSITDEPENDENTE'
                DataSource = dsDepBenDepen
                LookupTable = qrySitDependente
                LookupField = 'IDSITDEPENDENTE'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
              end
              object dblcParentDepBen: TCMDBLookupCombo
                Left = 141
                Top = 20
                Width = 154
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'15'#9'Descrição')
                DataField = 'IDDEPENDENCIA'
                DataSource = dsDepBen
                LookupTable = qryDependencia2
                LookupField = 'IDDEPENDENCIA'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object CMDBLookupCombo1: TCMDBLookupCombo
                Left = 6
                Top = 52
                Width = 199
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'15'#9'Descrição')
                DataField = 'IDGRINSTR'
                DataSource = dsDepBenPF
                LookupTable = qryGrau
                LookupField = 'IDGRINSTR'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnExit = dblkpcmbGrauInstrExit
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 209
                Top = 52
                Width = 97
                Height = 53
                Caption = ' Sexo '
                DataField = 'SEXO'
                DataSource = dsDepBenPF
                Items.Strings = (
                  'Masculino'
                  'Feminino')
                TabOrder = 3
                TabStop = True
                Values.Strings = (
                  'M'
                  'F')
              end
              object cmbEstCivDepBen: TwwDBLookupCombo
                Left = 5
                Top = 84
                Width = 199
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
                DataField = 'ESTCIVIL'
                DataSource = dsDepBenPF
                LookupTable = qryEstCivil
                LookupField = 'ESTCIVIL'
                ParentFont = False
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
            end
            object GroupBox17: TGroupBox
              Left = 316
              Top = 155
              Width = 210
              Height = 110
              TabOrder = 7
              object dbchkDepBenDepLegal: TDBCheckBox
                Left = 7
                Top = 25
                Width = 125
                Height = 13
                Caption = 'Dependente Legal'
                DataField = 'FLGDEPLEGAL'
                DataSource = dsDepBen
                Enabled = False
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
              object dbchkDepBenContaIR: TDBCheckBox
                Left = 7
                Top = 58
                Width = 128
                Height = 13
                Hint = 'Indica se o dependente conta para o cálculo do IR'
                Caption = 'Imposto de Renda'
                DataField = 'FLGCONTAIMPOSTOR'
                DataSource = dsDepBen
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchkDepBenContaSalarioF: TDBCheckBox
                Left = 7
                Top = 42
                Width = 128
                Height = 13
                Hint = 'Indica se o dependente conta para o cálculo do Salário Família'
                Caption = 'Salário Família'
                DataField = 'FLGCONTASALARIOF'
                DataSource = dsDepBen
                Enabled = False
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
              object dbchkDepBenIsentoIRRF: TDBCheckBox
                Left = 7
                Top = 74
                Width = 98
                Height = 13
                Hint = 'Indica se o dependente é isento de IR ou não'
                Caption = 'Isento de IR'
                DataField = 'FLGISENTOIRRF'
                DataSource = dsDepBenPF
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
              object dbchkDepBenDesignado: TDBCheckBox
                Left = 7
                Top = 9
                Width = 82
                Height = 13
                Caption = 'Designado'
                DataField = 'FLGDESIGNADO'
                DataSource = dsDepBen
                Enabled = False
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
            end
            object GroupBox4: TGroupBox
              Left = 316
              Top = 78
              Width = 210
              Height = 77
              Caption = ' Número de Dependentes para '
              TabOrder = 4
              object Label17: TLabel
                Left = 12
                Top = 15
                Width = 30
                Height = 13
                Caption = 'IRRF'
              end
              object Label21: TLabel
                Left = 82
                Top = 15
                Width = 54
                Height = 13
                Caption = 'Sal. Fam.'
              end
              object Label22: TLabel
                Left = 151
                Top = 15
                Width = 30
                Height = 13
                Caption = 'Total'
              end
              object spNumDepIRDepBen: TwwDBSpinEdit
                Left = 12
                Top = 29
                Width = 52
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPIRRF'
                DataSource = dsDepBenPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object wwDBSpinEdit2: TwwDBSpinEdit
                Left = 82
                Top = 29
                Width = 52
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPSALF'
                DataSource = dsDepBenPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
              object wwDBSpinEdit3: TwwDBSpinEdit
                Left = 151
                Top = 29
                Width = 52
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPTOT'
                DataSource = dsDepBenPF
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
          end
        end
        object tbsOutrasInformacoes: TTabSheet
          Caption = 'Outras Informações'
          ImageIndex = 8
          object dbgrdOutrasInforms: TwwDBGrid
            Left = 0
            Top = 182
            Width = 1154
            Height = 182
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
            Align = alClient
            DataSource = dsOutrasInforms
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
          object Panel5: TPanel
            Left = 0
            Top = 182
            Width = 1154
            Height = 182
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Label46: TLabel
              Left = 24
              Top = 56
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
              Left = 427
              Top = 101
              Width = 57
              Height = 13
              Caption = 'Validação'
            end
            object Label51: TLabel
              Left = 372
              Top = 122
              Width = 44
              Height = 13
              Caption = '<---------'
            end
            object dblkParamPessoa: TwwDBLookupCombo
              Left = 24
              Top = 72
              Width = 337
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Parâmetro'#9'F'
                'IDPARAM'#9'10'#9'Código'#9'F')
              DataField = 'IDPARAM'
              LookupTable = qryParamPessoa
              LookupField = 'IDPARAM'
              Options = [loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
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
              Left = 428
              Top = 118
              Width = 240
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 4
            end
            object gbxInforAdicionais: TGroupBox
              Left = 198
              Top = -15
              Width = 501
              Height = 197
              Caption = 'Informações Adicionais'
              TabOrder = 5
              Visible = False
              object Label69: TLabel
                Left = 20
                Top = 36
                Width = 340
                Height = 13
                Caption = 'Ocupação Profissional - Cargo, Emprego ou Função Pública'
              end
              object Label70: TLabel
                Left = 20
                Top = 88
                Width = 51
                Height = 13
                Caption = 'Entidade'
              end
              object Label71: TLabel
                Left = 20
                Top = 148
                Width = 38
                Height = 13
                Caption = 'Renda'
              end
              object Label72: TLabel
                Left = 160
                Top = 148
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object Label73: TLabel
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
                  '22,00')
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
          object dbgrInfoAdicionais: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 145
            Selected.Strings = (
              
                'CARGOEMPFUNC'#9'55'#9'Ocupação Profissional - Cargo, Emprego ou Função' +
                ' Pública'
              'ENTIDADE'#9'55'#9'Entidade'
              'RENDA'#9'15'#9'Renda'
              'DTINICIO'#9'15'#9'Data Início'
              'DTFIM'#9'15'#9'Data Fim')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = dsOcupacao
            TabOrder = 3
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
          object pnlMemo: TPanel
            Left = 0
            Top = 364
            Width = 1154
            Height = 80
            Align = alBottom
            TabOrder = 2
            object lblInfoAdicionais: TLabel
              Left = 1
              Top = 0
              Width = 132
              Height = 13
              Align = alBottom
              Caption = 'Informações Adicionais'
            end
            object dbMemInfoAdicionais: TDBMemo
              Left = 1
              Top = 13
              Width = 1152
              Height = 66
              Align = alBottom
              DataField = 'INFOADICIONAIS'
              DataSource = dsPF2
              TabOrder = 0
            end
          end
          object gbxBotoes: TGroupBox
            Left = 0
            Top = 145
            Width = 1154
            Height = 37
            Align = alTop
            TabOrder = 4
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
              Left = 84
              Top = 13
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
          object pnlGrdReprLegal: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            TabOrder = 0
            object dbgrdLogReprLegal: TwwDBGrid
              Left = 1
              Top = 259
              Width = 1152
              Height = 184
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
              Width = 1152
              Height = 258
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
          object pnlReprLegal: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            TabOrder = 1
            object grpResponsavel: TGroupBox
              Left = 5
              Top = 5
              Width = 594
              Height = 113
              Caption = ' Responsável'
              TabOrder = 0
              object sbtnSelResponsavel: TSpeedButton
                Left = 531
                Top = 33
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
                Left = 559
                Top = 33
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
              object Label32: TLabel
                Left = 150
                Top = 18
                Width = 128
                Height = 13
                Caption = 'Nome do Responsável'
              end
              object Label3: TLabel
                Left = 12
                Top = 67
                Width = 121
                Height = 13
                Caption = 'Tipo de Responsável'
              end
              object lblCPFRes: TLabel
                Left = 8
                Top = 18
                Width = 24
                Height = 13
                Caption = 'CPF'
              end
              object dbeResponsavel: TDBEdit
                Left = 150
                Top = 36
                Width = 377
                Height = 21
                TabStop = False
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
                Left = 12
                Top = 82
                Width = 377
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
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
                OnChange = lkpcmbTipoRecebedorChange
              end
              object DBeCPFRes: TwwDBEdit
                Left = 8
                Top = 36
                Width = 136
                Height = 21
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
            object grpInformacao: TGroupBox
              Left = 5
              Top = 128
              Width = 595
              Height = 72
              Caption = 'Informações'
              TabOrder = 1
              object lbl5: TLabel
                Left = 8
                Top = 18
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object lbl3: TLabel
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
                UnboundDataType = wwDTEdtDate
                DisplayFormat = 'DD/MM/YYYY'
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
                UnboundDataType = wwDTEdtDate
                DisplayFormat = 'DD/MM/YYYY'
                OnCloseUp = timepickerDATAChange
                OnExit = timepickerDATAChange
              end
            end
            object grpObs: TGroupBox
              Left = 5
              Top = 207
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
                OnKeyPress = memObsDepenKeyPress
              end
            end
          end
        end
        object TbNucleoFamiliar: TTabSheet
          Caption = 'Nucleo Familiar'
          TabVisible = False
          object PnlNucleoFamiliar: TPanel
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Lable1: TLabel
              Left = 16
              Top = 16
              Width = 146
              Height = 13
              Caption = 'Responsável pelo Núcleo'
            end
            object DbLkcRespNucleo: TwwDBLookupCombo
              Left = 16
              Top = 32
              Width = 385
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Responsável')
              DataField = 'IDRESPNUCLEO'
              DataSource = DsNucleoFam
              LookupTable = QryResponsavel
              LookupField = 'IDRESPONSAVEL'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object DbGrdNucleoFamiliar: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1154
            Height = 444
            Selected.Strings = (
              'Responsavel'#9'60'#9'Responsável pelo Núcleo Familiar')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsNucleoFam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
      end
      inherited Dock973: TDock97
        Width = 1252
        object lblPaiDetalhe: TLabel [0]
          Left = 216
          Top = 7
          Width = 76
          Height = 13
          Align = alLeft
          Caption = 'lblPaiDetalhe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Width = 24
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 49
            Width = 21
          end
        end
        object edPaiDetalhe: TEdit
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
      inherited Dock974: TDock97
        Left = 1166
        Height = 472
        inherited tb97Detalhe: TToolbar97
          object bbtnOpcoes: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Cancel = True
            Caption = '&Opções'
            TabOrder = 3
            OnClick = bbtnOpcoesClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777000000070000000000777777000000070FFFFFFFF0777777000000070FF
              FFFFFF0777777000000070F000000F0777777000000070F0FBFB000777777000
              000070F0BFBF0F0007777000000070F000000F0770077000000070FF0FF44444
              44444000000070FF0FF4FBFBFBFB4000000070FFF0F4BFBFBFBF4000000070FF
              F0F4FBFBFBFB4000000070000004BFBFBFBF4000000077777704444444444000
              000077777774F444444440000000777777744444444440000000777777777777
              777770000000}
          end
        end
      end
    end
  end
  object pnlDepenJaExiste: TPanel [3]
    Left = 44
    Top = 543
    Width = 424
    Height = 150
    BevelWidth = 3
    TabOrder = 3
    Visible = False
    object Label44: TLabel
      Left = 8
      Top = 8
      Width = 225
      Height = 13
      Caption = 'Selecione o dependente a ser incluído:'
    end
    object Label45: TLabel
      Left = 13
      Top = 57
      Width = 114
      Height = 13
      Caption = 'Grau de Parentesco'
    end
    object btnCancelJaExiste: TBitBtn
      Left = 319
      Top = 114
      Width = 89
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelJaExisteClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnOkJaExiste: TBitBtn
      Left = 215
      Top = 114
      Width = 89
      Height = 27
      Caption = '&Ok'
      Default = True
      TabOrder = 1
      OnClick = btnOkJaExisteClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbcNomeDepen: TwwDBComboBox
      Left = 8
      Top = 24
      Width = 401
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      CharCase = ecUpperCase
      DropDownCount = 8
      ItemHeight = 0
      Sorted = False
      TabOrder = 2
      UnboundDataType = wwDefault
    end
    object dblkpcmbTipoDependencia2: TCMDBLookupCombo
      Left = 12
      Top = 70
      Width = 397
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'15'#9'Descrição')
      LookupTable = qryDependencia
      LookupField = 'IDDEPENDENCIA'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  object pnlDepenBenefJaExiste: TPanel [4]
    Left = 1080
    Top = 11
    Width = 421
    Height = 150
    BevelWidth = 3
    TabOrder = 4
    Visible = False
    object Label59: TLabel
      Left = 8
      Top = 4
      Width = 313
      Height = 13
      Caption = 'Selecione o dependente do beneficiário a ser incluído:'
    end
    object Label60: TLabel
      Left = 10
      Top = 57
      Width = 114
      Height = 13
      Caption = 'Grau de Parentesco'
    end
    object btnCancelJaExisteDepBenef: TBitBtn
      Left = 319
      Top = 114
      Width = 89
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelJaExisteDepBenefClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnOkJaExisteDepBenef: TBitBtn
      Left = 215
      Top = 114
      Width = 89
      Height = 27
      Caption = '&Ok'
      Default = True
      TabOrder = 2
      OnClick = btnOkJaExisteDepBenefClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dblkpcmbTipoDependencia3: TCMDBLookupCombo
      Left = 9
      Top = 70
      Width = 400
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'15'#9'Descrição')
      LookupTable = qryDependencia
      LookupField = 'IDDEPENDENCIA'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblkpcmbTipoDependencia3Change
    end
    object dblcNomeDepenBenef: TwwDBLookupCombo
      Left = 8
      Top = 20
      Width = 401
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'92'#9'DESCRICAO'#9'F')
      LookupTable = qrySelDepBenIncluido
      LookupField = 'IDPESSOA'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      OnChange = dblcNomeDepenBenefChange
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1301
    Top = 25
    TargetsData = (
      1
      4
      (
        ''
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 1216
    Top = 240
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 955
    Top = 283
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME, NUMDOCUMENTO)'
      'values'
      '  (:NOME, :NUMDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 1000
    Top = 111
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Titular'
    Colunas.Strings = (
      'EL.MATRICULA'
      'DT.MATRICULA'
      'P.NOME'
      'PL.NOME'
      'SP.DESCRICAO'
      'SPP.DESCRICAO'
      'SF.DESCRICAO'
      'PD.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula Titular'
      'Matrícula Dependente'
      'Nome do Titular'
      'Plano'
      'Sit. na Fundação'
      'Sit. no Plano'
      'Sit. na Patrocinadora'
      'Nome Dependente')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA PD'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'SITPART SP'
      'SITFUNC SF'
      'SITPLANOPREV SPP')
    CamposChave.Strings = (
      'EL.IDPESSOA'
      'EL.IDPESSJUR'
      'EL.IDPESSOA'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA(+)'
      'EL.IDPESSJUR = PP.IDPESSJUR(+)'
      'PP.IDPLANOPREV = PL.IDPLANOPREV(+)'
      'EL.IDPESSOA = P.IDPESSOA'
      'EL.IDPESSJUR = PT.IDPESSOA'
      'EL.IDPESSOA = DT.IDTITULAR(+)'
      'DT.IDPESSOA = PD.IDPESSOA(+)'
      'SP.IDSITPART(+) = PP.IDSITPART'
      'SPP.IDSITPLANOPREV(+) = PP.IDSITPLANOPREV'
      'SF.IDSITFUNC(+) = EL.IDSITFUNC'
      'PP.FLGDESATIVADO IN (0,1)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '60'
      '50'
      '50'
      '50'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '0')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 1000
    Top = 68
  end
  inherited ImlPadrao: TImageList
    Left = 1258
    Top = 25
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 1043
    Top = 25
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.NOME,P.NUMDOCUMENTO,'
      '              PT.NOME AS NOMEPATRO,'
      '              PL.NOME AS NOMEPLANO,'
      '              EL.MATRICULA,'
      '              PP.INSCRICAONUMERO,'
      '              EL.IDPESSJUR,'
      '              PP.IDPLANOPREV,'
      '              EL.IDPESSOA,'
      '              PP.SEQPROPOSTA,'
      '              SP.FLGINTERNO,'
      '              NVL(SP.DESCRICAO,'#39'ELEGÍVEL'#39') AS SITPARTDESCRICAO,'
      '              PP.INSCRICAODATA,'
      '              PP.IDSITPART,'
      '              PF.DATANASC,'
      '              P.TIPO,'
      '              P.IDIMAGEM,'
      
        '              DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALP' +
        'ARTICIPACAO) AS SALARIO,'
      '              PL.IDRGELEGBENEF,'
      '              EL.IDSITFUNC,'
      '              EL.VALORBASE1,'
      '              EL.VALORBASE2,'
      '              EL.VALORBASE3,'
      '              PAT.NOMEVALORBASE1,'
      '              PAT.NOMEVALORBASE2,'
      '              PAT.NOMEVALORBASE3'
      'FROM'
      '              PESSOA P,'
      '              PESSOA PT,'
      '              PESSOAFISICA PF,'
      '              PLANPREV PL,'
      '              PARTPREVPLAN PP,'
      '              ELEGPATRO EL,'
      '              SITPART SP,'
      '              PATRO   PAT'
      'WHERE'
      '         (EL.IDPESSOA         =:IDPESSOA)'
      'AND      (EL.IDPESSJUR        =:IDPESSJUR)'
      'AND      (PP.IDPESSOA(+)      = EL.IDPESSOA)'
      'AND      (PP.IDPESSJUR(+)     = EL.IDPESSJUR)'
      
        'AND      ((PP.IDPLANOPREV     =:IDPLANOPREV) OR (PP.IDPLANOPREV ' +
        'IS NULL))'
      'AND      (PL.IDPLANOPREV(+)   = PP.IDPLANOPREV)'
      'AND      (EL.IDPESSOA         = P.IDPESSOA)'
      'AND      (EL.IDPESSJUR        = PT.IDPESSOA)'
      'AND      (PP.IDSITPART        = SP.IDSITPART(+))'
      'AND      (EL.IDPESSOA         = PF.IDPESSOA)'
      'AND      (PAT.IDPESSOA        = EL.IDPESSJUR)'
      ' '
      ' '
      ' ')
    Left = 1043
    Top = 412
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
      end>
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qrySALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object qryTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
    end
    object qryIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qryNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Size = 60
    end
    object qryNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Size = 60
    end
    object qryNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Size = 60
    end
    object qryVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
    end
    object qrySITPARTDESCRICAO: TStringField
      FieldName = 'SITPARTDESCRICAO'
      Size = 50
    end
    object qryIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 1000
    Top = 25
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       P.NOME,'
      '       P.IDPESSOA,'
      '       P.NUMDOCUMENTO,'
      '       D.IDTITULAR,'
      '       DP.DESCRICAO AS TIPODEPENDENCIA,'
      '       D.NUMSEQUENCIA,'
      '       D.FLGCONTAIMPOSTOR,'
      '       D.FLGCONTASALARIOF,'
      '       D.DATACADASTRO,'
      '       DECODE(BF.IDPESSOA, NULL, 0, 1 ) AS FLGBENEFICIARIO,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      ''
      '       D.FLGDESIGNADO,'
      '       D.FLGDEPLEGAL,'
      '       D.IDDEPENDENCIA,'
      '       D.MATRICULA,'
      '       D.INICIOIMPOSTOR,'
      '       D.FIMIMPOSTOR,'
      '       D.INICIOSALARIOF,'
      '       D.FIMSALARIOF,'
      '       PF.DATANASC,'
      '       PF.DATAMORTE,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.EMAILFUNCEF,'
      '       PF.SEXO,'
      '       PF.FLGMOLESTIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE,'
      '       PF.DATAFIMMOLESTIA,'
      '       PF.INICIOINVALIDEZ,'
      '       PF.FIMINVALIDEZ,'
      '       PF.FLGISENTOIRRF,'
      '       PF.IDGRINSTR,'
      '       SIT.DESCRICAO AS SITUACAODEPEN,'
      '       0 AS FLGELEGIVEL,'
      '       D.FLGIGNORAVALIR,'
      '       VALORBASE1,VALORBASE2,VALORBASE3,'
      '       VALORBASE4,VALORBASE5,VALORBASE6,'
      '       D.DATACANCELA,'
      '       D.FLGDEPINVALIDO,'
      '       PF.TIPOISENCAOIRRF,'
      '       DECODE(PF.TIPOISENCAOIRRF,'
      '              '#39'0'#39','
      '              '#39'Espécie de Benefício 92'#39','
      '              '#39'1'#39','
      '              '#39'Ação Judicial'#39','
      '              '#39'2'#39','
      '              '#39'Moléstia Grave'#39') AS TPISENCAOIRRF,'
      '       PF.NOMECONJUGE'
      '      --SIG25312 -INICIO'
      '      ,trunc(to_char(sysdate - pf.datanasc)/ 365.25)  as IDADE'
      '      -- , DECODE(d.motivocancel, 1, '#39'Limite de Idade'#39','
      '      --                                2, '#39'Divórcio'#39','
      '      --                                3, '#39'Falecimento'#39','
      
        '      --                                4, '#39'Opção do participant' +
        'e'#39','
      
        '      --                                5, '#39'Outros'#39') as MOTIVOCA' +
        'NCEL,'
      
        '     ,'#39'                                                  '#39' AS MO' +
        'TIVOCANCEL'
      '     ,'#39'          '#39' AS DATACANCEL'
      
        '     ,'#39'                                                  '#39' AS PL' +
        'ANO'
      '     ,D.OBSERVACAO'
      '      -- SIG71037 -INICIO'
      '     ,NVL(D.FLGPLANOSAUDE,0) AS FLGPLANOSAUDE   /*SIG135385*/ '
      '     ,DEP.IDSITDEPENDENTE'
      '     -- Fim SIG 71037'
      '     ,NVL((SELECT DISTINCT 1 FROM PLANODEPENDENTE PDP'
      '            WHERE PDP.IDTITULAR = D.IDTITULAR'
      '              AND PDP.IDPESSOA = D.IDPESSOA'
      '              AND PDP.IDPLANOPREV = 2), 0) AS DEP_PLANO2'
      '     ,NVL((SELECT DISTINCT 1 FROM PLANODEPENDENTE PDP'
      '            WHERE PDP.IDTITULAR = D.IDTITULAR'
      '              AND PDP.IDPESSOA = D.IDPESSOA'
      '              AND PDP.IDPLANOPREV = 66), 0) AS DEP_PLANO66'
      '     ,NVL((SELECT DISTINCT 1 FROM PLANODEPENDENTE PDP'
      '            WHERE PDP.IDTITULAR = D.IDTITULAR'
      '              AND PDP.IDPESSOA = D.IDPESSOA'
      '              AND PDP.IDPLANOPREV = 74), 0) AS DEP_PLANO74'
      '     --SIG25312 -FIM'
      'FROM'
      '          DEPENTIT D'
      '     JOIN PESSOA P          ON P.IDPESSOA       = D.IDPESSOA'
      '     JOIN PESSOAFISICA PF   ON PF.IDPESSOA      = D.IDPESSOA'
      
        '     JOIN DEPEN DP          ON DP.IDDEPENDENCIA = D.IDDEPENDENCI' +
        'A'
      '     JOIN DEPENDENTE DEP    ON DEP.IDPESSOA     = D.IDPESSOA '
      '     '
      
        '     LEFT JOIN SITDEPENDENTE SIT ON SIT.IDSITDEPENDENTE = DEP.ID' +
        'SITDEPENDENTE'
      
        '     LEFT JOIN (SELECT DISTINCT IDTITULAR,IDPESSOA FROM BENEFBFC' +
        'IARIO'
      '                 WHERE IDTITULAR = :idtitular'
      '                   AND IDSITBENEFICIO IN (1,2,4)'
      '               ) BF ON BF.IDTITULAR = D.IDTITULAR'
      '                   AND BF.IDPESSOA  = D.IDPESSOA'
      ''
      'WHERE  D.IDTITULAR     = :idtitular'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'ORDER BY D.NUMSEQUENCIA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGDESIGNADO;CheckBox;1;0'
      'FLGDEPLEGAL;CheckBox;1;0'
      'FLGPLANOSAUDE;CheckBox;1;0'
      'FLGISENTOIRRF;CheckBox;1;0'
      'FLGMOLESTIAGRAVE;CheckBox;1;0'
      'FLGELEGIVEL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 1225
    Top = 284
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idtitular'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  NUMSEQUENCIA = :NUMSEQUENCIA,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  FLGDESIGNADO = :FLGDESIGNADO,'
      '  FLGDEPLEGAL = :FLGDEPLEGAL,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  MATRICULA = :MATRICULA,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  VALORBASE4 = :VALORBASE4,'
      '  VALORBASE5 = :VALORBASE5,'
      '  VALORBASE6 = :VALORBASE6,'
      '  INICIOIMPOSTOR = :INICIOIMPOSTOR,'
      '  FIMIMPOSTOR = :FIMIMPOSTOR,'
      '  INICIOSALARIOF = :INICIOSALARIOF,'
      '  FIMSALARIOF = :FIMSALARIOF,'
      '  DATACADASTRO = :DATACADASTRO,'
      '  FLGIGNORAVALIR = :FLGIGNORAVALIR,'
      '  FLGDEPINVALIDO = :FLGDEPINVALIDO,'
      ' OBSERVACAO = :OBSERVACAO,'
      ' FLGPLANOSAUDE = :FLGPLANOSAUDE '
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR'
      ''
      ''
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      '  (IDPESSOA,'
      '   IDTITULAR,'
      '   NUMSEQUENCIA,'
      '   FLGCONTAIMPOSTOR,'
      '   FLGCONTASALARIOF,'
      '   FLGBENEFICIARIO,'
      '   FLGDESIGNADO,'
      '   FLGDEPLEGAL,'
      '   IDDEPENDENCIA,'
      '   MATRICULA,'
      '   VALORBASE1,'
      '   VALORBASE2,'
      '   VALORBASE3,'
      '   INICIOIMPOSTOR,'
      '   FIMIMPOSTOR,'
      '   INICIOSALARIOF,'
      '   FIMSALARIOF,'
      '   DATACADASTRO,'
      '   FLGIGNORAVALIR,'
      '   VALORBASE4,'
      '   VALORBASE5,'
      '   VALORBASE6,'
      '   FLGDEPINVALIDO,'
      '   OBSERVACAO,'
      '   FLGPLANOSAUDE) '
      'values'
      '  (:IDPESSOA,'
      '   :IDTITULAR,'
      '   :NUMSEQUENCIA,'
      '   :FLGCONTAIMPOSTOR,'
      '   :FLGCONTASALARIOF,'
      '   :FLGBENEFICIARIO,'
      '   :FLGDESIGNADO,'
      '   :FLGDEPLEGAL,'
      '   :IDDEPENDENCIA,'
      '   :MATRICULA,'
      '   :VALORBASE1,'
      '   :VALORBASE2,'
      '   :VALORBASE3,'
      '   :INICIOIMPOSTOR,'
      '   :FIMIMPOSTOR,'
      '   :INICIOSALARIOF,'
      '   :FIMSALARIOF,'
      '   :DATACADASTRO,'
      '   :FLGIGNORAVALIR,'
      '   :VALORBASE4,'
      '   :VALORBASE5,'
      '   :VALORBASE6,'
      '   :FLGDEPINVALIDO,'
      '   :OBSERVACAO,'
      '   :FLGPLANOSAUDE)'
      ''
      ''
      ''
      '')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR')
    Left = 1236
    Top = 220
  end
  object dsDepen: TwwDataSource
    AutoEdit = False
    DataSet = qryDepen
    Left = 1211
    Top = 356
  end
  object qryDepen: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDepenBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  D.IDPESSOA, '
      '                D.IDSITDEPENDENTE, '
      '                D.FLGDESIGNADO'#13
      'FROM      DEPENDENTE D,'
      '                DEPENTIT DP'
      'WHERE  (DP.IDTITULAR = :IDPESSOA)'
      'AND        (DP.IDPESSOA = D.IDPESSOA) '
      ''
      '')
    UpdateObject = updDepen
    ValidateWithMask = True
    Left = 1221
    Top = 370
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepen: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENDENTE'
      'set'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE,'
      '  FLGDESIGNADO = :FLGDESIGNADO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENDENTE'
      '  (IDPESSOA, IDSITDEPENDENTE, FLGDESIGNADO)'
      'values'
      '  (:IDPESSOA, :IDSITDEPENDENTE, :FLGDESIGNADO)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 1235
    Top = 355
  end
  object dsPF: TwwDataSource
    AutoEdit = False
    DataSet = qryPF
    Left = 1208
    Top = 177
  end
  object qryPF: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryPFBeforePost
    AfterScroll = qryPFAfterScroll
    OnCalcFields = qryPFCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PF.IDPESSOA,'
      '        PF.IDPAIS,'
      '        PF.NOMEPAI,'
      '        PF.NOMEMAE,'
      '        PF.DATAMORTE,'
      '        PF.DATANASC,'
      '        PF.SEXO,'
      '        PF.TIPOSANG,'
      '        PF.ESTCIVIL,'
      '        PF.NUMDEPIRRF,'
      '        PF.NUMDEPSALF,'
      '        PF.NUMDEPTOT,'
      '        PF.FLGISENTOIRRF,'
      '        PF.FLGMOLESTIAGRAVE,'
      '        PF.DATAMOLESTIAGRAVE,'
      '        PF.DATAFIMMOLESTIA,'
      '        PF.IDGRINSTR,'
      '        PF.INICIOINVALIDEZ,'
      '        PF.FIMINVALIDEZ,'
      '        PF.IDNATURALIDADE,'
      '        PF.IDCIDADES,'
      '        PF.IDNACIONALIDADE,'
      '        PF.FLGSOMAIRSUPINSS,'
      '        PF.FLGCONTASALARIOPROCESSADA,'
      '        PF.FLGSOLICITACONTASALARIO,'
      '        PF.DTCONTASALARIOPROCESSADA,'
      '        PF.DTSOLICITACONTASALARIO,'
      '        PF.EMAILFUNCEF,'
      '        PF.TIPOISENCAOIRRF,'
      '        PF.IDESTADO,'
      '        PF.CODESTADO,'
      '        PF.NOMECONJUGE,'
      '        PF.INFOADICIONAIS,'
      '        TD.IDTELEFONE, TD.DDI, TD.DDD, TD.NUMERO, TD.TIPO,'
      '        PF.POSSUIDEP'
      'FROM PESSOAFISICA PF,'
      '     DEPENTIT DP,'
      '     TELENDPESS TD'
      'WHERE (DP.IDTITULAR = :IDPESSOA) '
      '  AND (PF.IDPESSOA = DP.IDPESSOA)'
      '  AND (TD.IDPESSOA(+) = PF.IDPESSOA)'
      '  AND (TD.IDENDERECO(+) IS NULL)')
    UpdateObject = updPF
    ValidateWithMask = True
    Left = 1221
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPFIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPESSOA'
    end
    object qryPFIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPAIS'
    end
    object qryPFNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMEPAI'
      Size = 50
    end
    object qryPFNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMEMAE'
      Size = 50
    end
    object qryPFDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMORTE'
    end
    object qryPFDATANASC: TDateTimeField
      FieldName = 'DATANASC'
      Origin = 'BASEDADOS.PESSOAFISICA.DATANASC'
    end
    object qryPFSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'BASEDADOS.PESSOAFISICA.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryPFTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Origin = 'BASEDADOS.PESSOAFISICA.TIPOSANG'
      Size = 3
    end
    object qryPFESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Origin = 'BASEDADOS.PESSOAFISICA.ESTCIVIL'
      FixedChar = True
      Size = 1
    end
    object qryPFNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPIRRF'
    end
    object qryPFNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPSALF'
    end
    object qryPFNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPTOT'
    end
    object qryPFFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGISENTOIRRF'
    end
    object qryPFFLGMOLESTIAGRAVE: TFloatField
      FieldName = 'FLGMOLESTIAGRAVE'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGMOLESTIAGRAVE'
    end
    object qryPFDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMOLESTIAGRAVE'
    end
    object qryPFDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAFIMMOLESTIA'
    end
    object qryPFIDGRINSTR: TFloatField
      FieldName = 'IDGRINSTR'
      Origin = 'BASEDADOS.PESSOAFISICA.IDGRINSTR'
    end
    object qryPFINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
      Origin = 'BASEDADOS.PESSOAFISICA.INICIOINVALIDEZ'
    end
    object qryPFFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
      Origin = 'BASEDADOS.PESSOAFISICA.FIMINVALIDEZ'
    end
    object qryPFIDNATURALIDADE: TFloatField
      FieldName = 'IDNATURALIDADE'
      Origin = 'BASEDADOS.PESSOAFISICA.IDNATURALIDADE'
    end
    object qryPFIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.PESSOAFISICA.IDCIDADES'
    end
    object qryPFIDNACIONALIDADE: TFloatField
      FieldName = 'IDNACIONALIDADE'
      Origin = 'BASEDADOS.PESSOAFISICA.IDNACIONALIDADE'
    end
    object qryPFFLGSOMAIRSUPINSS: TFloatField
      FieldName = 'FLGSOMAIRSUPINSS'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGSOMAIRSUPINSS'
    end
    object qryPFFLGCONTASALARIOPROCESSADA: TFloatField
      FieldName = 'FLGCONTASALARIOPROCESSADA'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGCONTASALARIOPROCESSADA'
    end
    object qryPFFLGSOLICITACONTASALARIO: TFloatField
      FieldName = 'FLGSOLICITACONTASALARIO'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGSOLICITACONTASALARIO'
    end
    object qryPFDTCONTASALARIOPROCESSADA: TDateTimeField
      FieldName = 'DTCONTASALARIOPROCESSADA'
      Origin = 'BASEDADOS.PESSOAFISICA.DTCONTASALARIOPROCESSADA'
    end
    object qryPFDTSOLICITACONTASALARIO: TDateTimeField
      FieldName = 'DTSOLICITACONTASALARIO'
      Origin = 'BASEDADOS.PESSOAFISICA.DTSOLICITACONTASALARIO'
    end
    object qryPFEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Origin = 'BASEDADOS.PESSOAFISICA.EMAILFUNCEF'
      Size = 100
    end
    object qryPFTIPOISENCAOIRRF: TFloatField
      FieldName = 'TIPOISENCAOIRRF'
    end
    object qryPFCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.PESSOAFISICA.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryPFNOMECONJUGE: TStringField
      FieldName = 'NOMECONJUGE'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMECONJUGE'
      Size = 60
    end
    object qryPFINFOADICIONAIS: TMemoField
      FieldName = 'INFOADICIONAIS'
      Origin = 'BASEDADOS.PESSOAFISICA.INFOADICIONAIS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryPFPOSSUIDEP: TStringField
      FieldName = 'POSSUIDEP'
      Origin = 'BASEDADOS.PESSOAFISICA.POSSUIDEP'
      FixedChar = True
      Size = 1
    end
    object qryPFIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
    end
    object qryPFDDI: TStringField
      FieldName = 'DDI'
      FixedChar = True
      Size = 4
    end
    object qryPFDDD: TStringField
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object qryPFNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qryPFTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 5
    end
    object qryPFTComercial: TStringField
      FieldKind = fkCalculated
      FieldName = 'TComercial'
      Size = 3
      Calculated = True
    end
    object qryPFTParticular: TStringField
      FieldKind = fkCalculated
      FieldName = 'TParticular'
      Size = 3
      Calculated = True
    end
    object qryPFTFax: TStringField
      FieldKind = fkCalculated
      FieldName = 'TFax'
      Size = 3
      Calculated = True
    end
    object qryPFTCelular: TStringField
      FieldKind = fkCalculated
      FieldName = 'TCelular'
      Size = 3
      Calculated = True
    end
    object qryPFTRecado: TStringField
      FieldKind = fkCalculated
      FieldName = 'TRecado'
      Size = 3
      Calculated = True
    end
    object qryPFIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
  end
  object updPF: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDPAIS = :IDPAIS,'
      '  IDESTADO = :IDESTADO,'
      '  CODESTADO = :CODESTADO,'
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
      '  FLGMOLESTIAGRAVE = :FLGMOLESTIAGRAVE,'
      '  DATAMOLESTIAGRAVE = :DATAMOLESTIAGRAVE,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  INICIOINVALIDEZ = :INICIOINVALIDEZ,'
      '  FIMINVALIDEZ = :FIMINVALIDEZ,'
      '  IDNATURALIDADE = :IDNATURALIDADE,'
      '  IDNACIONALIDADE = :IDNACIONALIDADE,'
      '  DATAFIMMOLESTIA = :DATAFIMMOLESTIA,'
      '  IDCIDADES = :IDCIDADES,'
      '  FLGSOMAIRSUPINSS = :FLGSOMAIRSUPINSS,'
      ' FLGCONTASALARIOPROCESSADA = :FLGCONTASALARIOPROCESSADA,'
      '  FLGSOLICITACONTASALARIO = :FLGSOLICITACONTASALARIO,'
      '  DTCONTASALARIOPROCESSADA = :DTCONTASALARIOPROCESSADA,'
      '  DTSOLICITACONTASALARIO = :DTSOLICITACONTASALARIO,'
      '  EMAILFUNCEF = :EMAILFUNCEF,'
      '  TIPOISENCAOIRRF           = :TIPOISENCAOIRRF,'
      '  POSSUIDEP = :POSSUIDEP,'
      '  NOMECONJUGE = :NOMECONJUGE,'
      '  INFOADICIONAIS = :INFOADICIONAIS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDPESSOA, IDPAIS, IDESTADO, CODESTADO, NOMEPAI, NOMEMAE, EMAI' +
        'LFUNCEF, DATAMORTE, DATANASC, SEXO, TIPOSANG,'
      
        '   ESTCIVIL, NUMDEPIRRF, NUMDEPSALF, NUMDEPTOT, FLGISENTOIRRF, F' +
        'LGMOLESTIAGRAVE, '
      
        '   DATAMOLESTIAGRAVE, IDGRINSTR, INICIOINVALIDEZ, FIMINVALIDEZ, ' +
        'IDNATURALIDADE,'
      
        '   IDNACIONALIDADE, DATAFIMMOLESTIA, IDCIDADES, FLGSOMAIRSUPINSS' +
        ',DTCONTASALARIOPROCESSADA,'
      
        '   FLGSOLICITACONTASALARIO,FLGCONTASALARIOPROCESSADA,DTSOLICITAC' +
        'ONTASALARIO,   TIPOISENCAOIRRF,NOMECONJUGE,INFOADICIONAIS,POSSUI' +
        'DEP)'
      'values'
      
        '  (:IDPESSOA, :IDPAIS, :IDESTADO, :CODESTADO, :NOMEPAI, :NOMEMAE' +
        ', :EMAILFUNCEF, :DATAMORTE, :DATANASC, :SEXO,'
      
        '   :TIPOSANG, :ESTCIVIL, :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT, :' +
        'FLGISENTOIRRF,'
      
        '   :FLGMOLESTIAGRAVE, :DATAMOLESTIAGRAVE, :IDGRINSTR, :INICIOINV' +
        'ALIDEZ, :FIMINVALIDEZ,'
      
        '   :IDNATURALIDADE, :IDNACIONALIDADE, :DATAFIMMOLESTIA, :IDCIDAD' +
        'ES, :FLGSOMAIRSUPINSS,:DTCONTASALARIOPROCESSADA,'
      
        '   :FLGSOLICITACONTASALARIO,:FLGCONTASALARIOPROCESSADA,:DTSOLICI' +
        'TACONTASALARIO, :TIPOISENCAOIRRF,:NOMECONJUGE,:INFOADICIONAIS,:P' +
        'OSSUIDEP)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 1236
    Top = 177
  end
  object dsPessoa: TwwDataSource
    AutoEdit = False
    DataSet = qryPessoa
    Left = 935
    Top = 496
  end
  object qryPessoa: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryPessoaBeforePost
    BeforeDelete = qryPessoaBeforeDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PES.IDPESSOA,'
      '  PES.NOME,'
      '  PES.NUMDOCUMENTO,'
      '  PES.TIPO,'
      '  PES.RAZAOSOCIAL,'
      '  PES.IDENDCORRESP,'
      '  PES.IDENDCOMERCIAL,'
      '  PES.IDENDENTREGA,'
      '  PES.IDENDRESIDENCIAL,'
      '  PES.IDENDCOBRANCA,'
      '  PES.EMAIL'
      ''
      'FROM'
      '  PESSOA PES,'
      '  DEPENTIT D'
      ''
      'WHERE'
      '      (D.IDTITULAR  = :IDPESSOA)'
      '  AND (PES.IDPESSOA = D.IDPESSOA)')
    UpdateObject = updPessoa
    ValidateWithMask = True
    Left = 998
    Top = 476
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPessoa: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  EMAIL = :EMAIL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDPESSOA, NOME, NUMDOCUMENTO, TIPO, RAZAOSOCIAL, IDENDCORRESP' +
        ', IDENDCOMERCIAL,'
      '   IDENDENTREGA, IDENDRESIDENCIAL, IDENDCOBRANCA, EMAIL)'
      'values'
      
        '  (:IDPESSOA, :NOME, :NUMDOCUMENTO, :TIPO, :RAZAOSOCIAL, :IDENDC' +
        'ORRESP,'
      
        '   :IDENDCOMERCIAL, :IDENDENTREGA, :IDENDRESIDENCIAL, :IDENDCOBR' +
        'ANCA,'
      '   :EMAIL)'
      ' ')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 962
    Top = 496
  end
  object dsEndPess: TwwDataSource
    DataSet = qryEndPess
    Left = 885
    Top = 373
  end
  object qryEndPess: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryEndPessBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  EP.IDPESSOA ,'
      '  EP.IDENDERECO ,'
      '  EP.IDCIDADES ,'
      '  EP.LOGRADOURO ,'
      '  EP.NUMERO ,'
      '  EP.COMPLEMENTO ,'
      '  EP.NOME,'
      '  EP.BAIRRO ,'
      '  EP.CEP ,'
      '  EP.IDPAIS,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS,'
      '  EP.CODESTADO'
      'FROM'
      '  ENDPESS EP,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P,'
      '  DEPENTIT D'
      'WHERE'
      '         (D.IDTITULAR = :IDTITULAR)'
      'AND ( D.IDPESSOA = EP.IDPESSOA )'
      'AND (  C.IDCIDADES(+) = EP.IDCIDADES)'
      'AND (C.IDESTADO = E.IDESTADO(+))'
      'AND (  E.IDPAIS = P.IDPAIS(+))'
      ''
      ''
      ' ')
    UpdateObject = updEndPess
    ValidateWithMask = True
    Left = 763
    Top = 65279
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updEndPess: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDENDERECO = :IDENDERECO,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  NOME = :NOME,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  IDPAIS = :IDPAIS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, '
      'COMPLEMENTO, NOME,BAIRRO, '
      '   CEP, IDPAIS)'
      'values'
      '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :NUMERO, '
      ':COMPLEMENTO, :NOME,'
      '   :BAIRRO, :CEP, :IDPAIS)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 885
    Top = 413
  end
  object qryDependencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE IDDEPENDENCIA <> '#39'PRP'#39
      'AND (IDDEPENDENCIA <> '#39'OUT'#39')'
      
        'AND (IDDEPENDENCIA IN ('#39'COM'#39','#39'FIL'#39','#39'ENT'#39','#39'MSG'#39','#39'IRM'#39','#39'PAI'#39','#39'EXC'#39 +
        ','#39'NTO'#39','#39'AVO'#39','#39'SOG'#39','#39'DES'#39','#39'CUR'#39','#39'BDE'#39'))'
      '/*ORDER BY DESCRICAO */')
    ValidateWithMask = True
    Left = 503
    Top = 542
  end
  object qrySeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NUMSEQUENCIA) AS PROXNUMSEQ'
      'FROM   DEPENTIT '
      'WHERE  IDTITULAR = :IDTITULAR ')
    ValidateWithMask = True
    Left = 885
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryCidade: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO ,'
      '  E.NOMEESTADO , '
      '  P.IDPAIS ,'
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL,'
      '  E.IDESTADO,'
      
        '  CAST(C.NOME||'#39' ('#39'||TRIM(E.CODESTADO)||'#39')'#39' AS VARCHAR2(40)) AS ' +
        'NOMECOMPLETO'
      'FROM '
      '  CIDADES C,'
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( C.IDESTADO = E.IDESTADO) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY C.NOME'
      ' ')
    ValidateWithMask = True
    Left = 890
    Top = 556
    object qryCidadeNOMECOMPLETO: TStringField
      DisplayLabel = 'Cidade (UF)'
      DisplayWidth = 56
      FieldName = 'NOMECOMPLETO'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 56
    end
    object qryCidadeCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryCidadeNOMECIDADE: TStringField
      DisplayWidth = 40
      FieldName = 'NOMECIDADE'
      Origin = '"CM.CIDADES".NOME'
      Visible = False
      Size = 50
    end
    object qryCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = '"CM.CIDADES".IDCIDADES'
      Visible = False
    end
    object qryCidadeNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = '"CM.PAIS".IDPAIS'
      Visible = False
    end
    object qryCidadeNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = '"CM.PAIS".NOMEPAIS'
      Visible = False
      Size = 30
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 880
    Top = 543
  end
  object dsCBanco: TwwDataSource
    DataSet = qryCBanco
    Left = 925
    Top = 313
  end
  object qryCBanco: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterEdit = qryCBancoAfterEdit
    BeforePost = qryCBancoBeforePost
    AfterScroll = qryCBancoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDTITULAR, CB.IDCBANCARIA,'
      '               CB.CONTACORRENTE,'
      '               CB.IDAGENCIA,'
      '               CB.FLGCONTAPREF,'
      '               CB.IDPESSOA,'
      '               CB.TIPOCONTA,'
      '               DECODE(CB.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39','
      '                                    '#39'2'#39', '#39'Conta Salário'#39','
      '                                    '#39'3'#39', '#39'Poupança'#39','
      '                                    '#39'4'#39', '#39'OP/Recibo'#39','
      
        '                                    '#39'Conta Corrente'#39') AS NOMETIP' +
        'OCONTA,'
      '               CB.FLGCONTACONJUNTA,'
      '               PA.NOME AS AGENCIA,'
      '               PB.NOME AS BANCO,'
      '               AB.NUMAGENCIA,'
      '               AB.IDBANCO,'
      '               B.NUMBANCO,'
      '               CB.FLGCONTARESGATE'
      'FROM    CONTABANCARIA CB,'
      '               PESSOA PA,'
      '               PESSOA PB,'
      '               AGENCIABANCARIA AB,'
      '               BANCO B,'
      '               DEPENTIT D'
      'WHERE D.IDTITULAR = :IDTITULAR'
      '  AND D.IDPESSOA  = CB.IDPESSOA'
      '  AND AB.IDPESSOA = CB.IDAGENCIA'
      '  AND AB.IDPESSOA = PA.IDPESSOA'
      '  AND AB.IDBANCO  = PB.IDPESSOA'
      '  AND AB.IDBANCO  = B.IDPESSOA'
      ''
      ' '
      ' ')
    UpdateObject = updCBanco
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0'
      'FLGCONTACONJUNTA;CheckBox;S;N'
      'FLGCONTARESGATE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 938
    Top = 351
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updCBanco: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA,'
      '  FLGCONTARESGATE = :FLGCONTARESGATE'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA'
      ' ')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ', '
      'TIPOCONTA, '
      '   FLGCONTACONJUNTA, FLGCONTARESGATE)'
      'values'
      '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, '
      ':IDPESSOA, '
      '   :TIPOCONTA, :FLGCONTACONJUNTA, :FLGCONTARESGATE)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 957
    Top = 308
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 738
    Top = 215
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
    Left = 500
    Top = 7
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDPESSOA,'
      '  P.NOME AS BANCO,'
      '  B.NUMBANCO,'
      '  B.FLGVALIDACC'
      'FROM'
      '  PESSOA P,  BANCO B'
      'WHERE'
      '  P.IDPESSOA = B.IDPESSOA'
      'ORDER BY '
      '  P.NOME '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 606
    Top = 576
  end
  object qryAgencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AG.IDPESSOA,'
      '        AGENCIA.NOME AS AGENCIA,'
      '        AG.NUMAGENCIA'
      'FROM PESSOA AGENCIA, AGENCIABANCARIA AG'
      'WHERE AG.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '      AG.IDBANCO=:pIdBanco '
      ' order by AG.NUMAGENCIA')
    ValidateWithMask = True
    Left = 690
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qrySitDependente: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITDEPENDENTE, '
      '       DESCRICAO'
      'FROM SITDEPENDENTE'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 844
    Top = 202
  end
  object DsNucleoFam: TwwDataSource
    AutoEdit = False
    DataSet = QryNucleoFam
    Left = 1119
    Top = 409
  end
  object QryNucleoFam: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NF.IDNUCLEOFAMILIAR, '
      '  NF.IDRESPNUCLEO,'
      '  NF.IDTITULAR'
      'FROM'
      '  CM.NUCLEOFAMILIAR NF'
      'WHERE'
      '  (NF.IDTITULAR = :IDTITULAR)'
      '')
    UpdateObject = UpdNucleoFam
    ValidateWithMask = True
    Left = 1072
    Top = 286
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object QryNucleoFamResponsavel: TStringField
      DisplayLabel = 'Responsável pelo Núcleo Familiar'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'Responsavel'
      LookupDataSet = QryResponsavel
      LookupKeyFields = 'IDRESPONSAVEL'
      LookupResultField = 'NOME'
      KeyFields = 'IDRESPNUCLEO'
      Size = 60
      Lookup = True
    end
    object QryNucleoFamIDNUCLEOFAMILIAR: TFloatField
      DisplayWidth = 15
      FieldName = 'IDNUCLEOFAMILIAR'
      Visible = False
    end
    object QryNucleoFamIDRESPNUCLEO: TFloatField
      DisplayWidth = 12
      FieldName = 'IDRESPNUCLEO'
      Visible = False
    end
    object QryNucleoFamIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Origin = 'NUCLEOFAMILIAR.IDTITULAR'
      Visible = False
    end
  end
  object UpdNucleoFam: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.NUCLEOFAMILIAR'
      'set'
      '  IDRESPNUCLEO = :IDRESPNUCLEO,'
      '  IDTITULAR = :IDTITULAR'
      'where'
      '  IDNUCLEOFAMILIAR = :OLD_IDNUCLEOFAMILIAR')
    InsertSQL.Strings = (
      'insert into CM.NUCLEOFAMILIAR'
      '  (IDNUCLEOFAMILIAR, IDRESPNUCLEO, IDTITULAR)'
      'values'
      '  (:IDNUCLEOFAMILIAR, :IDRESPNUCLEO, :IDTITULAR)')
    DeleteSQL.Strings = (
      'delete from CM.NUCLEOFAMILIAR'
      'where'
      '  IDNUCLEOFAMILIAR = :OLD_IDNUCLEOFAMILIAR')
    Left = 1148
    Top = 379
  end
  object QryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ RULE */ RE.IDRESPONSAVEL, PS.NOME'
      'FROM   PESSOA PS,'
      '       RESPONSAVEL RE'
      'WHERE  RE.IDRESPONSAVEL = PS.IDPESSOA'
      'AND    RE.FLGADMPREV    = 1    ')
    ValidateWithMask = True
    Left = 1058
    Top = 573
  end
  object QryBuscaNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  NF.IDNUCLEOFAMILIAR, '
      '  NF.IDRESPNUCLEO, PS.NOME, '
      '  NF.IDTITULAR'
      'FROM'
      '  CM.PESSOA PS,'
      '  CM.NUCLEOFAMILIAR NF'
      'WHERE'
      '  (NF.IDTITULAR    = :IDTITULAR) AND'
      '  (NF.IDRESPNUCLEO = PS.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 671
    Top = 586
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 1253
    Top = 61
  end
  object qryInsResponsavel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = UpdInsResp
    ValidateWithMask = True
    Left = 1040
    Top = 560
  end
  object UpdInsResp: TUpdateSQL
    Left = 567
    Top = 614
  end
  object updsubtipo: TUpdateSQL
    Left = 1134
    Top = 527
  end
  object qryAux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 1293
    Top = 61
  end
  object updplano: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.PLANODEPENDENTE'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  DATACANCEL = :DATACANCEL,'
      '  ID_MOTIVOCANCEL = : ID_MOTIVOCANCEL, '
      '  IDTITULAR = :IDTITULAR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'insert into CM.PLANODEPENDENTE'
      '  (IDPESSOA, IDPLANOPREV, '
      'IDPESSJUR, DATACANCEL, ID_MOTIVOCANCEL, IDTITULAR)'
      'values'
      '  (:IDPESSOA, :IDPLANOPREV, :IDPESSJUR, :DATACANCEL, '
      ':ID_MOTIVOCANCEL, :IDTITULAR)')
    DeleteSQL.Strings = (
      'delete from CM.PLANODEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    Left = 1000
    Top = 154
  end
  object UpdateSQL2: TUpdateSQL
    Left = 1044
    Top = 61
  end
  object wwQuery2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = UpdateSQL2
    ValidateWithMask = True
    Left = 1191
    Top = 61
  end
  object qryTipoRecebedor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPORECEBEDOR,'
      '        DESCRICAO'
      'FROM TIPORECEBEDOR'
      'ORDER BY DESCRICAO')
    Left = 902
    Top = 199
  end
  object dsRecebedor: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebedor
    Left = 564
    Top = 544
  end
  object updRecebedor: TUpdateSQL
    ModifySQL.Strings = (
      'update RESPONSAVEL'
      'set'
      '  FLGADMPREV = :FLGADMPREV,'
      '  FLGIMOBILIARIO = :FLGIMOBILIARIO,'
      '  FLGATIVOFIXO = :FLGATIVOFIXO'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    InsertSQL.Strings = (
      'insert into RESPONSAVEL'
      '  (IDRESPONSAVEL, FLGADMPREV, FLGIMOBILIARIO, FLGATIVOFIXO)'
      'values'
      '  (:IDRESPONSAVEL, :FLGADMPREV, :FLGIMOBILIARIO, :FLGATIVOFIXO)')
    DeleteSQL.Strings = (
      'delete from RESPONSAVEL'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    Left = 832
    Top = 560
  end
  object qryRecebedor: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRESPONSAVEL, FLGADMPREV, FLGIMOBILIARIO, FLGATIVOFIXO'
      'FROM   RESPONSAVEL'
      'WHERE  IDRESPONSAVEL = :IDRESPONSAVEL')
    UpdateObject = updRecebedor
    ValidateWithMask = True
    Left = 819
    Top = 576
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object MSPessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Titular'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'PF.DATANASC'
      'PF.NOMEMAE')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'CPF'
      'Nome'
      'Data de Nascimento'
      'Nome da Mãe')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOAFISICA PF')
    CamposChave.Strings = (
      'P.IDPESSOA')
    Filtro.Strings = (
      'PF.IDPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
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
    Left = 361
    Top = 37
  end
  object qryDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIPODOCPESSOA.IDDOCUMENTO,'
      '  TIPODOCPESSOA.NOMEDOCUMENTO ,'
      '  TIPODOCPESSOA.MASCARA,'
      '  TIPODOCPESSOA.OBRIGAUF ,'
      '  TIPODOCPESSOA.OBRIGAORGAO ,'
      '  TIPODOCPESSOA.OBRIGAEMISSAO ,'
      '  DOCPESSOA.IDPESSOA,'
      '  DOCPESSOA.IDIMAGEM ,'
      '  DOCPESSOA.IDPAIS ,'
      '  DOCPESSOA.IDESTADO ,'
      '  DOCPESSOA.NUMDOCUMENTO,'
      '  DOCPESSOA.ORGAO ,'
      '  DOCPESSOA.DATAEMISSAO,'
      '  TIPODOCPESSOA.FLGOBRIGAVALIDADE,'
      '  DOCPESSOA.DATAVALIDADE,'
      '  '
      '  DOCPESSOA.DTPRIMEIRACNH, '
      '  DOCPESSOA.CATEGCNH,'
      '  TIPODOCPESSOA.OBRIGAPRMHAB, '
      '  TIPODOCPESSOA.OBRIGACATG'
      ''
      ',TIPODOCPESSOA.EXIBEUF   '
      ' ,TIPODOCPESSOA.EXIBEORGAO   '
      ' ,TIPODOCPESSOA.EXIBEEMISSAO   '
      ' ,TIPODOCPESSOA.EXIBEVALIDADE   '
      ' ,TIPODOCPESSOA.EXIBEPRMHAB   '
      ' ,TIPODOCPESSOA.EXIBECATG   '
      ' ,TIPODOCPESSOA.EXIBEPAIS   '
      ' ,TIPODOCPESSOA.OBRIGAPAIS'
      ' ,DOCPESSOA.IDTIPODOCPESSOAXMASC'
      ' ,TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      ''
      'FROM'
      '  DOCPESSOA,'
      '  TIPODOCPESSOA'
      ''
      'WHERE'
      '    ( DOCPESSOA.IDPESSOA            =:IdPessoa )'
      'AND ('
      '    ( TIPODOCPESSOA.FISICAJURIDICA  = :IdFisicaJuridica) OR'
      '    ( TIPODOCPESSOA.FISICAJURIDICA  = '#39'A'#39')'
      '    )'
      'AND (TIPODOCPESSOA.IDDOCUMENTO      = DOCPESSOA.IDDOCUMENTO)')
    UpdateObject = updDocumento
    PictureMasks.Strings = (
      'DATAEMISSAO'#9'#[#]/#[#]/##[##]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 195
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdFisicaJuridica'
        ParamType = ptUnknown
        Value = 'F'
      end>
    object qryDocumentoIDDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
    end
    object qryDocumentoNOMEDOCUMENTO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEDOCUMENTO'
      Size = 30
    end
    object qryDocumentoMASCARA: TStringField
      DisplayWidth = 30
      FieldName = 'MASCARA'
      Size = 30
    end
    object qryDocumentoOBRIGAUF: TStringField
      DisplayWidth = 1
      FieldName = 'OBRIGAUF'
      Size = 1
    end
    object qryDocumentoOBRIGAORGAO: TStringField
      DisplayWidth = 1
      FieldName = 'OBRIGAORGAO'
      Size = 1
    end
    object qryDocumentoOBRIGAEMISSAO: TStringField
      DisplayWidth = 1
      FieldName = 'OBRIGAEMISSAO'
      Size = 1
    end
    object qryDocumentoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryDocumentoIDIMAGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMAGEM'
    end
    object qryDocumentoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
    end
    object qryDocumentoNUMDOCUMENTO: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryDocumentoORGAO: TStringField
      DisplayWidth = 30
      FieldName = 'ORGAO'
      Size = 30
    end
    object qryDocumentoDATAEMISSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAEMISSAO'
    end
    object qryDocumentoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'DOCPESSOA.IDESTADO'
    end
    object qryDocumentoFLGOBRIGAVALIDADE: TStringField
      FieldName = 'FLGOBRIGAVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGOBRIGAVALIDADE'
      FixedChar = True
      Size = 1
    end
    object qryDocumentoDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
    end
    object qryDocumentoCATEGCNH: TStringField
      FieldName = 'CATEGCNH'
      Size = 2
    end
    object qryDocumentoOBRIGAPRMHAB: TStringField
      FieldName = 'OBRIGAPRMHAB'
      Size = 1
    end
    object qryDocumentoOBRIGACATG: TStringField
      FieldName = 'OBRIGACATG'
      Size = 1
    end
    object qryDocumentoDTPRIMEIRACNH: TDateTimeField
      FieldName = 'DTPRIMEIRACNH'
    end
    object qryDocumentoEXIBEUF: TStringField
      FieldName = 'EXIBEUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEUF'
      Size = 2
    end
    object qryDocumentoEXIBEORGAO: TStringField
      FieldName = 'EXIBEORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEORGAO'
      Size = 2
    end
    object qryDocumentoEXIBEEMISSAO: TStringField
      FieldName = 'EXIBEEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEEMISSAO'
      Size = 2
    end
    object qryDocumentoEXIBEVALIDADE: TStringField
      FieldName = 'EXIBEVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEVALIDADE'
      Size = 2
    end
    object qryDocumentoEXIBEPRMHAB: TStringField
      FieldName = 'EXIBEPRMHAB'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPRMHAB'
      Size = 2
    end
    object qryDocumentoEXIBECATG: TStringField
      FieldName = 'EXIBECATG'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBECATG'
      Size = 2
    end
    object qryDocumentoEXIBEPAIS: TStringField
      FieldName = 'EXIBEPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPAIS'
      Size = 2
    end
    object qryDocumentoOBRIGAPAIS: TStringField
      FieldName = 'OBRIGAPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAPAIS'
      Size = 2
    end
    object qryDocumentoIDTIPODOCPESSOAXMASC: TFloatField
      FieldName = 'IDTIPODOCPESSOAXMASC'
      Origin = 'BASEDADOS.DOCPESSOA.IDTIPODOCPESSOAXMASC'
    end
    object qryDocumentoFLGMULTIPLAMASCARA: TStringField
      FieldName = 'FLGMULTIPLAMASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      FixedChar = True
      Size = 1
    end
  end
  object dsDocumento: TwwDataSource
    DataSet = qryDocumento
    Left = 218
    Top = 288
  end
  object updDocumento: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCPESSOA'
      'set'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IDPAIS = :IDPAIS,'
      '  IDESTADO = :IDESTADO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  ORGAO = :ORGAO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAVALIDADE = :DATAVALIDADE,'
      ''
      '  DTPRIMEIRACNH = :DTPRIMEIRACNH, '
      '  CATEGCNH = :CATEGCNH'
      ''
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DOCPESSOA'
      
        '  (IDDOCUMENTO, IDPESSOA, IDIMAGEM, IDPAIS, IDESTADO, NUMDOCUMEN' +
        'TO, ORGAO, '
      '   DATAEMISSAO, DATAVALIDADE, DTPRIMEIRACNH, CATEGCNH)'
      'values'
      
        '  (:IDDOCUMENTO, :IDPESSOA, :IDIMAGEM, :IDPAIS, :IDESTADO, :NUMD' +
        'OCUMENTO, '
      
        '   :ORGAO, :DATAEMISSAO, :DATAVALIDADE, :DTPRIMEIRACNH, :CATEGCN' +
        'H)'
      ''
      ''
      '')
    DeleteSQL.Strings = (
      'delete from DOCPESSOA'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 163
    Top = 352
  end
  object qryRamal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      ' TELCONTATO.IDCONTATO,'
      ' TELCONTATO.IDTELCONTATO,'
      ' TELCONTATO.IDTELEFONE , '
      ' TELCONTATO.RAMAL , '
      ' TELENDPESS.NUMERO ,'
      ' CONTATOPESS.IDPESSOA,'
      ' CONTATOPESS.NOME,'
      ' CONTATOPESS.EMAIL ,'
      ' CONTATOPESS.CARGO ,'
      ' CONTATOPESS.SETOR'
      'FROM CONTATOPESS'
      
        '  JOIN TELCONTATO ON TELCONTATO.IDCONTATO = CONTATOPESS.IDCONTAT' +
        'O'
      
        '  JOIN TELENDPESS ON TELENDPESS.IDTELEFONE = TELCONTATO.IDTELEFO' +
        'NE'
      '  JOIN DEPENTIT   ON DEPENTIT.IDPESSOA = CONTATOPESS.IDPESSOA'
      'WHERE'
      ' ( DEPENTIT.IDTITULAR = :IdTitular )'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updRamal
    ControlType.Strings = (
      'NOME;CustomEdit;dblcContato')
    ValidateWithMask = True
    Left = 815
    Top = 436
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdTitular'
        ParamType = ptUnknown
      end>
    object qryRamalIDCONTATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTATO'
    end
    object qryRamalIDTELCONTATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTELCONTATO'
    end
    object qryRamalIDTELEFONE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTELEFONE'
    end
    object qryRamalRAMAL: TStringField
      DisplayWidth = 20
      FieldName = 'RAMAL'
    end
    object qryRamalNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NUMERO'
      OnValidate = qryRamalNUMEROValidate
    end
    object qryRamalIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryRamalNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object qryRamalEMAIL: TStringField
      DisplayWidth = 40
      FieldName = 'EMAIL'
      Size = 40
    end
    object qryRamalCARGO: TStringField
      DisplayWidth = 30
      FieldName = 'CARGO'
      Size = 30
    end
    object qryRamalSETOR: TStringField
      DisplayWidth = 30
      FieldName = 'SETOR'
      Size = 30
    end
  end
  object updRamal: TUpdateSQL
    ModifySQL.Strings = (
      'update TELCONTATO'
      'set'
      '  RAMAL = :RAMAL'
      'where'
      '  IDTELCONTATO = :OLD_IDTELCONTATO')
    InsertSQL.Strings = (
      'insert into TELCONTATO'
      '  (IDTELCONTATO, IDCONTATO, IDTELEFONE, RAMAL)'
      'values'
      '  (:IDTELCONTATO, :IDCONTATO, :IDTELEFONE, :RAMAL)')
    DeleteSQL.Strings = (
      'delete from TELCONTATO'
      'where'
      '  IDTELCONTATO = :OLD_IDTELCONTATO')
    Left = 375
    Top = 540
  end
  object dsRamal: TwwDataSource
    DataSet = qryRamal
    Left = 807
    Top = 420
  end
  object qryImagensDoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IMAGENS.IDIMAGEM, '
      ' IMAGENS.IMAGEM , '
      ' IMAGENS.DESCRIMAGEM'
      'FROM IMAGENS, DOCPESSOA ,  PESSOA'
      'WHERE '
      ' ( PESSOA.IDPESSOA =:IdPessoa )'
      ' AND'
      ' ( DOCPESSOA.IDIMAGEM = IMAGENS.IDIMAGEM )'
      ' AND'
      ' ( DOCPESSOA.IDPESSOA = PESSOA.IDPESSOA )')
    UpdateObject = updImagensDoc
    ValidateWithMask = True
    Left = 1096
    Top = 445
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryImagensDocIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'IMAGENS.IDIMAGEM'
    end
    object qryImagensDocIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryImagensDocDESCRIMAGEM: TStringField
      FieldName = 'DESCRIMAGEM'
      Origin = 'IMAGENS.DESCRIMAGEM'
      Size = 50
    end
  end
  object updImagensDoc: TUpdateSQL
    ModifySQL.Strings = (
      'update IMAGENS'
      'set'
      '  IMAGEM = :IMAGEM,'
      '  DESCRIMAGEM = :DESCRIMAGEM'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    InsertSQL.Strings = (
      'insert into IMAGENS'
      '  (IDIMAGEM, IMAGEM, DESCRIMAGEM)'
      'values'
      '  (:IDIMAGEM, :IMAGEM, :DESCRIMAGEM)')
    DeleteSQL.Strings = (
      'delete from IMAGENS'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    Left = 1145
    Top = 466
  end
  object dsImagensDoc: TwwDataSource
    DataSet = qryImagensDoc
    Left = 247
    Top = 466
  end
  object Pessoa: TPessoa
    MudaCaption = True
    TipoPessoa = tpFisica
    SubTipo = stBanco
    MostraFoto = True
    UsaPessoaFisica = False
    FormControls.PainelMestre = pnlMestre
    FormControls.PainelFoto = pnlFoto
    FormControls.LabelNome = lblNumSequencia
    FormControls.CampoDocum = qryNUMDOCUMENTO
    SaveModuloRespon = False
    ObrigaDocumento = True
    OnChangePessoa = PessoaChangePessoa
    OnChangeSubtipo = PessoaChangeSubtipo
    Left = 363
    Top = 3
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPODOCPESSOA.IDDOCUMENTO , '
      ' TIPODOCPESSOA.NOMEDOCUMENTO , '
      ' TIPODOCPESSOA.IDREGRA , '
      ' TIPODOCPESSOA.FISICAJURIDICA , '
      ' TIPODOCPESSOA.MASCARA , '
      ' TIPODOCPESSOA.DOCCHAVE , '
      ' TIPODOCPESSOA.OBRIGAUF , '
      ' TIPODOCPESSOA.OBRIGAORGAO , '
      ' TIPODOCPESSOA.OBRIGAEMISSAO,'
      ' TIPODOCPESSOA.FLGOBRIGAVALIDADE,'
      ' TIPODOCPESSOA.OBRIGAPRMHAB,'
      ' TIPODOCPESSOA.OBRIGACATG'
      ' ,TIPODOCPESSOA.EXIBEUF   '
      ' ,TIPODOCPESSOA.EXIBEORGAO   '
      ' ,TIPODOCPESSOA.EXIBEEMISSAO   '
      ' ,TIPODOCPESSOA.EXIBEVALIDADE   '
      ' ,TIPODOCPESSOA.EXIBEPRMHAB   '
      ' ,TIPODOCPESSOA.EXIBECATG   '
      ' ,TIPODOCPESSOA.EXIBEPAIS   '
      ' ,TIPODOCPESSOA.OBRIGAPAIS'
      ' ,TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      'FROM TIPODOCPESSOA'
      'WHERE '
      '   ( TIPODOCPESSOA.FISICAJURIDICA =:IdFisicaJuridica ) OR'
      '   ( TIPODOCPESSOA.FISICAJURIDICA = '#39'A'#39')')
    ValidateWithMask = True
    Left = 377
    Top = 596
    ParamData = <
      item
        DataType = ftString
        Name = 'IdFisicaJuridica'
        ParamType = ptUnknown
      end>
    object qryTipoDocIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDDOCUMENTO'
    end
    object qryTipoDocNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
    object qryTipoDocIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDREGRA'
    end
    object qryTipoDocFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FISICAJURIDICA'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.MASCARA'
      FixedChar = True
      Size = 30
    end
    object qryTipoDocDOCCHAVE: TStringField
      FieldName = 'DOCCHAVE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.DOCCHAVE'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAUF: TStringField
      FieldName = 'OBRIGAUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAUF'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAORGAO: TStringField
      FieldName = 'OBRIGAORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAORGAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAEMISSAO: TStringField
      FieldName = 'OBRIGAEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAEMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocFLGOBRIGAVALIDADE: TStringField
      FieldName = 'FLGOBRIGAVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGOBRIGAVALIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAPRMHAB: TStringField
      FieldName = 'OBRIGAPRMHAB'
      Size = 1
    end
    object qryTipoDocOBRIGACATG: TStringField
      FieldName = 'OBRIGACATG'
      Size = 1
    end
    object qryTipoDocEXIBEUF: TStringField
      FieldName = 'EXIBEUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEUF'
      Size = 2
    end
    object qryTipoDocEXIBEORGAO: TStringField
      FieldName = 'EXIBEORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEORGAO'
      Size = 2
    end
    object qryTipoDocEXIBEEMISSAO: TStringField
      FieldName = 'EXIBEEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEEMISSAO'
      Size = 2
    end
    object qryTipoDocEXIBEVALIDADE: TStringField
      FieldName = 'EXIBEVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEVALIDADE'
      Size = 2
    end
    object qryTipoDocEXIBEPRMHAB: TStringField
      FieldName = 'EXIBEPRMHAB'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPRMHAB'
      Size = 2
    end
    object qryTipoDocEXIBECATG: TStringField
      FieldName = 'EXIBECATG'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBECATG'
      Size = 2
    end
    object qryTipoDocEXIBEPAIS: TStringField
      FieldName = 'EXIBEPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPAIS'
      Size = 2
    end
    object qryTipoDocOBRIGAPAIS: TStringField
      FieldName = 'OBRIGAPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAPAIS'
      Size = 2
    end
    object qryTipoDocFLGMULTIPLAMASCARA: TStringField
      FieldName = 'FLGMULTIPLAMASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      FixedChar = True
      Size = 1
    end
  end
  object qryTelefone: TwwQuery
    CachedUpdates = True
    AfterInsert = qryTelefoneAfterInsert
    OnCalcFields = qryTelefoneCalcFields
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      ' TELENDPESS.IDTELEFONE , '
      ' DEPENTIT.IDPESSOA , '
      ' TELENDPESS.IDENDERECO, '
      ' TELENDPESS.DDI ,'
      ' TELENDPESS.DDD ,'
      ' TELENDPESS.NUMERO , '
      ' TELENDPESS.TIPO'
      'FROM TELENDPESS'
      '  JOIN DEPENTIT ON DEPENTIT.IDPESSOA = TELENDPESS.IDPESSOA'
      'WHERE'
      '  ( DEPENTIT.IDTITULAR = :IdTitular )'
      ''
      ' '
      ' ')
    UpdateObject = updTelefone
    ValidateWithMask = True
    Left = 1035
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdTitular'
        ParamType = ptUnknown
      end>
    object qryTelefoneDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      Origin = 'TELENDPESS.DDD'
      Size = 5
    end
    object qryTelefoneDDI: TStringField
      DisplayWidth = 3
      FieldName = 'DDI'
      Origin = 'TELENDPESS.DDI'
      Size = 3
    end
    object qryTelefoneTComercial: TStringField
      DisplayLabel = 'Com'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TComercial'
      Calculated = True
    end
    object qryTelefoneTParticular: TStringField
      DisplayLabel = 'Part'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TParticular'
      Calculated = True
    end
    object qryTelefoneTFax: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TFax'
      Calculated = True
    end
    object qryTelefoneTCelular: TStringField
      DisplayLabel = 'Cel'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TCelular'
      Calculated = True
    end
    object qryTelefoneTRecado: TStringField
      DisplayLabel = 'Rec'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TRecado'
      Calculated = True
    end
    object qryTelefoneIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'TELENDPESS.IDTELEFONE'
      Visible = False
    end
    object qryTelefoneIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ENDPESS.IDPESSOA'
      Visible = False
    end
    object qryTelefoneIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Origin = 'TELENDPESS.IDENDERECO'
      Visible = False
    end
    object qryTelefoneTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TELENDPESS.TIPO'
      Visible = False
      Size = 5
    end
    object qryTelefoneNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'TELENDPESS.NUMERO'
    end
  end
  object updTelefone: TUpdateSQL
    ModifySQL.Strings = (
      'update TELENDPESS'
      'set'
      '  DDI = :DDI,'
      '  DDD = :DDD,'
      '  NUMERO = :NUMERO,'
      '  TIPO = :TIPO,'
      '  IDENDERECO = :IDENDERECO'
      'where'
      '  IDTELEFONE = :OLD_IDTELEFONE'
      ''
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into TELENDPESS'
      '  (IDPESSOA, IDTELEFONE, IDENDERECO, DDI,  DDD,  NUMERO,  TIPO)'
      'values'
      
        '  (:IDPESSOA, :IDTELEFONE, :IDENDERECO, :DDI, :DDD, :NUMERO, :TI' +
        'PO)')
    DeleteSQL.Strings = (
      'delete from TELENDPESS'
      'where'
      '  IDTELEFONE = :OLD_IDTELEFONE')
    Left = 1059
    Top = 190
  end
  object dsTelefone: TwwDataSource
    AutoEdit = False
    DataSet = qryTelefone
    OnDataChange = dsTelefoneDataChange
    Left = 1003
    Top = 188
  end
  object dsSubTipo: TwwDataSource
    AutoEdit = False
    Left = 1109
    Top = 525
  end
  object qrySubTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA , BANCO.NUMBANCO'
      'FROM BANCO'
      'WHERE ( BANCO.IDPESSOA =:IdPessoa )')
    UpdateObject = updsubtipo
    ValidateWithMask = True
    Left = 1126
    Top = 535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object dsEndereco: TwwDataSource
    AutoEdit = False
    DataSet = qryEndereco
    Left = 1090
    Top = 372
  end
  object updEndereco: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  NOME = :NOME,'
      '  CEP = :CEP'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      
        '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, COMPLEME' +
        'NTO, BAIRRO, '
      '   CIDADE, NOME, CEP)'
      'values'
      
        '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :NUMERO, :CO' +
        'MPLEMENTO, '
      '   :BAIRRO, :CIDADE, :NOME, :CEP)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 1007
    Top = 380
  end
  object qryEndereco: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
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
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS'
      'FROM'
      '  ENDPESS,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P'
      'WHERE'
      ' (E.IDPAIS = P.IDPAIS(+)) AND'
      ' (E.IDESTADO(+) = C.IDESTADO) AND'
      ' (C.IDCIDADES(+) = ENDPESS.IDCIDADES ) AND'
      ' ( ENDPESS.IDPESSOA = :IdPessoa )'
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 1042
    Top = 428
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryEnderecoNOME: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'ENDPESS.NOME'
      Size = 40
    end
    object qryEnderecoNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Origin = 'ENDPESS.NUMERO'
      Size = 8
    end
    object qryEnderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 10
      FieldName = 'COMPLEMENTO'
      Origin = 'ENDPESS.COMPLEMENTO'
      Size = 200
    end
    object qryEnderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 10
      FieldName = 'BAIRRO'
      Origin = 'ENDPESS.BAIRRO'
    end
    object qryEnderecoCEP: TStringField
      DisplayWidth = 10
      FieldName = 'CEP'
      Origin = 'ENDPESS.CEP'
      Size = 8
    end
    object qryEnderecoNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'NOMECIDADE'
      Size = 50
    end
    object qryEnderecoNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryEnderecoNOMEPAIS: TStringField
      DisplayLabel = 'Pais'
      DisplayWidth = 20
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object qryEnderecoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 10
      FieldName = 'CIDADE'
      Origin = 'ENDPESS.CIDADE'
      Visible = False
    end
    object qryEnderecoIDPESSOA: TFloatField
      DisplayWidth = 15
      FieldName = 'IDPESSOA'
      Origin = 'ENDPESS.IDPESSOA'
      Visible = False
    end
    object qryEnderecoIDENDERECO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDENDERECO'
      Origin = 'ENDPESS.IDENDERECO'
      Visible = False
    end
    object qryEnderecoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'ENDPESS.IDCIDADES'
      Visible = False
    end
    object qryEnderecoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
  end
  object qryContato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   CONTATOPESS.IDCONTATO , '
      '   CONTATOPESS.IDPESSOA ,'
      '   CONTATOPESS.IDENDERECO , '
      '   CONTATOPESS.NOME , '
      '   CONTATOPESS.EMAIL , '
      '   CONTATOPESS.CARGO , '
      '   CONTATOPESS.SETOR,'
      '   CONTATOPESS.NASCIMENTO,'
      '   CONTATOPESS.OBS'
      'FROM CONTATOPESS'
      '  JOIN DEPENTIT ON DEPENTIT.IDPESSOA = CONTATOPESS.IDPESSOA'
      'WHERE '
      '  ( DEPENTIT.IDTITULAR =:IdTitular )'
      ' '
      ' '
      ' ')
    UpdateObject = updContato
    ValidateWithMask = True
    Left = 688
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdTitular'
        ParamType = ptUnknown
      end>
    object qryContatoIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
      Origin = 'CONTATOPESS.IDCONTATO'
    end
    object qryContatoIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Origin = 'CONTATOPESS.IDENDERECO'
    end
    object qryContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'CONTATOPESS.EMAIL'
      Size = 40
    end
    object qryContatoCARGO: TStringField
      FieldName = 'CARGO'
      Origin = 'CONTATOPESS.CARGO'
      Size = 30
    end
    object qryContatoSETOR: TStringField
      FieldName = 'SETOR'
      Origin = 'CONTATOPESS.SETOR'
      Size = 30
    end
    object qryContatoTelefone: TStringField
      FieldKind = fkLookup
      FieldName = 'Telefone'
      LookupDataSet = qryRamal
      LookupKeyFields = 'IDCONTATO'
      LookupResultField = 'NUMERO'
      KeyFields = 'IDCONTATO'
      Lookup = True
    end
    object qryContatoNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
      Origin = 'CONTATOPESS.NASCIMENTO'
    end
    object qryContatoOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'CONTATOPESS.OBS'
      BlobType = ftMemo
      Size = 500
    end
    object qryContatoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CONTATOPESS.NOME'
      Size = 50
    end
    object qryContatoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.ENDPESS".IDPESSOA'
    end
  end
  object dsContato: TwwDataSource
    AutoEdit = False
    DataSet = qryContato
    Left = 804
    Top = 492
  end
  object updContato: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTATOPESS'
      'set'
      '  NOME = :NOME,'
      '  EMAIL = :EMAIL,'
      '  CARGO = :CARGO,'
      '  SETOR = :SETOR,'
      '  NASCIMENTO = :NASCIMENTO,'
      '  OBS = :OBS'
      'where'
      '  IDCONTATO = :OLD_IDCONTATO')
    InsertSQL.Strings = (
      'insert into CONTATOPESS'
      
        '  (IDCONTATO, IDPESSOA, NOME, EMAIL, CARGO, SETOR, NASCIMENTO, O' +
        'BS)'
      'values'
      
        '  (:IDCONTATO, :IDPESSOA, :NOME, :EMAIL, :CARGO, :SETOR, :NASCIM' +
        'ENTO, '
      '   :OBS)')
    DeleteSQL.Strings = (
      'delete from CONTATOPESS'
      'where'
      '  IDCONTATO = :OLD_IDCONTATO')
    Left = 449
    Top = 596
  end
  object qryImagem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IMAGENS.IDIMAGEM , '
      ' IMAGENS.IMAGEM , '
      ' IMAGENS.DESCRIMAGEM'
      'FROM IMAGENS, PESSOA'
      'WHERE '
      ' (PESSOA.IDPESSOA = :IdPessoa)'
      ' AND'
      '( IMAGENS.IDIMAGEM = PESSOA.IDIMAGEM )'
      '')
    UpdateObject = updImagem
    ValidateWithMask = True
    Left = 1226
    Top = 491
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryImagemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'IMAGENS.IDIMAGEM'
    end
    object qryImagemIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryImagemDESCRIMAGEM: TStringField
      FieldName = 'DESCRIMAGEM'
      Origin = 'IMAGENS.DESCRIMAGEM'
      Size = 50
    end
  end
  object dsImagem: TwwDataSource
    DataSet = qryImagem
    OnDataChange = dsImagemDataChange
    Left = 1212
    Top = 480
  end
  object updImagem: TUpdateSQL
    ModifySQL.Strings = (
      'update IMAGENS'
      'set'
      '  IMAGEM = :IMAGEM,'
      '  DESCRIMAGEM = :DESCRIMAGEM'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    InsertSQL.Strings = (
      'insert into IMAGENS'
      '  (IDIMAGEM, IMAGEM, DESCRIMAGEM)'
      'values'
      '  (:IDIMAGEM, :IMAGEM, :DESCRIMAGEM)')
    DeleteSQL.Strings = (
      'delete from IMAGENS'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    Left = 1240
    Top = 478
  end
  object qryEstado: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  E.IDESTADO,'
      '  E.CODESTADO , '
      '  E.NOMEESTADO , '
      '  P.IDPAIS , '
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL'
      'FROM '
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY E.NOMEESTADO')
    ValidateWithMask = True
    Left = 443
    Top = 545
    object qryEstadoCODESTADO: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.ESTADO.IDESTADO'
      Visible = False
    end
    object qryEstadoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PAIS.IDPAIS'
      Visible = False
    end
    object qryEstadoNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Visible = False
      Size = 30
    end
    object qryEstadoMASCARACPOSTAL: TStringField
      FieldName = 'MASCARACPOSTAL'
      Origin = 'BASEDADOS.PAIS.MASCARACPOSTAL'
      Visible = False
    end
  end
  object qryDepBen: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDepBenBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PE.NOME,'
      ' DT.IDTITULAR,'
      ' DT.IDPESSOA,'
      ' DT.IDDEPENDENCIA,'
      ' DT.NUMSEQUENCIA,'
      ' DT.FLGDESIGNADO,'
      ' DT.FLGDEPLEGAL,'
      ' DT.FLGCONTAIMPOSTOR,'
      ' DT.FLGCONTASALARIOF,'
      ' DT.DATACADASTRO,'
      ' PF.DATANASC,'
      ' DP.DESCRICAO AS PARENTESCO,'
      ' DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                     '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                     '#39'D'#39', '#39'Divorciado(a)'#39','
      '                     '#39'E'#39', '#39'Desquitado(a)'#39','
      '                     '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                     '#39'V'#39', '#39'Viúvo(a)'#39','
      '                     '#39'M'#39', '#39'Marital'#39','
      '                     '#39'P'#39', '#39'Separado(a)'#39','
      '                     '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      ' PF.SEXO,'
      ' PF.NUMDEPIRRF,'
      ' DT.INICIOIMPOSTOR,'
      ' DT.FIMIMPOSTOR '
      'FROM'
      ' PESSOA        PE,'
      ' PESSOAFISICA  PF,'
      ' DEPENDENTE    DE,'
      ' DEPENTIT      DT,'
      ' DEPENTIT      DT2,'
      ' DEPEN         DP'
      'WHERE (DT2.IDTITULAR     =   :IDTITULAR     )'
      'AND   (DT.IDTITULAR      = DT2.IDPESSOA     )'
      'AND   (DT.IDTITULAR      <> DT2.IDTITULAR   )'
      'AND   (PF.IDPESSOA      =   PE.IDPESSOA     )'
      'AND   (DE.IDPESSOA      =   PF.IDPESSOA     )'
      'AND   (DT.IDPESSOA      =   PE.IDPESSOA     )'
      'AND   (DT.IDDEPENDENCIA <> '#39'PRP'#39'            )'
      'AND   (DT.IDDEPENDENCIA =   DP.IDDEPENDENCIA)'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDepBen
    ValidateWithMask = True
    Left = 750
    Top = 511
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object dsDepBen: TwwDataSource
    DataSet = qryDepBen
    Left = 761
    Top = 469
  end
  object updDepBen: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  NUMSEQUENCIA = :NUMSEQUENCIA,'
      '  FLGDESIGNADO = :FLGDESIGNADO,'
      '  FLGDEPLEGAL = :FLGDEPLEGAL,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  INICIOIMPOSTOR = :INICIOIMPOSTOR,'
      '  FIMIMPOSTOR = :FIMIMPOSTOR,'
      '  DATACADASTRO = :DATACADASTRO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      
        '  (IDTITULAR, IDPESSOA, IDDEPENDENCIA, NUMSEQUENCIA, FLGDESIGNAD' +
        'O, FLGDEPLEGAL, '
      
        '   FLGCONTAIMPOSTOR, FLGCONTASALARIOF, INICIOIMPOSTOR, FIMIMPOST' +
        'OR, DATACADASTRO)'
      'values'
      
        '  (:IDTITULAR, :IDPESSOA, :IDDEPENDENCIA, :NUMSEQUENCIA, :FLGDES' +
        'IGNADO,'
      
        '   :FLGDEPLEGAL, :FLGCONTAIMPOSTOR, :FLGCONTASALARIOF, :INICIOIM' +
        'POSTOR,'
      '   :FIMIMPOSTOR, :DATACADASTRO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 728
    Top = 475
  end
  object updDepBenPessoa: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDPESSOA, NOME, NUMDOCUMENTO, TIPO, RAZAOSOCIAL, IDENDCORRESP' +
        ', '
      'IDENDCOMERCIAL, '
      '   IDENDENTREGA, IDENDRESIDENCIAL, IDENDCOBRANCA)'
      'values'
      '  (:IDPESSOA, :NOME, :NUMDOCUMENTO, :TIPO, :RAZAOSOCIAL, '
      ':IDENDCORRESP, '
      '   :IDENDCOMERCIAL, :IDENDENTREGA, :IDENDRESIDENCIAL, '
      ':IDENDCOBRANCA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 1140
    Top = 189
  end
  object qryDepBenPessoa: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnUpdateError = qryDepBenPessoaUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  D.IDTITULAR, PES.IDPESSOA,'
      '                PES.NOME,'
      '                PES.NUMDOCUMENTO,'
      '                PES.TIPO,'
      '                PES.RAZAOSOCIAL,'
      '                PES.IDENDCORRESP,'
      '                PES.IDENDCOMERCIAL,'
      '                PES.IDENDENTREGA,'
      '                PES.IDENDRESIDENCIAL,'
      '                PES.IDENDCOBRANCA,'
      '                0 as FORCA_UPDATE'
      'FROM      PESSOA PES,'
      '          DEPENTIT D,'
      '          DEPENTIT DT2'
      'WHERE   (DT2.IDTITULAR = :IDPESSOA)'
      'AND     (D.IDTITULAR      = DT2.IDPESSOA     )'
      'AND     (D.IDTITULAR      <> DT2.IDTITULAR   )'
      'AND     (PES.IDPESSOA = D.IDPESSOA)'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDepBenPessoa
    ValidateWithMask = True
    Left = 1125
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDepBenPessoa: TwwDataSource
    AutoEdit = False
    DataSet = qryDepBenPessoa
    Left = 1108
    Top = 186
  end
  object updDepBenPF: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDPAIS = :IDPAIS,'
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
      '  FLGMOLESTIAGRAVE = :FLGMOLESTIAGRAVE,'
      '  DATAMOLESTIAGRAVE = :DATAMOLESTIAGRAVE,'
      '  IDGRINSTR = :IDGRINSTR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDPESSOA, IDPAIS, NOMEPAI, NOMEMAE, DATAMORTE, DATANASC, SEXO' +
        ', '
      'TIPOSANG, '
      '   ESTCIVIL, NUMDEPIRRF, NUMDEPSALF, NUMDEPTOT, FLGISENTOIRRF, '
      'FLGMOLESTIAGRAVE, '
      '   DATAMOLESTIAGRAVE, IDGRINSTR)'
      'values'
      
        '  (:IDPESSOA, :IDPAIS, :NOMEPAI, :NOMEMAE, :DATAMORTE, :DATANASC' +
        ', '
      ':SEXO, '
      '   :TIPOSANG, :ESTCIVIL, :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT, '
      ':FLGISENTOIRRF, '
      '   :FLGMOLESTIAGRAVE, :DATAMOLESTIAGRAVE, :IDGRINSTR)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    Left = 737
    Top = 419
  end
  object qryDepBenPF: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDepBenPFBeforePost
    AfterScroll = qryDepBenPFAfterScroll
    OnUpdateError = qryDepBenPFUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DP.IDTITULAR,'
      '        PF.IDPESSOA,'
      '        PF.IDPAIS,'
      #9'PF.NOMEPAI,'
      '        PF.EMAILFUNCEF,'
      '                PF.NOMEMAE,'
      '                PF.DATAMORTE,'
      '                PF.DATANASC,'
      '                PF.SEXO,'
      #9'PF.TIPOSANG,'
      '        PF.ESTCIVIL,'
      '        PF.NUMDEPIRRF,'
      '        PF.NUMDEPSALF,'
      '        PF.NUMDEPTOT,'
      '        PF.FLGISENTOIRRF,'
      '        PF.FLGMOLESTIAGRAVE,'
      '        PF.DATAMOLESTIAGRAVE ,'
      '        PF.IDGRINSTR,'
      '        0 as FORCA_UPDATE'
      'FROM PESSOAFISICA PF, DEPENTIT DP, DEPENTIT DT2'
      'WHERE  (DT2.IDTITULAR = :IDPESSOA)'
      'AND     (DP.IDTITULAR      = DT2.IDPESSOA     )'
      'AND     (DP.IDTITULAR      <> DT2.IDTITULAR   )'
      'AND     (PF.IDPESSOA = DP.IDPESSOA)'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDepBenPF
    ValidateWithMask = True
    Left = 720
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDepBenPF: TwwDataSource
    AutoEdit = False
    DataSet = qryDepBenPF
    Left = 750
    Top = 406
  end
  object updDepBenDepen: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENDENTE'
      'set'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE,'
      '  FLGDESIGNADO = :FLGDESIGNADO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENDENTE'
      '  (IDPESSOA, IDSITDEPENDENTE, FLGDESIGNADO)'
      'values'
      '  (:IDPESSOA, :IDSITDEPENDENTE, :FLGDESIGNADO)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 1214
    Top = 598
  end
  object qryDepBenDepen: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDepBenDepenBeforePost
    OnUpdateError = qryDepBenDepenUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DP.IDTITULAR, D.IDPESSOA,'
      '                D.IDSITDEPENDENTE,'
      '                D.FLGDESIGNADO,'
      '                0 as FORCA_UPDATE'
      'FROM      DEPENDENTE D,'
      '                DEPENTIT DP, DEPENTIT DT2'
      'WHERE   (DT2.IDTITULAR = :IDPESSOA)'
      'AND     (DP.IDTITULAR      = DT2.IDPESSOA     )'
      'AND     (DP.IDTITULAR      <> DT2.IDTITULAR   )'
      'AND        (DP.IDPESSOA = D.IDPESSOA) '
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDepBenDepen
    ValidateWithMask = True
    Left = 1225
    Top = 612
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDepBenDepen: TwwDataSource
    AutoEdit = False
    DataSet = qryDepBenDepen
    Left = 1241
    Top = 600
  end
  object qryDependencia2: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE (IDDEPENDENCIA <> '#39'PRP'#39')'
      'AND (IDDEPENDENCIA <> '#39'OUT'#39')'
      'ORDER BY DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 832
    Top = 159
  end
  object qryBciario: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' BB.IDPESSJUR,'
      ' BB.IDPLANOPREV,'
      ' BB.IDTITULAR,'
      ' BB.IDSITBENEFICIO,'
      ' BB.SEQPROPOSTA,'
      ' BB.IDPESSOA,'
      ' BB.IDBENEFICIO,'
      ' BB.NUMEROPROCESSO,'
      ' BP.IDREGRABENEFICIA,'
      ' BF.VALORBASE1,'
      ' BF.VALORBASE2,'
      ' BF.VALORBASE3,'
      ' BB.DATAINICIOFUND,'
      ' BB.DATAINICIO,'
      ' BB.DATAFINAL,'
      ' BB.DATAFINALPREVISTA,'
      ' EL.DATADEMISSAO,'
      ' BB.FLGTIPOINSS,'
      ' BB.VALORATUAL,'
      ' BB.VALORTOTAL,'
      ' BB.VALORCOTAS,'
      ' BB.FLGDATAPREVISTA,'
      ' BB.OBSERVACAO  --SIG25312'
      'FROM'
      ' ELEGPATRO       EL,'
      ' BENEFBFCIARIO   BB,'
      ' BENEFPLANPREV   BP,'
      ' BENEFPLANOPART  BF'
      'WHERE'
      '    (BB.IDPESSJUR      = :IDPESSJUR )'
      'AND (BB.IDPLANOPREV    = :IDPLANOPREV )'
      'AND (BB.IDTITULAR      = :IDTITULAR )'
      'AND (BB.SEQPROPOSTA    = :SEQPROPOSTA )'
      'AND (BB.IDSITBENEFICIO = 1)'
      'AND (EL.IDPESSOA       = BB.IDTITULAR   )'
      'AND (BP.IDPLANOPREV    = BB.IDPLANOPREV )'
      'AND (BP.IDBENEFICIO    = BB.IDBENEFICIO )'
      'AND (BF.IDPESSJUR      = BB.IDPESSJUR   )'
      'AND (BF.SEQPROPOSTA    = BB.SEQPROPOSTA )'
      'AND (BF.IDPLANOPREV    = BB.IDPLANOPREV )'
      'AND (BF.IDPESSOA       = BB.IDTITULAR   )'
      'AND (BF.IDBENEFICIO    = BB.IDBENEFICIO )'
      '')
    UpdateObject = updBciario
    ValidateWithMask = True
    Left = 1221
    Top = 431
    ParamData = <
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryBciarioIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
    end
    object qryBciarioIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
    end
    object qryBciarioIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDTITULAR'
    end
    object qryBciarioIDSITBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDSITBENEFICIO'
    end
    object qryBciarioSEQPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.SEQPROPOSTA'
    end
    object qryBciarioIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
    end
    object qryBciarioIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDBENEFICIO'
    end
    object qryBciarioNUMEROPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.NUMEROPROCESSO'
    end
    object qryBciarioIDREGRABENEFICIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRABENEFICIA'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRABENEFICIA'
    end
    object qryBciarioVALORBASE1: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
      Origin = 'BASEDADOS.BENEFPLANOPART.VALORBASE1'
    end
    object qryBciarioVALORBASE2: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
      Origin = 'BASEDADOS.BENEFPLANOPART.VALORBASE2'
    end
    object qryBciarioVALORBASE3: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
      Origin = 'BASEDADOS.BENEFPLANOPART.VALORBASE3'
    end
    object qryBciarioDATAINICIOFUND: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIOFUND'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIOFUND'
    end
    object qryBciarioDATAINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIO'
    end
    object qryBciarioDATAFINAL: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAFINAL'
    end
    object qryBciarioDATAFINALPREVISTA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFINALPREVISTA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAFINALPREVISTA'
    end
    object qryBciarioDATADEMISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATADEMISSAO'
      Origin = 'BASEDADOS.ELEGPATRO.DATADEMISSAO'
    end
    object qryBciarioFLGTIPOINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOINSS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGTIPOINSS'
    end
    object qryBciarioVALORATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORATUAL'
    end
    object qryBciarioVALORTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORTOTAL'
    end
    object qryBciarioVALORCOTAS: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.VALORCOTAS'
    end
    object qryBciarioFLGDATAPREVISTA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGDATAPREVISTA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGDATAPREVISTA'
    end
  end
  object dsBciario: TDataSource
    DataSet = qryBciario
    Left = 1205
    Top = 415
  end
  object updBciario: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (IDSITBENEFICIO, DATAFINALPREVISTA)'
      'values'
      '  (:IDSITBENEFICIO, :DATAFINALPREVISTA)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 1229
    Top = 415
  end
  object qryGrau: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDGRINSTR, DESCRICAO'
      'FROM'
      '  GRINSTR'
      'ORDER BY'
      '  IDGRINSTR')
    ValidateWithMask = True
    Left = 949
    Top = 198
  end
  object qryTRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 1165
    Top = 124
  end
  object qryPais: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPAIS, P.NOMEPAIS, P.CODINTERNACIONAL,'
      
        '       CAST(P.NOMENACIONALIDADE || '#39'  ('#39' ||P.NOMEPAIS|| '#39')'#39' AS V' +
        'ARCHAR2(65)) AS NOMENACIONALIDADE'
      '  FROM PAIS P'
      ' WHERE P.CODINTERNACIONAL IS NOT NULL'
      ' ORDER BY /*P.NOMEPAIS*/  P.NOMENACIONALIDADE'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 748
    Top = 606
    object qryPaisIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PAIS.IDPAIS'
    end
    object qryPaisNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
    object qryPaisCODINTERNACIONAL: TStringField
      FieldName = 'CODINTERNACIONAL'
      Origin = 'BASEDADOS.PAIS.CODINTERNACIONAL'
      Size = 3
    end
    object qryPaisNOMENACIONALIDADE: TStringField
      DisplayLabel = 'Nacionalidade'
      DisplayWidth = 30
      FieldName = 'NOMENACIONALIDADE'
      Origin = 'BASEDADOS.PAIS.NOMENACIONALIDADE'
      Size = 30
    end
  end
  object qryGlobal: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DOCPFISICA  FROM PARAMGLOBAL')
    Left = 832
    Top = 60
    object qryGlobalDOCPFISICA: TFloatField
      FieldName = 'DOCPFISICA'
      Origin = 'BASEDADOS.PARAMGLOBAL.DOCPFISICA'
    end
  end
  object Updlerdocumento: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCPESSOA'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DOCPESSOA'
      '  (IDDOCUMENTO, IDPESSOA, NUMDOCUMENTO)'
      'values'
      '  (:IDDOCUMENTO, :IDPESSOA, :NUMDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from DOCPESSOA'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 709
    Top = 508
  end
  object qrylerdocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM DOCPESSOA'
      'WHERE IDPESSOA =  :IDPESSOA'
      '  AND IDDOCUMENTO  = :IDDOCUMENTO'
      ' ')
    UpdateObject = Updlerdocumento
    ValidateWithMask = True
    Left = 754
    Top = 547
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrylerdocumentoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.DOCPESSOA.IDDOCUMENTO'
    end
    object qrylerdocumentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.DOCPESSOA.IDPESSOA'
    end
    object qrylerdocumentoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.DOCPESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qrylerdocumentoORGAO: TStringField
      FieldName = 'ORGAO'
      Origin = 'BASEDADOS.DOCPESSOA.ORGAO'
      Size = 30
    end
    object qrylerdocumentoIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'BASEDADOS.DOCPESSOA.IDIMAGEM'
    end
    object qrylerdocumentoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.DOCPESSOA.IDPAIS'
    end
    object qrylerdocumentoUF: TStringField
      FieldName = 'UF'
      Origin = 'BASEDADOS.DOCPESSOA.UF'
      FixedChar = True
      Size = 3
    end
    object qrylerdocumentoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.DOCPESSOA.DATAEMISSAO'
    end
    object qrylerdocumentoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.DOCPESSOA.IDESTADO'
    end
    object qrylerdocumentoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.DOCPESSOA.TRGDTINCLUSAO'
    end
    object qrylerdocumentoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.DOCPESSOA.TRGUSERINCLUSAO'
      Size = 30
    end
    object qrylerdocumentoDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
      Origin = 'BASEDADOS.DOCPESSOA.DATAVALIDADE'
    end
  end
  object qryinseredocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into DOCPESSOA'
      '  (IDDOCUMENTO, IDPESSOA, NUMDOCUMENTO)'
      'values'
      '  (:IDDOCUMENTO, :IDPESSOA, :NUMDOCUMENTO)'
      '')
    ValidateWithMask = True
    Left = 645
    Top = 532
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryParamPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARAM, DESCRICAO, TIPO, VALIDACAO'
      'FROM PARAMFLAGPESSOA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 299
    Top = 538
  end
  object dsOutrasInforms: TwwDataSource
    DataSet = qryOutrasInforms
    Left = 1056
    Top = 487
  end
  object qryOutrasInforms: TwwQuery
    CachedUpdates = True
    BeforePost = qryOutrasInformsBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSOA, PP.IDPARAM, PP.DATAINICIO, PP.DATAFIM, PP.VA' +
        'LOR,'
      '       PF.DESCRICAO, PF.TIPO, PF.VALIDACAO'
      'FROM PESSOAPARAM PP, PARAMFLAGPESSOA PF'
      'WHERE  PP.IDPESSOA = :IdPessoa AND'
      '       PP.IDPARAM  = PF.IDPARAM'
      'ORDER BY PF.DESCRICAO')
    UpdateObject = updOutrasInforms
    ValidateWithMask = True
    Left = 1046
    Top = 503
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
      '  DATAFIM = :DATAFIM'
      'where'
      '  DATAINICIO  = :OLD_DATAINICIO  and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPARAM = :OLD_IDPARAM')
    InsertSQL.Strings = (
      'insert into PESSOAPARAM'
      '  (IDPESSOA, IDPARAM, VALOR, DATAINICIO, DATAFIM)'
      'values'
      '  (:IDPESSOA, :IDPARAM, :VALOR, :DATAINICIO, :DATAFIM)')
    DeleteSQL.Strings = (
      'delete from PESSOAPARAM'
      'where'
      '  DATAINICIO  = :OLD_DATAINICIO  and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPARAM = :OLD_IDPARAM')
    Left = 1032
    Top = 487
  end
  object CMValidaCPF: TCMValidaDoc
    TipoDocumento = tdCPF
    Mensagem.ExibeMensagem = False
    Mensagem.Texto = 'Número de Documento Inválido'
    Left = 417
    Top = 64
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      
        'FROM (SELECT PLP.NOME AS PLANO,BEN.IDBENEFICIO,BEN.NOME AS BENEF' +
        'ICIO,BPP.IDPLANOPREV,BPP.IDPLANPREVCONTAB,'
      
        '             PPP.IDSITPLANOPREV,PPP.FLGDESATIVADO,BPP.FLGREFEREN' +
        'CIA'
      '        FROM BENEFICIO BEN,'
      '             BENEFPLANPREV BPP,'
      '             PLANPREV PLP,'
      '             (SELECT IDPLANOPREV, FLGDESATIVADO, IDSITPLANOPREV'
      '              FROM PARTPREVPLAN PPP'
      
        '              WHERE EXISTS (SELECT 1 FROM DEPENTIT D1 WHERE D1.I' +
        'DTITULAR = PPP.IDPESSOA AND D1.MATRICULA = :MATRICULA) AND'
      
        '                    PPP.FLGDESATIVADO  in (0,1)     /*SIG49076 i' +
        'nseriu 1 na condicao*/'
      '              UNION'
      '              SELECT IDPLANOPREV, FLGDESATIVADO, IDSITPLANOPREV'
      '              FROM PARTPREVPLAN PPP'
      
        '              WHERE EXISTS (SELECT 1 FROM DEPENTIT D1 WHERE D1.I' +
        'DTITULAR = PPP.IDPESSOA AND D1.MATRICULA = :MATRICULA) AND'
      '                    PPP.IDSITPLANOPREV IN (25,26)'
      '              UNION'
      
        '              SELECT IDPLANOPREV, 0 FLGDESATIVADO, DECODE(IDPLAN' +
        'PREVCONTAB,28,25,1) IDSITPLANOPREV'
      '              FROM benefbfciario bf'
      '              WHERE bf.idtppagtobenefic = 1 AND'
      '                    bf.fontepagadora = 1 AND'
      
        '                    EXISTS (SELECT 1 FROM DEPENTIT D1 WHERE D1.I' +
        'DTITULAR = BF.IDTITULAR AND D1.MATRICULA = :MATRICULA)) PPP'
      '      WHERE  BEN.FLGDESTBENEF <> '#39'P'#39
      '         AND BPP.IDBENEFICIO = BEN.IDBENEFICIO'
      '         AND BPP.IDPLANOPREV = PLP.IDPLANOPREV'
      '         AND PLP.IDPLANOPREV = PPP.IDPLANOPREV'
      
        '         AND ((PPP.IDPLANOPREV = :IDPLANOPREV) OR ( :IDPLANOPREV' +
        ' is null))         '
      '         AND BPP.FLGREFERENCIA = 0'
      
        '         AND DECODE(PPP.IDSITPLANOPREV,25,28,26,28,PPP.IDPLANOPR' +
        'EV) = BPP.IDPLANPREVCONTAB'
      '      UNION'
      
        '      SELECT PLP.NOME AS PLANO,BEN.IDBENEFICIO,BEN.NOME AS BENEF' +
        'ICIO,BPP.IDPLANOPREV,BPP.IDPLANPREVCONTAB,'
      
        '             PPP.IDSITPLANOPREV,PPP.FLGDESATIVADO,BPP.FLGREFEREN' +
        'CIA'
      '        FROM BENEFICIO BEN,'
      '             BENEFPLANPREV BPP,'
      '             PLANPREV PLP,'
      
        '             (SELECT IDPLANOPREV, FLGDESATIVADO, IDSITPLANOPREV,' +
        ' IDPESSOA'
      '              FROM PARTPREVPLAN PPP'
      
        '              WHERE EXISTS (SELECT 1 FROM DEPENTIT D1 WHERE D1.I' +
        'DTITULAR = PPP.IDPESSOA AND D1.MATRICULA = :MATRICULA) AND'
      
        '                    PPP.FLGDESATIVADO  in (0,1)     /*SIG49076 i' +
        'nseriu 1 na condicao*/'
      '              UNION'
      
        '              SELECT IDPLANOPREV, FLGDESATIVADO, IDSITPLANOPREV,' +
        ' IDPESSOA'
      '              FROM PARTPREVPLAN PPP'
      
        '              WHERE EXISTS (SELECT 1 FROM DEPENTIT D1 WHERE D1.I' +
        'DTITULAR = PPP.IDPESSOA AND D1.MATRICULA = :MATRICULA) AND'
      '                    PPP.IDSITPLANOPREV IN (25,26)) PPP'
      '      WHERE  BEN.FLGDESTBENEF <> '#39'P'#39
      '         AND BPP.IDBENEFICIO = BEN.IDBENEFICIO'
      '         AND BPP.IDPLANOPREV = PLP.IDPLANOPREV'
      '         AND PLP.IDPLANOPREV = PPP.IDPLANOPREV'
      
        '         AND ((PPP.IDPLANOPREV = :IDPLANOPREV) OR ( :IDPLANOPREV' +
        ' is null ))         '
      '         AND BPP.FLGREFERENCIA = 1'
      '         AND (PPP.IDSITPLANOPREV IN (25,26) OR'
      
        '              (PPP.IDSITPLANOPREV NOT IN (25,26) AND NOT EXISTS ' +
        '(SELECT 1'
      
        '                                                                ' +
        ' FROM PARTPREVPLAN PPP1'
      
        '                                                                ' +
        ' WHERE PPP1.IDPESSOA = PPP.IDPESSOA AND'
      
        '                                                                ' +
        '       PPP1.IDSITPLANOPREV IN (25,26)))))'
      'ORDER BY FLGDESATIVADO, PLANO, BENEFICIO'
      ' ')
    ValidateWithMask = True
    Left = 808
    Top = 354
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object QryCbancoPref: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDTITULAR,'
      '       CB.IDCBANCARIA,'
      '       CB.CONTACORRENTE,'
      '       CB.IDAGENCIA,'
      '       CB.FLGCONTAPREF,'
      '       CB.IDPESSOA,'
      '       CB.TIPOCONTA,'
      '       CB.FLGCONTACONJUNTA,'
      '       CB.FLGCONTARESGATE'
      'FROM   CONTABANCARIA CB,'
      '       DEPENTIT D'
      'WHERE D.IDTITULAR = :IDTITULAR'
      '  AND D.IDPESSOA  = CB.IDPESSOA')
    UpdateObject = updCBancoPref
    ValidateWithMask = True
    Left = 541
    Top = 439
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryplano: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PD.IDPESSOA, PD.IDPLANOPREV, PD.IDPESSJUR, PD.DATACANCEL,' +
        ' PD.ID_MOTIVOCANCEL, PD.IDTITULAR,'
      '       P.NOME AS PLANO, MTV.DESCRICAO AS MOTIVO'
      '  FROM CM.PLANODEPENDENTE PD'
      '  JOIN PLANPREV P ON P.IDPLANOPREV = PD.IDPLANOPREV'
      '  LEFT JOIN MOTIVO MTV ON MTV.IDMOTIVO = PD.ID_MOTIVOCANCEL'
      ' WHERE  PD.IDTITULAR = :IDTITULAR'
      ' '
      ' '
      ' ')
    UpdateObject = updplano
    ValidateWithMask = True
    Left = 857
    Top = 491
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object UpdateSQL1: TUpdateSQL
    Left = 980
    Top = 61
  end
  object dsContatoTel: TwwDataSource
    DataSet = qryContatoTel
    Left = 905
    Top = 612
  end
  object qryContatoTel: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TELENDPESS.IDTELEFONE,'
      '   CONTATOPESS.IDCONTATO , '
      '   CONTATOPESS.IDPESSOA , '
      '   CONTATOPESS.IDENDERECO , '
      '   CONTATOPESS.NOME , '
      '   CONTATOPESS.EMAIL , '
      '   CONTATOPESS.CARGO , '
      '   CONTATOPESS.SETOR,'
      '   CONTATOPESS.NASCIMENTO,'
      '   CONTATOPESS.OBS'
      'FROM  TELENDPESS, CONTATOPESS, TELCONTATO '
      'WHERE CONTATOPESS.IDPESSOA  = TELENDPESS.IDPESSOA'
      'AND   TELCONTATO.IDCONTATO  = CONTATOPESS.IDCONTATO'
      'AND   TELCONTATO.IDTELEFONE = TELENDPESS.IDTELEFONE'
      'AND   CONTATOPESS.IDPESSOA  = :IdPessoa'
      ''
      ' ')
    ValidateWithMask = True
    Left = 922
    Top = 618
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 161
    Top = 53
  end
  object qrySelDepBenIncluido: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CAST((PE.NOME ||'#39' - '#39'|| PF.DATANASC ||'#39' - '#39'|| PE.NUMDOCUM' +
        'ENTO) AS VARCHAR2(100)) AS DESCRICAO ,PE.IDPESSOA, PE.NOME, PE.NUMD' +
        'OCUMENTO, PF.DATANASC, PF.NOMEPAI, PF.NOMEMAE,PF.EMAILFUNCEF, PF' +
        '.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF'
      'FROM PESSOA PE, PESSOAFISICA PF'
      'WHERE'
      'PE.IDPESSOA = PF.IDPESSOA(+)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 1031
    Top = 330
  end
  object dsSelDepBenIncluido: TwwDataSource
    AutoEdit = False
    DataSet = qrySelDepBenIncluido
    Left = 958
    Top = 430
  end
  object qryAuxInsert: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 992
    Top = 241
  end
  object qryMolestiaGrave: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DTINICIO, DTFINAL FROM HSTMOLESTIAGRAVE'
      'WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 865
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsMolestiaGrave: TwwDataSource
    DataSet = qryMolestiaGrave
    Left = 929
    Top = 4
  end
  object dsDepeNaoCadastrado: TwwDataSource
    AutoEdit = False
    DataSet = qryDepeNaoCadastrado
    Left = 1213
    Top = 538
  end
  object qryDepeNaoCadastrado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      #39' '#39' AS SELECIONADO,'
      'SQDEP,'
      'NRMATREMP,'
      'NODEP,'
      'CDRELDEPND,'
      #39' '#39' AS FLGISENTOIRRF,'
      'DTNASCDEP,'
      'TRGDTINCLUSAO,--William Moreira da Silva SOL 220494'
      #39' '#39' AS CANCELADO,'
      'CDSEXO,'
      #39' '#39' AS ELEGIVEL,'
      #39' '#39' AS BENEFICIARIO,'
      'IDIR,'
      #39' '#39' AS DTINIRRF,'
      #39' '#39' AS DTFIMIRRF,'
      #39' '#39' AS SALARIOFAM,'
      #39' '#39' AS DINISALFAMÍLIA,'
      #39' '#39' AS DTFIMSAFAMÍLIA,'
      #39' '#39' AS DESIGNADO,'
      #39' '#39' AS DEPENDENTE,'
      'IDINVALIDEZ,'
      #39' '#39' AS MOLESTIA,'
      #39' '#39' AS DTFIMMOLESTIA,'
      #39' '#39' AS DTININVALIDEZ,'
      #39' '#39' AS DTFIMINVALIDEZ,'
      #39' '#39' AS NOMEMÃE,'
      #39' '#39' AS NOMEPAI,'
      #39' '#39' AS NUMDOCUMENTO,'
      #39' '#39' AS SITUACAODEPEN,'
      #39' '#39' AS DATAMORTE,'
      '       DECODE(CDESTCIV, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado(a) ou Equiparado(a)'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'M'#39', '#39'Marital'#39','
      '                           '#39'P'#39', '#39'Separado(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      'CDESTCIV,'
      #39' '#39' AS OPCAO1,'
      #39' '#39' AS OPCAO2,'
      #39' '#39' AS OPCAO3,'
      'FLGCADASTRO,'
      'IDPESSOA,'
      'IDTITULAR'
      'FROM CM.depentitncad'
      'WHERE FLGCADASTRO <> 1'
      'AND IDTITULAR = :PIDTITULAR')
    UpdateObject = upDepenNaoCadastrado
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N'
      'FLGISENTOIRRF;CheckBox;S;N'
      'ELEGIVEL;CheckBox;S;N'
      'BENEFICIARIO;CheckBox;S;N'
      'IDIR;CheckBox;S;N'
      'SALARIOFAM;CheckBox;S;N')
    ValidateWithMask = True
    Left = 1229
    Top = 553
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object upDepenNaoCadastrado: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DEPENTITNCAD'
      'SET FLGCADASTRO = 1'
      'WHERE '
      'IDPESSOA = :OLD_IDPESSOA'
      'AND IDTITULAR = :OLD_IDTITULAR')
    Left = 1112
    Top = 509
  end
  object qryLogReprLegal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRESP.NUMDOCUMENTO AS NUMDOCUMENTO,'
      '       PRESP.NOME AS NOMERESPONSAVEL,'
      '       PREC.NOME AS NOMERECEBEDOR,'
      '       T.DESCRICAO AS TIPORESPONSAVEL,'
      '       L.CODTIPORESPONSAVEL,'
      
        '       DECODE(L.SITATUAL, 1, '#39'Vigente'#39', 2, '#39'Vencida'#39', '#39'Extinta'#39')' +
        ' AS SITUACAO,'
      '       L.SITATUAL,'
      '       L.ACAO,'
      '       L.IDPESSJUR,'
      '       L.IDTITULAR,'
      '       L.IDPLANOORIGEM,'
      '       L.IDPESSOA,'
      '       L.SEQPROPOSTA,'
      '       L.IDPLANOPREV,'
      '       L.IDRESPONSAVEL,'
      '       L.IDRECEBEDOR,'
      '       L.DATAINICIO,'
      '       L.DATATERMINO,'
      
        '       CAST(SUBSTR(L.OBSERVACAO, 1, 100) AS VARCHAR2(100)) AS OB' +
        'SERVACAO100,'
      '       L.OBSERVACAO,'
      '       L.TRGDTINCLUSAO,'
      '       L.TRGUSERINCLUSAO,        '
      '       (SELECT U.NOMEUSUARIO'
      '          FROM USUARIOSISTEMA U'
      
        '         WHERE TO_CHAR(U.IDUSUARIO) = SUBSTR(L.TRGUSERINCLUSAO, ' +
        '3, 10)) AS NOMEUSUARIO'
      '  FROM LOGREPRLEGAL L'
      ''
      'LEFT JOIN PESSOA PRESP'
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
      ''
      ' ORDER BY L.TRGDTINCLUSAO DESC'
      ' ')
    ValidateWithMask = True
    Left = 750
    Top = 296
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
      Size = 9
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
    object qryLogReprLegalACAO: TStringField
      FieldName = 'ACAO'
      Size = 30
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
    object qryLogReprLegalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryLogReprLegalTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLogReprLegalNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
  end
  object dsLogReprLegal: TwwDataSource
    AutoEdit = False
    DataSet = qryLogReprLegal
    Left = 788
    Top = 290
  end
  object qryReprLegal: TwwQuery
    CachedUpdates = True
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
      '       H.IDRESPONSAVEL,'
      '       H.IDRECEBEDOR,'
      '       H.DATAINICIO,'
      '       H.DATATERMINO,'
      
        '       CAST(SUBSTR(H.OBSERVACAO, 1, 100) AS VARCHAR2(100)) AS OB' +
        'SERVACAO100,'
      '       H.OBSERVACAO,'
      '       H.TRGDTINCLUSAO,'
      '       H.TRGUSERINCLUSAO,        '
      '       (SELECT U.NOMEUSUARIO'
      '          FROM USUARIOSISTEMA U'
      
        '         WHERE TO_CHAR(U.IDUSUARIO) = SUBSTR(H.TRGUSERINCLUSAO, ' +
        '3, 10)) AS NOMEUSUARIO'
      '  FROM HSTREPRLEGAL H'
      ''
      'LEFT JOIN PESSOA PRESP'
      '    ON PRESP.IDPESSOA = H.IDRESPONSAVEL'
      '    '
      '     LEFT JOIN PESSOA PREC'
      '    ON PREC.IDPESSOA = H.IDRECEBEDOR'
      ''
      '  LEFT JOIN TIPORECEBEDOR T'
      '    ON T.CODTIPORECEBEDOR = H.CODTIPORESPONSAVEL'
      ''
      ' WHERE H.IDPESSJUR = :IDPESSJUR'
      '   AND H.IDPESSOA =  :IDPESSOA'
      '   AND H.IDTITULAR = :IDTITULAR'
      '  '
      ''
      ' ORDER BY H.TRGDTINCLUSAO DESC')
    UpdateObject = updReprLegal
    ValidateWithMask = True
    Left = 736
    Top = 357
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
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object qryReprLegalNUMDOCUMENTO: TStringField
      DisplayLabel = 'CPF do Responsável'
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryReprLegalNOMERESPONSAVEL: TStringField
      DisplayLabel = 'Nome do Responsável'
      DisplayWidth = 19
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qryReprLegalTIPORESPONSAVEL: TStringField
      DisplayLabel = 'Tipo de Responsável'
      DisplayWidth = 18
      FieldName = 'TIPORESPONSAVEL'
      Size = 9
    end
    object qryReprLegalNOMERECEBEDOR: TStringField
      DisplayLabel = 'Nome do Recebedor'
      DisplayWidth = 19
      FieldName = 'NOMERECEBEDOR'
      Size = 60
    end
    object qryReprLegalDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryReprLegalDATATERMINO: TDateTimeField
      DisplayLabel = 'Data Limite'
      DisplayWidth = 10
      FieldName = 'DATATERMINO'
    end
    object qryReprLegalSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 8
      FieldName = 'SITUACAO'
      Size = 7
    end
    object qryReprLegalOBSERVACAO100: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 10
      FieldName = 'OBSERVACAO100'
      Size = 100
    end
    object qryReprLegalTRGDTINCLUSAO: TDateTimeField
      DisplayLabel = 'Data Alteração'
      DisplayWidth = 13
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryReprLegalNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário Alteração'
      DisplayWidth = 16
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryReprLegalCODTIPORESPONSAVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPORESPONSAVEL'
      Visible = False
      Size = 5
    end
    object qryReprLegalSITATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'SITATUAL'
      Visible = False
    end
    object qryReprLegalIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryReprLegalIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryReprLegalIDPLANOORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryReprLegalIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryReprLegalSEQPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryReprLegalIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryReprLegalIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
    object qryReprLegalIDRECEBEDOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRECEBEDOR'
      Visible = False
    end
    object qryReprLegalOBSERVACAO: TMemoField
      DisplayWidth = 10
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryReprLegalTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
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
      '  OBSERVACAO = :OBSERVACAO  ,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO ,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO '
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
      
        '   IDRESPONSAVEL, IDRECEBEDOR, CODTIPORESPONSAVEL, DATAINICIO, D' +
        'ATATERMINO, SITATUAL, '
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
    Left = 776
    Top = 327
  end
  object dsReprLegal: TwwDataSource
    AutoEdit = False
    DataSet = qryReprLegal
    Left = 703
    Top = 339
  end
  object qryBenef: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryBenefBeforePost
    AfterPost = qryBenefAfterPost
    AfterScroll = qryBenefAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  BTP.IDPESSJUR,'
      '  D.IDTITULAR,'
      '  BTP.IDPLANOPREV,'
      '  D.IDPESSOA,'
      '  BTP.IDBENEFICIO,'
      '  BTP.SEQPROPOSTA,'
      '  BTP.IDDEPENRESPON,'
      '  BTP.IDRESPONSAVEL,'
      '  BTP.IDRESPONNAOREC,'
      '  BTP.IDNUCLEOFAMILIAR,'
      '  BTP.PRIORIDADE,'
      '  BTP.PERCENTUAL,'
      '  BTP.CODTIPORECEBEDOR,'
      '  BTP.DATAFIMRECEB,'
      '  B.NOME AS BENEFICIO,'
      '  PRECEB.NOME AS RECEBEDOR,'
      '  PRESPON.NOME AS RESPONSAVEL,'
      '  NVL(TP.DESCRICAO,'#39'O PRÓPRIO'#39') AS TIPORECEBEDOR,'
      '  BP.IDREGRABENEFICIA,'
      '  BTP.IDPLANOORIGEM,'
      '  BF.DATAINICIO,'
      '  BF.VALORATUAL,'
      '  NVL(SBN.DESCRICAO,'#39'NÃO REQUERIDO'#39') AS SITBENEFICIO,'
      '  BP.IDREGRAFIM,'
      ''
      '  PLP.NOME AS PLANO'
      ''
      ', PRECEB.NUMDOCUMENTO  AS CPFRECEBEDOR,'
      ' PRESPON.NUMDOCUMENTO  AS CPFRESPONSAVEL'
      ', B.IDTPPAGTOBENEFIC'
      ', BTP.OBSERVACAO -- SIG21866'
      ', BTP.TIPOOPCAOIR  -- WO20730'
      'FROM'
      '  PESSOA          PRECEB,'
      '  PESSOA          PRESPON,'
      '  BENEFPLANPREV   BP,'
      '  BFCIARIOTITPLAN BTP,'
      '  BENEFBFCIARIO   BF,'
      '  SITBENEFICIO    SBN,'
      '  PARTPREVPLAN    PPP,'
      '  BENEFICIO       B,'
      '  DEPENTIT        D,'
      '  TIPORECEBEDOR   TP,'
      '  PLANPREV        PLP'
      ''
      'WHERE'
      '      BTP.IDTITULAR         = :IDTITULAR'
      '  AND BTP.SEQPROPOSTA       = 1'
      '  AND BTP.IDPESSJUR         = PPP.IDPESSJUR'
      '  AND BTP.IDPLANOORIGEM     = PPP.IDPLANOPREV'
      '  AND BTP.IDTITULAR         = PPP.IDPESSOA'
      '  AND BTP.SEQPROPOSTA       = PPP.SEQPROPOSTA'
      '  AND BTP.IDPESSJUR         = BF.IDPESSJUR(+)'
      '  AND BTP.IDPLANOPREV       = BF.IDPLANOPREV(+)'
      '  AND BTP.IDTITULAR         = BF.IDTITULAR(+)'
      '  AND BTP.IDPESSOA          = BF.IDPESSOA(+)'
      '  AND BTP.IDBENEFICIO       = BF.IDBENEFICIO(+)'
      '  AND BTP.SEQPROPOSTA       = BF.SEQPROPOSTA(+)'
      '  AND BTP.IDPESSOA          = D.IDPESSOA'
      '  AND BTP.IDTITULAR         = D.IDTITULAR'
      '  AND BTP.IDBENEFICIO       = B.IDBENEFICIO'
      '  AND BTP.CODTIPORECEBEDOR  = TP.CODTIPORECEBEDOR(+)'
      '  AND BTP.IDRESPONSAVEL     = PRECEB.IDPESSOA(+)'
      '  AND BTP.IDPLANOPREV       = BP.IDPLANOPREV'
      '  AND BTP.IDBENEFICIO       = BP.IDBENEFICIO'
      '  AND BTP.IDRESPONNAOREC    = PRESPON.IDPESSOA(+)'
      '  AND BF.IDSITBENEFICIO     = SBN.IDSITBENEFICIO(+)'
      ''
      '  AND BP.IDPLANOPREV        = PLP.IDPLANOPREV'
      '  AND BP.IDPLANOPREV = :IDPLANOPREV'
      ''
      'ORDER BY'
      '  BF.DATAINICIO DESC'
      ' ')
    UpdateObject = updBenef
    ValidateWithMask = True
    Left = 726
    Top = 175
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end>
    object qryBenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryBenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBenefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryBenefSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryBenefIDDEPENRESPON: TStringField
      FieldName = 'IDDEPENRESPON'
      FixedChar = True
      Size = 3
    end
    object qryBenefIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryBenefIDRESPONNAOREC: TFloatField
      FieldName = 'IDRESPONNAOREC'
    end
    object qryBenefIDNUCLEOFAMILIAR: TFloatField
      FieldName = 'IDNUCLEOFAMILIAR'
    end
    object qryBenefPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
    end
    object qryBenefPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryBenefCODTIPORECEBEDOR: TStringField
      FieldName = 'CODTIPORECEBEDOR'
      Size = 5
    end
    object qryBenefDATAFIMRECEB: TDateTimeField
      FieldName = 'DATAFIMRECEB'
    end
    object qryBenefBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryBenefRECEBEDOR: TStringField
      FieldName = 'RECEBEDOR'
      Size = 60
    end
    object qryBenefRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 60
    end
    object qryBenefTIPORECEBEDOR: TStringField
      FieldName = 'TIPORECEBEDOR'
      Size = 60
    end
    object qryBenefIDREGRABENEFICIA: TFloatField
      FieldName = 'IDREGRABENEFICIA'
    end
    object qryBenefIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryBenefDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryBenefVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
    end
    object qryBenefSITBENEFICIO: TStringField
      FieldName = 'SITBENEFICIO'
      Size = 40
    end
    object qryBenefIDREGRAFIM: TFloatField
      FieldName = 'IDREGRAFIM'
    end
    object qryBenefPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryBenefCPFRECEBEDOR: TStringField
      FieldName = 'CPFRECEBEDOR'
      FixedChar = True
      Size = 18
    end
    object qryBenefCPFRESPONSAVEL: TStringField
      FieldName = 'CPFRESPONSAVEL'
      FixedChar = True
      Size = 18
    end
    object qryBenefIDTPPAGTOBENEFIC: TFloatField
      FieldName = 'IDTPPAGTOBENEFIC'
    end
    object strngfldBenefOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object qryBenefTIPOOPCAOIR: TFloatField
      FieldName = 'TIPOOPCAOIR'
    end
  end
  object updBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  IDDEPENRESPON = :IDDEPENRESPON,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDRESPONNAOREC = :IDRESPONNAOREC,'
      '  IDNUCLEOFAMILIAR = :IDNUCLEOFAMILIAR,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  CODTIPORECEBEDOR = :CODTIPORECEBEDOR,'
      '  DATAFIMRECEB = :DATAFIMRECEB,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM'
      '  ,TIPOOPCAOIR = :TIPOOPCAOIR --WO20730'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      
        '  (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO, SEQ' +
        'PROPOSTA,'
      
        '   IDDEPENRESPON, IDRESPONSAVEL, IDRESPONNAOREC, IDNUCLEOFAMILIA' +
        'R, PRIORIDADE,'
      
        '   PERCENTUAL, CODTIPORECEBEDOR, DATAFIMRECEB, IDPLANOORIGEM, TI' +
        'POOPCAOIR)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOPREV, :IDPESSOA, :IDBENEFICIO' +
        ', :SEQPROPOSTA,'
      
        '   :IDDEPENRESPON, :IDRESPONSAVEL, :IDRESPONNAOREC, :IDNUCLEOFAM' +
        'ILIAR,'
      
        '   :PRIORIDADE, :PERCENTUAL, :CODTIPORECEBEDOR, :DATAFIMRECEB, :' +
        'IDPLANOORIGEM, :TIPOOPCAOIR)'
      ' ')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM')
    Left = 783
    Top = 216
  end
  object qryDependenciaAux: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE IDDEPENDENCIA <> '#39'PRP'#39
      'AND (IDDEPENDENCIA <> '#39'OUT'#39')'
      
        'AND (IDDEPENDENCIA IN ('#39'COM'#39','#39'FIL'#39','#39'ENT'#39','#39'MSG'#39','#39'IRM'#39','#39'PAI'#39','#39'EXC'#39 +
        ','#39'NTO'#39','#39'AVO'#39','#39'SOG'#39','#39'DES'#39','#39'CUR'#39','#39'BDE'#39'))'
      '')
    ValidateWithMask = True
    Left = 431
    Top = 470
  end
  object dsEstCivil: TwwDataSource
    DataSet = qryEstCivil
    Left = 1144
    Top = 280
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
    Left = 1144
    Top = 264
  end
  object qryTipoDocumento: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      ' TX.IDTIPODOCPESSOAXMASC, '
      ' TX.IDDOCUMENTO, '
      ' TX.NOME, TX.MASCARA '
      'FROM '
      '    TIPODOCPESSOAXMASC TX '
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 65
    Top = 436
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
      ' WHERE P.IDPESSOA = :IDPESSOA'
      ' ORDER BY P.DTINICIO, P.CARGOEMPFUNC')
    UpdateObject = updOcupacao
    ValidateWithMask = True
    Left = 229
    Top = 424
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
    object qryOcupacaoENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Size = 150
    end
    object qryOcupacaoRENDA: TFloatField
      FieldName = 'RENDA'
      DisplayFormat = '#,##0.00'
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
    Left = 272
    Top = 424
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
    Left = 305
    Top = 424
  end
  object qryPF2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPESSOA, dp.idtitular, PF.INFOADICIONAIS '
      '  FROM PESSOAFISICA PF '
      '  JOIN DEPENTIT DP ON DP.IDPESSOA = PF.IDPESSOA'
      'WHERE '
      '  IDTITULAR = :IDTITULAR')
    UpdateObject = updPf2
    ValidateWithMask = True
    Left = 25
    Top = 556
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
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
    Left = 61
    Top = 556
  end
  object dsPF2: TwwDataSource
    DataSet = qryPF2
    Left = 96
    Top = 556
  end
  object qryBeneficio2: TwwQuery
    ValidateWithMask = True
    Left = 628
    Top = 332
  end
  object updCBancoPref: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME, NUMDOCUMENTO)'
      'values'
      '  (:NOME, :NUMDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 544
    Top = 471
  end
end
