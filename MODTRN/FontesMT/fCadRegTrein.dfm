inherited frmCadRegTrein: TfrmCadRegTrein
  Left = 46
  Top = 61
  HelpContext = 720012
  Caption = 'Registro Individual de Treinamento'
  ClientHeight = 469
  ClientWidth = 705
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 705
    Height = 383
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 701
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
      Width = 701
      Height = 328
      Tabs.Strings = (
        'Cursos'
        'Avaliações dos Cursos'
        'Avaliações do Aluno')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdAval'
        'dbgrdAval2')
      inherited pgctrlDetalhe: TPageControl
        Width = 603
        Height = 269
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 595
            Height = 241
            Selected.Strings = (
              'DESCRICAO'#9'41'#9'Curso'
              'DATPLINI'#9'12'#9'Data Plan. Início'
              'DATPLFIM'#9'11'#9'Data Plan. Fim'
              'DATREINI'#9'12'#9'Data Real Início'
              'DATREFIM'#9'10'#9'Data Real Fim')
            Font.Style = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 595
            Height = 241
            object PageControlDet: TPageControl
              Left = 0
              Top = 0
              Width = 595
              Height = 241
              ActivePage = tbshDadosBasicos
              Align = alClient
              TabOrder = 0
              object tbshDadosBasicos: TTabSheet
                Caption = 'Dados Básicos'
                object Label4: TLabel
                  Left = 6
                  Top = -1
                  Width = 33
                  Height = 13
                  Caption = 'Curso'
                  FocusControl = dbedMatricula
                end
                object Label2: TLabel
                  Left = 6
                  Top = 45
                  Width = 158
                  Height = 13
                  Caption = 'Empresa/Entidade/Instrutor'
                  FocusControl = dbedMatricula
                end
                object Label3: TLabel
                  Left = 329
                  Top = 45
                  Width = 174
                  Height = 13
                  Caption = 'Instrutor da Empresa/Entidade'
                  FocusControl = dbedMatricula
                end
                object CMProcuraCurso: TCMProcura
                  Left = 6
                  Top = 13
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
                  Left = 6
                  Top = 59
                  Width = 320
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'NOME')
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
                object dblckInstrutor: TwwDBLookupCombo
                  Left = 329
                  Top = 59
                  Width = 240
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'NOME'#9'F')
                  DataField = 'IDINSTRUTOR'
                  DataSource = dsDet
                  LookupTable = CdsInstrutor
                  LookupField = 'IDPESSOA'
                  Style = csDropDownList
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
                object pgctrlDados: TPageControl
                  Left = 6
                  Top = 88
                  Width = 240
                  Height = 131
                  ActivePage = tbshDatas
                  TabOrder = 3
                  object tbshDatas: TTabSheet
                    Caption = 'Datas'
                    object Label5: TLabel
                      Left = 7
                      Top = 10
                      Width = 94
                      Height = 13
                      Caption = 'Início Planejado'
                      FocusControl = dbedMatricula
                    end
                    object Label20: TLabel
                      Left = 118
                      Top = 10
                      Width = 88
                      Height = 13
                      Caption = 'Final Planejado'
                      FocusControl = dbedMatricula
                    end
                    object Label21: TLabel
                      Left = 7
                      Top = 60
                      Width = 78
                      Height = 13
                      Caption = 'Início Efetivo'
                      FocusControl = dbedMatricula
                    end
                    object Label22: TLabel
                      Left = 118
                      Top = 60
                      Width = 72
                      Height = 13
                      Caption = 'Final Efetivo'
                      FocusControl = dbedMatricula
                    end
                    object cmDatPlIni: TCMDateTimePicker
                      Left = 7
                      Top = 24
                      Width = 100
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATPLINI'
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
                    end
                    object cmDatPlFim: TCMDateTimePicker
                      Left = 118
                      Top = 24
                      Width = 100
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATPLFIM'
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
                    object cmDatReIni: TCMDateTimePicker
                      Left = 7
                      Top = 74
                      Width = 100
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
                      TabOrder = 2
                    end
                    object cmDatReFim: TCMDateTimePicker
                      Left = 118
                      Top = 74
                      Width = 100
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
                      TabOrder = 3
                    end
                  end
                  object tbshCargaHoraria: TTabSheet
                    Caption = 'Carga Horária'
                    ImageIndex = 1
                    object Label23: TLabel
                      Left = 7
                      Top = 10
                      Width = 37
                      Height = 13
                      Caption = 'Teoria'
                      FocusControl = dbedMatricula
                    end
                    object Label24: TLabel
                      Left = 118
                      Top = 10
                      Width = 41
                      Height = 13
                      Caption = 'Prática'
                      FocusControl = dbedMatricula
                    end
                    object Label25: TLabel
                      Left = 66
                      Top = 60
                      Width = 30
                      Height = 13
                      Caption = 'Total'
                      FocusControl = dbedMatricula
                    end
                    object dbedDurTeor: TDBRealEdit
                      Left = 7
                      Top = 24
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 0
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'DUR_TEOR'
                      DataSource = dsDet
                    end
                    object dbedDurPrat: TDBRealEdit
                      Left = 118
                      Top = 24
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 1
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'DUR_PRAT'
                      DataSource = dsDet
                    end
                    object dbedDurTot: TDBRealEdit
                      Left = 66
                      Top = 74
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 2
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'DUR_TOT'
                      DataSource = dsDet
                    end
                  end
                  object tbshDespesas: TTabSheet
                    Caption = 'Despesas'
                    ImageIndex = 2
                    object Label26: TLabel
                      Left = 7
                      Top = 10
                      Width = 33
                      Height = 13
                      Caption = 'Curso'
                      FocusControl = dbedMatricula
                    end
                    object Label28: TLabel
                      Left = 118
                      Top = 10
                      Width = 74
                      Height = 13
                      Caption = 'Hospedagem'
                      FocusControl = dbedMatricula
                    end
                    object Label27: TLabel
                      Left = 8
                      Top = 60
                      Width = 42
                      Height = 13
                      Caption = 'Viagem'
                      FocusControl = dbedMatricula
                    end
                    object Label29: TLabel
                      Left = 118
                      Top = 60
                      Width = 38
                      Height = 13
                      Caption = 'Outras'
                      FocusControl = dbedMatricula
                    end
                    object dbedValor: TDBRealEdit
                      Left = 7
                      Top = 24
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 0
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VALOR'
                      DataSource = dsDet
                    end
                    object dbedHosped: TDBRealEdit
                      Left = 118
                      Top = 24
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 1
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'DESP_ESTAD'
                      DataSource = dsDet
                    end
                    object dbedViagem: TDBRealEdit
                      Left = 7
                      Top = 74
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 2
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'DESP_VIAG'
                      DataSource = dsDet
                    end
                    object dbedOutras: TDBRealEdit
                      Left = 118
                      Top = 74
                      Width = 100
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '      0,00')
                      TabOrder = 3
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
                object dbrgControle: TDBRadioGroup
                  Left = 329
                  Top = 3
                  Width = 240
                  Height = 41
                  Caption = 'É Parte dos Controles Internos?'
                  Columns = 2
                  DataField = 'FLGCONTROLE'
                  DataSource = dsDet
                  Items.Strings = (
                    'Sim'
                    'Não')
                  TabOrder = 4
                  Values.Strings = (
                    '1'
                    '0')
                  OnChange = dbrgControleChange
                end
                object gbxResult: TGroupBox
                  Left = 252
                  Top = 88
                  Width = 317
                  Height = 132
                  Caption = 'Resultado'
                  TabOrder = 5
                  object LblAprov: TLabel
                    Left = 221
                    Top = 104
                    Width = 96
                    Height = 16
                    Alignment = taCenter
                    AutoSize = False
                    Caption = 'LblAprov'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                    Layout = tlCenter
                    Visible = False
                  end
                  object imgAprov: TImage
                    Left = 276
                    Top = 66
                    Width = 37
                    Height = 25
                    Picture.Data = {
                      055449636F6E0000010001002020100000000000E80200001600000028000000
                      2000000040000000010004000000000080020000000000000000000000000000
                      0000000000000000000080000080000000808000800000008000800080800000
                      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                      FFFFFF0000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000330000000000000000000000033303303303300
                      0000000000000003303330333003003300000000000000033003330330002333
                      0000000000000030000033003033333000000000000033333330000003330003
                      33000000080333333333333333300233330000000F033333333333333302333B
                      B03000004F8333333333333333333BB003BB00004FF3333333333333B33BB003
                      3BBB00004FF333333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBB
                      BB0300F04FFF33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB00
                      33330FF044FFF8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B33000333
                      3330FF44444FF88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33B
                      B38FF4444444FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBB
                      BBFF444444440000000303BBB3300000BFF44444440000000000000000000000
                      0FF4444400000000000000000000000000444444000000000000000000000000
                      0000444400000000000000000000000000000444000000000000000000000000
                      0000000400000000000000000000000000000000000000000000000000000000
                      00000000FFFFFFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007F
                      E000003F0000001F0000001F0000000F00000007000000070000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000C000000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFE
                      FFFFFFFF}
                  end
                  object imgReprov: TImage
                    Left = 284
                    Top = 69
                    Width = 21
                    Height = 29
                    Picture.Data = {
                      07544269746D617066010000424D660100000000000076000000280000001400
                      0000140000000100040000000000F00000000000000000000000100000001000
                      0000000000000000800000800000008080008000000080008000808000008080
                      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                      FF00888888888888888888880000888888888888888888980000889888888888
                      8888898800008899887777777777988800008899900000000009988800008889
                      90BFFFBFFF9988880000888899FCCCCCCF97888800008888999FBFFFB9978888
                      000088888999CCC9990788880000888880999FB99F0788880000888880FC9999
                      CF0788880000888880FF9999BF0788880000888880FC99990007888800008888
                      80B99F099F0788880000888880999F099998888800008888999FBF0F08998888
                      0000889999000000888998880000889998888888888889880000888888888888
                      888888980000888888888888888888880000}
                    Transparent = True
                  end
                  object dbrgAvalTeor: TDBRadioGroup
                    Left = 11
                    Top = 15
                    Width = 127
                    Height = 65
                    Caption = 'Avaliação Teórica?'
                    DataField = 'FLGAVALTEOR'
                    DataSource = dsDet
                    Items.Strings = (
                      'Sim'
                      'Não')
                    TabOrder = 0
                    Values.Strings = (
                      '1'
                      '0')
                    OnChange = dbrgAvalTeorChange
                  end
                  object dbedAvTeor: TDBRealEdit
                    Left = 69
                    Top = 30
                    Width = 54
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 1
                    WordWrap = False
                    OnChange = dbedAvTeorChange
                    IntDigits = 10
                    DecDigits = 0
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'AVALTEOR'
                    DataSource = dsDet
                  end
                  object dbrgAvalPrat: TDBRadioGroup
                    Left = 146
                    Top = 15
                    Width = 127
                    Height = 65
                    Caption = 'Avaliação Prática?'
                    DataField = 'FLGAVALPRAT'
                    DataSource = dsDet
                    Items.Strings = (
                      'Sim'
                      'Não')
                    TabOrder = 2
                    Values.Strings = (
                      '1'
                      '0')
                    OnChange = dbrgAvalPratChange
                  end
                  object dbedAvPrat: TDBRealEdit
                    Left = 205
                    Top = 30
                    Width = 54
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 3
                    WordWrap = False
                    OnChange = dbedAvTeorChange
                    IntDigits = 10
                    DecDigits = 0
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'AVALPRAT'
                    DataSource = dsDet
                  end
                  object dbrgAvalCurs: TDBRadioGroup
                    Left = 11
                    Top = 84
                    Width = 202
                    Height = 41
                    Caption = 'Avaliação do Curso?'
                    Columns = 2
                    DataField = 'FLGAVALCURS'
                    DataSource = dsDet
                    Items.Strings = (
                      'Sim'
                      'Não')
                    TabOrder = 4
                    Values.Strings = (
                      '1'
                      '0')
                    OnChange = dbrgAvalCursChange
                  end
                  object dbedAvCurs: TDBEdit
                    Left = 65
                    Top = 98
                    Width = 46
                    Height = 21
                    DataField = 'AVALCURSO'
                    DataSource = dsDet
                    TabOrder = 5
                  end
                end
              end
              object tbshDadosComplementares: TTabSheet
                Caption = 'Dados Complementares'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 10
                  Top = 10
                  Width = 88
                  Height = 13
                  Caption = 'Dias e Horários'
                end
                object Label7: TLabel
                  Left = 297
                  Top = 10
                  Width = 102
                  Height = 13
                  Caption = 'Outros Instrutores'
                end
                object gbxLocalCurso: TGroupBox
                  Left = 9
                  Top = 164
                  Width = 568
                  Height = 44
                  Caption = 'Local do Curso e/ou Diretivas'
                  TabOrder = 0
                  object dbedLocalCurso: TDBEdit
                    Left = 7
                    Top = 15
                    Width = 522
                    Height = 21
                    DataField = 'LOCALCURSO'
                    DataSource = dsDet
                    TabOrder = 0
                  end
                  object bbtnProcLocal: TBitBtn
                    Left = 535
                    Top = 15
                    Width = 25
                    Height = 19
                    Hint = 'Busca no Cadastro de Locais'
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = bbtnProcLocalClick
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
                object bbtnAlimenta: TBitBtn
                  Left = 149
                  Top = 2
                  Width = 25
                  Height = 21
                  Hint = 'Coloca as Datas do Evento com Horários a Preencher'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = bbtnAlimentaClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
                    777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
                    79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
                    7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
                    777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
                    79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
                    CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
                  NumGlyphs = 2
                end
                object bbtnBuscaInstrutorExterno: TBitBtn
                  Left = 437
                  Top = 2
                  Width = 25
                  Height = 21
                  Hint = 'Busca Instrutores da Empresa/Entidade'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = bbtnBuscaInstrutorExternoClick
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
                object bbtnBuscaInstrutorInterno: TBitBtn
                  Left = 501
                  Top = 2
                  Width = 25
                  Height = 21
                  Hint = 'Busca Instrutores Internos'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = bbtnBuscaInstrutorInternoClick
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
                object edDataHora: TwwDBEdit
                  Left = 9
                  Top = 24
                  Width = 280
                  Height = 133
                  AutoSize = False
                  DataField = 'DATAHORA'
                  DataSource = dsDet
                  ShowVertScrollBar = True
                  TabOrder = 4
                  UnboundDataType = wwDefault
                  WantReturns = True
                  WordWrap = True
                end
                object edInstrutores: TwwDBEdit
                  Left = 297
                  Top = 24
                  Width = 280
                  Height = 133
                  AutoSize = False
                  DataField = 'INSTRUTORES'
                  DataSource = dsDet
                  ShowVertScrollBar = True
                  TabOrder = 5
                  UnboundDataType = wwDefault
                  WantReturns = True
                  WordWrap = True
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
            Width = 595
            Height = 241
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
            Width = 595
            Height = 241
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
                ItemHeight = 13
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
            Width = 595
            Height = 241
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
            Width = 595
            Height = 241
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
                ItemHeight = 13
                TabOrder = 0
                OnChange = cmbAvalConceitual2Change
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 693
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
        Left = 607
        Height = 269
      end
    end
  end
  inherited Dock972: TDock97
    Width = 705
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
        OnClick = sbtnProcurarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 430
    Width = 705
    inherited tb97Fundo: TToolbar97
      Left = 533
      DockPos = 566
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 397
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 639
    Top = 370
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 480
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 639
    Top = 357
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 653
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 452
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 639
    Top = 283
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 653
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 552
    Top = 1
  end
  object dsAval: TwwDataSource
    AutoEdit = False
    DataSet = CdsAval
    Left = 590
    Top = 13
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 149
    Top = 425
  end
  object CdsInstrutor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 427
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = CdsDetBeforeEdit
    AfterScroll = CdsDetAfterScroll
    Left = 517
    Top = 1
  end
  object CdsAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAvalAfterScroll
    Left = 590
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 414
  end
  object dsCargo: TwwDataSource
    AutoEdit = False
    DataSet = CdsCargo
    OnStateChange = dsDetStateChange
    Left = 16
    Top = 425
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 412
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 638
    Top = 269
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 638
    Top = 256
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
    Left = 638
    Top = 242
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 517
    Top = 265
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
    Left = 301
    Top = 273
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
    Left = 397
    Top = 273
  end
  object CdsEscala: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 590
    Top = 80
  end
  object dsAval2: TwwDataSource
    AutoEdit = False
    DataSet = CdsAval2
    Left = 510
    Top = 85
  end
  object CdsAval2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAval2AfterScroll
    Left = 510
    Top = 72
  end
end
