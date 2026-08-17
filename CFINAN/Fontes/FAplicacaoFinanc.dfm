inherited frmAplicacaoFinanc: TfrmAplicacaoFinanc
  Left = 126
  Top = 144
  HelpContext = 90011
  Caption = 'Aplicação Financeira'
  ClientHeight = 354
  ClientWidth = 560
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 560
    Height = 268
    object lblContaAplic: TLabel
      Left = 424
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Conta de Aplicação'
    end
    object sbProcuraContaAplic: TSpeedButton
      Left = 513
      Top = 24
      Width = 25
      Height = 21
      Hint = 'Procura Conta de Aplicação'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700777777777777770007777777777777700077000077777777000088880
        077777770887F7F880777777087F7F7F8077777087F7F7F7F80777708FFF7F7F
        7807777087F7F7F7F80777708FFF7F7F7807777708FFF7F780777777088F7F78
        8077777770088880077777777770000777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbProcuraContaAplicClick
    end
    object dbgrTipoOper: TDBRadioGroup
      Left = 16
      Top = 8
      Width = 396
      Height = 41
      Caption = ' Tipo de Operação '
      Columns = 3
      DataField = 'APLICRESGATEJUROS'
      DataSource = ds
      Items.Strings = (
        '&Aplicação'
        '&Resgate'
        '&Juros')
      TabOrder = 0
      Values.Strings = (
        'A'
        'R'
        'J')
      OnExit = dbgrTipoOperExit
    end
    object pnlAplicacao: TPanel
      Left = 5
      Top = 66
      Width = 550
      Height = 197
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lblPortadorConta: TLabel
        Left = 281
        Top = -1
        Width = 133
        Height = 13
        Caption = 'Conta Bancária / Caixa'
      end
      object lblNumCotas: TLabel
        Left = 281
        Top = 95
        Width = 98
        Height = 13
        Caption = 'Número de Cotas'
      end
      object lblValor: TLabel
        Left = 416
        Top = 95
        Width = 121
        Height = 13
        Caption = 'Valor do Lançamento'
      end
      object lblMoedaCota: TLabel
        Left = 8
        Top = 95
        Width = 87
        Height = 13
        Caption = 'Moeda da Cota'
      end
      object lblDtLanc: TLabel
        Left = 8
        Top = 47
        Width = 119
        Height = 13
        Caption = 'Data de Lançamento'
      end
      object lblTipoAplic: TLabel
        Left = 8
        Top = -1
        Width = 104
        Height = 13
        Caption = 'Tipo de Aplicação'
      end
      object lblPrazoResg: TLabel
        Left = 152
        Top = 47
        Width = 102
        Height = 13
        Caption = 'Prazo de Resgate'
      end
      object lblDataPrevResg: TLabel
        Left = 281
        Top = 47
        Width = 129
        Height = 13
        Caption = 'Data Prevista Resgate'
      end
      object lblTxPrev: TLabel
        Left = 416
        Top = 47
        Width = 103
        Height = 13
        Caption = 'Tx. Juros Prevista'
      end
      object lblValorResgPrev: TLabel
        Left = 405
        Top = 149
        Width = 131
        Height = 13
        Caption = 'Valor Resgate Previsto'
      end
      object dblcPortadorConta: TCMDBLookupCombo
        Left = 281
        Top = 15
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição')
        DataField = 'CODPORTADOR'
        DataSource = ds
        LookupTable = qryPortadorConta
        LookupField = 'CODPORTADOR'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbreNumCotas: TDBRealEdit
        Left = 281
        Top = 111
        Width = 128
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        OnExit = dbreNumCotasExit
        IntDigits = 10
        DecDigits = 7
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMCOTAS'
        DataSource = ds
      end
      object dbreValor: TDBRealEdit
        Left = 416
        Top = 111
        Width = 125
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 8
        WordWrap = False
        OnExit = dbreValorExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
        DataField = 'VALOR'
        DataSource = ds
      end
      object dblcMoeda: TCMDBLookupCombo
        Left = 8
        Top = 111
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Descrição'
          'MOESIGLA'#9'10'#9'Sigla')
        DataField = 'MOEDACOTA'
        DataSource = ds
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcMoedaCloseUp
      end
      object dbdtLanc: TCMDateTimePicker
        Left = 8
        Top = 63
        Width = 128
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCAMENTO'
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
        OnExit = dbdtLancExit
      end
      object dblcTipoAplic: TCMDBLookupCombo
        Left = 8
        Top = 15
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição')
        DataField = 'TIPOAPLICACAO'
        DataSource = ds
        LookupTable = qryTipoAplic
        LookupField = 'TIPOAPLICACAO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbrePrazoResgate: TDBRealEdit
        Left = 152
        Top = 63
        Width = 111
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '   0')
        TabOrder = 3
        WordWrap = False
        OnExit = dbrePrazoResgateExit
        IntDigits = 4
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'PRAZORESGATE'
        DataSource = ds
      end
      object dbdtResgate: TCMDateTimePicker
        Left = 281
        Top = 63
        Width = 128
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAPREVRESGATE'
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
        OnExit = dbdtResgateExit
      end
      object dbreJurosPrev: TDBRealEdit
        Left = 416
        Top = 63
        Width = 125
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 8
        NumberFormat = fNumber
        Signal = False
        DataField = 'JUROSPREVISTOS'
        DataSource = ds
      end
      object gbDespesa: TGroupBox
        Left = 8
        Top = 135
        Width = 385
        Height = 59
        Caption = ' Percentual de Despesa '
        TabOrder = 9
        object Label1: TLabel
          Left = 53
          Top = 15
          Width = 73
          Height = 13
          Caption = 's/ Aplicação'
        end
        object Label2: TLabel
          Left = 213
          Top = 15
          Width = 84
          Height = 13
          Caption = 's/ Rendimento'
        end
        object dbreDespAplic: TDBRealEdit
          Left = 53
          Top = 29
          Width = 128
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          OnExit = dbreDespAplicExit
          IntDigits = 10
          DecDigits = 7
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCUSTO'
          DataSource = ds
        end
        object dbreDespRend: TDBRealEdit
          Left = 213
          Top = 29
          Width = 128
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          OnExit = dbreDespRendExit
          IntDigits = 10
          DecDigits = 7
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCUSTOREND'
          DataSource = ds
        end
      end
      object dbreValorPrev: TDBRealEdit
        Left = 405
        Top = 165
        Width = 130
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRRESGPREV'
        DataSource = ds
      end
    end
    object dbreContaAplicacao: TwwDBEdit
      Left = 423
      Top = 24
      Width = 89
      Height = 21
      DataField = 'CONTAAPLICACAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbreContaAplicacaoExit
    end
  end
  inherited Dock972: TDock97
    Width = 560
    inherited Toolbar971: TToolbar97
      object sbtnBuscaInvest: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Inv.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
          FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
          FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
          FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C880733777777777733700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 560
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90011
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT CODLANCAPLIC, TIPOAPLICACAO, PLNCODIGO, MOEDACOTA, CODPOR' +
        'TADOR, CODLANCFINANC,'
      
        '       APLICRESGATEJUROS, VALOR, CONTAAPLICACAO, PRAZORESGATE, J' +
        'UROSPREVISTOS,'
      '       DATAPREVRESGATE, DATALANCAMENTO, NUMCOTAS, IDPESSOA,'
      '       VLRRESGPREV, PERCUSTO, PERCUSTOREND'
      'FROM APLICACOES'
      'WHERE  (CODLANCAPLIC = :CODLANCAPLIC)')
    Left = 463
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODLANCAPLIC'
        ParamType = ptUnknown
      end>
    object qryCODLANCAPLIC: TFloatField
      FieldName = 'CODLANCAPLIC'
      Origin = 'APLICACOES.CODLANCAPLIC'
    end
    object qryTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'APLICACOES.TIPOAPLICACAO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'APLICACOES.PLNCODIGO'
    end
    object qryMOEDACOTA: TFloatField
      FieldName = 'MOEDACOTA'
      Origin = 'APLICACOES.MOEDACOTA'
    end
    object qryCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'APLICACOES.CODPORTADOR'
    end
    object qryCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
      Origin = 'APLICACOES.CODLANCFINANC'
    end
    object qryAPLICRESGATEJUROS: TStringField
      FieldName = 'APLICRESGATEJUROS'
      Origin = 'APLICACOES.APLICRESGATEJUROS'
      Size = 1
    end
    object qryVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'APLICACOES.VALOR'
    end
    object qryCONTAAPLICACAO: TFloatField
      FieldName = 'CONTAAPLICACAO'
      Origin = 'APLICACOES.CONTAAPLICACAO'
      EditFormat = '#0'
    end
    object qryPRAZORESGATE: TFloatField
      FieldName = 'PRAZORESGATE'
      Origin = 'APLICACOES.PRAZORESGATE'
    end
    object qryDATAPREVRESGATE: TDateTimeField
      FieldName = 'DATAPREVRESGATE'
      Origin = 'APLICACOES.DATAPREVRESGATE'
    end
    object qryDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Origin = 'APLICACOES.DATALANCAMENTO'
    end
    object qryNUMCOTAS: TFloatField
      FieldName = 'NUMCOTAS'
      Origin = 'APLICACOES.NUMCOTAS'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'APLICACOES.IDPESSOA'
    end
    object qryVLRRESGPREV: TFloatField
      FieldName = 'VLRRESGPREV'
      Origin = 'APLICACOES.VLRRESGPREV'
    end
    object qryJUROSPREVISTOS: TFloatField
      FieldName = 'JUROSPREVISTOS'
    end
    object qryPERCUSTO: TFloatField
      FieldName = 'PERCUSTO'
      Origin = 'APLICACOES.PERCUSTO'
    end
    object qryPERCUSTOREND: TFloatField
      FieldName = 'PERCUSTOREND'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update APLICACOES'
      'set'
      '  CODLANCAPLIC = :CODLANCAPLIC,'
      '  TIPOAPLICACAO = :TIPOAPLICACAO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  MOEDACOTA = :MOEDACOTA,'
      '  CODPORTADOR = :CODPORTADOR,'
      '  CODLANCFINANC = :CODLANCFINANC,'
      '  APLICRESGATEJUROS = :APLICRESGATEJUROS,'
      '  VALOR = :VALOR,'
      '  CONTAAPLICACAO = :CONTAAPLICACAO,'
      '  PRAZORESGATE = :PRAZORESGATE,'
      '  JUROSPREVISTOS = :JUROSPREVISTOS,'
      '  DATAPREVRESGATE = :DATAPREVRESGATE,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  NUMCOTAS = :NUMCOTAS,'
      '  IDPESSOA = :IDPESSOA,'
      '  VLRRESGPREV = :VLRRESGPREV,'
      '  PERCUSTO = :PERCUSTO,'
      '  PERCUSTOREND = :PERCUSTOREND'
      'where'
      '  CODLANCAPLIC = :OLD_CODLANCAPLIC')
    InsertSQL.Strings = (
      'insert into APLICACOES'
      
        '  (CODLANCAPLIC, TIPOAPLICACAO, PLNCODIGO, MOEDACOTA, CODPORTADO' +
        'R, CODLANCFINANC, '
      
        '   APLICRESGATEJUROS, VALOR, CONTAAPLICACAO, PRAZORESGATE, JUROS' +
        'PREVISTOS, '
      
        '   DATAPREVRESGATE, DATALANCAMENTO, NUMCOTAS, IDPESSOA, VLRRESGP' +
        'REV, PERCUSTO, '
      '   PERCUSTOREND)'
      'values'
      
        '  (:CODLANCAPLIC, :TIPOAPLICACAO, :PLNCODIGO, :MOEDACOTA, :CODPO' +
        'RTADOR, '
      
        '   :CODLANCFINANC, :APLICRESGATEJUROS, :VALOR, :CONTAAPLICACAO, ' +
        ':PRAZORESGATE, '
      
        '   :JUROSPREVISTOS, :DATAPREVRESGATE, :DATALANCAMENTO, :NUMCOTAS' +
        ', :IDPESSOA, '
      '   :VLRRESGPREV, :PERCUSTO, :PERCUSTOREND)')
    DeleteSQL.Strings = (
      'delete from APLICACOES'
      'where'
      '  CODLANCAPLIC = :OLD_CODLANCAPLIC')
    Left = 433
    Top = 96
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAPLICACAO.DESCRICAO'
      'PORTADORCONTA.DESCRICAO'
      'APLICACOES.APLICRESGATEJUROS'
      'APLICACOES.DATALANCAMENTO'
      'APLICACOES.CONTAAPLICACAO'
      'APLICACOES.VALOR'
      'APLICACOES.NUMCOTAS'
      'MOEDA.MOEDESC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'N'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Tipo de Aplicação'
      'Conta Bancária / Caixa'
      'Tipo de Operação (A/R/J)'
      'Data Lancto.'
      'Número da Conta'
      'Valor Lancto.'
      'Número de Cotas'
      'Moeda da Cota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'APLICACOES'
      'PORTADORCONTA'
      'TIPOAPLICACAO'
      'MOEDA')
    CamposChave.Strings = (
      'APLICACOES.CODLANCAPLIC'
      'APLICACOES.CONTAAPLICACAO')
    Filtro.Strings = (
      'APLICACOES.CODPORTADOR = PORTADORCONTA.CODPORTADOR(+)'
      'APLICACOES.TIPOAPLICACAO = TIPOAPLICACAO.TIPOAPLICACAO'
      'APLICACOES.MOEDACOTA = MOEDA.MOECODIGO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '#,##0.00'
      '#,#######;0.0000000'
      '')
    Larguras.Strings = (
      '60'
      '50'
      '1'
      '10'
      '10'
      '10'
      '10'
      '20')
  end
  inherited ds: TwwDataSource
    Left = 485
    Top = 96
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 366
    Top = 50
  end
  object qryPortadorConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO, CODPORTADOR'
      'FROM PORTADORCONTA'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 493
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDESC, MOECODIGO, MOESIGLA '
      'FROM MOEDA'
      'WHERE (MOEINATIVO <> '#39'I'#39')'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 389
    Top = 8
  end
  object qryTipoAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPOAPLICACAO, DESCRICAO'
      'FROM TIPOAPLICACAO'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 485
    Top = 56
  end
  object qrySelConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODLANCAPLIC, TIPOAPLICACAO, MOEDACOTA, CODPORTADOR,'
      '       CONTAAPLICACAO, PRAZORESGATE, JUROSPREVISTOS'
      'FROM APLICACOES'
      'WHERE (CONTAAPLICACAO = :CONTAAPLICACAO) AND'
      '      (IDPESSOA = :IDPESSOA) AND'
      '      (CODLANCAPLIC <> :CODLANCAPLIC) AND'
      '      (APLICRESGATEJUROS = '#39'A'#39')')
    ValidateWithMask = True
    Left = 317
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CONTAAPLICACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODLANCAPLIC'
        ParamType = ptUnknown
      end>
    object qrySelContaTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'APLICACOES.TIPOAPLICACAO'
    end
    object qrySelContaMOEDACOTA: TFloatField
      FieldName = 'MOEDACOTA'
      Origin = 'APLICACOES.MOEDACOTA'
    end
    object qrySelContaCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'APLICACOES.CODPORTADOR'
    end
    object qrySelContaCODLANCAPLIC: TFloatField
      FieldName = 'CODLANCAPLIC'
      Origin = 'APLICACOES.CODLANCAPLIC'
    end
    object qrySelContaCONTAAPLICACAO: TFloatField
      FieldName = 'CONTAAPLICACAO'
      Origin = 'APLICACOES.CONTAAPLICACAO'
    end
    object qrySelContaPRAZORESGATE: TFloatField
      FieldName = 'PRAZORESGATE'
      Origin = 'APLICACOES.PRAZORESGATE'
    end
    object qrySelContaJUROSPREVISTOS: TFloatField
      FieldName = 'JUROSPREVISTOS'
      Origin = 'APLICACOES.JUROSPREVISTOS'
    end
  end
  object qryCalcSaldoAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(DECODE(APLICRESGATEJUROS,'#39'R'#39',(VALOR*-1),VALOR)) AS SA' +
        'LDOVALOR,'
      
        '       SUM(DECODE(APLICRESGATEJUROS,'#39'R'#39',(NUMCOTAS*-1),NUMCOTAS))' +
        ' AS SALDOCOTAS'
      'FROM APLICACOES'
      'WHERE (CONTAAPLICACAO = :CONTAAPLICACAO) AND'
      '      (IDPESSOA = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 181
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CONTAAPLICACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCalcSaldoAplicSALDOVALOR: TFloatField
      FieldName = 'SALDOVALOR'
    end
    object qryCalcSaldoAplicSALDOCOTAS: TFloatField
      FieldName = 'SALDOCOTAS'
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(DECODE(TIT.SALDOVLRRESGATE,NULL,DECODE(TIT.VLRRESGATE' +
        ',NULL,0,TIT.VLRRESGATE),TIT.SALDOVLRRESGATE)) AS VALOR,'
      '       PLC.IDPADRLANCCONT, TIT.DATAVENCTITRENFIX'
      'FROM TITRENFIXA TIT, CONTRATOINVESTIM CON, TIPOCONTRINVEST TCO,'
      '     ETAPACONTRATOINV ETP, TIPOOPERACAO TOP, PADRLANCCONTINV PLC'
      'WHERE'
      
        '    (TIT.DATAVENCTITRENFIX >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      
        '    (TIT.DATAVENCTITRENFIX <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      '    (TIT.VLRRESGATE IS NOT NULL) AND'
      '    (TCO.IDTIPOINVEST = 1) AND'
      '    (TOP.NATUREZAOPERACAO = '#39'D'#39') AND'
      '    (TOP.IDTIPOOPERACAO > 0) AND'
      '    (PLC.IDTIPODESPINVEST IS NULL) AND'
      '    (PLC.IDFORCLI IS NULL) AND'
      '    (PLC.IDCARTEIRAINVEST IS NULL) AND'
      '    (TIT.IDTITRENFIXA = CON.IDINVESTIMENTO) AND'
      '    (CON.IDTIPOCONTRINVEST = TCO.IDTIPOCONTRINVEST) AND'
      '    (TCO.IDTIPOCONTRINVEST = ETP.IDTIPOCONTRINVEST) AND'
      '    (ETP.IDTIPOOPERACAO = TOP.IDTIPOOPERACAO) AND'
      '    (PLC.IDTIPOOPERACAO = TOP.IDTIPOOPERACAO) '
      'GROUP BY PLC.IDPADRLANCCONT, TIT.DATAVENCTITRENFIX'
      '')
    ValidateWithMask = True
    Left = 320
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
end
