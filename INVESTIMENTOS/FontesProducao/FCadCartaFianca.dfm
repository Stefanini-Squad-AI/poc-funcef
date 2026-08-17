inherited frmCadCartaFianca: TfrmCadCartaFianca
  Left = 421
  Top = 236
  HelpContext = 790145
  Caption = 'Carta de Fiança'
  ClientHeight = 401
  ClientWidth = 374
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 374
    Height = 315
    inherited Bevel2: TBevel
      Width = 372
    end
    object lblNrFianca: TLabel [1]
      Left = 16
      Top = 56
      Width = 60
      Height = 13
      Caption = 'Nr. Fiança'
    end
    object lblDtEmissao: TLabel [2]
      Left = 16
      Top = 182
      Width = 47
      Height = 13
      Caption = 'Emissão'
    end
    object lblDtVencto: TLabel [3]
      Left = 144
      Top = 182
      Width = 67
      Height = 13
      Caption = 'Vencimento'
    end
    object lblInstFiadora: TLabel [4]
      Left = 16
      Top = 139
      Width = 106
      Height = 13
      Caption = 'Instituição Fiadora'
    end
    object lblInstProtoc: TLabel [5]
      Left = 16
      Top = 268
      Width = 136
      Height = 13
      Caption = 'Instituição Protocolante'
    end
    object lblValor: TLabel [6]
      Left = 16
      Top = 225
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object lblDescricao: TLabel [7]
      Left = 16
      Top = 98
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    inherited pnlTitulo: TPanel
      Width = 372
      inherited lbNomItem: TfcLabel
        Width = 299
        Caption = 'Cadastro de Cartas de Fiança'
      end
    end
    object dbeNrFianca: TwwDBEdit
      Left = 16
      Top = 72
      Width = 169
      Height = 21
      DataField = 'NRCARTAFIANCA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtEmissao: TCMDateTimePicker
      Left = 16
      Top = 198
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAEMISSAO'
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
    object dtVencimento: TCMDateTimePicker
      Left = 144
      Top = 198
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAVENCTO'
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
      TabOrder = 5
    end
    object dbreValor: TDBRealEdit
      Left = 16
      Top = 241
      Width = 137
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
      DataField = 'VLRCARTAFIANCA'
      DataSource = ds
    end
    object dblkInstFiadora: TwwDBLookupCombo
      Left = 16
      Top = 156
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Instituição Fiadora'#9'F')
      DataField = 'IDINSTFIADORA'
      DataSource = ds
      LookupTable = qryContraParte
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblkInstProt: TwwDBLookupCombo
      Left = 16
      Top = 284
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Instituição Protocolante BM&F'#9'F')
      DataField = 'IDINSTPROTBMF'
      DataSource = ds
      LookupTable = qryContraParte
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeDescricao: TwwDBEdit
      Left = 16
      Top = 114
      Width = 345
      Height = 21
      DataField = 'DESCCARTAFIANCA'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 374
  end
  inherited Dock971: TDock97
    Top = 362
    Width = 374
    inherited tb97Fundo: TToolbar97
      Left = 202
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 33
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 328
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
      'update CARTAFIANCA'
      'set'
      '  IDINSTFIADORA = :IDINSTFIADORA,'
      '  IDINSTPROTBMF = :IDINSTPROTBMF,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAVENCTO = :DATAVENCTO,'
      '  VLRCARTAFIANCA = :VLRCARTAFIANCA,'
      '  NRCARTAFIANCA = :NRCARTAFIANCA,'
      '  DESCCARTAFIANCA = :DESCCARTAFIANCA'
      'where'
      '  IDCARTAFIANCA = :OLD_IDCARTAFIANCA')
    InsertSQL.Strings = (
      'insert into CARTAFIANCA'
      '  (IDCARTAFIANCA,IDINSTFIADORA, IDINSTPROTBMF, DATAEMISSAO, '
      'DATAVENCTO, VLRCARTAFIANCA, NRCARTAFIANCA,DESCCARTAFIANCA)'
      'values'
      '  (:IDCARTAFIANCA,:IDINSTFIADORA, :IDINSTPROTBMF, :DATAEMISSAO, '
      ':DATAVENCTO, :VLRCARTAFIANCA, :NRCARTAFIANCA,:DESCCARTAFIANCA)')
    DeleteSQL.Strings = (
      'delete from CARTAFIANCA'
      'where'
      '  IDCARTAFIANCA = :OLD_IDCARTAFIANCA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'CARTAFIANCA.DATAEMISSAO'
      'CARTAFIANCA.DATAVENCTO'
      'CARTAFIANCA.VLRCARTAFIANCA'
      'CARTAFIANCA.NRCARTAFIANCA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Inst. Fiadora'
      'Emissão'
      'Vencimento'
      'Valor'
      'Número')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CARTAFIANCA'
      'PESSOA')
    CamposChave.Strings = (
      'CARTAFIANCA.IDCARTAFIANCA'
      'CARTAFIANCA.DATAEMISSAO')
    Filtro.Strings = (
      'CARTAFIANCA.IDINSTFIADORA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '18'
      '18'
      '10'
      '10')
    Top = 114
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDCARTAFIANCA,'
      '   IDINSTFIADORA,'
      '   IDINSTPROTBMF,'
      '   DATAEMISSAO,'
      '   DATAVENCTO,'
      '   VLRCARTAFIANCA,'
      '   NRCARTAFIANCA,'
      '   DESCCARTAFIANCA'
      'FROM'
      '   CARTAFIANCA'
      'WHERE '
      '   IDCARTAFIANCA = :IDCARTAFIANCA'
      'ORDER BY DATAEMISSAO'
      ''
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTAFIANCA'
        ParamType = ptUnknown
      end>
    object qryIDCARTAFIANCA: TFloatField
      FieldName = 'IDCARTAFIANCA'
      Origin = 'BASEDADOS.CARTAFIANCA.IDCARTAFIANCA'
    end
    object qryIDINSTFIADORA: TFloatField
      FieldName = 'IDINSTFIADORA'
      Origin = 'BASEDADOS.CARTAFIANCA.IDINSTFIADORA'
    end
    object qryIDINSTPROTBMF: TFloatField
      FieldName = 'IDINSTPROTBMF'
      Origin = 'BASEDADOS.CARTAFIANCA.IDINSTPROTBMF'
    end
    object qryDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.CARTAFIANCA.DATAEMISSAO'
    end
    object qryDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
      Origin = 'BASEDADOS.CARTAFIANCA.DATAVENCTO'
    end
    object qryVLRCARTAFIANCA: TFloatField
      FieldName = 'VLRCARTAFIANCA'
      Origin = 'BASEDADOS.CARTAFIANCA.VLRCARTAFIANCA'
    end
    object qryNRCARTAFIANCA: TFloatField
      FieldName = 'NRCARTAFIANCA'
      Origin = 'BASEDADOS.CARTAFIANCA.NRCARTAFIANCA'
    end
    object qryDESCCARTAFIANCA: TStringField
      FieldName = 'DESCCARTAFIANCA'
      Origin = 'BASEDADOS.CARTAFIANCA.DESCCARTAFIANCA'
      Size = 60
    end
  end
  object qryContraParte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT PE.IDPESSOA, PE.NOME'
      'FROM'
      '   PESSOA PE'
      'WHERE '
      '      PE.IDPESSOA IN  (SELECT'
      '                          EM.IDEMISSOR'
      '                       FROM'
      '                          EMISSOR EM'
      '                       UNION'
      '                       SELECT'
      '                          CU.IDCUSTODIANTE'
      '                       FROM'
      '                          CUSTODIANTE CU'
      '                       UNION'
      '                       SELECT'
      '                          BV.IDBOLSAVALORES'
      '                       FROM'
      '                          BOLSAVALORES BV'
      '                       UNION'
      '                       SELECT'
      '                          CT.IDCORRETVALORES'
      '                       FROM'
      '                          CORRETVALORES CT'
      '                   )'
      'ORDER BY PE.NOME')
    ValidateWithMask = True
    Left = 178
    Top = 105
    object qryContraParteNOME: TStringField
      DisplayLabel = 'Instituição Protocolante BM&F'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryContraParteIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
  end
end
