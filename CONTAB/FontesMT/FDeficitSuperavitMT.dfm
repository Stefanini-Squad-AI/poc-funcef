inherited frmDeficitSuperavitMT: TfrmDeficitSuperavitMT
  Left = 249
  Top = 176
  HelpContext = 10138
  Caption = 'Apuração de Resultado'
  ClientHeight = 436
  ClientWidth = 441
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 441
    Height = 397
    object Label3: TLabel
      Left = 24
      Top = 12
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 136
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 320
      Top = 12
      Width = 101
      Height = 13
      Caption = 'Data Lançamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 231
      Width = 98
      Height = 13
      Caption = 'Planilhas Criadas'
    end
    object Label2: TLabel
      Left = 24
      Top = 65
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 112
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Label6: TLabel
      Left = 24
      Top = 160
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object dblkExerc: TwwDBLookupCombo
      Left = 24
      Top = 28
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      DataField = 'PEREXERCI'
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblkExercExit
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 136
      Top = 28
      Width = 169
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'PERNOME')
      DataField = 'PERNUMERO'
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblkPeriodoExit
    end
    object eddataproc: TCMDateTimePicker
      Left = 320
      Top = 52
      Width = 97
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
      Enabled = False
      ShowButton = True
      TabOrder = 2
      Visible = False
    end
    object mmTxt: TRichEdit
      Left = 24
      Top = 247
      Width = 393
      Height = 125
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 1200
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object cboPlano: TwwDBLookupCombo
      Left = 24
      Top = 128
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPLANO'#9'40'#9'Descrição'#9'F')
      LookupTable = cdsPlano
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnEnter = cboPlanoEnter
    end
    object cboPatro: TwwDBLookupCombo
      Left = 24
      Top = 176
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPATRO'#9'40'#9'Descrição'#9'F')
      LookupTable = cdsPatro
      LookupField = 'IDPATRO'
      Options = [loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnEnter = cboPatroEnter
    end
    object eddataproc1: TEdit
      Left = 320
      Top = 28
      Width = 101
      Height = 21
      Enabled = False
      TabOrder = 6
    end
    object EdOper: TDBEdit
      Left = 24
      Top = 88
      Width = 393
      Height = 21
      Color = clBtnFace
      DataField = 'TIPDESCRICAO'
      DataSource = dsqryaux
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 441
    inherited tb97Fundo: TToolbar97
      Left = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      inherited bbtnConfirmar: TBitBtn
        Caption = 'Ap&urar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 315
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 65535
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 65528
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 136
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 184
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 48
    Top = 256
  end
  object dsqryaux: TDataSource
    DataSet = qryAux
    Left = 136
    Top = 280
  end
end
