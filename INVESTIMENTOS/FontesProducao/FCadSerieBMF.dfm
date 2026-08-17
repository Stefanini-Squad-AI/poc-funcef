inherited frmCadSerieBMF: TfrmCadSerieBMF
  Left = 279
  Top = 160
  HelpContext = 790144
  Caption = 'Cadastro de Séries de BM&F'
  ClientHeight = 238
  ClientWidth = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 467
    Height = 152
    object Label13: TLabel
      Left = 16
      Top = 54
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object lblSerie: TLabel
      Left = 16
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Série'
    end
    object lblDataVencimento: TLabel
      Left = 16
      Top = 96
      Width = 98
      Height = 13
      Caption = 'Data Vencimento'
    end
    object lblPrecoExerc: TLabel
      Left = 160
      Top = 96
      Width = 110
      Height = 13
      Caption = 'Preço de Exercício'
    end
    object dblTipoContratoInvest: TwwDBLookupCombo
      Left = 16
      Top = 70
      Width = 329
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOCTINVEST'#9'60'#9'Tipo de Contrato')
      DataField = 'IDTIPOCONTRINVEST'
      DataSource = ds
      LookupTable = QryTipoContrato
      LookupField = 'IDTIPOCONTRINVEST'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeSerie: TDBEdit
      Left = 15
      Top = 24
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCINVESTIMENTO'
      DataSource = ds
      TabOrder = 0
    end
    object dbdDataVencimento: TCMDateTimePicker
      Left = 16
      Top = 112
      Width = 119
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAVENCIMENTO'
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
    end
    object dbePrecoExerc: TDBRealEdit
      Left = 160
      Top = 112
      Width = 118
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PRECOEXERC'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 467
  end
  inherited Dock971: TDock97
    Top = 199
    Width = 467
    inherited tb97Fundo: TToolbar97
      Left = 195
      DockPos = 195
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 26
      DockPos = 26
    end
  end
  inherited ds: TwwDataSource
    Left = 285
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SERIESBMF'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  PRECOEXERC = :PRECOEXERC'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDTIPOCONTRINVEST = :OLD_IDTIPOCONTRINVEST')
    InsertSQL.Strings = (
      'insert into SERIESBMF'
      
        '  (IDINVESTIMENTO, IDTIPOCONTRINVEST, DATAVENCIMENTO, PRECOEXERC' +
        ')'
      'values'
      
        '  (:IDINVESTIMENTO, :IDTIPOCONTRINVEST, :DATAVENCIMENTO, :PRECOE' +
        'XERC)')
    DeleteSQL.Strings = (
      'delete from SERIESBMF'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDTIPOCONTRINVEST = :OLD_IDTIPOCONTRINVEST')
    Left = 225
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      'SERIESBMF.DATAVENCIMENTO'
      'SERIESBMF.PRECOEXERC')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Série'
      'Contrato'
      'Vencimento'
      'Preço de Execício')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCONTRINVEST'
      'SERIESBMF'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'INVESTIMENTO.IDINVESTIMENTO'
      'SERIESBMF.IDTIPOCONTRINVEST'
      'SERIESBMF.DATAVENCIMENTO')
    Filtro.Strings = (
      'INVESTIMENTO.IDINVESTIMENTO = SERIESBMF.IDINVESTIMENTO'
      'SERIESBMF.IDTIPOCONTRINVEST = TIPOCONTRINVEST.IDTIPOCONTRINVEST')
    Mascaras.Strings = (
      ''
      ''
      ''
      ',##0.00')
    Larguras.Strings = (
      '60'
      '60'
      '10'
      '10')
    Left = 325
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      INV.IDINVESTIMENTO,'
      '      INV.IDMOEDACONTAB,'
      '      INV.IDEMISSOR,'
      '      INV.DESCINVESTIMENTO,'
      '      INV.IDTIPOINVEST,'
      '      SER.IDTIPOCONTRINVEST,'
      '      SER.DATAVENCIMENTO,'
      '      SER.PRECOEXERC'
      'FROM'
      '      INVESTIMENTO INV, SERIESBMF SER'
      'WHERE'
      '   INV.IDINVESTIMENTO = :P_IDINVESTIMENTO AND'
      '   INV.IDINVESTIMENTO = SER.IDINVESTIMENTO AND'
      '   SER.IDTIPOCONTRINVEST = :P_IDTIPOCONTRINVEST AND'
      '   INV.IDTIPOINVEST = 8'
      '')
    Left = 255
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'P_IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object qryDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object qryIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'SERIESBMF.IDTIPOCONTRINVEST'
    end
    object qryDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'SERIESBMF.DATAVENCIMENTO'
    end
    object qryPRECOEXERC: TFloatField
      FieldName = 'PRECOEXERC'
      Origin = 'SERIESBMF.PRECOEXERC'
    end
  end
  object QryTipoContrato: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      DESCTIPOCTINVEST,'
      '      IDTIPOCONTRINVEST,'
      '      IDTIPOINVEST'
      'FROM '
      '      TIPOCONTRINVEST'
      'WHERE '
      '      IDTIPOINVEST = 8'
      'ORDER BY'
      '      DESCTIPOCTINVEST')
    ValidateWithMask = True
    Left = 135
    Top = 88
    object QryTipoContratoDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 60
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      Size = 60
    end
    object QryTipoContratoIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = '"CM.TIPOCONTRINVEST".IDTIPOCONTRINVEST'
      Visible = False
    end
    object QryTipoContratoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.TIPOCONTRINVEST".IDTIPOINVEST'
      Visible = False
    end
  end
  object updFilha: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDMOEDACONTAB = :IDMOEDACONTAB,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      
        '  (IDINVESTIMENTO, IDMOEDACONTAB, IDEMISSOR, IDTIPOINVEST, DESCI' +
        'NVESTIMENTO)'
      'values'
      
        '  (:IDINVESTIMENTO, :IDMOEDACONTAB, :IDEMISSOR, :IDTIPOINVEST, :' +
        'DESCINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 209
    Top = 56
  end
  object qryFilha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDINVESTIMENTO,'
      '      IDMOEDACONTAB,'
      '      IDEMISSOR,'
      '      IDTIPOINVEST,'
      '      DESCINVESTIMENTO'
      'FROM'
      '      INVESTIMENTO'
      'WHERE'
      '      IDINVESTIMENTO =:P_IDINVESTIMENTO'
      '')
    UpdateObject = updFilha
    ValidateWithMask = True
    Left = 255
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryFilhaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryFilhaIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryFilhaIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object qryFilhaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object qryFilhaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
  end
  object dsFilha: TwwDataSource
    AutoEdit = False
    DataSet = qryFilha
    Left = 309
    Top = 56
  end
end
