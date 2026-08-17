inherited RelListaContratos: TRelListaContratos
  Left = 123
  Top = 39
  HelpContext = 1350046
  Caption = 'Listagem de Contratos'
  ClientHeight = 478
  ClientWidth = 554
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 554
    Height = 439
    inline molProposta1: TmolProposta
      Left = 20
      Top = 7
      inherited Label1: TLabel
        Width = 85
        Caption = 'Nº do Contrato'
      end
      inherited Label2: TLabel
        Width = 103
        Caption = 'Nome do Contrato'
      end
      inherited btnBuscaProp: TBitBtn
        Top = 17
        OnClick = molProposta1btnBuscaPropClick
      end
      inherited btnLimpaProp: TBitBtn
        Top = 17
      end
    end
    inline molComprador1: TmolComprador
      Left = 19
      Top = 47
      Width = 526
      TabOrder = 1
      inherited edtRazaoSocial: TEdit
        Width = 453
      end
      inherited btnBuscaForn: TBitBtn
        Left = 461
        Top = 17
      end
      inherited btnLimpaForn: TBitBtn
        Left = 485
        Top = 17
      end
    end
    inline molResponsavel1: TmolResponsavel
      Left = 18
      Top = 88
      Width = 519
      TabOrder = 2
      inherited edtResponsavel: TEdit
        Width = 452
      end
      inherited btnBuscaResponsavel: TBitBtn
        Left = 461
        Top = 17
      end
      inherited btnLimpaResponsavel: TBitBtn
        Left = 485
        Top = 17
      end
      inherited btnAbrePessoa: TBitBtn
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 349
      Width = 249
      Height = 64
      Caption = 'Período da Proposta'
      TabOrder = 7
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 21
        Height = 13
        Caption = 'De:'
      end
      object Label2: TLabel
        Left = 128
        Top = 18
        Width = 12
        Height = 13
        Caption = 'a:'
      end
      object cmdtFim: TCMDateTimePicker
        Left = 128
        Top = 34
        Width = 109
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
      object cmdtIni: TCMDateTimePicker
        Left = 8
        Top = 34
        Width = 109
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
    end
    object rgOrdem: TRadioGroup
      Left = 279
      Top = 302
      Width = 249
      Height = 112
      Caption = 'Ordenado por:'
      ItemIndex = 0
      Items.Strings = (
        'Nr. do Contrato'
        'Descrição do Contrato'
        'Imóvel Mestre, Nr. do Contrato'
        'Imóvel Mestre, Descrição do Contrato'
        'Comprador, Imóvel Mestre, Contrato')
      TabOrder = 8
    end
    inline molImovel2: TmolImovel
      Left = 19
      Top = 213
      Width = 510
      TabOrder = 5
      inherited Label5: TLabel
        Left = 10
        Width = 42
        Caption = 'Imóvel '
      end
      inherited edtImovel: TEdit
        Width = 449
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 458
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 482
      end
    end
    inline molImovelMestre1: TmolImovelMestre
      Left = 19
      Top = 170
      Width = 526
      TabOrder = 4
      inherited edtImovel: TEdit
        Width = 449
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 459
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 483
      end
    end
    object GroupBox2: TGroupBox
      Left = 24
      Top = 259
      Width = 505
      Height = 42
      Caption = 'Situação'
      TabOrder = 6
      object cbProposta: TCheckBox
        Left = 16
        Top = 18
        Width = 81
        Height = 17
        Caption = 'Proposta'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbContrato: TCheckBox
        Left = 128
        Top = 18
        Width = 81
        Height = 17
        Caption = 'Contrato'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbAcordo: TCheckBox
        Left = 248
        Top = 17
        Width = 81
        Height = 17
        Caption = 'Acordo'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    inline molAdministradora1: TmolAdministradora
      Left = 18
      Top = 129
      Width = 519
      TabOrder = 3
      inherited edtAdministradora: TEdit
        Width = 452
      end
      inherited btnBuscaAdministradora: TBitBtn
        Left = 461
      end
      inherited btnLimpaAdministradora: TBitBtn
        Left = 485
      end
      inherited btnAbrePessoa: TBitBtn
        Visible = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 302
      Width = 249
      Height = 47
      Caption = 'Status do Contrato'
      TabOrder = 9
      object dbcbStatus: TwwDBComboBox
        Left = 13
        Top = 17
        Width = 220
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DropDownCount = 6
        DropDownWidth = 201
        ItemHeight = 0
        Items.Strings = (
          'Todos'#9'T'
          'Vigentes'#9'V'
          'Encerrados'#9'E'
          'Rescindidos'#9'R'
          'Suspensos'#9'S')
        ItemIndex = 0
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock971: TDock97
    Top = 439
    Width = 554
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 435
  end
end
