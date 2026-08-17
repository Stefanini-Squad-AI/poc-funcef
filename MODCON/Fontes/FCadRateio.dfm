inherited frmCadRateio: TfrmCadRateio
  Left = 105
  Top = 152
  Caption = 'Rateio de Custos por Estabelecimento'
  ClientHeight = 338
  ClientWidth = 651
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 84
    Width = 651
    Height = 215
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 7
      Width = 189
      Height = 13
      Caption = 'Empresa Adquirida ou Adquirente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 71
      Width = 176
      Height = 13
      Caption = 'Data da cisão ou incorporação'
    end
    object Label3: TLabel
      Left = 17
      Top = 104
      Width = 175
      Height = 13
      Caption = 'Período de Prescrição (meses)'
    end
    object Label10: TLabel
      Left = 206
      Top = 157
      Width = 93
      Height = 13
      Caption = 'Esquema de Rateio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 322
      Top = 165
      Width = 8
      Height = 13
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 176
      Top = 172
      Width = 145
      Height = 1
      Pen.Color = clBlue
    end
    object pnlValor: TPanel
      Left = 340
      Top = 11
      Width = 298
      Height = 193
      TabOrder = 5
      object Label7: TLabel
        Left = 35
        Top = 39
        Width = 97
        Height = 13
        Caption = 'Valor Limite (até)'
      end
      object Label8: TLabel
        Left = 182
        Top = 39
        Width = 101
        Height = 13
        Caption = 'Nosso Percentual'
      end
      object Label9: TLabel
        Left = 13
        Top = 9
        Width = 273
        Height = 13
        Caption = 'Com Base no Valor Atualizado do(s) Processo(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedPerc1V: TDBRealEdit
        Left = 207
        Top = 57
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT1'
        DataSource = ds
      end
      object dbedPerc2V: TDBRealEdit
        Left = 207
        Top = 84
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT2'
        DataSource = ds
      end
      object dbedVal1: TDBRealEdit
        Left = 21
        Top = 57
        Width = 131
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALORBASE1'
        DataSource = ds
      end
      object dbedVal2: TDBRealEdit
        Left = 21
        Top = 84
        Width = 131
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALORBASE2'
        DataSource = ds
      end
      object dbedVal3: TDBRealEdit
        Left = 21
        Top = 111
        Width = 131
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALORBASE3'
        DataSource = ds
      end
      object dbedVal4: TDBRealEdit
        Left = 21
        Top = 138
        Width = 131
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALORBASE4'
        DataSource = ds
      end
      object dbedPerc3V: TDBRealEdit
        Left = 207
        Top = 111
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT3'
        DataSource = ds
      end
      object dbedPerc4V: TDBRealEdit
        Left = 207
        Top = 138
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT4'
        DataSource = ds
      end
      object dbedVal5: TDBRealEdit
        Left = 21
        Top = 165
        Width = 131
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALORBASE5'
        DataSource = ds
      end
      object dbedPerc5V: TDBRealEdit
        Left = 207
        Top = 165
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT5'
        DataSource = ds
      end
    end
    object pnlData: TPanel
      Left = 340
      Top = 11
      Width = 298
      Height = 193
      TabOrder = 4
      object Label6: TLabel
        Left = 20
        Top = 78
        Width = 153
        Height = 13
        Caption = 'Nosso Percentual Anteriror'
      end
      object Label4: TLabel
        Left = 20
        Top = 144
        Width = 159
        Height = 13
        Caption = 'Nosso Percentual Posteriror'
      end
      object Label5: TLabel
        Left = 22
        Top = 21
        Width = 254
        Height = 13
        Caption = 'Com Base na Data da cisão ou incorporação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedPerc1: TDBRealEdit
        Left = 206
        Top = 75
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT1'
        DataSource = ds
      end
      object dbedPerc2: TDBRealEdit
        Left = 206
        Top = 141
        Width = 69
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENT2'
        DataSource = ds
      end
    end
    object dblcEntid: TwwDBLookupCombo
      Left = 17
      Top = 25
      Width = 313
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      DataField = 'IDPESSOA'
      DataSource = ds
      LookupTable = qryEntid
      LookupField = 'IDPESSOA'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbedDataBase: TCMDateTimePicker
      Left = 208
      Top = 65
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATABASE'
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
      TabOrder = 1
    end
    object dbspeAno: TwwDBSpinEdit
      Left = 208
      Top = 98
      Width = 121
      Height = 21
      Increment = 1
      DataField = 'PERIODO'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
    end
    object dbrgTipoRateio: TDBRadioGroup
      Left = 14
      Top = 131
      Width = 157
      Height = 73
      Caption = 'Tipo de Rateio'
      DataField = 'TIPORATEIO'
      DataSource = ds
      Items.Strings = (
        ' Por Data'
        ' Por Valor Individual'
        ' Por Valor Total')
      TabOrder = 3
      Values.Strings = (
        '1'
        '2'
        '3')
      OnChange = dbrgTipoRateioChange
    end
  end
  inherited Dock972: TDock97
    Width = 651
  end
  inherited Dock971: TDock97
    Top = 299
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 481
      DockPos = 497
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 314
      DockPos = 330
    end
  end
  object pnlFundoEstab: TPanel [3]
    Left = 0
    Top = 47
    Width = 651
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label12: TLabel
      Left = 13
      Top = 12
      Width = 94
      Height = 13
      Caption = 'Estabelecimento'
    end
    object dbedDescricao: TwwDBEdit
      Left = 121
      Top = 8
      Width = 517
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NOME'
      DataSource = dsEstab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDFILIALPESSOA, IDPESSOA,'
      '  DATABASE, TIPORATEIO, PERIODO, PERCENT1,'
      '  VALORBASE1, PERCENT2, VALORBASE2, PERCENT3,'
      '  VALORBASE3, PERCENT4, VALORBASE4, PERCENT5,'
      '  VALORBASE5'
      'FROM'
      '  RATEIOPROCTRAB'
      'WHERE'
      '  (IDFILIALPESSOA = :IDPESSOA)')
    Left = 270
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 41
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RATEIOPROCTRAB'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  DATABASE = :DATABASE,'
      '  TIPORATEIO = :TIPORATEIO,'
      '  PERIODO = :PERIODO,'
      '  PERCENT1 = :PERCENT1,'
      '  VALORBASE1 = :VALORBASE1,'
      '  PERCENT2 = :PERCENT2,'
      '  VALORBASE2 = :VALORBASE2,'
      '  PERCENT3 = :PERCENT3,'
      '  VALORBASE3 = :VALORBASE3,'
      '  PERCENT4 = :PERCENT4,'
      '  VALORBASE4 = :VALORBASE4,'
      '  PERCENT5 = :PERCENT5,'
      '  VALORBASE5 = :VALORBASE5'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    InsertSQL.Strings = (
      'insert into RATEIOPROCTRAB'
      
        '  (IDFILIALPESSOA, IDPESSOA, DATABASE, TIPORATEIO, PERIODO, PERC' +
        'ENT1, VALORBASE1, '
      
        '   PERCENT2, VALORBASE2, PERCENT3, VALORBASE3, PERCENT4, VALORBA' +
        'SE4, PERCENT5, '
      '   VALORBASE5)'
      'values'
      
        '  (:IDFILIALPESSOA, :IDPESSOA, :DATABASE, :TIPORATEIO, :PERIODO,' +
        ' :PERCENT1, '
      
        '   :VALORBASE1, :PERCENT2, :VALORBASE2, :PERCENT3, :VALORBASE3, ' +
        ':PERCENT4, '
      '   :VALORBASE4, :PERCENT5, :VALORBASE5)')
    DeleteSQL.Strings = (
      'delete from RATEIOPROCTRAB'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Estabelecimentos'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FILIALPESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39
      'FILIALPESSOA.IDFILIALPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 603
    Top = 28
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 603
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 603
    Top = 1
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, P.NOME'
      'FROM'
      '  PESSOA P, FORNSERV F'
      'WHERE'
      '  (F.IDPESSOA = P.IDPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 485
    Top = 1
  end
  object dsEstab: TwwDataSource
    AutoEdit = False
    DataSet = qryEstab
    Left = 418
    Top = 1
  end
  object qryEstab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, NOME'
      'FROM'
      '  PESSOA'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 376
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
