inherited FrmParamInvest: TFrmParamInvest
  Left = 280
  Top = 138
  HelpContext = 790000
  Caption = 'Parametros do Sistema'
  ClientHeight = 478
  ClientWidth = 784
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label16: TLabel [0]
    Left = 8
    Top = 16
    Width = 157
    Height = 13
    Caption = 'Data do último fechamento '
  end
  inherited pnlFundo: TPanel
    Width = 784
    Height = 392
    object pgcDetalhes: TPageControl
      Left = 1
      Top = 1
      Width = 782
      Height = 390
      ActivePage = tbsRVariavel
      Align = alClient
      MultiLine = True
      Style = tsFlatButtons
      TabOrder = 0
      object tbsSistema: TTabSheet
        Caption = 'Sistema'
        ImageIndex = 13
        object pnlSistema: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          TabOrder = 0
          object pgcSistema: TPageControl
            Left = 1
            Top = 1
            Width = 772
            Height = 357
            ActivePage = tbsGeral
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tbsGeral: TTabSheet
              Caption = 'Geral'
              object pnlGeral: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 326
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel3: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 324
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 14
                    Top = 10
                    Width = 115
                    Height = 13
                    Caption = 'Moeda Preferencial '
                  end
                  object Label64: TLabel
                    Left = 14
                    Top = 51
                    Width = 126
                    Height = 13
                    Caption = 'Plano / Patrocinadora'
                  end
                  object Label57: TLabel
                    Left = 14
                    Top = 91
                    Width = 148
                    Height = 13
                    Caption = 'Autorizador de Operações'
                  end
                  object lblPrzVencCFianca: TLabel
                    Left = 14
                    Top = 133
                    Width = 250
                    Height = 13
                    Caption = 'Prazo Aviso Vencimento de Carta de Fiança'
                    WordWrap = True
                  end
                  object Label1: TLabel
                    Left = 14
                    Top = 173
                    Width = 241
                    Height = 13
                    Caption = 'Máscara do Setor de Atividade do Emissor'
                  end
                  object Label2: TLabel
                    Left = 14
                    Top = 215
                    Width = 256
                    Height = 13
                    Caption = 'Máscara de Classificação de Enquadramento'
                  end
                  object DbLkcBuscaMoeda: TwwDBLookupCombo
                    Left = 14
                    Top = 24
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'MOEDESC'#9'40'#9'Moeda')
                    DataField = 'MOECODIGO'
                    DataSource = ds
                    LookupTable = QryBuscaMoeda
                    LookupField = 'MOECODIGO'
                    Options = [loColLines, loRowLines, loTitles]
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                    ShowMatchText = True
                  end
                  object dblkPlanPrevCtbPatro: TwwDBLookupCombo
                    Left = 14
                    Top = 65
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'PLANPRVCONTABPATRO'#9'113'#9'Plano / Patrocinadora'#9'F')
                    DataField = 'IDPLANPREVCTBPATR'
                    DataSource = ds
                    LookupTable = qryPatroPlanPrevContab
                    LookupField = 'IDPLANPREVCTBPATR'
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dblAutorizaOrdem: TwwDBLookupCombo
                    Left = 14
                    Top = 105
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEUSUARIO'#9'20'#9'Autorizador'#9'F')
                    DataField = 'IDAUTORIZAORDEM'
                    DataSource = ds
                    LookupTable = qryAutorizaOper
                    LookupField = 'IDUSUARIO'
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dbrePrzVencCFianca: TDBRealEdit
                    Left = 14
                    Top = 147
                    Width = 48
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '10')
                    TabOrder = 3
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 0
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'PRZVENCCFIANCA'
                    DataSource = ds
                  end
                  object DBEdMascara: TwwDBEdit
                    Left = 14
                    Top = 187
                    Width = 289
                    Height = 21
                    DataField = 'MASCSETOREMISSOR'
                    DataSource = ds
                    TabOrder = 4
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                    OnKeyPress = DBEdMascaraKeyPress
                  end
                  object DbMascClassif: TDBEdit
                    Left = 14
                    Top = 229
                    Width = 289
                    Height = 21
                    DataField = 'MASCCLASSIFINV'
                    DataSource = ds
                    TabOrder = 5
                    OnKeyPress = DbMascClassifKeyPress
                  end
                end
                object Panel4: TPanel
                  Left = 383
                  Top = 1
                  Width = 380
                  Height = 324
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label17: TLabel
                    Left = 14
                    Top = 91
                    Width = 34
                    Height = 13
                    Caption = 'CPMF'
                  end
                  object Label76: TLabel
                    Left = 14
                    Top = 10
                    Width = 216
                    Height = 13
                    Caption = 'Indíce - EQM (Erro Quadrático Médio)'
                  end
                  object Label86: TLabel
                    Left = 206
                    Top = 47
                    Width = 59
                    Height = 13
                    Caption = 'Data Final'
                  end
                  object Label5: TLabel
                    Left = 20
                    Top = 198
                    Width = 254
                    Height = 13
                    Caption = 'Fator p/ validação da senha de autorização:'
                  end
                  object dbckCartGerenc: TDBCheckBox
                    Left = 14
                    Top = 65
                    Width = 189
                    Height = 17
                    Caption = 'Utiliza Carteiras Gerenciais ?'
                    DataField = 'FLGCARTGERENC'
                    DataSource = ds
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object dbdDtaMudaCpmf: TCMDateTimePicker
                    Left = 14
                    Top = 105
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTMUDACPMF'
                    DataSource = ds
                    Date = 45658
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
                    Time = 45658
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dbchRegCxComp: TDBCheckBox
                    Left = 14
                    Top = 147
                    Width = 171
                    Height = 17
                    Caption = 'Utiliza Regime de Caixa ?'
                    DataField = 'FLGREGIMECXCOMP'
                    DataSource = ds
                    TabOrder = 2
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnExit = dbchRegCxCompExit
                  end
                  object dtRegCxComp: TCMDateTimePicker
                    Left = 190
                    Top = 147
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTAREGIMECXCOMP'
                    DataSource = ds
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
                  object DblIndiceEQM: TwwDBLookupCombo
                    Left = 14
                    Top = 24
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'MOESIGLA'#9'10'#9'Sigla da Moeda'#9'F')
                    DataField = 'MOEDAEQM'
                    DataSource = ds
                    LookupTable = QryBuscaMoeda
                    LookupField = 'MOECODIGO'
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object CMDateTimePicker1: TCMDateTimePicker
                    Left = 206
                    Top = 62
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAMOVCDBLIB'
                    DataSource = ds
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
                    TabOrder = 5
                  end
                  object dbsFatorCalc: TwwDBSpinEdit
                    Left = 279
                    Top = 193
                    Width = 48
                    Height = 21
                    Increment = 1
                    MaxValue = 999
                    MinValue = 1
                    DataField = 'FATORCALC'
                    DataSource = ds
                    MaxLength = 3
                    TabOrder = 6
                    UnboundDataType = wwDefault
                    OnKeyPress = dbsFatorCalcKeyPress
                  end
                  object GroupBox1: TGroupBox
                    Left = 14
                    Top = 226
                    Width = 359
                    Height = 82
                    Caption = 'Datas de validação de relatório '
                    TabOrder = 7
                    object Label10: TLabel
                      Left = 33
                      Top = 30
                      Width = 110
                      Height = 13
                      Caption = 'Data de movimento'
                    end
                    object Label11: TLabel
                      Left = 203
                      Top = 30
                      Width = 66
                      Height = 13
                      Caption = 'Data Inicial'
                    end
                    object dtRelMovimento: TCMDateTimePicker
                      Left = 33
                      Top = 48
                      Width = 121
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATARELMOVIMENTO'
                      DataSource = ds
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
                    object dtRelInicial: TCMDateTimePicker
                      Left = 203
                      Top = 48
                      Width = 121
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATARELINICIAL'
                      DataSource = ds
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
                  end
                end
              end
            end
            object tbsImpostos: TTabSheet
              Caption = 'Impostos'
              ImageIndex = 1
              object pnlImpostos: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 326
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel18: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 324
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label118: TLabel
                    Left = 14
                    Top = 6
                    Width = 152
                    Height = 13
                    Caption = 'Indexador do IR em Litígio'
                  end
                  object Label77: TLabel
                    Left = 14
                    Top = 72
                    Width = 141
                    Height = 13
                    Caption = 'Última Apuração do RET'
                  end
                  object dblIndexadorIR: TwwDBLookupCombo
                    Left = 14
                    Top = 21
                    Width = 287
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'MOEDESC'#9'40'#9'Moeda')
                    DataField = 'MOEDAATULIT'
                    DataSource = ds
                    LookupTable = QryBuscaMoeda
                    LookupField = 'MOECODIGO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                    ShowMatchText = True
                  end
                  object dtpDataUltRet: TCMDateTimePicker
                    Left = 14
                    Top = 87
                    Width = 155
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAULTRET'
                    DataSource = ds
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
                  object dbckStaRET: TDBCheckBox
                    Left = 14
                    Top = 49
                    Width = 168
                    Height = 17
                    Caption = 'Utilizando RET ?'
                    DataField = 'STARET'
                    DataSource = ds
                    TabOrder = 1
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object ckbProvRV: TDBCheckBox
                    Left = 14
                    Top = 119
                    Width = 177
                    Height = 17
                    Caption = 'Provisiona p/ R. Variável'
                    DataField = 'FLGPROVISIONAIRRV'
                    DataSource = ds
                    TabOrder = 3
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object ckbProvRF: TDBCheckBox
                    Left = 14
                    Top = 143
                    Width = 169
                    Height = 17
                    Caption = 'Provisiona p/ R. Fixa'
                    DataField = 'FLGPROVISIONAIRRF'
                    DataSource = ds
                    TabOrder = 4
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
                object Panel28: TPanel
                  Left = 383
                  Top = 1
                  Width = 380
                  Height = 324
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                end
              end
            end
            object tbsCpmf: TTabSheet
              Caption = 'CPMF'
              ImageIndex = 3
              object pnlCpmf: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 326
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel29: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 324
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label84: TLabel
                    Left = 10
                    Top = 10
                    Width = 165
                    Height = 13
                    Caption = 'Data Inicial de Recolhimento'
                  end
                  object Label82: TLabel
                    Left = 187
                    Top = 10
                    Width = 143
                    Height = 13
                    Caption = 'Prazo para Recolhimento'
                  end
                  object Label50: TLabel
                    Left = 10
                    Top = 63
                    Width = 87
                    Height = 13
                    Caption = 'Dia da Semana'
                  end
                  object Label51: TLabel
                    Left = 10
                    Top = 109
                    Width = 59
                    Height = 13
                    Caption = 'Dias Úteis'
                  end
                  object Label83: TLabel
                    Left = 226
                    Top = 35
                    Width = 54
                    Height = 13
                    Caption = 'o. dia útil'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbdDtaIniRecCPMF: TCMDateTimePicker
                    Left = 10
                    Top = 27
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINIRECCPMF'
                    DataSource = ds
                    Date = 39562
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
                    Time = 39562
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dbcPzoCPMF: TwwDBComboBox
                    Left = 187
                    Top = 27
                    Width = 36
                    Height = 21
                    ShowButton = True
                    Style = csDropDown
                    MapList = False
                    AllowClearKey = False
                    DataField = 'PZORECCPMF'
                    DataSource = ds
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      '1'
                      '2'
                      '3'
                      '4'
                      '5')
                    ItemIndex = 1
                    Sorted = False
                    TabOrder = 1
                    UnboundDataType = wwDefault
                  end
                  object dbcDiaSemCPMF: TwwDBComboBox
                    Left = 10
                    Top = 79
                    Width = 123
                    Height = 21
                    ShowButton = True
                    Style = csDropDown
                    MapList = False
                    AllowClearKey = False
                    DataField = 'DIASEMANACPMF'
                    DataSource = ds
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Domingo'
                      'Segunda'
                      'Terça'
                      'Quarta'
                      'Quinta'
                      'Sexta'
                      'Sábado')
                    ItemIndex = 5
                    Sorted = False
                    TabOrder = 2
                    UnboundDataType = wwDefault
                  end
                  object dbeDiasUteisCPMF: TwwDBEdit
                    Left = 10
                    Top = 125
                    Width = 124
                    Height = 21
                    DataField = 'DIASUTEISCPMF'
                    DataSource = ds
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object Panel17: TPanel
                  Left = 383
                  Top = 1
                  Width = 380
                  Height = 324
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                end
              end
            end
            object tbsIntContFin: TTabSheet
              Caption = 'Integração Contábil/Financeiro'
              ImageIndex = 5
              object pnlIntContFin: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 326
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object pnlIntContFinGeral: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 324
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object gpbCliente: TGroupBox
                    Left = 6
                    Top = 6
                    Width = 371
                    Height = 134
                    Caption = ' Tipo de Cliente '
                    TabOrder = 0
                    object Label30: TLabel
                      Left = 13
                      Top = 16
                      Width = 53
                      Height = 13
                      Caption = 'Corretora'
                    end
                    object Label31: TLabel
                      Left = 13
                      Top = 55
                      Width = 44
                      Height = 13
                      Caption = 'Emissor'
                    end
                    object Label32: TLabel
                      Left = 13
                      Top = 93
                      Width = 68
                      Height = 13
                      Caption = 'Custodiante'
                    end
                    object dblCorretora: TwwDBLookupCombo
                      Left = 13
                      Top = 31
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'40'#9'DESCRICAO')
                      DataField = 'IDTIPOCLIENTECOR'
                      DataSource = ds
                      LookupTable = QryTipoCliente
                      LookupField = 'IDTIPOCLIENTE'
                      Options = [loColLines, loRowLines, loTitles]
                      DropDownCount = 6
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                      ShowMatchText = True
                    end
                    object dblEmissor: TwwDBLookupCombo
                      Left = 13
                      Top = 69
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'40'#9'DESCRICAO')
                      DataField = 'IDTIPOCLIENTEEMI'
                      DataSource = ds
                      LookupTable = QryTipoCliente
                      LookupField = 'IDTIPOCLIENTE'
                      Options = [loColLines, loRowLines, loTitles]
                      DropDownCount = 6
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                      ShowMatchText = True
                    end
                    object dblCustodiate: TwwDBLookupCombo
                      Left = 13
                      Top = 107
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'40'#9'DESCRICAO')
                      DataField = 'IDTIPOCLIENTECUS'
                      DataSource = ds
                      LookupTable = QryTipoCliente
                      LookupField = 'IDTIPOCLIENTE'
                      Options = [loColLines, loRowLines, loTitles]
                      DropDownCount = 6
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                      ShowMatchText = True
                    end
                  end
                  object gpbFornecedor: TGroupBox
                    Left = 6
                    Top = 142
                    Width = 371
                    Height = 135
                    Caption = ' Tipo de Fornecedor'
                    TabOrder = 1
                    object Label40: TLabel
                      Left = 13
                      Top = 17
                      Width = 53
                      Height = 13
                      Caption = 'Corretora'
                    end
                    object Label41: TLabel
                      Left = 13
                      Top = 56
                      Width = 44
                      Height = 13
                      Caption = 'Emissor'
                    end
                    object Label42: TLabel
                      Left = 13
                      Top = 95
                      Width = 68
                      Height = 13
                      Caption = 'Custodiante'
                    end
                    object dblRamoForCor: TwwDBLookupCombo
                      Left = 13
                      Top = 31
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRAMOFORNECEDOR'#9'30'#9'Ramo Corretora'#9'F')
                      DataField = 'IDRAMOFORCOR'
                      DataSource = ds
                      LookupTable = QryRamoFornecedor
                      LookupField = 'IDRAMOFORNECEDOR'
                      Options = [loColLines, loRowLines, loTitles]
                      DropDownCount = 6
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                      ShowMatchText = True
                    end
                    object dblRamoForEmi: TwwDBLookupCombo
                      Left = 13
                      Top = 70
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRAMOFORNECEDOR'#9'30'#9'Ramo Emissor'#9'F')
                      DataField = 'IDRAMOFOREMI'
                      DataSource = ds
                      LookupTable = QryRamoFornecedor
                      LookupField = 'IDRAMOFORNECEDOR'
                      Options = [loColLines, loRowLines, loTitles]
                      DropDownCount = 6
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                      ShowMatchText = True
                    end
                    object dblRamoForCus: TwwDBLookupCombo
                      Left = 13
                      Top = 109
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRAMOFORNECEDOR'#9'30'#9'Ramo Custodiante'#9'F')
                      DataField = 'IDRAMOFORCUS'
                      DataSource = ds
                      LookupTable = QryRamoFornecedor
                      LookupField = 'IDRAMOFORNECEDOR'
                      Options = [loColLines, loRowLines, loTitles]
                      DropDownCount = 6
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                      ShowMatchText = True
                    end
                  end
                end
                object Panel16: TPanel
                  Left = 383
                  Top = 1
                  Width = 380
                  Height = 324
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object pgcContFin: TPageControl
                    Left = 2
                    Top = 2
                    Width = 376
                    Height = 320
                    ActivePage = tbsContFinModulos
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 0
                    object tbsContFinGeral: TTabSheet
                      Caption = 'Geral'
                      object Panel15: TPanel
                        Left = 0
                        Top = 0
                        Width = 368
                        Height = 289
                        Align = alClient
                        BevelInner = bvLowered
                        TabOrder = 0
                        object Label33: TLabel
                          Left = 30
                          Top = 30
                          Width = 54
                          Height = 13
                          Caption = 'Programa'
                        end
                        object dbckContabDiaUtil: TDBCheckBox
                          Left = 30
                          Top = 138
                          Width = 271
                          Height = 17
                          Caption = 'Contabiliza somente em dia útil ?'
                          DataField = 'FLGCONTABDIAUTIL'
                          DataSource = ds
                          TabOrder = 0
                          ValueChecked = 'S'
                          ValueUnchecked = 'N'
                        end
                        object dbckIntFinLiq: TDBCheckBox
                          Left = 30
                          Top = 117
                          Width = 271
                          Height = 17
                          Caption = 'Resgate de Renda-Fixa pelo Valor Líquido ?'
                          DataField = 'FLGINTFINLIQ'
                          DataSource = ds
                          TabOrder = 1
                          ValueChecked = 'S'
                          ValueUnchecked = 'N'
                        end
                        object dbchPlanPrevPatro: TDBCheckBox
                          Left = 30
                          Top = 96
                          Width = 167
                          Height = 17
                          Caption = 'Utiliza PlanPrev / Patro ?'
                          DataField = 'FLGPLANPREVCTBPAT'
                          DataSource = ds
                          TabOrder = 2
                          ValueChecked = 'S'
                          ValueUnchecked = 'N'
                        end
                        object dbckUsaSubConta: TDBCheckBox
                          Left = 30
                          Top = 75
                          Width = 167
                          Height = 17
                          Caption = 'Utiliza Subconta'
                          DataField = 'FLGUSASUBCONTA'
                          DataSource = ds
                          TabOrder = 3
                          ValueChecked = 'S'
                          ValueUnchecked = 'N'
                        end
                        object dblPrograma: TwwDBLookupCombo
                          Left = 30
                          Top = 45
                          Width = 287
                          Height = 21
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCPROGRAMA'#9'30'#9'Descrição')
                          DataField = 'IDPROGRAMA'
                          DataSource = ds
                          LookupTable = QryPrograma
                          LookupField = 'IDPROGRAMA'
                          Options = [loColLines, loRowLines, loTitles]
                          DropDownCount = 6
                          TabOrder = 4
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = False
                          ShowMatchText = True
                        end
                      end
                    end
                    object tbsContFinModulos: TTabSheet
                      Caption = 'Integração por Modulos'
                      ImageIndex = 1
                      object Panel31: TPanel
                        Left = 0
                        Top = 0
                        Width = 370
                        Height = 289
                        Align = alClient
                        BevelInner = bvLowered
                        TabOrder = 0
                        object pnlMensagemContabFinan: TPanel
                          Left = 2
                          Top = 2
                          Width = 366
                          Height = 51
                          Align = alClient
                          TabOrder = 0
                          object fcLabel1: TfcLabel
                            Left = 1
                            Top = 1
                            Width = 647
                            Height = 13
                            Align = alClient
                            Caption = 
                              'Estes parâmetros impedem que seja executada a integração contábi' +
                              'l e financeira em cada Módulo separadamente'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clMaroon
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TextOptions.Alignment = taCenter
                            TextOptions.VAlignment = vaVCenter
                            TextOptions.WordWrap = True
                          end
                        end
                        object pnlBloqRF: TPanel
                          Left = 2
                          Top = 53
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 1
                          object pnlMensBloqRF: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Não Integra'
                            Color = 7697919
                            TabOrder = 0
                          end
                          object Panel33: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabRF: TDBCheckBox
                              Tag = 1
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Renda Fixa'
                              DataField = 'FLGINTCONTABRF'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqRV: TPanel
                          Left = 2
                          Top = 105
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 2
                          object pnlMensBloqRV: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel36: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabRV: TDBCheckBox
                              Tag = 2
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Renda Variável'
                              DataField = 'FLGINTCONTABRV'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqBMF: TPanel
                          Left = 2
                          Top = 131
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 3
                          object pnlMensBloqBMF: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel35: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabBMF: TDBCheckBox
                              Tag = 8
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'BM&&F'
                              DataField = 'FLGINTCONTABBMF'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqFRF: TPanel
                          Left = 2
                          Top = 157
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 4
                          object pnlMensBloqFRF: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel37: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabFRF: TDBCheckBox
                              Tag = 5
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Fundos de Renda Fixa'
                              DataField = 'FLGINTCONTABFRF'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqFRV: TPanel
                          Left = 2
                          Top = 183
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 5
                          object pnlMensBloqFRV: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel38: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabFRV: TDBCheckBox
                              Tag = 6
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Fundos de Renda Variável'
                              DataField = 'FLGINTCONTABFRV'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqFIM: TPanel
                          Left = 2
                          Top = 209
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 6
                          object pnlMensBloqFIM: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel39: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabFIM: TDBCheckBox
                              Tag = 7
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Fundos Imobiliarios'
                              DataField = 'FLGINTCONTABFIM'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqFDC: TPanel
                          Left = 2
                          Top = 235
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 7
                          object pnlMensBloqFDC: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel40: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabFDC: TDBCheckBox
                              Tag = 9
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Fundos de Direito Creditório'
                              DataField = 'FLGINTCONTABFDC'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqFIP: TPanel
                          Left = 2
                          Top = 261
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 8
                          object pnlMensBloqFIP: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Integra'
                            Color = 9953674
                            TabOrder = 0
                          end
                          object Panel41: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabFIP: TDBCheckBox
                              Tag = 10
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Fundo de Participações'
                              DataField = 'FLGINTCONTABFIP'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                        object pnlBloqOPI: TPanel
                          Left = 2
                          Top = 79
                          Width = 366
                          Height = 26
                          Align = alBottom
                          Alignment = taRightJustify
                          TabOrder = 9
                          object pnlMensBloqOPI: TPanel
                            Left = 261
                            Top = 1
                            Width = 104
                            Height = 24
                            Align = alClient
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            Caption = 'Não Integra'
                            Color = 7697919
                            TabOrder = 0
                          end
                          object Panel25: TPanel
                            Left = 1
                            Top = 1
                            Width = 260
                            Height = 24
                            Align = alLeft
                            Alignment = taLeftJustify
                            BevelInner = bvRaised
                            BevelOuter = bvLowered
                            TabOrder = 1
                            object chkFlgIntContabOPI: TDBCheckBox
                              Tag = 11
                              Left = 8
                              Top = 4
                              Width = 225
                              Height = 17
                              Alignment = taLeftJustify
                              Caption = 'Opções de Indice'
                              DataField = 'FLGINTCONTABOPI'
                              DataSource = ds
                              TabOrder = 0
                              ValueChecked = 'S'
                              ValueUnchecked = 'N'
                              OnClick = VerBloqClick
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      object tbsRVariavel: TTabSheet
        Caption = 'Renda Variável'
        ImageIndex = 8
        object pnlRVariavel: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          TabOrder = 0
          object pgcRvariavel: TPageControl
            Left = 1
            Top = 1
            Width = 772
            Height = 357
            ActivePage = tbsDireitos
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tbsRVGeral: TTabSheet
              Caption = 'Geral'
              object pnlRVGeral: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 326
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel2: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 324
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 14
                    Top = 9
                    Width = 113
                    Height = 13
                    Caption = 'Último Fechamento '
                    Enabled = False
                  end
                  object Label44: TLabel
                    Left = 14
                    Top = 49
                    Width = 172
                    Height = 13
                    Caption = 'Última Importação de Cotação'
                  end
                  object lblCartAVista: TLabel
                    Left = 14
                    Top = 90
                    Width = 145
                    Height = 13
                    Caption = 'Carteira de Ações à Vista'
                  end
                  object Label34: TLabel
                    Left = 14
                    Top = 130
                    Width = 50
                    Height = 13
                    Caption = 'Bovespa'
                  end
                  object Label38: TLabel
                    Left = 14
                    Top = 170
                    Width = 233
                    Height = 13
                    Caption = 'Operação para Pendência de Liquidação'
                  end
                  object Label48: TLabel
                    Left = 14
                    Top = 212
                    Width = 231
                    Height = 13
                    Caption = 'Percentual de Devolução de Corretagem'
                    WordWrap = True
                  end
                  object dbdDtaFechRv: TCMDateTimePicker
                    Left = 14
                    Top = 24
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAULTFECH'
                    DataSource = ds
                    Date = 38510
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
                    Time = 38510
                    Enabled = False
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dtpDataUltImpCot: TCMDateTimePicker
                    Left = 14
                    Top = 64
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAULTIMPCOT'
                    DataSource = ds
                    Date = 38531
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
                    Time = 38531
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dblkCartAVista: TwwDBLookupCombo
                    Left = 14
                    Top = 105
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCCARTINVEST'#9'60'#9'Cateira de Opções de Índice'#9'F')
                    DataField = 'IDCARTAVISTA'
                    DataSource = ds
                    LookupTable = qryCarteiraInvest
                    LookupField = 'IDCARTEIRAINVEST'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                    ShowMatchText = True
                  end
                  object dblBovespa: TwwDBLookupCombo
                    Left = 14
                    Top = 145
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'SGLBOLSAVALORES'#9'10'#9'Bolsa')
                    DataField = 'IDBVSP'
                    DataSource = ds
                    LookupTable = qryBolsaValores
                    LookupField = 'IDBOLSAVALORES'
                    Options = [loRowLines, loTitles]
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dblTipoOperLiqPend: TwwDBLookupCombo
                    Left = 14
                    Top = 185
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'30'#9'Descrição')
                    DataField = 'IDTIPOOPERLIQPEND'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loRowLines, loTitles]
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dbrPercDevRV: TDBRealEdit
                    Left = 14
                    Top = 227
                    Width = 67
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '90,00')
                    TabOrder = 5
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'PERCDEVRV'
                    DataSource = ds
                  end
                  object dbckFlgCompVarRV: TDBCheckBox
                    Left = 14
                    Top = 258
                    Width = 195
                    Height = 17
                    Caption = 'Compensação de Variação ?'
                    DataField = 'FLGCOMPVARRV'
                    DataSource = ds
                    TabOrder = 6
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
                object Panel1: TPanel
                  Left = 383
                  Top = 1
                  Width = 380
                  Height = 324
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label4: TLabel
                    Left = 14
                    Top = 94
                    Width = 306
                    Height = 13
                    Caption = 'Limite para alteração do valor calculado de Despesas'
                    WordWrap = True
                  end
                  object dbckFLGRECPAGRV: TDBCheckBox
                    Left = 14
                    Top = 17
                    Width = 363
                    Height = 17
                    Caption = 'Zera Conta Transitória de Boleta com Compra e Venda ?'
                    DataField = 'FLGRECPAGRV'
                    DataSource = ds
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object chkRVEmAbertura: TDBCheckBox
                    Left = 14
                    Top = 44
                    Width = 243
                    Height = 17
                    Caption = 'Sistema em Fechamento pelo Usuário:'
                    DataField = 'FLGRVEMABERTURA'
                    DataSource = ds
                    TabOrder = 1
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = chkRVEmAberturaClick
                  end
                  object dblUsuarioProcRV: TwwDBLookupCombo
                    Left = 14
                    Top = 66
                    Width = 287
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'60'#9'Nome do Usuario'#9'F')
                    DataField = 'IDUSUARIOPROCRV'
                    DataSource = ds
                    LookupTable = qryUsuarioProcRF
                    LookupField = 'IDUSUARIO'
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dbrLimiteVlrDiverg: TDBRealEdit
                    Left = 14
                    Top = 113
                    Width = 130
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '100.000.000,00')
                    TabOrder = 3
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VLRDIVERG'
                    DataSource = ds
                  end
                  object dbrgGeracaoBoleta: TDBRadioGroup
                    Left = 16
                    Top = 176
                    Width = 345
                    Height = 105
                    Caption = 'Regra para a geração de Boletas'
                    DataField = 'REGRABOLETA'
                    DataSource = ds
                    Items.Strings = (
                      '1 - Data/Corretora (Anterior)'
                      '2 - Data/Corretora/Plano/Carteira (Atual)')
                    TabOrder = 4
                    Values.Strings = (
                      '1'
                      '0')
                  end
                end
              end
            end
            object tbsDireitos: TTabSheet
              Caption = 'Direitos'
              ImageIndex = 1
              object pnlDireitos: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 326
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel7: TPanel
                  Left = 1
                  Top = 1
                  Width = 255
                  Height = 324
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label21: TLabel
                    Left = 6
                    Top = 242
                    Width = 64
                    Height = 13
                    Caption = 'Dividendos'
                  end
                  object Label20: TLabel
                    Left = 6
                    Top = 282
                    Width = 90
                    Height = 13
                    Caption = 'Juros s/ Capital'
                  end
                  object dblDividendos: TwwDBLookupCombo
                    Left = 6
                    Top = 257
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDIV'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblJurosCapital: TwwDBLookupCombo
                    Left = 6
                    Top = 297
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRJUR'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object pnlPrazo: TPanel
                    Left = 2
                    Top = 2
                    Width = 251
                    Height = 215
                    Align = alTop
                    BevelInner = bvSpace
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label8: TLabel
                      Left = 4
                      Top = 5
                      Width = 244
                      Height = 26
                      Caption = 'Data de Contabilização do Recebimento e Bonificação'
                      WordWrap = True
                    end
                    object pnlPrazoDet: TPanel
                      Left = 2
                      Top = 36
                      Width = 247
                      Height = 177
                      Align = alBottom
                      BevelOuter = bvLowered
                      Color = clSilver
                      TabOrder = 0
                      object Label7: TLabel
                        Left = 13
                        Top = 15
                        Width = 28
                        Height = 13
                        Caption = 'Data'
                      end
                      object Label9: TLabel
                        Left = 13
                        Top = 79
                        Width = 99
                        Height = 13
                        Caption = 'Data de Vigência'
                      end
                      object dbcbxTipoDataDir: TwwDBComboBox
                        Left = 13
                        Top = 31
                        Width = 183
                        Height = 21
                        ShowButton = True
                        Style = csDropDown
                        MapList = True
                        AllowClearKey = True
                        AutoDropDown = True
                        ShowMatchText = True
                        DataField = 'TPDATAVIGDIR'
                        DataSource = ds
                        DropDownCount = 8
                        ItemHeight = 0
                        Items.Strings = (
                          'Data Ex'#9'0'
                          'Data Age'#9'1')
                        Sorted = False
                        TabOrder = 0
                        UnboundDataType = wwDefault
                      end
                      object dtDataVigDir: TCMDateTimePicker
                        Left = 14
                        Top = 96
                        Width = 121
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        ButtonStyle = cbsCustom
                        DataField = 'DATAVIGDIR'
                        DataSource = ds
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
                    end
                  end
                end
                object Panel8: TPanel
                  Left = 256
                  Top = 1
                  Width = 252
                  Height = 324
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label28: TLabel
                    Left = 6
                    Top = 162
                    Width = 76
                    Height = 13
                    Caption = 'Incorporação'
                  end
                  object Label25: TLabel
                    Left = 6
                    Top = 202
                    Width = 69
                    Height = 13
                    Caption = 'Grupamento'
                  end
                  object Label26: TLabel
                    Left = 6
                    Top = 242
                    Width = 89
                    Height = 13
                    Caption = 'Desdobramento'
                  end
                  object Label29: TLabel
                    Left = 6
                    Top = 282
                    Width = 47
                    Height = 13
                    Caption = 'Permuta'
                  end
                  object Label46: TLabel
                    Left = 6
                    Top = 124
                    Width = 126
                    Height = 13
                    Caption = 'Restituição de Capital'
                  end
                  object Label27: TLabel
                    Left = 6
                    Top = 84
                    Width = 32
                    Height = 13
                    Caption = 'Cisão'
                  end
                  object Label24: TLabel
                    Left = 6
                    Top = 45
                    Width = 64
                    Height = 13
                    Caption = 'Subscrição'
                  end
                  object Label23: TLabel
                    Left = 6
                    Top = 5
                    Width = 68
                    Height = 13
                    Caption = 'Bonificação'
                  end
                  object dblIncorporacao: TwwDBLookupCombo
                    Left = 6
                    Top = 177
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRINC'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblGrupamento: TwwDBLookupCombo
                    Left = 6
                    Top = 217
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRGRU'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 5
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblDesdobramento: TwwDBLookupCombo
                    Left = 6
                    Top = 257
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDES'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 6
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblPermuta: TwwDBLookupCombo
                    Left = 6
                    Top = 297
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRPER'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 7
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbRestituicaoCapital: TwwDBLookupCombo
                    Left = 6
                    Top = 139
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRRES'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblCisao: TwwDBLookupCombo
                    Left = 6
                    Top = 99
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRCIS'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblSubscricao: TwwDBLookupCombo
                    Left = 6
                    Top = 60
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRSUB'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblBonificacao: TwwDBLookupCombo
                    Left = 6
                    Top = 20
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRBON'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                end
                object Panel26: TPanel
                  Left = 508
                  Top = 1
                  Width = 255
                  Height = 324
                  Align = alRight
                  BevelInner = bvLowered
                  TabOrder = 2
                  object Label78: TLabel
                    Left = 6
                    Top = 84
                    Width = 123
                    Height = 13
                    Caption = 'Direito de Subscrição'
                  end
                  object lblRecFracionado: TLabel
                    Left = 6
                    Top = 124
                    Width = 154
                    Height = 13
                    Caption = 'Recebimentos Fracionados'
                  end
                  object Label80: TLabel
                    Left = 6
                    Top = 164
                    Width = 124
                    Height = 13
                    Caption = 'Subscrição com Ação'
                  end
                  object Label81: TLabel
                    Left = 6
                    Top = 204
                    Width = 159
                    Height = 13
                    Caption = 'Subscrição com Renda Fixa'
                  end
                  object Label73: TLabel
                    Left = 6
                    Top = 243
                    Width = 147
                    Height = 13
                    Caption = 'Reorganização Societária'
                  end
                  object Label75: TLabel
                    Left = 6
                    Top = 283
                    Width = 239
                    Height = 13
                    Caption = 'Resgate Fundos c/ Anúncio de Proventos'
                  end
                  object Label43: TLabel
                    Left = 6
                    Top = 6
                    Width = 102
                    Height = 13
                    Caption = 'Alteração do Tipo'
                  end
                  object Label63: TLabel
                    Left = 6
                    Top = 46
                    Width = 213
                    Height = 13
                    Caption = 'Multa de Atraso de Entrega de Ações'
                  end
                  object dblDireitoSubscricao: TwwDBLookupCombo
                    Left = 6
                    Top = 99
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDSU'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblkRecFracionado: TwwDBLookupCombo
                    Left = 6
                    Top = 139
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERRFRAC'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblSubscricaoAcao: TwwDBLookupCombo
                    Left = 6
                    Top = 179
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDSA'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblSubscricaoRFixa: TwwDBLookupCombo
                    Left = 6
                    Top = 219
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDSR'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 5
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbReestruturacaoSoc: TwwDBLookupCombo
                    Left = 6
                    Top = 258
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRREE'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 6
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblResgFdoAnuncioProv: TwwDBLookupCombo
                    Left = 6
                    Top = 298
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRPROV'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 7
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblAlteracaoTipo: TwwDBLookupCombo
                    Left = 6
                    Top = 21
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRALT'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblkOperMultaAtrazo: TwwDBLookupCombo
                    Left = 6
                    Top = 61
                    Width = 241
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRMUL'
                    DataSource = ds
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                end
              end
            end
          end
        end
      end
      object tbsRFixa: TTabSheet
        Caption = 'Renda Fixa'
        object pnlRFixa: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel9: TPanel
            Left = 1
            Top = 1
            Width = 382
            Height = 357
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label14: TLabel
              Left = 24
              Top = 11
              Width = 88
              Height = 13
              Caption = 'Última Abertura'
            end
            object Label52: TLabel
              Left = 24
              Top = 50
              Width = 72
              Height = 13
              Caption = 'Custodiante '
            end
            object Label56: TLabel
              Left = 24
              Top = 89
              Width = 111
              Height = 13
              Caption = 'Contraparte Padrão'
            end
            object Label65: TLabel
              Left = 24
              Top = 131
              Width = 174
              Height = 13
              Caption = 'Item de Incorporação de Juros'
            end
            object Label66: TLabel
              Left = 24
              Top = 170
              Width = 162
              Height = 13
              Caption = 'Item de Pagamento de Juros'
            end
            object Label67: TLabel
              Left = 24
              Top = 210
              Width = 187
              Height = 13
              Caption = 'Item de Amortização de Principal'
            end
            object Label58: TLabel
              Left = 23
              Top = 250
              Width = 117
              Height = 13
              Caption = 'Classe de Poupança'
            end
            object dbdDtaFechRf: TCMDateTimePicker
              Left = 24
              Top = 26
              Width = 109
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAULTFECHRF'
              DataSource = ds
              Date = 38533
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
              Time = 38533
              ShowButton = True
              TabOrder = 0
              OnEnter = dbdDtaFechRfEnter
            end
            object dblCustodianteRenFix: TwwDBLookupCombo
              Left = 24
              Top = 65
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Custodiante'#9'F')
              DataField = 'IDCUSTODIARENFIX'
              DataSource = ds
              LookupTable = qryCustodiante
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              DropDownCount = 6
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkContraParte: TwwDBLookupCombo
              Left = 24
              Top = 104
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Contra Parte'#9'F')
              DataField = 'IDCONTRAPARTERF'
              DataSource = ds
              LookupTable = qryContraParte
              LookupField = 'IDPESSOA'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkOperIncJuros: TwwDBLookupCombo
              Left = 24
              Top = 145
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCITEMRENFIX'#9'60'#9'Item de Renda Fixa'#9'F')
              DataField = 'IDOPERINCJUROS'
              DataSource = ds
              LookupTable = qryItemRenFix
              LookupField = 'IDITEMRENFIX'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkOperPagtoJuros: TwwDBLookupCombo
              Left = 24
              Top = 184
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCITEMRENFIX'#9'60'#9'Item de Renda Fixa'#9'F')
              DataField = 'IDOPERPAGTOJUROS'
              DataSource = ds
              LookupTable = qryItemRenFix
              LookupField = 'IDITEMRENFIX'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkOperAmortPrinc: TwwDBLookupCombo
              Left = 24
              Top = 224
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCITEMRENFIX'#9'60'#9'Item de Renda Fixa'#9'F')
              DataField = 'IDOPERAMORTPRINC'
              DataSource = ds
              LookupTable = qryItemRenFix
              LookupField = 'IDITEMRENFIX'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkClassePoupanca: TwwDBLookupCombo
              Left = 23
              Top = 264
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCLASSETIT'#9'30'#9'Classe do Título'#9'F')
              DataField = 'IDCLASSETIT'
              DataSource = ds
              LookupTable = QryClasseTitulo
              LookupField = 'IDCLASSETIT'
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object Panel10: TPanel
            Left = 383
            Top = 1
            Width = 390
            Height = 357
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Label69: TLabel
              Left = 22
              Top = 12
              Width = 181
              Height = 13
              Caption = 'Classe de Poupança Bloqueada'
            end
            object Label62: TLabel
              Left = 22
              Top = 52
              Width = 115
              Height = 13
              Caption = 'Índice de Poupança'
            end
            object lblTaxaJurosPoupanca: TLabel
              Left = 22
              Top = 91
              Width = 124
              Height = 13
              Caption = 'Taxa Juros Poupança'
            end
            object lblCarteiraRF: TLabel
              Left = 22
              Top = 214
              Width = 131
              Height = 13
              Caption = 'Carteira de Renda Fixa'
            end
            object dblCassePoupBloq: TwwDBLookupCombo
              Left = 22
              Top = 26
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCLASSETIT'#9'30'#9'Classe do Título'#9'F')
              DataField = 'IDCLASSPOUPBLOQ'
              DataSource = ds
              LookupTable = QryClasseTitulo
              LookupField = 'IDCLASSETIT'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkMoedaPoupanca: TwwDBLookupCombo
              Left = 22
              Top = 66
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla da Moeda'#9'F')
              DataField = 'IDINDEXPOUPANCA'
              DataSource = ds
              LookupTable = QryBuscaMoeda
              LookupField = 'MOECODIGO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbreTaxaJurosPoupanca: TDBRealEdit
              Left = 22
              Top = 106
              Width = 83
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '6,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'JUROSPOUPANCA'
              DataSource = ds
            end
            object chkRFEmAbertura: TDBCheckBox
              Left = 22
              Top = 140
              Width = 243
              Height = 17
              Caption = 'Sistema em Abertura pelo Usuário:'
              DataField = 'FLGRFEMABERTURA'
              DataSource = ds
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = chkRFEmAberturaClick
            end
            object dblUsuarioProcRF: TwwDBLookupCombo
              Left = 22
              Top = 162
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome do Usuario'#9'F')
              DataField = 'IDUSUARIOPROCRF'
              DataSource = ds
              LookupTable = qryUsuarioProcRF
              LookupField = 'IDUSUARIO'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbckFlgPoupApropDia: TDBCheckBox
              Left = 22
              Top = 192
              Width = 243
              Height = 17
              Caption = 'Apropriação Diária para Poupança'
              DataField = 'FLGPOUPAPROPDIA'
              DataSource = ds
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object dblkCarteiraRF: TwwDBLookupCombo
              Left = 22
              Top = 230
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'30'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRARF'
              DataSource = ds
              LookupTable = qryCarteiraRF
              LookupField = 'IDCARTEIRAINVEST'
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      object tbsFundos: TTabSheet
        Caption = 'Fundo'
        ImageIndex = 8
        object pnlFundos: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel13: TPanel
            Left = 1
            Top = 1
            Width = 382
            Height = 357
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label45: TLabel
              Left = 14
              Top = 10
              Width = 113
              Height = 13
              Caption = 'Último Fechamento '
            end
            object lblDifResgate: TLabel
              Left = 14
              Top = 53
              Width = 190
              Height = 13
              Caption = 'Diferença Tolerada para Resgate'
              WordWrap = True
            end
            object lblTipoFundo: TLabel
              Left = 14
              Top = 96
              Width = 83
              Height = 13
              Caption = 'Tipo de Fundo'
            end
            object lblMaskANBID: TLabel
              Left = 14
              Top = 185
              Width = 188
              Height = 13
              Caption = 'Máscara de Classificação ANBID'
            end
            object Label85: TLabel
              Left = 14
              Top = 224
              Width = 190
              Height = 13
              Caption = 'Motivo de Bloqueio para Penhora'
            end
            object dbdDtaFechFdo: TCMDateTimePicker
              Left = 14
              Top = 25
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAULTFECHFDO'
              DataSource = ds
              Date = 39507
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
              Time = 39507
              ShowButton = True
              TabOrder = 0
            end
            object dbrDifResgate: TDBRealEdit
              Left = 14
              Top = 67
              Width = 91
              Height = 21
              Hint = 'Diferença Tolerada para Resgate'
              Alignment = taRightJustify
              Lines.Strings = (
                '15,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'DIFRESGFUNDOS'
              DataSource = ds
            end
            object dblTipoFundo: TwwDBLookupCombo
              Left = 14
              Top = 112
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOFUNDOINV'#9'20'#9'Descrição'#9'F')
              DataField = 'IDTIPOFUNDOINVEST'
              LookupTable = QryTipoFundo
              LookupField = 'IDTIPOFUNDOINVEST'
              Options = [loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblTipoFundoChange
              OnCloseUp = dblTipoFundoCloseUp
            end
            object chkFundosEmAbertura: TDBCheckBox
              Left = 14
              Top = 138
              Width = 243
              Height = 17
              Caption = 'Sistema em Fechamento pelo Usuário:'
              DataSource = ds
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = chkFundosEmAberturaClick
            end
            object dblUsuarioProcFundos: TwwDBLookupCombo
              Left = 14
              Top = 160
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Descrição'#9'F')
              DataSource = ds
              LookupTable = qryUsuarioProcRF
              LookupField = 'IDUSUARIO'
              Options = [loRowLines, loTitles]
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbeMaskANBID: TDBEdit
              Left = 14
              Top = 199
              Width = 288
              Height = 21
              DataField = 'MASCSCLASSIFANBID'
              DataSource = ds
              TabOrder = 5
              OnKeyPress = dbeMaskANBIDKeyPress
            end
            object dblkBloqPenFdo: TwwDBLookupCombo
              Left = 14
              Top = 240
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'40'#9'Descrição'#9'F')
              DataField = 'IDMOTBLOQPENFDO'
              DataSource = ds
              LookupTable = qryMotBloqPenFdo
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loRowLines, loTitles]
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblTipoFundoChange
              OnCloseUp = dblTipoFundoCloseUp
            end
          end
          object Panel14: TPanel
            Left = 383
            Top = 1
            Width = 390
            Height = 357
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsEmprestimo: TTabSheet
        Caption = 'Empréstimo'
        ImageIndex = 10
        object pnlEmprestimo: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 382
            Height = 357
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label60: TLabel
              Left = 14
              Top = 133
              Width = 178
              Height = 13
              Caption = 'Regra de Empréstimo de Ações'
            end
            object Label61: TLabel
              Left = 14
              Top = 93
              Width = 235
              Height = 13
              Caption = 'Motivo de Bloqueio Empréstimo de Ações'
            end
            object Label59: TLabel
              Left = 14
              Top = 53
              Width = 188
              Height = 13
              Caption = 'Carteira de Empréstimo de Ações'
            end
            object Label74: TLabel
              Left = 14
              Top = 13
              Width = 113
              Height = 13
              Caption = 'Último Fechamento '
            end
            object Label18: TLabel
              Left = 14
              Top = 205
              Width = 249
              Height = 13
              Caption = 'Carteira de Origem do Empréstimo de Ações'
            end
            object dbcFlgEmpAcoes: TDBCheckBox
              Left = 14
              Top = 179
              Width = 211
              Height = 17
              Caption = 'Permite Empréstimo de Ações ?'
              DataField = 'FLGEMPACOES'
              DataSource = ds
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object dblkRegraEmpAcoes: TwwDBLookupCombo
              Left = 14
              Top = 148
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra'#9'F')
              DataField = 'IDREGRAEMPACOES'
              DataSource = ds
              LookupTable = qryRegraEmpAcoes
              LookupField = 'IDREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkMotivoBloqueio: TwwDBLookupCombo
              Left = 14
              Top = 108
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Motivo de Bloqueio'#9'F')
              DataField = 'IDMOTBLOQEMPAC'
              DataSource = ds
              LookupTable = qryMotivoBloqueio
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkCartEmpAcoes: TwwDBLookupCombo
              Left = 14
              Top = 68
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Cateira de Investimento'#9'F')
              DataField = 'IDCARTEMPACOES'
              DataSource = ds
              LookupTable = qryCarteiraInvest
              LookupField = 'IDCARTEIRAINVEST'
              Options = [loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dtpUltFechEmp: TCMDateTimePicker
              Left = 14
              Top = 28
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAULTFECHEMP'
              DataSource = ds
              Date = 38110
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
              Time = 38110
              ShowButton = True
              TabOrder = 0
            end
            object dblkCartOrigEmpAcoes: TwwDBLookupCombo
              Left = 14
              Top = 222
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Cateira de Investimento'#9'F')
              DataField = 'IDCARTORIGEMPACOES'
              DataSource = ds
              LookupTable = qryCarteiraInvest
              LookupField = 'IDCARTEIRAINVEST'
              Options = [loRowLines, loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object Panel6: TPanel
            Left = 383
            Top = 1
            Width = 390
            Height = 357
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsOpcoes: TTabSheet
        Caption = 'Opções'
        ImageIndex = 10
        object pnlOpcao: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel21: TPanel
            Left = 1
            Top = 1
            Width = 385
            Height = 357
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object grpOpcoesAcoes: TGroupBox
              Left = 6
              Top = 2
              Width = 369
              Height = 143
              Caption = 'Opções de Ações'
              TabOrder = 0
              object lblCartOpcoes: TLabel
                Left = 14
                Top = 97
                Width = 110
                Height = 13
                Caption = 'Carteira de Opções'
              end
              object lblTPOperCpOpc: TLabel
                Left = 14
                Top = 17
                Width = 243
                Height = 13
                Caption = 'Tipo de Operação para Compra de Opções'
              end
              object lblTPOperVdOpc: TLabel
                Left = 14
                Top = 57
                Width = 237
                Height = 13
                Caption = 'Tipo de Operação para Venda de Opções'
              end
              object dblkCartOpcoes: TwwDBLookupCombo
                Left = 14
                Top = 112
                Width = 287
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCARTINVEST'#9'60'#9'Cateira de Opções'#9'F')
                DataField = 'IDCARTOPC'
                DataSource = ds
                LookupTable = qryCarteiraInvest
                LookupField = 'IDCARTEIRAINVEST'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblkTPOperCpOpc: TwwDBLookupCombo
                Left = 14
                Top = 32
                Width = 287
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                DataField = 'IDTIPOOPEROPCCP'
                DataSource = ds
                LookupTable = qryTipoOperacao
                LookupField = 'IDTIPOOPERACAO'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblkTPOperVdOpc: TwwDBLookupCombo
                Left = 14
                Top = 73
                Width = 287
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                DataField = 'IDTIPOOPEROPCVD'
                DataSource = ds
                LookupTable = qryTipoOperacao
                LookupField = 'IDTIPOOPERACAO'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
            end
            object grpOpcoesIndices: TGroupBox
              Left = 6
              Top = 148
              Width = 369
              Height = 141
              Caption = 'Opções de Índices'
              TabOrder = 1
              object Label79: TLabel
                Left = 14
                Top = 15
                Width = 165
                Height = 13
                Caption = 'Limite de Diferença da Cesta'
              end
              object lblCarOpcoesInd: TLabel
                Left = 14
                Top = 55
                Width = 173
                Height = 13
                Caption = 'Carteira de Opções de Índices'
              end
              object lblMotBloqOpc: TLabel
                Left = 14
                Top = 97
                Width = 220
                Height = 13
                Caption = 'Motivo de Bloqueio Opções de Índices'
              end
              object dbrLimDifCestaOpcInd: TDBRealEdit
                Left = 14
                Top = 30
                Width = 163
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '1.000,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DIFMAXOPCIND'
                DataSource = ds
              end
              object dblkCartOpcInd: TwwDBLookupCombo
                Left = 14
                Top = 70
                Width = 299
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCARTINVEST'#9'60'#9'Cateira de Opções de Índice'#9'F')
                DataField = 'IDCARTOPCIND'
                DataSource = ds
                LookupTable = qryCarteiraInvest
                LookupField = 'IDCARTEIRAINVEST'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblkMotBloqOpc: TwwDBLookupCombo
                Left = 14
                Top = 112
                Width = 299
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCMOTBLOQ'#9'30'#9'Motivo de Bloqueio'#9'F')
                DataField = 'IDMOTBLOQOPC'
                DataSource = ds
                LookupTable = qryMotivoBloqueio
                LookupField = 'IDMOTIVOBLOQUEIO'
                Options = [loRowLines, loTitles]
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
          object Panel22: TPanel
            Left = 386
            Top = 1
            Width = 387
            Height = 357
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsBMF: TTabSheet
        Caption = 'BM&&F'
        object bvlBMF: TBevel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
        end
        object pnlBmf: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 385
            Height = 357
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label68: TLabel
              Left = 14
              Top = 15
              Width = 113
              Height = 13
              Caption = 'Último Fechamento '
            end
            object Label37: TLabel
              Left = 14
              Top = 57
              Width = 33
              Height = 13
              Caption = 'BM&&F'
            end
            object Label35: TLabel
              Left = 14
              Top = 97
              Width = 122
              Height = 13
              Caption = 'Tipo Investidor BM&&F'
            end
            object Label36: TLabel
              Left = 14
              Top = 141
              Width = 86
              Height = 13
              Caption = 'Mercado BM&&F'
            end
            object Label49: TLabel
              Left = 14
              Top = 184
              Width = 114
              Height = 13
              Caption = 'Dev. de Corretagem'
              WordWrap = True
            end
            object lblPrzVencBMF: TLabel
              Left = 167
              Top = 185
              Width = 138
              Height = 13
              Caption = 'Prazo Aviso Vencimento'
              WordWrap = True
            end
            object dbdDtaFechBMF: TCMDateTimePicker
              Left = 14
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAULTFECHBMF'
              DataSource = ds
              Date = 39528
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
              Time = 39528
              ShowButton = True
              TabOrder = 0
              OnEnter = dbdDtaFechRfEnter
            end
            object dblBMF: TwwDBLookupCombo
              Left = 14
              Top = 70
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLBOLSAVALORES'#9'10'#9'Bolsa')
              DataField = 'IDBMF'
              DataSource = ds
              LookupTable = qryBolsaValores
              LookupField = 'IDBOLSAVALORES'
              Options = [loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblTipoInvestidorBMF: TwwDBLookupCombo
              Left = 14
              Top = 112
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTPINVESTIDOR'#9'60'#9'Tipo de Investidor')
              DataField = 'IDTIPOINVESTIDOR'
              DataSource = ds
              LookupTable = qryTipoInvestBMF
              LookupField = 'IDTIPOINVESTIDOR'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblMercadoBMF: TwwDBLookupCombo
              Left = 14
              Top = 155
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMERCADO'#9'60'#9'Mercado BM & F')
              DataField = 'IDMERCADO'
              DataSource = ds
              LookupTable = qryMercadoBMF
              LookupField = 'IDMERCADO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbrPercDevBMF: TDBRealEdit
              Left = 14
              Top = 198
              Width = 113
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '95,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCDEVBMF'
              DataSource = ds
            end
            object dbrePrzVencBMF: TDBRealEdit
              Left = 167
              Top = 199
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '5')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRZVENCBMF'
              DataSource = ds
            end
          end
          object Panel12: TPanel
            Left = 386
            Top = 1
            Width = 387
            Height = 357
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsRegra: TTabSheet
        Caption = 'Regra'
        ImageIndex = 7
        object pnlRegra: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 359
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel20: TPanel
            Left = 1
            Top = 1
            Width = 382
            Height = 357
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object lblGrupoRegra: TLabel
              Left = 14
              Top = 8
              Width = 213
              Height = 13
              Caption = 'Grupo de Regras para o Investimento'
            end
            object Label70: TLabel
              Left = 14
              Top = 50
              Width = 193
              Height = 13
              Caption = 'Tipo de Regra para Rentabilidade'
            end
            object Label71: TLabel
              Left = 14
              Top = 92
              Width = 203
              Height = 13
              Caption = 'Tipo de Regra para Análise Atuarial'
            end
            object Label54: TLabel
              Left = 14
              Top = 135
              Width = 202
              Height = 13
              Caption = 'Tipo de Regra para Renda Variável'
            end
            object Label53: TLabel
              Left = 14
              Top = 173
              Width = 179
              Height = 13
              Caption = 'Tipo de Regra para Renda Fixa'
            end
            object Label55: TLabel
              Left = 14
              Top = 215
              Width = 147
              Height = 13
              Caption = 'Tipo de Regra para BM&&F'
            end
            object dblkGrupoRegra: TwwDBLookupCombo
              Left = 14
              Top = 23
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Grupo de Regra'#9'F')
              DataField = 'IDGRUPOREGRAINV'
              DataSource = ds
              LookupTable = qryGrupoRegra
              LookupField = 'IDGRUPOREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblTipoRegraRent: TwwDBLookupCombo
              Left = 14
              Top = 64
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRARENT'
              DataSource = ds
              LookupTable = qryTipoRegraRent
              LookupField = 'IDTIPOREGRA'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblTipoRegraAtuarial: TwwDBLookupCombo
              Left = 14
              Top = 107
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAATUAR'
              DataSource = ds
              LookupTable = qryTipoRegraAtuarial
              LookupField = 'IDTIPOREGRA'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblTipoRegraRV: TwwDBLookupCombo
              Left = 14
              Top = 150
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRARV'
              DataSource = ds
              LookupTable = qryTipoRegraRV
              LookupField = 'IDTIPOREGRA'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnExit = dblTipoRegraRVExit
            end
            object dblTipoRegraRF: TwwDBLookupCombo
              Left = 14
              Top = 188
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRARF'
              DataSource = ds
              LookupTable = qryTipoRegraRF
              LookupField = 'IDTIPOREGRA'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblTipoRegraBMF: TwwDBLookupCombo
              Left = 14
              Top = 230
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRABMF'
              DataSource = ds
              LookupTable = qryTipoRegraBMF
              LookupField = 'IDTIPOREGRA'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object Panel19: TPanel
            Left = 383
            Top = 1
            Width = 390
            Height = 357
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object lblTpRegraOpcAc: TLabel
              Left = 14
              Top = 50
              Width = 215
              Height = 13
              Caption = 'Tipo de Regra para Opções de Ações'
            end
            object lblTpRegraOpcInd: TLabel
              Left = 14
              Top = 92
              Width = 221
              Height = 13
              Caption = 'Tipo de Regra para Opções de Índices'
            end
            object lblTpRegraEmpAcoes: TLabel
              Left = 14
              Top = 8
              Width = 236
              Height = 13
              Caption = 'Tipo de Regra para Empréstimo de Ações'
            end
            object dblkTpRegraOpcAc: TwwDBLookupCombo
              Left = 14
              Top = 64
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAEMPAC'
              DataSource = ds
              LookupTable = qryTipoRegraOpcAc
              LookupField = 'IDTIPOREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkTpRegraOpcInd: TwwDBLookupCombo
              Left = 14
              Top = 107
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAOPCIN'
              DataSource = ds
              LookupTable = qryTipoRegraOpcInd
              LookupField = 'IDTIPOREGRA'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkTpRegraEmpAcoes: TwwDBLookupCombo
              Left = 14
              Top = 23
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAEMPAC'
              DataSource = ds
              LookupTable = qryTipoRegraEmpAc
              LookupField = 'IDTIPOREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 784
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 439
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 612
      DockPos = 769
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 443
      DockPos = 600
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 441
    Top = 2
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 313
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMINVEST'
      'set'
      '  MASCSETOREMISSOR = :MASCSETOREMISSOR,'
      '  MOECODIGO = :MOECODIGO,'
      '  MASCCLASSIFINV = :MASCCLASSIFINV,'
      '  VLRDIVERG = :VLRDIVERG,'
      '  VLRCOTAINICART = :VLRCOTAINICART,'
      '  DATAULTFECH = :DATAULTFECH,'
      '  FLGORDMOVINV = :FLGORDMOVINV,'
      '  PERCPUORDMOVINV = :PERCPUORDMOVINV,'
      '  PERCIMPRENDA = :PERCIMPRENDA,'
      '  MOEDAATU = :MOEDAATU,'
      '  PERCPARTICEMPR = :PERCPARTICEMPR,'
      '  PERCPARTICRECUR = :PERCPARTICRECUR,'
      '  IDPARAMPATRLIQ = :IDPARAMPATRLIQ,'
      '  DATAULTFECHRF = :DATAULTFECHRF,'
      '  IDTIPODESPIRAPU = :IDTIPODESPIRAPU,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  FLGPROVISIONAIRRF = :FLGPROVISIONAIRRF,'
      '  FLGPROVISIONAIRRV = :FLGPROVISIONAIRRV,'
      '  PUCDB = :PUCDB,'
      '  DATAMOVCDBLIB = :DATAMOVCDBLIB,'
      '  MOEDAATULIT = :MOEDAATULIT,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDTIPOCLIENTECOR = :IDTIPOCLIENTECOR,'
      '  IDTIPOOPERDIRINC = :IDTIPOOPERDIRINC,'
      '  IDTIPOOPERDIRCIS = :IDTIPOOPERDIRCIS,'
      '  IDTIPOOPERDIRDES = :IDTIPOOPERDIRDES,'
      '  IDTIPOOPERDIRGRU = :IDTIPOOPERDIRGRU,'
      '  IDTIPOOPERDIRPER = :IDTIPOOPERDIRPER,'
      '  IDTIPOOPERDIRBON = :IDTIPOOPERDIRBON,'
      '  IDTIPOOPERDIRDIV = :IDTIPOOPERDIRDIV,'
      '  IDTIPOOPERDIRSUB = :IDTIPOOPERDIRSUB,'
      '  IDTIPOOPERDIRJUR = :IDTIPOOPERDIRJUR,'
      '  IDTIPOCLIENTEEMI = :IDTIPOCLIENTEEMI,'
      '  IDTIPOCLIENTECUS = :IDTIPOCLIENTECUS,'
      '  IDTIPOCONTRRF = :IDTIPOCONTRRF,'
      '  IDBVSP = :IDBVSP,'
      '  IDTIPOINVESTIDOR = :IDTIPOINVESTIDOR,'
      '  IDMERCADO = :IDMERCADO,'
      '  IDTIPOOPERLIQPEND = :IDTIPOOPERLIQPEND,'
      '  IDBMF = :IDBMF,'
      '  DATAULTFECHFDO = :DATAULTFECHFDO,'
      '  DATAULTFECHBMF = :DATAULTFECHBMF,'
      '  IDTPPERIODICIDADE = :IDTPPERIODICIDADE,'
      '  DATAULTIMPCOT = :DATAULTIMPCOT,'
      '  IDTIPOOPERDIRALT = :IDTIPOOPERDIRALT,'
      '  IDRAMOFORCOR = :IDRAMOFORCOR,'
      '  IDRAMOFOREMI = :IDRAMOFOREMI,'
      '  IDRAMOFORCUS = :IDRAMOFORCUS,'
      '  FLGLIBERAIDLOTE = :FLGLIBERAIDLOTE,'
      '  IDTIPOOPERDIRRES = :IDTIPOOPERDIRRES,'
      '  FLGUSASUBCONTA = :FLGUSASUBCONTA,'
      '  PERCDEVRV = :PERCDEVRV,'
      '  PERCDEVBMF = :PERCDEVBMF,'
      '  DIASEMANACPMF = :DIASEMANACPMF,'
      '  DIASUTEISCPMF = :DIASUTEISCPMF,'
      '  IDCUSTODIARENFIX = :IDCUSTODIARENFIX,'
      '  IDTIPOREGRARV = :IDTIPOREGRARV,'
      '  IDTIPOREGRARF = :IDTIPOREGRARF,'
      '  IDTIPOREGRABMF = :IDTIPOREGRABMF,'
      '  FLGIMPLANTRF = :FLGIMPLANTRF,'
      '  FLGCONTABILIZA = :FLGCONTABILIZA,'
      '  FLGINTCAPCAR = :FLGINTCAPCAR,'
      '  IDCONTRAPARTERF = :IDCONTRAPARTERF,'
      '  IDAUTORIZAORDEM = :IDAUTORIZAORDEM,'
      '  IDCLASSETIT = :IDCLASSETIT,'
      '  FLGEMPACOES = :FLGEMPACOES,'
      '  IDCARTEMPACOES = :IDCARTEMPACOES,'
      '  IDREGRAEMPACOES = :IDREGRAEMPACOES,'
      '  IDMOTBLOQEMPAC = :IDMOTBLOQEMPAC,'
      '  FLGCARTGERENC = :FLGCARTGERENC,'
      '  IDINDEXPOUPANCA = :IDINDEXPOUPANCA,'
      '  JUROSPOUPANCA = :JUROSPOUPANCA,'
      '  IDTIPOOPERDIRMUL = :IDTIPOOPERDIRMUL,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERAMORTPRINC = :IDOPERAMORTPRINC,'
      '  IDOPERINCJUROS = :IDOPERINCJUROS,'
      '  IDOPERPAGTOJUROS = :IDOPERPAGTOJUROS,'
      '  FLGESPECFUNDO = :FLGESPECFUNDO,'
      '  FLGCOMPVARRV = :FLGCOMPVARRV,'
      '  PRZVENCBMF = :PRZVENCBMF,'
      '  PRZVENCCFIANCA = :PRZVENCCFIANCA,'
      '  IDCLASSPOUPBLOQ = :IDCLASSPOUPBLOQ,'
      '  IDTIPOREGRARENT = :IDTIPOREGRARENT,'
      '  IDTIPOREGRAATUAR = :IDTIPOREGRAATUAR,'
      '  FLGPLANPREVCTBPAT = :FLGPLANPREVCTBPAT,'
      '  IDCLASSNTN = :IDCLASSNTN,'
      '  IDTIPOOPERDIRREE = :IDTIPOOPERDIRREE,'
      '  DATAULTFECHEMP = :DATAULTFECHEMP,'
      '  IDTIPOOPERDIRPROV = :IDTIPOOPERDIRPROV,'
      '  IDTIPOOPEROPCCP = :IDTIPOOPEROPCCP,'
      '  IDTIPOOPEROPCVD = :IDTIPOOPEROPCVD,'
      '  MOEDAEQM = :MOEDAEQM,'
      '  STARET = :STARET,'
      '  DATAULTRET = :DATAULTRET,'
      '  IDCARTOPCIND = :IDCARTOPCIND,'
      '  IDCARTOPC = :IDCARTOPC,'
      '  IDCARTAVISTA = :IDCARTAVISTA,'
      '  IDMOTBLOQOPC = :IDMOTBLOQOPC,'
      '  IDTIPOREGRAOPCIN = :IDTIPOREGRAOPCIN,'
      '  IDTIPOREGRAEMPAC = :IDTIPOREGRAEMPAC,'
      '  IDTIPODESPDVCOR = :IDTIPODESPDVCOR,'
      '  IDGRUPOREGRAINV = :IDGRUPOREGRAINV,'
      '  FLGDEMO = :FLGDEMO,'
      '  FLGINTFINLIQ = :FLGINTFINLIQ,'
      '  FLGRFEMABERTURA = :FLGRFEMABERTURA,'
      '  IDUSUARIOPROCRF = :IDUSUARIOPROCRF,'
      '  DTMUDACPMF = :DTMUDACPMF,'
      '  FLGRECPAGRV = :FLGRECPAGRV,'
      '  IDTIPOOPERDIRDSU = :IDTIPOOPERDIRDSU,'
      '  FLGRVEMABERTURA = :FLGRVEMABERTURA,'
      '  IDUSUARIOPROCRV = :IDUSUARIOPROCRV,'
      '  FLGEMABERTURAFIB = :FLGEMABERTURAFIB,'
      '  IDUSREMABERTURAFIB = :IDUSREMABERTURAFIB,'
      '  FLGEMABERTURAFAC = :FLGEMABERTURAFAC,'
      '  IDUSREMABERTURAFAC = :IDUSREMABERTURAFAC,'
      '  FLGEMABERTURAFIF = :FLGEMABERTURAFIF,'
      '  IDUSREMABERTURAFIF = :IDUSREMABERTURAFIF,'
      '  FLGEMABERTURAFAO = :FLGEMABERTURAFAO,'
      '  IDUSREMABERTURAFAO = :IDUSREMABERTURAFAO,'
      '  FLGEMABERTURAFID = :FLGEMABERTURAFID,'
      '  IDUSREMABERTURAFID = :IDUSREMABERTURAFID,'
      '  FLGEMABERTURAFPT = :FLGEMABERTURAFPT,'
      '  IDUSREMABERTURAFPT = :IDUSREMABERTURAFPT,'
      '  FLGPOUPAPROPDIA = :FLGPOUPAPROPDIA,'
      '  IDTIPOOPERRFRAC = :IDTIPOOPERRFRAC,'
      '  IDTIPOOPERDIRDSA = :IDTIPOOPERDIRDSA,'
      '  IDTIPOOPERDIRDSR = :IDTIPOOPERDIRDSR,'
      '  FLGREGIMECXCOMP = :FLGREGIMECXCOMP,'
      '  DTAREGIMECXCOMP = :DTAREGIMECXCOMP,'
      '  MASCSCLASSIFANBID = :MASCSCLASSIFANBID,'
      '  PZORECCPMF = :PZORECCPMF,'
      '  DATAINIRECCPMF = :DATAINIRECCPMF,'
      '  FLGEMABERTURAFIC = :FLGEMABERTURAFIC,'
      '  IDUSREMABERTURAFIC = :IDUSREMABERTURAFIC,'
      '  FLGEMABERTURAFIP = :FLGEMABERTURAFIP,'
      '  IDUSREMABERTURAFIP = :IDUSREMABERTURAFIP,'
      '  FLGCONTABDIAUTIL = :FLGCONTABDIAUTIL,'
      '  IDMOTBLOQPENFDO = :IDMOTBLOQPENFDO,'
      '  IDCARTEIRARF = :IDCARTEIRARF,'
      '  FLGINTCONTABRF = :FLGINTCONTABRF,'
      '  FLGINTCONTABRV = :FLGINTCONTABRV,'
      '  FLGINTCONTABBMF = :FLGINTCONTABBMF,'
      '  FLGINTCONTABFRF = :FLGINTCONTABFRF,'
      '  FLGINTCONTABFRV = :FLGINTCONTABFRV,'
      '  FLGINTCONTABFIM = :FLGINTCONTABFIM,'
      '  FLGINTCONTABFDC = :FLGINTCONTABFDC,'
      '  FLGINTCONTABFIP = :FLGINTCONTABFIP,'
      '  FLGINTCONTABOPI = :FLGINTCONTABOPI,'
      '  FLGEMABERTURAFMI = :FLGEMABERTURAFMI,'
      '  IDUSREMABERTURAFMI = :IDUSREMABERTURAFMI,'
      '  REGRABOLETA = :REGRABOLETA,'
      '  FATORCALC = :FATORCALC,'
      '  DATAVIGDIR = :DATAVIGDIR,'
      '  TPDATAVIGDIR = :TPDATAVIGDIR,'
      '  IDCARTORIGEMPACOES = :IDCARTORIGEMPACOES'
      'where'
      '  IDPARAMINVEST = :OLD_IDPARAMINVEST')
    InsertSQL.Strings = (
      'insert into PARAMINVEST'
      
        '  (MASCSETOREMISSOR, MOECODIGO, MASCCLASSIFINV, VLRDIVERG, VLRCO' +
        'TAINICART, '
      
        '   DATAULTFECH, FLGORDMOVINV, PERCPUORDMOVINV, PERCIMPRENDA, MOE' +
        'DAATU, '
      
        '   PERCPARTICEMPR, PERCPARTICRECUR, IDPARAMPATRLIQ, DATAULTFECHR' +
        'F, IDTIPODESPIRAPU, '
      
        '   IDTIPODESPINVEST, FLGPROVISIONAIRRF, FLGPROVISIONAIRRV, PUCDB' +
        ', DATAMOVCDBLIB, '
      
        '   MOEDAATULIT, IDPROGRAMA, IDTIPOCLIENTECOR, IDTIPOOPERDIRINC, ' +
        'IDTIPOOPERDIRCIS, '
      
        '   IDTIPOOPERDIRDES, IDTIPOOPERDIRGRU, IDTIPOOPERDIRPER, IDTIPOO' +
        'PERDIRBON, '
      
        '   IDTIPOOPERDIRDIV, IDTIPOOPERDIRSUB, IDTIPOOPERDIRJUR, IDTIPOC' +
        'LIENTEEMI, '
      
        '   IDTIPOCLIENTECUS, IDTIPOCONTRRF, IDBVSP, IDTIPOINVESTIDOR, ID' +
        'MERCADO, '
      
        '   IDTIPOOPERLIQPEND, IDBMF, DATAULTFECHFDO, DATAULTFECHBMF, IDT' +
        'PPERIODICIDADE, '
      
        '   DATAULTIMPCOT, IDTIPOOPERDIRALT, IDRAMOFORCOR, IDRAMOFOREMI, ' +
        'IDRAMOFORCUS, '
      
        '   FLGLIBERAIDLOTE, IDTIPOOPERDIRRES, FLGUSASUBCONTA, PERCDEVRV,' +
        ' PERCDEVBMF, '
      
        '   DIASEMANACPMF, DIASUTEISCPMF, IDCUSTODIARENFIX, IDTIPOREGRARV' +
        ', IDTIPOREGRARF, '
      
        '   IDTIPOREGRABMF, FLGIMPLANTRF, FLGCONTABILIZA, FLGINTCAPCAR, I' +
        'DCONTRAPARTERF, '
      
        '   IDAUTORIZAORDEM, IDCLASSETIT, FLGEMPACOES, IDCARTEMPACOES, ID' +
        'REGRAEMPACOES, '
      
        '   IDMOTBLOQEMPAC, FLGCARTGERENC, IDINDEXPOUPANCA, JUROSPOUPANCA' +
        ', IDTIPOOPERDIRMUL, '
      
        '   IDPLANPREVCTBPATR, IDOPERAMORTPRINC, IDOPERINCJUROS, IDOPERPA' +
        'GTOJUROS, '
      
        '   FLGESPECFUNDO, FLGCOMPVARRV, PRZVENCBMF, PRZVENCCFIANCA, IDCL' +
        'ASSPOUPBLOQ, '
      
        '   IDTIPOREGRARENT, IDTIPOREGRAATUAR, FLGPLANPREVCTBPAT, IDCLASS' +
        'NTN, IDTIPOOPERDIRREE, '
      
        '   DATAULTFECHEMP, IDTIPOOPERDIRPROV, IDTIPOOPEROPCCP, IDTIPOOPE' +
        'ROPCVD, '
      
        '   MOEDAEQM, STARET, DATAULTRET, IDCARTOPCIND, IDCARTOPC, IDCART' +
        'AVISTA, '
      
        '   IDMOTBLOQOPC, IDTIPOREGRAOPCIN, IDTIPOREGRAEMPAC, IDTIPODESPD' +
        'VCOR, IDGRUPOREGRAINV, '
      
        '   FLGDEMO, FLGINTFINLIQ, FLGRFEMABERTURA, IDUSUARIOPROCRF, DTMU' +
        'DACPMF, '
      
        '   FLGRECPAGRV, IDTIPOOPERDIRDSU, FLGRVEMABERTURA, IDUSUARIOPROC' +
        'RV, FLGEMABERTURAFIB, '
      
        '   IDUSREMABERTURAFIB, FLGEMABERTURAFAC, IDUSREMABERTURAFAC, FLG' +
        'EMABERTURAFIF, '
      
        '   IDUSREMABERTURAFIF, FLGEMABERTURAFAO, IDUSREMABERTURAFAO, FLG' +
        'EMABERTURAFID, '
      
        '   IDUSREMABERTURAFID, FLGEMABERTURAFPT, IDUSREMABERTURAFPT, FLG' +
        'POUPAPROPDIA, '
      
        '   IDTIPOOPERRFRAC, IDTIPOOPERDIRDSA, IDTIPOOPERDIRDSR, FLGREGIM' +
        'ECXCOMP, '
      
        '   DTAREGIMECXCOMP, MASCSCLASSIFANBID, PZORECCPMF, DATAINIRECCPM' +
        'F, FLGEMABERTURAFIC, '
      
        '   IDUSREMABERTURAFIC, FLGEMABERTURAFIP, IDUSREMABERTURAFIP, FLG' +
        'CONTABDIAUTIL, '
      
        '   IDMOTBLOQPENFDO, IDCARTEIRARF, FLGINTCONTABRF, FLGINTCONTABRV' +
        ', FLGINTCONTABBMF, '
      
        '   FLGINTCONTABFRF, FLGINTCONTABFRV, FLGINTCONTABFIM, FLGINTCONT' +
        'ABFDC, '
      
        '   FLGINTCONTABFIP, FLGINTCONTABOPI, FLGEMABERTURAFMI, IDUSREMAB' +
        'ERTURAFMI, '
      
        '   REGRABOLETA, FATORCALC, DATAVIGDIR, TPDATAVIGDIR, IDCARTORIGE' +
        'MPACOES)'
      'values'
      
        '  (:MASCSETOREMISSOR, :MOECODIGO, :MASCCLASSIFINV, :VLRDIVERG, :' +
        'VLRCOTAINICART, '
      
        '   :DATAULTFECH, :FLGORDMOVINV, :PERCPUORDMOVINV, :PERCIMPRENDA,' +
        ' :MOEDAATU, '
      
        '   :PERCPARTICEMPR, :PERCPARTICRECUR, :IDPARAMPATRLIQ, :DATAULTF' +
        'ECHRF, '
      
        '   :IDTIPODESPIRAPU, :IDTIPODESPINVEST, :FLGPROVISIONAIRRF, :FLG' +
        'PROVISIONAIRRV, '
      
        '   :PUCDB, :DATAMOVCDBLIB, :MOEDAATULIT, :IDPROGRAMA, :IDTIPOCLI' +
        'ENTECOR, '
      
        '   :IDTIPOOPERDIRINC, :IDTIPOOPERDIRCIS, :IDTIPOOPERDIRDES, :IDT' +
        'IPOOPERDIRGRU, '
      
        '   :IDTIPOOPERDIRPER, :IDTIPOOPERDIRBON, :IDTIPOOPERDIRDIV, :IDT' +
        'IPOOPERDIRSUB, '
      
        '   :IDTIPOOPERDIRJUR, :IDTIPOCLIENTEEMI, :IDTIPOCLIENTECUS, :IDT' +
        'IPOCONTRRF, '
      
        '   :IDBVSP, :IDTIPOINVESTIDOR, :IDMERCADO, :IDTIPOOPERLIQPEND, :' +
        'IDBMF, '
      
        '   :DATAULTFECHFDO, :DATAULTFECHBMF, :IDTPPERIODICIDADE, :DATAUL' +
        'TIMPCOT, '
      
        '   :IDTIPOOPERDIRALT, :IDRAMOFORCOR, :IDRAMOFOREMI, :IDRAMOFORCU' +
        'S, :FLGLIBERAIDLOTE, '
      
        '   :IDTIPOOPERDIRRES, :FLGUSASUBCONTA, :PERCDEVRV, :PERCDEVBMF, ' +
        ':DIASEMANACPMF, '
      
        '   :DIASUTEISCPMF, :IDCUSTODIARENFIX, :IDTIPOREGRARV, :IDTIPOREG' +
        'RARF, :IDTIPOREGRABMF, '
      
        '   :FLGIMPLANTRF, :FLGCONTABILIZA, :FLGINTCAPCAR, :IDCONTRAPARTE' +
        'RF, :IDAUTORIZAORDEM, '
      
        '   :IDCLASSETIT, :FLGEMPACOES, :IDCARTEMPACOES, :IDREGRAEMPACOES' +
        ', :IDMOTBLOQEMPAC, '
      
        '   :FLGCARTGERENC, :IDINDEXPOUPANCA, :JUROSPOUPANCA, :IDTIPOOPER' +
        'DIRMUL, '
      
        '   :IDPLANPREVCTBPATR, :IDOPERAMORTPRINC, :IDOPERINCJUROS, :IDOP' +
        'ERPAGTOJUROS, '
      
        '   :FLGESPECFUNDO, :FLGCOMPVARRV, :PRZVENCBMF, :PRZVENCCFIANCA, ' +
        ':IDCLASSPOUPBLOQ, '
      
        '   :IDTIPOREGRARENT, :IDTIPOREGRAATUAR, :FLGPLANPREVCTBPAT, :IDC' +
        'LASSNTN, '
      
        '   :IDTIPOOPERDIRREE, :DATAULTFECHEMP, :IDTIPOOPERDIRPROV, :IDTI' +
        'POOPEROPCCP, '
      
        '   :IDTIPOOPEROPCVD, :MOEDAEQM, :STARET, :DATAULTRET, :IDCARTOPC' +
        'IND, :IDCARTOPC, '
      
        '   :IDCARTAVISTA, :IDMOTBLOQOPC, :IDTIPOREGRAOPCIN, :IDTIPOREGRA' +
        'EMPAC, '
      
        '   :IDTIPODESPDVCOR, :IDGRUPOREGRAINV, :FLGDEMO, :FLGINTFINLIQ, ' +
        ':FLGRFEMABERTURA, '
      
        '   :IDUSUARIOPROCRF, :DTMUDACPMF, :FLGRECPAGRV, :IDTIPOOPERDIRDS' +
        'U, :FLGRVEMABERTURA, '
      
        '   :IDUSUARIOPROCRV, :FLGEMABERTURAFIB, :IDUSREMABERTURAFIB, :FL' +
        'GEMABERTURAFAC, '
      
        '   :IDUSREMABERTURAFAC, :FLGEMABERTURAFIF, :IDUSREMABERTURAFIF, ' +
        ':FLGEMABERTURAFAO, '
      
        '   :IDUSREMABERTURAFAO, :FLGEMABERTURAFID, :IDUSREMABERTURAFID, ' +
        ':FLGEMABERTURAFPT, '
      
        '   :IDUSREMABERTURAFPT, :FLGPOUPAPROPDIA, :IDTIPOOPERRFRAC, :IDT' +
        'IPOOPERDIRDSA, '
      
        '   :IDTIPOOPERDIRDSR, :FLGREGIMECXCOMP, :DTAREGIMECXCOMP, :MASCS' +
        'CLASSIFANBID, '
      
        '   :PZORECCPMF, :DATAINIRECCPMF, :FLGEMABERTURAFIC, :IDUSREMABER' +
        'TURAFIC, '
      
        '   :FLGEMABERTURAFIP, :IDUSREMABERTURAFIP, :FLGCONTABDIAUTIL, :I' +
        'DMOTBLOQPENFDO, '
      
        '   :IDCARTEIRARF, :FLGINTCONTABRF, :FLGINTCONTABRV, :FLGINTCONTA' +
        'BBMF, :FLGINTCONTABFRF, '
      
        '   :FLGINTCONTABFRV, :FLGINTCONTABFIM, :FLGINTCONTABFDC, :FLGINT' +
        'CONTABFIP, '
      
        '   :FLGINTCONTABOPI, :FLGEMABERTURAFMI, :IDUSREMABERTURAFMI, :RE' +
        'GRABOLETA, '
      '   :FATORCALC, :DATAVIGDIR, :TPDATAVIGDIR, :IDCARTORIGEMPACOES)')
    DeleteSQL.Strings = (
      'delete from PARAMINVEST'
      'where'
      '  IDPARAMINVEST = :OLD_IDPARAMINVEST')
    Left = 257
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PARAMINVEST.MASCSETOREMISSOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Mascara')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PARAMINVEST')
    CamposChave.Strings = (
      'PARAMINVEST.IDPARAMINVEST')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '15')
    Left = 357
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 413
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 385
    Top = 2
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    SQL.Strings = (
      'SELECT'
      '   IDPARAMINVEST,'
      '   MASCSETOREMISSOR,'
      '   MOECODIGO,'
      '   MASCCLASSIFINV,'
      '   VLRDIVERG,'
      '   VLRCOTAINICART,'
      '   DATAULTFECH,'
      '   FLGORDMOVINV,'
      '   PERCPUORDMOVINV,'
      '   PERCIMPRENDA,'
      '   TRGDTINCLUSAO,'
      '   TRGUSERINCLUSAO,'
      '   MOEDAATU,'
      '   PERCPARTICEMPR,'
      '   PERCPARTICRECUR,'
      '   IDPARAMPATRLIQ,'
      '   TIPOMENU,'
      '   DATAULTFECHRF,'
      '   IDTIPODESPIRAPU,'
      '   IDTIPODESPINVEST,'
      '   MOEDAGER,'
      '   FLGPROVISIONAIRRF,'
      '   FLGPROVISIONAIRRV,'
      '   PUCDB,'
      '   DATAMOVCDBLIB,'
      '   IDTIPODESPIRPROV,'
      '   MOEDAATULIT,'
      '   IDPROGRAMA,'
      '   IDTIPOCLIENTECOR,'
      '   IDTIPOOPERDIRINC,'
      '   IDTIPOOPERDIRCIS,'
      '   IDTIPOOPERDIRDES,'
      '   IDTIPOOPERDIRGRU,'
      '   IDTIPOOPERDIRPER,'
      '   IDTIPOOPERDIRBON,'
      '   IDTIPOOPERDIRDIV,'
      '   IDTIPOOPERDIRSUB,'
      '   IDTIPOINVEST,'
      '   IDTIPOOPERDIRJUR,'
      '   IDTIPOCLIENTEEMI,'
      '   IDTIPOCLIENTECUS,'
      '   IDTIPOCONTRRF,'
      '   IDBVSP,'
      '   IDTIPOINVESTIDOR,'
      '   IDMERCADO,'
      '   IDTIPOOPERLIQPEND,'
      '   IDBMF,'
      '   IDTIPOCONTRFIN,'
      '   DATAULTFECHFDO,'
      '   DATAULTFECHBMF,'
      '   IDTPPERIODICIDADE,'
      '   DATAULTIMPCOT,'
      '   IDTIPOOPERDIRALT,'
      '   IDRAMOFORCOR,'
      '   IDRAMOFOREMI,'
      '   IDRAMOFORCUS,'
      '   FLGLIBERAIDLOTE,'
      '   IDTIPOOPERDIRRES,'
      '   FLGUSASUBCONTA,'
      '   PERCDEVRV,'
      '   PERCDEVBMF,'
      '   DIASEMANACPMF,'
      '   DIASUTEISCPMF,'
      '   IDCUSTODIARENFIX,'
      '   IDTIPOREGRARV,'
      '   IDTIPOREGRARF,'
      '   IDTIPOREGRABMF,'
      '   FLGIMPLANTRF,'
      '   FLGCONTABILIZA,'
      '   FLGINTCAPCAR,'
      '   IDCONTRAPARTERF,'
      '   IDAUTORIZAORDEM,'
      '   IDCLASSETIT,'
      '   FLGEMPACOES,'
      '   IDCARTEMPACOES,'
      '   IDREGRAEMPACOES,'
      '   IDMOTBLOQEMPAC,'
      '   FLGCARTGERENC,'
      '   IDINDEXPOUPANCA,'
      '   JUROSPOUPANCA,'
      '   IDTIPOOPERDIRMUL,'
      '   IDPLANPREVCTBPATR,'
      '   IDOPERAMORTPRINC,'
      '   IDOPERINCJUROS,'
      '   IDOPERPAGTOJUROS,'
      '   FLGESPECFUNDO,'
      '   FLGCOMPVARRV,'
      '   PRZVENCBMF,'
      '   PRZVENCCFIANCA,'
      '   IDCLASSPOUPBLOQ,'
      '   IDTIPOREGRARENT,'
      '   IDTIPOREGRAATUAR,'
      '   FLGPLANPREVCTBPAT,'
      '   IDCLASSNTN,'
      '   IDTIPOOPERDIRREE,'
      '   DATAULTFECHEMP,'
      '   IDTIPOOPERDIRPROV,'
      '   IDTIPOOPEROPCCP,'
      '   IDTIPOOPEROPCVD,'
      '   MOEDAEQM,'
      '   STARET,'
      '   DATAULTRET,'
      '   IDCARTOPCIND,'
      '   IDCARTOPC,'
      '   IDCARTAVISTA,'
      '   IDMOTBLOQOPC,'
      '   DIFMAXOPCIND,'
      '   IDTIPOREGRAOPCIN,'
      '   IDTIPOREGRAEMPAC,'
      '   IDTIPODESPDVCOR,'
      '   IDGRUPOREGRAINV,'
      '   FLGDEMO,'
      '   FLGINTFINLIQ,'
      '   FLGRFEMABERTURA,'
      '   IDUSUARIOPROCRF,'
      '   DTMUDACPMF,'
      '   FLGRECPAGRV,'
      '   IDTIPOOPERDIRDSU,'
      '   DIFRESGFUNDOS,'
      '   FLGRVEMABERTURA,'
      '   IDUSUARIOPROCRV,'
      '   FLGEMABERTURAFIB,'
      '   IDUSREMABERTURAFIB,'
      '   FLGEMABERTURAFAC,'
      '   IDUSREMABERTURAFAC,'
      '   FLGEMABERTURAFIF,'
      '   IDUSREMABERTURAFIF,'
      '   FLGEMABERTURAFAO,'
      '   IDUSREMABERTURAFAO,'
      '   FLGEMABERTURAFID,'
      '   IDUSREMABERTURAFID,'
      '   FLGEMABERTURAFPT,'
      '   IDUSREMABERTURAFPT,'
      '   FLGPOUPAPROPDIA,'
      '   IDTIPOOPERRFRAC,'
      '   IDTIPOOPERDIRDSA,'
      '   IDTIPOOPERDIRDSR,'
      '   FLGREGIMECXCOMP,'
      '   DTAREGIMECXCOMP,'
      '   MASCSCLASSIFANBID,'
      '   PZORECCPMF,'
      '   DATAINIRECCPMF,'
      '   FLGEMABERTURAFIC,'
      '   IDUSREMABERTURAFIC,'
      '   FLGEMABERTURAFIP,'
      '   IDUSREMABERTURAFIP,'
      '   FLGCONTABDIAUTIL,'
      '   IDMOTBLOQPENFDO,'
      '   IDCARTEIRARF,'
      '   FLGINTCONTABRF,'
      '   FLGINTCONTABRV,'
      '   FLGINTCONTABBMF,'
      '   FLGINTCONTABFRF,'
      '   FLGINTCONTABFRV,'
      '   FLGINTCONTABFIM,'
      '   FLGINTCONTABFDC,'
      '   FLGINTCONTABFIP,'
      '   FLGINTCONTABOPI,'
      '   FLGEMABERTURAFMI,'
      '   IDUSREMABERTURAFMI,'
      '   REGRABOLETA,'
      '   FATORCALC,'
      '   DATAVIGDIR,'
      '   TPDATAVIGDIR,'
      '   DATARELMOVIMENTO,'
      '   DATARELINICIAL,'
      '   IDCARTORIGEMPACOES'
      'FROM'
      '   PARAMINVEST'
      ' ')
    Left = 285
    Top = 2
    object qryIDPARAMINVEST: TFloatField
      FieldName = 'IDPARAMINVEST'
      Origin = 'PARAMINVEST.IDPARAMINVEST'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'PARAMINVEST.MOECODIGO'
    end
    object d: TStringField
      FieldName = 'MASCSETOREMISSOR'
      Origin = 'PARAMINVEST.MASCSETOREMISSOR'
      Size = 15
    end
    object qryMASCCLASSIFINV: TStringField
      FieldName = 'MASCCLASSIFINV'
      Origin = 'PARAMINVEST.MASCCLASSIFINV'
      Size = 15
    end
    object qryVLRDIVERG: TFloatField
      FieldName = 'VLRDIVERG'
      Origin = 'PARAMINVEST.VLRDIVERG'
    end
    object qryVLRCOTAINICART: TFloatField
      FieldName = 'VLRCOTAINICART'
      Origin = 'PARAMINVEST.VLRCOTAINICART'
    end
    object qryDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'PARAMINVEST.DATAULTFECH'
    end
    object qryDATAULTFECHRF: TDateTimeField
      FieldName = 'DATAULTFECHRF'
      Origin = 'PARAMINVEST.DATAULTFECHRF'
    end
    object qryFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'PARAMINVEST.FLGORDMOVINV'
      Size = 1
    end
    object qryPERCPUORDMOVINV: TFloatField
      FieldName = 'PERCPUORDMOVINV'
      Origin = 'PARAMINVEST.PERCPUORDMOVINV'
    end
    object qryPERCIMPRENDA: TFloatField
      FieldName = 'PERCIMPRENDA'
      Origin = 'PARAMINVEST.PERCIMPRENDA'
    end
    object qryPUCDB: TFloatField
      FieldName = 'PUCDB'
      Origin = 'PARAMINVEST.PUCDB'
    end
    object qryFLGPROVISIONAIRRF: TStringField
      FieldName = 'FLGPROVISIONAIRRF'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRF'
      Size = 1
    end
    object qryFLGPROVISIONAIRRV: TStringField
      FieldName = 'FLGPROVISIONAIRRV'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRV'
      Size = 1
    end
    object qryMOEDAATU: TFloatField
      FieldName = 'MOEDAATU'
      Origin = 'PARAMINVEST.MOEDAATU'
    end
    object qryPERCPARTICEMPR: TFloatField
      FieldName = 'PERCPARTICEMPR'
      Origin = 'PARAMINVEST.PERCPARTICEMPR'
    end
    object qryPERCPARTICRECUR: TFloatField
      FieldName = 'PERCPARTICRECUR'
      Origin = 'PARAMINVEST.PERCPARTICRECUR'
    end
    object qryIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PARAMINVEST.IDTIPODESPINVEST'
    end
    object qryIDTIPODESPIRAPU: TFloatField
      FieldName = 'IDTIPODESPIRAPU'
      Origin = 'PARAMINVEST.IDTIPODESPIRAPU'
    end
    object qryIDPARAMPATRLIQ: TFloatField
      FieldName = 'IDPARAMPATRLIQ'
      Origin = 'PARAMINVEST.IDPARAMPATRLIQ'
    end
    object qryMOEDAATULIT: TFloatField
      FieldName = 'MOEDAATULIT'
      Origin = 'PARAMINVEST.MOEDAATULIT'
    end
    object qryIDTIPOCONTRRF: TFloatField
      FieldName = 'IDTIPOCONTRRF'
      Origin = 'PARAMINVEST.IDTIPOCONTRRF'
    end
    object qryIDTIPOOPERDIRDIV: TFloatField
      FieldName = 'IDTIPOOPERDIRDIV'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRDIV'
    end
    object qryIDTIPOOPERDIRJUR: TFloatField
      FieldName = 'IDTIPOOPERDIRJUR'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRJUR'
    end
    object qryIDTIPOOPERDIRBON: TFloatField
      FieldName = 'IDTIPOOPERDIRBON'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRBON'
    end
    object qryIDTIPOOPERDIRSUB: TFloatField
      FieldName = 'IDTIPOOPERDIRSUB'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRSUB'
    end
    object qryIDTIPOOPERDIRGRU: TFloatField
      FieldName = 'IDTIPOOPERDIRGRU'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRGRU'
    end
    object qryIDTIPOOPERDIRDES: TFloatField
      FieldName = 'IDTIPOOPERDIRDES'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRDES'
    end
    object qryIDTIPOOPERDIRCIS: TFloatField
      FieldName = 'IDTIPOOPERDIRCIS'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRCIS'
    end
    object qryIDTIPOOPERDIRINC: TFloatField
      FieldName = 'IDTIPOOPERDIRINC'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRINC'
    end
    object qryIDTIPOOPERDIRPER: TFloatField
      FieldName = 'IDTIPOOPERDIRPER'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRPER'
    end
    object qryIDTIPOCLIENTECOR: TFloatField
      FieldName = 'IDTIPOCLIENTECOR'
      Origin = 'PARAMINVEST.IDTIPOCLIENTECOR'
    end
    object qryIDTIPOCLIENTEEMI: TFloatField
      FieldName = 'IDTIPOCLIENTEEMI'
      Origin = 'PARAMINVEST.IDTIPOCLIENTEEMI'
    end
    object qryIDTIPOCLIENTECUS: TFloatField
      FieldName = 'IDTIPOCLIENTECUS'
      Origin = 'PARAMINVEST.IDTIPOCLIENTECUS'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'PARAMINVEST.IDPROGRAMA'
    end
    object qryIDBVSP: TFloatField
      FieldName = 'IDBVSP'
      Origin = 'PARAMINVEST.IDBVSP'
    end
    object qryIDTIPOINVESTIDOR: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'PARAMINVEST.IDTIPOINVESTIDOR'
    end
    object qryIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'PARAMINVEST.IDMERCADO'
    end
    object qryIDTIPOOPERLIQPEND: TFloatField
      FieldName = 'IDTIPOOPERLIQPEND'
      Origin = 'PARAMINVEST.IDTIPOOPERLIQPEND'
    end
    object qryIDBMF: TFloatField
      FieldName = 'IDBMF'
      Origin = 'PARAMINVEST.IDBMF'
    end
    object qryIDTPPERIODICIDADE: TFloatField
      FieldName = 'IDTPPERIODICIDADE'
      Origin = 'PARAMINVEST.IDTPPERIODICIDADE'
    end
    object qryDATAULTIMPCOT: TDateTimeField
      FieldName = 'DATAULTIMPCOT'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTIMPCOT'
    end
    object qryIDTIPOOPERDIRALT: TFloatField
      FieldName = 'IDTIPOOPERDIRALT'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRALT'
    end
    object qryIDRAMOFORCOR: TFloatField
      FieldName = 'IDRAMOFORCOR'
      Origin = 'BASEDADOS.PARAMINVEST.IDRAMOFORCOR'
    end
    object qryIDRAMOFOREMI: TFloatField
      FieldName = 'IDRAMOFOREMI'
      Origin = 'BASEDADOS.PARAMINVEST.IDRAMOFOREMI'
    end
    object qryIDRAMOFORCUS: TFloatField
      FieldName = 'IDRAMOFORCUS'
      Origin = 'BASEDADOS.PARAMINVEST.IDRAMOFORCUS'
    end
    object qryFLGLIBERAIDLOTE: TStringField
      FieldName = 'FLGLIBERAIDLOTE'
      Origin = 'BASEDADOS.PARAMINVEST.FLGLIBERAIDLOTE'
      FixedChar = True
      Size = 1
    end
    object qryDATAULTFECHFDO: TDateTimeField
      FieldName = 'DATAULTFECHFDO'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTFECHFDO'
    end
    object qryTIPOMENU: TStringField
      FieldName = 'TIPOMENU'
      Origin = 'BASEDADOS.PARAMINVEST.TIPOMENU'
      FixedChar = True
      Size = 1
    end
    object qryMOEDAGER: TFloatField
      FieldName = 'MOEDAGER'
      Origin = 'BASEDADOS.PARAMINVEST.MOEDAGER'
    end
    object qryIDTIPODESPIRPROV: TFloatField
      FieldName = 'IDTIPODESPIRPROV'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPODESPIRPROV'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOINVEST'
    end
    object qryIDTIPOCONTRFIN: TFloatField
      FieldName = 'IDTIPOCONTRFIN'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOCONTRFIN'
    end
    object qryDATAULTFECHBMF: TDateTimeField
      FieldName = 'DATAULTFECHBMF'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTFECHBMF'
    end
    object qryIDTIPOOPERDIRRES: TFloatField
      FieldName = 'IDTIPOOPERDIRRES'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRRES'
    end
    object qryFLGUSASUBCONTA: TStringField
      FieldName = 'FLGUSASUBCONTA'
      Origin = 'BASEDADOS.PARAMINVEST.FLGUSASUBCONTA'
      FixedChar = True
      Size = 1
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.PARAMINVEST.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.PARAMINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryPERCDEVRV: TFloatField
      FieldName = 'PERCDEVRV'
      Origin = 'BASEDADOS.PARAMINVEST.PERCDEVRV'
    end
    object qryPERCDEVBMF: TFloatField
      FieldName = 'PERCDEVBMF'
      Origin = 'BASEDADOS.PARAMINVEST.PERCDEVBMF'
    end
    object qryDIASEMANACPMF: TStringField
      FieldName = 'DIASEMANACPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DIASEMANACPMF'
      Size = 7
    end
    object qryDIASUTEISCPMF: TFloatField
      FieldName = 'DIASUTEISCPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DIASUTEISCPMF'
    end
    object qryIDCUSTODIARENFIX: TFloatField
      FieldName = 'IDCUSTODIARENFIX'
      Origin = 'BASEDADOS.PARAMINVEST.IDCUSTODIARENFIX'
    end
    object qryIDTIPOREGRARV: TFloatField
      FieldName = 'IDTIPOREGRARV'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRARV'
    end
    object qryIDTIPOREGRARF: TFloatField
      FieldName = 'IDTIPOREGRARF'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRARF'
    end
    object qryIDTIPOREGRABMF: TFloatField
      FieldName = 'IDTIPOREGRABMF'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRABMF'
    end
    object qryFLGIMPLANTRF: TStringField
      FieldName = 'FLGIMPLANTRF'
      FixedChar = True
      Size = 1
    end
    object qryFLGCONTABILIZA: TStringField
      FieldName = 'FLGCONTABILIZA'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCAPCAR: TStringField
      FieldName = 'FLGINTCAPCAR'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCAPCAR'
      FixedChar = True
      Size = 1
    end
    object qryIDCONTRAPARTERF: TFloatField
      FieldName = 'IDCONTRAPARTERF'
      Origin = 'BASEDADOS.PARAMINVEST.IDCONTRAPARTERF'
    end
    object qryIDAUTORIZAORDEM: TFloatField
      FieldName = 'IDAUTORIZAORDEM'
      Origin = 'BASEDADOS.PARAMINVEST.IDAUTORIZAORDEM'
    end
    object qryIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.PARAMINVEST.IDCLASSETIT'
    end
    object qryFLGEMPACOES: TStringField
      FieldName = 'FLGEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMPACOES'
      FixedChar = True
      Size = 1
    end
    object qryIDCARTEMPACOES: TFloatField
      FieldName = 'IDCARTEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTEMPACOES'
    end
    object qryIDREGRAEMPACOES: TFloatField
      FieldName = 'IDREGRAEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.IDREGRAEMPACOES'
    end
    object qryIDMOTBLOQEMPAC: TFloatField
      FieldName = 'IDMOTBLOQEMPAC'
      Origin = 'BASEDADOS.PARAMINVEST.IDMOTBLOQEMPAC'
    end
    object qryFLGCARTGERENC: TStringField
      FieldName = 'FLGCARTGERENC'
      Origin = 'BASEDADOS.PARAMINVEST.FLGCARTGERENC'
      FixedChar = True
      Size = 1
    end
    object qryIDINDEXPOUPANCA: TFloatField
      FieldName = 'IDINDEXPOUPANCA'
      Origin = 'BASEDADOS.PARAMINVEST.IDINDEXPOUPANCA'
    end
    object qryJUROSPOUPANCA: TFloatField
      FieldName = 'JUROSPOUPANCA'
      Origin = 'BASEDADOS.PARAMINVEST.JUROSPOUPANCA'
      DisplayFormat = '###,###,###.##'
    end
    object qryIDTIPOOPERDIRMUL: TFloatField
      FieldName = 'IDTIPOOPERDIRMUL'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRMUL'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PARAMINVEST.IDPLANPREVCTBPATR'
    end
    object qryIDOPERAMORTPRINC: TFloatField
      FieldName = 'IDOPERAMORTPRINC'
      Origin = 'BASEDADOS.PARAMINVEST.IDOPERAMORTPRINC'
    end
    object qryIDOPERINCJUROS: TFloatField
      FieldName = 'IDOPERINCJUROS'
      Origin = 'BASEDADOS.PARAMINVEST.IDOPERINCJUROS'
    end
    object qryIDOPERPAGTOJUROS: TFloatField
      FieldName = 'IDOPERPAGTOJUROS'
      Origin = 'BASEDADOS.PARAMINVEST.IDOPERPAGTOJUROS'
    end
    object qryFLGESPECFUNDO: TStringField
      FieldName = 'FLGESPECFUNDO'
      Origin = 'BASEDADOS.PARAMINVEST.FLGESPECFUNDO'
      FixedChar = True
      Size = 1
    end
    object qryFLGCOMPVARRV: TStringField
      FieldName = 'FLGCOMPVARRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGCOMPVARRV'
      FixedChar = True
      Size = 1
    end
    object qryPRZVENCBMF: TFloatField
      FieldName = 'PRZVENCBMF'
      Origin = 'BASEDADOS.PARAMINVEST.PRZVENCBMF'
    end
    object qryPRZVENCCFIANCA: TFloatField
      FieldName = 'PRZVENCCFIANCA'
      Origin = 'BASEDADOS.PARAMINVEST.PRZVENCCFIANCA'
    end
    object qryIDCLASSPOUPBLOQ: TFloatField
      FieldName = 'IDCLASSPOUPBLOQ'
      Origin = 'BASEDADOS.PARAMINVEST.IDCLASSPOUPBLOQ'
    end
    object qryIDTIPOREGRARENT: TFloatField
      FieldName = 'IDTIPOREGRARENT'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRARENT'
    end
    object qryIDTIPOREGRAATUAR: TFloatField
      FieldName = 'IDTIPOREGRAATUAR'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRAATUAR'
    end
    object qryFLGPLANPREVCTBPAT: TStringField
      FieldName = 'FLGPLANPREVCTBPAT'
      Origin = 'BASEDADOS.PARAMINVEST.FLGPLANPREVCTBPAT'
      FixedChar = True
      Size = 1
    end
    object qryIDCLASSNTN: TFloatField
      FieldName = 'IDCLASSNTN'
      Origin = 'BASEDADOS.PARAMINVEST.IDCLASSNTN'
    end
    object qryIDTIPOOPERDIRREE: TFloatField
      FieldName = 'IDTIPOOPERDIRREE'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRREE'
    end
    object qryDATAULTFECHEMP: TDateTimeField
      FieldName = 'DATAULTFECHEMP'
      Origin = 'BASEDADOS.PARAMINVEST.DATAULTFECHEMP'
    end
    object qryIDTIPOOPERDIRPROV: TFloatField
      FieldName = 'IDTIPOOPERDIRPROV'
    end
    object qryIDTIPOOPEROPCCP: TFloatField
      FieldName = 'IDTIPOOPEROPCCP'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPEROPCCP'
    end
    object qryIDTIPOOPEROPCVD: TFloatField
      FieldName = 'IDTIPOOPEROPCVD'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPEROPCVD'
    end
    object qryMOEDAEQM: TFloatField
      FieldName = 'MOEDAEQM'
      Origin = 'BASEDADOS.PARAMINVEST.MOEDAEQM'
    end
    object qrySTARET: TStringField
      FieldName = 'STARET'
      FixedChar = True
      Size = 1
    end
    object qryDATAULTRET: TDateTimeField
      FieldName = 'DATAULTRET'
    end
    object qryIDCARTOPCIND: TFloatField
      FieldName = 'IDCARTOPCIND'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTOPCIND'
    end
    object qryIDCARTOPC: TFloatField
      FieldName = 'IDCARTOPC'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTOPC'
    end
    object qryIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTAVISTA'
    end
    object qryIDMOTBLOQOPC: TFloatField
      FieldName = 'IDMOTBLOQOPC'
      Origin = 'BASEDADOS.PARAMINVEST.IDMOTBLOQOPC'
    end
    object qryDIFMAXOPCIND: TFloatField
      FieldName = 'DIFMAXOPCIND'
    end
    object qryIDTIPOREGRAOPCIN: TFloatField
      FieldName = 'IDTIPOREGRAOPCIN'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRAOPCIN'
    end
    object qryIDTIPOREGRAEMPAC: TFloatField
      FieldName = 'IDTIPOREGRAEMPAC'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOREGRAEMPAC'
    end
    object qryIDTIPODESPDVCOR: TFloatField
      FieldName = 'IDTIPODESPDVCOR'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPODESPDVCOR'
    end
    object qryIDGRUPOREGRAINV: TFloatField
      FieldName = 'IDGRUPOREGRAINV'
      Origin = 'BASEDADOS.PARAMINVEST.IDGRUPOREGRAINV'
    end
    object qryFLGDEMO: TStringField
      FieldName = 'FLGDEMO'
      Origin = 'BASEDADOS.PARAMINVEST.FLGDEMO'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTFINLIQ: TStringField
      FieldName = 'FLGINTFINLIQ'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTFINLIQ'
      FixedChar = True
      Size = 1
    end
    object qryFLGRFEMABERTURA: TStringField
      FieldName = 'FLGRFEMABERTURA'
      Origin = 'BASEDADOS.PARAMINVEST.FLGRFEMABERTURA'
      FixedChar = True
      Size = 1
    end
    object qryIDUSUARIOPROCRF: TFloatField
      FieldName = 'IDUSUARIOPROCRF'
    end
    object qryDTMUDACPMF: TDateTimeField
      FieldName = 'DTMUDACPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DTMUDACPMF'
    end
    object qryFLGRECPAGRV: TStringField
      FieldName = 'FLGRECPAGRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGRECPAGRV'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOOPERDIRDSU: TFloatField
      FieldName = 'IDTIPOOPERDIRDSU'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRDSU'
    end
    object qryDIFRESGFUNDOS: TFloatField
      FieldName = 'DIFRESGFUNDOS'
      Origin = 'BASEDADOS.PARAMINVEST.DIFRESGFUNDOS'
    end
    object qryFLGRVEMABERTURA: TStringField
      FieldName = 'FLGRVEMABERTURA'
      Origin = 'BASEDADOS.PARAMINVEST.FLGRVEMABERTURA'
      FixedChar = True
      Size = 1
    end
    object qryIDUSUARIOPROCRV: TFloatField
      FieldName = 'IDUSUARIOPROCRV'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSUARIOPROCRV'
    end
    object qryFLGEMABERTURAFIB: TStringField
      FieldName = 'FLGEMABERTURAFIB'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFIB'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFIB: TFloatField
      FieldName = 'IDUSREMABERTURAFIB'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFIB'
    end
    object qryFLGEMABERTURAFAC: TStringField
      FieldName = 'FLGEMABERTURAFAC'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFAC'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFAC: TFloatField
      FieldName = 'IDUSREMABERTURAFAC'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFAC'
    end
    object qryFLGEMABERTURAFIF: TStringField
      FieldName = 'FLGEMABERTURAFIF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFIF'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFIF: TFloatField
      FieldName = 'IDUSREMABERTURAFIF'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFIF'
    end
    object qryFLGEMABERTURAFAO: TStringField
      FieldName = 'FLGEMABERTURAFAO'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFAO'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFAO: TFloatField
      FieldName = 'IDUSREMABERTURAFAO'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFAO'
    end
    object qryFLGEMABERTURAFID: TStringField
      FieldName = 'FLGEMABERTURAFID'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFID'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFID: TFloatField
      FieldName = 'IDUSREMABERTURAFID'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFID'
    end
    object qryFLGEMABERTURAFPT: TStringField
      FieldName = 'FLGEMABERTURAFPT'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFPT'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFPT: TFloatField
      FieldName = 'IDUSREMABERTURAFPT'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFPT'
    end
    object qryFLGPOUPAPROPDIA: TStringField
      FieldName = 'FLGPOUPAPROPDIA'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOOPERRFRAC: TFloatField
      FieldName = 'IDTIPOOPERRFRAC'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERRFRAC'
    end
    object qryIDTIPOOPERDIRDSA: TFloatField
      FieldName = 'IDTIPOOPERDIRDSA'
    end
    object qryIDTIPOOPERDIRDSR: TFloatField
      FieldName = 'IDTIPOOPERDIRDSR'
    end
    object qryFLGREGIMECXCOMP: TStringField
      FieldName = 'FLGREGIMECXCOMP'
      Origin = 'BASEDADOS.PARAMINVEST.FLGREGIMECXCOMP'
      FixedChar = True
      Size = 1
    end
    object qryDTAREGIMECXCOMP: TDateTimeField
      FieldName = 'DTAREGIMECXCOMP'
      Origin = 'BASEDADOS.PARAMINVEST.DTAREGIMECXCOMP'
    end
    object qryPZORECCPMF: TFloatField
      FieldName = 'PZORECCPMF'
      Origin = 'BASEDADOS.PARAMINVEST.PZORECCPMF'
    end
    object qryDATAINIRECCPMF: TDateTimeField
      FieldName = 'DATAINIRECCPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DATAINIRECCPMF'
    end
    object qryMASCSCLASSIFANBID: TStringField
      FieldName = 'MASCSCLASSIFANBID'
      Origin = 'BASEDADOS.PARAMINVEST.MASCSCLASSIFANBID'
      Size = 15
    end
    object qryFLGEMABERTURAFIP: TStringField
      FieldName = 'FLGEMABERTURAFIP'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFIP'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFIP: TFloatField
      FieldName = 'IDUSREMABERTURAFIP'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFIP'
    end
    object qryFLGEMABERTURAFIC: TStringField
      FieldName = 'FLGEMABERTURAFIC'
      Origin = 'BASEDADOS."CM.PARAMINVEST".FLGEMABERTURAFIC'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFIC: TFloatField
      FieldName = 'IDUSREMABERTURAFIC'
      Origin = 'BASEDADOS."CM.PARAMINVEST".IDUSREMABERTURAFIC'
    end
    object qryFLGCONTABDIAUTIL: TStringField
      FieldName = 'FLGCONTABDIAUTIL'
      Origin = 'BASEDADOS."CM.PARAMINVEST".FLGCONTABDIAUTIL'
      FixedChar = True
      Size = 1
    end
    object qryIDMOTBLOQPENFDO: TFloatField
      FieldName = 'IDMOTBLOQPENFDO'
      Origin = 'BASEDADOS.PARAMINVEST.IDMOTBLOQPENFDO'
    end
    object qryIDCARTEIRARF: TFloatField
      FieldName = 'IDCARTEIRARF'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTEIRARF'
    end
    object qryFLGINTCONTABRF: TStringField
      FieldName = 'FLGINTCONTABRF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABRF'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABRV: TStringField
      FieldName = 'FLGINTCONTABRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABRV'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABBMF: TStringField
      FieldName = 'FLGINTCONTABBMF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABBMF'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABFRF: TStringField
      FieldName = 'FLGINTCONTABFRF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFRF'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABFRV: TStringField
      FieldName = 'FLGINTCONTABFRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFRV'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABFIM: TStringField
      FieldName = 'FLGINTCONTABFIM'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFIM'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABFDC: TStringField
      FieldName = 'FLGINTCONTABFDC'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFDC'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABFIP: TStringField
      FieldName = 'FLGINTCONTABFIP'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFIP'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCONTABOPI: TStringField
      FieldName = 'FLGINTCONTABOPI'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABOPI'
      FixedChar = True
      Size = 1
    end
    object qryDATAMOVCDBLIB: TDateTimeField
      FieldName = 'DATAMOVCDBLIB'
      Origin = 'BASEDADOS.PARAMINVEST.DATAMOVCDBLIB'
    end
    object qryFLGEMABERTURAFMI: TStringField
      FieldName = 'FLGEMABERTURAFMI'
      Origin = 'BASEDADOS.PARAMINVEST.FLGEMABERTURAFMI'
      FixedChar = True
      Size = 1
    end
    object qryIDUSREMABERTURAFMI: TFloatField
      FieldName = 'IDUSREMABERTURAFMI'
      Origin = 'BASEDADOS.PARAMINVEST.IDUSREMABERTURAFMI'
    end
    object qryREGRABOLETA: TStringField
      FieldName = 'REGRABOLETA'
      Size = 1
    end
    object qryFATORCALC2: TFloatField
      FieldName = 'FATORCALC'
      Origin = 'BASEDADOS.PARAMINVEST.FATORCALC'
    end
    object qryDATAVIGDIR: TDateTimeField
      FieldName = 'DATAVIGDIR'
      Origin = 'BASEDADOS.PARAMINVEST.DATAVIGDIR'
    end
    object qryTPDATAVIGDIR: TStringField
      FieldName = 'TPDATAVIGDIR'
      FixedChar = True
      Size = 1
    end
    object qryIDCARTORIGEMPACOES: TFloatField
      FieldName = 'IDCARTORIGEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTORIGEMPACOES'
    end
    object qryDATARELMOVIMENTO: TDateTimeField
      FieldName = 'DATARELMOVIMENTO'
      Origin = 'BASEDADOS.PARAMINVEST.DATARELMOVIMENTO'
    end
    object qryDATARELINICIAL: TDateTimeField
      FieldName = 'DATARELINICIAL'
      Origin = 'BASEDADOS.PARAMINVEST.DATARELINICIAL'
    end
  end
  object qryaux: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select P.IdParamInvest ,P.MascSetorEmissor from CM.PARAMINVEST P')
    ValidateWithMask = True
    Left = 545
  end
  object QryBuscaMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  MOECODIGO, MOEDESC ,MOESIGLA'
      ''
      'FROM MOEDA '
      ''
      'ORDER BY MOEDESC ')
    ValidateWithMask = True
    Left = 426
    Top = 177
    object QryBuscaMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla da Moeda'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object QryBuscaMoedaMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 40
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object QryBuscaMoedaMOECODIGO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryIndicador: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DESCPARAMEMISSOR, IDPARAMEMISSOR'
      'FROM PARAMEMISSOR')
    ValidateWithMask = True
    Left = 530
    Top = 73
    object qryIndicadorDESCPARAMEMISSOR: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 60
      FieldName = 'DESCPARAMEMISSOR'
      Origin = 'PARAMEMISSOR.DESCPARAMEMISSOR'
      Size = 60
    end
    object qryIndicadorIDPARAMEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARAMEMISSOR'
      Origin = 'PARAMEMISSOR.IDPARAMEMISSOR'
      Visible = False
    end
  end
  object qryTpoDespInv: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DESCTIPODESPINV, IDTIPODESPINVEST'
      'FROM TIPODESPINVEST'
      'ORDER BY  DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 613
    Top = 73
    object qryTpoDespInvDESCTIPODESPINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object qryTpoDespInvIDTIPODESPINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
      Visible = False
    end
  end
  object QryTipoContrato: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPOCONTRINVEST,'
      '      DESCTIPOCTINVEST'
      'FROM'
      '      TIPOCONTRINVEST '
      'WHERE '
      '  IDTIPOINVEST = 1'
      'ORDER BY DESCTIPOCTINVEST'
      '')
    ValidateWithMask = True
    Left = 338
    Top = 90
    object QryTipoContratoDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      Size = 60
    end
    object QryTipoContratoIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'TIPOCONTRINVEST.IDTIPOCONTRINVEST'
      Visible = False
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCTIPOOPERACAO,'
      '   IDTIPOOPERACAO'
      'FROM'
      '   TIPOOPERACAO'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 330
    Top = 143
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object QryTipoCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCLIENTE,'
      '   DESCRICAO'
      'FROM'
      ' TIPOCLIENTE'
      'ORDER BY  DESCRICAO')
    ValidateWithMask = True
    Left = 237
    Top = 193
    object QryTipoClienteDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object QryTipoClienteIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.IDTIPOCLIENTE'
      Visible = False
    end
  end
  object QryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '  IDPROGRAMA,'
      '  DESCPROGRAMA'
      'FROM'
      '  PROGRAMA'
      'ORDER BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 154
    Top = 86
    object QryProgramaDESCPROGRAMA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object QryProgramaIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
  end
  object qryBolsaValores: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDBOLSAVALORES,'
      '  SGLBOLSAVALORES'
      'FROM'
      '  BOLSAVALORES'
      'ORDER BY'
      '  SGLBOLSAVALORES')
    ValidateWithMask = True
    Left = 442
    Top = 377
    object qryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Bolsa'
      DisplayWidth = 10
      FieldName = 'SGLBOLSAVALORES'
      Origin = '"CM.BOLSAVALORES".SGLBOLSAVALORES'
      Size = 10
    end
    object qryBolsaValoresIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = '"CM.BOLSAVALORES".IDBOLSAVALORES'
      Visible = False
    end
  end
  object qryTipoInvestBMF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOINVESTIDOR,'
      '  DESCTPINVESTIDOR'
      'FROM'
      '  TIPOINVESTIDOR'
      'ORDER BY'
      '  DESCTPINVESTIDOR')
    ValidateWithMask = True
    Left = 237
    Top = 143
    object qryTipoInvestBMFDESCTPINVESTIDOR: TStringField
      DisplayLabel = 'Tipo de Investidor'
      DisplayWidth = 60
      FieldName = 'DESCTPINVESTIDOR'
      Origin = 'TIPOINVESTIDOR.DESCTPINVESTIDOR'
      Size = 60
    end
    object qryTipoInvestBMFIDTIPOINVESTIDOR: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'TIPOINVESTIDOR.IDTIPOINVESTIDOR'
      Visible = False
    end
  end
  object qryMercadoBMF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMERCADO,'
      '  DESCMERCADO'
      'FROM'
      '  MERCADO'
      'WHERE IDTIPOINVEST=8')
    ValidateWithMask = True
    Left = 530
    Top = 177
    object qryMercadoBMFDESCMERCADO: TStringField
      DisplayLabel = 'Mercado BM & F'
      DisplayWidth = 60
      FieldName = 'DESCMERCADO'
      Origin = 'MERCADO.DESCMERCADO'
      Size = 60
    end
    object qryMercadoBMFIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'MERCADO.IDMERCADO'
      Visible = False
    end
  end
  object qryBuscaPendencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOOPERACAO,IDTIPOOPERACAO '
      'FROM   TIPOOPERACAO'
      'WHERE '
      '   FLGOPDIREITO <> '#39'S'#39' '
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 426
    Top = 121
    object qryBuscaPendenciaDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaPendenciaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryTpPeriodicidade: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IDTPPERIODICIDADE,NOME '
      'FROM '
      '      TPPERIODICIDADE')
    ValidateWithMask = True
    Left = 237
    Top = 247
    object qryTpPeriodicidadeNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = '"CM.TPPERIODICIDADE".NOME'
      Size = 30
    end
    object qryTpPeriodicidadeIDTPPERIODICIDADE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPPERIODICIDADE'
      Origin = '"CM.TPPERIODICIDADE".IDTPPERIODICIDADE'
      Visible = False
    end
  end
  object QryRamoFornecedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDRAMOFORNECEDOR,'
      '   DESCRAMOFORNECEDOR'
      'FROM'
      ' RAMOFORNECEDOR'
      'ORDER BY  DESCRAMOFORNECEDOR')
    ValidateWithMask = True
    Left = 154
    Top = 193
    object QryRamoFornecedorDESCRAMOFORNECEDOR: TStringField
      DisplayLabel = 'Ramo Custodiante'
      DisplayWidth = 30
      FieldName = 'DESCRAMOFORNECEDOR'
      Origin = 'BASEDADOS.RAMOFORNECEDOR.DESCRAMOFORNECEDOR'
      Size = 30
    end
    object QryRamoFornecedorIDRAMOFORNECEDOR: TFloatField
      FieldName = 'IDRAMOFORNECEDOR'
      Origin = 'BASEDADOS.RAMOFORNECEDOR.IDRAMOFORNECEDOR'
      Visible = False
    end
  end
  object qryCustodiante: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCUSTODIANTE,SGLCUSTODIANTE'
      'FROM'
      '   CUSTODIANTE'
      ''
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 143
    object qryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryTipoRegraRF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 613
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object qryTipoRegraRFDESCREGRA: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object qryTipoRegraRFIDTIPOREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryTipoRegraRV: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA'
      ' ')
    ValidateWithMask = True
    Left = 706
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField6: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField15: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryTipoRegraBMF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 613
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField7: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField16: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryContraParte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     DISTINCT PE.IDPESSOA, PE.NOME'
      'FROM'
      '   PESSOA PE'
      'WHERE '
      '      PE.IDPESSOA IN  ('
      '                                      SELECT'
      '                                            EM.IDEMISSOR '
      '                                      FROM'
      '                                             EMISSOR EM'
      '                                      '
      '                                      UNION'
      '                                     '
      '                                      SELECT'
      '                                             CU.IDCUSTODIANTE'
      '                                       FROM'
      '                                             CUSTODIANTE CU'
      ''
      '                                      UNION'
      '                                     '
      '                                      SELECT'
      '                                             BV.IDBOLSAVALORES'
      '                                       FROM'
      '                                             BOLSAVALORES BV'
      ''
      '                                      UNION'
      '                                     '
      '                                      SELECT'
      '                                             CT.IDCORRETVALORES'
      '                                       FROM'
      '                                             CORRETVALORES CT'
      '                                     )'
      'ORDER BY PE.NOME')
    ValidateWithMask = True
    Left = 50
    Top = 102
    object qryContraParteNOME: TStringField
      DisplayLabel = 'Contra Parte'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryContraParteIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object qryAutorizaOper: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDUSUARIO,NOMEUSUARIO'
      'FROM'
      '   AUTORIZAOPERACAO'
      'WHERE FLGATIVO='#39'S'#39)
    ValidateWithMask = True
    Left = 426
    Top = 73
    object qryAutorizaOperNOMEUSUARIO: TStringField
      DisplayLabel = 'Autorizador'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.AUTORIZAOPERACAO.NOMEUSUARIO'
    end
    object qryAutorizaOperIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.AUTORIZAOPERACAO.IDUSUARIO'
      Visible = False
    end
  end
  object QryClasseTitulo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCLASSETIT,DESCCLASSETIT'
      'FROM'
      '  CLASSETITRENFIX'
      'ORDER BY'
      '  DESCCLASSETIT'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 247
    object QryClasseTituloDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe do Título'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
    object QryClasseTituloIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
      Visible = False
    end
  end
  object qryCarteiraInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDCARTEIRAINVEST,DESCCARTINVEST'
      'FROM'
      '    CARTEIRAINVEST'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 50
    Top = 177
    object qryCarteiraInvestDESCCARTINVEST: TStringField
      DisplayLabel = 'Cateira de Opções de Índice'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object qryRegraEmpAcoes: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM'
      '    REGRA'
      'WHERE'
      '    IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 706
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptUnknown
      end>
    object qryRegraEmpAcoesNOMEREGRA: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraEmpAcoesIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryMotivoBloqueio: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMOTIVOBLOQUEIO,DESCMOTBLOQ'
      'FROM'
      '   MOTIVOBLOQUEIO'
      'ORDER BY DESCMOTBLOQ'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 250
    Top = 345
    object qryMotivoBloqueioDESCMOTBLOQ: TStringField
      DisplayLabel = 'Motivo de Bloqueio'
      DisplayWidth = 30
      FieldName = 'DESCMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object qryMotivoBloqueioIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
  end
  object qryPatroPlanPrevContab: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA)  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 154
    Top = 143
    object qryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPatroPlanPrevContabIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPatroPlanPrevContabIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object qryItemRenFix: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDITEMRENFIX,DESCITEMRENFIX'
      'FROM'
      '    ITEMRENFIX'
      'ORDER BY'
      '    DESCITEMRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 530
    Top = 121
  end
  object qryTipoRegraRent: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 706
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField8: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField17: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryTipoRegraAtuarial: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 541
    Top = 385
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField9: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField18: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryGrupoRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOREGRA,DESCRICAO'
      'FROM GRUPOREGRA'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 330
    Top = 249
    object qryGrupoRegraDESCRICAO: TStringField
      DisplayLabel = 'Grupo de Regra'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.GRUPOREGRA.DESCRICAO'
      Size = 60
    end
    object qryGrupoRegraIDGRUPOREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOREGRA'
      Origin = 'BASEDADOS.GRUPOREGRA.IDGRUPOREGRA'
      Visible = False
    end
  end
  object qryTipoRegraOpcAc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 706
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryTipoRegraOpcInd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 626
    Top = 385
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField2: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryTipoRegraEmpAc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA,DESCREGRA'
      'FROM'
      '   TIPOREGRA'
      'WHERE'
      
        '   (((:IDGRUPOREGRAINV IS NOT NULL) AND (IDGRUPOREGRA = :IDGRUPO' +
        'REGRAINV)) OR (:IDGRUPOREGRAINV IS NULL))'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 237
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRAINV'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      DisplayLabel = 'Tipo de Regra'
      DisplayWidth = 40
      FieldName = 'DESCREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.DESCREGRA'
      Size = 60
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.TIPOREGRA.IDTIPOREGRA'
      Visible = False
    end
  end
  object qryUsuarioProcRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, U.IDUSUARIO'
      'FROM USUARIOSISTEMA U, PESSOA P'
      'WHERE U.IDUSUARIO = P.IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 154
    Top = 247
    object qryUsuarioProcRFNOME: TStringField
      DisplayLabel = 'Nome do Usuario'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryUsuarioProcRFIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.IDUSUARIO'
      Visible = False
    end
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCTIPOFUNDOINV')
    ValidateWithMask = True
    Left = 330
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryTipoFundoDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DATAULTFECH'
      Visible = False
    end
    object QryTipoFundoTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryTipoFundoTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object qryMotBloqPenFdo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      'FROM   MOTIVOBLOQUEIO'
      'WHERE  IDMOTIVOBLOQUEIO <> -1'
      'ORDER BY DESCMOTBLOQ')
    ValidateWithMask = True
    Left = 362
    Top = 297
    object qryMotBloqPenFdoDESCMOTBLOQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object qryMotBloqPenFdoIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryMotBloqPenFdoSIGLAMOTBLOQ: TStringField
      DisplayWidth = 3
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
  end
  object qryCarteiraRF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 1'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 338
    Top = 353
    object qryCarteiraRFDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraRFIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
end
