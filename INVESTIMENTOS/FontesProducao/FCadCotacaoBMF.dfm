inherited frmCadCotacaoBMF: TfrmCadCotacaoBMF
  Left = 200
  Top = 187
  HelpContext = 790260
  Caption = 'Cadastro de Cotações BM&F'
  ClientHeight = 393
  ClientWidth = 410
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 8
    Top = 162
    Width = 43
    Height = 13
    Caption = 'Máxima'
  end
  object Label6: TLabel [1]
    Left = 8
    Top = 115
    Width = 42
    Height = 13
    Caption = 'Mínima'
  end
  inherited pnlFundo: TPanel
    Width = 410
    Height = 307
    object GroupBox2: TGroupBox
      Left = 8
      Top = 6
      Width = 393
      Height = 97
      TabOrder = 0
      object Label11: TLabel
        Left = 12
        Top = 50
        Width = 30
        Height = 13
        Caption = 'Série'
      end
      object Label14: TLabel
        Left = 260
        Top = 50
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label13: TLabel
        Left = 12
        Top = 10
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object dblSerie: TwwDBLookupCombo
        Left = 12
        Top = 66
        Width = 237
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Série')
        DataField = 'IDINVESTIMENTO'
        DataSource = ds
        LookupTable = qrySerie
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbdDataAutoriza: TCMDateTimePicker
        Left = 260
        Top = 66
        Width = 117
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATACOTACAOBMF'
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
        OnExit = dbdDataAutorizaExit
      end
      object dblTipoContrato: TwwDBLookupCombo
        Left = 12
        Top = 26
        Width = 365
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCTINVEST'#9'60'#9'Tipo de Contrato')
        DataField = 'IDTIPOCONTRINVEST'
        DataSource = ds
        LookupTable = qryContrInvest
        LookupField = 'IDTIPOCONTRINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblTipoContratoCloseUp
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 102
      Width = 393
      Height = 193
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 64
        Width = 42
        Height = 13
        Caption = 'Mínima'
      end
      object Label2: TLabel
        Left = 264
        Top = 24
        Width = 70
        Height = 13
        Caption = 'Fechamento'
      end
      object Label3: TLabel
        Left = 264
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Máxima'
      end
      object Label4: TLabel
        Left = 136
        Top = 24
        Width = 49
        Height = 13
        Caption = 'Abertura'
      end
      object Label7: TLabel
        Left = 136
        Top = 144
        Width = 119
        Height = 13
        Caption = 'Número de Negócios'
      end
      object Label8: TLabel
        Left = 136
        Top = 64
        Width = 35
        Height = 13
        Caption = 'Média'
      end
      object Label9: TLabel
        Left = 8
        Top = 104
        Width = 36
        Height = 13
        Caption = 'Última'
      end
      object Label10: TLabel
        Left = 8
        Top = 144
        Width = 107
        Height = 13
        Caption = 'Volume Negociado'
      end
      object Label12: TLabel
        Left = 8
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Ajuste'
      end
      object Label17: TLabel
        Left = 136
        Top = 104
        Width = 63
        Height = 13
        Caption = 'Liquidação'
      end
      object Label15: TLabel
        Left = 264
        Top = 104
        Width = 27
        Height = 13
        Caption = 'Beta'
      end
      object dbeNumeroNegocios: TDBRealEdit
        Left = 136
        Top = 160
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'NUMNEGOCIO'
        DataSource = ds
      end
      object dbeAjuste: TDBRealEdit
        Left = 8
        Top = 40
        Width = 121
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
        DataField = 'VLRAJUSTE'
        DataSource = ds
      end
      object dbeAbertura: TDBRealEdit
        Left = 136
        Top = 40
        Width = 121
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
        DataField = 'VLRABERTURA'
        DataSource = ds
      end
      object dbeMinima: TDBRealEdit
        Left = 8
        Top = 80
        Width = 121
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
        DataField = 'VLRMINIMA'
        DataSource = ds
      end
      object dbeMedia: TDBRealEdit
        Left = 136
        Top = 80
        Width = 121
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
        DataField = 'VLRMEDIA'
        DataSource = ds
      end
      object dbeFechamento: TDBRealEdit
        Left = 264
        Top = 40
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRFECHAMENTO'
        DataSource = ds
      end
      object dbeMaxima: TDBRealEdit
        Left = 264
        Top = 80
        Width = 121
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
        DataField = 'VLRMAXIMA'
        DataSource = ds
      end
      object dbeVolumeNegociado: TDBRealEdit
        Left = 8
        Top = 160
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 9
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'VOLUME'
        DataSource = ds
      end
      object dbeUltima: TDBRealEdit
        Left = 8
        Top = 120
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRULTIMO'
        DataSource = ds
      end
      object dbeLiquidacao: TDBRealEdit
        Left = 136
        Top = 120
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRLIQUIDACAO'
        DataSource = ds
      end
      object dbeBeta: TDBRealEdit
        Left = 264
        Top = 120
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRBETA'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 410
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 410
    inherited tb97Fundo: TToolbar97
      Left = 238
      DockPos = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 69
      DockPos = 72
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 301
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACAOBMF'
      'set'
      '  VLRABERTURA = :VLRABERTURA,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  VLRMINIMA = :VLRMINIMA,'
      '  VLRMEDIA = :VLRMEDIA,'
      '  VLRAJUSTE = :VLRAJUSTE,'
      '  VOLUME = :VOLUME,'
      '  NUMNEGOCIO = :NUMNEGOCIO,'
      '  VLRBETA = :VLRBETA,'
      '  DATACOTACAOBMF = :DATACOTACAOBMF,'
      '  VLRFECHAMENTO = :VLRFECHAMENTO,'
      '  VLRMAXIMA = :VLRMAXIMA,'
      '  VLRULTIMO = :VLRULTIMO,'
      '  VLRLIQUIDACAO = :VLRLIQUIDACAO'
      'where'
      '  IDCOTACAOBMF = :OLD_IDCOTACAOBMF')
    InsertSQL.Strings = (
      'insert into COTACAOBMF'
      '  (IDCOTACAOBMF, VLRABERTURA, IDINVESTIMENTO,IDTIPOCONTRINVEST, '
      'VLRMINIMA, VLRMEDIA, '
      'VLRAJUSTE, '
      '   VOLUME, NUMNEGOCIO, VLRBETA, DATACOTACAOBMF, VLRFECHAMENTO, '
      'VLRMAXIMA, '
      '   VLRULTIMO, VLRLIQUIDACAO)'
      'values'
      
        '  (:IDCOTACAOBMF, :VLRABERTURA, :IDINVESTIMENTO,:IDTIPOCONTRINVE' +
        'ST, '
      ':VLRMINIMA, '
      ':VLRMEDIA, '
      '   :VLRAJUSTE, :VOLUME, :NUMNEGOCIO, :VLRBETA, :DATACOTACAOBMF, '
      ':VLRFECHAMENTO, '
      '   :VLRMAXIMA, :VLRULTIMO, :VLRLIQUIDACAO)')
    DeleteSQL.Strings = (
      'delete from COTACAOBMF'
      'where'
      '  IDCOTACAOBMF = :OLD_IDCOTACAOBMF')
    Left = 241
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COTACAOBMF.DATACOTACAOBMF'
      'INVESTIMENTO.DESCINVESTIMENTO')
    TipodeDado.Strings = (
      'D'
      'C')
    Descricao.Strings = (
      'Data Cotação'
      'Série')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'COTACAOBMF'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'COTACAOBMF.IDCOTACAOBMF'
      'COTACAOBMF.DATACOTACAOBMF')
    Filtro.Strings = (
      'COTACAOBMF.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    Left = 349
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    AfterCancel = qryAfterCancel
    SQL.Strings = (
      'SELECT'
      '     IDCOTACAOBMF,'
      '     VLRABERTURA,'
      '     IDINVESTIMENTO,'
      '     IDTIPOCONTRINVEST,   '
      '     VLRMINIMA,'
      '     VLRMEDIA,'
      '     VLRAJUSTE,'
      '     VOLUME,'
      '     NUMNEGOCIO,'
      '     VLRBETA,'
      '     DATACOTACAOBMF,'
      '     VLRFECHAMENTO,'
      '     VLRMAXIMA,'
      '     VLRULTIMO,'
      '     VLRLIQUIDACAO '
      'FROM'
      '     COTACAOBMF'
      'WHERE'
      '     IDCOTACAOBMF = :P_IDCOTACAOBMF')
    Left = 271
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDCOTACAOBMF'
        ParamType = ptUnknown
      end>
    object qryIDCOTACAOBMF: TFloatField
      FieldName = 'IDCOTACAOBMF'
      Origin = 'COTACAOBMF.IDCOTACAOBMF'
    end
    object qryVLRABERTURA: TFloatField
      FieldName = 'VLRABERTURA'
      Origin = 'COTACAOBMF.VLRABERTURA'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'COTACAOBMF.IDINVESTIMENTO'
    end
    object qryVLRMINIMA: TFloatField
      FieldName = 'VLRMINIMA'
      Origin = 'COTACAOBMF.VLRMINIMA'
    end
    object qryVLRMEDIA: TFloatField
      FieldName = 'VLRMEDIA'
      Origin = 'COTACAOBMF.VLRMEDIA'
    end
    object qryVLRAJUSTE: TFloatField
      FieldName = 'VLRAJUSTE'
      Origin = 'COTACAOBMF.VLRAJUSTE'
    end
    object qryVOLUME: TFloatField
      FieldName = 'VOLUME'
      Origin = 'COTACAOBMF.VOLUME'
    end
    object qryNUMNEGOCIO: TFloatField
      FieldName = 'NUMNEGOCIO'
      Origin = 'COTACAOBMF.NUMNEGOCIO'
    end
    object qryVLRBETA: TFloatField
      FieldName = 'VLRBETA'
      Origin = 'COTACAOBMF.VLRBETA'
    end
    object qryDATACOTACAOBMF: TDateTimeField
      FieldName = 'DATACOTACAOBMF'
      Origin = 'COTACAOBMF.DATACOTACAOBMF'
    end
    object qryVLRFECHAMENTO: TFloatField
      FieldName = 'VLRFECHAMENTO'
      Origin = 'COTACAOBMF.VLRFECHAMENTO'
    end
    object qryVLRMAXIMA: TFloatField
      FieldName = 'VLRMAXIMA'
      Origin = 'COTACAOBMF.VLRMAXIMA'
    end
    object qryVLRULTIMO: TFloatField
      FieldName = 'VLRULTIMO'
      Origin = 'COTACAOBMF.VLRULTIMO'
    end
    object qryVLRLIQUIDACAO: TFloatField
      FieldName = 'VLRLIQUIDACAO'
      Origin = 'COTACAOBMF.VLRLIQUIDACAO'
    end
    object qryIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'COTACAOBMF.IDTIPOCONTRINVEST'
    end
  end
  object IvExtendedTranslator1: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 3
    Top = 3
    TargetsData = (
      1
      3
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        ''
        'Lines'
        0))
  end
  object qrySerieBMF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     SB.IDINVESTIMENTO,   '
      '     SB.IDTIPOCONTRINVEST,'
      '     IV.DESCINVESTIMENTO,'
      '     TP.DESCTIPOCTINVEST'
      'FROM'
      '     SERIESBMF SB,'
      '     INVESTIMENTO IV,'
      '     TIPOCONTRINVEST TP'
      'WHERE'
      '     (IV.IDTIPOINVEST= 8) AND'
      '     (SB.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '     (SB.IDTIPOCONTRINVEST = TP.IDTIPOCONTRINVEST)')
    ValidateWithMask = True
    Left = 208
    Top = 85
    object qrySerieBMFIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'SERIESBMF.IDINVESTIMENTO'
    end
    object qrySerieBMFIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'SERIESBMF.IDTIPOCONTRINVEST'
    end
    object qrySerieBMFDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qrySerieBMFDESCTIPOCTINVEST: TStringField
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      Size = 60
    end
  end
  object qryContrInvest: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     SB.IDTIPOCONTRINVEST,'
      '     TP.DESCTIPOCTINVEST'
      'FROM'
      '     SERIESBMF SB,'
      '     TIPOCONTRINVEST TP'
      'WHERE'
      '  (SB.IDTIPOCONTRINVEST = TP.IDTIPOCONTRINVEST)')
    ValidateWithMask = True
    Left = 128
    Top = 61
    object qryContrInvestDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 60
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      Size = 60
    end
    object qryContrInvestIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'SERIESBMF.IDTIPOCONTRINVEST'
      Visible = False
    end
  end
  object qrySerie: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     SB.IDINVESTIMENTO,'
      '     IV.DESCINVESTIMENTO'
      'FROM'
      '     SERIESBMF SB,'
      '     INVESTIMENTO IV'
      'WHERE'
      '     (SB.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '     (SB.IDTIPOCONTRINVEST = :P_IDTIPOCONTRINVEST)')
    ValidateWithMask = True
    Left = 80
    Top = 125
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
    object qrySerieDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Série'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qrySerieIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'SERIESBMF.IDINVESTIMENTO'
      Visible = False
    end
  end
  object QryVerifOrdCalc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    FLGSTATUSFECHBOL'
      'FROM'
      '    OPERACAOINVEST'
      'WHERE'
      '   (IDTIPOINVEST = 8) AND'
      '   (DATAOPERACAO=TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '   (NOT FLGSTATUSFECHBOL IS NULL)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 141
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object QryVerifOrdCalcFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
  end
end
