inherited frmCadTransfDireitoLote: TfrmCadTransfDireitoLote
  Left = 56
  Top = 20
  HelpContext = 790282
  Caption = 'Transferência entre Planos - Direitos'
  ClientHeight = 537
  ClientWidth = 1197
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel [0]
    Left = 0
    Top = 78
    Width = 1197
    Height = 3
    Align = alTop
    Shape = bsBottomLine
  end
  inherited pnlFundo: TPanel
    Top = 81
    Width = 1197
    Height = 417
    inherited pnlControles: TPanel
      Width = 1195
      Height = 415
    end
    inherited dbGrd: TwwDBGrid
      Width = 1195
      Height = 415
      Selected.Strings = (
        'DATAOPERACAO'#9'16'#9'Data da Operação'
        'IDBOLETA'#9'12'#9'Boleta'
        'DESCTIPOOPERACAO'#9'30'#9'Tipo de Operação'
        'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos'
        'DESCINVESTIMENTO'#9'30'#9'Ação'
        'SGLCUSTODIANTE'#9'20'#9'Custodiante'
        'PLORIG'#9'60'#9'Plano/Patrocinadora Origem'
        'PLDEST'#9'60'#9'Plano/Patrocinadora Destino'
        'QTDEOPERACAO'#9'18'#9'Quantidade'
        'VLROPERACAO'#9'15'#9'Valor'
        'PERCENTUAL'#9'10'#9'Percentual')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ParentFont = False
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
    Width = 1197
    Height = 417
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 4
    object pnlAltSaldos: TPanel
      Left = 1
      Top = 89
      Width = 1195
      Height = 327
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
          '0,000000000000000')
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
        Left = 1103
        Top = 2
        Width = 90
        Height = 323
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
      Top = 89
      Width = 1195
      Height = 327
      PictureMasks.Strings = (
        'SALDOQTDEINVCART'#9'###,###,###,###,###,##0'#9'T'#9'T'
        'PERCTRANSFERIDO'#9'##0,00'#9'T'#9'T'
        'QTDTRANSFERIDO'#9'###,###,###,###,###,##0'#9'T'#9'T')
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'30'#9'Ação'#9'F'
        'SGLCUSTODIANTE'#9'12'#9'Custodiante'#9'F'
        'SIGLAMOTBLOQ'#9'16'#9'Motivo de Bloqueio'#9'F'
        'DATAAGE'#9'10'#9'Dt AGE'#9'F'
        'DATAEX'#9'10'#9'Dt Ex'#9'F'
        'DTBASE'#9'10'#9'Dt Base'#9'F'
        'DATAPREV'#9'10'#9'Dt Prevista'#9'F'
        'QTD'#9'15'#9'Qtd. Atual'#9'F'
        'VALOR'#9'15'#9'Vlr. Atual'#9'F'
        'QTDTRANSFERIDO'#9'15'#9'Qtd. Transferida'#9'F'
        'VLRTRANSFERIDO'#9'15'#9'Vlr. Transferido'#9'F')
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
      Width = 1195
      Height = 88
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
        Left = 330
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object lblTipoOper: TLabel
        Left = 330
        Top = 44
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
      end
      object lblDtOperacao: TLabel
        Left = 600
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Dt Operação'
      end
      object lblPercentual: TLabel
        Left = 600
        Top = 44
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object lblObservacao: TLabel
        Left = 721
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dblkPlanPatroO: TwwDBLookupCombo
        Left = 10
        Top = 19
        Width = 312
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
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
        Width = 312
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
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
        Left = 330
        Top = 19
        Width = 264
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 330
        Top = 59
        Width = 264
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'#9'F')
        LookupTable = qryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbDtaOperacao: TCMDateTimePicker
        Left = 600
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
        Left = 600
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
        Left = 720
        Top = 19
        Width = 449
        Height = 60
        TabOrder = 6
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1197
  end
  inherited Dock971: TDock97
    Top = 498
    Width = 1197
    inherited tb97Fundo: TToolbar97
      Left = 761
      DockPos = 761
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 505
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
    Width = 1197
    Height = 31
    Align = alTop
    TabOrder = 3
    object lbNomItem: TfcLabel
      Left = 13
      Top = 3
      Width = 456
      Height = 24
      Caption = 'Transferência entre Planos em Lote - Direitos'
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
      4
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
        0)
      (
        ''
        'DisplayLabel'
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
    Caption = ''
    Colunas.Strings = (
      'OPERDIRTRANSF.DATAOPERACAO'
      'OPERDIRTRANSF.IDBOLETA'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CUSTODIANTE.SGLCUSTODIANTE'
      'MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      'OPERDIRTRANSF.QTDEOPERACAO'
      'OPERDIRTRANSF.PERCENTUAL'
      
        '(SELECT V.PLANPRVCONTABPATRO FROM VWPLANPREVCTBPATR V WHERE V.ID' +
        'PLANPREVCTBPATR = OPERDIRTRANSF.IDPLANPREVCTBPATRORIG)'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'OPERDIRTRANSF.VLROPERACAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Data Operação'
      'Boleta'
      'Tipo de Operação'
      'Carteira de Investimentos'
      'Ação'
      'Custodiante'
      'Motivo Bloqueio'
      'Quantidade Transferida'
      'Percentual'
      'Plano/ Patrocinadora de Origem'
      'Plano/ Patrocinadora de Destino'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERDIRTRANSF'
      'OPERACAODIREITO'
      'INVESTIMENTO'
      'CUSTODIANTE'
      'CARTEIRAINVEST'
      'MOTIVOBLOQUEIO'
      'VWPLANPREVCTBPATR'
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'OPERDIRTRANSF.IDBOLETA')
    Filtro.Strings = (
      
        'OPERACAODIREITO.IDOPERACAODIREITO  = OPERDIRTRANSF.IDOPERACAODIR' +
        'EITO'
      'INVESTIMENTO.IDINVESTIMENTO     = OPERDIRTRANSF.IDINVESTORIG'
      'CUSTODIANTE.IDCUSTODIANTE      = OPERDIRTRANSF.IDCUSTODIAORIG'
      
        'CARTEIRAINVEST.IDCARTEIRAINVEST   = OPERDIRTRANSF.IDCARTINVESTOR' +
        'IG'
      
        'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO   = OPERDIRTRANSF.IDMOTIVOBLOQOR' +
        'IG(+)'
      
        'VWPLANPREVCTBPATR.IDPLANPREVCTBPATR = OPERDIRTRANSF.IDPLANPREVCT' +
        'BPATRDEST'
      'TIPOOPERACAO.IDTIPOINVEST = 2'
      'TIPOOPERACAO.IDTIPOOPERACAO = OPERACAODIREITO.IDTIPOOPERACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###0'
      '###,###.#0 %'
      ''
      ''
      '###,###,###,##0.00')
    Larguras.Strings = (
      '12'
      '10'
      '30'
      '60'
      '30'
      '12'
      '15'
      '18'
      '10'
      '60'
      '60'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
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
      'SELECT'
      
        '      OT.IDOPERDIRTRANSF,OT.IDOPERACAODIREITO,OT.IDTIPOINVEST,OT' +
        '.IDTIPOOPERACAO,'
      
        '      OT.IDTIPOOPERDEST,OT.IDTIPOOPERORIG,OT.DATAOPERACAO,OT.IDP' +
        'LANPREVCTBPATRORIG,OT.IDPLANPREVCTBPATRDEST,'
      
        '      OT.QTDEOPERACAO,OT.PUORIGEM,OT.VLROPERACAO,OT.PERCENTUAL,O' +
        'T.IDBOLETA,'
      
        '      OT.IDOPERINVESTORIG,OT.IDOPERINVESTDEST,OT.IDCUSTODIAORIG,' +
        'OT.IDFORCLIORIG,'
      
        '      OT.IDMOTIVOBLOQORIG,OT.IDCARTINVESTORIG,OT.IDINVESTORIG,OT' +
        '.DATAVENCORIG,'
      
        '      PLO.PLANPRVCONTABPATRO AS PLORIG, PLD.PLANPRVCONTABPATRO A' +
        'S PLDEST,'
      '      IV.DESCINVESTIMENTO, CT.SGLCUSTODIANTE, CI.DESCCARTINVEST,'
      '      TP.DESCTIPOOPERACAO'
      
        'FROM OPERDIRTRANSF OT, OPERACAODIREITO OD, VWPLANPREVCTBPATR PLO' +
        ', VWPLANPREVCTBPATR PLD,'
      
        '     INVESTIMENTO IV, CUSTODIANTE CT, CARTEIRAINVEST CI, TIPOOPE' +
        'RACAO TP'
      'WHERE ((:IDBOLETA IS NULL) OR (OT.IDBOLETA = :IDBOLETA))'
      '  AND  OD.IDOPERACAODIREITO  = OT.IDOPERACAODIREITO'
      '  AND PLO.IDPLANPREVCTBPATR  = OT.IDPLANPREVCTBPATRORIG'
      '  AND PLD.IDPLANPREVCTBPATR  = OT.IDPLANPREVCTBPATRDEST'
      '  AND  IV.IDINVESTIMENTO     = OT.IDINVESTORIG'
      '  AND  CT.IDCUSTODIANTE      = OT.IDCUSTODIAORIG'
      '  AND  CI.IDCARTEIRAINVEST   = OT.IDCARTINVESTORIG'
      '  AND  TP.IDTIPOINVEST       = 2'
      '  AND  TP.IDTIPOOPERACAO     = OD.IDTIPOOPERACAO'
      'ORDER BY OT.DATAOPERACAO, OT.IDBOLETA'
      ''
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
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end>
    object qryDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 16
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERDIRTRANSF.DATAOPERACAO'
    end
    object qryIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDBOLETA'
      Size = 30
    end
    object qryDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimentos'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qrySGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 20
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryPLORIG: TStringField
      DisplayLabel = 'Plano/Patrocinadora Origem'
      DisplayWidth = 60
      FieldName = 'PLORIG'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPLDEST: TStringField
      DisplayLabel = 'Plano/Patrocinadora Destino'
      DisplayWidth = 60
      FieldName = 'PLDEST'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 18
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERDIRTRANSF.QTDEOPERACAO'
      DisplayFormat = '###,###,###,###0'
    end
    object qryVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERDIRTRANSF.VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.OPERDIRTRANSF.PERCENTUAL'
      DisplayFormat = '#,##0.00'
    end
    object qryIDOPERDIRTRANSF: TFloatField
      FieldName = 'IDOPERDIRTRANSF'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDOPERDIRTRANSF'
      Visible = False
    end
    object qryIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDOPERACAODIREITO'
      Visible = False
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDTIPOOPERACAO'
      Visible = False
    end
    object qryIDTIPOOPERDEST: TFloatField
      FieldName = 'IDTIPOOPERDEST'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDTIPOOPERDEST'
      Visible = False
    end
    object qryIDTIPOOPERORIG: TFloatField
      FieldName = 'IDTIPOOPERORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDTIPOOPERORIG'
      Visible = False
    end
    object qryIDPLANPREVCTBPATRORIG: TFloatField
      FieldName = 'IDPLANPREVCTBPATRORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDPLANPREVCTBPATRORIG'
      Visible = False
    end
    object qryIDPLANPREVCTBPATRDEST: TFloatField
      FieldName = 'IDPLANPREVCTBPATRDEST'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDPLANPREVCTBPATRDEST'
      Visible = False
    end
    object qryPUORIGEM: TFloatField
      FieldName = 'PUORIGEM'
      Origin = 'BASEDADOS.OPERDIRTRANSF.PUORIGEM'
      Visible = False
    end
    object qryIDOPERINVESTORIG: TFloatField
      FieldName = 'IDOPERINVESTORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDOPERINVESTORIG'
      Visible = False
    end
    object qryIDCUSTODIAORIG: TFloatField
      FieldName = 'IDCUSTODIAORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDCUSTODIAORIG'
      Visible = False
    end
    object qryIDFORCLIORIG: TFloatField
      FieldName = 'IDFORCLIORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDFORCLIORIG'
      Visible = False
    end
    object qryIDMOTIVOBLOQORIG: TFloatField
      FieldName = 'IDMOTIVOBLOQORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDMOTIVOBLOQORIG'
      Visible = False
    end
    object qryIDCARTINVESTORIG: TFloatField
      FieldName = 'IDCARTINVESTORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDCARTINVESTORIG'
      Visible = False
    end
    object qryIDINVESTORIG: TFloatField
      FieldName = 'IDINVESTORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.IDINVESTORIG'
      Visible = False
    end
    object qryDATAVENCORIG: TDateTimeField
      FieldName = 'DATAVENCORIG'
      Origin = 'BASEDADOS.OPERDIRTRANSF.DATAVENCORIG'
      Visible = False
    end
    object qryIDOPERINVESTDEST: TFloatField
      FieldName = 'IDOPERINVESTDEST'
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
    Top = 213
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
    Top = 181
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
    Top = 173
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryCarteiraFLGCARTPROP: TFloatField
      FieldName = 'FLGCARTPROP'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTPROP'
      Visible = False
    end
    object qryCarteiraFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCALCDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAINICIO'
      Visible = False
    end
    object qryCarteiraFLGTRATALOTE: TStringField
      FieldName = 'FLGTRATALOTE'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGTRATALOTE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object qryCarteiraTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryCarteiraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPLANOPREV'
      Visible = False
    end
    object qryCarteiraIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPATROCINADORA'
      Visible = False
    end
    object qryCarteiraIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDTIPOINVEST'
      Visible = False
    end
    object qryCarteiraIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDMERCADO'
      Visible = False
    end
    object qryCarteiraFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAULTFECH'
      Visible = False
    end
    object qryCarteiraIDDAIEACART: TFloatField
      FieldName = 'IDDAIEACART'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDDAIEACART'
      Visible = False
    end
    object qryCarteiraFLGCARTLASTRO: TStringField
      FieldName = 'FLGCARTLASTRO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTLASTRO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraFLGCARTTERC: TStringField
      FieldName = 'FLGCARTTERC'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTTERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDTIPOOPERACAO, T.DESCTIPOOPERACAO'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      'WHERE'
      '      T.IDTIPOINVEST = 2'
      
        '  AND T.IDTIPOOPERACAO IN (P.IDTIPOOPERDIRDIV, P.IDTIPOOPERDIRJU' +
        'R,'
      
        '                           P.IDTIPOOPERDIRDSU, P.IDTIPOOPERDIRSU' +
        'B)'
      'ORDER BY T.DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 454
    Top = 213
  end
  object dsSaldosATransf: TwwDataSource
    AutoEdit = False
    DataSet = CdsSldTRCPlanoSintetico
    Left = 708
    Top = 211
  end
  object CdsSldTRCPlanoSintetico: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 596
    Top = 207
    Data = {
      292B00009619E0BD01000000180000001B002600000003000000EE020C444154
      414F5045524143414F01004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000A0012504C414E505256434F4E
      544142504154524F010049000000010005574944544802000200710010444553
      435449504F4F5045524143414F0100490000000100055749445448020002003C
      000E4445534343415254494E5645535401004900000001000557494454480200
      02003C001044455343494E56455354494D454E544F0100490000000100055749
      445448020002003C000E53474C435553544F4449414E54450100490000000100
      055749445448020002000A000C5349474C414D4F54424C4F5101004900000001
      0005574944544802000200030003515444080004000000000006444154414558
      0800080000000000084441544150524556080008000000000006445442415345
      0800080000000000074441544141474508000800000000000E49445449504F4F
      5045524143414F08000400000000001149444F5045524143414F444952454954
      4F08000400000000000E4944494E56455354494D454E544F0800040000000000
      084944464F52434C4908000400000000001049444F5045524143414F494E5645
      535408000400000000000D4944435553544F4449414E54450800040000000000
      1049444D4F5449564F424C4F515545494F080004000000000010494443415254
      45495241494E5645535408000400000000001049444341525445495241474552
      454E4308000400000000001049444F5045524143414F4F524947454D08000400
      0000000002505508000400000000000556414C4F5208000400000000000F5045
      52435452414E5346455249444F08000400000000000E5154445452414E534645
      5249444F08000400000000000E564C525452414E5346455249444F0800040000
      00000002000D44454641554C545F4F5244455202008200050000000200050009
      000C000300044C434944040001000904000000001000000005000A30312E3031
      2E31383939125245472F5245504C414E202D204341495841184A55202D204A55
      524F5320534F425245204341504954414C24436172746569726120496E646578
      61646120457374726174E967696120506173736976611464657363696E766573
      74696D656E746F3131313408425241444553434F00000000E81C034100000A81
      65D4CC4200000E592ED5CC420000DCED62D4CC420000C87A53D4CC4200000000
      00ABC3C000000000007EB9400000000000B89F4000000000B49E124100000000
      8013F3400000000000002440000000000000F0BF0000000000002840E58C42BE
      76D5C73F90C2F5288C78DC400000000000000000000000000000000000000000
      0000000000001000000005000A30312E30312E31383939125245472F5245504C
      414E202D204341495841184A55202D204A55524F5320534F4252452043415049
      54414C22436172746569726120496E64657861646120457374726174E9676961
      2041746976611464657363696E76657374696D656E746F313131340842524144
      4553434F00000000808BC54000000A8165D4CC4200000E592ED5CC420000DCED
      62D4CC420000C87A53D4CC420000000000ABC3C000000000007EB94000000000
      00B89F4000000000B49E1241000000007013F340000000000000244000000000
      0000F0BF0000000000002C4001C9825874D5C73F15AE47E1FA0BA04000000000
      000000000000000000000000000000000000000000001000000005000A30312E
      30312E31383939125245472F5245504C414E202D2043414958410F4449202D20
      4449564944454E444F5322436172746569726120496E64657861646120457374
      726174E96769612041746976611464657363696E76657374696D656E746F3131
      343308425241444553434F000000000026C34000009AE750D4CC420000D46B64
      D5CC420000102E49D4CC420000102E49D4CC420000000000ABC3C00000000000
      6CB94000000000006CA0400000000074A11241000000001010F3400000000000
      002440000000000000F0BF0000000000002C40B0D019272306C13F1F85EB51B8
      5F94400000000000000000000000000000000000000000000000000000100000
      0005000A30312E30312E31383939125245472F5245504C414E202D2043414958
      41184A55202D204A55524F5320534F425245204341504954414C224361727465
      69726120496E64657861646120457374726174E9676961204174697661146465
      7363696E76657374696D656E746F3131343308425241444553434F0000000000
      26C34000009AE750D4CC420000D46B64D5CC420000102E49D4CC420000102E49
      D4CC420000000000ABC3C000000000006AB94000000000006CA0400000000074
      A1124100000000D00FF3400000000000002440000000000000F0BF0000000000
      002C40BA30F6436F68B13F8FC2F5285CD5844000000000000000000000000000
      000000000000000000000000001000000005000A30312E30312E313839391252
      45472F5245504C414E202D204341495841184A55202D204A55524F5320534F42
      5245204341504954414C22436172746569726120496E64657861646120457374
      726174E96769612041746976611464657363696E76657374696D656E746F3131
      34370953414E54414E4445520000000000EAAF400000BC8942D3CC420000A8AD
      7CD4CC420000AAEB4DD2CC42000026DF29D2CC420000000000ABC3C000000000
      00B0B840000000000078A0400000000088A2124100000000E091F24000000000
      2006F740000000000000F0BF0000000000002C4085EB51B81E85E33F33333333
      B377A34000000000000000000000000000000000000000000000000000001000
      000005000A30312E30312E31383939125245472F5245504C414E202D20434149
      5841184A55202D204A55524F5320534F425245204341504954414C2243617274
      6569726120496E64657861646120457374726174E96769612041746976611464
      657363696E76657374696D656E746F3131343708425241444553434F00000000
      00EAAF400000D4D41AD4CC420000A8AD7CD4CC420000A64118D4CC420000DA81
      FED3CC420000000000ABC3C0000000000034B940000000000078A04000000000
      88A212410000000050EFF2400000000000002440000000000000F0BF00000000
      00002C400AD7A3703D0AEF3F67666666E6F4AE40000000000000000000000000
      00000000000000000000000000001000000005000A30312E30312E3138393912
      5245472F5245504C414E202D204341495841184A55202D204A55524F5320534F
      425245204341504954414C24436172746569726120496E646578616461204573
      74726174E967696120506173736976611464657363696E76657374696D656E74
      6F3131343708425241444553434F00000000008DD5400000D4D41AD4CC420000
      A8AD7CD4CC420000A64118D4CC420000DA81FED3CC420000000000ABC3C00000
      00000034B940000000000078A0400000000088A212410000000060EFF2400000
      000000002440000000000000F0BF00000000000028400AD7A3703D0AEF3F0AD7
      A3707DE7D4400000000000000000000000000000000000000000000000000000
      1000000005000A30312E30312E31383939125245472F5245504C414E202D2043
      41495841184A55202D204A55524F5320534F425245204341504954414C244361
      72746569726120496E64657861646120457374726174E9676961205061737369
      76611464657363696E76657374696D656E746F3131343908425241444553434F
      00000000A04FFD40000052345BD4CC4200003E8628D8CC42000024A158D4CC42
      000024A158D4CC420000000000ABC3C0000000000074B94000000000007CA040
      00000000E0A21241000000008011F3400000000000002440000000000000F0BF
      00000000000028409506A4130695B83F1F85EB513884C6400000000000000000
      0000000000000000000000000000000000001000000005000A30312E30312E31
      383939125245472F5245504C414E202D204341495841184A55202D204A55524F
      5320534F425245204341504954414C22436172746569726120496E6465786164
      6120457374726174E96769612041746976611464657363696E76657374696D65
      6E746F3131343908425241444553434F000000000082B240000052345BD4CC42
      00003E8628D8CC42000024A158D4CC42000024A158D4CC420000000000ABC3C0
      000000000074B94000000000007CA04000000000E0A21241000000007011F340
      0000000000002440000000000000F0BF0000000000002C4004BEB6530195B83F
      90C2F5285C6F7C40000000000000000000000000000000000000000000000000
      00001000000005000A30312E30312E31383939125245472F5245504C414E202D
      204341495841184A55202D204A55524F5320534F425245204341504954414C24
      436172746569726120496E64657861646120457374726174E967696120506173
      736976611464657363696E76657374696D656E746F3131353308425241444553
      434F000000000082B14000007A1A7AD4CC4200003E8628D8CC4200004C8777D4
      CC4200000A8165D4CC4200000000008051C0000000000092B94000000000008E
      A04000000000C4A3124100000000E016F3400000000000002440000000000000
      F0BF0000000000002840204DBE39DBEFE43F295C8FC2F5E8A640000000000000
      00000000000000000000000000000000000000001000000005000A30312E3031
      2E31383939125245472F5245504C414E202D204341495841184A55202D204A55
      524F5320534F425245204341504954414C24436172746569726120496E646578
      61646120457374726174E967696120506173736976611464657363696E766573
      74696D656E746F3131353308425241444553434F0000000020D2FF4000007A1A
      7AD4CC4200003E8628D8CC4200004C8777D4CC4200000A8165D4CC4200000000
      00ABC3C0000000000092B94000000000008EA04000000000C4A3124100000000
      F016F3400000000000002440000000000000F0BF0000000000002840ECE7F380
      DCEFE43F3E0AD7A3D8D1F4400000000000000000000000000000000000000000
      0000000000001000000005000A30312E30312E31383939125245472F5245504C
      414E202D204341495841184A55202D204A55524F5320534F4252452043415049
      54414C22436172746569726120496E64657861646120457374726174E9676961
      2041746976611464657363696E76657374696D656E746F313135330842524144
      4553434F00000000800AC14000007A1A7AD4CC4200003E8628D8CC4200004C87
      77D4CC4200000A8165D4CC420000000000ABC3C0000000000092B94000000000
      008EA04000000000C4A3124100000000D016F340000000000000244000000000
      0000F0BF0000000000002C409DB6B4E3DBEFE43FA4703D0A974CB64000000000
      000000000000000000000000000000000000000000001000000005000A30312E
      30312E31383939125245472F5245504C414E202D204341495841184A55202D20
      4A55524F5320534F425245204341504954414C15506172746963697061E7F565
      7320446972657461731464657363696E76657374696D656E746F313136360842
      5241444553434F0000000000002040000016DB2CD4CC4200003E8628D8CC4200
      0016DB2CD4CC42000016DB2CD4CC4200000000008051C0000000000038B94000
      00000000B2A040000000004CA1124100000000B0F3F240000000000000244000
      0000000000F0BF0000000000002A40AE47E17A14AEDD3FAE47E17A14AE0D4000
      000000000000000000000000000000000000000000000000001000000005000A
      30312E30312E31383939125245472F5245504C414E202D204341495841184A55
      202D204A55524F5320534F425245204341504954414C24436172746569726120
      496E64657861646120457374726174E967696120506173736976611464657363
      696E76657374696D656E746F3131373007454D5052455341000000C0BF3B6A41
      0000BC8942D3CC420000A8AD7CD4CC420000BC8942D3CC420000FE74FEADCC42
      00000000008051C00000000000AEB8400000000000BAA0400000000054A11241
      000000007091F240000000007EF42A41000000000000F0BF0000000000002840
      8112BC324ACD5E3FC3F5285C4F40D94000000000000000000000000000000000
      000000000000000000001000000005000A30312E30312E31383939125245472F
      5245504C414E202D2043414958410F4449202D204449564944454E444F531550
      6172746963697061E7F5657320446972657461731464657363696E7665737469
      6D656E746F3238393104495441DA000000004087DC400000DE59C7D4CC420000
      3E8628D8CC420000CE34C7CDCC420000143A52BBCC4200000000008051C00000
      000000BAB94000000000009AA0400000000080A3124100000000505FF3400000
      0000C8AB1241000000000000F0BF0000000000002A404CC39197361AE23FF628
      5C8F7223D0400000000000000000000000000000000000000000000000000000
      1000000005000A30312E30312E31383939125245472F5245504C414E202D2043
      41495841184A55202D204A55524F5320534F425245204341504954414C244361
      72746569726120496E64657861646120457374726174E9676961205061737369
      76611464657363696E76657374696D656E746F3335303008425241444553434F
      00000000F821144100004C8777D4CC4200006A7F33D5CC4200001EF474D4CC42
      0000381468D4CC420000000000ABC3C000000000008CB940000000000024A040
      00000000BCA01241000000009015F3400000000000002440000000000000F0BF
      00000000000028400AD7A3703D0AC73FA4703D0AB7FDEC400000000000000000
      0000000000000000000000000000000000001000000005000A30312E30312E31
      383939125245472F5245504C414E202D204341495841184A55202D204A55524F
      5320534F425245204341504954414C24436172746569726120496E6465786164
      6120457374726174E967696120506173736976611464657363696E7665737469
      6D656E746F3335313008425241444553434F0000000000071D41000060FA86D4
      CC42000038ABB1D5CC420000A8AD7CD4CC420000F60D56D4CC420000000000AB
      C3C00000000000A4B940000000000066A0400000000010A1124100000000F040
      F3400000000000002440000000000000F0BF0000000000002840EC51B81E85EB
      A13F8FC2F5285C41D04000000000000000000000000000000000000000000000
      000000001000000005000A30312E30312E31383939125245472F5245504C414E
      202D204341495841184A55202D204A55524F5320534F42524520434150495441
      4C15506172746963697061E7F5657320446972657461731464657363696E7665
      7374696D656E746F3433353508425241444553434F0000000000002E40000016
      DB2CD4CC4200003E8628D8CC42000016DB2CD4CC42000016DB2CD4CC42000000
      00008051C0000000000036B940000000008069C140000000004CA11241000000
      0080F3F2400000000000002440000000000000F0BF0000000000002A4090FA37
      4219BDDD3FE17A14AE47E11B4000000000000000000000000000000000000000
      000000000000001000000005000A30312E30312E31383939125245472F524550
      4C414E202D204341495841184A55202D204A55524F5320534F42524520434150
      4954414C22436172746569726120496E64657861646120457374726174E96769
      612041746976611464657363696E76657374696D656E746F343439320953414E
      54414E4445520000000000EDBB4000004E5C92D3CC4200000E592ED5CC420000
      CA4F6ED3CC420000CA4F6ED3CC420000000000ABC3C00000000000DBB8400000
      000000ACC34000000000ECA312410000000050B9F240000000002006F7400000
      00000000F0BF0000000000002C40BC8C4D870718A83F1F85EB51B80675400000
      0000000000000000000000000000000000000000000000001000000005000A30
      312E30312E31383939125245472F5245504C414E202D204341495841184A5520
      2D204A55524F5320534F425245204341504954414C15506172746963697061E7
      F5657320446972657461731464657363696E76657374696D656E746F34353538
      04495441DA000000007C5D1241000060FA86D4CC42000038ABB1D5CC420000A8
      AD7CD4CC420000F60D56D4CC4200000000008051C00000000000A6B940000000
      0080E2C340000000001EB33041000000003041F34000000000C8AB1241000000
      000000F0BF0000000000002A401C5F9CB998BBC63F67666666DE17EA40000000
      00000000000000000000000000000000000000000000001000000005000A3031
      2E30312E31383939125245472F5245504C414E202D204341495841184A55202D
      204A55524F5320534F425245204341504954414C22436172746569726120496E
      64657861646120457374726174E96769612041746976611464657363696E7665
      7374696D656E746F3435353908425241444553434F0000000080EFDC40000060
      FA86D4CC42000038ABB1D5CC420000A8AD7CD4CC420000F60D56D4CC42000000
      0000ABC3C00000000000A8B9400000000000E3C340000000001EB33041000000
      009041F3400000000000002440000000000000F0BF0000000000002C40644B12
      8496BBC63FE17A14AE478EB44000000000000000000000000000000000000000
      000000000000001000000005000A30312E30312E31383939125245472F524550
      4C414E202D204341495841184A55202D204A55524F5320534F42524520434150
      4954414C24436172746569726120496E64657861646120457374726174E96769
      6120506173736976611464657363696E76657374696D656E746F343535390842
      5241444553434F00000000EC641641000060FA86D4CC42000038ABB1D5CC4200
      00A8AD7CD4CC420000F60D56D4CC420000000000ABC3C00000000000A8B94000
      00000000E3C340000000001EB3304100000000A041F340000000000000244000
      0000000000F0BF00000000000028405EC827B598BBC63F295C8FC255D1EF4000
      000000000000000000000000000000000000000000000000001000000005000A
      30312E30312E31383939125245472F5245504C414E202D204341495841184A55
      202D204A55524F5320534F425245204341504954414C24436172746569726120
      496E64657861646120457374726174E967696120506173736976611464657363
      696E76657374696D656E746F3435373908425241444553434F00000000B015F2
      400000DCED62D4CC42000038ABB1D5CC42000052345BD4CC42000052345BD4CC
      420000000000ABC3C0000000000078B9400000000080EEC3400000000082F430
      41000000001012F3400000000000002440000000000000F0BF00000000000028
      40798829B69191B33FD7A3703D4A1EB640000000000000000000000000000000
      00000000000000000000001000000005000A30312E30312E3138393912524547
      2F5245504C414E202D204341495841184A55202D204A55524F5320534F425245
      204341504954414C24436172746569726120496E646578616461204573747261
      74E967696120506173736976611464657363696E76657374696D656E746F3437
      373008425241444553434F00000000D807014100000A8165D4CC42000044330C
      D8CC420000DCED62D4CC420000102E49D4CC420000000000ABC3C00000000000
      80B94000000000807DC2400000000030A0124100000000D013F3400000000000
      002440000000000000F0BF0000000000002840B81E85EB51B8BE3F3333333373
      59D0400000000000000000000000000000000000000000000000000000100000
      0005000A30312E30312E31383939125245472F5245504C414E202D2043414958
      41184A55202D204A55524F5320534F425245204341504954414C244361727465
      69726120496E64657861646120457374726174E9676961205061737369766114
      64657363696E76657374696D656E746F3437373008425241444553434F000000
      00D807014100000A8165D4CC420000C63C82D6CC420000DCED62D4CC42000010
      2E49D4CC420000000000ABC3C0000000000082B94000000000807DC240000000
      0030A01241000000001014F3400000000000002440000000000000F0BF000000
      0000002840B81E85EB51B8BE3F333333337359D0400000000000000000000000
      0000000000000000000000000000001000000005000A30312E30312E31383939
      125245472F5245504C414E202D204341495841184A55202D204A55524F532053
      4F425245204341504954414C24436172746569726120496E6465786164612045
      7374726174E967696120506173736976611464657363696E76657374696D656E
      746F3439323208425241444553434F0000000080CBEF4000004C8777D4CC4200
      006A7F33D5CC4200001EF474D4CC420000381468D4CC420000000000ABC3C000
      000000008EB9400000000000F1C24000000000C0A01241000000000016F34000
      00000000002440000000000000F0BF0000000000002840A4703D0AD7A3D03FD7
      A3703D8A88D04000000000000000000000000000000000000000000000000000
      001000000005000A30312E30312E31383939125245472F5245504C414E202D20
      4341495841184A55202D204A55524F5320534F425245204341504954414C2243
      6172746569726120496E64657861646120457374726174E96769612041746976
      611464657363696E76657374696D656E746F3439323208425241444553434F00
      0000004052D34000004C8777D4CC4200006A7F33D5CC4200001EF474D4CC4200
      00381468D4CC420000000000ABC3C000000000008EB9400000000000F1C24000
      000000C0A0124100000000F015F3400000000000002440000000000000F0BF00
      00000000002C40A4703D0AD7A3D03F9A9999991918B440000000000000000000
      00000000000000000000000000000000001000000005000A30312E30312E3138
      3939125245472F5245504C414E202D204341495841184A55202D204A55524F53
      20534F425245204341504954414C22436172746569726120496E646578616461
      20457374726174E96769612041746976611464657363696E76657374696D656E
      746F3530333308425241444553434F000000000009CA40000058E13ED4CC4200
      00E0C52BD5CC420000CE2737D4CC420000CE2737D4CC420000000000ABC3C000
      0000000068B94000000000000AA04000000000303AF640000000005029F34000
      00000000002440000000000000F0BF0000000000002C406AB4F5CC6497E13F5C
      8FC2F5E89FBC4000000000000000000000000000000000000000000000000000
      001000000005000A30312E30312E31383939125245472F5245504C414E202D20
      4341495841184A55202D204A55524F5320534F425245204341504954414C2443
      6172746569726120496E64657861646120457374726174E96769612050617373
      6976611464657363696E76657374696D656E746F353033330842524144455343
      4F0000000000E4A340000058E13ED4CC420000E0C52BD5CC420000CE2737D4CC
      420000CE2737D4CC4200000000008051C0000000000068B94000000000000AA0
      4000000000303AF640000000006029F3400000000000002440000000000000F0
      BF00000000000028404CE1187B6997E13F15AE47E17ADE954000000000000000
      000000000000000000000000000000000000001000000005000A30312E30312E
      31383939125245472F5245504C414E202D204341495841184A55202D204A5552
      4F5320534F425245204341504954414C24436172746569726120496E64657861
      646120457374726174E967696120506173736976611464657363696E76657374
      696D656E746F3530333308425241444553434F0000000060590D41000058E13E
      D4CC420000E0C52BD5CC420000CE2737D4CC420000CE2737D4CC420000000000
      ABC3C0000000000068B94000000000000AA04000000000303AF6400000000070
      29F3400000000000002440000000000000F0BF00000000000028404F371D9965
      97E13FB81E85EB55220041000000000000000000000000000000000000000000
      00000000001000000005000A30312E30312E31383939125245472F5245504C41
      4E202D204341495841184A55202D204A55524F5320534F425245204341504954
      414C22436172746569726120496E64657861646120457374726174E967696120
      41746976611464657363696E76657374696D656E746F35313836084252414445
      53434F0000000080BEC4400000F60D56D4CC4200003E8628D8CC420000C87A53
      D4CC420000C87A53D4CC420000000000ABC3C0000000000070B9400000000080
      4AC340000000006C6C2C41000000009010F34000000000000024400000000000
      00F0BF0000000000002C406EA1C129CA9FB53F3333333333098C400000000000
      0000000000000000000000000000000000000000001000000005000A30312E30
      312E31383939125245472F5245504C414E202D204341495841184A55202D204A
      55524F5320534F425245204341504954414C24436172746569726120496E6465
      7861646120457374726174E967696120506173736976611464657363696E7665
      7374696D656E746F3531383808425241444553434F000000004022EC40000052
      345BD4CC4200003E8628D8CC42000024A158D4CC42000024A158D4CC42000000
      0000ABC3C0000000000076B94000000000804BC3400000000050A11241000000
      00D011F3400000000000002440000000000000F0BF0000000000002840AAF2AD
      3B0378D73F7B14AE4721A2D44000000000000000000000000000000000000000
      000000000000001000000005000A30312E30312E31383939125245472F524550
      4C414E202D204341495841184A55202D204A55524F5320534F42524520434150
      4954414C24436172746569726120496E64657861646120457374726174E96769
      6120506173736976611464657363696E76657374696D656E746F353233320842
      5241444553434F0000000080DCE040000060FA86D4CC4200003E8628D8CC4200
      00A8AD7CD4CC4200007A1A7AD4CC420000000000ABC3C00000000000AAB94000
      0000000073C3400000000006FD2D4100000000F041F340000000000000244000
      0000000000F0BF0000000000002840E2FBE970C6ADD03F7B14AE47A193C14000
      000000000000000000000000000000000000000000000000001000000005000A
      30312E30312E31383939125245472F5245504C414E202D204341495841184A55
      202D204A55524F5320534F425245204341504954414C24436172746569726120
      496E64657861646120457374726174E967696120506173736976611464657363
      696E76657374696D656E746F3532343708425241444553434F00000000D0A8F8
      4000004C8777D4CC420000E6720FD5CC4200001EF474D4CC42000024A158D4CC
      420000000000ABC3C000000000008AB94000000000007AC3400000000008A212
      41000000004015F3400000000000002440000000000000F0BF00000000000028
      40741B4C432770CD3F9A99999969AFD640000000000000000000000000000000
      00000000000000000000001000000005000A30312E30312E3138393912524547
      2F5245504C414E202D204341495841184A55202D204A55524F5320534F425245
      204341504954414C22436172746569726120496E646578616461204573747261
      74E96769612041746976611464657363696E76657374696D656E746F35323437
      08425241444553434F00000000004AB54000004C8777D4CC420000E6720FD5CC
      4200001EF474D4CC42000024A158D4CC420000000000ABC3C000000000008AB9
      4000000000007AC3400000000008A21241000000003015F34000000000000024
      40000000000000F0BF0000000000002C4023DD01501970CD3F713D0AD7A39593
      4000000000000000000000000000000000000000000000000000001000000005
      000A30312E30312E31383939125245472F5245504C414E202D20434149584118
      4A55202D204A55524F5320534F425245204341504954414C2443617274656972
      6120496E64657861646120457374726174E96769612050617373697661146465
      7363696E76657374696D656E746F3532353608425241444553434F00000000C0
      C5DD4000007A1A7AD4CC4200003E8628D8CC4200004C8777D4CC4200000A8165
      D4CC420000000000ABC3C0000000000090B940000000000081C34000000000C4
      A31241000000005016F3400000000000002440000000000000F0BF0000000000
      00284073759F7C9908E33FD7A3703D6AB5D14000000000000000000000000000
      000000000000000000000000001000000005000A30312E30312E313839391252
      45472F5245504C414E202D204341495841184A55202D204A55524F5320534F42
      5245204341504954414C24436172746569726120496E64657861646120457374
      726174E967696120506173736976611464657363696E76657374696D656E746F
      3532373208425241444553434F00000000007AE340000024A158D4CC4200003E
      8628D8CC420000F60D56D4CC420000F60D56D4CC420000000000ABC3C0000000
      000072B94000000000808CC340000000001CA01241000000000011F340000000
      0000002440000000000000F0BF0000000000002840786377DED317DC3F3E0AD7
      A34019D140000000000000000000000000000000000000000000000000000010
      00000005000A30312E30312E31383939125245472F5245504C414E202D204341
      495841184A55202D204A55524F5320534F425245204341504954414C22436172
      746569726120496E64657861646120457374726174E967696120417469766114
      64657363696E76657374696D656E746F3532373208425241444553434F000000
      0000EAAF40000024A158D4CC4200003E8628D8CC420000F60D56D4CC420000F6
      0D56D4CC420000000000ABC3C0000000000072B94000000000808CC340000000
      001CA0124100000000F010F3400000000000002440000000000000F0BF000000
      0000002C40339F013DCB17DC3F15AE47E17A049C400000000000000000000000
      00000000000000000000000000}
    object CdsSldTRCPlanoSinteticoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsSldTRCPlanoSinteticoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 12
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object CdsSldTRCPlanoSinteticoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Motivo de Bloqueio'
      DisplayWidth = 16
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object CdsSldTRCPlanoSinteticoDATAAGE: TDateTimeField
      DisplayLabel = 'Dt AGE'
      DisplayWidth = 10
      FieldName = 'DATAAGE'
    end
    object CdsSldTRCPlanoSinteticoDATAEX: TDateTimeField
      DisplayLabel = 'Dt Ex'
      DisplayWidth = 10
      FieldName = 'DATAEX'
    end
    object CdsSldTRCPlanoSinteticoDTBASE: TDateTimeField
      DisplayLabel = 'Dt Base'
      DisplayWidth = 10
      FieldName = 'DTBASE'
    end
    object CdsSldTRCPlanoSinteticoDATAPREV: TDateTimeField
      DisplayLabel = 'Dt Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPREV'
    end
    object CdsSldTRCPlanoSinteticoQTD: TFloatField
      DisplayLabel = 'Qtd. Atual'
      DisplayWidth = 15
      FieldName = 'QTD'
      DisplayFormat = '###,###,###,###0'
    end
    object CdsSldTRCPlanoSinteticoVALOR: TFloatField
      DisplayLabel = 'Vlr. Atual'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsSldTRCPlanoSinteticoQTDTRANSFERIDO: TFloatField
      DisplayLabel = 'Qtd. Transferida'
      DisplayWidth = 15
      FieldName = 'QTDTRANSFERIDO'
      DisplayFormat = '###,###,###,###0'
    end
    object CdsSldTRCPlanoSinteticoVLRTRANSFERIDO: TFloatField
      DisplayLabel = 'Vlr. Transferido'
      DisplayWidth = 15
      FieldName = 'VLRTRANSFERIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsSldTRCPlanoSinteticoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object CdsSldTRCPlanoSinteticoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object CdsSldTRCPlanoSinteticoPLANPRVCONTABPATRO: TStringField
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Visible = False
      Size = 113
    end
    object CdsSldTRCPlanoSinteticoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDOPERACAODIREITO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoPU: TFloatField
      DisplayWidth = 10
      FieldName = 'PU'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoPERCTRANSFERIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTRANSFERIDO'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoDATAOPERACAO: TStringField
      FieldName = 'DATAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsSldTRCPlanoSinteticoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object CdsSldTRCPlanoSinteticoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
  end
  object sqlSldTRCPlanoSintetico: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      '#39'01.01.1899'#39' AS DATAOPERACAO,'
      '       TR.PLANPRVCONTABPATRO,'
      '       TR.DESCTIPOOPERACAO,'
      '       TR.DESCCARTINVEST,'
      '       TR.DESCINVESTIMENTO,'
      '       TR.SGLCUSTODIANTE,'
      '       TR.SIGLAMOTBLOQ,'
      '       TR.QTDPREVISTA AS QTD,'
      '       TRUNC(TR.DATAEX) AS DATAEX,'
      '       TRUNC(TR.DATAPREV) AS DATAPREV,'
      '       TRUNC(TR.DTBASE) AS DTBASE,'
      '       TRUNC(TR.DATAAGE) AS DATAAGE,'
      
        '       TR.IDTIPOOPERACAO, TR.IDOPERACAODIREITO, TR.IDINVESTIMENT' +
        'O, TR.IDFORCLI, TR.IDOPERACAOINVEST,'
      
        '       TR.IDCUSTODIANTE, TR.IDMOTIVOBLOQUEIO, TR.IDCARTEIRAINVES' +
        'T, TR.IDCARTEIRAGERENC, TR.IDOPERACAOORIGEM,'
      '      (TR.VLROPERACAO/TR.QTDPREVISTA) AS PU,'
      '      (TR.VLROPERACAO+TR.VLRREMUNERACAO) AS VALOR,'
      '       0 AS PERCTRANSFERIDO,'
      '       0  AS QTDTRANSFERIDO,'
      '       0  AS VLRTRANSFERIDO'
      'FROM (SELECT PP.PLANPRVCONTABPATRO, TP.DESCTIPOOPERACAO,'
      
        '             OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREV, OD.D' +
        'ATAEX AS DTBASE, OD.DATAAGE, '
      
        '             IV.DESCINVESTIMENTO, OI.IDTIPOOPERACAO, OD.IDOPERAC' +
        'AODIREITO, IV.IDINVESTIMENTO,'
      
        '             OI.IDCUSTODIANTE, OI.IDMOTIVOBLOQUEIO, OI.IDCARTEIR' +
        'AINVEST, OI.IDCARTEIRAGERENC,'
      
        '             OI.IDFORCLI, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIG' +
        'EM,'
      '             NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,'
      '             NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,'
      '             NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,'
      '             NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,'
      '             OI.PRECOUNITOPERACAO,'
      
        '            (NVL(OI.VLROPERACAO,0)) - NVL(REC.QTDEOPERACAO,0) - ' +
        'NVL(CAN.QTDEOPERACAO,0) AS VLROPERACAO,'
      '             NVL(VLRREMUNERACAO,0) AS VLRREMUNERACAO,'
      
        '             CI.DESCCARTINVEST, CT.SGLCUSTODIANTE, MB.SIGLAMOTBL' +
        'OQ'
      '             '
      
        '      FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI' +
        ', TIPOOPERACAO TP, INVESTIMENTO IV,'
      
        '           VWPLANPREVCTBPATR PP, CARTEIRAINVEST CI, CUSTODIANTE ' +
        'CT, MOTIVOBLOQUEIO MB,'
      ''
      
        '           (SELECT OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM, ' +
        'SUM(OIR.VLROPERACAO) AS QTDEOPERACAO'
      '            FROM OPERACAOINVEST OIR, PARAMINVEST PIR'
      '            WHERE OIR.IDOPERACAOORIGEM IS NOT NULL'
      
        '              AND OIR.IDTIPOOPERACAO IN (PIR.IDTIPOOPERDIRDIV, P' +
        'IR.IDTIPOOPERDIRDIV + 10000,'
      
        '                                         PIR.IDTIPOOPERDIRJUR, P' +
        'IR.IDTIPOOPERDIRJUR + 10000)'
      
        '              AND OIR.DATAOPERACAO <= TO_DATE('#39'01/09/2010'#39','#39'DD/M' +
        'M/YYYY'#39')'
      
        '            GROUP BY OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM' +
        ') REC,'
      ''
      
        '           (SELECT OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM, ' +
        'SUM(OIC.VLROPERACAO) AS QTDEOPERACAO'
      '            FROM OPERACAOINVEST OIC'
      '            WHERE OIC.IDOPERACAOORIGEM IS NOT NULL'
      '              AND OIC.IDTIPOOPERACAO IN (-170, -10170)'
      
        '              AND OIC.DATAOPERACAO <= TO_DATE('#39'01/09/2010'#39','#39'DD/M' +
        'M/YYYY'#39')'
      
        '            GROUP BY OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM' +
        ') CAN'
      ''
      '      WHERE OI.IDCARTEIRAGERENC IS NULL'
      '        AND OI.IDTIPOOPERACAO IN (-70, -10070)'
      '        AND OI.ORIGDEST IS NOT NULL'
      
        '        AND OI.DATAOPERACAO <= TO_DATE('#39'01/09/2010'#39','#39'DD/MM/YYYY'#39 +
        ')'
      '        AND OI.IDPLANPREVCTBPATR = 1'
      
        '        AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPO' +
        'OPERDIRJUR, PI.IDTIPOOPERDIRDIV+10000, PI.IDTIPOOPERDIRJUR+10000' +
        ')'
      '        AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '        AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '        AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '        AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '        AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '        AND OI.IDCUSTODIANTE = CT.IDCUSTODIANTE'
      '        AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO'
      '        AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAODIREITO = REC.IDOPERACAODIREITO(+)'
      '        AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAODIREITO = CAN.IDOPERACAODIREITO(+)' 
      
        '        AND NVL(OI.VLROPERACAO,0) > (NVL(REC.QTDEOPERACAO,0) + N' +
        'VL(CAN.QTDEOPERACAO,0))'
      '        AND ((NVL(OD.STATUS,'#39'P'#39') <> '#39'T'#39') OR'
      '             (EXISTS(SELECT OI2.DATAOPERACAO'
      '                     FROM OPERACAOINVEST OI2'
      
        '                     WHERE OI2.IDOPERACAODIREITO = OI.IDOPERACAO' +
        'DIREITO'
      
        '                       AND OI2.IDTIPOOPERACAO NOT IN (-10, -1007' +
        '0)'
      
        '                       AND OI2.DATAOPERACAO > TO_DATE('#39'01/09/201' +
        '0'#39','#39'DD/MM/YYYY'#39') )))'
      '                       ) TR'
      'WHERE TR.VLROPERACAO > 0'
      ''
      
        'ORDER BY TR.PLANPRVCONTABPATRO, TR.DESCINVESTIMENTO, TR.DATAEX, ' +
        'TR.DATAAGE, TR.DESCTIPOOPERACAO '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsSldTRCPlanoSintetico
    Left = 634
    Top = 279
  end
end
