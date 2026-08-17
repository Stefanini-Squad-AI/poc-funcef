inherited frmBeneficiario: TfrmBeneficiario
  Left = 275
  Top = 182
  Caption = 'Beneficiário'
  ClientHeight = 457
  ClientWidth = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 448
    Height = 371
    object Label8: TLabel
      Left = 24
      Top = 102
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label7: TLabel
      Left = 24
      Top = 57
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 24
      Top = 149
      Width = 116
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label3: TLabel
      Left = 155
      Top = 149
      Width = 33
      Height = 13
      Caption = 'Idade'
    end
    object Label1: TLabel
      Left = 211
      Top = 102
      Width = 114
      Height = 13
      Caption = 'Grau de Parentesco'
    end
    object Label4: TLabel
      Left = 211
      Top = 149
      Width = 103
      Height = 13
      Caption = 'Grau de Instrução'
    end
    object Label5: TLabel
      Left = 259
      Top = 197
      Width = 49
      Height = 13
      Caption = 'Duração'
    end
    object Label10: TLabel
      Left = 267
      Top = 246
      Width = 105
      Height = 13
      Caption = 'Situacao no Plano'
    end
    object Label11: TLabel
      Left = 24
      Top = 246
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Label9: TLabel
      Left = 25
      Top = 288
      Width = 56
      Height = 13
      Caption = 'Benefício'
    end
    object Label6: TLabel
      Left = 27
      Top = 13
      Width = 108
      Height = 13
      Caption = 'Beneficiário Titular'
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 117
      Width = 157
      Height = 21
      AutoSelect = False
      DataField = 'NR_MATRICULA'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 72
      Width = 398
      Height = 21
      AutoSelect = False
      DataField = 'NO_BENEFICIARIO'
      DataSource = ds
      TabOrder = 1
    end
    object DBRdGrpSexo: TDBRadioGroup
      Left = 24
      Top = 200
      Width = 216
      Height = 32
      Caption = 'Sexo'
      Columns = 2
      DataField = 'IR_SEXO'
      DataSource = ds
      Items.Strings = (
        'Feminino'
        'Masculino')
      TabOrder = 2
      Values.Strings = (
        'F'
        'M')
    end
    object DateEdit: TCMDateTimePicker
      Left = 24
      Top = 164
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DT_NASC'
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
    object DBEdit3: TDBEdit
      Left = 155
      Top = 164
      Width = 39
      Height = 21
      AutoSelect = False
      DataField = 'NR_IDADE_BENEFICIARIO'
      DataSource = ds
      TabOrder = 4
    end
    object LkcTbParentesco: TwwDBLookupCombo
      Left = 211
      Top = 117
      Width = 213
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRAU_DEPENDENCIA'#9'30'#9'Grau de Dependência')
      DataField = 'CD_GRAU_DEPENDENCIA'
      DataSource = ds
      LookupTable = qryParentesco
      LookupField = 'CD_GRAU_DEPENDENCIA'
      Options = [loColLines, loRowLines]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbInstrucao: TwwDBLookupCombo
      Left = 211
      Top = 164
      Width = 213
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRAU_INSTRUCAO'#9'30'#9'Grau de Instrução')
      DataField = 'CD_GRAU_INSTRUCAO'
      DataSource = ds
      LookupTable = qryInstrucao
      LookupField = 'CD_GRAU_INSTRUCAO'
      Options = [loColLines, loRowLines]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object wwDBLookupComboDuracao: TwwDBLookupCombo
      Left = 259
      Top = 212
      Width = 165
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_DURACAO'#9'60'#9'Duração')
      DataField = 'CD_DURACAO'
      DataSource = ds
      LookupTable = wwQryDuracao
      LookupField = 'CD_DURACAO'
      Options = [loColLines, loRowLines]
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBLkpCmbSituacaoPlano: TwwDBLookupCombo
      Left = 267
      Top = 259
      Width = 157
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_SITUACAO_PLANO'#9'50'#9'Situação'#9'F')
      DataField = 'CD_DURACAO'
      DataSource = ds
      LookupTable = QrySituacaoPlano
      LookupField = 'CD_SITUACAO_PLANO'
      Options = [loColLines, loRowLines]
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBLkpCmbPlano: TwwDBLookupCombo
      Left = 24
      Top = 259
      Width = 235
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_PLANO'#9'60'#9'Nome'#9'F')
      DataField = 'CD_PLANO'
      DataSource = ds
      LookupTable = QryPlano
      LookupField = 'CD_PLANO'
      Options = [loColLines, loRowLines]
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbTipoBeneficio: TwwDBLookupCombo
      Left = 24
      Top = 303
      Width = 400
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TIPO_BENEF'#9'60'#9#9'T')
      DataField = 'CD_TIPO_BENEF'
      DataSource = ds
      LookupTable = qryTipoBeneficio
      LookupField = 'CD_TIPO_BENEF'
      Options = [loColLines, loRowLines]
      TabOrder = 10
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object Dock973: TDock97
      Left = 1
      Top = 337
      Width = 446
      Height = 33
      AllowDrag = False
      Background.Data = {
        760F0000424D760F0000000000007600000028000000800000003C0000000100
        040000000000000F000000000000000000001000000000000000000000008080
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777777171717777777777777177771777777777777777077F7FF7FFFF7
        77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
        777777777771717717777777777777777717777777777777777777777FFFFF7F
        7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
        77777777777777171777777777777777717777777777777777777777777FF7FF
        7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
        7777777777771771777777777777777771777777777777777777777777777FFF
        FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
        777777777777771777777777777777777777777777777777777777777777777F
        F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
        7777777777777777777777777777777777777777777777777777777777777771
        77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
        7777777777777177777777777777777777777777777777777777777777777777
        777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
        7777777777777777771777777777777777777777777777777777777777777777
        7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
        7777777777777717771777777777777777777777777777777777777777777777
        77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
        7777777777777771777777777777777777777777777777777777777777777777
        777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
        7777777777777777777777777777777777777777777777777777777777777777
        777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
        7777777777777777177777777777777777777777777777777777777777777777
        7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
        7777777777777777717777777777777777777777777777777777777777777777
        7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
        7777777777777777777771777777777777777777777777777777777777777777
        7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
        F7F7777777777777771777777777177777777777777777777777777777777777
        77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
        777F7F7777777777777177177771717777777777777777777777777777777777
        77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
        77777F7F77777777777717771777777777777777777777777777777777777777
        777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
        1777777777777777777771717717777177777777777777777777777777777777
        777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
        7777777777771777777777177771777777777777777777777777777777777777
        77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
        7777777777777777777771777777777777777777777777777777777777777777
        777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
        7777777777171777777717777777777777777777777777777777777777777777
        77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
        7777777777777177777771777777777777777777777777777777777777777777
        777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
        7777777777777777777771177777777777777777777777777777777777777777
        7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
        7777777777777777777771717777777777777777777777777777777777777777
        777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
        7777777777777777777777171777777777777777777777777777777777777777
        71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
        7777777777777777777777177777777777777777777777777777777777777717
        77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
        77777777777777777777777777777777777F7777777777777777777777777171
        7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
        771777777777777777777777777777777177F777777777777777777777777717
        171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
        7777777777777777777777777777777777777F77777777777777777777777777
        77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
        7177777177777777777777777777777777777FF7F77771777777777777777777
        1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
        7777777717777777777777777777777777777777777777777777777777777777
        717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
        7177777777777777777777777777777777771777777777777777777777777777
        77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
        777777F777777777777777777777777777777777717177717777777777777777
        77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
        171777F7F7777777777777177777777777777777777777777777777777777777
        777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
        7777777F77777777777777777777777777777777777777777777777777777777
        77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
        7717777F77777777777777717177777777777777777777777777777777777777
        7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
        777777777F777777777777777717777777777777777777777777777777777777
        777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
        7777777777777777777777771777777777777777777777777777777777777777
        77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
        7777777777777777777777777717177777777771777777777777777777777777
        7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
        7777777777777177777777777777777777777717177777777777777777777777
        77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
        7777777777717777777777777717177777777777777777777777777777777777
        777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
        777777777717171717777777777777777777777771777777777F777777777777
        777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
        77777777171777777777777777777777777777777777777777F7F77777777777
        77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
        7777777777171777777777777777777777777777777777777777777777777777
        777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
        7777777717177777777777777777777777777777777777777777777777777777
        77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
        7777777777171777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
        77777777777777777F7F77777717777777777777777777777777777771777777
        7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
        77777777777777777F7F7F777777777777777777777777777777771777777777
        77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
        777777777777777777FFF77F7777717777777777777777777777777777177777
        77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
        77F7777777777777777777F77777777777777777777777777777777777777777
        77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
        F77777777777777777777777F7F7777777777777777777777777777777777777
        777777777717777777777777777777777777717777777777777F7F7F7F77F77F
        77F77777777F77777717777777F7777777777777777777777777777777777777
        77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
        7F77F77777777F77777717777777777777777777777777777777777777777777
        7777777777771777777777777777777777777777777777777F77F7F7F777F777
        F77F777777777777771771777777771777777777777777777777777777777777
        777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
        F7F7777777777777777717171777777777777777777777777777777777777777
        77777777777771777777777777777177777777777771777777777777F777F777
        7777777777777777777171717177771777777777777777777777777777777777
        77777777777777777777777777777777777777777777777777777F7F7F7F7777
        F77F77F777777777777771771717177777777777777777777777777777777777
        7777777777777777777777777777777777777777777177777777}
      BoundLines = [blTop, blBottom]
      FixAlign = True
      LimitToOneRow = True
      Position = dpBottom
      object Toolbar974: TToolbar97
        Left = 0
        Top = 0
        Caption = 'TB97oKCancelar'
        DockPos = 0
        TabOrder = 0
        object btbtnValores: TBitBtn
          Left = 0
          Top = 0
          Width = 88
          Height = 27
          Caption = '&Valores >>'
          Enabled = False
          TabOrder = 0
          OnClick = btbtnValoresClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          NumGlyphs = 2
        end
      end
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 27
      Width = 383
      Height = 21
      AutoSelect = False
      DataField = 'NO_BENEFICIARIO'
      DataSource = dsBenef
      TabOrder = 12
    end
    object LkcTbBeneficiario: TwwDBLookupCombo
      Left = 24
      Top = 27
      Width = 383
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_BENEFICIARIO'#9'60'#9'Nome'#9'F')
      DataField = 'CD_BENEF_TITULAR'
      DataSource = ds
      LookupTable = qryBeneficiario
      LookupField = 'CD_BENEF_TITULAR'
      Options = [loColLines, loRowLines]
      TabOrder = 13
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 448
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 448
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 267
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 98
    end
    inherited dbnav: TDBNavigator
      Left = 24
      Top = 5
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
    Top = 76
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 275
    Top = 109
  end
  inherited ImlPadrao: TImageList
    Left = 247
    Top = 76
  end
  inherited srchdlgProcura: TwwSearchDialog
    Selected.Strings = (
      'NR_MATRICULA'#9'15'#9'Matrícula'#9'F')
    ShadowSearchTable = qryPrincipal
    CharCase = ecUpperCase
    Left = 334
    Top = 76
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 390
    Top = 76
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 303
    Top = 76
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    AfterDelete = qryPrincipalAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_BENEFICIARIO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND  CD_PARTIC = :CD_PARTIC'
      '  AND CD_TIPO_BENEF is not null'
      'ORDER BY CD_BENEF_TITULAR, NR_MATRICULA, NO_BENEFICIARIO')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 247
    Top = 109
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
    object qryPrincipalNR_MATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'NR_MATRICULA'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NR_MATRICULA'
      Size = 15
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_VERSAO'
      Visible = False
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PARTIC'
      Visible = False
    end
    object qryPrincipalCD_BENEF_TITULAR: TFloatField
      FieldName = 'CD_BENEF_TITULAR'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEF_TITULAR'
      Visible = False
    end
    object qryPrincipalCD_BENEFICIARIO: TFloatField
      FieldName = 'CD_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEFICIARIO'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PLANO'
      Visible = False
    end
    object qryPrincipalCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_TIPO_BENEF'
      Visible = False
    end
    object qryPrincipalCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_GRAU_DEPENDENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryPrincipalCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_DURACAO'
      Visible = False
    end
    object qryPrincipalCD_SITUACAO_PLANO: TFloatField
      FieldName = 'CD_SITUACAO_PLANO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_SITUACAO_PLANO'
      Visible = False
    end
    object qryPrincipalCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_GRAU_INSTRUCAO'
      Visible = False
    end
    object qryPrincipalNO_BENEFICIARIO: TStringField
      FieldName = 'NO_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NO_BENEFICIARIO'
      Visible = False
      Size = 60
    end
    object qryPrincipalDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.DT_NASC'
      Visible = False
    end
    object qryPrincipalIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.IR_SEXO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPrincipalNR_IDADE_BENEFICIARIO: TFloatField
      FieldName = 'NR_IDADE_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NR_IDADE_BENEFICIARIO'
      Visible = False
    end
    object qryPrincipalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryPrincipalTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BENEFICIARIO'
      'set'
      '  CD_VERSAO = :CD_VERSAO,'
      '  CD_PARTIC = :CD_PARTIC,'
      '  CD_BENEF_TITULAR = :CD_BENEF_TITULAR,'
      '  CD_BENEFICIARIO = :CD_BENEFICIARIO,'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO,'
      '  CD_TIPO_BENEF = :CD_TIPO_BENEF,'
      '  CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA,'
      '  CD_DURACAO = :CD_DURACAO,'
      '  CD_SITUACAO_PLANO = :CD_SITUACAO_PLANO,'
      '  CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO,'
      '  NO_BENEFICIARIO = :NO_BENEFICIARIO,'
      '  NR_MATRICULA = :NR_MATRICULA,'
      '  DT_NASC = :DT_NASC,'
      '  IR_SEXO = :IR_SEXO,'
      '  NR_IDADE_BENEFICIARIO = :NR_IDADE_BENEFICIARIO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_BENEF_TITULAR = :OLD_CD_BENEF_TITULAR and'
      '  CD_BENEFICIARIO = :OLD_CD_BENEFICIARIO')
    InsertSQL.Strings = (
      'insert into FI_BENEFICIARIO'
      
        '  (CD_VERSAO, CD_PARTIC, CD_BENEF_TITULAR, CD_BENEFICIARIO, CD_P' +
        'ESSOA_PATROC, '
      
        '   CD_PESSOA_ENTID, CD_PLANO, CD_TIPO_BENEF, CD_GRAU_DEPENDENCIA' +
        ', CD_DURACAO, '
      
        '   CD_SITUACAO_PLANO, CD_GRAU_INSTRUCAO, NO_BENEFICIARIO, NR_MAT' +
        'RICULA, '
      
        '   DT_NASC, IR_SEXO, NR_IDADE_BENEFICIARIO, TRGDTINCLUSAO, TRGUS' +
        'ERINCLUSAO)'
      'values'
      
        '  (:CD_VERSAO, :CD_PARTIC, :CD_BENEF_TITULAR, :CD_BENEFICIARIO, ' +
        ':CD_PESSOA_PATROC, '
      
        '   :CD_PESSOA_ENTID, :CD_PLANO, :CD_TIPO_BENEF, :CD_GRAU_DEPENDE' +
        'NCIA, :CD_DURACAO, '
      
        '   :CD_SITUACAO_PLANO, :CD_GRAU_INSTRUCAO, :NO_BENEFICIARIO, :NR' +
        '_MATRICULA, '
      
        '   :DT_NASC, :IR_SEXO, :NR_IDADE_BENEFICIARIO, :TRGDTINCLUSAO, :' +
        'TRGUSERINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from FI_BENEFICIARIO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_BENEF_TITULAR = :OLD_CD_BENEF_TITULAR and'
      '  CD_BENEFICIARIO = :OLD_CD_BENEFICIARIO')
    Left = 303
    Top = 109
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(CD_BENEFICIARIO) AS MAX_CD'
      'FROM FI_BENEFICIARIO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 334
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
    object qryAuxMAX_CD: TFloatField
      FieldName = 'MAX_CD'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEFICIARIO'
    end
  end
  object qryParentesco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRAU_DEPENDENCIA'
      'order by DS_GRAU_DEPENDENCIA')
    ValidateWithMask = True
    Left = 247
    Top = 137
    object qryParentescoDS_GRAU_DEPENDENCIA: TStringField
      DisplayLabel = 'Grau de Dependência'
      DisplayWidth = 30
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      Size = 30
    end
    object qryParentescoCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      Visible = False
      Size = 3
    end
  end
  object qryParent: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_GRAU_DEPENDENCIA'
      'where CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA'
      'order by DS_GRAU_DEPENDENCIA')
    ValidateWithMask = True
    Left = 275
    Top = 137
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptInput
      end>
    object qryParentCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qryParentDS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      Size = 30
    end
  end
  object dsParent: TwwDataSource
    AutoEdit = False
    DataSet = qryParent
    Left = 303
    Top = 137
  end
  object qryInstrucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 247
    Top = 165
    object qryInstrucaoCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
    end
    object qryInstrucaoDS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      FixedChar = True
      Size = 30
    end
  end
  object qryInstruc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_GRAU_INSTRUCAO'
      'where CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 275
    Top = 165
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptUnknown
      end>
    object qryInstrucCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
    end
    object qryInstrucDS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      Size = 30
    end
  end
  object dsInstruc: TwwDataSource
    AutoEdit = False
    DataSet = qryInstruc
    Left = 303
    Top = 165
  end
  object wwQryDuracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_DURACAO '
      'order by DS_DURACAO')
    ValidateWithMask = True
    Left = 362
    Top = 137
    object wwQryDuracaoCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'BASEDADOS.FI_DURACAO.CD_DURACAO'
    end
    object wwQryDuracaoDS_DURACAO: TStringField
      FieldName = 'DS_DURACAO'
      Origin = 'BASEDADOS.FI_DURACAO.DS_DURACAO'
      Size = 60
    end
  end
  object wwDsDuracao: TwwDataSource
    AutoEdit = False
    DataSet = wwQryDuracao
    Left = 390
    Top = 137
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_BENEFICIARIO.NR_MATRICULA'
      'FI_BENEFICIARIO.NO_BENEFICIARIO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_BENEFICIARIO')
    CamposChave.Strings = (
      'FI_BENEFICIARIO.CD_VERSAO'
      'FI_BENEFICIARIO.CD_PARTIC'
      'FI_BENEFICIARIO.CD_BENEFICIARIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 362
    Top = 76
  end
  object qryTipoBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_TIPO_BENEFICIO'
      'order by DS_TIPO_BENEF')
    ValidateWithMask = True
    Left = 334
    Top = 165
    object qryTipoBeneficioDS_TIPO_BENEF: TStringField
      DisplayWidth = 60
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'BASEDADOS.FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
      FixedChar = True
      Size = 60
    end
    object qryTipoBeneficioCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'BASEDADOS.FI_TIPO_BENEFICIO.CD_TIPO_BENEF'
      Visible = False
    end
    object qryTipoBeneficioSG_TIPO_BENEF: TStringField
      FieldName = 'SG_TIPO_BENEF'
      Origin = 'BASEDADOS.FI_TIPO_BENEFICIO.SG_TIPO_BENEF'
      Visible = False
      FixedChar = True
      Size = 5
    end
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_BENEFICIARIO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      'ORDER BY NO_BENEFICIARIO')
    ValidateWithMask = True
    Left = 334
    Top = 109
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
    object qryBeneficiarioNO_BENEFICIARIO: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NO_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NO_BENEFICIARIO'
      Size = 60
    end
    object qryBeneficiarioCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_VERSAO'
      Visible = False
    end
    object qryBeneficiarioCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PARTIC'
      Visible = False
    end
    object qryBeneficiarioCD_BENEF_TITULAR: TFloatField
      FieldName = 'CD_BENEF_TITULAR'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEF_TITULAR'
      Visible = False
    end
    object qryBeneficiarioCD_BENEFICIARIO: TFloatField
      FieldName = 'CD_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEFICIARIO'
      Visible = False
    end
    object qryBeneficiarioCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryBeneficiarioCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryBeneficiarioCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PLANO'
      Visible = False
    end
    object qryBeneficiarioCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_TIPO_BENEF'
      Visible = False
    end
    object qryBeneficiarioCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_GRAU_DEPENDENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryBeneficiarioCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_DURACAO'
      Visible = False
    end
    object qryBeneficiarioCD_SITUACAO_PLANO: TFloatField
      FieldName = 'CD_SITUACAO_PLANO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_SITUACAO_PLANO'
      Visible = False
    end
    object qryBeneficiarioCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_GRAU_INSTRUCAO'
      Visible = False
    end
    object qryBeneficiarioNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NR_MATRICULA'
      Visible = False
      Size = 15
    end
    object qryBeneficiarioDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.DT_NASC'
      Visible = False
    end
    object qryBeneficiarioIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.IR_SEXO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBeneficiarioNR_IDADE_BENEFICIARIO: TFloatField
      FieldName = 'NR_IDADE_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NR_IDADE_BENEFICIARIO'
      Visible = False
    end
    object qryBeneficiarioTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryBeneficiarioTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM FI_BENEFICIARIO'
      'WHERE CD_VERSAO = :CD_VERSAO'
      '  AND CD_PARTIC = :CD_PARTIC'
      '  AND CD_BENEFICIARIO = :CD_BENEF_TITULAR'
      'ORDER BY NO_BENEFICIARIO')
    ValidateWithMask = True
    Left = 362
    Top = 109
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_BENEF_TITULAR'
        ParamType = ptUnknown
      end>
    object qryBenefCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_VERSAO'
    end
    object qryBenefCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PARTIC'
    end
    object qryBenefCD_BENEF_TITULAR: TFloatField
      FieldName = 'CD_BENEF_TITULAR'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEF_TITULAR'
    end
    object qryBenefCD_BENEFICIARIO: TFloatField
      FieldName = 'CD_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_BENEFICIARIO'
    end
    object qryBenefCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PESSOA_PATROC'
    end
    object qryBenefCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PESSOA_ENTID'
    end
    object qryBenefCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_PLANO'
    end
    object qryBenefCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_TIPO_BENEF'
    end
    object qryBenefCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_GRAU_DEPENDENCIA'
      FixedChar = True
      Size = 3
    end
    object qryBenefCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_DURACAO'
    end
    object qryBenefCD_SITUACAO_PLANO: TFloatField
      FieldName = 'CD_SITUACAO_PLANO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_SITUACAO_PLANO'
    end
    object qryBenefCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.CD_GRAU_INSTRUCAO'
    end
    object qryBenefNO_BENEFICIARIO: TStringField
      FieldName = 'NO_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NO_BENEFICIARIO'
      Size = 60
    end
    object qryBenefNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NR_MATRICULA'
      Size = 15
    end
    object qryBenefDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.DT_NASC'
    end
    object qryBenefIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.IR_SEXO'
      FixedChar = True
      Size = 1
    end
    object qryBenefNR_IDADE_BENEFICIARIO: TFloatField
      FieldName = 'NR_IDADE_BENEFICIARIO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.NR_IDADE_BENEFICIARIO'
    end
    object qryBenefTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.TRGDTINCLUSAO'
    end
    object qryBenefTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_BENEFICIARIO.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object dsBenef: TwwDataSource
    AutoEdit = False
    DataSet = qryBenef
    Left = 390
    Top = 109
  end
  object QryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_PESSOA_ENTID, CD_PESSOA_PATROC, CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'ORDER BY NO_PLANO')
    ValidateWithMask = True
    Left = 362
    Top = 165
  end
  object QrySituacaoPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_SITUACAO_PLANO, DS_SITUACAO_PLANO'
      'FROM FI_SITUACAO_PLANO'
      'ORDER BY DS_SITUACAO_PLANO ')
    ValidateWithMask = True
    Left = 390
    Top = 165
  end
end
