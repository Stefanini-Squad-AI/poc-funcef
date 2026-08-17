inherited frmOperGarantiaBMF: TfrmOperGarantiaBMF
  Left = 359
  Top = 161
  Caption = 'Controle de Garantias de BM&F'
  ClientHeight = 475
  ClientWidth = 372
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 372
    Height = 389
    inherited Bevel2: TBevel
      Width = 370
    end
    object lblTipoInvest: TLabel [1]
      Left = 16
      Top = 139
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object lblOperacao: TLabel [2]
      Left = 16
      Top = 56
      Width = 105
      Height = 13
      Caption = 'Data da Operação'
    end
    object lblValor: TLabel [3]
      Left = 16
      Top = 265
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object lblInvestimento: TLabel [4]
      Left = 16
      Top = 181
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object lblTipoOper: TLabel [5]
      Left = 16
      Top = 97
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
    end
    object lblQuantidade: TLabel [6]
      Left = 168
      Top = 265
      Width = 66
      Height = 13
      Caption = 'Quantidade'
    end
    object Label1: TLabel [7]
      Left = 16
      Top = 225
      Width = 33
      Height = 13
      Caption = 'Saldo'
    end
    object lblSldQuantidade: TLabel [8]
      Left = 168
      Top = 225
      Width = 66
      Height = 13
      Caption = 'Quantidade'
    end
    object Label2: TLabel [9]
      Left = 16
      Top = 307
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    inherited pnlTitulo: TPanel
      Width = 370
      inherited lbNomItem: TfcLabel
        Width = 314
        Caption = 'Operações de Garantia de BM&F'
      end
    end
    object dtOperacao: TCMDateTimePicker
      Left = 16
      Top = 72
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAOPERACAO'
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
    object dbreQuantidade: TDBRealEdit
      Left = 168
      Top = 281
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDOPERACAO'
      DataSource = ds
    end
    object dblkTipoInvest: TwwDBLookupCombo
      Left = 16
      Top = 155
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'60'#9'Tipo de Investimento'#9'F')
      DataField = 'IDTIPOINVEST'
      DataSource = ds
      LookupTable = QryTipoInvest
      LookupField = 'IDTIPOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblkTipoInvestExit
    end
    object dblkTipoOper: TwwDBLookupCombo
      Left = 16
      Top = 112
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'#9'F')
      DataField = 'IDTIPOOPERACAO'
      DataSource = ds
      LookupTable = QryTipoOperacao
      LookupField = 'IDTIPOOPERACAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblkInvestimento: TwwDBLookupCombo
      Left = 16
      Top = 196
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
      DataField = 'IDINVESTIMENTO'
      DataSource = ds
      LookupTable = QryInvestimento
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbreSldValor: TDBRealEdit
      Left = 16
      Top = 241
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 10
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'SLDVLROPERACAO'
      DataSource = ds
    end
    object dbreSldQtd: TDBRealEdit
      Left = 168
      Top = 241
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 11
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'SLDQTDOPERACAO'
      DataSource = ds
    end
    object dblkFundoInvest: TwwDBLookupCombo
      Left = 16
      Top = 196
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCFUNDOINVEST'#9'60'#9'Fundo de Investimento'#9'F')
      DataField = 'IDFUNDOINVEST'
      DataSource = ds
      LookupTable = QryFundoInvest
      LookupField = 'IDFUNDOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblkCartaFianca: TwwDBLookupCombo
      Left = 16
      Top = 196
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTAFIANCA'#9'60'#9'Carta de Fiança'#9'F')
      DataField = 'IDCARTAFIANCA'
      DataSource = ds
      LookupTable = QryCartaFianca
      LookupField = 'IDCARTAFIANCA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblkCartaFiancaExit
    end
    object dblkOperRenfix: TwwDBLookupCombo
      Left = 16
      Top = 196
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
      DataField = 'IDCARTAFIANCA'
      DataSource = ds
      LookupTable = QryOperRenFix
      LookupField = 'IDOPERRENFIX'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbreValor: TDBRealEdit
      Left = 16
      Top = 281
      Width = 137
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
      DataField = 'VLROPERACAO'
      DataSource = ds
    end
    object dbmObservacao: TDBMemo
      Left = 16
      Top = 322
      Width = 345
      Height = 58
      DataField = 'OBSERVACAO'
      DataSource = ds
      TabOrder = 12
    end
  end
  inherited Dock972: TDock97
    Width = 372
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      object sbtnBuscaSaldos: TToolbarButton97
        Left = 240
        Top = 0
        Width = 84
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Saldo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = sbtnBuscaSaldosClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 372
    inherited tb97Fundo: TToolbar97
      Left = 200
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 31
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERGARANTIABMF'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  IDOPERRENFIX = :IDOPERRENFIX,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTAFIANCA = :IDCARTAFIANCA,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDGARANTIA = :IDGARANTIA,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  SLDVLROPERACAO = :SLDVLROPERACAO,'
      '  SLDQTDOPERACAO = :SLDQTDOPERACAO,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDOPERGARANTIABMF = :OLD_IDOPERGARANTIABMF ')
    InsertSQL.Strings = (
      'insert into OPERGARANTIABMF'
      
        '  (IDOPERGARANTIABMF, IDFUNDOINVEST, IDOPERRENFIX, IDINVESTIMENT' +
        'O, '
      'IDCARTAFIANCA, '
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDGARANTIA, DATAOPERACAO, '
      'VLROPERACAO, '
      '   QTDOPERACAO, SLDVLROPERACAO, SLDQTDOPERACAO,'
      '  DESCINVESTIMENTO,OBSERVACAO)'
      'values'
      '  (:IDOPERGARANTIABMF, :IDFUNDOINVEST, :IDOPERRENFIX, '
      ':IDINVESTIMENTO, '
      '   :IDCARTAFIANCA, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDGARANTIA, '
      ':DATAOPERACAO, '
      '   :VLROPERACAO, :QTDOPERACAO, :SLDVLROPERACAO, '
      ':SLDQTDOPERACAO,'
      ':DESCINVESTIMENTO,:OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from OPERGARANTIABMF'
      'where'
      '  IDOPERGARANTIABMF = :OLD_IDOPERGARANTIABMF')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OPERGARANTIABMF.DATAOPERACAO'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPERGARANTIABMF.DESCINVESTIMENTO'
      'OPERGARANTIABMF.VLROPERACAO'
      'OPERGARANTIABMF.QTDOPERACAO'
      'TIPOINVEST.DESCTIPOINVEST')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Data'
      'Tipo de Operação'
      'Investimento'
      'Valor'
      'Quantidade'
      'Tipo de Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERGARANTIABMF'
      'TIPOINVEST'
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'OPERGARANTIABMF.IDOPERGARANTIABMF'
      'OPERGARANTIABMF.IDFUNDOINVEST'
      'OPERGARANTIABMF.IDINVESTIMENTO'
      'OPERGARANTIABMF.IDCARTAFIANCA'
      'OPERGARANTIABMF.IDTIPOINVEST'
      'OPERGARANTIABMF.IDTIPOOPERACAO'
      'OPERGARANTIABMF.DATAOPERACAO'
      'OPERGARANTIABMF.IDGARANTIA')
    Filtro.Strings = (
      'OPERGARANTIABMF.IDTIPOOPERACAO=TIPOOPERACAO.IDTIPOOPERACAO'
      'OPERGARANTIABMF.IDTIPOINVEST=TIPOINVEST.IDTIPOINVEST')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60'
      '10'
      '10'
      '60')
    Left = 45
    Top = 66
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDOPERGARANTIABMF,'
      '   IDFUNDOINVEST,'
      '   IDOPERRENFIX,'
      '   IDINVESTIMENTO,'
      '   IDCARTAFIANCA,'
      '   IDTIPOINVEST,'
      '   IDTIPOOPERACAO,'
      '   IDGARANTIA,'
      '   DATAOPERACAO,'
      '   VLROPERACAO,'
      '   QTDOPERACAO,'
      '   SLDVLROPERACAO,'
      '   SLDQTDOPERACAO,'
      '   DESCINVESTIMENTO,'
      '   OBSERVACAO'
      'FROM'
      '   OPERGARANTIABMF'
      'WHERE'
      '   IDOPERGARANTIABMF = :IDOPERGARANTIABMF'
      ' '
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERGARANTIABMF'
        ParamType = ptUnknown
      end>
    object qryIDOPERGARANTIABMF: TFloatField
      FieldName = 'IDOPERGARANTIABMF'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDOPERGARANTIABMF'
    end
    object qryIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDFUNDOINVEST'
    end
    object qryIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDOPERRENFIX'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDINVESTIMENTO'
    end
    object qryIDCARTAFIANCA: TFloatField
      FieldName = 'IDCARTAFIANCA'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDCARTAFIANCA'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDTIPOOPERACAO'
    end
    object qryIDGARANTIA: TFloatField
      FieldName = 'IDGARANTIA'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".IDGARANTIA'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".DATAOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".VLROPERACAO'
    end
    object qryQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".QTDOPERACAO'
    end
    object qrySLDVLROPERACAO: TFloatField
      FieldName = 'SLDVLROPERACAO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".SLDVLROPERACAO'
    end
    object qrySLDQTDOPERACAO: TFloatField
      FieldName = 'SLDQTDOPERACAO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".SLDQTDOPERACAO'
    end
    object qryDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS."CM.OPERGARANTIABMF".DESCINVESTIMENTO'
      Size = 60
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERGARANTIABMF.OBSERVACAO'
      Size = 250
    end
  end
  object QryTipoOperacao: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST=-1) AND'
      
        '   (((:IDTIPOOPERACAO IS NOT NULL) AND (IDTIPOOPERACAO = :IDTIPO' +
        'OPERACAO)) OR (:IDTIPOOPERACAO IS NULL))'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 90
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryTipoInvest: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST,DESCTIPOINVEST'
      'FROM'
      '   TIPOINVEST'
      'WHERE IDTIPOINVEST NOT IN(1,2,3,4,5,6,7,8)'
      'ORDER BY DESCTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 170
    Top = 142
    object QryTipoInvestDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object QryTipoInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDINVESTIMENTO,DESCINVESTIMENTO'
      'FROM'
      '   INVESTIMENTO'
      'WHERE'
      '   (IDTIPOINVEST = :IDTIPOINVEST) AND'
      
        '   (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO = :IDINVE' +
        'STIMENTO)) OR (:IDINVESTIMENTO IS NULL))'
      'ORDER BY IDINVESTIMENTO '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 106
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object MSBuscaSaldos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'OPERGARANTIABMF.DATAOPERACAO'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPERGARANTIABMF.DESCINVESTIMENTO'
      'OPERGARANTIABMF.VLROPERACAO'
      'OPERGARANTIABMF.QTDOPERACAO'
      'TIPOINVEST.DESCTIPOINVEST')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Data'
      'Tipo de Operação'
      'Investimento'
      'Valor'
      'Quantidade'
      'Tipo de Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERGARANTIABMF'
      'TIPOINVEST'
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'OPERGARANTIABMF.IDOPERGARANTIABMF'
      'OPERGARANTIABMF.IDFUNDOINVEST'
      'OPERGARANTIABMF.IDINVESTIMENTO'
      'OPERGARANTIABMF.IDCARTAFIANCA'
      'OPERGARANTIABMF.IDTIPOINVEST'
      'OPERGARANTIABMF.IDTIPOOPERACAO'
      'OPERGARANTIABMF.DATAOPERACAO'
      'OPERGARANTIABMF.IDGARANTIA'
      'OPERGARANTIABMF.SLDVLROPERACAO'
      'OPERGARANTIABMF.SLDQTDOPERACAO'
      'OPERGARANTIABMF.IDOPERRENFIX')
    Filtro.Strings = (
      'OPERGARANTIABMF.IDTIPOOPERACAO=TIPOOPERACAO.IDTIPOOPERACAO'
      'OPERGARANTIABMF.IDTIPOINVEST=TIPOINVEST.IDTIPOINVEST'
      'OPERGARANTIABMF.SLDVLROPERACAO > 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 125
    Top = 66
  end
  object QryFundoInvest: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDFUNDOINVEST,DESCFUNDOINVEST'
      'FROM'
      '   FUNDOINVEST'
      'WHERE'
      
        '   (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST = :IDFUNDOI' +
        'NVEST)) OR (:IDFUNDOINVEST IS NULL))'
      'ORDER BY IDFUNDOINVEST'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 186
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object QryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
  object QryCartaFianca: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTAFIANCA,DESCCARTAFIANCA'
      'FROM'
      '   CARTAFIANCA'
      'WHERE'
      '   (DATAVENCTO >= TO_DATE(:DATAVENCTO,'#39'DD/MM/YYYY'#39'))'
      'ORDER BY DESCCARTAFIANCA'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 206
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAVENCTO'
        ParamType = ptUnknown
      end>
    object QryCartaFiancaDESCCARTAFIANCA: TStringField
      DisplayLabel = 'Carta de Fiança'
      DisplayWidth = 60
      FieldName = 'DESCCARTAFIANCA'
      Origin = 'BASEDADOS.CARTAFIANCA.DESCCARTAFIANCA'
      Size = 60
    end
    object QryCartaFiancaIDCARTAFIANCA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTAFIANCA'
      Origin = 'BASEDADOS.CARTAFIANCA.IDCARTAFIANCA'
      Visible = False
    end
  end
  object QryOperRenFix: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERRENFIX,OP.VLROPERACAO,OP.QTDEOPERACAO,IV.DESCINVESTI' +
        'MENTO'
      'FROM'
      '   OPERRENFIX OP, INVESTIMENTO IV'
      'WHERE'
      
        '   (((:IDOPERRENFIX IS NOT NULL) AND (IDOPERRENFIX = :IDOPERRENF' +
        'IX)) OR (:IDOPERRENFIX IS NULL)) AND'
      '   (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 274
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
    object QryOperRenFixDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryOperRenFixIDOPERRENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERRENFIX'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIX'
      Visible = False
    end
    object QryOperRenFixVLROPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.VLROPERACAO'
      Visible = False
    end
    object QryOperRenFixQTDEOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.QTDEOPERACAO'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 202
    Top = 70
  end
  object QrySaldoCartaFianca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(CA.VLRCARTAFIANCA - X.VLRCHAMADA + X.VLRDEVOLUCAO) AS SAL' +
        'DOCHAMADA,'
      
        '   SUM(CA.VLRCARTAFIANCA + X.VLRCHAMADA - X.VLRDEVOLUCAO) AS SAL' +
        'DODEVOLUCAO'
      'FROM'
      '   (SELECT'
      
        '       NVL(SUM(DECODE(IDTIPOOPERACAO,-61, VLROPERACAO, 0 )),0) A' +
        'S VLRCHAMADA,'
      
        '       NVL(SUM(DECODE(IDTIPOOPERACAO,-62, VLROPERACAO, 0)),0) AS' +
        ' VLRDEVOLUCAO'
      '    FROM'
      '       OPERGARANTIABMF'
      '    WHERE'
      '       IDCARTAFIANCA = :IDCARTAFIANCA) X,'
      '   CARTAFIANCA CA'
      'WHERE'
      '   CA.IDCARTAFIANCA = :IDCARTAFIANCA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTAFIANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTAFIANCA'
        ParamType = ptUnknown
      end>
    object QrySaldoCartaFiancaSALDOCHAMADA: TFloatField
      FieldName = 'SALDOCHAMADA'
    end
    object QrySaldoCartaFiancaSALDODEVOLUCAO: TFloatField
      FieldName = 'SALDODEVOLUCAO'
    end
  end
  object QryBuscaIdGarantia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 98
    Top = 294
  end
end
