inherited frmCadIR: TfrmCadIR
  Left = 262
  Top = 137
  HelpContext = 790136
  Caption = 'Cadastro de IR'
  ClientHeight = 412
  ClientWidth = 393
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 16
    Top = 192
    Width = 195
    Height = 13
    Caption = 'Descrição do tipo de Investimento'
  end
  object Label6: TLabel [1]
    Left = 22
    Top = 140
    Width = 178
    Height = 13
    Caption = 'Descrição do tipo de Operação'
  end
  inherited pnlFundo: TPanel
    Width = 393
    Height = 326
    object lblTipoInv: TLabel
      Left = 14
      Top = 84
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object Label4: TLabel
      Left = 14
      Top = 229
      Width = 99
      Height = 13
      Caption = 'Data da Vigência'
    end
    object Label5: TLabel
      Left = 14
      Top = 278
      Width = 49
      Height = 13
      Caption = 'Alíquota'
    end
    object lblTipoOper: TLabel
      Left = 14
      Top = 132
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
    end
    object Label7: TLabel
      Left = 14
      Top = 179
      Width = 97
      Height = 13
      Caption = 'Tipo de Mercado'
    end
    object rgpTipo: TRadioGroup
      Left = 14
      Top = 13
      Width = 363
      Height = 60
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Investimento'
        'Operação')
      TabOrder = 0
      OnClick = rgpTipoClick
    end
    object dbLInvest: TwwDBLookupCombo
      Left = 14
      Top = 100
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'40'#9'Descrição')
      DataField = 'IDTIPOINVEST'
      DataSource = ds
      LookupTable = qryTipoInvestimento
      LookupField = 'IDTIPOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbdDtaRef: TCMDateTimePicker
      Left = 14
      Top = 245
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DTREF'
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
    end
    object dbrAliquota: TDBRealEdit
      Left = 14
      Top = 293
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
      DataField = 'ALIQUOTA'
      DataSource = ds
    end
    object dbLOperacao: TwwDBLookupCombo
      Left = 14
      Top = 148
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'40'#9'Descrição')
      DataField = 'IDTIPOOPERACAO'
      DataSource = ds
      LookupTable = qryTipoOperacao
      LookupField = 'IDTIPOOPERACAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblMercado: TwwDBLookupCombo
      Left = 14
      Top = 196
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCMERCADO'#9'40'#9'Descrição')
      DataField = 'IDMERCADO'
      DataSource = ds
      LookupTable = qryTipoMercado
      LookupField = 'IDMERCADO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 393
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 393
    inherited tb97Fundo: TToolbar97
      Left = 219
      DockPos = 219
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 50
      DockPos = 50
    end
  end
  inherited ds: TwwDataSource
    Left = 325
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TABELAIR'
      'set'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  IDTABELAIR = :IDTABELAIR,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DTREF = :DTREF,'
      '  ALIQUOTA = :ALIQUOTA,'
      '  IDMERCADO = :IDMERCADO'
      'where'
      '  IDTABELAIR = :OLD_IDTABELAIR')
    InsertSQL.Strings = (
      'insert into TABELAIR'
      
        '  (CODTIPRENFIXA, IDTABELAIR, IDTIPOINVEST, IDTIPOOPERACAO, DTRE' +
        'F, '
      'ALIQUOTA, '
      '   IDMERCADO)'
      'values'
      
        '  (:CODTIPRENFIXA, :IDTABELAIR, :IDTIPOINVEST, :IDTIPOOPERACAO, ' +
        ':DTREF, '
      '   :ALIQUOTA, :IDMERCADO)')
    DeleteSQL.Strings = (
      'delete from TABELAIR'
      'where'
      '  IDTABELAIR = :OLD_IDTABELAIR')
    Left = 240
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVEST.DESCTIPOINVEST'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'MERCADO.DESCMERCADO'
      'TABELAIR.DTREF'
      'TABELAIR.ALIQUOTA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Tipo de Investimento'
      'Tipo de Operação'
      'Tipo de Mercado'
      'Data de Vigência'
      'Alíquota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TABELAIR'
      'TIPOINVEST'
      'TIPOOPERACAO'
      'MERCADO')
    CamposChave.Strings = (
      'TABELAIR.IDTABELAIR'
      'TABELAIR.IDTIPOOPERACAO'
      'TABELAIR.IDTIPOINVEST')
    Filtro.Strings = (
      'TABELAIR.IDTIPOINVEST   = TIPOINVEST.IDTIPOINVEST     (+)'
      'TABELAIR.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO (+)'
      'TABELAIR.IDMERCADO      = MERCADO.IDMERCADO           (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '40'
      '10'
      '10')
    Left = 165
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   CODTIPRENFIXA,'
      '   IDTABELAIR,'
      '   IDTIPOINVEST,'
      '   IDTIPOOPERACAO,'
      '   DTREF,'
      '   ALIQUOTA,'
      '   IDMERCADO'
      'FROM'
      '   TABELAIR'
      'WHERE'
      '   IDTABELAIR = :IDTABELAIR   '
      '          ')
    Left = 287
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTABELAIR'
        ParamType = ptUnknown
      end>
    object qryIDTABELAIR: TFloatField
      FieldName = 'IDTABELAIR'
      Origin = 'TABELAIR.IDTABELAIR'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TABELAIR.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TABELAIR.IDTIPOOPERACAO'
    end
    object qryDTREF: TDateTimeField
      FieldName = 'DTREF'
      Origin = 'TABELAIR.DTREF'
    end
    object qryALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'TABELAIR.ALIQUOTA'
    end
    object qryIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TABELAIR.IDMERCADO'
    end
    object qryCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TABELAIR.CODTIPRENFIXA'
      Size = 5
    end
  end
  object qryTipoInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCTIPOINVEST,'
      '   IDTIPOINVEST'
      'FROM'
      '   TIPOINVEST'
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 296
    Top = 271
    object qryTipoInvestimentoDESCTIPOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOINVEST'
      Origin = 'TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoInvestimentoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCTIPOOPERACAO,'
      '   IDTIPOOPERACAO'
      'FROM'
      '   TIPOOPERACAO'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 184
    Top = 271
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryTipoMercado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCMERCADO,'
      '   IDMERCADO'
      'FROM'
      '   MERCADO'
      'ORDER BY DESCMERCADO')
    ValidateWithMask = True
    Left = 240
    Top = 319
    object qryTipoMercadoDESCMERCADO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCMERCADO'
      Origin = 'MERCADO.DESCMERCADO'
      Size = 60
    end
    object qryTipoMercadoIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'MERCADO.IDMERCADO'
      Visible = False
    end
  end
end
