inherited frmCadCursoMT: TfrmCadCursoMT
  Left = 386
  Top = 250
  Caption = 'Cadastro de Cursos'
  ClientHeight = 522
  ClientWidth = 966
  Constraints.MinWidth = 982
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 966
    Height = 436
    inherited pnlMestre: TPanel
      Width = 964
      Height = 99
      object Label1: TLabel
        Left = 15
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label6: TLabel
        Left = 112
        Top = 9
        Width = 35
        Height = 13
        Caption = 'Título'
        FocusControl = dbedDescr
      end
      object Label2: TLabel
        Left = 15
        Top = 53
        Width = 100
        Height = 13
        Caption = 'Atividade/Projeto'
      end
      object Label8: TLabel
        Left = 384
        Top = 53
        Width = 105
        Height = 13
        Caption = 'Empresa/Entidade'
      end
      object Label16: TLabel
        Left = 552
        Top = 9
        Width = 29
        Height = 13
        Caption = 'Sigla'
      end
      object dbedCodigo: TDBEdit
        Left = 15
        Top = 24
        Width = 91
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'IDCURSO'
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
      object dbedDescr: TDBEdit
        Left = 112
        Top = 24
        Width = 425
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = ds
        MaxLength = 100
        TabOrder = 1
        OnKeyPress = dbedDescrKeyPress
      end
      object dblcUnidNegocio: TwwDBLookupCombo
        Left = 15
        Top = 67
        Width = 346
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'NOME'#9'F')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = cdsUnidNegocio
        LookupField = 'UNIDNEGOC'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
      object dblcEntid: TwwDBLookupCombo
        Left = 384
        Top = 67
        Width = 262
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UPNOME'#9'60'#9'UPNOME'#9'F')
        DataField = 'IDENTIDINSTR'
        DataSource = ds
        LookupTable = CdsEntid
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
        OnEnter = dblcEntidEnter
      end
      object dblcSigla: TwwDBLookupCombo
        Left = 552
        Top = 24
        Width = 92
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'SIGLA'#9'5'#9'Sigla'#9'F')
        DataField = 'IDSIGLACURSO'
        DataSource = ds
        LookupTable = CdsSiglas
        LookupField = 'IDSIGLACURSO'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 100
      Width = 964
      Height = 335
      Tabs.Strings = (
        'Registro de Turmas'
        'Inscritos')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        'dbgrdInscr')
      inherited pgctrlDetalhe: TPageControl
        Width = 866
        Height = 276
        inherited tbsDet: TTabSheet
          Caption = 'Registro de Turmas'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 858
            Height = 248
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Turma'
              'DTINI'#9'10'#9'Data Início'
              'HRINI'#9'10'#9'Hora Início'
              'CARGAHORA'#9'10'#9'Carga Horária'
              'VALORCURSO'#9'10'#9'Valor Curso'
              'NOME'#9'20'#9'Cidade'
              'UF'#9'10'#9'UF')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 858
            Height = 248
            object pgcDados: TPageControl
              Left = 0
              Top = 0
              Width = 858
              Height = 248
              ActivePage = tsInstrutores
              Align = alClient
              TabOrder = 0
              object tsDados: TTabSheet
                Caption = 'Dados Gerais'
                object Label4: TLabel
                  Left = 26
                  Top = 38
                  Width = 36
                  Height = 13
                  Caption = 'Turma'
                  FocusControl = dbeTurma
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbeTurma: TDBEdit
                  Left = 26
                  Top = 53
                  Width = 428
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'DESCRICAO'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MaxLength = 100
                  ParentFont = False
                  TabOrder = 0
                  OnKeyPress = dbeTurmaKeyPress
                end
                object grpCidade: TGroupBox
                  Left = 504
                  Top = 32
                  Width = 296
                  Height = 57
                  Caption = 'Cidade/UF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  object dbeCidNome: TDBEdit
                    Left = 237
                    Top = 22
                    Width = 37
                    Height = 21
                    TabStop = False
                    DataField = 'NOME'
                    DataSource = dsDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    MaxLength = 100
                    ParentFont = False
                    TabOrder = 2
                    Visible = False
                  end
                  object CmpCidades: TCMProcura
                    Left = 11
                    Top = 19
                    Width = 211
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
                    DataField = 'IDCIDADES'
                    LookupChave = 'IDCIDADES'
                    LookupDescricao = 'NOME'
                    MontaSelect = MsCidades
                    LookupTabela = 'CIDADES'
                    DataBaseName = 'BaseDados'
                    ReadOnly = True
                  end
                  object dbeUF: TDBEdit
                    Left = 233
                    Top = 22
                    Width = 45
                    Height = 21
                    TabStop = False
                    DataField = 'UF'
                    DataSource = dsDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    MaxLength = 100
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object grpDatas: TGroupBox
                  Left = 25
                  Top = 106
                  Width = 224
                  Height = 65
                  Caption = ' Datas '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  object Label5: TLabel
                    Left = 8
                    Top = 18
                    Width = 34
                    Height = 13
                    Caption = 'Início'
                  end
                  object Label15: TLabel
                    Left = 116
                    Top = 19
                    Width = 28
                    Height = 13
                    Caption = 'Final'
                  end
                  object dtedtIni: TCMDateTimePicker
                    Left = 8
                    Top = 33
                    Width = 100
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTINI'
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
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                  object dtedtFim: TCMDateTimePicker
                    Left = 117
                    Top = 33
                    Width = 100
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTFIM'
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
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                end
                object grpHora: TGroupBox
                  Left = 260
                  Top = 106
                  Width = 195
                  Height = 65
                  Caption = ' Horários '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  object Label17: TLabel
                    Left = 20
                    Top = 18
                    Width = 34
                    Height = 13
                    Caption = 'Início'
                  end
                  object Label18: TLabel
                    Left = 110
                    Top = 19
                    Width = 28
                    Height = 13
                    Caption = 'Final'
                  end
                  object dtehrFim: TCMDateTimePicker
                    Left = 110
                    Top = 33
                    Width = 70
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
                    TabOrder = 1
                    UnboundDataType = wwDTEdtTime
                    DisplayFormat = 'HH:MM'
                  end
                  object dtehrIni: TCMDateTimePicker
                    Left = 21
                    Top = 33
                    Width = 70
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
                    UnboundDataType = wwDTEdtTime
                    DisplayFormat = 'HH:MM'
                  end
                end
                object grpCargaHora: TGroupBox
                  Left = 504
                  Top = 106
                  Width = 103
                  Height = 65
                  Caption = ' Carga Horária '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 4
                  object dbeCarga: TDBRealEdit
                    Left = 14
                    Top = 26
                    Width = 74
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0')
                    TabOrder = 0
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 0
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'CARGAHORA'
                    DataSource = dsDet
                  end
                end
                object grpValor: TGroupBox
                  Left = 667
                  Top = 106
                  Width = 133
                  Height = 65
                  Caption = ' Valor do Curso '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 5
                  object dbeValor: TDBRealEdit
                    Left = 14
                    Top = 26
                    Width = 104
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
                    DataField = 'VALORCURSO'
                    DataSource = dsDet
                  end
                end
              end
              object tsConteudo: TTabSheet
                Caption = 'Conteúdo e Observações'
                ImageIndex = 1
                object Label12: TLabel
                  Left = 10
                  Top = 13
                  Width = 133
                  Height = 13
                  Caption = 'Conteúdo Programático'
                end
                object Label3: TLabel
                  Left = 437
                  Top = 13
                  Width = 75
                  Height = 13
                  Caption = 'Observações'
                end
                object dbeConteudo: TDBMemo
                  Left = 10
                  Top = 28
                  Width = 359
                  Height = 175
                  DataField = 'CONTEUDO'
                  DataSource = dsDet
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
                object dbeObserva: TDBMemo
                  Left = 437
                  Top = 28
                  Width = 359
                  Height = 175
                  DataField = 'OBSERVACAO'
                  DataSource = dsDet
                  MaxLength = 2000
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
              end
              object tsInstrutores: TTabSheet
                Caption = 'Instrutores'
                ImageIndex = 2
                object lblCCustoDisp: TLabel
                  Left = 4
                  Top = 50
                  Width = 188
                  Height = 33
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Instrutores Internos    Disponíveis'
                  Color = clGray
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  WordWrap = True
                end
                object Label7: TLabel
                  Left = 227
                  Top = 50
                  Width = 188
                  Height = 33
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Instrutores Internos Selecionados'
                  Color = clGray
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  WordWrap = True
                end
                object Label9: TLabel
                  Left = 432
                  Top = 50
                  Width = 191
                  Height = 33
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Instrutores Externos    Disponíveis'
                  Color = clGray
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  WordWrap = True
                end
                object Label10: TLabel
                  Left = 656
                  Top = 50
                  Width = 191
                  Height = 33
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Instrutores Externos Selecionados'
                  Color = clGray
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  WordWrap = True
                end
                object btnAdicionaInt: TSpeedButton
                  Left = 197
                  Top = 115
                  Width = 23
                  Height = 34
                  Hint = 'Inserir o(s) Selecionado(s)'
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                    88888887788888778F88880666666666088888788888F88878F880E6666F6666
                    608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                    66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                    66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                    660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                    6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                    8888888778FFFF77888888888000008888888888877777888888}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnAdicionaIntClick
                end
                object btnRemoveInt: TSpeedButton
                  Left = 197
                  Top = 166
                  Width = 23
                  Height = 34
                  Hint = 'Retirar Selecionado(s)'
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                    88888887788888778F88880666666666088888788888F88878F880E6666F6666
                    608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                    66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                    66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                    660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                    6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                    8888888778FFFF77888888888000008888888888877777888888}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnRemoveIntClick
                end
                object btnAdicionaExt: TSpeedButton
                  Left = 628
                  Top = 115
                  Width = 23
                  Height = 34
                  Hint = ' '
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                    88888887788888778F88880666666666088888788888F88878F880E6666F6666
                    608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                    66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                    66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                    660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                    6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                    8888888778FFFF77888888888000008888888888877777888888}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnAdicionaExtClick
                end
                object btnRemoveExt: TSpeedButton
                  Left = 628
                  Top = 166
                  Width = 23
                  Height = 34
                  Hint = 'Retirar Selecionado(s)'
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                    88888887788888778F88880666666666088888788888F88878F880E6666F6666
                    608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                    66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                    66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                    660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                    6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                    8888888778FFFF77888888888000008888888888877777888888}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnRemoveExtClick
                end
                object grpStatusFuncional: TGroupBox
                  Left = 4
                  Top = 3
                  Width = 413
                  Height = 41
                  Caption = 'Status Funcional'
                  TabOrder = 0
                  object chkAtivos: TCheckBox
                    Left = 28
                    Top = 17
                    Width = 57
                    Height = 16
                    Caption = 'Ativos'
                    Checked = True
                    State = cbChecked
                    TabOrder = 0
                    OnClick = chkAtivosClick
                  end
                  object chkAfastados: TCheckBox
                    Left = 158
                    Top = 17
                    Width = 80
                    Height = 16
                    Caption = 'Afastados'
                    TabOrder = 1
                    OnClick = chkAfastadosClick
                  end
                  object chkDemitidos: TCheckBox
                    Left = 306
                    Top = 17
                    Width = 80
                    Height = 16
                    Caption = 'Demitidos'
                    TabOrder = 2
                    OnClick = chkDemitidosClick
                  end
                end
                object grp7: TGroupBox
                  Left = 431
                  Top = 3
                  Width = 416
                  Height = 41
                  TabOrder = 1
                end
                object grdIntDisp: TDBGrid
                  Left = 4
                  Top = 85
                  Width = 188
                  Height = 135
                  DataSource = dsIntDisp
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  TabOrder = 2
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Arial Narrow'
                  TitleFont.Style = [fsBold]
                  OnCellClick = grdIntDispCellClick
                  OnDrawColumnCell = grdIntDispDrawColumnCell
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEL'
                      Title.Alignment = taCenter
                      Title.Caption = ' '
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -13
                      Title.Font.Name = 'Wingdings'
                      Title.Font.Style = [fsBold]
                      Width = 21
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MATRICULA'
                      Title.Caption = 'Matrícula'
                      Width = 48
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME'
                      Title.Caption = 'Nome'
                      Width = 77
                      Visible = True
                    end>
                end
                object grdIntSel: TDBGrid
                  Left = 227
                  Top = 85
                  Width = 188
                  Height = 135
                  DataSource = dsIntSel
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  TabOrder = 3
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Arial Narrow'
                  TitleFont.Style = [fsBold]
                  OnCellClick = grdIntSelCellClick
                  OnDrawColumnCell = grdIntDispDrawColumnCell
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEL'
                      Title.Alignment = taCenter
                      Title.Caption = ' '
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -13
                      Title.Font.Name = 'Wingdings'
                      Title.Font.Style = [fsBold]
                      Width = 21
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MATRICULA'
                      Title.Caption = 'Matrícula'
                      Width = 48
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME'
                      Title.Caption = 'Nome'
                      Width = 77
                      Visible = True
                    end>
                end
                object grdExtDisp: TDBGrid
                  Left = 432
                  Top = 85
                  Width = 191
                  Height = 135
                  DataSource = dsExtdDisp
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  TabOrder = 4
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Arial Narrow'
                  TitleFont.Style = [fsBold]
                  OnCellClick = grdExtDispCellClick
                  OnDrawColumnCell = grdIntDispDrawColumnCell
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEL'
                      Title.Alignment = taCenter
                      Title.Caption = ' '
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -13
                      Title.Font.Name = 'Wingdings'
                      Title.Font.Style = [fsBold]
                      Width = 21
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME'
                      Title.Caption = 'Nome'
                      Width = 130
                      Visible = True
                    end>
                end
                object grdExtSel: TDBGrid
                  Left = 656
                  Top = 85
                  Width = 191
                  Height = 135
                  DataSource = dsExtSel
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  TabOrder = 5
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Arial Narrow'
                  TitleFont.Style = [fsBold]
                  OnCellClick = grdExtSelCellClick
                  OnDrawColumnCell = grdIntDispDrawColumnCell
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEL'
                      Title.Alignment = taCenter
                      Title.Caption = ' '
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -13
                      Title.Font.Name = 'Wingdings'
                      Title.Font.Style = [fsBold]
                      Width = 21
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME'
                      Title.Caption = 'Nome'
                      Width = 130
                      Visible = True
                    end>
                end
              end
            end
          end
        end
        object tbInscritos: TTabSheet
          Caption = 'Inscritos'
          ImageIndex = 3
          object pnlTurma: TPanel
            Left = 0
            Top = 0
            Width = 858
            Height = 248
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbgrdInscr: TwwDBGrid
            Left = 0
            Top = 0
            Width = 858
            Height = 248
            Selected.Strings = (
              'RAZAOSOCIAL'#9'75'#9'Nome'
              'VALOR'#9'15'#9'Valor Individual'
              'DUR_TOT'#9'15'#9'Carga Horária'
              'REGISTRO'#9'15'#9'Registro')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsInscr
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
      end
      inherited Dock973: TDock97
        Width = 956
      end
      inherited Dock974: TDock97
        Left = 870
        Height = 276
      end
    end
  end
  inherited Dock972: TDock97
    Width = 966
  end
  inherited Dock971: TDock97
    Top = 483
    Width = 966
    inherited tb97Fundo: TToolbar97
      Left = 730
      DockPos = 730
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 561
      DockPos = 561
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 47
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 342
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 392
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 342
    Top = 47
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
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
    Left = 784
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    ApplyEdit = CmeDetalheApplyEdit
    Left = 435
    Top = 65535
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 317
    Top = 87
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 766
    Top = 57
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'indDtInicio'
        Fields = 'DTINI'
        Options = [ixDescending]
      end>
    IndexName = 'indDtInicio'
    Params = <>
    StoreDefs = True
    AfterOpen = CdsDetAfterOpen
    AfterScroll = CdsDetAfterScroll
    Left = 524
    Top = 7
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    Left = 317
    Top = 135
  end
  object cdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 769
    Top = 104
  end
  object CdsSiglas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 110
    Top = 369
  end
  object DsSiglas: TwwDataSource
    AutoEdit = False
    DataSet = CdsSiglas
    Left = 109
    Top = 417
  end
  object cdsInscritos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsInscritosAfterOpen
    Left = 44
    Top = 367
  end
  object dsInscr: TwwDataSource
    AutoEdit = False
    DataSet = cdsInscritos
    Left = 45
    Top = 415
  end
  object cdsIntDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 265
    Top = 379
  end
  object cdsExtDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 497
    Top = 379
  end
  object cdsIntSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 361
    Top = 387
  end
  object cdsExtSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 729
    Top = 379
  end
  object dsIntDisp: TDataSource
    DataSet = cdsIntDisp
    Left = 265
    Top = 427
  end
  object dsIntSel: TDataSource
    DataSet = cdsIntSel
    Left = 369
    Top = 427
  end
  object dsExtdDisp: TDataSource
    DataSet = cdsExtDisp
    Left = 497
    Top = 427
  end
  object dsExtSel: TDataSource
    DataSet = cdsExtSel
    Left = 729
    Top = 427
  end
  object dsConteudo: TDataSource
    DataSet = cdsConteudo
    Left = 601
    Top = 427
  end
  object cdsConteudo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 379
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
      'CIDADES.UF')
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
    Left = 703
    Top = 11
  end
  object CdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 620
    Top = 187
  end
  object cdsCursoAvalDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 861
    Top = 71
  end
  object cdsFatorAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 862
    Top = 111
  end
end
