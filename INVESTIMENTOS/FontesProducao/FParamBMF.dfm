inherited frmParamBMF: TfrmParamBMF
  Left = 222
  Top = 139
  HelpContext = 790142
  Caption = 'Parâmetros dos Investidores de BM&F'
  ClientHeight = 325
  ClientWidth = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 444
    Height = 239
    object GroupBox1: TGroupBox
      Left = 1
      Top = 69
      Width = 442
      Height = 169
      Align = alClient
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 82
        Height = 13
        Caption = '% TOB Normal'
      end
      object Label4: TLabel
        Left = 152
        Top = 16
        Width = 102
        Height = 13
        Caption = '% TOB Day-Trade'
      end
      object Label5: TLabel
        Left = 288
        Top = 16
        Width = 108
        Height = 13
        Caption = '% Taxa Liquidação'
      end
      object Label6: TLabel
        Left = 16
        Top = 64
        Width = 93
        Height = 13
        Caption = '% Taxa Registro'
      end
      object Label7: TLabel
        Left = 152
        Top = 64
        Width = 77
        Height = 13
        Caption = '% Taxa Bolsa'
      end
      object Label8: TLabel
        Left = 288
        Top = 64
        Width = 113
        Height = 13
        Caption = '% Dev. TOB Normal'
      end
      object Label9: TLabel
        Left = 16
        Top = 111
        Width = 133
        Height = 13
        Caption = '% Dev. TOB Day-Trade'
      end
      object dbePercTOBN: TDBRealEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCTOBN'
        DataSource = ds
      end
      object dbePercTOBD: TDBRealEdit
        Left = 152
        Top = 32
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCTOBD'
        DataSource = ds
      end
      object dbePercLiq: TDBRealEdit
        Left = 288
        Top = 32
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCLIQ'
        DataSource = ds
      end
      object dbePercTaxaRegistro: TDBRealEdit
        Left = 16
        Top = 79
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCTXREG'
        DataSource = ds
      end
      object dbePercTaxaBolsa: TDBRealEdit
        Left = 152
        Top = 79
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCTXBOLSA'
        DataSource = ds
      end
      object dbePercTOBDevN: TDBRealEdit
        Left = 288
        Top = 79
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCDEVN'
        DataSource = ds
      end
      object dbePercTOBDevD: TDBRealEdit
        Left = 16
        Top = 127
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WantReturns = False
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCDEVD'
        DataSource = ds
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 442
      Height = 68
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 152
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Tipo Investidor'
      end
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 99
        Height = 13
        Caption = 'Data de Vigência'
      end
      object dbdVigencia: TCMDateTimePicker
        Left = 8
        Top = 32
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAVIGENCIA'
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
        TabOrder = 0
      end
      object dblTipoInvestidor: TwwDBLookupCombo
        Left = 152
        Top = 32
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTPINVESTIDOR'#9'60'#9'DESCTPINVESTIDOR')
        DataField = 'IDTIPOINVESTIDOR'
        DataSource = ds
        LookupTable = qryTipoInvestidor
        LookupField = 'IDTIPOINVESTIDOR'
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 444
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 444
    inherited tb97Fundo: TToolbar97
      Left = 272
      DockPos = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 103
      DockPos = 106
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMBMF'
      'set'
      '  IDPARAMBMF = :IDPARAMBMF,'
      '  IDTIPOINVESTIDOR = :IDTIPOINVESTIDOR,'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  PERCTOBN = :PERCTOBN,'
      '  PERCTOBD = :PERCTOBD,'
      '  PERCLIQ = :PERCLIQ,'
      '  PERCTXBOLSA = :PERCTXBOLSA,'
      '  PERCTXREG = :PERCTXREG,'
      '  PERCDEVN = :PERCDEVN,'
      '  PERCDEVD = :PERCDEVD'
      'where'
      '  IDPARAMBMF = :OLD_IDPARAMBMF')
    InsertSQL.Strings = (
      'insert into PARAMBMF'
      
        '  (IDPARAMBMF, IDTIPOINVESTIDOR, DATAVIGENCIA, PERCTOBN, PERCTOB' +
        'D, PERCLIQ, '
      '   PERCTXBOLSA, PERCTXREG, PERCDEVN, PERCDEVD)'
      'values'
      
        '  (:IDPARAMBMF, :IDTIPOINVESTIDOR, :DATAVIGENCIA, :PERCTOBN, :PE' +
        'RCTOBD, '
      '   :PERCLIQ, :PERCTXBOLSA, :PERCTXREG, :PERCDEVN, :PERCDEVD)')
    DeleteSQL.Strings = (
      'delete from PARAMBMF'
      'where'
      '  IDPARAMBMF = :OLD_IDPARAMBMF')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVESTIDOR.DESCTPINVESTIDOR'
      'PARAMBMF.DATAVIGENCIA')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Investidor'
      'Data de Vigência')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMBMF'
      'TIPOINVESTIDOR')
    CamposChave.Strings = (
      'PARAMBMF.IDPARAMBMF')
    Filtro.Strings = (
      'PARAMBMF.IDTIPOINVESTIDOR = TIPOINVESTIDOR.IDTIPOINVESTIDOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  PB.IDPARAMBMF,'
      '  PB.IDTIPOINVESTIDOR,'
      '  PB.DATAVIGENCIA,'
      '  PB.PERCTOBN,'
      '  PB.PERCTOBD,'
      '  PB.PERCLIQ,'
      '  PB.PERCTXBOLSA,'
      '  PB.PERCTXREG,'
      '  PB.PERCDEVN,'
      '  PB.PERCDEVD'
      'FROM'
      '  PARAMBMF PB, PARAMINVEST PIN'
      'WHERE'
      '  PB.IDTIPOINVESTIDOR = PIN.IDTIPOINVESTIDOR AND'
      '  PB.IDPARAMBMF = :P_IDPARAMBMF')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDPARAMBMF'
        ParamType = ptUnknown
      end>
    object qryIDPARAMBMF: TFloatField
      FieldName = 'IDPARAMBMF'
      Origin = 'PARAMBMF.IDPARAMBMF'
    end
    object qryIDTIPOINVESTIDOR: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'PARAMBMF.IDTIPOINVESTIDOR'
    end
    object qryDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
      Origin = 'PARAMBMF.DATAVIGENCIA'
    end
    object qryPERCTOBN: TFloatField
      FieldName = 'PERCTOBN'
      Origin = 'PARAMBMF.PERCTOBN'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
    object qryPERCTOBD: TFloatField
      FieldName = 'PERCTOBD'
      Origin = 'PARAMBMF.PERCTOBD'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
    object qryPERCLIQ: TFloatField
      FieldName = 'PERCLIQ'
      Origin = 'PARAMBMF.PERCLIQ'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
    object qryPERCTXBOLSA: TFloatField
      FieldName = 'PERCTXBOLSA'
      Origin = 'PARAMBMF.PERCTXBOLSA'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
    object qryPERCTXREG: TFloatField
      FieldName = 'PERCTXREG'
      Origin = 'PARAMBMF.PERCTXREG'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
    object qryPERCDEVN: TFloatField
      FieldName = 'PERCDEVN'
      Origin = 'PARAMBMF.PERCDEVN'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
    object qryPERCDEVD: TFloatField
      FieldName = 'PERCDEVD'
      Origin = 'PARAMBMF.PERCDEVD'
      DisplayFormat = ',##0.0000'
      EditFormat = '0'
    end
  end
  object qryTipoInvestidor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      TI.IDTIPOINVESTIDOR,'
      '      TI.DESCTPINVESTIDOR'
      'FROM'
      '      TIPOINVESTIDOR TI,'
      '      PARAMINVEST PI'
      'WHERE'
      '      TI.IDTIPOINVESTIDOR=PI.IDTIPOINVESTIDOR')
    ValidateWithMask = True
    Left = 48
    Top = 88
    object qryTipoInvestidorDESCTPINVESTIDOR: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTPINVESTIDOR'
      Origin = 'TIPOINVESTIDOR.DESCTPINVESTIDOR'
      Size = 60
    end
    object qryTipoInvestidorIDTIPOINVESTIDOR: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'TIPOINVESTIDOR.IDTIPOINVESTIDOR'
      Visible = False
    end
  end
end
