inherited RelInadSin: TRelInadSin
  Left = 149
  Top = 78
  HelpContext = 1350047
  Caption = 'Inadimplência de Alienação - Sintético'
  ClientHeight = 344
  ClientWidth = 578
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 578
    Height = 305
    inline molProposta1: TmolProposta
      Left = 20
      Top = 16
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
      Top = 56
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
      Top = 97
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
      Left = 168
      Top = 189
      Width = 137
      Height = 59
      Caption = 'Data Final'
      TabOrder = 5
      object cmdtFim: TCMDateTimePicker
        Left = 13
        Top = 24
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
      Left = 309
      Top = 189
      Width = 156
      Height = 59
      Caption = 'Ordenado por:'
      Items.Strings = (
        'Comprador, Contrato'
        'Contrato, Comprador')
      TabOrder = 6
    end
    object GroupBox2: TGroupBox
      Left = 24
      Top = 189
      Width = 137
      Height = 59
      Caption = 'UF do Imóvel'
      TabOrder = 4
      object dblcbEstado: TwwDBLookupCombo
        Left = 14
        Top = 24
        Width = 109
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODESTADO'#9'3'#9'Estado')
        DataField = 'CODESTADO'
        LookupTable = qryLookEstado
        LookupField = 'CODESTADO'
        Style = csDropDownList
        DropDownWidth = 57
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 277
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cboCorLinha: TfcColorCombo
      Left = 276
      Top = 275
      Width = 129
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 9
    end
    object chkLinhas: TCheckBox
      Left = 25
      Top = 255
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 7
    end
    inline molAdministradora1: TmolAdministradora
      Left = 19
      Top = 137
      Width = 526
      TabOrder = 3
      inherited edtAdministradora: TEdit
        Width = 451
      end
      inherited btnBuscaAdministradora: TBitBtn
        Left = 460
      end
      inherited btnLimpaAdministradora: TBitBtn
        Left = 484
      end
      inherited btnAbrePessoa: TBitBtn
        Left = 280
        Visible = False
      end
    end
    object rgTipo: TRadioGroup
      Left = 469
      Top = 189
      Width = 90
      Height = 59
      Caption = ' Imprimir '
      ItemIndex = 0
      Items.Strings = (
        'Contratos'
        'Acordos')
      TabOrder = 10
    end
  end
  inherited Dock971: TDock97
    Top = 305
    Width = 578
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
    Left = 19
    Top = 307
  end
  object qryLookEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, CODESTADO, NOMEESTADO, IDESTADO'
      'FROM'
      '   ESTADO'
      'WHERE'
      '   ((:PAIS IS NULL) OR IDPAIS =:PAIS)'
      'ORDER BY'
      '   CODESTADO'
      ' ')
    ValidateWithMask = True
    Left = 93
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PAIS'
        ParamType = ptUnknown
      end>
    object qryLookEstadoCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryLookEstadoNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryLookEstadoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
      Visible = False
    end
    object qryLookEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
    end
  end
end
