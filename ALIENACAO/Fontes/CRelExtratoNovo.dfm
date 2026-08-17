inherited RelExtratoNovo: TRelExtratoNovo
  Left = 583
  Top = 152
  HelpContext = 1350051
  Caption = 'Extrato Contratual - NOVO'
  ClientHeight = 412
  ClientWidth = 554
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 554
    Height = 373
    object Label1: TLabel
      Left = 28
      Top = 65
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label2: TLabel
      Left = 27
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    inline molProposta1: TmolProposta
      Left = 19
      Top = 112
      Height = 66
      inherited Label1: TLabel
        Top = 1
        Width = 85
        Caption = 'Nº do Contrato'
      end
      inherited Label2: TLabel
        Left = 112
        Top = 1
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
      Top = 160
      Width = 526
      TabOrder = 1
      inherited Label1: TLabel
        Left = 7
      end
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
      Top = 208
      Width = 519
      Height = 41
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
      Top = 304
      Width = 153
      Height = 53
      Caption = 'Data Final'
      TabOrder = 3
      object cmdtFim: TCMDateTimePicker
        Left = 16
        Top = 20
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
    end
    object chkLinhas: TCheckBox
      Left = 193
      Top = 326
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 4
    end
    object chkCorLinha: TCheckBox
      Left = 192
      Top = 345
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cboCorLinha: TfcColorCombo
      Left = 432
      Top = 341
      Width = 93
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
      TabOrder = 6
    end
    inline molImovelMestre1: TmolImovelMestre
      Left = 18
      Top = 253
      Width = 527
      Height = 44
      TabOrder = 7
      inherited edtImovel: TEdit
        Width = 453
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 461
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 485
      end
    end
    object chkFormaGerencial: TCheckBox
      Left = 193
      Top = 307
      Width = 312
      Height = 17
      Caption = 'Gerar no formato de informações gerenciais'
      TabOrder = 8
    end
    object dbcboPlanPrev: TwwDBLookupCombo
      Left = 28
      Top = 32
      Width = 445
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME'#9'F')
      LookupTable = cdsPlano
      LookupField = 'IDPLANOPREV'
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbcboPatro: TwwDBLookupCombo
      Left = 28
      Top = 82
      Width = 445
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = cdsPatro
      LookupField = 'IDPESSOA'
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 373
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
    Left = 59
    Top = 267
  end
  object cdsPatro: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 478
    Top = 76
    Data = {
      460100009619E0BD010000001800000002000E00000003000000510008494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C000100044C43494404000100090800000000000000000000F03F05
      5054522032000000000000000000400F46554E4441C7C34F204D4F44454C4F00
      0000000000000008400550545220330000000000000000104005505452203400
      000000000000C05B4005505452203600000000000010F6304105505452203500
      000000000039F630410A50545220313131313520000000000000BCF630410950
      5452203131313136000000000000C6F6304103464341000000000000CAF63041
      03465341000000000000D0F6304103465443000000000000D2F630410343464E
      000000000000488232410850545220313131310000000000000E6637410C4241
      4E434F204D4F44454C4F}
    object cdsPatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object cdsPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 470
    Top = 20
    Data = {
      280100009619E0BD010000001800000005000400000003000000B3000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      4454480200020032000C434F444F5243414D454E544F01004900000001000557
      494454480200020002000E5349474C414F5243414D454E544F01004900000001
      00055749445448020002000A0006434F44535043010049000000010005574944
      5448020002000A000100044C4349440400010009080000005001000000000000
      08401250545220313020505245564944454E4349410050010000000000002C40
      0B504C414E4F205054522031005001000000000080404017504C414E4F205054
      52203120505245564944454E4349410050010000000000804840114D4F44454C
      4F2042454E45464943494F53}
    object cdsPlanoNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
end
