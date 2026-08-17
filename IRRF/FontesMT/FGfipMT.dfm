inherited frmGFIPMT: TfrmGFIPMT
  Left = 217
  Top = 59
  HelpContext = 240016
  Caption = 'GFIP (Meio Magnético)'
  ClientHeight = 378
  ClientWidth = 510
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 16
    Top = 136
    Width = 85
    Height = 13
    Caption = 'PIS/PASEP/CI'
  end
  object Label7: TLabel [1]
    Left = 160
    Top = 136
    Width = 26
    Height = 13
    Caption = 'CBO'
  end
  object Label4: TLabel [2]
    Left = 304
    Top = 136
    Width = 32
    Height = 13
    Caption = 'CNPJ'
  end
  object Label3: TLabel [3]
    Left = 16
    Top = 186
    Width = 110
    Height = 13
    Caption = 'Nome para Contato'
  end
  object Label5: TLabel [4]
    Left = 16
    Top = 234
    Width = 71
    Height = 13
    Caption = 'CNAE Fiscal'
  end
  object Label6: TLabel [5]
    Left = 184
    Top = 234
    Width = 32
    Height = 13
    Caption = 'FPAS'
  end
  object Label8: TLabel [6]
    Left = 352
    Top = 234
    Width = 115
    Height = 13
    Caption = 'Código de Terceiros'
  end
  inherited pnlFundo: TPanel
    Width = 510
    Height = 339
    object Label9: TLabel
      Left = 16
      Top = 186
      Width = 110
      Height = 13
      Caption = 'Nome para Contato'
    end
    object Label10: TLabel
      Left = 16
      Top = 234
      Width = 71
      Height = 13
      Caption = 'CNAE Fiscal'
    end
    object Label11: TLabel
      Left = 184
      Top = 234
      Width = 32
      Height = 13
      Caption = 'FPAS'
    end
    object Label13: TLabel
      Left = 352
      Top = 234
      Width = 115
      Height = 13
      Caption = 'Código de Terceiros'
    end
    object Label14: TLabel
      Left = 16
      Top = 136
      Width = 85
      Height = 13
      Caption = 'PIS/PASEP/CI'
    end
    object Label15: TLabel
      Left = 160
      Top = 136
      Width = 26
      Height = 13
      Caption = 'CBO'
    end
    object Label16: TLabel
      Left = 304
      Top = 136
      Width = 32
      Height = 13
      Caption = 'CNPJ'
    end
  end
  inherited Dock971: TDock97
    Top = 339
    Width = 510
    inherited tb97Fundo: TToolbar97
      Left = 226
      inherited sep1: TToolbarSep97
        Left = 197
      end
      inherited bbtnSair: TBitBtn
        Left = 116
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 199
        HelpContext = 240016
      end
      object rbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 116
        Height = 33
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 2
        OnClick = rbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  object gbxDataProcess: TGroupBox [9]
    Left = 11
    Top = 10
    Width = 219
    Height = 65
    Caption = 'Datas para Processamento'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 67
      Height = 13
      Caption = 'Vencimento'
    end
    object Label2: TLabel
      Left = 19
      Top = 41
      Width = 64
      Height = 13
      Caption = 'Pagamento'
    end
    object dtVencimento: TCMDateTimePicker
      Left = 90
      Top = 15
      Width = 113
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
      ParentShowHint = False
      ShowHint = True
      ShowButton = True
      TabOrder = 0
    end
    object dtPagamento: TCMDateTimePicker
      Left = 90
      Top = 37
      Width = 113
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
      ParentShowHint = False
      ShowHint = False
      ShowButton = True
      TabOrder = 1
    end
  end
  object gbxDiaLimiteGRFC: TGroupBox [10]
    Left = 242
    Top = 28
    Width = 255
    Height = 45
    Caption = 'Dia Limite Próx. Mês Recolhido por GRFC'
    TabOrder = 3
    object spedDiaLimiteGRFC: TSpinEdit
      Left = 15
      Top = 15
      Width = 79
      Height = 22
      MaxLength = 4
      MaxValue = 31
      MinValue = 0
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Value = 0
    end
  end
  object gbxCodRec: TGroupBox [11]
    Left = 11
    Top = 80
    Width = 132
    Height = 45
    Caption = 'Código de Recolhimento'
    TabOrder = 4
    object speCodRec: TSpinEdit
      Left = 26
      Top = 15
      Width = 79
      Height = 22
      MaxLength = 4
      MaxValue = 905
      MinValue = 905
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      Value = 905
    end
  end
  object gbxAnoMesRef: TGroupBox [12]
    Left = 155
    Top = 80
    Width = 255
    Height = 46
    Caption = 'Mês e Ano de Referência'
    TabOrder = 5
    object cmbMes: TComboBox
      Left = 11
      Top = 18
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Março'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object speAno: TSpinEdit
      Left = 165
      Top = 17
      Width = 79
      Height = 22
      MaxLength = 4
      MaxValue = 3000
      MinValue = 1967
      TabOrder = 1
      Value = 2001
    end
  end
  object dblcPis: TwwDBLookupCombo [13]
    Left = 16
    Top = 152
    Width = 129
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOMEDOCUMENTO'#9'30'#9'Nome do Documento'#9'F')
    LookupTable = cdsDoc
    LookupField = 'IDDOCUMENTO'
    Style = csDropDownList
    ParentFont = False
    TabOrder = 6
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object dblcCBO: TwwDBLookupCombo [14]
    Left = 160
    Top = 152
    Width = 129
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOMEDOCUMENTO'#9'30'#9'Nome do Documento'#9'F')
    DataField = 'CODTIPOCUSTAGREG'
    LookupTable = cdsDoc
    LookupField = 'IDDOCUMENTO'
    Style = csDropDownList
    ParentFont = False
    TabOrder = 7
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object dblcCNPJ: TwwDBLookupCombo [15]
    Left = 304
    Top = 152
    Width = 129
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOMEDOCUMENTO'#9'30'#9'Nome do Documento'#9'F')
    DataField = 'CODTIPOCUSTAGREG'
    LookupTable = cdsDoc
    LookupField = 'IDDOCUMENTO'
    Style = csDropDownList
    ParentFont = False
    TabOrder = 8
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object edtContato: TEdit [16]
    Left = 16
    Top = 200
    Width = 473
    Height = 21
    MaxLength = 20
    TabOrder = 9
  end
  object edtCNAE: TEdit [17]
    Left = 16
    Top = 248
    Width = 137
    Height = 21
    MaxLength = 7
    TabOrder = 10
    OnKeyPress = edtCNAEKeyPress
  end
  object rgSimples: TRadioGroup [18]
    Left = 17
    Top = 272
    Width = 473
    Height = 54
    Caption = 'Simples'
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Não Optante'
      'Optante - até valor limite'
      'Optante - acima valor limite'
      'Não Optante - Produtor Rural')
    TabOrder = 11
  end
  object edtFPAS: TEdit [19]
    Left = 184
    Top = 248
    Width = 137
    Height = 21
    MaxLength = 3
    TabOrder = 12
    OnKeyPress = edtFPASKeyPress
  end
  object edtTerceiro: TEdit [20]
    Left = 352
    Top = 248
    Width = 137
    Height = 21
    MaxLength = 4
    TabOrder = 13
    OnKeyPress = edtTerceiroKeyPress
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 371
  end
  object cdsDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 212
    Top = 143
  end
  object svdlgDialogo: TOpenDialog
    DefaultExt = '*.RE'
    FileName = 'C:\SEFIP\SEFIP.RE'
    Filter = 'SEFIP.RE|SEFIP.RE|Todos|*.*'
    InitialDir = 'C:\SEFIP'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração do GFIP Magnético'
    Left = 314
    Top = 122
  end
  object cdsGPS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 148
    Top = 199
  end
  object cdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 148
    Top = 199
  end
  object cdsTrabalhador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 244
    Top = 199
  end
end
