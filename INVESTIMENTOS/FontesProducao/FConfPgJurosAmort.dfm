inherited frmConfPgJurosAmort: TfrmConfPgJurosAmort
  Left = 267
  Top = 178
  Caption = 'Confirmação de Pag. de Juros e Amortização'
  ClientHeight = 287
  ClientWidth = 338
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 248
    Width = 338
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited Dock972: TDock97
    Width = 338
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 338
    Height = 201
    object GroupBox2: TGroupBox
      Left = 5
      Top = 86
      Width = 328
      Height = 110
      Align = alBottom
      TabOrder = 1
      object Label3: TLabel
        Left = 80
        Top = 21
        Width = 31
        Height = 13
        Caption = '&Juros'
      end
      object Label4: TLabel
        Left = 80
        Top = 64
        Width = 70
        Height = 13
        Caption = '&Amortização'
      end
      object dbrJuros: TDBRealEdit
        Left = 80
        Top = 37
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'JUROS'
        DataSource = ds
      end
      object dbrAmortizacao: TDBRealEdit
        Left = 80
        Top = 80
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'AMORTIZACAO'
        DataSource = ds
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 328
      Height = 95
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 28
        Height = 13
        Caption = '&Data'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 73
        Height = 13
        Caption = '&Investimento'
        FocusControl = dblkInvestimento
      end
      object dblkInvestimento: TCMDBLookupCombo
        Left = 8
        Top = 64
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkInvestimentoCloseUp
      end
      object dtDataMov: TCMDateTimePicker
        Left = 8
        Top = 24
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
        Enabled = False
        ShowButton = True
        TabOrder = 1
        OnExit = dtDataMovExit
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT TBVJUR.JUROS,'
      '               TBVAMORT.AMORTIZACAO'
      ''
      'FROM  ( SELECT H.VLRMOVCARTINV AS JUROS'
      
        '               FROM TIPOOPERACAO T, HISTCARTINV H, INVESTIMENTO ' +
        'I'
      '               WHERE ( H.IDINVESTIMENTO = I.IDINVESTIMENTO ) AND'
      
        '                              ( H.IDTIPOOPERACAO = T.IDTIPOOPERA' +
        'CAO ) AND '
      '                              ( H.IDTIPOINVEST = 1 ) AND'
      '                              ( H.IDTIPOOPERACAO = -17) AND '
      
        '                              ( H.DATAMOVCARTINV = :pDATAINV ) A' +
        'ND '
      
        '                              ( H.IDINVESTIMENTO = :pINVEST ) ) ' +
        'TBVJUR,'
      '                 '
      '            ( SELECT H.VLRMOVCARTINV AS AMORTIZACAO'
      '              FROM TIPOOPERACAO T, HISTCARTINV H, INVESTIMENTO I'
      '              WHERE ( H.IDINVESTIMENTO = I.IDINVESTIMENTO ) AND'
      
        '                             ( H.IDTIPOOPERACAO = T.IDTIPOOPERAC' +
        'AO ) AND '
      '                             ( H.IDTIPOINVEST = 1 ) AND'
      '                             ( H.IDTIPOOPERACAO = -18) AND'
      '                             ( H.DATAMOVCARTINV = :pDATAINV) AND'
      
        '                             ( H.IDINVESTIMENTO = :pINVEST )  ) ' +
        'TBVAMORT')
    Left = 191
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDATAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pINVEST'
        ParamType = ptUnknown
      end>
    object qryJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qryAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  VLRMOVCARTINV = :VLRMOVCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (VLRMOVCARTINV)'
      'values'
      '  (:VLRMOVCARTINV)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 161
    Top = 64
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Investimento'
    Colunas.Strings = (
      'HISTCARTINV.DATAMOVCARTINV'
      'INVESTIMENTO.DESCINVESTIMENTO')
    TipodeDado.Strings = (
      'D'
      'C')
    Descricao.Strings = (
      'Data'
      'Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'INVESTIMENTO'
      'HISTCARTINV')
    CamposChave.Strings = (
      'HISTCARTINV.DATAMOVCARTINV'
      'HISTCARTINV.IDINVESTIMENTO')
    Filtro.Strings = (
      'HISTCARTINV.IDTIPOINVEST = 1'
      'HISTCARTINV.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'HISTCARTINV.IDTIPOOPERACAO BETWEEN -18 AND -17')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 29
    Top = 160
  end
  inherited ds: TwwDataSource
    Left = 221
    Top = 64
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, '
      '               DESCINVESTIMENTO'
      'FROM    INVESTIMENTO'
      ''
      'WHERE IDTIPOINVEST = 1'
      ''
      'ORDER BY DESCINVESTIMENTO'
      '')
    ValidateWithMask = True
    Left = 272
    Top = 65
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
end
