inherited frmCadRegIncentivo: TfrmCadRegIncentivo
  Left = 213
  Top = 45
  HelpContext = 720012
  Caption = 'Registro de Incentivo'
  ClientHeight = 588
  ClientWidth = 1000
  Constraints.MinWidth = 1016
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1000
    Height = 502
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 996
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
      Width = 996
      Height = 447
      Tabs.Strings = (
        'Cursos')
      inherited pgctrlDetalhe: TPageControl
        Width = 898
        Height = 388
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 890
            Height = 360
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Curso'
              'DESCR_TURMA'#9'45'#9'Turma'
              'SIGLA'#9'25'#9'Sigla'
              'DATREINI'#9'12'#9'Data Início'
              'DATREFIM'#9'12'#9'Data Fim')
            Font.Style = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 890
            Height = 360
            object PageControlDet: TPageControl
              Left = 0
              Top = 0
              Width = 890
              Height = 360
              ActivePage = tbshDadosBasicos
              Align = alClient
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
                  Top = 65
                  Width = 109
                  Height = 13
                  Caption = 'Empresa/Entidade:'
                  FocusControl = dbedMatricula
                end
                object Label34: TLabel
                  Left = 390
                  Top = 27
                  Width = 40
                  Height = 13
                  Caption = 'Turma:'
                end
                object Label3: TLabel
                  Left = 390
                  Top = 65
                  Width = 44
                  Height = 13
                  Caption = 'Cidade:'
                end
                object Label5: TLabel
                  Left = 719
                  Top = 65
                  Width = 21
                  Height = 13
                  Caption = 'UF:'
                end
                object lblEntidade: TDBText
                  Left = 136
                  Top = 65
                  Width = 52
                  Height = 13
                  AutoSize = True
                  DataField = 'RAZAOSOCIAL'
                  DataSource = dsTurma
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblCidade: TDBText
                  Left = 438
                  Top = 65
                  Width = 43
                  Height = 13
                  AutoSize = True
                  DataField = 'NOME'
                  DataSource = dsTurma
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblTurma: TDBText
                  Left = 438
                  Top = 27
                  Width = 40
                  Height = 13
                  AutoSize = True
                  DataField = 'DESCRICAO'
                  DataSource = dsTurma
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblUF: TDBText
                  Left = 746
                  Top = 65
                  Width = 24
                  Height = 13
                  AutoSize = True
                  DataField = 'UF'
                  DataSource = dsTurma
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
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
                  DataField = 'IDCURSO'
                  LookupChave = 'IDCURSO'
                  LookupDescricao = 'DESCRICAO'
                  MontaSelect = MontaSelectCurso
                  LookupTabela = 'CM.CURSO'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
                object grbDiploma: TGroupBox
                  Left = 501
                  Top = 108
                  Width = 177
                  Height = 137
                  Caption = ' Certificado/Diploma '
                  TabOrder = 3
                  object lblDataEntrega: TLabel
                    Left = 42
                    Top = 83
                    Width = 93
                    Height = 13
                    Caption = 'Data de entrega'
                    FocusControl = dbedMatricula
                  end
                  object EdtDataEntrega: TCMDateTimePicker
                    Left = 39
                    Top = 100
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
                    TabOrder = 1
                    UnboundDataType = wwDTEdtDate
                    DisplayFormat = 'dd/MM/yyyy'
                    OnChange = EdtDataEntregaChange
                    OnExit = EdtDataEntregaExit
                  end
                  object CkbProjetoEntregue: TDBCheckBox
                    Left = 18
                    Top = 38
                    Width = 78
                    Height = 17
                    Caption = 'Entregue'
                    DataField = 'entregue'
                    DataSource = dsDet
                    TabOrder = 0
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = CkbProjetoEntregueClick
                  end
                end
                object grbDesliga: TGroupBox
                  Left = 694
                  Top = 108
                  Width = 174
                  Height = 137
                  Caption = ' Desligamento do Programa '
                  TabOrder = 4
                  object lblDataDesliga: TLabel
                    Left = 40
                    Top = 83
                    Width = 28
                    Height = 13
                    Caption = 'Data'
                    FocusControl = dbedMatricula
                  end
                  object ckbDesliga: TDBCheckBox
                    Left = 18
                    Top = 38
                    Width = 78
                    Height = 17
                    Caption = 'Sim'
                    DataField = 'FLGSIM'
                    DataSource = dsDet
                    TabOrder = 0
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = ckbDesligaClick
                  end
                  object EdtDataDeslig: TCMDateTimePicker
                    Left = 41
                    Top = 100
                    Width = 100
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTDESLPROG'
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
                    UnboundDataType = wwDTEdtDate
                    DisplayFormat = 'dd/MM/yyyy'
                    OnExit = EdtDataDesligExit
                  end
                end
                object grbData: TGroupBox
                  Left = 291
                  Top = 108
                  Width = 193
                  Height = 137
                  Caption = ' Datas '
                  TabOrder = 2
                  object lblFimDaFidelidade: TLabel
                    Left = 45
                    Top = 83
                    Width = 100
                    Height = 13
                    Caption = 'Fim da Fidelidade'
                    FocusControl = dbedMatricula
                  end
                  object Label21: TLabel
                    Left = 16
                    Top = 28
                    Width = 69
                    Height = 13
                    Caption = 'Data Início:'
                    FocusControl = dbedMatricula
                  end
                  object Label22: TLabel
                    Left = 17
                    Top = 55
                    Width = 55
                    Height = 13
                    Caption = 'Data Fim:'
                    FocusControl = dbedMatricula
                  end
                  object lblDtIni: TDBText
                    Left = 104
                    Top = 28
                    Width = 32
                    Height = 13
                    AutoSize = True
                    DataField = 'DTINI'
                    DataSource = dsTurma
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object lblDtFim: TDBText
                    Left = 104
                    Top = 55
                    Width = 37
                    Height = 13
                    AutoSize = True
                    DataField = 'DTFIM'
                    DataSource = dsTurma
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object DtpFimdaFidelidade: TCMDateTimePicker
                    Left = 45
                    Top = 100
                    Width = 110
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATFID'
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
                    UnboundDataType = wwDTEdtDate
                    DisplayFormat = 'dd/MM/yyyy'
                    OnExit = DtpFimdaFidelidadeExit
                  end
                end
                object grbHora: TGroupBox
                  Left = 22
                  Top = 108
                  Width = 251
                  Height = 137
                  Caption = ' Horas '
                  TabOrder = 1
                  object Label7: TLabel
                    Left = 20
                    Top = 34
                    Width = 83
                    Height = 13
                    Caption = 'Carga Horária:'
                    FocusControl = dbedMatricula
                  end
                  object Label8: TLabel
                    Left = 20
                    Top = 67
                    Width = 69
                    Height = 13
                    Caption = 'Hora Início:'
                    FocusControl = dbedMatricula
                  end
                  object Label6: TLabel
                    Left = 20
                    Top = 99
                    Width = 55
                    Height = 13
                    Caption = 'Hora Fim:'
                    FocusControl = dbedMatricula
                  end
                  object lblCarga: TDBText
                    Left = 136
                    Top = 34
                    Width = 38
                    Height = 13
                    AutoSize = True
                    DataField = 'CARGAHORA'
                    DataSource = dsTurma
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object lblHoraIni: TDBText
                    Left = 136
                    Top = 67
                    Width = 44
                    Height = 13
                    AutoSize = True
                    DataField = 'HRINI'
                    DataSource = dsTurma
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object lblHoraFim: TDBText
                    Left = 136
                    Top = 99
                    Width = 49
                    Height = 13
                    AutoSize = True
                    DataField = 'HRFIM'
                    DataSource = dsTurma
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
              end
              object tbshObservacaoCurso: TTabSheet
                Caption = 'Observação'
                ImageIndex = 2
                object mmObservacaoCurso: TDBMemo
                  Left = 0
                  Top = 0
                  Width = 882
                  Height = 332
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
                  Width = 882
                  Height = 332
                  ActivePage = TabSheet1
                  Align = alClient
                  TabOrder = 0
                  object TabSheet1: TTabSheet
                    Caption = 'Valores'
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
                      TabOrder = 2
                      Visible = False
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VALOR'
                      DataSource = dsDet
                    end
                    object GroupBox1: TGroupBox
                      Left = 0
                      Top = 136
                      Width = 874
                      Height = 168
                      Align = alClient
                      Caption = 'Mensalidades'
                      TabOrder = 0
                      object grdDespesas: TwwDBGrid
                        Left = 143
                        Top = 15
                        Width = 729
                        Height = 151
                        Selected.Strings = (
                          'NPARCELA'#9'10'#9'No. Parcela'
                          'DTVENCIMENTOPARC'#9'12'#9'Data Vencimento'
                          'VALORMENSALIDADE'#9'12'#9'Valor Mensalidade'
                          'VALOREMPREGADO'#9'10'#9'Valor Empregado'
                          'VALOREMPRESA'#9'10'#9'Valor Empresa'
                          'VALOREMPRESA_AT'#9'12'#9'Vlr. Empresa Atual'
                          'FLGATINGIUMETA'#9'10'#9'Atingiu Teto')
                        IniAttributes.Delimiter = ';;'
                        TitleColor = clBtnFace
                        FixedCols = 0
                        ShowHorzScrollBar = True
                        Align = alClient
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
                      object Panel2: TPanel
                        Left = 2
                        Top = 15
                        Width = 141
                        Height = 151
                        Align = alLeft
                        BevelOuter = bvNone
                        TabOrder = 1
                        object lblVencimentoParcela: TLabel
                          Left = 3
                          Top = 9
                          Width = 98
                          Height = 13
                          Caption = 'Data Vencimento'
                        end
                        object lblVlrMensalidade: TLabel
                          Left = 3
                          Top = 49
                          Width = 105
                          Height = 13
                          Caption = 'Valor Mensalidade'
                        end
                        object EdtDtVencimento: TCMDateTimePicker
                          Left = 3
                          Top = 25
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
                          TabOrder = 0
                        end
                        object btnDespOk: TBitBtn
                          Left = 111
                          Top = 22
                          Width = 25
                          Height = 27
                          TabOrder = 1
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
                        object EdtVlrMensalidade: TDBRealEdit
                          Left = 3
                          Top = 65
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
                        object btnDespCancel: TBitBtn
                          Left = 111
                          Top = 57
                          Width = 25
                          Height = 27
                          Cancel = True
                          TabOrder = 3
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
                    end
                    object GroupBox2: TGroupBox
                      Left = 0
                      Top = 71
                      Width = 874
                      Height = 65
                      Align = alTop
                      TabOrder = 1
                      object lblVlrEmpresa: TLabel
                        Left = 236
                        Top = 14
                        Width = 82
                        Height = 13
                        Caption = 'Valor Empresa'
                      end
                      object lblVlrEmpregado: TLabel
                        Left = 359
                        Top = 14
                        Width = 97
                        Height = 13
                        Caption = 'Valor Empregado'
                      end
                      object lblQtdParcReal: TLabel
                        Left = 597
                        Top = 13
                        Width = 88
                        Height = 13
                        Caption = 'Qtd Parc. Paga'
                      end
                      object lblQtdParcPrevista: TLabel
                        Left = 715
                        Top = 13
                        Width = 105
                        Height = 13
                        Caption = 'Qtd Parc. Prevista'
                      end
                      object lblTotalCurso: TLabel
                        Left = 10
                        Top = 14
                        Width = 66
                        Height = 13
                        Caption = 'Total Curso'
                        FocusControl = dbedMatricula
                      end
                      object EdtQtdParcela: TwwDBEdit
                        Left = 598
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
                        Left = 714
                        Top = 27
                        Width = 105
                        Height = 21
                        DataField = 'QTDPARCPREV'
                        DataSource = DsMensalidades
                        TabOrder = 1
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object EdtVlrCurso: TRealEdit
                        Left = 10
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
                        Left = 237
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
                        Left = 360
                        Top = 28
                        Width = 97
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
                    object Panel1: TPanel
                      Left = 0
                      Top = 0
                      Width = 874
                      Height = 71
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 3
                      object lblPartEmpresa: TLabel
                        Left = 617
                        Top = 13
                        Width = 83
                        Height = 13
                        Caption = 'Parte Empresa'
                        Visible = False
                      end
                      object lblPartEmpregado: TLabel
                        Left = 732
                        Top = 13
                        Width = 98
                        Height = 13
                        Caption = 'Parte Empregado'
                        Visible = False
                      end
                      object GroupBox3: TGroupBox
                        Left = 0
                        Top = 4
                        Width = 281
                        Height = 66
                        TabOrder = 0
                        object lblValorDevolver: TLabel
                          Left = 144
                          Top = 8
                          Width = 114
                          Height = 25
                          AutoSize = False
                          Caption = 'Valor a Devolver na Data Atual'
                          FocusControl = dbedMatricula
                          WordWrap = True
                        end
                        object LblVlrPrevistoCurso: TLabel
                          Left = 9
                          Top = 9
                          Width = 80
                          Height = 27
                          AutoSize = False
                          Caption = 'Valor Previsto do Curso'
                          FocusControl = dbedMatricula
                          WordWrap = True
                        end
                        object btnAtualizarMeta: TBitBtn
                          Left = 242
                          Top = 35
                          Width = 24
                          Height = 24
                          TabOrder = 1
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
                        object grpVlrDevolver: TGroupBox
                          Left = 143
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
                        object EdtVlrPrevistoCurso: TDBRealEdit
                          Left = 9
                          Top = 37
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
                          DataField = 'VALOR'
                          DataSource = dsDet
                        end
                      end
                      object dbrgControle: TDBRadioGroup
                        Left = 288
                        Top = 7
                        Width = 314
                        Height = 63
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
                        OnClick = dbrgControleClick
                      end
                      object EdtvlrPartEmpresa: TwwDBEdit
                        Left = 617
                        Top = 27
                        Width = 106
                        Height = 21
                        DataField = 'PARTEMPRESA'
                        DataSource = dsDet
                        Enabled = False
                        TabOrder = 2
                        UnboundDataType = wwDefault
                        Visible = False
                        WantReturns = False
                        WordWrap = False
                        OnExit = EdtvlrPartEmpresaExit
                        OnKeyPress = EdtvlrPartEmpresaKeyPress
                        OnKeyUp = EdtvlrPartEmpresaKeyUp
                      end
                      object EdtVlrPartEmpregado: TwwDBEdit
                        Left = 733
                        Top = 27
                        Width = 106
                        Height = 21
                        DataField = 'PARTEMPREGADO'
                        DataSource = dsDet
                        Enabled = False
                        TabOrder = 3
                        UnboundDataType = wwDefault
                        Visible = False
                        WantReturns = False
                        WordWrap = False
                        OnExit = EdtVlrPartEmpregadoExit
                        OnKeyPress = EdtVlrPartEmpregadoKeyPress
                        OnKeyUp = EdtVlrPartEmpregadoKeyUp
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 988
      end
      inherited Dock974: TDock97
        Left = 902
        Height = 388
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1000
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
    end
  end
  inherited Dock971: TDock97
    Top = 549
    Width = 1000
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 566
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 397
      DockPos = 397
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
    Left = 536
    Top = 49
  end
  inherited ImlPadrao: TImageList
    Left = 775
    Top = 461
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    OnOpenDataSet = CmeCadastroOpenDataSet
    ApplyEdit = CmeCadastroApplyEdit
    Left = 145
    Top = 93
  end
  inherited Cds: TCMClientDataSet
    Left = 532
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Left = 375
    Top = 3
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 224
    Top = 93
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 580
    Top = 49
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'iDataIni'
        Fields = 'DATREINI'
        Options = [ixDescending]
      end>
    IndexName = 'iDataIni'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsDetAfterScroll
    Left = 583
    Top = 5
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 821
    Top = 56
  end
  object dsCargo: TwwDataSource
    AutoEdit = False
    DataSet = CdsCargo
    OnStateChange = dsDetStateChange
    Left = 664
    Top = 73
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 665
    Top = 11
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
    Left = 448
    Top = 3
  end
  object MontaSelectCurso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'C.DESCRICAO'
      'C.IDCURSO'
      'C.ABREV'
      'T.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado'
      'Turma')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CURSO C'
      'TURMA T'
      'PESSOA P')
    CamposChave.Strings = (
      'C.IDCURSO'
      'T.IDTURMA')
    Filtro.Strings = (
      'C.IDCURSO = T.IDCURSO'
      'P.IDPESSOA = C.IDENTIDINSTR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '10'
      '10'
      '100')
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
    Left = 590
    Top = 377
  end
  object CdsEscala: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 817
    Top = 3
  end
  object CdsGeraTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 749
    Top = 58
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 876
    Top = 9
  end
  object dsTurma: TwwDataSource
    AutoEdit = False
    DataSet = cdsTurma
    Left = 352
    Top = 161
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
    Left = 791
    Top = 339
  end
  object DsMensalidades: TwwDataSource
    DataSet = CdsMensalidades
    Left = 790
    Top = 388
  end
  object CdsMensalidadesAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsMensalidadesAuxAfterOpen
    Left = 887
    Top = 339
  end
  object DsMensalidadesAux: TwwDataSource
    DataSet = CdsMensalidadesAux
    OnDataChange = DsMensalidadesAuxDataChange
    Left = 886
    Top = 388
  end
  object cdsTurma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 357
    Top = 112
  end
  object cdsInscritos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 877
    Top = 64
  end
end
