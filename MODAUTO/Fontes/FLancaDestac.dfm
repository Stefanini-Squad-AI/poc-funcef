inherited frmLancaDestac: TfrmLancaDestac
  Left = 169
  Top = 166
  Caption = 'Lançamento de Rubricas do Destacamento'
  ClientHeight = 271
  ClientWidth = 562
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 232
    BorderWidth = 2
    object Label5: TLabel
      Left = 24
      Top = 73
      Width = 40
      Height = 13
      Caption = 'Diárias'
    end
    object Label1: TLabel
      Left = 24
      Top = 107
      Width = 62
      Height = 13
      Caption = 'Transporte'
    end
    object Label2: TLabel
      Left = 24
      Top = 139
      Width = 78
      Height = 13
      Caption = 'Adiantamento'
    end
    object dblcDiaria: TwwDBLookupCombo
      Left = 105
      Top = 70
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub1
      LookupField = 'DESCRICAO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblcTransporte: TwwDBLookupCombo
      Left = 105
      Top = 104
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub2
      LookupField = 'DESCRICAO'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblcAdiantamento: TwwDBLookupCombo
      Left = 105
      Top = 136
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub3
      LookupField = 'DESCRICAO'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object redTransporte: TRealEdit
      Left = 449
      Top = 104
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object redAdiantamento: TRealEdit
      Left = 449
      Top = 136
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object grpMesRef: TGroupBox
      Left = 348
      Top = 13
      Width = 200
      Height = 42
      Caption = ' Mês e Ano de Referência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object cmbMes: TComboBox
        Left = 7
        Top = 14
        Width = 115
        Height = 21
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
      object spnedAno: TSpinEdit
        Left = 132
        Top = 14
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object edNome: TEdit
      Left = 24
      Top = 25
      Width = 300
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object gbxIntervRef: TGroupBox
      Left = 24
      Top = 11
      Width = 300
      Height = 46
      Caption = 'Período de Referência (Início do Destacamento)'
      TabOrder = 8
      object Label3: TLabel
        Left = 151
        Top = 20
        Width = 19
        Height = 13
        Caption = 'até'
      end
      object Label4: TLabel
        Left = 26
        Top = 20
        Width = 17
        Height = 13
        Caption = 'De'
      end
      object dtedIni: TCMDateTimePicker
        Left = 46
        Top = 16
        Width = 100
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
      object dtedFin: TCMDateTimePicker
        Left = 175
        Top = 16
        Width = 100
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
    object rgMaisLancamentos: TRadioGroup
      Left = 129
      Top = 173
      Width = 305
      Height = 45
      Caption = 'Haverá Mais Lançamentos deste Destacamento ?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 9
    end
    object redDiaria: TRealEdit
      Left = 449
      Top = 70
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
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 562
    inherited TB97oKCancelar: TToolbar97 [0]
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 367
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 267
    Top = 259
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryRub1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 115
    Top = 60
  end
  object qryRub2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 178
    Top = 100
  end
  object qryRub3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 257
    Top = 129
  end
  object tblRubInd: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;IDEMPRESA;IDRUBRICA;SEQRUBRICAINDIV'
    TableName = 'CM.RUBRICAINDIV'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 226
    Top = 36
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, NORMALINI from PARAMRH')
    ValidateWithMask = True
    Left = 272
    Top = 42
  end
  object qryTrecho: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDDESTACAMENTO, '
      'D.NUMSEQ         ,'
      'D.IDCIDADES     , '
      'D.DATAINI       , '
      'D.INDTRANSPORTE  ,'
      'D.FLGTRANSPORTE , '
      'D.VLRTRANSPORTE , '
      'D.VLREMBARQUE   , '
      'D.VLRDESEMBARQUE ,'
      'C.NOME '
      'FROM DSTTRECHO D, CIDADES C'
      'WHERE D.IDDESTACAMENTO = :IDDESTACAMENTO'
      'AND       D.IDCIDADES = C.IDCIDADES'
      'ORDER BY D.DATAINI')
    ValidateWithMask = True
    Left = 488
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDESTACAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryCalen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDESTACAMENTO, DATADESTACAMENTO, '
      '      FLGDIARIA'
      'FROM DSTCALENDARIO'
      'WHERE IDDESTACAMENTO = :IDDESTACAMENTO'
      'ORDER BY DATADESTACAMENTO')
    ControlType.Strings = (
      'FLGDIARIA;CheckBox;0;1')
    ValidateWithMask = True
    Left = 440
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDESTACAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
    Top = 42
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 408
    Top = 42
  end
end
