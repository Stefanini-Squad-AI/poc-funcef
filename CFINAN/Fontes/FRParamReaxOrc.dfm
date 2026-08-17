inherited frmRParamReaxOrc: TfrmRParamReaxOrc
  Left = 263
  Top = 47
  Caption = 'Orçado x Realizado '
  ClientHeight = 423
  ClientWidth = 395
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 395
    Height = 384
    object Label4: TLabel
      Left = 16
      Top = 242
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label5: TLabel
      Left = 16
      Top = 287
      Width = 154
      Height = 13
      Caption = 'Centro de Reponsabilidade'
    end
    object Label6: TLabel
      Left = 16
      Top = 332
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object GroupBox1: TGroupBox
      Left = 13
      Top = 16
      Width = 369
      Height = 73
      Caption = 'Período'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 244
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label3: TLabel
        Left = 178
        Top = 40
        Width = 8
        Height = 13
        Caption = 'à'
      end
      object deDataInicial: TCMDateTimePicker
        Left = 8
        Top = 32
        Width = 121
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
      object deDataFinal: TCMDateTimePicker
        Left = 240
        Top = 32
        Width = 121
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
      end
    end
    object rgrpTipo: TRadioGroup
      Left = 13
      Top = 95
      Width = 201
      Height = 86
      Caption = ' Tipos de Conta '
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'Recebimentos e Pagamentos'
        'Recebimentos'
        'Pagamentos')
      TabOrder = 1
    end
    object rgPrazoOrc: TRadioGroup
      Left = 221
      Top = 95
      Width = 161
      Height = 86
      Caption = ' Prazo do Orçamento '
      ItemIndex = 0
      Items.Strings = (
        '&Curto'
        '&Médio'
        '&Longo')
      TabOrder = 2
    end
    object dblkcmbAtividade: TwwDBLookupCombo
      Left = 16
      Top = 258
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Nome'
        'UNECODIGO'#9'10'#9'Código')
      LookupTable = qryAtiv
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkcmbCentro: TwwDBLookupCombo
      Left = 16
      Top = 303
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTRORESPON'#9'10'#9'Código')
      LookupTable = qryCentro
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object gbGrauMaximo: TGroupBox
      Left = 221
      Top = 184
      Width = 160
      Height = 65
      Caption = ' Grau '
      TabOrder = 5
      object lblCAR: TLabel
        Left = 23
        Top = 20
        Width = 26
        Height = 13
        Caption = 'CAR'
      end
      object lblCAP: TLabel
        Left = 84
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CAP'
      end
      object seGrauMaxCAP: TwwDBSpinEdit
        Left = 83
        Top = 36
        Width = 40
        Height = 21
        Increment = 1
        MaxValue = 10
        MinValue = 1
        Value = 1
        TabOrder = 1
        UnboundDataType = wwDefault
        OnChange = seGrauMaxCAPChange
      end
      object seGrauMaxCAR: TwwDBSpinEdit
        Left = 23
        Top = 36
        Width = 40
        Height = 21
        Increment = 1
        MaxValue = 10
        MinValue = 1
        Value = 1
        TabOrder = 0
        UnboundDataType = wwDefault
        OnChange = seGrauMaxCARChange
      end
    end
    object cbContasZero: TCheckBox
      Left = 13
      Top = 210
      Width = 205
      Height = 17
      Caption = 'Imprime contas com Saldo Zero'
      TabOrder = 6
    end
    object cbImprimeCentavos: TCheckBox
      Left = 13
      Top = 186
      Width = 205
      Height = 17
      Caption = 'Imprime contas com Centavos'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object dblcCentroCusto: TwwDBLookupCombo
      Left = 16
      Top = 348
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTROCUSTO'#9'10'#9'Código')
      LookupTable = qryCC
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 395
    inherited tb97Fundo: TToolbar97
      Left = 225
      DockPos = 225
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 58
      DockPos = 58
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 691
    Top = 27
  end
  object qryAtiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  UNIDNEGOC, NOME, UNECODIGO'
      'FROM UNIDNEGOCIO'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (UNETIPO = '#39'A'#39')      '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 256
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCentro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODCENTRORESPON,NOME'
      'FROM CENTRESPON'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY CODCENTRORESPON')
    ValidateWithMask = True
    Left = 312
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPrepOrcRea: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 213
    Top = 40
  end
  object qryCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODCENTROCUSTO,'
      '  NOME'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :IDPESSOA)'
      'ORDER BY CODCENTROCUSTO')
    ValidateWithMask = True
    Left = 256
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
