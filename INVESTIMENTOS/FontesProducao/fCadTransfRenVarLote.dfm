inherited frmCadTransfRenVarLote: TfrmCadTransfRenVarLote
  Left = 269
  Top = 33
  HelpContext = 790282
  Caption = 'frmCadTransfRenVarLote'
  ClientHeight = 571
  ClientWidth = 830
  OnKeyUp = FormKeyUp 
  PixelsPerInch = 96 
  TextHeight = 13
  object Bevel2: TBevel [0]
    Left = 0
    Top = 78
    Width = 830
    Height = 3
    Align = alTop
    Shape = bsBottomLine
  end
  inherited pnlFundo: TPanel
    Top = 81
    Width = 830
    Height = 451
    inherited pnlControles: TPanel
      Width = 828
      Height = 449
    end
    inherited dbGrd: TwwDBGrid
      Width = 828
      Height = 449
      Selected.Strings = (
        'DATAOPERACAO'#9'16'#9'Data da Operação'
        'NUMDOCUMENTO'#9'17'#9'Boleta'
        'DESCINVESTIMENTO'#9'25'#9'Ação'
        'SGLCUSTODIANTE'#9'25'#9'Custodiante'
        'PLANOPATROORIG'#9'40'#9'Plano/Patrocinadora Origem'
        'PLANOPATRODEST'#9'40'#9'Plano/Patrocinadora Destino'
        'QTDEOPERACAO'#9'25'#9'Quantidade'#9'F'
        'PERCENTUAL'#9'10'#9'Percentual')
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
    Width = 830
    Height = 451
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 4
    object pnlAltSaldos: TPanel
      Left = 1
      Top = 128
      Width = 828
      Height = 322
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object lblPercentualTransf: TLabel
        Left = 32
        Top = 36
        Width = 131
        Height = 13
        Caption = 'Percentual a Transferir'
      end
      object lblQtdTransf: TLabel
        Left = 32
        Top = 90
        Width = 135
        Height = 13
        Caption = 'Quantidade a Transferir'
      end
      object lblVlrTransf: TLabel
        Left = 32
        Top = 148
        Width = 99
        Height = 13
        Caption = 'Valor a Transferir'
      end 
      object redtPercentualTransf: TDBRealEdit
        Left = 32
        Top = 51
        Width = 153
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 0
        WordWrap = False
        OnEnter = redtPercentualTransfEnter
        OnExit = redtPercentualTransfExit
        IntDigits = 10
        DecDigits = 15
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCTRANSFERIDO'
        DataSource = dsSaldosATransf
      end
      object redQtdTransf: TDBRealEdit
        Left = 32
        Top = 105
        Width = 153
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 15
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDTRANSFERIDO'
        DataSource = dsSaldosATransf
      end
      object redVlrTransf: TDBRealEdit
        Left = 32
        Top = 163
        Width = 153
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRTRANSFERIDO'
        DataSource = dsSaldosATransf
      end
      object Dock974: TDock97
        Left = 736
        Top = 2
        Width = 90
        Height = 318
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
    end
    object dbgSaldos: TwwDBGrid
      Left = 1
      Top = 128
      Width = 828
      Height = 322
      PictureMasks.Strings = (
        'SALDOQTDEINVCART'#9'###,###,###,###,###,##0'#9'T'#9'T'
        'PERCTRANSFERIDO'#9'##0,00'#9'T'#9'T'
        'QTDTRANSFERIDO'#9'###,###,###,###,###,##0'#9'T'#9'T')
      Selected.Strings = (
        'DESCCARTINVEST'#9'40'#9'Carteira'#9'F'
        'DESCINVESTIMENTO'#9'25'#9'Ação'#9'F'
        'SALDOQTDEINVCART'#9'20'#9'Saldo Qtd. Atual'#9'F'
        'PERCTRANSFERIDO'#9'10'#9'Percentual'#9'F'
        'QTDTRANSFERIDO'#9'20'#9'Qtd. Transferida'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsSaldosATransf
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ParentFont = False
      PopupMenu = ppmSaldos
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = PintaGridZebrado
      OnDblClick = dbgSaldosDblClick
      IndicatorColor = icBlack
      OnTopRowChanged = GridRefresh
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 828
      Height = 127
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lblPlanoPatroOrigem: TLabel
        Left = 10
        Top = 4
        Width = 187
        Height = 13
        Caption = 'Plano / Patrocinadora de Origem'
      end
      object lblPlanoPatroDestino: TLabel
        Left = 10
        Top = 44
        Width = 191
        Height = 13
        Caption = 'Plano / Patrocinadora de Destino'
      end
      object lblCarteira: TLabel
        Left = 258
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object lblInvestimento: TLabel
        Left = 258
        Top = 44
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblDtOperacao: TLabel
        Left = 504
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Dt Operação'
      end
      object lblPercentual: TLabel
        Left = 504
        Top = 44
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object lblObservacao: TLabel
        Left = 621
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label1: TLabel
        Left = 10
        Top = 84
        Width = 121
        Height = 13
        Caption = 'Custodia de Exceção'
      end
      object Label2: TLabel
        Left = 258
        Top = 100
        Width = 327
        Height = 13
        Caption = '( Esta Custodia, caso preenchida,  NÃO será transferida )'
      end
      object dblkPlanPatroO: TwwDBLookupCombo
        Left = 10
        Top = 19
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = qryPlanoPatroOrig
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkPlanPatroD: TwwDBLookupCombo
        Left = 10
        Top = 59
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = qryPlanoPatroDestino
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkCarteira: TwwDBLookupCombo
        Left = 258
        Top = 19
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'30'#9'Carteira'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 258
        Top = 59
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'30'#9'Descrição'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO;IDOPERRENFIXAPLIC'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbDtaOperacao: TCMDateTimePicker
        Left = 504
        Top = 19
        Width = 110
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
        TabOrder = 4
      end
      object redtPercentual: TRealEdit
        Left = 504
        Top = 59
        Width = 110
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '100,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object memObs: TMemo
        Left = 620
        Top = 19
        Width = 178
        Height = 60
        TabOrder = 6
      end
      object dblCustodia: TwwDBLookupCombo
        Left = 10
        Top = 99
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'10'#9'Nome'#9'F')
        LookupTable = qryCustodiante
        LookupField = 'IDCUSTODIANTE'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 830
  end
  inherited Dock971: TDock97
    Top = 532
    Width = 830
    inherited tb97Fundo: TToolbar97
      Left = 658
      DockPos = 761
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 405
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
      Width = 386
      Height = 38
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 386
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Width = 240
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Width = 238
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 241
          Width = 144
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 142
            Height = 34
          end
        end
      end
    end
  end
  object pnlTitulo: TPanel [5]
    Left = 0
    Top = 47
    Width = 830
    Height = 31
    Align = alTop
    TabOrder = 3
    object lbNomItem: TfcLabel
      Left = 13
      Top = 3
      Width = 360
      Height = 24
      Caption = 'Transferência entre Planos em Lote'
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
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 399
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERRENFIX'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VENCOPERACAO = :VENCOPERACAO,'
      '  BOLETA = :BOLETA'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX')
    InsertSQL.Strings = (
      'insert into OPERRENFIX'
      
        '  (IDINVESTIMENTO, IDPLANPREVCTBPATR, DATAOPERACAO, VLROPERACAO,' +
        ' '
      'QTDEOPERACAO, '
      '   VENCOPERACAO, BOLETA)'
      'values'
      '  (:IDINVESTIMENTO, :IDPLANPREVCTBPATR, :DATAOPERACAO, '
      ':VLROPERACAO, :QTDEOPERACAO, '
      '   :VENCOPERACAO, :BOLETA)')
    DeleteSQL.Strings = (
      'delete from OPERRENFIX'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX')
    Left = 427
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OPERACAOINVEST.DATAOPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERACAOINVEST.NUMDOCUMENTO'
      'OPERACAOINVEST.QTDEOPERACAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Data da Operação'
      'Ação'
      'Boleta'
      'Quantidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVESTIMENTO'
      'OPERACAOINVEST')
    CamposChave.Strings = (
      'OPERACAOINVEST.IDOPERACAOINVEST'
      'OPERACAOINVEST.NUMDOCUMENTO'
      'OPERACAOINVEST.DATAOPERACAO')
    Filtro.Strings = (
      'OPERACAOINVEST.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERACAOINVEST.IDTIPOOPERACAO = -158')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###,###,##0')
    Larguras.Strings = (
      '18'
      '30'
      '30'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 333
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 249
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 292
    Top = 2
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   OP.IDOPERACAOINVEST, OP.DATAOPERACAO, OP.NUMDOCUMENTO, OP.QTD' +
        'EOPERACAO,'
      
        '   IV.DESCINVESTIMENTO, OP.IDOPERCUSTODIA, OP.IDINVESTIMENTO, OP' +
        '.IDCARTEIRAINVEST, CT.SGLCUSTODIANTE, '
      '   PPO.PLANOPATROORIG, PPD.PLANOPATRODEST,'
      
        '   (PPO.IDPLANPREVCTBPATR) AS IDPLANOPATROORIG, (PPD.IDPLANPREVC' +
        'TBPATR) AS IDPLANOPATRODEST,'
      '   OP.PERCENTUAL'
      'FROM'
      
        '   OPERACAOINVEST OP, OPERACAOINVEST OD, INVESTIMENTO IV, CUSTOD' +
        'IANTE CT,'
      
        '  (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.IDPL' +
        'ANPREVCTBPATR'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO,'
      
        '   (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATRODEST, PA.IDP' +
        'LANPREVCTBPATR'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD'
      
        'WHERE ((:NUMDOCUMENTO IS NULL) OR (OP.NUMDOCUMENTO = :NUMDOCUMEN' +
        'TO))'
      '  AND (OP.IDTIPOOPERACAO IN (-158, -10158))'
      '  AND (OD.IDTIPOOPERACAO IN (-159, -10159))'
      '  AND (OP.NUMDOCUMENTO = OD.NUMDOCUMENTO)'
      '  AND (OP.IDCARTEIRAGERENC IS NULL)'
      '  AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (OD.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR)'
      '  AND (OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATR)'
      '  AND (OP.IDCUSTODIANTE = CT.IDCUSTODIANTE(+))'
      'ORDER BY OP.DATAOPERACAO, OP.NUMDOCUMENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 363
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
        Value = 'RV-06/1250'
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 16
      FieldName = 'DATAOPERACAO'
    end
    object qryNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 17
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qrySGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 25
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryPLANOPATROORIG2: TStringField
      DisplayLabel = 'Plano/Patrocinadora Origem'
      DisplayWidth = 40
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object qryPLANOPATRODEST: TStringField
      DisplayLabel = 'Plano/Patrocinadora Destino'
      DisplayWidth = 40
      FieldName = 'PLANOPATRODEST'
      Size = 113
    end
    object qryQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 25
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,##0'
      EditFormat = '###,###,###,###,##0'
    end
    object qryPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      DisplayFormat = '#,##0.00'
    end
    object qryIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryIDOPERCUSTODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryIDPLANOPATROORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPATROORIG'
      Visible = False
    end
    object qryIDPLANOPATRODEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPATRODEST'
      Visible = False
    end
  end
  object qryPlanoPatroOrig: TwwQuery
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
    Left = 206
    Top = 93
    object qryPlanoPatroOrigIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanoPatroOrigIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanoPatroOrigIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryPlanoPatroOrigPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object qryPlanoPatroDestino: TwwQuery
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
    Left = 206
    Top = 133
    object qryPlanoPatroDestinoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanoPatroDestinoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanoPatroDestinoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryPlanoPatroDestinoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCCARTINVEST'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 93
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
    end
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDGESTORCARTEIRA'
    end
    object qryCarteiraFLGCARTPROP: TFloatField
      FieldName = 'FLGCARTPROP'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTPROP'
    end
    object qryCarteiraFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCALCDIARIO'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAINICIO'
    end
    object qryCarteiraFLGTRATALOTE: TStringField
      FieldName = 'FLGTRATALOTE'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGTRATALOTE'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.TRGDTINCLUSAO'
    end
    object qryCarteiraTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryCarteiraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPLANOPREV'
    end
    object qryCarteiraIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPATROCINADORA'
    end
    object qryCarteiraIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDTIPOINVEST'
    end
    object qryCarteiraIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDMERCADO'
    end
    object qryCarteiraFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGORDMOVINV'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAULTFECH'
    end
    object qryCarteiraIDDAIEACART: TFloatField
      FieldName = 'IDDAIEACART'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDDAIEACART'
    end
    object qryCarteiraFLGCARTLASTRO: TStringField
      FieldName = 'FLGCARTLASTRO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTLASTRO'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraFLGCARTTERC: TStringField
      FieldName = 'FLGCARTTERC'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTTERC'
      FixedChar = True
      Size = 1
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO, FLGATIVO'
      'FROM INVESTIMENTO'
      'WHERE'
      '   IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 454
    Top = 133
  end
  object dsSaldosATransf: TwwDataSource
    AutoEdit = False
    DataSet = CdsSldTRCPlanoSintetico
    OnStateChange = dsSaldosATransfStateChange
    Left = 700
    Top = 291
  end
  object pmnuFixaColunas: TPopupMenu
    OnPopup = pmnuFixaColunasPopup
    Left = 488
    Top = 2
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
    Left = 560
    Top = 2
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
  object CdsSldTRCPlanoSintetico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 700
    Top = 247
    object CdsSldTRCPlanoSinteticoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object CdsSldTRCPlanoSinteticoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsSldTRCPlanoSinteticoSALDOQTDEINVCART: TFloatField
      DisplayLabel = 'Saldo Qtd. Atual'
      DisplayWidth = 20
      FieldName = 'SALDOQTDEINVCART'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCPlanoSinteticoPERCTRANSFERIDO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCTRANSFERIDO'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object CdsSldTRCPlanoSinteticoQTDTRANSFERIDO: TFloatField
      DisplayLabel = 'Qtd. Transferida'
      DisplayWidth = 20
      FieldName = 'QTDTRANSFERIDO'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCPlanoSinteticoDATAOPERACAO: TStringField
      FieldName = 'DATAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsSldTRCPlanoSinteticoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDPLANPREVCTBORIG: TFloatField
      FieldName = 'IDPLANPREVCTBORIG'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,###,##0.00'
    end
    object CdsSldTRCPlanoSinteticoVLRTRANSFERIDO: TFloatField
      FieldName = 'VLRTRANSFERIDO'
      Visible = False
      EditFormat = '###,###,###,###,###,##0.00'
    end
    object CdsSldTRCPlanoSinteticoIDPLANPREVCTBDEST: TFloatField
      FieldName = 'IDPLANPREVCTBDEST'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object sqlSldTRCPlanoSintetico: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   '#39'01.01.1899'#39' AS DATAOPERACAO,                                ' +
        '                                                 '
      
        '   CA.DESCCARTINVEST,                                           ' +
        '                                     '
      '   IV.DESCINVESTIMENTO,'
      '   CA.IDCARTEIRAINVEST,'
      '   IV.IDINVESTIMENTO, '
      
        '   IV.IDEMISSOR,                                                ' +
        '                                     '
      
        '   (H1.IDPLANPREVCTBPATR) AS IDPLANPREVCTBORIG,                 ' +
        '                                                            '
      
        '   NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,              ' +
        '                                     '
      
        '   DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRIN' +
        'VCART,0))) AS SALDOVLRINVCART,      '
      
        '   0 AS PERCTRANSFERIDO,                                        ' +
        '                                     '
      
        '   ROUND((H1.SALDOQTDEINVCART * 0),8) AS QTDTRANSFERIDO,        ' +
        '                                     '
      
        '   ROUND((H1.SALDOVLRINVCART * 0),2) AS VLRTRANSFERIDO,         ' +
        '                                      '
      
        '   0 AS IDPLANPREVCTBDEST                                       ' +
        '                                 '
      
        'FROM                                                            ' +
        '                                     '
      
        '   HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA           ' +
        '                                  '
      
        'WHERE                                                           ' +
        '                                     '
      
        '   (H1.IDHISTCARTINV IN (SELECT MAX(H2.IDHISTCARTINV)           ' +
        '                                                           '
      
        '                         FROM HISTCARTINV H2, PARAMINVEST P2    ' +
        '                                                           '
      
        '                         WHERE                                  ' +
        '                                                              '
      
        '                            (H2.IDTIPOINVEST = 2)               ' +
        '                                                        '
      
        '                            AND ((1 IS NULL) OR (H2.IDPLANPREVCT' +
        'BPATR = 1 ))                        '
      
        '                            AND ((1 IS NULL) OR (H2.IDCARTEIRAIN' +
        'VEST = 1 ))                        '
      
        '                            AND ((2020 IS NULL) OR (H2.IDINVESTI' +
        'MENTO = 2020 ))                             '
      
        '                            AND (H2.IDCARTEIRAGERENC IS NULL)   ' +
        '                                                             '
      
        '                            AND (H2.DATAMOVCARTINV  = TO_DATE('#39'2' +
        '4/04/2006'#39','#39'DD/MM/YYYY'#39'))                                       ' +
        '            '
      
        '                            AND (H2.IDTIPOOPERACAO NOT IN (NVL(P' +
        '2.IDTIPOOPERDIRDSU,0), (NVL(P2.IDTIPOOPERDIRDSU,0) + 10000),    ' +
        '      '
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERDIRJUR,0), (NVL(P2.IDTIPOOPERDIRJUR,0) + 10000),    '
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERDIRMUL,0), (NVL(P2.IDTIPOOPERDIRMUL,0) + 10000),'
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERDIRDIV,0), (NVL(P2.IDTIPOOPERDIRDIV,0) + 10000),    ' +
        '                                                           '
      
        '                                                           NVL(P' +
        '2.IDTIPOOPERRFRAC ,0), (NVL(P2.IDTIPOOPERRFRAC ,0) + 10000)))   ' +
        '                         '
      
        'GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTI' +
        'MENTO))  '
      
        'AND (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO(+))                ' +
        '                                                                '
      'AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+))    '
      
        '                                                                ' +
        '       '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsSldTRCPlanoSintetico
    Left = 706
    Top = 343
  end
  object CdsBoletasTRP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 596
    Top = 247
  end
  object qryCustodiante: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.SGLCUSTODIANTE, H.IDCUSTODIANTE'
      'FROM HISTCUSTODIA H, CUSTODIANTE C'
      'WHERE H.IDCUSTODIANTE = C.IDCUSTODIANTE'
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 205
    Top = 173
    object qryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.HISTCUSTODIA.IDCUSTODIANTE'
      Visible = False
    end
  end
end
