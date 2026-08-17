inherited frmCadRevOpcoes: TfrmCadRevOpcoes
  Left = 207
  Top = 84
  Caption = 'Operação'
  ClientHeight = 417
  ClientWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 400
    Height = 331
    inherited Bevel2: TBevel
      Width = 390
    end
    inherited pnlTitulo: TPanel
      Width = 390
      inherited lbNomItem: TfcLabel
        Width = 212
        Caption = 'Reversão de Opções'
      end
    end
    object pnlPrincipal: TPanel
      Left = 5
      Top = 49
      Width = 390
      Height = 216
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object lblInvestimento: TLabel
        Left = 18
        Top = 164
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblEmissor: TLabel
        Left = 18
        Top = 85
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object lblCarteira: TLabel
        Left = 18
        Top = 45
        Width = 49
        Height = 13
        Caption = 'Carteira '
      end
      object Label2: TLabel
        Left = 18
        Top = 6
        Width = 81
        Height = 13
        Caption = 'Data da Baixa'
      end
      object lblBolsa: TLabel
        Left = 18
        Top = 126
        Width = 96
        Height = 13
        Caption = 'Bolsa de Valores'
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 18
        Top = 179
        Width = 355
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Opção'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkInvestimentoExit
      end
      object dblkEmissor: TwwDBLookupCombo
        Left = 18
        Top = 100
        Width = 355
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkEmissorExit
      end
      object dblkCarteira: TwwDBLookupCombo
        Left = 18
        Top = 60
        Width = 355
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkCarteiraExit
      end
      object dblkBolsa: TwwDBLookupCombo
        Left = 18
        Top = 140
        Width = 355
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLBOLSAVALORES'#9'10'#9'Bolsa de Valores'#9'F')
        LookupTable = qryBolsa
        LookupField = 'IDBOLSAVALORES'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkBolsaExit
      end
      object dbeDataRef: TCMDateTimePicker
        Left = 18
        Top = 21
        Width = 118
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
    object pnlQtd: TPanel
      Left = 5
      Top = 265
      Width = 390
      Height = 61
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 2
      object Label5: TLabel
        Left = 18
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Quantidade'
      end
      object dbrQtdeOperacao: TDBRealEdit
        Tag = -2
        Left = 18
        Top = 23
        Width = 158
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 400
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 400
    inherited tb97Fundo: TToolbar97
      Left = 230
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 63
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   DUAL'
      ' ')
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'EMISSOR.SIGLAEMISSOR'
      'OPCOES.DTAVENCTO'
      'OPCOES.VLRPRECOEX'
      'BOLSAVALORES.SGLBOLSAVALORES'
      'HISTCARTINV.SALDOQTDEINVCART')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Investimento'
      'Emissor'
      'Vencimento'
      'Preço Exercício'
      'Bolsa de Valores'
      'Saldo de Quantidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTCARTINV'
      'INVESTIMENTO'
      'OPCOES'
      'PARAMINVEST'
      'EMISSOR'
      'BOLSAVALORES')
    CamposChave.Strings = (
      'HISTCARTINV.IDHISTCARTINV'
      'HISTCARTINV.IDINVESTIMENTO'
      'HISTCARTINV.IDCARTEIRAINVEST'
      'HISTCARTINV.SALDOQTDEINVCART'
      'HISTCARTINV.IDCORRETVALORES'
      'HISTCARTINV.IDPLANPREVCTBPATR'
      'INVESTIMENTO.IDEMISSOR'
      'OPCOES.DTAVENCTO'
      'OPCOES.VLRPRECOEX'
      'OPCOES.IDBOLSAVALORES')
    Filtro.Strings = (
      'HISTCARTINV.SALDOQTDEINVCART > 0'
      'HISTCARTINV.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'HISTCARTINV.IDINVESTIMENTO = OPCOES.IDINVESTIMENTO'
      'OPCOES.DTAVENCTO >= PARAMINVEST.DATAULTFECH'
      'OPCOES.IDBOLSAVALORES = BOLSAVALORES.IDBOLSAVALORES'
      'INVESTIMENTO.IDEMISSOR = EMISSOR.IDEMISSOR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '15'
      '18'
      '10'
      '10'
      '10')
    Left = 301
  end
  inherited ImlPadrao: TImageList
    Left = 257
  end
  object qryBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES, SGLBOLSAVALORES'
      'FROM'
      '   BOLSAVALORES'
      'ORDER BY SGLBOLSAVALORES'
      ' ')
    ValidateWithMask = True
    Left = 333
    Top = 228
    object qryBolsaSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Bolsa de Valores'
      DisplayWidth = 10
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BASEDADOS.BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object qryBolsaIDBOLSAVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
  object qryEmissor: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDEMISSOR, SIGLAEMISSOR'
      'FROM'
      '   EMISSOR'
      'ORDER BY SIGLAEMISSOR'
      ' ')
    ValidateWithMask = True
    Left = 333
    Top = 188
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object qryCarteira: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST,DESCCARTINVEST'
      'FROM'
      '   CARTEIRAINVEST'
      'WHERE'
      '   IDTIPOINVEST=2'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 333
    Top = 148
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IV.DESCINVESTIMENTO, IV.IDINVESTIMENTO'
      'FROM'
      '   ACOESXBOLSA AC, INVESTIMENTO IV'
      'WHERE'
      
        '   (((:IDEMISSOR IS NOT NULL)      AND (AC.IDEMISSOR = :IDEMISSO' +
        'R )) OR (:IDEMISSOR IS NULL)) AND'
      
        '   (((:IDBOLSAVALORES IS NOT NULL) AND (AC.IDBOLSAVALORES = :IDB' +
        'OLSAVALORES )) OR (:IDBOLSAVALORES IS NULL)) AND'
      '   IV.IDTIPOINVEST=2 AND'
      '   IV.STAOPCAO= '#39'Y'#39' AND'
      '   AC.IDACAO = IV.IDINVESTIMENTO'
      '  '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 333
    Top = 267
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 348
    Top = 2
  end
end
