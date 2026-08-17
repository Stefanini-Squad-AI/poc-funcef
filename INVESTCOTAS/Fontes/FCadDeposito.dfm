inherited FrmCadDeposito: TFrmCadDeposito
  Left = 149
  Top = 171
  Caption = 'Lançamento'
  ClientHeight = 336
  ClientWidth = 813
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 813
    Height = 219
    inherited dbGrd: TwwDBGrid [0]
      Width = 811
      Height = 217
      Selected.Strings = (
        'DATAHISTCAIXA'#9'12'#9'Data'#9'F'
        'DESCCARTINVEST'#9'40'#9'Carteira'#9'F'
        'DESCCAIXACOTA'#9'40'#9'Evento'#9'F'
        'VLRHISTCAIXA'#9'18'#9'Valor'#9'F')
    end
    inherited pnlControles: TPanel [1]
      Width = 811
      Height = 217
      object LblData: TLabel
        Left = 13
        Top = 11
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object LblCarteira: TLabel
        Left = 13
        Top = 58
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object LblEvento: TLabel
        Left = 13
        Top = 108
        Width = 41
        Height = 13
        Caption = 'Evento'
      end
      object LblValor: TLabel
        Left = 14
        Top = 156
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object DbDtData: TCMDateTimePicker
        Left = 13
        Top = 26
        Width = 111
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAHISTCAIXA'
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
      object DbLcCarteira: TwwDBLookupCombo
        Left = 13
        Top = 74
        Width = 495
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
        DataField = 'IDCARTEIRAINVEST'
        DataSource = ds
        LookupTable = CdsCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DbLcCarteiraCloseUp
        OnEnter = DbLcCarteiraEnter
        OnExit = DbLcCarteiraExit
      end
      object DbLcEvento: TwwDBLookupCombo
        Left = 13
        Top = 124
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCAIXACOTA'#9'40'#9'Descrição'#9'F')
        DataField = 'IDEVENTOCAIXACOTA'
        DataSource = ds
        LookupTable = CdsEvento
        LookupField = 'IDEVENTOCAIXACOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object DbRValor: TDBRealEdit
        Left = 14
        Top = 172
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 3
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRHISTCAIXA'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 813
  end
  inherited Dock971: TDock97
    Top = 297
    Width = 813
    inherited tb97Fundo: TToolbar97
      Left = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
    end
  end
  inherited pnlTitulo: TPanel
    Width = 813
    inherited lbNomItem: TfcLabel
      Width = 253
      Caption = 'Lançamento de Depósito'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 414
    Top = 103
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 480
    Top = 103
  end
  inherited Cds: TCMClientDataSet
    Left = 368
    Top = 103
    object CdsDATAHISTCAIXA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAHISTCAIXA'
    end
    object CdsDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object CdsDESCCAIXACOTA: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 40
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object CdsVLRHISTCAIXA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLRHISTCAIXA'
      DisplayFormat = '#,##0.00'
    end
    object CdsIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
      Visible = False
    end
    object CdsIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object CdsIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Visible = False
    end
    object CdsTIPMOVCAIXA: TStringField
      FieldName = 'TIPMOVCAIXA'
      Visible = False
      Size = 3
    end
    object CdsIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
      Visible = False
    end
    object CdsFLGMANUALAUT: TStringField
      FieldName = 'FLGMANUALAUT'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'HISTCAIXA.DATAHISTCAIXA'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'EVENTOCAIXACOTA.DESCCAIXACOTA'
      'HISTCAIXA.VLRHISTCAIXA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Data'
      'Carteira'
      'Evento'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTCAIXA'
      'CARTEIRAXEVENTO'
      'EVENTOCAIXACOTA'
      'CARTEIRAINVEST')
    CamposChave.Strings = (
      'HISTCAIXA.IDHISTCAIXA')
    Filtro.Strings = (
      
        'HISTCAIXA.IDCARTEIRAXEVENTO       = CARTEIRAXEVENTO.IDCARTEIRAXE' +
        'VENTO(+)'
      
        'CARTEIRAXEVENTO.IDEVENTOCAIXACOTA = EVENTOCAIXACOTA.IDEVENTOCAIX' +
        'ACOTA(+)'
      
        'CARTEIRAXEVENTO.IDCARTEIRAINVEST  = CARTEIRAINVEST.IDCARTEIRAINV' +
        'EST(+)'
      'EVENTOCAIXACOTA.IDEVENTOCAIXACOTA = -6')
    Mascaras.Strings = (
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '10'
      '40'
      '30'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
  end
  inherited CdsAux: TCMClientDataSet
    Left = 364
    Top = 247
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 472
    Top = 4
  end
  object CdsCarteira: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 364
    Top = 151
  end
  object CdsEvento: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 364
    Top = 199
    Data = {
      820300009619E0BD01000000180000000F000700000003000000750211494445
      56454E544F4341495841434F5441080004000000000007494452454752410800
      0400000000000C49445449504F494E5645535408000400000000000E49445449
      504F4F5045524143414F08000400000000000D444553434341495841434F5441
      0100490000000100055749445448020002002800085354414341495841010049
      00000002000753554254595045020049000A0046697865644368617200055749
      44544802000200010007535441434F5441010049000000020007535542545950
      45020049000A00466978656443686172000557494454480200020001000F5354
      41415449564F5041535349564F01004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020001000E535441534F4D
      4144494D494E554901004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020001000D5452474454494E434C5553
      414F08000800000000000F54524755534552494E434C5553414F010049000000
      0100055749445448020002001E0009535441434F54495A410100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      020001001049445449504F44455350494E564553540800040000000000075354
      4143504D4601004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020001000C464C474D414E55414C4155540100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000100044C434944040001000908000000044054150000
      000000001840000000000000004000000000000000400C544553544520504144
      52C34F0153014E01530054041505000000000000F0BF04434F54410153014E01
      53014100040455050000000000001C400000000000000040000000000000F03F
      0A544553544520434F544101530150014D005400140500000000000024C00944
      4553504F5349544F01530153014E015301530141000450540500000000000020
      40000000000000224000000000008045C00A7465737465203530303001530144
      01410054045505000000000000284002504C0153014E01410004045515000000
      0000002240000000000000004000000000000000400C544553544520434F5441
      203101530141}
  end
  object CMSqlParams: TCMSqlParams
    SQL.Strings = (
      
        'SELECT    HC.IDHISTCAIXA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAXEVE' +
        'NTO, HC.DATAHISTCAIXA,    HC.VLRHISTCAIXA, HC.TIPMOVCAIXA,'
      
        'ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA,    CI.DESCCARTINVEST, ' +
        'FLGMANUALAUT'
      
        'FROM HISTCAIXA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CART' +
        'EIRAINVEST CI WHERE      HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEV' +
        'ENTO(+) AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) AND' +
        '  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+) AND  ECC.STACAIX' +
        'A         = '#39'S'#39'AND  ECC.STASOMADIMINUI   = '#39'S'#39'AND  ECC.STACOTA  ' +
        '        = '#39'S'#39'AND  ECC.STAATIVOPASSIVO  = '#39'A'#39'AND  ECC.STACOTIZA  ' +
        '      = '#39'S'#39' ORDER BY HC.DATAHISTCAIXA, HC.IDHISTCAIXA'
      ' ')
    ClientDataSet = Cds
    Left = 473
    Top = 56
  end
end
