inherited frmCadSaldoIniIrLitigio: TfrmCadSaldoIniIrLitigio
  Left = 348
  Top = 314
  Caption = 'Implantação de Saldo IR Litígio'
  ClientHeight = 388
  ClientWidth = 565
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 297
    Top = 109
    Width = 73
    Height = 13
    Caption = 'Investimento'
  end
  object Label7: TLabel [1]
    Left = 16
    Top = 200
    Width = 73
    Height = 13
    Caption = 'Investimento'
  end
  object Bevel2: TBevel [2]
    Left = 295
    Top = 160
    Width = 134
    Height = 36
    Style = bsRaised
  end
  object Label4: TLabel [3]
    Left = 303
    Top = 152
    Width = 34
    Height = 13
    Caption = 'Valor '
  end
  inherited pnlFundo: TPanel
    Width = 565
    Height = 302
    object Bevel1: TBevel
      Left = 10
      Top = 11
      Width = 543
      Height = 190
    end
    object Bevel4: TBevel
      Left = 296
      Top = 68
      Width = 241
      Height = 29
      Style = bsRaised
    end
    object Label9: TLabel
      Left = 16
      Top = 19
      Width = 93
      Height = 13
      Caption = 'Data Movimento'
    end
    object Label11: TLabel
      Left = 16
      Top = 69
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object Label2: TLabel
      Left = 16
      Top = 112
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object Label1: TLabel
      Left = 17
      Top = 153
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Bevel3: TBevel
      Left = 296
      Top = 155
      Width = 134
      Height = 36
      Style = bsRaised
    end
    object Label6: TLabel
      Left = 303
      Top = 147
      Width = 34
      Height = 13
      Caption = 'Valor '
    end
    object Label8: TLabel
      Left = 296
      Top = 18
      Width = 45
      Height = 13
      Caption = 'Carteira'
    end
    object dbPatro: TDBText
      Left = 304
      Top = 78
      Width = 45
      Height = 13
      AutoSize = True
      DataField = 'NOME'
      DataSource = dsBuscaPatro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 304
      Top = 60
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Bevel5: TBevel
      Left = 296
      Top = 111
      Width = 241
      Height = 29
      Style = bsRaised
    end
    object Label10: TLabel
      Left = 304
      Top = 103
      Width = 67
      Height = 13
      Caption = 'Plano Prev.'
    end
    object dbPlanPrev: TDBText
      Left = 303
      Top = 120
      Width = 66
      Height = 13
      AutoSize = True
      DataField = 'NOME'
      DataSource = dsPlanPrev
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cboTipoInvest: TwwDBLookupCombo
      Left = 16
      Top = 84
      Width = 240
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'60'#9'Investimento')
      LookupTable = qryTipoInvest
      LookupField = 'IDTIPOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object cboInvestimento: TwwDBLookupCombo
      Left = 16
      Top = 126
      Width = 240
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'60'#9'Investimento')
      DataField = 'IDINVESTIMENTO'
      DataSource = ds
      LookupTable = qryInvest
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblPlano: TwwDBLookupCombo
      Left = 16
      Top = 170
      Width = 240
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCPLANO'#9'20'#9'Plano')
      DataField = 'PLANO'
      DataSource = ds
      LookupTable = qryPlanos
      LookupField = 'PLANO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeValor: TwwDBEdit
      Left = 300
      Top = 163
      Width = 124
      Height = 21
      DataField = 'VLRIRLITIGIO'
      DataSource = ds
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Panel1: TPanel
      Left = 9
      Top = 206
      Width = 545
      Height = 18
      Caption = 'DESCRIÇÃO'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object dbdtDataInicio: TCMDateTimePicker
      Left = 17
      Top = 39
      Width = 117
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAFATOGERADOR'
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
    object mmDESCRICAO: TMemo
      Left = 9
      Top = 225
      Width = 545
      Height = 65
      TabOrder = 6
    end
  end
  inherited Dock972: TDock97
    Width = 565
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 565
    inherited tb97Fundo: TToolbar97
      Left = 393
      DockPos = 393
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 224
      DockPos = 224
    end
  end
  object dblCarteira: TwwDBLookupCombo [7]
    Left = 296
    Top = 82
    Width = 240
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCCARTINVEST'#9'60'#9'Carteira')
    LookupTable = qryCarteira
    LookupField = 'IDCARTEIRAINVEST'
    Options = [loColLines, loRowLines, loTitles]
    Style = csDropDownList
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
    OnChange = dblCarteiraChange
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
      'update IRLITIGIO'
      'set'
      '  IDIRLITIGIO = :IDIRLITIGIO,'
      '  IDORIGEMIRLITIGIO = :IDORIGEMIRLITIGIO,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  DATAFATOGERADOR = :DATAFATOGERADOR,'
      '  DESFATOGERADOR = :DESFATOGERADOR,'
      '  VLRIRLITIGIO = :VLRIRLITIGIO,'
      '  IDMODULO = :IDMODULO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDPATROCINADORA = :IDPATROCINADORA,'
      '  IDPLANOPREV = :IDPLANOPREV'
      'where'
      '  IDIRLITIGIO = :OLD_IDIRLITIGIO')
    InsertSQL.Strings = (
      'insert into IRLITIGIO'
      
        '  (IDIRLITIGIO, IDORIGEMIRLITIGIO, IDOPERACAOINVEST, IDINVESTIME' +
        'NTO, DATAFATOGERADOR, '
      
        '   DESFATOGERADOR, VLRIRLITIGIO, IDMODULO, PLANO, PLNCODIGO, IDP' +
        'ATROCINADORA, '
      '   IDPLANOPREV)'
      'values'
      
        '  (:IDIRLITIGIO, :IDORIGEMIRLITIGIO, :IDOPERACAOINVEST, :IDINVES' +
        'TIMENTO, '
      
        '   :DATAFATOGERADOR, :DESFATOGERADOR, :VLRIRLITIGIO, :IDMODULO, ' +
        ':PLANO, '
      '   :PLNCODIGO, :IDPATROCINADORA, :IDPLANOPREV)')
    DeleteSQL.Strings = (
      'delete from IRLITIGIO'
      'where'
      '  IDIRLITIGIO = :OLD_IDIRLITIGIO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IRLITIGIO.IDIRLITIGIO'
      'IRLITIGIO.DATAFATOGERADOR'
      'IRLITIGIO.DESFATOGERADOR'
      'IRLITIGIO.PLANO'
      'IRLITIGIO.IDPATROCINADORA'
      'IRLITIGIO.IDPLANOPREV'
      'IRLITIGIO.VLRIRLITIGIO')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'ID'
      'Data'
      'Descricao'
      'Plano'
      'Patrocinadora'
      'Plano Previdenc.'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IRLITIGIO')
    CamposChave.Strings = (
      'IRLITIGIO.IDIRLITIGIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '10'
      '10'
      '10'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT IRL.IDIRLITIGIO       , IRL.IDORIGEMIRLITIGIO , IRL.IDOPE' +
        'RACAOINVEST  , IRL.IDINVESTIMENTO    , '
      
        #9'IRL.DATAFATOGERADOR   , IRL.DESFATOGERADOR    , IRL.VLRIRLITIGI' +
        'O      , IRL.IDMODULO          , '
      
        #9'IRL.PLANO             , IRL.PLNCODIGO         , IRL.IDPATROCINA' +
        'DORA   , IRL.IDPLANOPREV     '
      ''
      'FROM IRLITIGIO IRL'
      ''
      ''
      'WHERE IDIRLITIGIO = :P_IDIRLITIGIO')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_IDIRLITIGIO'
        ParamType = ptUnknown
        Value = 255
      end>
    object qryIDIRLITIGIO: TFloatField
      FieldName = 'IDIRLITIGIO'
      Origin = 'IRLITIGIO.IDIRLITIGIO'
    end
    object qryIDORIGEMIRLITIGIO: TFloatField
      FieldName = 'IDORIGEMIRLITIGIO'
      Origin = 'IRLITIGIO.IDORIGEMIRLITIGIO'
    end
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'IRLITIGIO.IDOPERACAOINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'IRLITIGIO.IDINVESTIMENTO'
    end
    object qryDATAFATOGERADOR: TDateTimeField
      FieldName = 'DATAFATOGERADOR'
      Origin = 'IRLITIGIO.DATAFATOGERADOR'
    end
    object qryDESFATOGERADOR: TStringField
      FieldName = 'DESFATOGERADOR'
      Origin = 'IRLITIGIO.DESFATOGERADOR'
      Size = 200
    end
    object qryVLRIRLITIGIO: TFloatField
      FieldName = 'VLRIRLITIGIO'
      Origin = 'IRLITIGIO.VLRIRLITIGIO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'IRLITIGIO.IDMODULO'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'IRLITIGIO.PLANO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'IRLITIGIO.PLNCODIGO'
    end
    object qryIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'IRLITIGIO.IDPATROCINADORA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'IRLITIGIO.IDPLANOPREV'
    end
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT PLANO, DESCPLANO FROM PLANO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 494
    Top = 164
    object qryPlanosDESCPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 20
      FieldName = 'DESCPLANO'
      Origin = 'PLANO.DESCPLANO'
    end
    object qryPlanosPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'PLANO.PLANO'
      Visible = False
    end
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      ''
      'FROM CARTEIRAINVEST '
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 476
    Top = 56
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraDATAINICIO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
      Origin = 'CARTEIRAINVEST.DATAINICIO'
      Visible = False
    end
    object qryCarteiraIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
    end
    object qryCarteiraFLGCARTPROP: TFloatField
      FieldName = 'FLGCARTPROP'
      Origin = 'CARTEIRAINVEST.FLGCARTPROP'
    end
    object qryCarteiraFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'CARTEIRAINVEST.FLGCALCDIARIO'
      Size = 1
    end
    object qryCarteiraFLGTRATALOTE: TStringField
      FieldName = 'FLGTRATALOTE'
      Origin = 'CARTEIRAINVEST.TRGDTINCLUSAO'
      Size = 1
    end
    object qryCarteiraTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'CARTEIRAINVEST.TRGUSERINCLUSAO'
    end
    object qryCarteiraTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'CARTEIRAINVEST.FLGTRATALOTE'
      Size = 30
    end
    object qryCarteiraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'CARTEIRAINVEST.IDPLANOPREV'
    end
    object qryCarteiraIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'CARTEIRAINVEST.IDPATROCINADORA'
    end
    object qryCarteiraIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'CARTEIRAINVEST.IDTIPOINVEST'
    end
    object qryCarteiraIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'CARTEIRAINVEST.IDMERCADO'
    end
    object qryCarteiraFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'CARTEIRAINVEST.FLGORDMOVINV'
      Size = 1
    end
  end
  object qryTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOINVEST, DESCTIPOINVEST FROM TIPOINVEST')
    ValidateWithMask = True
    Left = 164
    Top = 112
    object qryTipoInvestDESCTIPOINVEST: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Origin = 'TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object qryInvest: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsTipoInvest
    SQL.Strings = (
      'SELECT DISTINCT DESCINVESTIMENTO, IDINVESTIMENTO'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST')
    ValidateWithMask = True
    Left = 188
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object qryInvestDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object dsTipoInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoInvest
    Left = 229
    Top = 104
  end
  object qryLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsTipoInvest
    SQL.Strings = (
      'SELECT * '
      'FROM ORIGEMIRLITIGIO'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST')
    ValidateWithMask = True
    Left = 244
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object qryLitigioIDORIGEMIRLITIGIO: TFloatField
      FieldName = 'IDORIGEMIRLITIGIO'
      Origin = 'ORIGEMIRLITIGIO.IDORIGEMIRLITIGIO'
    end
    object qryLitigioDESORIGEMLITIGIO: TStringField
      FieldName = 'DESORIGEMLITIGIO'
      Origin = 'ORIGEMIRLITIGIO.DESORIGEMLITIGIO'
      Size = 60
    end
    object qryLitigioIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'ORIGEMIRLITIGIO.IDTIPOINVEST'
    end
    object qryLitigioIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'ORIGEMIRLITIGIO.IDMODULO'
    end
  end
  object qryBuscaTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   INV.IDTIPOINVEST '
      'FROM '
      '   INVESTIMENTO INV'
      'WHERE '
      '   INV.IDINVESTIMENTO = :IDINVESTIMENTO')
    ValidateWithMask = True
    Left = 124
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryBuscaTipoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
  end
  object qryBuscaPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, PA.IDPESSOA FROM PESSOA P, PATRO PA'
      'WHERE (P.IDPESSOA = PA.IDPESSOA) AND'
      '               (PA.IDPESSOA = :IDPATROCINADORA)')
    ValidateWithMask = True
    Left = 420
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPATROCINADORA'
        ParamType = ptUnknown
      end>
    object qryBuscaPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryBuscaPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PATRO.IDPESSOA'
    end
  end
  object dsBuscaPatro: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaPatro
    Left = 389
    Top = 96
  end
  object qryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME FROM PLANPREV'
      'WHERE IDPLANOPREV = :IDPLANOPREV')
    ValidateWithMask = True
    Left = 428
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryPlanPrevNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
  end
  object dsPlanPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryPlanPrev
    Left = 397
    Top = 152
  end
end
