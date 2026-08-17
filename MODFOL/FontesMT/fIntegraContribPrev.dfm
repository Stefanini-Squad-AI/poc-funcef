inherited FrmIntegraContribPrev: TFrmIntegraContribPrev
  Left = 316
  Top = 156
  Caption = 'Cálculo / Integração Contribuição Previdenciária'
  ClientHeight = 525
  ClientWidth = 957
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 957
    Height = 486
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 955
      Height = 83
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object btnGeracao: TBitBtn
        Left = 836
        Top = 17
        Width = 105
        Height = 52
        Caption = '&Geração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnGeracaoClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
        Spacing = 10
      end
      object rgProcesso: TRadioGroup
        Left = 339
        Top = 16
        Width = 129
        Height = 46
        Caption = ' Processo '
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Prévia'
          'Final')
        ParentFont = False
        TabOrder = 2
      end
      object grbAnoMesRef: TGroupBox
        Left = 17
        Top = 16
        Width = 211
        Height = 46
        Caption = ' Mês e Ano de Referência '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        object cmbMes: TComboBox
          Left = 8
          Top = 17
          Width = 136
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cmbMesChange
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
          Left = 149
          Top = 17
          Width = 57
          Height = 22
          MaxLength = 4
          MaxValue = 3000
          MinValue = 2000
          TabOrder = 1
          Value = 2024
          OnChange = speAnoChange
        end
      end
      object grb1: TGroupBox
        Left = 232
        Top = 16
        Width = 99
        Height = 46
        Caption = ' Pagamento em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        object dtedPagto: TCMDateTimePicker
          Left = 7
          Top = 17
          Width = 87
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
      object GroupBox1: TGroupBox
        Left = 476
        Top = 16
        Width = 347
        Height = 46
        Caption = 'Rubricas de Referência:'
        TabOrder = 4
        object cbRubRef: TComboBox
          Left = 8
          Top = 19
          Width = 331
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbRubRefChange
          Items.Strings = (
            '< Selecione a Rubrica de referência >'
            '32442 - CONT FUNCEF/REB ( EMPRESA ) MES'
            '32878 - P13 - CONT REB EMPRESA MES')
        end
      end
    end
    object pnlRubricas: TPanel
      Left = 1
      Top = 84
      Width = 955
      Height = 401
      Align = alClient
      TabOrder = 1
      object gridRubricas: TwwDBGrid
        Left = 1
        Top = 25
        Width = 953
        Height = 375
        TabStop = False
        Selected.Strings = (
          'TIPO'#9'14'#9'Tipo'
          'COD_RUB'#9'9'#9'Id Rubrica'
          'RUBRICA'#9'40'#9'Rubrica'
          'SUBTIPO'#9'18'#9'SubTipo'
          'MOTIVO'#9'40'#9'Motivo'
          'COD_MOTIVO'#9'9'#9'Cd Motivo'
          'PAGADOR'#9'16'#9'Pagador')
        IniAttributes.Delimiter = ';;'
        TitleColor = 8404992
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object pnlRubr2: TPanel
        Left = 1
        Top = 1
        Width = 953
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'Rubricas e Parâmetros de processamento'
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 486
    Width = 957
    inherited tb97Fundo: TToolbar97
      Left = 544
      DockPos = 544
      TabOrder = 0
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 368
      DockPos = 368
      TabOrder = 1
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        TabStop = False
      end
      inherited bbtnCancelar: TBitBtn
        TabStop = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 821
    Top = 123
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 268
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COD_RUB'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RUBRICA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SUBTIPO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COD_MOTIVO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MOTIVO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PAGADOR'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'SUB_TIPO'
        DataType = ftString
        Size = 181
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 397
    Top = 134
    object CdsRubricaTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 14
      FieldName = 'TIPO'
      Size = 60
    end
    object CdsRubricaCOD_RUB: TStringField
      Alignment = taCenter
      DisplayLabel = 'Id Rubrica'
      DisplayWidth = 9
      FieldName = 'COD_RUB'
      Size = 60
    end
    object CdsRubricaRUBRICA: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 40
      FieldName = 'RUBRICA'
      Size = 60
    end
    object CdsRubricaSUBTIPO: TStringField
      DisplayLabel = 'SubTipo'
      DisplayWidth = 18
      FieldName = 'SUBTIPO'
      Size = 60
    end
    object CdsRubricaMOTIVO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 40
      FieldName = 'MOTIVO'
      Size = 50
    end
    object CdsRubricaCOD_MOTIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cd Motivo'
      DisplayWidth = 9
      FieldName = 'COD_MOTIVO'
      Size = 60
    end
    object CdsRubricaPAGADOR: TStringField
      DisplayLabel = 'Pagador'
      DisplayWidth = 16
      FieldName = 'PAGADOR'
      Size = 13
    end
    object CdsRubricaSUB_TIPO: TStringField
      FieldName = 'SUB_TIPO'
      Visible = False
      Size = 181
    end
  end
  object cdsFunc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 535
    Top = 136
  end
  object cdsIntegra: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 197
  end
  object spAtualizaContribPrevia: TwwStoredProc
    DatabaseName = 'BASEDADOS'
    StoredProcName = 'CM.PR_CONTRIB_PATRONAL_PREVIA'
    ValidateWithMask = True
    Left = 389
    Top = 349
    ParamData = <
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATAPAGAMENTO'
        ParamType = ptInput
      end>
  end
  object dsRubrica: TwwDataSource
    DataSet = CdsRubrica
    Left = 401
    Top = 201
  end
  object spAtualizaContribFinal: TwwStoredProc
    DatabaseName = 'BASEDADOS'
    StoredProcName = 'CM.PR_CONTRIB_PATRONAL_FINAL'
    ValidateWithMask = True
    Left = 533
    Top = 345
    ParamData = <
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATAPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PUSUARIO'
        ParamType = ptInput
      end>
  end
  object SQLRubrica: TCMSqlParams
    SQL.Strings = (
      
        'SELECT DECODE(TIPO.TIPO, '#39'S'#39', '#39'SALARIO'#39', '#39'P'#39', '#39'PERCENTUAL'#39', '#39'C'#39',' +
        ' '#39'CONTRIBUIÇÃO'#39', TIPO.TIPO) TIPO,'
      '                   IDRUB.IDRUBRICA COD_RUB,'
      '                   DESCRICAO.DESCRICAO RUBRICA,'
      '                   SUBTIPO.SUBTIPO,'
      '                   MOTIVO.MOTIVO COD_MOTIVO,'
      '                   M.DESCRICAO MOTIVO,'
      
        '                   DECODE(CONT.CONT, '#39'1'#39', '#39'PARTICIPANTE'#39', 21, '#39'P' +
        'ATROCINADORA'#39', NULL) PAGADOR, '
      '                   (TIPO||CONT.CONT||'#39'_'#39'||SUBTIPO) SUB_TIPO '
      'FROM'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR IDRUBRICAREF'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      '               AND V.CODCAMPO = '#39'IDRUBRICAREF'#39
      '               AND V.VALOR = '#39'32878'#39') RUBREF '
      #9#9#9' JOIN'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR CONT'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      
        '               AND V.CODCAMPO = '#39'CONT'#39') CONT ON CONT.NUMLINHA = ' +
        'RUBREF.NUMLINHA'
      '             JOIN'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR DESCRICAO'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      
        '               AND V.CODCAMPO = '#39'DESCRICAO'#39') DESCRICAO ON DESCRI' +
        'CAO.NUMLINHA = RUBREF.NUMLINHA'
      '             JOIN'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR IDRUBRICA'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      
        '               AND V.CODCAMPO = '#39'IDRUBRICA'#39') IDRUB ON IDRUB.NUML' +
        'INHA = RUBREF.NUMLINHA'
      '             JOIN'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR MOTIVO'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      
        '               AND V.CODCAMPO = '#39'MOTIVO'#39') MOTIVO ON MOTIVO.NUMLI' +
        'NHA = RUBREF.NUMLINHA'
      '             JOIN'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR TIPO'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      
        '               AND V.CODCAMPO = '#39'TIPO'#39') TIPO ON TIPO.NUMLINHA = ' +
        'RUBREF.NUMLINHA'
      '             JOIN'
      '            (SELECT V.NUMLINHA,'
      '                   V.VALOR SUBTIPO'
      '              FROM VALTABGENER V'
      '             WHERE V.CODTABELA = '#39'RUBRICACONTRIB'#39
      
        '               AND V.CODCAMPO = '#39'SUBTIPO'#39') SUBTIPO ON SUBTIPO.NU' +
        'MLINHA = RUBREF.NUMLINHA'
      '               '
      'LEFT JOIN MOTIVO M ON M.IDMOTIVO = MOTIVO.MOTIVO'
      'ORDER BY TIPO DESC, PAGADOR, COD_MOTIVO, RUBRICA ;'
      ' '
      ' ')
    ClientDataSet = CdsRubrica
    Left = 397
    Top = 270
  end
end
