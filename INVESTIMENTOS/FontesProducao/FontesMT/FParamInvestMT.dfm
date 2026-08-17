inherited FrmParamInvestMT: TFrmParamInvestMT
  Left = 273
  Top = 218
  Caption = 'Parametros do Sistema'
  ClientHeight = 444
  ClientWidth = 786
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 786
    Height = 358
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 784
      Height = 356
      ActivePage = tbsSistema
      Align = alClient
      MultiLine = True
      Style = tsFlatButtons
      TabOrder = 0
      object tbsSistema: TTabSheet
        Caption = 'Sistema'
        ImageIndex = 1
        object pnlSistema: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          TabOrder = 0
          object pgcSistema: TPageControl
            Left = 1
            Top = 1
            Width = 774
            Height = 323
            ActivePage = tbsGeral
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tbsGeral: TTabSheet
              Caption = 'Geral'
              ImageIndex = 4
              object pnlGeral: TPanel
                Left = 0
                Top = 0
                Width = 766
                Height = 292
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel4: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 290
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
                    Top = 88
                    Width = 148
                    Height = 13
                    Caption = 'Autorizador de Operações'
                  end
                  object lblPrzVencCFianca: TLabel
                    Left = 14
                    Top = 127
                    Width = 250
                    Height = 13
                    Caption = 'Prazo Aviso Vencimento de Carta de Fiança'
                    WordWrap = True
                  end
                  object Label1: TLabel
                    Left = 14
                    Top = 165
                    Width = 241
                    Height = 13
                    Caption = 'Máscara do Setor de Atividade do Emissor'
                  end
                  object Label2: TLabel
                    Left = 14
                    Top = 204
                    Width = 256
                    Height = 13
                    Caption = 'Máscara de Classificação de Enquadramento'
                  end
                  object Label76: TLabel
                    Left = 14
                    Top = 242
                    Width = 216
                    Height = 13
                    Caption = 'Indíce - EQM (Erro Quadrático Médio)'
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
                    LookupTable = CdsMoeda
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
                    LookupTable = CdsPatroPlanPrevContab
                    LookupField = 'IDPLANPREVCTBPATR'
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dblAutorizaOrdem: TwwDBLookupCombo
                    Left = 14
                    Top = 102
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEUSUARIO'#9'20'#9'Autorizador'#9'F')
                    DataField = 'IDAUTORIZAORDEM'
                    DataSource = ds
                    LookupTable = CdsAutorizadorDeOperacao
                    LookupField = 'IDUSUARIO'
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dbrePrzVencCFianca: TDBRealEdit
                    Left = 14
                    Top = 141
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
                    Top = 179
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
                    Top = 218
                    Width = 289
                    Height = 21
                    DataField = 'MASCCLASSIFINV'
                    DataSource = ds
                    TabOrder = 5
                    OnKeyPress = DbMascClassifKeyPress
                  end
                  object DblIndiceEQM: TwwDBLookupCombo
                    Left = 14
                    Top = 257
                    Width = 289
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'MOESIGLA'#9'10'#9'Sigla da Moeda'#9'F')
                    DataField = 'IDMOTBLOQPENFDO'
                    DataSource = ds
                    LookupTable = CdsMotivoBloqueio
                    LookupField = 'IDMOTIVOBLOQUEIO'
                    TabOrder = 6
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object Panel10: TPanel
                  Left = 383
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label17: TLabel
                    Left = 14
                    Top = 71
                    Width = 34
                    Height = 13
                    Caption = 'CPMF'
                  end
                  object dbckCartGerenc: TDBCheckBox
                    Left = 14
                    Top = 17
                    Width = 189
                    Height = 17
                    Caption = 'Utiliza Carteiras Gerenciais ?'
                    DataField = 'FLGCARTGERENC'
                    DataSource = ds
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object dbchRegCxComp: TDBCheckBox
                    Left = 14
                    Top = 45
                    Width = 168
                    Height = 17
                    Caption = 'Utiliza Regime de Caixa ?'
                    DataField = 'FLGREGIMECXCOMP'
                    DataSource = ds
                    TabOrder = 1
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnExit = dbchRegCxCompExit
                  end
                  object dtRegCxComp: TCMDateTimePicker
                    Left = 190
                    Top = 41
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
                    TabOrder = 2
                  end
                  object dbdDtaMudaCpmf: TCMDateTimePicker
                    Left = 14
                    Top = 86
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
              end
            end
            object tbsImpostos: TTabSheet
              Caption = 'Imposto'
              ImageIndex = 1
              object pnlImpostos: TPanel
                Left = 0
                Top = 0
                Width = 766
                Height = 292
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel17: TPanel
                  Left = 383
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 0
                end
                object Panel18: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label18: TLabel
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
                    LookupTable = CdsMoeda
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
                    TabOrder = 1
                  end
                  object dbckStaRET: TDBCheckBox
                    Left = 14
                    Top = 49
                    Width = 168
                    Height = 17
                    Caption = 'Utilizando RET ?'
                    DataField = 'STARET'
                    DataSource = ds
                    TabOrder = 2
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object ckbProvRV: TDBCheckBox
                    Left = 14
                    Top = 116
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
                    Top = 140
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
              end
            end
            object tbsCpmf: TTabSheet
              Caption = 'CPMF'
              ImageIndex = 2
              object pnlCmpf: TPanel
                Left = 0
                Top = 0
                Width = 766
                Height = 292
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel9: TPanel
                  Left = 383
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 0
                end
                object Panel29: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 1
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
                  object Label51: TLabel
                    Left = 10
                    Top = 94
                    Width = 59
                    Height = 13
                    Caption = 'Dias Úteis'
                  end
                  object Label50: TLabel
                    Left = 11
                    Top = 53
                    Width = 87
                    Height = 13
                    Caption = 'Dia da Semana'
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
                  object dbeDiasUteisCPMF: TwwDBEdit
                    Left = 10
                    Top = 109
                    Width = 119
                    Height = 21
                    DataField = 'DIASUTEISCPMF'
                    DataSource = ds
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbcDiaSemCPMF: TwwDBComboBox
                    Left = 11
                    Top = 68
                    Width = 118
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
                end
              end
            end
            object tbsIntContFin: TTabSheet
              Caption = 'Integração Contábil / Financeira'
              ImageIndex = 4
              object pnlIntContFin: TPanel
                Left = 0
                Top = 0
                Width = 766
                Height = 292
                Align = alClient
                BevelOuter = bvLowered
                Caption = 'pnlIntContFin'
                TabOrder = 0
                object pnlIntContFinGeral: TPanel
                  Left = 1
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object gpbCliente: TGroupBox
                    Left = 6
                    Top = 3
                    Width = 369
                    Height = 139
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
                      Top = 56
                      Width = 44
                      Height = 13
                      Caption = 'Emissor'
                    end
                    object Label32: TLabel
                      Left = 13
                      Top = 96
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
                      LookupTable = CdsTipoCliente
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
                      Top = 71
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'40'#9'DESCRICAO')
                      DataField = 'IDTIPOCLIENTEEMI'
                      DataSource = ds
                      LookupTable = CdsTipoCliente
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
                      Top = 111
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'40'#9'DESCRICAO')
                      DataField = 'IDTIPOCLIENTECUS'
                      DataSource = ds
                      LookupTable = CdsTipoCliente
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
                    Top = 144
                    Width = 369
                    Height = 141
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
                      Top = 57
                      Width = 44
                      Height = 13
                      Caption = 'Emissor'
                    end
                    object Label42: TLabel
                      Left = 13
                      Top = 97
                      Width = 68
                      Height = 13
                      Caption = 'Custodiante'
                    end
                    object dblRamoForCor: TwwDBLookupCombo
                      Left = 13
                      Top = 32
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRAMOFORNECEDOR'#9'30'#9'Ramo Corretora'#9'F')
                      DataField = 'IDRAMOFORCOR'
                      DataSource = ds
                      LookupTable = CdsRamoFornecedor
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
                      Top = 72
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRAMOFORNECEDOR'#9'30'#9'Ramo Emissor'#9'F')
                      DataField = 'IDRAMOFOREMI'
                      DataSource = ds
                      LookupTable = CdsRamoFornecedor
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
                      Top = 112
                      Width = 287
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRAMOFORNECEDOR'#9'30'#9'Ramo Custodiante'#9'F')
                      DataField = 'IDRAMOFORCUS'
                      DataSource = ds
                      LookupTable = CdsRamoFornecedor
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
                object Panel25: TPanel
                  Left = 383
                  Top = 1
                  Width = 382
                  Height = 290
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object pgcContFin: TPageControl
                    Left = 2
                    Top = 2
                    Width = 378
                    Height = 286
                    ActivePage = tbsContFinModulos
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 0
                    object tbsContFinGeral: TTabSheet
                      Caption = 'Geral'
                      object Panel15: TPanel
                        Left = 0
                        Top = 0
                        Width = 370
                        Height = 255
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
                      Caption = 'Bloqueio por Modulos'
                      ImageIndex = 1
                      object Panel31: TPanel
                        Left = 0
                        Top = 0
                        Width = 370
                        Height = 255
                        Align = alClient
                        BevelInner = bvLowered
                        TabOrder = 0
                        object pnlMensagemContabFinan: TPanel
                          Left = 2
                          Top = 2
                          Width = 366
                          Height = 43
                          Align = alClient
                          TabOrder = 0
                          object fcLabel1: TfcLabel
                            Left = 1
                            Top = 1
                            Width = 364
                            Height = 41
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
                          Top = 45
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
                          Top = 71
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
                          Top = 97
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
                          Top = 123
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
                          Top = 149
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
                          Top = 175
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
                          Top = 201
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
                          Top = 227
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
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      object tbsRendaVariavel: TTabSheet
        Caption = 'Renda Variável'
        ImageIndex = 2
        object pnlRendaVariavel: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          TabOrder = 0
          object pgcRendaVariavel: TPageControl
            Left = 1
            Top = 1
            Width = 774
            Height = 323
            ActivePage = tbsRVGeral
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tbsRVGeral: TTabSheet
              Caption = 'Geral'
              object pnlRVGeral: TPanel
                Left = 0
                Top = 0
                Width = 766
                Height = 292
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel2: TPanel
                  Left = 1
                  Top = 1
                  Width = 385
                  Height = 290
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 14
                    Top = 9
                    Width = 113
                    Height = 13
                    Caption = 'Último Fechamento '
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
                    LookupTable = CdsCarteiraRenVar
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
                    LookupTable = CdsBolsaValores
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
                    LookupTable = CdsTipoOperRenVar
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
                object Panel3: TPanel
                  Left = 386
                  Top = 1
                  Width = 379
                  Height = 290
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label4: TLabel
                    Left = 14
                    Top = 90
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
                    LookupTable = CdsUsuario
                    LookupField = 'IDUSUARIO'
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dbrLimiteVlrDiverg: TDBRealEdit
                    Left = 14
                    Top = 106
                    Width = 170
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '1,00')
                    TabOrder = 3
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VLRDIVERG'
                    DataSource = ds
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
                Width = 766
                Height = 292
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel7: TPanel
                  Left = 1
                  Top = 1
                  Width = 255
                  Height = 290
                  Align = alLeft
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label21: TLabel
                    Left = 6
                    Top = 11
                    Width = 64
                    Height = 13
                    Caption = 'Dividendos'
                  end
                  object Label20: TLabel
                    Left = 6
                    Top = 51
                    Width = 90
                    Height = 13
                    Caption = 'Juros s/ Capital'
                  end
                  object Label23: TLabel
                    Left = 6
                    Top = 91
                    Width = 68
                    Height = 13
                    Caption = 'Bonificação'
                  end
                  object Label24: TLabel
                    Left = 6
                    Top = 131
                    Width = 64
                    Height = 13
                    Caption = 'Subscrição'
                  end
                  object Label27: TLabel
                    Left = 6
                    Top = 170
                    Width = 32
                    Height = 13
                    Caption = 'Cisão'
                  end
                  object Label46: TLabel
                    Left = 6
                    Top = 210
                    Width = 126
                    Height = 13
                    Caption = 'Restituição de Capital'
                  end
                  object Label73: TLabel
                    Left = 6
                    Top = 252
                    Width = 147
                    Height = 13
                    Caption = 'Reorganização Societária'
                  end
                  object dblDividendos: TwwDBLookupCombo
                    Left = 6
                    Top = 26
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDIV'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblJurosCapital: TwwDBLookupCombo
                    Left = 6
                    Top = 66
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRJUR'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
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
                    Top = 106
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRBON'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
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
                    Top = 146
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRSUB'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
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
                    Top = 185
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRCIS'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbRestituicaoCapital: TwwDBLookupCombo
                    Left = 6
                    Top = 225
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRRES'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
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
                    Top = 267
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRREE'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 6
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                end
                object Panel8: TPanel
                  Left = 256
                  Top = 1
                  Width = 254
                  Height = 290
                  Align = alClient
                  BevelInner = bvLowered
                  TabOrder = 1
                  object Label28: TLabel
                    Left = 6
                    Top = 11
                    Width = 76
                    Height = 13
                    Caption = 'Incorporação'
                  end
                  object Label25: TLabel
                    Left = 6
                    Top = 51
                    Width = 69
                    Height = 13
                    Caption = 'Grupamento'
                  end
                  object Label26: TLabel
                    Left = 6
                    Top = 91
                    Width = 89
                    Height = 13
                    Caption = 'Desdobramento'
                  end
                  object Label29: TLabel
                    Left = 6
                    Top = 131
                    Width = 47
                    Height = 13
                    Caption = 'Permuta'
                  end
                  object Label43: TLabel
                    Left = 6
                    Top = 170
                    Width = 102
                    Height = 13
                    Caption = 'Alteração do Tipo'
                  end
                  object Label63: TLabel
                    Left = 6
                    Top = 210
                    Width = 213
                    Height = 13
                    Caption = 'Multa de Atraso de Entrega de Ações'
                  end
                  object Label75: TLabel
                    Left = 6
                    Top = 252
                    Width = 239
                    Height = 13
                    Caption = 'Resgate Fundos c/ Anúncio de Proventos'
                  end
                  object dblIncorporacao: TwwDBLookupCombo
                    Left = 6
                    Top = 26
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRINC'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblGrupamento: TwwDBLookupCombo
                    Left = 6
                    Top = 66
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRGRU'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblDesdobramento: TwwDBLookupCombo
                    Left = 6
                    Top = 106
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDES'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblPermuta: TwwDBLookupCombo
                    Left = 6
                    Top = 146
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRPER'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblAlteracaoTipo: TwwDBLookupCombo
                    Left = 6
                    Top = 185
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRALT'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblkOperMultaAtrazo: TwwDBLookupCombo
                    Left = 6
                    Top = 225
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRMUL'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 5
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblResgFdoAnuncioProv: TwwDBLookupCombo
                    Left = 6
                    Top = 267
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRPROV'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 6
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                end
                object Panel26: TPanel
                  Left = 510
                  Top = 1
                  Width = 255
                  Height = 290
                  Align = alRight
                  BevelInner = bvLowered
                  TabOrder = 2
                  object Label78: TLabel
                    Left = 6
                    Top = 11
                    Width = 123
                    Height = 13
                    Caption = 'Direito de Subscrição'
                  end
                  object lblRecFracionado: TLabel
                    Left = 6
                    Top = 51
                    Width = 154
                    Height = 13
                    Caption = 'Recebimentos Fracionados'
                  end
                  object dblDireitoSubscricao: TwwDBLookupCombo
                    Left = 6
                    Top = 26
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERDIRDSU'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownCount = 6
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblkRecFracionado: TwwDBLookupCombo
                    Left = 6
                    Top = 66
                    Width = 243
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'25'#9'Descrição')
                    DataField = 'IDTIPOOPERRFRAC'
                    DataSource = ds
                    LookupTable = CdsTipoOperRenVar
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
      object tbsRendaFixa: TTabSheet
        Caption = 'Renda Fixa'
        object pnlRendaFixa: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object pnlRFixa1: TPanel
            Left = 1
            Top = 1
            Width = 387
            Height = 323
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object lblUltAbertura: TLabel
              Left = 24
              Top = 11
              Width = 88
              Height = 13
              Caption = 'Última Abertura'
            end
            object lblCustodianteRFixa: TLabel
              Left = 24
              Top = 50
              Width = 72
              Height = 13
              Caption = 'Custodiante '
            end
            object lblContraParteRFixa: TLabel
              Left = 24
              Top = 89
              Width = 111
              Height = 13
              Caption = 'Contraparte Padrão'
            end
            object lblItemIncJurRFixa: TLabel
              Left = 24
              Top = 131
              Width = 174
              Height = 13
              Caption = 'Item de Incorporação de Juros'
            end
            object lblItemPagtoJurRFixa: TLabel
              Left = 24
              Top = 170
              Width = 162
              Height = 13
              Caption = 'Item de Pagamento de Juros'
            end
            object lblAmortRFixa: TLabel
              Left = 24
              Top = 210
              Width = 187
              Height = 13
              Caption = 'Item de Amortização de Principal'
            end
            object lblClassePoupanca: TLabel
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
              LookupTable = CdsCustodiante
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
              LookupTable = CdsContraParte
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
              LookupTable = CdsItemRenFix
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
              LookupTable = CdsItemRenFix
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
              LookupTable = CdsItemRenFix
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
              LookupTable = CdsClasseRenFix
              LookupField = 'IDCLASSETIT'
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object pnlRFixa2: TPanel
            Left = 388
            Top = 1
            Width = 387
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object lblClassePoupancaBloq: TLabel
              Left = 22
              Top = 12
              Width = 181
              Height = 13
              Caption = 'Classe de Poupança Bloqueada'
            end
            object lblIndicePoupanca: TLabel
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
              LookupTable = CdsClasseRenFix
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
              LookupTable = CdsMoeda
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
                'NOME'#9'30'#9'Usuário'#9'F')
              DataField = 'IDUSUARIOPROCRF'
              DataSource = ds
              LookupTable = CdsUsuario
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
              LookupTable = CdsCarteiraRF
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
        ImageIndex = 7
        object pnlFundoInvest: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel13: TPanel
            Left = 1
            Top = 1
            Width = 387
            Height = 323
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
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOFUNDOINV'#9'20'#9'Descrição'#9'F')
              DataField = 'IDTIPOFUNDOINVEST'
              LookupTable = CdsTipoFundo
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
            end
            object dblUsuarioProcFundos: TwwDBLookupCombo
              Left = 14
              Top = 160
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Descrição'#9'F')
              DataSource = ds
              LookupTable = CdsUsuario
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
              Width = 287
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
              LookupTable = CdsMotivoBloqFdo
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
            Left = 388
            Top = 1
            Width = 387
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsEmprestimos: TTabSheet
        Caption = 'Empréstimo'
        ImageIndex = 8
        object pnlEmprestimo: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 387
            Height = 323
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
            object dbcFlgEmpAcoes: TDBCheckBox
              Left = 14
              Top = 179
              Width = 211
              Height = 17
              Caption = 'Permite Empréstimo de Ações ?'
              DataField = 'FLGEMPACOES'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object dblkRegraEmpAcoes: TwwDBLookupCombo
              Left = 14
              Top = 148
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra'#9'F')
              DataField = 'IDREGRAEMPACOES'
              DataSource = ds
              LookupTable = CdsRegra
              LookupField = 'IDREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkMotivoBloqueio: TwwDBLookupCombo
              Left = 14
              Top = 108
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Motivo de Bloqueio'#9'F')
              DataField = 'IDMOTBLOQEMPAC'
              DataSource = ds
              LookupTable = CdsMotivoBloqueio
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
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Cateira de Investimento'#9'F')
              DataField = 'IDCARTEMPACOES'
              DataSource = ds
              LookupTable = CdsCarteiraRenVar
              LookupField = 'IDCARTEIRAINVEST'
              Options = [loRowLines, loTitles]
              TabOrder = 3
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
          end
          object Panel6: TPanel
            Left = 388
            Top = 1
            Width = 387
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsOpcoes: TTabSheet
        Caption = 'Opções'
        ImageIndex = 3
        object pnlOpcoes: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel21: TPanel
            Left = 1
            Top = 1
            Width = 387
            Height = 323
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
                LookupTable = CdsCarteiraRenVar
                LookupField = 'IDCARTEIRAINVEST'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 0
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
                LookupTable = CdsTipoOperRenVar
                LookupField = 'IDTIPOOPERACAO'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 1
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
                LookupTable = CdsTipoOperRenVar
                LookupField = 'IDTIPOOPERACAO'
                Options = [loColLines, loRowLines, loTitles]
                DropDownCount = 6
                TabOrder = 2
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
                LookupTable = CdsCarteiraRenVar
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
                LookupTable = CdsMotivoBloqueio
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
            Left = 388
            Top = 1
            Width = 387
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsBMF: TTabSheet
        Caption = 'BM&&F'
        ImageIndex = 6
        object pnlBmf: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 387
            Height = 323
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
              LookupTable = CdsBolsaValores
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
              LookupTable = CdsTipoInvestidor
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
              LookupTable = CdsMercado
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
            Left = 388
            Top = 1
            Width = 387
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
          end
        end
      end
      object tbsRegra: TTabSheet
        Caption = 'Regra'
        ImageIndex = 4
        object pnlRegra: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 325
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel20: TPanel
            Left = 1
            Top = 1
            Width = 387
            Height = 323
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
            object lblTpRegraEmpAcoes: TLabel
              Left = 14
              Top = 257
              Width = 236
              Height = 13
              Caption = 'Tipo de Regra para Empréstimo de Ações'
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
              LookupTable = CdsGrupoRegra
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
              LookupTable = CdsTipoRegra
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
              LookupTable = CdsTipoRegra
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
              LookupTable = CdsTipoRegra
              LookupField = 'IDTIPOREGRA'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
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
              LookupTable = CdsTipoRegra
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
              LookupTable = CdsTipoRegra
              LookupField = 'IDTIPOREGRA'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkTpRegraEmpAcoes: TwwDBLookupCombo
              Left = 14
              Top = 272
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAEMPAC'
              DataSource = ds
              LookupTable = CdsTipoRegra
              LookupField = 'IDTIPOREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object Panel19: TPanel
            Left = 388
            Top = 1
            Width = 387
            Height = 323
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object lblTpRegraOpcAc: TLabel
              Left = 14
              Top = 8
              Width = 215
              Height = 13
              Caption = 'Tipo de Regra para Opções de Ações'
            end
            object lblTpRegraOpcInd: TLabel
              Left = 14
              Top = 50
              Width = 221
              Height = 13
              Caption = 'Tipo de Regra para Opções de Índices'
            end
            object dblkTpRegraOpcAc: TwwDBLookupCombo
              Left = 14
              Top = 23
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAEMPAC'
              DataSource = ds
              LookupTable = CdsTipoRegra
              LookupField = 'IDTIPOREGRA'
              Options = [loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkTpRegraOpcInd: TwwDBLookupCombo
              Left = 14
              Top = 64
              Width = 287
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCREGRA'#9'40'#9'Tipo de Regra'#9'F')
              DataField = 'IDTIPOREGRAOPCIN'
              DataSource = ds
              LookupTable = CdsTipoRegra
              LookupField = 'IDTIPOREGRA'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 786
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
    Top = 405
    Width = 786
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 426
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 550
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 376
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    Left = 256
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = cdsAfterOpen
    Left = 484
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 320
    Top = 7
  end
  object CdsCustodiante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 123
  end
  object CdsContraParte: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 179
  end
  object CdsItemRenFix: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 229
  end
  object CdsClasseRenFix: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 282
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 331
  end
  object CdsUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 28
    Top = 75
  end
  object CdsPatroPlanPrevContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 75
  end
  object CdsAutorizadorDeOperacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 123
  end
  object CdsCarteiraRenVar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 179
  end
  object CdsBolsaValores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 227
  end
  object CdsTipoOperRenVar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 283
  end
  object CdsMotivoBloqueio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 331
  end
  object CdsGrupoRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 28
    Top = 379
  end
  object CdsTipoRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 140
    Top = 379
  end
  object CdsTipoInvestidor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 75
  end
  object CdsMercado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 123
  end
  object CdsTipoFundo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 179
  end
  object CdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 227
  end
  object CdsTipoPeriodicidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 275
  end
  object CdsParamEmissor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 331
  end
  object CdsTipoContrInvest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 244
    Top = 379
  end
  object CdsTipoCliente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 75
  end
  object CdsRamoFornecedor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 123
  end
  object CdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 171
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 227
  end
  object CMSqlParamsAux: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 1'
      'ORDER BY DESCCARTINVEST')
    ClientDataSet = CdsCarteiraRF
    Left = 502
    Top = 314
  end
  object CdsTipoDespInv: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 283
  end
  object CdsMotivoBloqFdo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 331
  end
  object CdsCarteiraRF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 356
    Top = 379
  end
end
