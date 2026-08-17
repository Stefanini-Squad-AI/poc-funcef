inherited frmCadTransfRenVarCCeCCI: TfrmCadTransfRenVarCCeCCI
  Left = 312
  Top = 267
  HelpContext = 790283
  Caption = 'frmCadTransfRenVarCCeCCI'
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
        'NUMDOCUMENTO'#9'14'#9'Boleta'
        'DESCTIPOOPERACAO'#9'30'#9'Operação'
        'DESCINVESTIMENTO'#9'30'#9'Ação'
        'PLANOPATROORIG'#9'48'#9'Plano de Origem'
        'QTDEOPERACAO'#9'17'#9'Quantidade')
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
      Top = 93
      Width = 828
      Height = 357
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
        Top = 83
        Width = 155
        Height = 13
        Caption = 'Quantidade CC a Transferir'
      end
      object Label1: TLabel
        Left = 32
        Top = 130
        Width = 159
        Height = 13
        Caption = 'Quantidade CCI a Transferir'
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
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCTRANSFERIDO'
        DataSource = DsSldTRCCeCCCI
      end
      object redQtdCCTransf: TDBRealEdit
        Left = 32
        Top = 98
        Width = 153
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        OnExit = redQtdCCTransfExit
        IntDigits = 15
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDTRANSFERIDOCC'
        DataSource = DsSldTRCCeCCCI
      end
      object Dock974: TDock97
        Left = 736
        Top = 2
        Width = 90
        Height = 353
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
      object redQtdCCITransf: TDBRealEdit
        Left = 32
        Top = 145
        Width = 153
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 2
        WordWrap = False
        OnExit = redQtdCCITransfExit
        IntDigits = 15
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDTRANSFERIDOCCI'
        DataSource = DsSldTRCCeCCCI
      end
    end
    object dbgSaldos: TwwDBGrid
      Left = 1
      Top = 93
      Width = 828
      Height = 357
      PictureMasks.Strings = (
        'SALDOQTDEINVCART'#9'###,###,###,###,###,##0'#9'T'#9'T'
        'PERCTRANSFERIDO'#9'##0,00'#9'T'#9'T'
        'QTDTRANSFERIDO'#9'###,###,###,###,###,##0'#9'T'#9'T'
        'SALDOQTDECC'#9'###,###,###,###,###,##0'#9'T'#9'T'
        'SALDOQTDECCI'#9'###,###,###,###,###,##0'#9'T'#9'T')
      Selected.Strings = (
        'DESCCARTINVEST'#9'40'#9'Carteira'
        'DESCINVESTIMENTO'#9'25'#9'Ação'
        'SALDOQTDECC'#9'20'#9'Saldo CC'
        'SALDOQTDECCI'#9'20'#9'Saldo CCI'
        'PERCTRANSFERIDO'#9'10'#9'Percentual'
        'QTDTRANSFERIDOCC'#9'20'#9'Qtd. CC Transferida'
        'QTDTRANSFERIDOCCI'#9'20'#9'Qtd. CCI Transferida'
        'SALDOQTDECCATU'#9'20'#9'Saldo CC Atual'
        'SALDOQTDECCIATU'#9'20'#9'Saldo CCI Atual')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsSldTRCCeCCCI
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
      IndicatorColor = icBlack
      OnTopRowChanged = GridRefresh
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 828
      Height = 92
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lblPlanoPatro: TLabel
        Left = 10
        Top = 4
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object lblOperTRCCCi: TLabel
        Left = 10
        Top = 44
        Width = 56
        Height = 13
        Caption = 'Operação'
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
      object dblkPlanPatro: TwwDBLookupCombo
        Left = 10
        Top = 19
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = qryPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkOperTRCCCI: TwwDBLookupCombo
        Left = 10
        Top = 59
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'30'#9'DESCTIPOOPERACAO'#9'F')
        LookupTable = qryOperTRCCCI
        LookupField = 'IDTIPOOPERACAO'
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
        LookupField = 'IDCARTEIRA'
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
      Width = 292
      Height = 24
      Caption = 'Transferência entre CC e CCI'
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
      'OPERACAOINVEST.IDTIPOOPERACAO IN (-162, -163)'
      'OPERACAOINVEST.IDCARTEIRAGERENC IS NULL')
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
    Left = 233
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 292
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST, OP.DATAOPERACAO, OP.NUMDOCUMENTO, OP.QTD' +
        'EOPERACAO,'
      
        '   IV.DESCINVESTIMENTO, OP.IDOPERCUSTODIA, OP.IDINVESTIMENTO, OP' +
        '.IDCARTEIRAINVEST,'
      '   PPO.PLANOPATROORIG,'
      '   (PPO.IDPLANPREVCTBPATR) AS IDPLANOPATROORIG,'
      '   TP.DESCTIPOOPERACAO'
      'FROM'
      '   OPERACAOINVEST OP, INVESTIMENTO IV, TIPOOPERACAO TP,'
      
        '  (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.IDPL' +
        'ANPREVCTBPATR'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO'
      'WHERE'
      
        '   ((:NUMDOCUMENTO IS NULL) OR (OP.NUMDOCUMENTO = :NUMDOCUMENTO)' +
        ')'
      '   AND (OP.IDTIPOOPERACAO IN (-162, -163))'
      '   AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '   AND (OP.IDCARTEIRAGERENC IS NULL)'
      '   AND (OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR)'
      '   AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      'ORDER BY OP.DATAOPERACAO, OP.NUMDOCUMENTO'
      ''
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
      DisplayWidth = 14
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryPLANOPATROORIG: TStringField
      DisplayLabel = 'Plano de Origem'
      DisplayWidth = 48
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object qryQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 17
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryIDPLANOPATROORIG: TFloatField
      FieldName = 'IDPLANOPATROORIG'
      Visible = False
    end
  end
  object qryOperTRCCCI: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOOPERACAO IN (-162,-163)'
      ' ')
    ValidateWithMask = True
    Left = 270
    Top = 269
    object qryOperTRCCCIDESCTIPOOPERACAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperTRCCCIIDTIPOOPERACAO: TFloatField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryOperTRCCCIIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryOperTRCCCIIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
    object qryOperTRCCCICODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object qryOperTRCCCINATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCITIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIVENCIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object qryOperTRCCCIFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Visible = False
    end
    object qryOperTRCCCIFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Visible = False
    end
    object qryOperTRCCCIRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCITIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryOperTRCCCIFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Visible = False
    end
    object qryOperTRCCCIFLGTRANSF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCITRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryOperTRCCCITRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryOperTRCCCIFLGCORRET: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryOperTRCCCIFLGOPDIREITO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGAGE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGDATAEX: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGDATACOM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGINVORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGPERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGPARIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGPRZBOLSA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGPRZEMP: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGATADEC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGFORMAPAGREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGDIVACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGINIPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGJUROS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIMOTBLOQCARTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTORIG'
      Visible = False
    end
    object qryOperTRCCCIMOTBLOQCARTDEST: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTDEST'
      Visible = False
    end
    object qryOperTRCCCITIPSALDOCARTORIG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCITIPSALDOCARTDEST: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCISIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryOperTRCCCIFLGISENTOIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGGRAVAIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGOPGERENC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCITIPOMOVTO: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryOperTRCCCISTAATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGRENTABILIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGRENTABILIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGCONTAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONTAINVEST'
      Visible = False
    end
    object qryOperTRCCCIFLGMOVCOTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGMOVCOTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGCOTARECDES: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCOTARECDES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGDATAVENCIMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAVENCIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperTRCCCIFLGOBRIGAOBS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOBRIGAOBS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryPlanoPatro: TwwQuery
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
    Left = 270
    Top = 213
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   VWCARTEIRASRV'
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 373
    Top = 197
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
    Left = 374
    Top = 269
  end
  object DsSldTRCCeCCCI: TwwDataSource
    AutoEdit = False
    DataSet = CdsSldTRCCCeCCI
    OnStateChange = DsSldTRCCeCCCIStateChange
    Left = 708
    Top = 211
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
  object CdsSldTRCCCeCCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 596
    Top = 207
    object CdsSldTRCCCeCCIDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object CdsSldTRCCCeCCIDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsSldTRCCCeCCISALDOQTDECC: TFloatField
      DisplayLabel = 'Saldo CC'
      DisplayWidth = 20
      FieldName = 'SALDOQTDECC'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCISALDOQTDECCI: TFloatField
      DisplayLabel = 'Saldo CCI'
      DisplayWidth = 20
      FieldName = 'SALDOQTDECCI'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCIPERCTRANSFERIDO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCTRANSFERIDO'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object CdsSldTRCCCeCCIQTDTRANSFERIDOCC: TFloatField
      DisplayLabel = 'Qtd. CC Transferida'
      DisplayWidth = 20
      FieldName = 'QTDTRANSFERIDOCC'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCIQTDTRANSFERIDOCCI: TFloatField
      DisplayLabel = 'Qtd. CCI Transferida'
      DisplayWidth = 20
      FieldName = 'QTDTRANSFERIDOCCI'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCISALDOQTDECCATU: TFloatField
      DisplayLabel = 'Saldo CC Atual'
      DisplayWidth = 20
      FieldName = 'SALDOQTDECCATU'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCISALDOQTDECCIATU: TFloatField
      DisplayLabel = 'Saldo CCI Atual'
      DisplayWidth = 20
      FieldName = 'SALDOQTDECCIATU'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCIDATAOPERACAO: TStringField
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsSldTRCCCeCCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object CdsSldTRCCCeCCIIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object CdsSldTRCCCeCCIIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object CdsSldTRCCCeCCIIDPLANPREVCTBORIG: TFloatField
      FieldName = 'IDPLANPREVCTBORIG'
      Visible = False
    end
    object CdsSldTRCCCeCCISALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
    object CdsSldTRCCCeCCISALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###,###,###,###,###,##0'
    end
  end
  object sqlSldTRCCeCCCI: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   '#39'01.01.1899'#39' AS DATAOPERACAO,                                ' +
        '                                        '
      
        '   CA.DESCCARTINVEST,                                           ' +
        '                                     '
      '   IV.DESCINVESTIMENTO,'
      '   CA.IDCARTEIRAINVEST,'
      '   IV.IDINVESTIMENTO, '
      
        '   IV.IDEMISSOR,                                                ' +
        '                                     '
      '   (H1.IDPLANPREVCTBPATR) AS IDPLANPREVCTBORIG,'
      '   NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,'
      '   NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDECCI,'
      '   NVL(H1.SALDOQTDECPMF,0) AS SALDOQTDECC,'
      
        '   DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRIN' +
        'VCART,0))) AS SALDOVLRINVCART,'
      '   0 AS PERCTRANSFERIDO,'
      '   0 AS QTDTRANSFERIDOCC,'
      '   0 AS QTDTRANSFERIDOCCI,'
      '   0 AS SALDOQTDECCIATU,'
      '   0 AS SALDOQTDECCATU'
      
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
      '                         WHERE'
      
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
    ClientDataSet = CdsSldTRCCCeCCI
    Left = 626
    Top = 279
  end
  object CdsBoletasTRCCCeCCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 620
    Top = 359
  end
end
