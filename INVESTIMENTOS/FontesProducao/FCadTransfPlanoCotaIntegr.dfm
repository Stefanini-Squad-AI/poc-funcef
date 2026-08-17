inherited frmCadTransfPlanoCotaIntegr: TfrmCadTransfPlanoCotaIntegr
  Left = 17
  Top = 31
  HelpContext = 790209
  Caption = 'Operação'
  ClientHeight = 513
  ClientWidth = 777
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel [0]
    Left = 0
    Top = 78
    Width = 777
    Height = 3
    Align = alTop
    Shape = bsBottomLine
  end
  inherited pnlFundo: TPanel
    Top = 81
    Width = 777
    Height = 393
    inherited pnlControles: TPanel
      Width = 775
      Height = 391
    end
    inherited dbGrd: TwwDBGrid
      Width = 775
      Height = 391
      Selected.Strings = (
        'DATAOPERACAO'#9'10'#9'Operação'
        'IDLOTE'#9'10'#9'Lote'
        'DESCFUNDOINVEST'#9'35'#9'Fundo de Investimentos'
        'PLANOPATROORIG'#9'29'#9'Plano Origem'
        'PLANOPATRODEST'#9'29'#9'Plano Destino'
        'DATALIQUIDACAO'#9'10'#9'Liquidação'
        'QTDOPERACAO'#9'22'#9'Quantidade Transf.'
        'VLROPERACAO'#9'18'#9'Valor Transf.'
        'PERCENTUAL'#9'12'#9'%')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ParentFont = False
      PopupMenu = pmnuFixaColunas
      TitleAlignment = taCenter
      TitleFont.Color = clMaroon
      OnCalcCellColors = PintaGridZebrado
      OnDblClick = nil
      OnTopRowChanged = GridRefresh
    end
  end
  object pnlSaldos: TPanel [2]
    Left = 0
    Top = 81
    Width = 777
    Height = 393
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 4
    object dbgSaldos: TwwDBGrid
      Left = 1
      Top = 91
      Width = 775
      Height = 301
      Selected.Strings = (
        'DATAAPLICACAO'#9'12'#9'Dt Aplicação'
        'SALDOQTDCOTAS'#9'22'#9'Quantidade Origem'
        'SALDOVLRFUNDO'#9'20'#9'Saldo Origem'
        'VLRVARIACAO'#9'18'#9'Variação Origem'
        'PERCENTUALTRANSF'#9'10'#9'%'
        'SALDOQTDTRANSF'#9'22'#9'Quantidade Transf.'
        'SALDOVLRTRANSF'#9'20'#9'Saldo Transf.'
        'VLRVARTRANSF'#9'18'#9'Variação Transf.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsSaldoTransf
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ParentFont = False
      PopupMenu = ppmSaldos
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = PintaGridZebrado
      IndicatorColor = icBlack
      OnTopRowChanged = GridRefresh
    end
    object pnlAltSaldos: TPanel
      Left = 1
      Top = 91
      Width = 775
      Height = 301
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      object lblPercentualTransf: TLabel
        Left = 7
        Top = 10
        Width = 131
        Height = 13
        Caption = 'Percentual a Transferir'
      end
      object lblQtdTransf: TLabel
        Left = 7
        Top = 59
        Width = 135
        Height = 13
        Caption = 'Quantidade a Transferir'
      end
      object lblVlrTransf: TLabel
        Left = 7
        Top = 107
        Width = 99
        Height = 13
        Caption = 'Valor a Transferir'
      end
      object Label2: TLabel
        Left = 7
        Top = 155
        Width = 120
        Height = 13
        Caption = 'Variação a Transferir'
      end
      object redtPercentualTransf: TDBRealEdit
        Left = 7
        Top = 25
        Width = 88
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,0000')
        TabOrder = 0
        WordWrap = False
        OnEnter = redtPercentualTransfEnter
        OnExit = redtPercentualTransfExit
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENTUALTRANSF'
        DataSource = DsSaldoTransf
      end
      object redQtdTransf: TDBRealEdit
        Left = 7
        Top = 74
        Width = 184
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,000000000000')
        TabOrder = 1
        WordWrap = False
        IntDigits = 15
        DecDigits = 12
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALDOQTDTRANSF'
        DataSource = DsSaldoTransf
      end
      object redVlrTransf: TDBRealEdit
        Left = 7
        Top = 122
        Width = 153
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALDOVLRTRANSF'
        DataSource = DsSaldoTransf
      end
      object Dock974: TDock97
        Left = 683
        Top = 2
        Width = 90
        Height = 297
        AllowDrag = False
        BoundLines = [blLeft]
        Position = dpRight
        object tb97Detalhe: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97Detalhe'
          DockPos = 0
          TabOrder = 0
          object bbtnOkDet: TBitBtn
            Left = 0
            Top = 0
            Width = 85
            Height = 27
            Caption = 'OK'
            TabOrder = 0
            OnClick = bbtnOkDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
          end
          object bbtnCancelarDet: TBitBtn
            Left = 0
            Top = 27
            Width = 85
            Height = 27
            Cancel = True
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = bbtnCancelarDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Spacing = -1
          end
          object bbtnVoltarDet: TBitBtn
            Left = 0
            Top = 54
            Width = 85
            Height = 27
            Cancel = True
            Caption = '&Voltar'
            TabOrder = 2
            OnClick = bbtnCancelarDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
      object redVarTransf: TDBRealEdit
        Left = 7
        Top = 170
        Width = 128
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRVARTRANSF'
        DataSource = DsSaldoTransf
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 90
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object lblDtOperacao: TLabel
        Left = 225
        Top = 6
        Width = 73
        Height = 13
        Caption = 'Dt Operação'
      end
      object lblPlanoPatroOrigem: TLabel
        Left = 335
        Top = 6
        Width = 187
        Height = 13
        Caption = 'Plano / Patrocinadora de Origem'
      end
      object lblFundo: TLabel
        Left = 5
        Top = 47
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object lblPercentual: TLabel
        Left = 591
        Top = 47
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object lblClasse: TLabel
        Left = 5
        Top = 6
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
      end
      object lblPlanoPatroDestino: TLabel
        Left = 335
        Top = 47
        Width = 191
        Height = 13
        Caption = 'Plano / Patrocinadora de Destino'
      end
      object lblTipoCota: TLabel
        Left = 591
        Top = 6
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
        Visible = False
      end
      object dbDtaOperacao: TCMDateTimePicker
        Left = 225
        Top = 21
        Width = 105
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
        TabOrder = 1
        OnExit = dbDtaOperacaoExit
      end
      object dblkPlanPatroOrig: TwwDBLookupCombo
        Left = 335
        Top = 21
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = QryPlanoPatroOrigem
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkPlanPatroOrigExit
      end
      object dblkFundoInvest: TwwDBLookupCombo
        Left = 5
        Top = 62
        Width = 325
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'DESCFUNDOINVEST'#9'F')
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object redtPercentual: TRealEdit
        Left = 591
        Top = 62
        Width = 70
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '100,0000')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
      end
      object dblkTipoFundo: TwwDBLookupCombo
        Left = 5
        Top = 21
        Width = 216
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'DESCTIPOFUNDOINV'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkTipoFundoExit
      end
      object dblkPlanPatroDest: TwwDBLookupCombo
        Left = 335
        Top = 62
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = QryPlanoPatroDestino
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkTipoCota: TwwDBLookupCombo
        Left = 591
        Top = 21
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'20'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loColLines, loRowLines]
        TabOrder = 3
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 777
  end
  inherited Dock971: TDock97
    Top = 474
    Width = 777
    inherited tb97Fundo: TToolbar97
      Left = 605
      DockPos = 761
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 352
      DockPos = 505
      inherited ToolbarSep971: TToolbarSep97
        Left = 165
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 84
      end
      inherited bbtnCancelar: TBitBtn
        Left = 168
      end
      object sbtnFiltrar: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Filtrar'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = sbtnFiltrarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333FFF333333333333000333
          3333333333777F33333333333308033333333333337F7F3333333333330B0333
          33333333337F7F33333333333301033333333333337F7F333333330033080333
          33333377F3777FF333333033001F103333333733777777FF3333033301B1F103
          33337F337737777FF3330330881BFB7033337F37F3737F77F333303088881F70
          333337F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
          C43337777777777777F334444444444444333777777777777733333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    inline fraMens: TfraMensagem
      Width = 350
      Height = 38
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 350
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Width = 215
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Width = 213
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 216
          Width = 133
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 131
            Height = 34
          end
        end
      end
    end
  end
  object pnlTitulo: TPanel [5]
    Left = 0
    Top = 47
    Width = 777
    Height = 31
    Align = alTop
    TabOrder = 3
    object lbNomItem: TfcLabel
      Left = 13
      Top = 3
      Width = 503
      Height = 24
      Caption = 'Transferência entre Planos de Cotas a Integralizar'
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 2
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 499
    Top = 243
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDLOTE = :IDLOTE'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO'
      ' ')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, IDTIPOOPERACAO,'
      
        '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, VLR' +
        'OPERACAO,'
      '   VLRCOTA, VLRIOF, VLRRENDIMENTO, IDOPERACAOORIGEM,'
      
        '   IDPLANPREVCTBPATR, DATACOTIZACAO, OBSERVACAO, PLANO, PLNCODIG' +
        'O, CODDOCUMENTO,'
      '   IDLOTE)'
      'values'
      
        '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, :IDTIPOI' +
        'NVEST, :IDTIPOOPERACAO,'
      
        '   :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDACAO, :QTDOPERACAO,' +
        ' :VLROPERACAO,'
      '   :VLRCOTA, :VLRIOF, :VLRRENDIMENTO, :IDOPERACAOORIGEM,'
      
        '   :IDPLANPREVCTBPATR, :DATACOTIZACAO, :OBSERVACAO, :PLANO, :PLN' +
        'CODIGO, :CODDOCUMENTO,'
      '   :IDLOTE)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 499
    Top = 290
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.IDLOTE'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLROPERACAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Operação'
      'Lote'
      'Fundo de Investimentos'
      'Quantidade Transf.'
      'Valor Transf.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'TIPOFUNDOINVEST'
      'FUNDOINVEST')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDLOTE')
    Filtro.Strings = (
      'TIPOFUNDOINVEST.IDTIPOINVEST  = OPERACAOFUNDO.IDTIPOINVEST'
      
        'FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVES' +
        'T'
      'FUNDOINVEST.IDFUNDOINVEST     = OPERACAOFUNDO.IDFUNDOINVEST'
      
        'OPERACAOFUNDO.IDTIPOOPERACAO  = -165 OR OPERACAOFUNDO.IDTIPOOPER' +
        'ACAO  = -173'
      'OPERACAOFUNDO.IDLOTE IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,#0.000000000'
      '###,###,###,##0.00')
    Larguras.Strings = (
      '10'
      '10'
      '40'
      '18'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    Left = 333
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 265
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 300
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT OP.IDLOTE, PPO.PLANOPATROORIG, PPD.PLANOPATRODEST, TF.DES' +
        'CTIPOFUNDOINV, FI.DESCFUNDOINVEST,'
      
        '       OP.DATAOPERACAO, OP.DATALIQUIDACAO, OD.QTDOPERACAO, OD.VL' +
        'ROPERACAO, OD.VLRIOF, OD.VLRRENDIMENTO,'
      
        '       PPO.IDPLANPREVCTBPATRO, PPD.IDPLANPREVCTBPATRD, TF.IDTIPO' +
        'FUNDOINVEST, OP.IDFUNDOINVEST,'
      '       FI.DTAINIPROC, OP.PERCENTUAL, OP.IDTIPOCOTA'
      'FROM OPERACAOFUNDO OP, OPERACAOFUNDO OD, TIPOFUNDOINVEST TF,'
      '    (SELECT'
      
        '        IDFUNDOINVEST, DESCFUNDOINVEST, IDTIPOFUNDOINVEST, DTAIN' +
        'IPROC'
      '     FROM HISTFUNDOINVEST'
      
        '     WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39') IN'
      
        '           (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD' +
        '/MM/YYYY, HH24:MI:SS'#39')'
      '            FROM HISTFUNDOINVEST'
      '            WHERE   (IDFUNDOINVEST > 0)'
      
        '             AND    (DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/' +
        'YYYY'#39')+1)'
      '            GROUP BY IDFUNDOINVEST))) FI,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.I' +
        'DPLANPREVCTBPATR AS IDPLANPREVCTBPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATRODEST, PA.I' +
        'DPLANPREVCTBPATR AS IDPLANPREVCTBPATRD'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD'
      'WHERE'
      '      (OP.IDTIPOINVEST    = :IDTIPOINVEST)'
      '  AND  ((:IDLOTE IS NULL) OR (OP.IDLOTE = :IDLOTE))'
      '  AND (OP.IDTIPOOPERACAO    = -165)'
      '  AND (OD.IDTIPOOPERACAO    = -173)'
      '  AND (OD.IDOPERACAOORIGEM  = OP.IDOPERACAOORIGEM)'
      '  AND (OP.IDLOTE            = OD.IDLOTE)'
      '  AND (OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATRO)'
      '  AND (OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATRD)'
      '  AND (OP.IDFUNDOINVEST     = FI.IDFUNDOINVEST)'
      '  AND (TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST)'
      'ORDER BY OP.IDLOTE')
    Left = 499
    Top = 197
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end>
    object qryDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Size = 30
    end
    object qryDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimentos'
      DisplayWidth = 35
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryPLANOPATROORIG: TStringField
      DisplayLabel = 'Plano Origem'
      DisplayWidth = 29
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object qryPLANOPATRODEST: TStringField
      DisplayLabel = 'Plano Destino'
      DisplayWidth = 29
      FieldName = 'PLANOPATRODEST'
      Size = 113
    end
    object qryDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object qryQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade Transf.'
      DisplayWidth = 22
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object qryVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Transf.'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryPERCENTUAL: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 12
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,###,####0.0000'
    end
    object qryVLRIOF: TFloatField
      DisplayLabel = 'IOF Transf.'
      DisplayWidth = 14
      FieldName = 'VLRIOF'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryVLRRENDIMENTO: TFloatField
      DisplayLabel = 'Variação Transf.'
      DisplayWidth = 17
      FieldName = 'VLRRENDIMENTO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDESCTIPOFUNDOINV: TStringField
      DisplayWidth = 80
      FieldName = 'DESCTIPOFUNDOINV'
      Visible = False
      Size = 80
    end
    object qryIDPLANPREVCTBPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATRO'
      Visible = False
    end
    object qryIDPLANPREVCTBPATRD: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATRD'
      Visible = False
    end
    object qryIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object qryIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
  end
  object QryPlanoPatroOrigem: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 314
    Top = 197
  end
  object QryPlanoPatroDestino: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '    (PA.IDPATRO = PE.IDPESSOA(+))'
      'AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      
        'AND (((:IDPLANPREVCTBPATR IS NULL)     AND (PA.IDPLANPREVCTBPATR' +
        '  > 0)) OR'
      
        '     ((:IDPLANPREVCTBPATR IS NOT NULL) AND (PA.IDPLANPREVCTBPATR' +
        ' <> :IDPLANPREVCTBPATR)))'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end>
  end
  object QrySaldoTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     TF.DESCTIPOFUNDOINV,'
      
        '     FI.DESCFUNDOINVEST   , FI.PZOLIQRESG        , FI.PZOLIQAPLI' +
        'C   , FI.DATACOTIZACAO,'
      
        '     FI.QTDDECQTD         , FI.QTDDECVALOR       , FI.PZOCOTAPLI' +
        'C   , FI.PZOCOTRESG,'
      
        '     H1.DATAAPLICACAO     , H1.DATAHISTCOTAINTEG , H1.IDOPERACAO' +
        'FUNDO,'
      '     0 AS VLRVARIACAO     ,'
      '     H1.QTDHISTCOTAINTEGR AS SALDOQTDCOTAS,'
      '     H1.VLRHISTCOTAINTEGR AS SALDOVLRFUNDO,'
      
        '     ROUND((H1.QTDHISTCOTAINTEGR*(:PERCENTUAL / 100)),:QTDDEC) A' +
        'S SALDOQTDTRANSF,'
      
        '     ROUND((H1.VLRHISTCOTAINTEGR*(:PERCENTUAL / 100)),2) AS SALD' +
        'OVLRTRANSF,'
      '     0 AS VLRVARTRANSF,'
      '    (1 * NVL(:PERCENTUAL,0)) AS PERCENTUALTRANSF,'
      '     H1.VLRCOTAINTEGR'
      ''
      'FROM HISTCOTAINTEGRALIZA H1,'
      
        '    (SELECT IDFUNDOINVEST, IDTIPOFUNDOINVEST, DESCFUNDOINVEST, P' +
        'ZOLIQRESG, PZOLIQAPLIC,'
      
        '            QTDDECQTD, QTDDECVALOR, PZOCOTAPLIC, PZOCOTRESG, DAT' +
        'ACOTIZACAO'
      '     FROM HISTFUNDOINVEST'
      
        '     WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39')'
      
        '            IN (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST'
      '                WHERE'
      
        '                    (((:IDTIPOFUNDOINVEST IS NULL) AND (IDTIPOFU' +
        'NDOINVEST > 0)) OR'
      '                       (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (((:IDFUNDOINVEST IS NULL)     AND (IDFUNDOI' +
        'NVEST > 0)) OR'
      '                       (IDFUNDOINVEST     = :IDFUNDOINVEST))'
      
        '                AND    (DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/' +
        'MM/YYYY'#39')+1)'
      '                GROUP BY IDFUNDOINVEST))) FI, TIPOFUNDOINVEST TF'
      'WHERE'
      '      (H1.IDHISTCOTAINTEGR IN'
      '        (SELECT MAX(H2.IDHISTCOTAINTEGR) AS IDHISTCOTAINTEGR'
      '         FROM   HISTCOTAINTEGRALIZA  H2'
      '         WHERE'
      
        '                  (H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDF' +
        'UNDOINVEST||H2.DATAAPLICACAO||H2.DATAHISTCOTAINTEG||H2.IDTIPOCOT' +
        'A IN'
      
        '          (SELECT  HI.IDTIPOINVEST||HI.IDPLANPREVCTBPATR||HI.IDF' +
        'UNDOINVEST||HI.DATAAPLICACAO||MAX(HI.DATAHISTCOTAINTEG)||HI.IDTI' +
        'POCOTA'
      '           FROM HISTCOTAINTEGRALIZA HI'
      '           WHERE'
      '                   (HI.IDTIPOINVEST       = :IDTIPOINVEST)'
      ''
      
        '             AND   (((:IDPLANPREVCTBPATR IS NULL)    AND (HI.IDP' +
        'LANPREVCTBPATR > 0)) OR'
      '                   (HI.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR))'
      ''
      
        '             AND   (((:IDFUNDOINVEST IS NULL)        AND (HI.IDF' +
        'UNDOINVEST > 0)) OR'
      '                   (HI.IDFUNDOINVEST      = :IDFUNDOINVEST))'
      ''
      
        '             AND   (HI.DATAAPLICACAO     < TO_DATE(:DATAMOVFUNDO' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '             AND   (HI.DATAHISTCOTAINTEG < TO_DATE(:DATAMOVFUNDO' +
        ','#39'DD/MM/YYYY'#39'))'
      ''
      
        '             AND   (((:IDTIPOCOTA IS NOT NULL)     AND (HI.IDTIP' +
        'OCOTA     = :IDTIPOCOTA)) OR'
      '                     (:IDTIPOCOTA IS NULL))'
      ''
      
        '             AND (((HI.IDTIPOINVEST IN (9,10))     AND (HI.IDTIP' +
        'OCOTA > 0)) OR'
      
        '                  ((HI.IDTIPOINVEST NOT IN (9,10)) AND (HI.IDTIP' +
        'OCOTA IS NULL)))'
      ''
      '             AND   (HI.TIPMOVCOTAINTEGR = '#39'ATU'#39')'
      
        '           GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.ID' +
        'FUNDOINVEST, HI.DATAAPLICACAO, HI.IDTIPOCOTA) )'
      
        '        GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUN' +
        'DOINVEST, H2.DATAAPLICACAO,'
      '                 H2.DATAHISTCOTAINTEG, H2.IDTIPOCOTA))'
      '  AND (H1.QTDHISTCOTAINTEGR > 0)'
      '  AND (FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)'
      '  AND (TF.IDTIPOINVEST      = H1.IDTIPOINVEST)'
      '  AND (TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST)'
      'ORDER BY DESCFUNDOINVEST, DATAAPLICACAO'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdSaldoTransf
    ValidateWithMask = True
    Left = 416
    Top = 197
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDDEC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QrySaldoTransfDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Dt Aplicação'
      DisplayWidth = 12
      FieldName = 'DATAAPLICACAO'
    end
    object QrySaldoTransfSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade Origem'
      DisplayWidth = 22
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoTransfSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Saldo Origem'
      DisplayWidth = 20
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoTransfVLRVARIACAO: TFloatField
      DisplayLabel = 'Variação Origem'
      DisplayWidth = 18
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoTransfPERCENTUALTRANSF: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 10
      FieldName = 'PERCENTUALTRANSF'
      DisplayFormat = '###,#0.0000'
    end
    object QrySaldoTransfSALDOQTDTRANSF: TFloatField
      DisplayLabel = 'Quantidade Transf.'
      DisplayWidth = 22
      FieldName = 'SALDOQTDTRANSF'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoTransfSALDOVLRTRANSF: TFloatField
      DisplayLabel = 'Saldo Transf.'
      DisplayWidth = 20
      FieldName = 'SALDOVLRTRANSF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoTransfVLRVARTRANSF: TFloatField
      DisplayLabel = 'Variação Transf.'
      DisplayWidth = 18
      FieldName = 'VLRVARTRANSF'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoTransfDESCTIPOFUNDOINV: TStringField
      DisplayWidth = 80
      FieldName = 'DESCTIPOFUNDOINV'
      Visible = False
      Size = 80
    end
    object QrySaldoTransfDESCFUNDOINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Visible = False
      Size = 60
    end
    object QrySaldoTransfPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QrySaldoTransfPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QrySaldoTransfDATACOTIZACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACOTIZACAO'
      Visible = False
    end
    object QrySaldoTransfQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QrySaldoTransfQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QrySaldoTransfPZOCOTAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCOTAPLIC'
      Visible = False
    end
    object QrySaldoTransfPZOCOTRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCOTRESG'
      Visible = False
    end
    object QrySaldoTransfDATAHISTCOTAINTEG: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAHISTCOTAINTEG'
      Visible = False
    end
    object QrySaldoTransfIDOPERACAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QrySaldoTransfVLRCOTAINTEGR: TFloatField
      FieldName = 'VLRCOTAINTEGR'
    end
  end
  object DsSaldoTransf: TwwDataSource
    AutoEdit = False
    DataSet = QrySaldoTransf
    OnStateChange = DsSaldoTransfStateChange
    Left = 420
    Top = 243
  end
  object pmnuFixaColunas: TPopupMenu
    OnPopup = pmnuFixaColunasPopup
    Left = 314
    Top = 290
    object FixarColuna1: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = FixarColuna1Click
    end
    object LiberarColuna1: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = LiberarColuna1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LiberaTodasasColunas1: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = LiberaTodasasColunas1Click
    end
  end
  object ppmSaldos: TPopupMenu
    OnPopup = pmnuFixaColunasPopup
    Left = 314
    Top = 338
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
    object mnuExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = mnuExcluirClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object FixarColuna2: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = FixarColuna1Click
    end
    object LiberarColuna2: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = LiberarColuna1Click
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object LiberaTodasasColunas2: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = LiberaTodasasColunas1Click
    end
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H'
      'FROM   TIPOFUNDOINVEST'
      'WHERE'
      '    (IDTIPOFUNDOINVEST > 0)'
      'AND (IDTIPOINVEST      = :IDTIPOINVEST)'
      ''
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object QryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.MOECODIGO ' +
        '        , FUN.IDCARTEIRAINVEST  ,'
      
        '  FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO         , FUN.STAEXCLUSI' +
        'VO      , FUN.PZOCARENCIA       ,'
      
        '  FUN.PZOCOTAPLIC       , FUN.PZOCOTRESG        , FUN.PZOLIQAPLI' +
        'C       , FUN.PZOLIQRESG        ,'
      
        '  FUN.PZOANIVERSARIO    , FUN.QTDDECQTD         , FUN.QTDDECVALO' +
        'R       , FUN.STAFUNDO          ,'
      
        '  FUN.PZOAMORTIZACAO    , FUN.PERCTXPERFORM     , FUN.PERCTXADM ' +
        '        , FUN.CODFUNCETIP       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        , FUN.DTAINIPROC        ,'
      '  FUN.IDGESTORCARTEIRA'
      'FROM'
      ' (SELECT'
      
        '     IDFUNDOINVEST     , DESCFUNDOINVEST   , MOECODIGO         ,' +
        ' IDCARTEIRAINVEST  ,'
      
        '     IDTIPOFUNDOINVEST , CNPJFUNDO         , STAEXCLUSIVO      ,' +
        ' PZOCARENCIA       ,'
      
        '     PZOCOTAPLIC       , PZOCOTRESG        , PZOLIQAPLIC       ,' +
        ' PZOLIQRESG        ,'
      
        '     PZOANIVERSARIO    , QTDDECQTD         , QTDDECVALOR       ,' +
        ' STAFUNDO          ,'
      
        '     PZOAMORTIZACAO    , PERCTXPERFORM     , PERCTXADM         ,' +
        ' CODFUNCETIP       ,'
      
        '     STAPROVISIONAIR   , STAPROVISIONAIOF  , CONTRCETIP        ,' +
        ' DTAINIPROC        ,'
      '     IDGESTORCARTEIRA'
      '  FROM HISTFUNDOINVEST'
      
        '  WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:' +
        'MI:SS'#39') IN'
      
        '        (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/MM' +
        '/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST'
      '         WHERE   (IDFUNDOINVEST > 0)'
      
        '          AND    (DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYY' +
        'Y'#39')+1)'
      
        '          AND (((:IDTIPOFUNDOINVEST IS NULL)         AND (IDTIPO' +
        'FUNDOINVEST > 0)) OR'
      
        '               ((:IDTIPOFUNDOINVEST IS NOT NULL)     AND (IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST)))'
      '         GROUP BY IDFUNDOINVEST))) FUN,'
      '  TIPOFUNDOINVEST TFI'
      'WHERE'
      
        '     (((:IDTIPOFUNDOINVEST IS NULL)         AND (TFI.IDTIPOFUNDO' +
        'INVEST > 0)) OR'
      
        '      ((:IDTIPOFUNDOINVEST IS NOT NULL)     AND (TFI.IDTIPOFUNDO' +
        'INVEST = :IDTIPOFUNDOINVEST)))'
      'AND (TFI.IDTIPOINVEST      = :IDTIPOINVEST)'
      'AND (FUN.IDFUNDOINVEST     > 0)'
      'AND (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 243
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object UpdSaldoTransf: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCOTAINTEGRALIZA'
      'set'
      '  DATAHISTCOTAINTEG = :DATAHISTCOTAINTEG,'
      '  VLRHISTCOTAINTEGR = :VLRHISTCOTAINTEGR,'
      '  QTDHISTCOTAINTEGR = :QTDHISTCOTAINTEGR,'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  DATAAPLICACAO = :DATAAPLICACAO'
      'where'
      '  DATAHISTCOTAINTEG = :OLD_DATAHISTCOTAINTEG and'
      '  VLRHISTCOTAINTEGR = :OLD_VLRHISTCOTAINTEGR and'
      '  QTDHISTCOTAINTEGR = :OLD_QTDHISTCOTAINTEGR and'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO and'
      '  DATAAPLICACAO = :OLD_DATAAPLICACAO')
    InsertSQL.Strings = (
      'insert into HISTCOTAINTEGRALIZA'
      '  (DATAHISTCOTAINTEG, VLRHISTCOTAINTEGR, QTDHISTCOTAINTEGR, '
      'IDOPERACAOFUNDO, '
      '   DATAAPLICACAO)'
      'values'
      '  (:DATAHISTCOTAINTEG, :VLRHISTCOTAINTEGR, :QTDHISTCOTAINTEGR, '
      ':IDOPERACAOFUNDO, '
      '   :DATAAPLICACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCOTAINTEGRALIZA'
      'where'
      '  DATAHISTCOTAINTEG = :OLD_DATAHISTCOTAINTEG and'
      '  VLRHISTCOTAINTEGR = :OLD_VLRHISTCOTAINTEGR and'
      '  QTDHISTCOTAINTEGR = :OLD_QTDHISTCOTAINTEGR and'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO and'
      '  DATAAPLICACAO = :OLD_DATAAPLICACAO')
    Left = 419
    Top = 290
  end
  object QryTipoFundoMax: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(DATAULTFECH) AS DATAULTFECH'
      'FROM   TIPOFUNDOINVEST'
      'WHERE'
      '    (IDTIPOFUNDOINVEST > 0)'
      'AND (IDTIPOINVEST      = :IDTIPOINVEST)')
    ValidateWithMask = True
    Left = 666
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object QryTipoFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H'
      'FROM   TIPOFUNDOINVEST'
      'WHERE'
      '    (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)'
      'AND (IDTIPOINVEST      = :IDTIPOINVEST)'
      ''
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 666
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 666
    Top = 289
  end
  object QryTipoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOCOTA, IDTIPOCOTA FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA')
    ValidateWithMask = True
    Left = 314
    Top = 161
  end
  object QryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 666
    Top = 337
  end
  object QryBuscaSaldo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     SUM(H1.QTDHISTCOTAINTEGR) AS SALDOQTDCOTAS,'
      '     SUM(H1.VLRHISTCOTAINTEGR) AS SALDOVLRFUNDO'
      ''
      'FROM HISTCOTAINTEGRALIZA H1,'
      
        '    (SELECT IDFUNDOINVEST, IDTIPOFUNDOINVEST, DESCFUNDOINVEST, P' +
        'ZOLIQRESG, PZOLIQAPLIC,'
      
        '            QTDDECQTD, QTDDECVALOR, PZOCOTAPLIC, PZOCOTRESG, DAT' +
        'ACOTIZACAO'
      '     FROM HISTFUNDOINVEST'
      
        '     WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39')'
      
        '            IN (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST'
      '                WHERE'
      
        '                    (((:IDTIPOFUNDOINVEST IS NULL) AND (IDTIPOFU' +
        'NDOINVEST > 0)) OR'
      '                       (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (((:IDFUNDOINVEST IS NULL)     AND (IDFUNDOI' +
        'NVEST > 0)) OR'
      '                       (IDFUNDOINVEST     = :IDFUNDOINVEST))'
      
        '                AND    (DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/' +
        'MM/YYYY'#39')+1)'
      '                GROUP BY IDFUNDOINVEST))) FI, TIPOFUNDOINVEST TF'
      'WHERE'
      '      (H1.IDHISTCOTAINTEGR IN'
      '        (SELECT MAX(H2.IDHISTCOTAINTEGR) AS IDHISTCOTAINTEGR'
      '         FROM   HISTCOTAINTEGRALIZA  H2'
      '         WHERE'
      
        '                  (H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDF' +
        'UNDOINVEST||H2.DATAAPLICACAO||H2.DATAHISTCOTAINTEG||H2.IDTIPOCOT' +
        'A||H2.IDOPERACAOFUNDO IN'
      
        '          (SELECT  HI.IDTIPOINVEST||HI.IDPLANPREVCTBPATR||HI.IDF' +
        'UNDOINVEST||HI.DATAAPLICACAO||MAX(HI.DATAHISTCOTAINTEG)||HI.IDTI' +
        'POCOTA||HI.IDOPERACAOFUNDO'
      '           FROM HISTCOTAINTEGRALIZA HI'
      '           WHERE'
      '                   (HI.IDTIPOINVEST       = :IDTIPOINVEST)'
      ''
      '             AND   (HI.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)'
      ''
      '             AND   (HI.IDFUNDOINVEST      = :IDFUNDOINVEST)'
      ''
      
        '             AND   (((:DATAAPLICACAO IS NULL) AND  (HI.DATAAPLIC' +
        'ACAO < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39'))) OR'
      
        '                   (HI.DATAAPLICACAO      = TO_DATE(:DATAAPLICAC' +
        'AO,'#39'DD/MM/YYYY'#39')))'
      ''
      
        '             AND   (HI.DATAHISTCOTAINTEG <= TO_DATE(:DATAMOVFUND' +
        'O,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '             AND   (((:IDTIPOCOTA IS NOT NULL)      AND (HI.IDTI' +
        'POCOTA     = :IDTIPOCOTA)) OR'
      '                     (:IDTIPOCOTA IS NULL))'
      ''
      
        '             AND (((HI.IDTIPOINVEST IN (9,10))      AND (HI.IDTI' +
        'POCOTA > 0)) OR'
      
        '                  ((HI.IDTIPOINVEST NOT IN (9,10))  AND (HI.IDTI' +
        'POCOTA IS NULL)))'
      ''
      
        '           AND   (((:IDOPERACAOFUNDO IS NOT NULL)   AND (Hi.IDOP' +
        'ERACAOFUNDO     = :IDOPERACAOFUNDO)) OR'
      '                   (:IDOPERACAOFUNDO IS NULL))'
      ''
      
        '          GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDF' +
        'UNDOINVEST, HI.DATAAPLICACAO, '
      '                    HI.IDTIPOCOTA, HI.IDOPERACAOFUNDO) )'
      ''
      
        '        GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDFUN' +
        'DOINVEST, H2.DATAAPLICACAO,'
      
        '                 H2.DATAHISTCOTAINTEG, H2.IDTIPOCOTA, H2.IDOPERA' +
        'CAOFUNDO))'
      '  AND (H1.QTDHISTCOTAINTEGR > 0)'
      '  AND (FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)'
      '  AND (TF.IDTIPOINVEST      = H1.IDTIPOINVEST)'
      '  AND (TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST)'
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
    object QryBuscaSaldoSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
    end
    object QryBuscaSaldoSALDOVLRFUNDO: TFloatField
      FieldName = 'SALDOVLRFUNDO'
    end
  end
end
