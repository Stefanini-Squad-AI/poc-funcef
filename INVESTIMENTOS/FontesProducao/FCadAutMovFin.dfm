inherited frmCadAutMovFin: TfrmCadAutMovFin
  Left = 24
  Caption = 'Autorização de Movimentação Financeira'
  ClientHeight = 439
  ClientWidth = 750
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 750
    Height = 400
    object Label1: TLabel
      Left = 21
      Top = 12
      Width = 132
      Height = 13
      Caption = 'Data de Movimentação'
    end
    object Label2: TLabel
      Left = 276
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Emissor'
    end
    object Label3: TLabel
      Left = 533
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Corretora'
    end
    object Label4: TLabel
      Left = 21
      Top = 53
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object Label5: TLabel
      Left = 276
      Top = 53
      Width = 50
      Height = 13
      Caption = 'Mercado'
    end
    object Label6: TLabel
      Left = 533
      Top = 53
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
    end
    object Image1: TImage
      Left = 765
      Top = 113
      Width = 13
      Height = 13
      AutoSize = True
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000001000
        0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777777777777700077777707777770007777770077777000777777060777
        7000770000066077700077066666660770007706666666607000770666666607
        7000770000066077700077777706077770007777770077777000777777077777
        70007777777777777000}
    end
    object grddbOrdMovInv: TwwDBGrid
      Left = 5
      Top = 100
      Width = 740
      Height = 295
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'9'#9'Investimento'
        'DESCTIPOOPERACAO'#9'35'#9'Tipo de Operação'
        'STATMOVINV'#9'6'#9'Autoriza'
        'QTDEORDMOVINV'#9'10'#9'Qtde. Aut.'
        'QTDEORDENADA'#9'10'#9'Qtd Ordenada'
        'PUORDMOVINV'#9'10'#9'Preço Unit.'
        'NUMDOCMOVINV'#9'10'#9'Num. Doc.'
        'OBSMOVINV'#9'37'#9'Obs'
        'USUARIO'#9'30'#9'Usuário Responsável'
        'SIGLAEMISSOR'#9'15'#9'Emissor'
        'SGLCORRETVALORES'#9'15'#9'Corretora')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 2
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alBottom
      DataSource = DtsOrdMovInv
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
      object grddbOrdMovInvIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 13
        Height = 25
        AllowAllUp = True
      end
    end
    object txtData: TCMDateTimePicker
      Left = 21
      Top = 27
      Width = 137
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
      ShowButton = True
      TabOrder = 0
      OnChange = txtDataChange
    end
    object cbodbEmissor: TwwDBLookupCombo
      Left = 276
      Top = 27
      Width = 245
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAEMISSOR'#9'40'#9'Emissor')
      LookupTable = qryEmissor
      LookupField = 'IDEMISSOR'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = cbodbEmissorChange
    end
    object cbodbCorretora: TwwDBLookupCombo
      Left = 533
      Top = 27
      Width = 245
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLCORRETVALORES'#9'40'#9'Corretor')
      LookupTable = qryCorretValores
      LookupField = 'IDCORRETVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = cbodbCorretoraChange
    end
    object cbodbUsuario: TwwDBLookupCombo
      Left = 21
      Top = 67
      Width = 245
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Usuário')
      LookupTable = qryUsuario
      LookupField = 'IDUSUARIO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = cbodbUsuarioChange
    end
    object DbLkpMercado: TwwDBLookupCombo
      Left = 276
      Top = 67
      Width = 245
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCMERCADO'#9'60'#9'Mercado')
      LookupTable = QryMercado
      LookupField = 'IDMERCADO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DbLkpMercadoChange
    end
    object DbLkpTipoOper: TwwDBLookupCombo
      Left = 533
      Top = 67
      Width = 245
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação')
      LookupTable = QryTipoOperacao
      LookupField = 'IDTIPOOPERACAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DbLkpTipoOperChange
      OnClick = DbLkpTipoOperClick
    end
    object BtMarcar: TBitBtn
      Left = 19
      Top = 100
      Width = 161
      Height = 25
      Caption = 'Marcar Todos'
      TabOrder = 7
      OnClick = BtMarcarClick
      Glyph.Data = {
        E2060000424DE206000000000000360400002800000024000000130000000100
        080000000000AC02000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030304
        0403030303030303030303030303030303F8F8FF030303030303030303030303
        0303040202040303030303030303030303030303F80303F8FF03030303030303
        0303030303040202020204030303030303030303030303F803030303F8FF0303
        0303030303030303040202020202020403030303030303030303F80303030303
        03F8FF030303030303030304020202FA02020202040303030303030303F8FF03
        03FF03030303F8FF03030303030303020202FA02FA0202020403030303030303
        03F8FF03F803FF030303F8FF03030303030303FA02FA020202FA020202040303
        0303030303F8FFF8030303FF030303F8FF03030303030304FA0202020202FA02
        020204030303030303F8F80303030303FF030303F8FF0303030304020202FA02
        020202FA0202020403030303F8FF0303F8FF030303FF030303F8FF0303030202
        02FA03FA02020204FA02020204030303F8FF03F803F8FF0303F8FF030303F8FF
        0303FA02FA030303FA02020204FA020202040303F8FFF8030303F8FF0303F8FF
        030303F8FF0303FA0303030303FA02020204FA020202040303F80303030303F8
        FF0303F8FF030303F8FF0303030303030303FA02020204FA0202040303030303
        03030303F8FF0303F8FF0303F8FF030303030303030303FA02020204FA020203
        030303030303030303F8FF0303F8FFF8030303030303030303030303FA020202
        04FA030303030303030303030303F8FF0303F8FF030303030303030303030303
        03FA0202020403030303030303030303030303F8FF0303F8FF03030303030303
        030303030303FA0202040303030303030303030303030303F8FF03F8FF030303
        0303030303030303030303FA0202030303030303030303030303030303F8FFF8
        FF030303030303030303030303030303FA030303030303030303030303030303
        0303F8030303}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 750
    object LblTotalAutorizado: TLabel [0]
      Left = 13
      Top = 2
      Width = 98
      Height = 13
      Caption = 'Total Autorizado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblTotal: TLabel [1]
      Left = 13
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 507
      DockPos = 507
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 338
      DockPos = 338
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 512
    Top = 96
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DtsOrdMovInv: TwwDataSource
    DataSet = QryOrdMovInv
    Left = 248
    Top = 96
  end
  object UpdtOrdMovInv: TUpdateSQL
    ModifySQL.Strings = (
      'update OrdMovInv'
      'set'
      '  STATMOVINV = :STATMOVINV,'
      '  QTDEORDMOVINV = :QTDEORDMOVINV,'
      '  IDAUTORIZACAO = :IDAUTORIZACAO'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    InsertSQL.Strings = (
      'insert into OrdMovInv'
      '  (STATMOVINV, QTDEORDMOVINV, IDAUTORIZACAO)'
      'values'
      '  (:STATMOVINV, :QTDEORDMOVINV, :IDAUTORIZACAO)')
    DeleteSQL.Strings = (
      'delete from OrdMovInv'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    Left = 192
    Top = 96
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct E.IdEmissor, E.SiglaEmissor'
      ''
      'From Emissor E, Investimento I, OrdMovInv O'
      ''
      'Where '#9'I.IdEmissor=E.IdEmissor and'
      #9'O.IdInvestimento=I.IdInvestimento'
      ''
      'Order By E.SiglaEmissor')
    ValidateWithMask = True
    Left = 419
    Top = 96
    object qryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      Visible = False
    end
    object qryEmissorSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
  end
  object QryOrdMovInv: TwwQuery
    CachedUpdates = True
    AfterOpen = QryOrdMovInvAfterOpen
    BeforeEdit = QryOrdMovInvBeforeEdit
    AfterPost = QryOrdMovInvAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT     O.STATMOVINV, O.DATAORDMOVINV, O.QTDEORDMOVINV, O.PUO' +
        'RDMOVINV, '
      
        '           O.NUMDOCMOVINV, O.OBSMOVINV, I.DESCINVESTIMENTO,  C.S' +
        'glCorretValores, '
      '           PU.NOME AS USUARIO, E.SIGLAEMISSOR, O.IDORDMOVINV, '
      
        '           I.IDINVESTIMENTO, E.IDEMISSOR, O.IDAUTORIZACAO, QTDEO' +
        'RDENADA,'
      
        '           T.DESCTIPOOPERACAO, SUM(O.QTDEORDMOVINV * O.PUORDMOVI' +
        'NV) TOTAL'
      ''
      'FROM PESSOA PU, ORDMOVINV O, EMISSOR E, INVESTIMENTO I, '
      '           TIPOOPERACAO T, MERCADO M, CORRETVALORES C'
      ''
      'WHERE    ( STATMOVINV               <>  '#39'L'#39'  ) AND'
      
        '                  ( O.IDINVESTIMENTO    =    I.IDINVESTIMENTO ) ' +
        'AND'
      
        '                  ( I.IDEMISSOR                =    E.IDEMISSOR ' +
        ' )          AND'
      
        '                  ( O.IdCorretValores          =    C.IdCorretVa' +
        'lores ) AND'
      
        '                  ( PU.IDPESSOA              =    O.IDUSUARIO ) ' +
        '         AND'
      
        '                  ( O.IDTIPOOPERACAO   =   T.IDTIPOOPERACAO(+) )' +
        ' AND'
      '                  ( M.IDMERCADO(+)        =    T.IDMERCADO)'
      ''
      
        'GROUP BY O.STATMOVINV, O.DATAORDMOVINV, O.QTDEORDMOVINV, O.PUORD' +
        'MOVINV,'
      
        '         O.NUMDOCMOVINV, O.OBSMOVINV, I.DESCINVESTIMENTO, C.SglC' +
        'orretValores, '
      '         PU.NOME , E.SIGLAEMISSOR, O.IDORDMOVINV,'
      
        '         I.IDINVESTIMENTO, E.IDEMISSOR, O.IDAUTORIZACAO, QTDEORD' +
        'ENADA,'
      '         T.DESCTIPOOPERACAO')
    UpdateObject = UpdtOrdMovInv
    ControlType.Strings = (
      'STATMOVINV;CheckBox;A;P')
    ValidateWithMask = True
    Left = 220
    Top = 96
    object QryOrdMovInvDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 9
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      ReadOnly = True
      Size = 60
    end
    object QryOrdMovInvDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 35
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryOrdMovInvSTATMOVINV: TStringField
      DisplayLabel = 'Autoriza'
      DisplayWidth = 6
      FieldName = 'STATMOVINV'
      Origin = 'ORDMOVINV.STATMOVINV'
      OnChange = QryOrdMovInvSTATMOVINVChange
      Size = 1
    end
    object QryOrdMovInvQTDEORDMOVINV: TFloatField
      DisplayLabel = 'Qtde. Aut.'
      DisplayWidth = 10
      FieldName = 'QTDEORDMOVINV'
      Origin = 'ORDMOVINV.QTDEORDMOVINV'
    end
    object QryOrdMovInvQTDEORDENADA: TFloatField
      DisplayLabel = 'Qtd Ordenada'
      DisplayWidth = 10
      FieldName = 'QTDEORDENADA'
      ReadOnly = True
    end
    object QryOrdMovInvPUORDMOVINV: TFloatField
      DisplayLabel = 'Preço Unit.'
      DisplayWidth = 10
      FieldName = 'PUORDMOVINV'
      Origin = 'ORDMOVINV.PUORDMOVINV'
      ReadOnly = True
      DisplayFormat = '###,###,###,###0.000000'
    end
    object QryOrdMovInvNUMDOCMOVINV: TStringField
      DisplayLabel = 'Num. Doc.'
      DisplayWidth = 10
      FieldName = 'NUMDOCMOVINV'
      Origin = 'ORDMOVINV.NUMDOCMOVINV'
      ReadOnly = True
      Size = 30
    end
    object QryOrdMovInvOBSMOVINV: TStringField
      DisplayLabel = 'Obs'
      DisplayWidth = 37
      FieldName = 'OBSMOVINV'
      Origin = 'ORDMOVINV.OBSMOVINV'
      ReadOnly = True
      Size = 200
    end
    object QryOrdMovInvUSUARIO: TStringField
      DisplayLabel = 'Usuário Responsável'
      DisplayWidth = 30
      FieldName = 'USUARIO'
      Origin = 'PESSOA.NOME'
      ReadOnly = True
      Size = 60
    end
    object QryOrdMovInvSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object QryOrdMovInvSGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretora'
      DisplayWidth = 15
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object QryOrdMovInvDATAORDMOVINV: TDateTimeField
      DisplayLabel = 'Data Mov.'
      DisplayWidth = 10
      FieldName = 'DATAORDMOVINV'
      Origin = 'ORDMOVINV.DATAORDMOVINV'
      ReadOnly = True
      Visible = False
    end
    object QryOrdMovInvIDORDMOVINV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDMOVINV'
      Origin = 'ORDMOVINV.IDORDMOVINV'
      ReadOnly = True
      Visible = False
    end
    object QryOrdMovInvIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      ReadOnly = True
      Visible = False
    end
    object QryOrdMovInvIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      ReadOnly = True
      Visible = False
    end
    object QryOrdMovInvIDAUTORIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAUTORIZACAO'
      Origin = 'ORDMOVINV.IDAUTORIZACAO'
      Visible = False
    end
    object QryOrdMovInvTOTAL: TFloatField
      FieldName = 'TOTAL'
      Visible = False
    end
  end
  object qryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct O.IdCorretValores, C.SglCorretValores'
      ''
      'From OrdMovInv O, CorretValores C'
      ''
      'Where O.IdCorretValores=C.IdCorretValores'
      ''
      'Order By C.SglCorretValores')
    ValidateWithMask = True
    Left = 332
    Top = 96
    object qryCorretValoresSGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretor'
      DisplayWidth = 40
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object qryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'ORDMOVINV.IDCORRETVALORES'
      Visible = False
    end
  end
  object qryUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT O.IDUSUARIO, P.NOME'
      'FROM   PESSOA P, ORDMOVINV O '
      'WHERE O.IDUSUARIO = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 361
    Top = 96
    object qryUsuarioNOME: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryUsuarioIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'ORDMOVINV.IDUSUARIO'
      Visible = False
    end
  end
  object QryMercado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMERCADO, DESCMERCADO'
      'FROM MERCADO'
      'ORDER BY DESCMERCADO')
    ValidateWithMask = True
    Left = 558
    Top = 96
    object QryMercadoDESCMERCADO: TStringField
      DisplayLabel = 'Mercado'
      DisplayWidth = 60
      FieldName = 'DESCMERCADO'
      Origin = 'MERCADO.DESCMERCADO'
      Size = 60
    end
    object QryMercadoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'MERCADO.IDMERCADO'
      Visible = False
    end
  end
  object DtsMercado: TwwDataSource
    DataSet = QryMercado
    Left = 587
    Top = 96
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DtsMercado
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM TIPOOPERACAO'
      'WHERE IDMERCADO = :IDMERCADO'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 448
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMERCADO'
        ParamType = ptUnknown
      end>
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
end
