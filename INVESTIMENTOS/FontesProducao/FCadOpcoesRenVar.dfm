inherited frmCadOpcoesRenVar: TfrmCadOpcoesRenVar
  Left = 306
  Top = 191
  HelpContext = 790069
  ClientHeight = 453
  ClientWidth = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 367
    inherited Bevel2: TBevel
      Width = 356
    end
    object lblInvestimento: TLabel [1]
      Left = 19
      Top = 57
      Width = 89
      Height = 13
      Caption = 'Série da Opção'
    end
    object lblEmissor: TLabel [2]
      Left = 19
      Top = 99
      Width = 44
      Height = 13
      Caption = 'Emissor'
    end
    object lblPuExerc: TLabel [3]
      Left = 142
      Top = 223
      Width = 110
      Height = 13
      Caption = 'Preço de Exercício'
    end
    object lblDtVencto: TLabel [4]
      Left = 20
      Top = 223
      Width = 116
      Height = 13
      Caption = 'Data de Vencimento'
    end
    object lblLote: TLabel [5]
      Left = 257
      Top = 223
      Width = 26
      Height = 13
      Caption = 'Lote'
    end
    object lblBolsa: TLabel [6]
      Left = 19
      Top = 142
      Width = 96
      Height = 13
      Caption = 'Bolsa de Valores'
    end
    object lblAtivoBase: TLabel [7]
      Left = 19
      Top = 183
      Width = 62
      Height = 13
      Caption = 'Ativo Base'
    end
    inherited pnlTitulo: TPanel
      Width = 356
      inherited lbNomItem: TfcLabel
        Width = 78
        Caption = 'Opções'
      end
    end
    object dbeInvestimento: TDBEdit
      Left = 19
      Top = 73
      Width = 319
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCINVESTIMENTO'
      DataSource = ds
      TabOrder = 1
    end
    object dblEmissor: TwwDBLookupCombo
      Left = 19
      Top = 115
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAEMISSOR'#9'30'#9'Emissor'#9'F')
      DataField = 'IDEMISSOR'
      DataSource = ds
      LookupTable = qryEmissor
      LookupField = 'IDEMISSOR'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblEmissorExit
    end
    object dbrVlrExercicio: TDBRealEdit
      Left = 141
      Top = 238
      Width = 108
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRPRECOEX'
      DataSource = dsOpcao
    end
    object dbdDataVencto: TCMDateTimePicker
      Left = 19
      Top = 238
      Width = 116
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DTAVENCTO'
      DataSource = dsOpcao
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
      TabOrder = 5
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbrLote: TDBRealEdit
      Left = 256
      Top = 238
      Width = 82
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDELOTE'
      DataSource = dsAcaoXBolsa
    end
    object dblkBolsa: TwwDBLookupCombo
      Left = 19
      Top = 158
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'10'#9'Bolsa de Valores'#9'F')
      DataField = 'IDBOLSAVALORES'
      DataSource = ds
      LookupTable = qryBolsa
      LookupField = 'IDBOLSAVALORES'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblkBolsaExit
    end
    object dblAtivoBase: TwwDBLookupCombo
      Left = 19
      Top = 199
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
      DataField = 'IDINVESTBASE'
      DataSource = ds
      LookupTable = qryAtivoBase
      LookupField = 'IDINVESTIMENTO'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbrdStaTipoOpcao: TDBRadioGroup
      Left = 20
      Top = 264
      Width = 320
      Height = 41
      Caption = 'Tipo de Opção'
      Columns = 2
      DataField = 'STAOPCCOMPRA'
      DataSource = dsOpcao
      Items.Strings = (
        'Compra'
        'Venda')
      TabOrder = 8
      Values.Strings = (
        'S'
        'N')
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 20
      Top = 306
      Width = 320
      Height = 41
      Caption = 'Tipo de Exercício'
      Columns = 2
      DataField = 'STATPAMERICANA'
      DataSource = dsOpcao
      Items.Strings = (
        'Americana'
        'Européia')
      TabOrder = 9
      Values.Strings = (
        'S'
        'N')
    end
  end
  inherited Dock972: TDock97
    Width = 358
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 186
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 17
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 244
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 134
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDMOEDACONTAB = :IDMOEDACONTAB,'
      '  FLGATIVO = :FLGATIVO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (IDINVESTIMENTO, DESCINVESTIMENTO, IDEMISSOR, IDTIPOINVEST, '
      'STAOPCAO,IDMOEDACONTAB,FLGATIVO)'
      'values'
      
        '  (:IDINVESTIMENTO, :DESCINVESTIMENTO, :IDEMISSOR, :IDTIPOINVEST' +
        ', '
      ':STAOPCAO,:IDMOEDACONTAB,:FLGATIVO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 162
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPCOES.DTAVENCTO'
      'OPCOES.VLRPRECOEX'
      'EMISSOR.SIGLAEMISSOR')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Série'
      'Data de Vencimento'
      'Preço de Exercício'
      'Emissor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVESTIMENTO'
      'OPCOES'
      'EMISSOR')
    CamposChave.Strings = (
      'INVESTIMENTO.IDINVESTIMENTO'
      'OPCOES.IDOPCAO')
    Filtro.Strings = (
      'INVESTIMENTO.IDTIPOINVEST = 2'
      'OPCOES.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO'
      'INVESTIMENTO.IDEMISSOR = EMISSOR.IDEMISSOR'
      'INVESTIMENTO.STAOPCAO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '18'
      '10'
      '15')
    Left = 291
  end
  inherited ImlPadrao: TImageList
    Left = 251
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 261
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, IV.IDEMISSOR,'
      '   IV.IDTIPOINVEST,   IV.STAOPCAO,         OP.IDBOLSAVALORES,'
      '   OP.IDINVESTBASE, IV.IDMOEDACONTAB,IV.FLGATIVO'
      'FROM'
      '   INVESTIMENTO IV, OPCOES OP'
      'WHERE'
      '   (IV.IDTIPOINVEST = 2)'
      '   AND (IV.STAOPCAO = '#39'S'#39')'
      '   AND (IV.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '   AND (IV.IDINVESTIMENTO = OP.IDINVESTIMENTO)'
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.INVESTIMENTO.IDTIPOINVEST'
    end
    object qrySTAOPCAO: TStringField
      FieldName = 'STAOPCAO'
      Origin = 'BASEDADOS.INVESTIMENTO.STAOPCAO'
      FixedChar = True
      Size = 1
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.OPCOES.IDBOLSAVALORES'
    end
    object qryIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
      Origin = 'BASEDADOS.OPCOES.IDINVESTBASE'
    end
    object qryIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'BASEDADOS.INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.INVESTIMENTO.FLGATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSOR, SIGLAEMISSOR'
      'FROM   EMISSOR'
      'ORDER BY SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 292
    Top = 154
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 30
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
  object updOpcao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPCOES'
      'set'
      '  DTAVENCTO = :DTAVENCTO,'
      '  VLRPRECOEX = :VLRPRECOEX,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDINVESTBASE = :IDINVESTBASE,'
      '  STATPAMERICANA = :STATPAMERICANA,'
      '  STAOPCCOMPRA = :STAOPCCOMPRA'
      'where'
      '  IDOPCAO = :OLD_IDOPCAO')
    InsertSQL.Strings = (
      'insert into OPCOES'
      
        '  (IDOPCAO, IDINVESTIMENTO, DTAVENCTO, VLRPRECOEX,IDBOLSAVALORES' +
        ','
      'IDINVESTBASE,STATPAMERICANA,STAOPCCOMPRA,IDTIPOOPCAO)'
      'values'
      '  (:IDOPCAO, :IDINVESTIMENTO, :DTAVENCTO, '
      ':VLRPRECOEX,:IDBOLSAVALORES,:IDINVESTBASE,:STATPAMERICANA,'
      ':STAOPCCOMPRA,:IDTIPOOPCAO)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from OPCOES'
      'where'
      '  IDOPCAO = :OLD_IDOPCAO')
    Left = 252
    Top = 55
  end
  object qryOpcao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.IDOPCAO, OP.IDINVESTIMENTO, OP.DTAVENCTO,'
      '   OP.VLRPRECOEX, OP.IDBOLSAVALORES, OP.IDINVESTBASE,'
      '   OP.STATPAMERICANA,OP.STAOPCCOMPRA, OP.IDTIPOOPCAO'
      'FROM'
      '   OPCOES OP, INVESTIMENTO IV'
      'WHERE'
      '   (OP.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '   AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ' '
      ' ')
    UpdateObject = updOpcao
    ValidateWithMask = True
    Left = 196
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryOpcaoIDOPCAO: TFloatField
      FieldName = 'IDOPCAO'
      Origin = 'BASEDADOS.OPCOES.IDOPCAO'
    end
    object qryOpcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPCOES.IDINVESTIMENTO'
    end
    object qryOpcaoDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
      Origin = 'BASEDADOS.OPCOES.DTAVENCTO'
    end
    object qryOpcaoVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
      Origin = 'BASEDADOS.OPCOES.VLRPRECOEX'
    end
    object qryOpcaoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.OPCOES.IDBOLSAVALORES'
    end
    object qryOpcaoIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
      Origin = 'BASEDADOS.OPCOES.IDINVESTBASE'
    end
    object qryOpcaoSTATPAMERICANA: TStringField
      FieldName = 'STATPAMERICANA'
      Origin = 'BASEDADOS.OPCOES.STATPAMERICANA'
      FixedChar = True
      Size = 1
    end
    object qryOpcaoSTAOPCCOMPRA: TStringField
      FieldName = 'STAOPCCOMPRA'
      Origin = 'BASEDADOS.OPCOES.STAOPCCOMPRA'
      FixedChar = True
      Size = 1
    end
    object qryOpcaoIDTIPOOPCAO: TFloatField
      FieldName = 'IDTIPOOPCAO'
      Origin = 'BASEDADOS.OPCOES.IDTIPOOPCAO'
    end
  end
  object dsOpcao: TwwDataSource
    AutoEdit = False
    DataSet = qryOpcao
    Left = 224
    Top = 55
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 322
    Top = 2
  end
  object qryAcao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDACAO'
      'FROM'
      '   ACAO')
    UpdateObject = UpdAcao
    ValidateWithMask = True
    Left = 252
    Top = 96
    object qryAcaoIDACAO: TFloatField
      FieldName = 'IDACAO'
      Origin = 'BASEDADOS.ACAO.IDACAO'
    end
  end
  object dsAcao: TwwDataSource
    AutoEdit = False
    DataSet = qryAcao
    Left = 280
    Top = 96
  end
  object UpdAcao: TUpdateSQL
    ModifySQL.Strings = (
      'update ACAO'
      'set'
      '  IDACAO = :IDACAO'
      'where'
      '  IDACAO = :OLD_IDACAO')
    InsertSQL.Strings = (
      'insert into ACAO'
      '  (IDACAO)'
      'values'
      '  (:IDACAO)')
    DeleteSQL.Strings = (
      'delete from ACAO'
      'where'
      '  IDACAO = :OLD_IDACAO')
    Left = 308
    Top = 96
  end
  object qryAcaoXBolsa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDEMISSOR, IDBOLSAVALORES,IDACAO,QTDELOTE,'
      '   SIGLAACAOBOLSA,MOECODIGO'
      'FROM'
      '   ACOESXBOLSA'
      'WHERE'
      
        '   (((:IDEMISSOR IS NOT NULL) AND (IDEMISSOR = :IDEMISSOR )) OR ' +
        '(:IDEMISSOR IS NULL)) AND'
      
        '   (((:IDBOLSAVALORES IS NOT NULL) AND (IDBOLSAVALORES = :IDBOLS' +
        'AVALORES )) OR (:IDBOLSAVALORES IS NULL)) AND'
      
        '   (((:IDACAO IS NOT NULL) AND (IDACAO = :IDACAO )) OR (:IDACAO ' +
        'IS NULL))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = UpdAcaoXBolsa
    ValidateWithMask = True
    Left = 148
    Top = 106
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDACAO'
        ParamType = ptUnknown
      end>
    object qryAcaoXBolsaIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.ACOESXBOLSA.IDEMISSOR'
    end
    object qryAcaoXBolsaIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.ACOESXBOLSA.IDBOLSAVALORES'
    end
    object qryAcaoXBolsaIDACAO: TFloatField
      FieldName = 'IDACAO'
      Origin = 'BASEDADOS.ACOESXBOLSA.IDACAO'
    end
    object qryAcaoXBolsaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'BASEDADOS.ACOESXBOLSA.QTDELOTE'
    end
    object qryAcaoXBolsaSIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Origin = 'BASEDADOS.ACOESXBOLSA.SIGLAACAOBOLSA'
      Size = 10
    end
    object qryAcaoXBolsaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.ACOESXBOLSA.MOECODIGO'
    end
  end
  object dsAcaoXBolsa: TwwDataSource
    AutoEdit = False
    DataSet = qryAcaoXBolsa
    Left = 176
    Top = 106
  end
  object UpdAcaoXBolsa: TUpdateSQL
    ModifySQL.Strings = (
      'update ACOESXBOLSA'
      'set'
      '  QTDELOTE = :QTDELOTE,'
      '  SIGLAACAOBOLSA = :SIGLAACAOBOLSA,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES'
      'where'
      '  IDEMISSOR = :OLD_IDEMISSOR and'
      '  IDBOLSAVALORES = :OLD_IDBOLSAVALORES and'
      '  IDACAO = :OLD_IDACAO')
    InsertSQL.Strings = (
      'insert into ACOESXBOLSA'
      '  (IDEMISSOR, IDBOLSAVALORES, IDACAO, QTDELOTE, '
      'SIGLAACAOBOLSA,MOECODIGO)'
      'values'
      '  (:IDEMISSOR, :IDBOLSAVALORES, :IDACAO, :QTDELOTE, '
      ':SIGLAACAOBOLSA,:MOECODIGO)')
    DeleteSQL.Strings = (
      'delete from ACOESXBOLSA'
      'where'
      '  IDEMISSOR = :OLD_IDEMISSOR and'
      '  IDBOLSAVALORES = :OLD_IDBOLSAVALORES and'
      '  IDACAO = :OLD_IDACAO')
    Left = 204
    Top = 106
  end
  object qryBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES, SGLBOLSAVALORES'
      'FROM'
      '   BOLSAVALORES'
      'WHERE'
      
        '   (((:IDBOLSAVALORES IS NOT NULL) AND (IDBOLSAVALORES <> :IDBOL' +
        'SAVALORES )) OR (:IDBOLSAVALORES IS NULL))'
      'ORDER BY SGLBOLSAVALORES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 292
    Top = 197
    ParamData = <
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
  object qryAtivoBase: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IV.DESCINVESTIMENTO, IV.IDINVESTIMENTO'
      'FROM'
      '   ACOESXBOLSA AC, INVESTIMENTO IV'
      'WHERE'
      '   (AC.IDEMISSOR = :IDEMISSOR) AND'
      '   (AC.IDBOLSAVALORES = :IDBOLSAVALORES) AND'
      '   (IV.IDTIPOINVEST=2) AND'
      '   ((IV.STAOPCAO <> '#39'S'#39') OR (IV.STAOPCAO IS NULL))  AND'
      '   AC.IDACAO = IV.IDINVESTIMENTO')
    ValidateWithMask = True
    Left = 292
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object qryAtivoBaseDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryAtivoBaseIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
end
