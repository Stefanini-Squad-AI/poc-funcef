inherited FrmProcCalcCota: TFrmProcCalcCota
  Left = 108
  Top = 48
  Caption = 'Apuração'
  ClientHeight = 553
  ClientWidth = 784
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 97
    Width = 784
    Height = 417
    object PnlDetAtivo: TPanel
      Left = 1
      Top = 1
      Width = 391
      Height = 415
      Align = alLeft
      TabOrder = 0
      object Label4: TLabel
        Left = 14
        Top = 25
        Width = 71
        Height = 13
        Caption = 'Evento Cota'
        Enabled = False
      end
      object Label5: TLabel
        Left = 14
        Top = 73
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object DbrVlrAtivo: TDBRealEdit
        Left = 14
        Top = 89
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
        TabOrder = 1
        WordWrap = False
        IntDigits = 22
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRHISTCOTA'
        DataSource = dsAtivo
      end
      object DbeEventoAtivo: TDBEdit
        Left = 14
        Top = 43
        Width = 370
        Height = 21
        DataField = 'DESCCAIXACOTA'
        DataSource = dsAtivo
        Enabled = False
        TabOrder = 0
      end
      object dbGrdAtivo: TwwDBGrid
        Left = 1
        Top = 1
        Width = 389
        Height = 413
        Selected.Strings = (
          'DESCCAIXACOTA'#9'31'#9'Evento'
          'VLRHISTCOTA'#9'20'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        PopupMenu = pmnuAltAtivo
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbGrdAtivoCalcCellColors
        OnDblClick = dbGrdAtivoDblClick
        IndicatorColor = icBlack
        OnUpdateFooter = dbGrdAtivoUpdateFooter
      end
    end
    object PnlDetPassivo: TPanel
      Left = 390
      Top = 1
      Width = 393
      Height = 415
      Align = alRight
      TabOrder = 1
      object Label6: TLabel
        Left = 14
        Top = 25
        Width = 71
        Height = 13
        Caption = 'Evento Cota'
        Enabled = False
      end
      object Label7: TLabel
        Left = 14
        Top = 73
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Panel6: TPanel
        Left = 1
        Top = 344
        Width = 391
        Height = 70
        Align = alBottom
        BevelInner = bvLowered
        Enabled = False
        TabOrder = 2
        object Label1: TLabel
          Left = 456
          Top = 8
          Width = 111
          Height = 13
          Caption = 'Patrimônio Líquido '
        end
        object Label2: TLabel
          Left = 456
          Top = 40
          Width = 120
          Height = 13
          Caption = 'Quantidade de Cotas'
        end
        object Label3: TLabel
          Left = 456
          Top = 72
          Width = 78
          Height = 13
          Caption = 'Valor da Cota'
        end
        object DbRValor: TDBRealEdit
          Left = 585
          Top = 6
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '156.230.000,00')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRHISTCOTA'
        end
        object DBRealEdit1: TDBRealEdit
          Left = 585
          Top = 36
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '156.230.000,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRHISTCOTA'
        end
        object DBRealEdit2: TDBRealEdit
          Left = 585
          Top = 68
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '156.230.000,00000000')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 17
          DecDigits = 8
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRHISTCOTA'
        end
        object DbrVlrCota: TDBRealEdit
          Left = 217
          Top = 47
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 22
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object DbrQtdCota: TDBRealEdit
          Left = 217
          Top = 25
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0')
          ParentFont = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 22
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object DbrVlrPLFinal: TDBRealEdit
          Left = 217
          Top = 3
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 5
          WordWrap = False
          IntDigits = 22
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object ePatrLiq: TEdit
          Left = 4
          Top = 4
          Width = 212
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          Text = 'Patrimônio Líquido Final'
        end
        object eQtdCotas: TEdit
          Left = 4
          Top = 25
          Width = 212
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Text = 'Quantidade de Cotas'
        end
        object eVlrCota: TEdit
          Left = 4
          Top = 47
          Width = 212
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Text = 'Valor da Cota'
        end
      end
      object DbrVlrPassivo: TDBRealEdit
        Left = 14
        Top = 89
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
        TabOrder = 1
        WordWrap = False
        IntDigits = 22
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRHISTCOTA'
        DataSource = dsPassivo
      end
      object DbeEventoPassivo: TDBEdit
        Left = 14
        Top = 43
        Width = 370
        Height = 21
        DataField = 'DESCCAIXACOTA'
        DataSource = dsPassivo
        Enabled = False
        TabOrder = 0
      end
      object dbGrdPassivo: TwwDBGrid
        Left = 1
        Top = 1
        Width = 391
        Height = 275
        Selected.Strings = (
          'DESCCAIXACOTA'#9'31'#9'Evento'
          'VLRHISTCOTA'#9'20'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsPassivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        PopupMenu = pmnuAltPassivo
        TabOrder = 3
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbGrdPassivoCalcCellColors
        OnDblClick = dbGrdPassivoDblClick
        IndicatorColor = icBlack
        OnUpdateFooter = dbGrdPassivoUpdateFooter
      end
      object pnlCotas: TPanel
        Left = 1
        Top = 276
        Width = 391
        Height = 68
        Align = alBottom
        TabOrder = 4
        object Edit1: TEdit
          Left = 4
          Top = 23
          Width = 212
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = 'Cotas Emitidas'
        end
        object Edit2: TEdit
          Left = 4
          Top = 45
          Width = 212
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = 'Cotas Resgatadas'
        end
        object DbrVlrResg: TDBRealEdit
          Left = 217
          Top = 45
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 22
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object DbrVlrEmit: TDBRealEdit
          Left = 217
          Top = 23
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 22
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object Edit3: TEdit
          Left = 4
          Top = 1
          Width = 212
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Text = 'Patrimônio Líquido'
        end
        object DbrVlrPL: TDBRealEdit
          Left = 217
          Top = 1
          Width = 169
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 5
          WordWrap = False
          IntDigits = 22
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object pnlTitulo: TPanel [2]
    Left = 0
    Top = 0
    Width = 784
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lbNomItem: TfcLabel
      Left = 13
      Top = 3
      Width = 159
      Height = 24
      Caption = 'Cálculo de Cota'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
  end
  object PnlCab: TPanel [3]
    Left = 0
    Top = 31
    Width = 784
    Height = 25
    Align = alTop
    Enabled = False
    TabOrder = 3
    object DbeCarteira: TDBEdit
      Left = 80
      Top = 2
      Width = 718
      Height = 21
      Color = clGray
      DataField = 'DESCCARTINVEST'
      DataSource = dsAtivo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DbeData: TDBEdit
      Left = 2
      Top = 2
      Width = 77
      Height = 21
      Color = clGray
      DataField = 'DATAHISTCOTA'
      DataSource = dsAtivo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object PnlAtivoPassivo: TPanel [4]
    Left = 0
    Top = 56
    Width = 784
    Height = 41
    Align = alTop
    TabOrder = 4
    object PnlPassivo: TPanel
      Left = 392
      Top = 1
      Width = 391
      Height = 39
      Align = alRight
      BevelInner = bvLowered
      Caption = 'Passivo'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object PnlAtivo: TPanel
      Left = 1
      Top = 1
      Width = 390
      Height = 39
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Ativo'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object CmeCadastroAtivo: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnAtualizaBotoes = CmeCadastroAtivoAtualizaBotoes
    DataSource = dsAtivo
    OpenDsAutomatico = False
    Left = 296
    Top = 80
  end
  object CmeCadastroPassivo: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    DataSource = dsPassivo
    OpenDsAutomatico = False
    Left = 296
    Top = 120
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 292
    Top = 167
  end
  object dsAtivo: TwwDataSource
    DataSet = CdsAtivo
    Left = 166
    Top = 79
  end
  object CdsAtivo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 79
    Data = {
      9F0100009619E0BD01000000180000000E0000000000030000009F010A494448
      495354434F544108000400000000001149444341525445495241584556454E54
      4F0800040000000000114944504C414E50524556435442504154520800040000
      0000000C4441544148495354434F544108000800000000000B564C5248495354
      434F544108000400000000001049444341525445495241494E56455354080004
      00000000001049444341525445495241474552454E4308000400000000000D44
      4553434341495841434F54410100490000000100055749445448020002002800
      0F535441415449564F5041535349564F01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020001000E494454
      49504F4F5045524143414F08000400000000000C49445449504F494E56455354
      0800040000000000074944524547524108000400000000001049445449504F44
      455350494E5645535408000400000000000E4445534343415254494E56455354
      0100490000000100055749445448020002003C000100044C4349440400010009
      080000}
    object CdsAtivoDESCCAIXACOTA: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 31
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object CdsAtivoVLRHISTCOTA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLRHISTCOTA'
      DisplayFormat = '#,##0.00'
    end
    object CdsAtivoIDHISTCOTA: TFloatField
      FieldName = 'IDHISTCOTA'
      Visible = False
    end
    object CdsAtivoIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Visible = False
    end
    object CdsAtivoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object CdsAtivoDATAHISTCOTA: TDateTimeField
      FieldName = 'DATAHISTCOTA'
      Visible = False
    end
    object CdsAtivoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object CdsAtivoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object CdsAtivoSTAATIVOPASSIVO: TStringField
      FieldName = 'STAATIVOPASSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsAtivoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object CdsAtivoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object CdsAtivoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Visible = False
    end
    object CdsAtivoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object CdsAtivoDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
  end
  object pmnuAltPassivo: TPopupMenu
    OnPopup = pmnuAltPassivoPopup
    Left = 568
    Top = 76
    object mnuAltP: TMenuItem
      Caption = 'Alterar'
      Enabled = False
      OnClick = dbGrdPassivoDblClick
    end
  end
  object CMSqlParams: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA,'
      '   HC.VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, '
      
        '   ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO, ECC.IDTIPOOPERACAO, E' +
        'CC.IDTIPOINVEST,'
      '   ECC.IDREGRA, ECC.IDTIPODESPINVEST,'
      '   CI.DESCCARTINVEST'
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI'
      'WHERE'
      '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+)'
      'AND  ECC.IDEVENTOCAIXACOTA IN (-3,-4,-5)'
      '--AND  ECC.STACOTA          = '#39'S'#39
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+)'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+)'
      'and hc.idcarteirainvest = 1'
      'and datahistcota = '#39'26/09/2007'#39
      ''
      ''
      ' '
      ' '
      ' '
      '')
    ClientDataSet = CdsPassivo
    Left = 369
    Top = 152
  end
  object CdsCarteira: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 231
    Data = {
      F60600009619E0BD010000001800000014000A00000003000000C90210494443
      41525445495241494E5645535408000400000000000E4445534343415254494E
      564553540100490000000100055749445448020002003C00104944474553544F
      52434152544549524108000400000000000B464C474341525450524F50080004
      00000000000D464C4743414C4344494152494F01004900000002000753554254
      595045020049000A00466978656443686172000557494454480200020001000A
      44415441494E4943494F08000800000000000D5452474454494E434C5553414F
      08000800000000000F54524755534552494E434C5553414F0100490000000100
      055749445448020002001E000C464C4754524154414C4F544501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020001000B4944504C414E4F5052455608000400000000000F494450415452
      4F43494E41444F524108000400000000000C49445449504F494E564553540800
      0400000000000949444D45524341444F08000400000000000C464C474F52444D
      4F56494E5601004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020001000B44415441554C5446454348080008
      00000000000B494444414945414341525408000400000000000D464C47434152
      544C415354524F01004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020001000B464C47434152545445524301
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020001000F4944434F4E53454C48494E564553540800040000
      0000000E464C47434F4E544142494C495A410100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020001000100
      044C4349440400010009080000000000005454000000000000F03F2F4156202D
      2043617274656972612052656E646120566172696176656C2050726F70726961
      202849424F5645535041290000000080B2C340000000000000F03F0144000096
      F431AECC4200147D580BADCC4204434D3930014E0000000000002C4000000000
      000000400000000000000040000000000000F03F014E00000000555400000000
      00000040205246202D2043617274656972612052656E64612046697861205072
      6F70726961000000000061C440000000000000F03F01440000F0451CAFCC4200
      F4AB580BADCC4204434D393001530000000000002C4000000000000000400000
      00000000F03F014E0000000054540000000000001040304F50202D2043617274
      656972612064652052656E646120566172696176656C2050726F707269612028
      6F70633F6573290000000080B2C340000000000000F03F014E000096F431AECC
      4200202232B1AECC4204434D393001530000000000002C400000000000000040
      00000000000000400000000000000840014E0000000054540000000000001440
      36454D50202D2043617274656972612064652052656E64612056617269617665
      6C2050726F707269612028656D7072657374696D6F73290000000080B2C34000
      0000000000F03F0144000096F431AECC420064E732B1AECC4204434D39300153
      0000000000002C40000000000000004000000000000000400000000000001440
      014E00000054555400000000000022402C494D4F202D20436172746569726120
      646520496E76657374696D656E746F7320496D6F62696C696172696F73000000
      0000000040000000000000F03F014E0000565A84AECC420088680222B0CC4204
      434D3930014E014E000000405554000000000000244012434152544549524120
      444520544553544553000000000061C440000000000000F03F014E00001216A1
      B0CC420000043CA2B0CC4205434D35313001530000000000002C400000000000
      000040014E004000115054000000000000264014494E44202D204D4552434144
      4F2046555455524F0000000000000040013000007011C1AFCC42009CD8FC0BB6
      CC4209434D313532363934320000000000002C40000000000000204000000000
      00001040014E014E00000001505000000000000028402D4156202D2043617274
      656972612052656E646120566172696176656C2050726F707269612028494258
      203530290000000000000040000000000000F03F014400009AE06DBECC420098
      5A4ABABECC4209434D313533363130300000000000002C400000000000000040
      0000000000000040000000000000F03F014E014E014E00500054515000000000
      000041400379797901300000E62379C9CC4200D0BBA09FCBCC4205434D353130
      014E014E014E014E00500054515000000000000042400364646401300000E623
      79C9CC420068D8A59FCBCC4205434D353130014E014E014E014E}
  end
  object dsPassivo: TwwDataSource
    DataSet = CdsPassivo
    Left = 166
    Top = 119
  end
  object CdsPassivo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 119
    Data = {
      9F0100009619E0BD01000000180000000E0000000000030000009F010A494448
      495354434F544108000400000000001149444341525445495241584556454E54
      4F0800040000000000114944504C414E50524556435442504154520800040000
      0000000C4441544148495354434F544108000800000000000B564C5248495354
      434F544108000400000000001049444341525445495241494E56455354080004
      00000000001049444341525445495241474552454E4308000400000000000D44
      4553434341495841434F54410100490000000100055749445448020002002800
      0F535441415449564F5041535349564F01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020001000E494454
      49504F4F5045524143414F08000400000000000C49445449504F494E56455354
      0800040000000000074944524547524108000400000000001049445449504F44
      455350494E5645535408000400000000000E4445534343415254494E56455354
      0100490000000100055749445448020002003C000100044C4349440400010009
      080000}
    object StringField1: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 31
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLRHISTCOTA'
      DisplayFormat = '#,##0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'IDHISTCOTA'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAHISTCOTA'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'STAATIVOPASSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField7: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'IDREGRA'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
  end
  object pmnuAltAtivo: TPopupMenu
    OnPopup = pmnuAltAtivoPopup
    Left = 88
    Top = 116
    object mnuALtA: TMenuItem
      Caption = 'Alterar'
      Enabled = False
      OnClick = dbGrdAtivoDblClick
    end
  end
  object CdsApCota: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 288
    Data = {
      9F0100009619E0BD01000000180000000E0000000000030000009F010A494448
      495354434F544108000400000000001149444341525445495241584556454E54
      4F0800040000000000114944504C414E50524556435442504154520800040000
      0000000C4441544148495354434F544108000800000000000B564C5248495354
      434F544108000400000000001049444341525445495241494E56455354080004
      00000000001049444341525445495241474552454E4308000400000000000D44
      4553434341495841434F54410100490000000100055749445448020002002800
      0F535441415449564F5041535349564F01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020001000E494454
      49504F4F5045524143414F08000400000000000C49445449504F494E56455354
      0800040000000000074944524547524108000400000000001049445449504F44
      455350494E5645535408000400000000000E4445534343415254494E56455354
      0100490000000100055749445448020002003C000100044C4349440400010009
      080000}
  end
  object CdsTotalPassivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 572
    Top = 127
  end
  object CdsTotalAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 335
  end
  object CdsBuscaEvAuto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 167
  end
end
