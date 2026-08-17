inherited frmCadRegTrein: TfrmCadRegTrein
  Left = 81
  Top = 52
  HelpContext = 720012
  Caption = 'Registro Individual de Treinamento'
  ClientHeight = 531
  ClientWidth = 873
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 873
    Height = 445
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 869
      Height = 51
      object Label1: TLabel
        Left = 11
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 171
        Top = 7
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 74
        Top = 4
        Width = 84
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 208
        Top = 4
        Width = 480
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedSit: TDBEdit
        Left = 10
        Top = 26
        Width = 239
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCargo: TDBEdit
        Left = 257
        Top = 26
        Width = 431
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'TITULO'
        DataSource = dsCargo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 53
      Width = 869
      Height = 390
      Tabs.Strings = (
        'Cursos'
        'Avaliações dos Cursos'
        'Avaliações do Aluno')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdAval'
        'dbgrdAval2')
      inherited pgctrlDetalhe: TPageControl
        Width = 771
        Height = 331
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 763
            Height = 303
            Selected.Strings = (
              'DESCRICAO'#9'41'#9'Curso'
              'DATREINI'#9'12'#9'Data Real Início'
              'DATREFIM'#9'10'#9'Data Real Fim')
            Font.Style = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 763
            Height = 303
            object PageControlDet: TPageControl
              Left = 0
              Top = -1
              Width = 763
              Height = 304
              ActivePage = tbshMensalidade
              Align = alBottom
              TabOrder = 0
              OnChange = PageControlDetChange
              object tbshDadosBasicos: TTabSheet
                Caption = 'Dados Básicos'
                object Label4: TLabel
                  Left = 22
                  Top = 7
                  Width = 33
                  Height = 13
                  Caption = 'Curso'
                  FocusControl = dbedMatricula
                end
                object Label2: TLabel
                  Left = 23
                  Top = 48
                  Width = 105
                  Height = 13
                  Caption = 'Empresa/Entidade'
                  FocusControl = dbedMatricula
                end
                object lblPdCidade: TLabel
                  Left = 350
                  Top = 10
                  Width = 102
                  Height = 13
                  Caption = 'Cidade do Evento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label34: TLabel
                  Left = 661
                  Top = 19
                  Width = 17
                  Height = 13
                  Caption = 'UF'
                end
                object CMProcuraCurso: TCMProcura
                  Left = 22
                  Top = 21
                  Width = 320
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Chave não pode estar em branco'
                  Mensagens.NaoExiste = 'Chave não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = False
                  OnApertouBotao = CMProcuraCursoApertouBotao
                  OnValidaDados = CMProcuraCursoValidaDados
                  DataSource = dsDet
                  DataField = 'IDCURSO'
                  LookupChave = 'IDCURSO'
                  LookupDescricao = 'DESCRICAO'
                  MontaSelect = MontaSelectCurso
                  LookupTabela = 'CM.CURSO'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
                object dblckEntid: TwwDBLookupCombo
                  Left = 23
                  Top = 62
                  Width = 320
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'UPNOME'#9'40'#9'Empresa/Entidade/Instrutor'#9'F')
                  DataField = 'IDENTIDINSTR'
                  DataSource = dsDet
                  LookupTable = CdsEntid
                  LookupField = 'IDPESSOA'
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnChange = dblckEntidChange
                  OnEnter = dblckEntidEnter
                end
                object CmpCidades: TCMProcura
                  Left = 348
                  Top = 25
                  Width = 310
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Cidade não pode estar em branco'
                  Mensagens.NaoExiste = 'Cidade não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = False
                  OnValidaDados = CmpCidadesValidaDados
                  DataSource = dsDet
                  DataField = 'idcidades'
                  LookupChave = 'IDCIDADES'
                  LookupDescricao = 'NOME'
                  MontaSelect = MsCidades
                  LookupTabela = 'CIDADES'
                  DataBaseName = 'BaseDados'
                  ReadOnly = True
                end
                object EdtSigla: TEdit
                  Left = 661
                  Top = 32
                  Width = 37
                  Height = 21
                  ReadOnly = True
                  TabOrder = 2
                end
                object GroupBox4: TGroupBox
                  Left = 316
                  Top = 112
                  Width = 177
                  Height = 113
                  Caption = 'Projeto Final'
                  TabOrder = 4
                  object lblDataEntrega: TLabel
                    Left = 36
                    Top = 52
                    Width = 93
                    Height = 13
                    Caption = 'Data de entrega'
                    FocusControl = dbedMatricula
                  end
                  object EdtDataEntrega: TCMDateTimePicker
                    Left = 37
                    Top = 68
                    Width = 100
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTENTREGA'
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
                    ShowButton = True
                    TabOrder = 0
                    OnExit = EdtDataEntregaExit
                  end
                  object CkbProjetoEntregue: TDBCheckBox
                    Left = 38
                    Top = 26
                    Width = 97
                    Height = 17
                    Caption = 'Entregue'
                    DataField = 'entregue'
                    DataSource = dsDet
                    TabOrder = 1
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = CkbProjetoEntregueClick
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 534
                  Top = 112
                  Width = 165
                  Height = 75
                  Caption = 'Carga Horária'
                  Enabled = False
                  TabOrder = 5
                  object Label25: TLabel
                    Left = 57
                    Top = 20
                    Width = 30
                    Height = 13
                    Caption = 'Total'
                    FocusControl = dbedMatricula
                  end
                  object dbedDurTot: TDBRealEdit
                    Left = 25
                    Top = 38
                    Width = 100
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '24,00')
                    TabOrder = 0
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'DUR_TOT'
                    DataSource = dsDet
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 24
                  Top = 112
                  Width = 257
                  Height = 137
                  Caption = 'Datas'
                  TabOrder = 6
                  object lblFimDaFidelidade: TLabel
                    Left = 13
                    Top = 75
                    Width = 100
                    Height = 13
                    Caption = 'Fim da Fidelidade'
                    FocusControl = dbedMatricula
                  end
                  object Label21: TLabel
                    Left = 10
                    Top = 22
                    Width = 34
                    Height = 13
                    Caption = 'Início'
                    FocusControl = dbedMatricula
                  end
                  object Label22: TLabel
                    Left = 139
                    Top = 21
                    Width = 28
                    Height = 13
                    Caption = 'Final'
                    FocusControl = dbedMatricula
                  end
                  object DtpFimdaFidelidade: TCMDateTimePicker
                    Left = 11
                    Top = 92
                    Width = 110
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
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
                    ShowButton = True
                    TabOrder = 0
                  end
                  object cmDatReIni: TCMDateTimePicker
                    Left = 10
                    Top = 36
                    Width = 110
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATREINI'
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
                    ShowButton = True
                    TabOrder = 1
                  end
                  object cmDatReFim: TCMDateTimePicker
                    Left = 137
                    Top = 36
                    Width = 112
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATREFIM'
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
                    ShowButton = True
                    TabOrder = 2
                  end
                end
              end
              object tbshObservacaoCurso: TTabSheet
                Caption = 'Observação'
                ImageIndex = 2
                object mmObservacaoCurso: TDBMemo
                  Left = 0
                  Top = 0
                  Width = 755
                  Height = 276
                  Align = alClient
                  DataField = 'OBSERVACAO'
                  DataSource = dsDet
                  MaxLength = 2000
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object tbshMensalidade: TTabSheet
                Caption = 'Despesas'
                ImageIndex = 4
                object PgCtrlDespesas: TPageControl
                  Left = 0
                  Top = 0
                  Width = 755
                  Height = 276
                  ActivePage = TabSheet1
                  Align = alClient
                  TabOrder = 0
                  object TabSheet1: TTabSheet
                    Caption = 'Valores'
                    object lblPartEmpresa: TLabel
                      Left = 545
                      Top = 13
                      Width = 83
                      Height = 13
                      Caption = 'Parte Empresa'
                      Visible = False
                    end
                    object lblPartEmpregado: TLabel
                      Left = 647
                      Top = 13
                      Width = 98
                      Height = 13
                      Caption = 'Parte Empregado'
                      Visible = False
                    end
                    object Label26: TLabel
                      Left = 612
                      Top = 212
                      Width = 33
                      Height = 13
                      Caption = 'Curso'
                      FocusControl = dbedMatricula
                      Visible = False
                    end
                    object dbedValor: TDBRealEdit
                      Left = 620
                      Top = 156
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '540,00')
                      TabOrder = 7
                      Visible = False
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VALOR'
                      DataSource = dsDet
                    end
                    object btnReplicar: TBitBtn
                      Left = 583
                      Top = 96
                      Width = 161
                      Height = 33
                      Caption = 'Replicar Última Parcela'
                      TabOrder = 0
                      Visible = False
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
                    object dbrgControle: TDBRadioGroup
                      Left = 237
                      Top = 7
                      Width = 303
                      Height = 47
                      Caption = 'Por conta da Empresa ?'
                      Columns = 3
                      DataField = 'FLGCONTROLE'
                      DataSource = dsDet
                      Items.Strings = (
                        'Sim'
                        'Não'
                        'Parcialmente')
                      TabOrder = 1
                      Values.Strings = (
                        '0'
                        '1'
                        '2')
                      OnChange = dbrgControleChange
                      OnClick = dbrgControleClick
                    end
                    object EdtvlrPartEmpresa: TwwDBEdit
                      Left = 545
                      Top = 27
                      Width = 94
                      Height = 21
                      DataField = 'partempresa'
                      DataSource = dsDet
                      Enabled = False
                      TabOrder = 2
                      UnboundDataType = wwDefault
                      Visible = False
                      WantReturns = False
                      WordWrap = False
                      OnChange = EdtvlrPartEmpresaChange
                      OnExit = EdtvlrPartEmpresaExit
                      OnKeyPress = EdtvlrPartEmpresaKeyPress
                    end
                    object EdtVlrPartEmpregado: TwwDBEdit
                      Left = 648
                      Top = 27
                      Width = 93
                      Height = 21
                      DataField = 'partempregado'
                      DataSource = dsDet
                      Enabled = False
                      TabOrder = 3
                      UnboundDataType = wwDefault
                      Visible = False
                      WantReturns = False
                      WordWrap = False
                      OnChange = EdtVlrPartEmpregadoChange
                      OnExit = EdtVlrPartEmpregadoExit
                      OnKeyPress = EdtVlrPartEmpregadoKeyPress
                    end
                    object GroupBox1: TGroupBox
                      Left = 0
                      Top = 128
                      Width = 745
                      Height = 123
                      Caption = 'Mensalidades'
                      TabOrder = 4
                      object lblVencimentoParcela: TLabel
                        Left = 7
                        Top = 19
                        Width = 98
                        Height = 13
                        Caption = 'Data Vencimento'
                      end
                      object lblVlrMensalidade: TLabel
                        Left = 7
                        Top = 59
                        Width = 105
                        Height = 13
                        Caption = 'Valor Mensalidade'
                      end
                      object grdDespesas: TwwDBGrid
                        Left = 143
                        Top = 9
                        Width = 598
                        Height = 108
                        IniAttributes.Delimiter = ';;'
                        TitleColor = clBtnFace
                        FixedCols = 0
                        ShowHorzScrollBar = True
                        DataSource = DsMensalidadesAux
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
                      object EdtDtVencimento: TCMDateTimePicker
                        Left = 7
                        Top = 35
                        Width = 99
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        ButtonStyle = cbsCustom
                        DataField = 'DTVENCIMENTOPARC'
                        DataSource = DsMensalidades
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
                        TabOrder = 1
                      end
                      object EdtVlrMensalidade: TDBRealEdit
                        Left = 7
                        Top = 75
                        Width = 102
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
                        DataField = 'VALORMENSALIDADE'
                        DataSource = DsMensalidades
                      end
                      object btnDespOk: TBitBtn
                        Left = 115
                        Top = 32
                        Width = 25
                        Height = 27
                        TabOrder = 3
                        OnClick = btnDespOkClick
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
                      object btnDespCancel: TBitBtn
                        Left = 115
                        Top = 67
                        Width = 25
                        Height = 27
                        Cancel = True
                        TabOrder = 4
                        OnClick = btnDespCancelClick
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
                        Spacing = -1
                      end
                    end
                    object GroupBox2: TGroupBox
                      Left = 0
                      Top = 63
                      Width = 745
                      Height = 65
                      TabOrder = 5
                      object lblVlrEmpresa: TLabel
                        Left = 207
                        Top = 14
                        Width = 82
                        Height = 13
                        Caption = 'Valor Empresa'
                      end
                      object lblVlrEmpregado: TLabel
                        Left = 311
                        Top = 14
                        Width = 97
                        Height = 13
                        Caption = 'Valor Empregado'
                      end
                      object lblQtdParcReal: TLabel
                        Left = 484
                        Top = 13
                        Width = 88
                        Height = 13
                        Caption = 'Qtd Parc. Paga'
                      end
                      object lblQtdParcPrevista: TLabel
                        Left = 591
                        Top = 13
                        Width = 105
                        Height = 13
                        Caption = 'Qtd Parc. Prevista'
                      end
                      object lblTotalCurso: TLabel
                        Left = 12
                        Top = 14
                        Width = 66
                        Height = 13
                        Caption = 'Total Curso'
                        FocusControl = dbedMatricula
                      end
                      object EdtQtdParcela: TwwDBEdit
                        Left = 485
                        Top = 27
                        Width = 96
                        Height = 21
                        DataField = 'QTDPARCELA'
                        DataSource = dsDet
                        Enabled = False
                        ReadOnly = True
                        TabOrder = 0
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object EdtNParcela: TwwDBEdit
                        Left = 590
                        Top = 27
                        Width = 91
                        Height = 21
                        DataField = 'QTDPARCPREV'
                        DataSource = DsMensalidades
                        TabOrder = 1
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object EdtVlrCurso: TRealEdit
                        Left = 12
                        Top = 28
                        Width = 99
                        Height = 21
                        Alignment = taRightJustify
                        Enabled = False
                        Lines.Strings = (
                          '0,00')
                        ReadOnly = True
                        TabOrder = 2
                        WordWrap = False
                        IntDigits = 10
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                      end
                      object EdtValorEmpresa: TRealEdit
                        Left = 208
                        Top = 28
                        Width = 91
                        Height = 21
                        Alignment = taRightJustify
                        Enabled = False
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 3
                        WordWrap = False
                        IntDigits = 10
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                      end
                      object EdtValorEmpregado: TRealEdit
                        Left = 312
                        Top = 28
                        Width = 91
                        Height = 21
                        Alignment = taRightJustify
                        Enabled = False
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 4
                        WordWrap = False
                        IntDigits = 10
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                      end
                    end
                    object GroupBox3: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 235
                      Height = 66
                      TabOrder = 6
                      object LblVlrPrevistoCurso: TLabel
                        Left = 9
                        Top = 9
                        Width = 80
                        Height = 13
                        Caption = 'Valor Previsto'
                        FocusControl = dbedMatricula
                      end
                      object Label37: TLabel
                        Left = 8
                        Top = 21
                        Width = 51
                        Height = 13
                        Caption = 'do Curso'
                        FocusControl = dbedMatricula
                      end
                      object lblDataAtual: TLabel
                        Left = 111
                        Top = 21
                        Width = 76
                        Height = 13
                        Caption = 'na data atual'
                        FocusControl = dbedMatricula
                      end
                      object lblValorDevolver: TLabel
                        Left = 111
                        Top = 8
                        Width = 94
                        Height = 13
                        Caption = 'Valor a devolver'
                        FocusControl = dbedMatricula
                      end
                      object btnAtualizarMeta: TBitBtn
                        Left = 208
                        Top = 35
                        Width = 24
                        Height = 24
                        TabOrder = 0
                        OnClick = btnAtualizarMetaClick
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE602A
                          AE602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE60
                          2AAE602AAE602AFF00FFDAA039FFD195EAB777E4AE67FFBD60F1AE4FDC9C3EFC
                          AA32FFA922FB9F14FB9A05FB9800FB9801FC9900FF9F00AE602AE7AC1DEEC093
                          584E44534A41D39D5B866A46433E39BA8338D5902F50433054452F5243305544
                          2B624A28F69702AE602AE7AC1DFFD0A0CAA276C09768FBBD6DD69F58B98847ED
                          A540E9A142AF7F56C58538E08D12B67937B97B37FE9D02AE602AE7AC1DEDC299
                          60554C5C5147D2A2688B704F4F463CB5843F977D922E42DE6D64A1CA8A483047
                          D33649CCEB9317AE602AE7AC1DFED1A2BC9B78B3916CFDC47FD3A165A17B4DEF
                          AA4DE9A657887394C78D55FEA3179C7469A1745FFE9D01AE602AE7AC1DE9BF97
                          63584D5A5149CDA5748A715547413CB386499D8397263EE36E66A5CE904B3148
                          D23448CCE3911EAE602AE7AC1DFFD4A5FCC794F5C190FFCF92FEC07DEFB06AFF
                          BD61FFB74FE3A45BFCAB3CFFAC24EE9B2CF2981BFF9F00AE602AE7AC1DF5CAA0
                          E1DEC0E2E0C1DEDBBCE1DCB9E3DAB1DED5A8E6D39FFFBF5DFCAB3CF3A333F69F
                          20F89D13FF9F04AE602AE7AC1DD4AF8C6BD3CA6CD7CE6CD7CE6CD7CF6CD7CF66
                          D7D18DE0D9FCC57BCA8D3DB58139AD7A31C18225FFA20BAE602AEFB53EF8C9A2
                          D1AC86D1AD86D1AD86D1AC85D1AA7BCFA46EDCAB6BFFBD6AF6AF52FCAF46E79D
                          37F3A028FFA716AE602AFF00FFE4A70AEDB339F0B84DEEB64DE9B24DF2BA62F2
                          B65AEEB04FEAA945E9A43AE79F31E89B27E6971FD2851AFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object GroupBox7: TGroupBox
                        Left = 8
                        Top = 32
                        Width = 95
                        Height = 27
                        Enabled = False
                        TabOrder = 1
                        object EdtVlrPrevistoCurso: TRealEdit
                          Left = -1
                          Top = 5
                          Width = 95
                          Height = 21
                          Alignment = taRightJustify
                          Lines.Strings = (
                            '0,00')
                          TabOrder = 0
                          WordWrap = False
                          IntDigits = 10
                          DecDigits = 2
                          NumberFormat = fNumber
                          Signal = False
                        end
                      end
                      object grpVlrDevolver: TGroupBox
                        Left = 111
                        Top = 32
                        Width = 97
                        Height = 27
                        Enabled = False
                        TabOrder = 2
                        object EdtVlrDevolverDtAtual: TDBRealEdit
                          Left = 0
                          Top = 5
                          Width = 96
                          Height = 21
                          Alignment = taRightJustify
                          Lines.Strings = (
                            '0,00')
                          TabOrder = 0
                          WordWrap = False
                          IntDigits = 10
                          DecDigits = 2
                          NumberFormat = fNumber
                          Signal = False
                          DataField = 'VLR_DEVOLVERDTATUAL'
                          DataSource = dsDet
                        end
                      end
                    end
                  end
                  object TabSheet2: TTabSheet
                    Caption = 'Destacamento'
                    ImageIndex = 1
                    object grpDestacamento: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 747
                      Height = 248
                      Align = alClient
                      TabOrder = 0
                      object Label27: TLabel
                        Left = 45
                        Top = 31
                        Width = 58
                        Height = 13
                        Caption = 'Passagem'
                        FocusControl = dbedMatricula
                      end
                      object Label28: TLabel
                        Left = 149
                        Top = 31
                        Width = 74
                        Height = 13
                        Caption = 'Hospedagem'
                        FocusControl = dbedMatricula
                      end
                      object Label29: TLabel
                        Left = 253
                        Top = 32
                        Width = 38
                        Height = 13
                        Caption = 'Outros'
                        FocusControl = dbedMatricula
                      end
                      object dbedViagem: TDBRealEdit
                        Left = 45
                        Top = 47
                        Width = 100
                        Height = 21
                        Alignment = taRightJustify
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 0
                        WordWrap = False
                        IntDigits = 10
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'DESP_VIAG'
                        DataSource = dsDet
                      end
                      object dbedHosped: TDBRealEdit
                        Left = 148
                        Top = 47
                        Width = 100
                        Height = 21
                        Alignment = taRightJustify
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 1
                        WordWrap = False
                        IntDigits = 10
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'DESP_ESTAD'
                        DataSource = dsDet
                      end
                      object dbedOutras: TDBRealEdit
                        Left = 253
                        Top = 47
                        Width = 98
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
                        DataField = 'DESP_OUTR'
                        DataSource = dsDet
                      end
                    end
                  end
                end
              end
            end
          end
        end
        object tbshAval: TTabSheet
          Caption = 'tbshAval'
          ImageIndex = 1
          object dbgrdAval: TwwDBGrid
            Left = 0
            Top = 0
            Width = 763
            Height = 303
            Selected.Strings = (
              'DESCRICAO'#9'80'#9'Descrição'#9'F'
              'AVALCURSO'#9'10'#9'Avaliação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAval
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
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
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlAval: TPanel
            Left = 0
            Top = 0
            Width = 763
            Height = 303
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label18: TLabel
              Left = 9
              Top = 15
              Width = 58
              Height = 13
              Caption = 'Descrição'
              FocusControl = DBEdit2
            end
            object Label19: TLabel
              Left = 9
              Top = 111
              Width = 75
              Height = 13
              Caption = 'Observações'
              FocusControl = DBEdit2
            end
            object DBEdit2: TDBEdit
              Left = 9
              Top = 30
              Width = 560
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'DESCRICAO'
              DataSource = dsAval
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object gbxAvalEscal: TGroupBox
              Left = 9
              Top = 60
              Width = 169
              Height = 43
              Caption = 'Avaliação Escalonada'
              TabOrder = 1
              object dbredAvaliacao: TDBRealEdit
                Left = 56
                Top = 15
                Width = 57
                Height = 21
                Hint = 'Encare como % de atiingimento das expectativas'
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                WordWrap = False
                IntDigits = 3
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALCURSO'
                DataSource = dsAval
              end
            end
            object DBMemo1: TDBMemo
              Left = 9
              Top = 126
              Width = 560
              Height = 119
              DataField = 'OBSERVACAO'
              DataSource = dsAval
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object gbxAvalConceitual: TGroupBox
              Left = 184
              Top = 60
              Width = 385
              Height = 43
              Caption = 'Avaliação Conceitual'
              TabOrder = 3
              object cmbAvalConceitual: TComboBox
                Left = 60
                Top = 15
                Width = 265
                Height = 21
                ItemHeight = 0
                TabOrder = 0
                OnChange = cmbAvalConceitualChange
              end
            end
          end
        end
        object tbshAval2: TTabSheet
          Caption = 'tbshAval2'
          ImageIndex = 2
          object dbgrdAval2: TwwDBGrid
            Left = 0
            Top = 0
            Width = 763
            Height = 303
            Selected.Strings = (
              'DESCRICAO'#9'80'#9'Descrição'#9'F'
              'AVALCURSO'#9'10'#9'Avaliação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAval2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
            ParentFont = False
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
          object pnlAval2: TPanel
            Left = 0
            Top = 0
            Width = 763
            Height = 303
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label8: TLabel
              Left = 9
              Top = 15
              Width = 58
              Height = 13
              Caption = 'Descrição'
              FocusControl = DBEdit1
            end
            object Label9: TLabel
              Left = 9
              Top = 111
              Width = 75
              Height = 13
              Caption = 'Observações'
              FocusControl = DBEdit1
            end
            object DBEdit1: TDBEdit
              Left = 9
              Top = 30
              Width = 560
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'DESCRICAO'
              DataSource = dsAval2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object gbxAvalEscal2: TGroupBox
              Left = 9
              Top = 60
              Width = 169
              Height = 43
              Caption = 'Avaliação Escalonada'
              TabOrder = 1
              object DBRealEdit1: TDBRealEdit
                Left = 56
                Top = 15
                Width = 57
                Height = 21
                Hint = 'Encare como % de atiingimento das expectativas'
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                WordWrap = False
                IntDigits = 3
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALCURSO'
                DataSource = dsAval2
              end
            end
            object DBMemo2: TDBMemo
              Left = 9
              Top = 126
              Width = 560
              Height = 119
              DataField = 'OBSERVACAO'
              DataSource = dsAval2
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object gbxAvalConceitual2: TGroupBox
              Left = 184
              Top = 60
              Width = 385
              Height = 43
              Caption = 'Avaliação Conceitual'
              TabOrder = 3
              object cmbAvalConceitual2: TComboBox
                Left = 60
                Top = 15
                Width = 265
                Height = 21
                ItemHeight = 0
                TabOrder = 0
                OnChange = cmbAvalConceitual2Change
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 861
        object pnlImprimeAval: TPanel
          Left = 123
          Top = 1
          Width = 110
          Height = 28
          TabOrder = 1
          Visible = False
          object sbtnImprimirAval: TSpeedButton
            Left = 2
            Top = 0
            Width = 106
            Height = 26
            Hint = 'Imprimir Avaliação'
            Caption = 'Imprimir'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88899888888770877788888888888777
              000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
              778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
              88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
              8F888F77000088888888887FFF7788888888888878FF77880000888888888887
              7788888888888888877788880000888888888888888888888888888888888888
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnImprimirAvalClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 775
        Height = 331
      end
    end
  end
  inherited Dock972: TDock97
    Width = 873
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 135
        Caption = '&Procurar Empregado'
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnProcurarCand: TToolbarButton97
        Left = 315
        Top = 0
        Width = 135
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar &Candidato'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnProcurarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 492
    Width = 873
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 566
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 397
      DockPos = 397
    end
    object btnGeraAp: TBitBtn
      Left = 234
      Top = 2
      Width = 81
      Height = 33
      Caption = 'Gerar AP'
      Enabled = False
      TabOrder = 2
      Visible = False
      OnClick = btnGeraApClick
    end
    object btnExcluirAp: TBitBtn
      Left = 320
      Top = 2
      Width = 75
      Height = 33
      Caption = 'Excluir AP'
      Enabled = False
      TabOrder = 3
      OnClick = btnExcluirApClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 815
    Top = 458
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 912
    Top = 153
  end
  inherited ImlPadrao: TImageList
    Left = 775
    Top = 461
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    OnOpenDataSet = CmeCadastroOpenDataSet
    ApplyEdit = CmeCadastroApplyEdit
    Left = 1065
    Top = 165
  end
  inherited Cds: TCMClientDataSet
    Left = 716
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Left = 791
    Top = 371
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 1064
    Top = 221
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 660
    Top = 153
  end
  object dsAval: TwwDataSource
    AutoEdit = False
    DataSet = CdsAval
    Left = 903
    Top = 105
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 933
    Top = 3
  end
  object CdsInstrutor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 832
    Top = 49
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = CdsDetBeforeEdit
    AfterScroll = CdsDetAfterScroll
    Left = 791
    Top = 5
  end
  object CdsAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAvalAfterScroll
    Left = 829
    Top = 5
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 885
    Top = 48
  end
  object dsCargo: TwwDataSource
    AutoEdit = False
    DataSet = CdsCargo
    OnStateChange = dsDetStateChange
    Left = 712
    Top = 105
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 51
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UPPER(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA '
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
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
    Left = 872
    Top = 371
  end
  object MontaSelectCand: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CANDIDAT'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'CANDIDAT.IDPESSOA')
    Filtro.Strings = (
      'CANDIDAT.IDPESSOA = PESSOA.IDPESSOA'
      'CANDIDAT.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '40')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 1046
    Top = 321
  end
  object MontaSelectCurso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 950
    Top = 321
  end
  object MontaSelectLocal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Localização'
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'TIPOAREA.DESCTIPOAREA'
      'LOCALIZACAO.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Tipo de Area'
      'Código C Custo'
      'Nome C Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOAREA'
      'LOCALIZACAO'
      'CENTCUST')
    CamposChave.Strings = (
      'LOCALIZACAO.IDLOCALIZACAO'
      'LOCALIZACAO.IDPESSOA'
      'LOCALIZACAO.NOME')
    Filtro.Strings = (
      'LOCALIZACAO.IDTIPOAREA = TIPOAREA.IDTIPOAREA(+)'
      'LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+)'
      'LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '15'
      '10'
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
    Left = 789
    Top = 321
  end
  object MontaSelectExterno: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Instrutor Externo'
    Colunas.Strings = (
      'NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Instrutor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'IDPESSOA'
      'NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 1069
    Top = 371
  end
  object MontaSelectInterno: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Instrutor Interno'
    Colunas.Strings = (
      'P.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Instrutor Interno')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'FUNCIONARIO F'
      'INSTRUTORINTERNO IE')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME')
    Larguras.Strings = (
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 965
    Top = 371
  end
  object CdsEscala: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 881
    Top = 3
  end
  object dsAval2: TwwDataSource
    AutoEdit = False
    DataSet = CdsAval2
    Left = 1093
    Top = 105
  end
  object CdsAval2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAval2AfterScroll
    Left = 1038
    Top = 4
  end
  object CdsGeraTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 765
    Top = 50
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 932
    Top = 49
  end
  object MsCidades: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO'
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome Cidade'
      'Sigla UF'
      'País')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO'
      'PAIS')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES'
      'CIDADES.CODESTADO')
    Filtro.Strings = (
      'CIDADES.IDESTADO=ESTADO.IDESTADO(+)'
      'ESTADO.IDPAIS=PAIS.IDPAIS(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '3'
      '20')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 871
    Top = 321
  end
  object dsEndereco: TwwDataSource
    AutoEdit = False
    DataSet = CdsEndereco
    Left = 767
    Top = 105
  end
  object CdsEndereco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1096
    Top = 5
    object CdsEnderecoNOME: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 40
    end
    object CdsEnderecoLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 20
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CdsEnderecoTIPOEND_PADRAO: TStringField
      DisplayLabel = 'Tipo de Endereço'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'TIPOEND_PADRAO'
      Size = 60
      Calculated = True
    end
    object CdsEnderecoNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Size = 8
    end
    object CdsEnderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 10
      FieldName = 'COMPLEMENTO'
    end
    object CdsEnderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 10
      FieldName = 'BAIRRO'
    end
    object CdsEnderecoCEP: TStringField
      DisplayWidth = 10
      FieldName = 'CEP'
      Size = 8
    end
    object CdsEnderecoNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'NOMECIDADE'
      Size = 50
    end
    object CdsEnderecoNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object CdsEnderecoNOMEPAIS: TStringField
      DisplayLabel = 'Pais'
      DisplayWidth = 20
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object CdsEnderecoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsEnderecoIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object CdsEnderecoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object CdsEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Visible = False
    end
  end
  object CdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 988
    Top = 3
  end
  object qryUnidNegoc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = 1) '
      'ORDER BY '
      '  UNECODIGO,UNETIPO')
    ValidateWithMask = True
    Left = 672
    Top = 57
    object qryUnidNegocUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.UNIDNEGOCIO.UNIDNEGOC'
    end
    object qryUnidNegocNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryUnidNegocUNECODIGO: TStringField
      FieldName = 'UNECODIGO'
      Origin = 'BASEDADOS.UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object qryUnidNegocUNETIPO: TStringField
      FieldName = 'UNETIPO'
      Origin = 'BASEDADOS.UNIDNEGOCIO.UNETIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qryCentroResp: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  CEN.CODEXTERNO,'
      '  CEN.CODCENTRORESPON,'
      '  CEN.NOME,'
      '  CEN.ANALITICOSINTET,'
      '  CEN.CODCENTROCUSTO'
      'FROM'
      '  CENTRESPON CEN,'
      '  PESSOAXCRESP PES'
      'WHERE'
      '  (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)')
    ValidateWithMask = True
    Left = 645
    Top = 65535
  end
  object qryTipoRD: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select CODTIPRECDES,'
      '       RECPAG,'
      '       PLACONTACREDITO,'
      '       PLANO,'
      '       PLACONTA,'
      '       DESCRICAO,'
      '       ANASINT,'
      '       FLGOBRIGARESERVA,'
      '       FLGCALCULAIMPOSTO,'
      '       HITCODHIST,'
      '       FLGFINANCHABITACIONAL'
      '  from TIPORECEBDESEMB'
      ' where (ANASINT = '#39'A'#39')'
      '   and (RECPAG = '#39'P'#39')'
      '   and (IDPESSOA = 1)'
      '   and (ATIVO <> '#39'N'#39')'
      ' order by DESCRICAO')
    ValidateWithMask = True
    Left = 500
    Top = 1
  end
  object qryCentroCusto: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT '
      '   CODEXTERNO,'
      '   CODCENTROCUSTO, '
      '   NOME,'
      '   STATUSGRUPOCDC, '
      '   IDPROGRAMA '
      'FROM '
      '   CENTCUST '
      'WHERE STATUSGRUPOCDC = '#39'A'#39
      '  AND ATIVO = '#39'S'#39)
    ValidateWithMask = True
    Left = 408
    Top = 58
  end
  object dsCentroCusto: TwwDataSource
    DataSet = qryCentroCusto
    Left = 860
    Top = 152
  end
  object dsTipoRD: TwwDataSource
    DataSet = qryTipoRD
    Left = 664
    Top = 105
  end
  object dsCentroResp: TwwDataSource
    DataSet = qryCentroResp
    Left = 604
    Top = 105
  end
  object dsUnidNegoc: TwwDataSource
    DataSet = qryUnidNegoc
    Left = 603
    Top = 154
  end
  object qryProgramaPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPROGRAMA,'
      '   CODPROGRAMA,'
      '   DESCPROGRAMA,'
      '   FLGTIPOPROGRAMA'
      'FROM'
      '   PROGRAMA'
      'ORDER BY'
      '   DESCPROGRAMA')
    ValidateWithMask = True
    Left = 567
  end
  object qryPatroPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PATRO.IDPESSOA,'
      '   PESSOA.NOME'
      'FROM'
      '   PESSOA,'
      '   PATRO'
      'WHERE'
      '   PESSOA.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY'
      '   PESSOA.NOME')
    ValidateWithMask = True
    Left = 340
    Top = 58
  end
  object qryPlanoPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV,'
      '   NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'WHERE'
      '   NVL(ATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 605
    Top = 58
  end
  object dsPlanoPrev: TwwDataSource
    DataSet = qryPlanoPrev
    Left = 1039
    Top = 105
  end
  object dsPatroPrev: TwwDataSource
    DataSet = qryPatroPrev
    Left = 707
    Top = 153
  end
  object dsProgramaPrev: TwwDataSource
    DataSet = qryProgramaPrev
    Left = 783
    Top = 153
  end
  object wwDataSource1: TwwDataSource
    AutoEdit = False
    DataSet = CMClientDataSet1
    Left = 967
    Top = 105
  end
  object CMClientDataSet1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 998
    Top = 48
  end
  object CMClientDataSet2: TCMClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    Left = 1088
    Top = 48
  end
  object wwDataSource2: TwwDataSource
    AutoEdit = False
    DataSet = CMClientDataSet2
    Left = 840
    Top = 105
  end
  object QryNumAp: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 546
    Top = 58
  end
  object qryDocumento: TQuery
    DatabaseName = 'BASEDADOS'
    Left = 482
    Top = 58
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 750
    Top = 5
  end
  object CdsMensalidades: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 863
    Top = 211
  end
  object DsMensalidades: TwwDataSource
    DataSet = CdsMensalidades
    Left = 862
    Top = 260
  end
  object CdsMensalidadesAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsMensalidadesAuxAfterOpen
    Left = 951
    Top = 211
  end
  object DsMensalidadesAux: TwwDataSource
    DataSet = CdsMensalidadesAux
    OnDataChange = DsMensalidadesAuxDataChange
    Left = 950
    Top = 260
  end
end
