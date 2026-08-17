inherited frmCadTransfRenFixLote: TfrmCadTransfRenFixLote
  Left = 342
  Top = 39
  HelpContext = 790255
  Caption = 'frmCadTransfRenFixLote'
  ClientHeight = 530
  ClientWidth = 811
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel [0]
    Left = 0
    Top = 78
    Width = 811
    Height = 3
    Align = alTop
    Shape = bsBottomLine
  end
  inherited pnlFundo: TPanel
    Top = 81
    Width = 811
    Height = 410
    inherited pnlControles: TPanel
      Width = 809
      Height = 408
    end
    inherited dbGrd: TwwDBGrid
      Width = 809
      Height = 408
      Selected.Strings = (
        'BOLETA'#9'10'#9'Boleta'
        'PLANOPATROORIG'#9'40'#9'Plano Origem'
        'PLANOPATRODEST'#9'40'#9'Plano Destino'
        'DESCCLASSETIT'#9'30'#9'Classe'
        'DESCINVESTIMENTO'#9'40'#9'Investimento'
        'DATAOPERACAO'#9'10'#9'Data Operação'
        'VENCOPERACAO'#9'10'#9'Vencimento'
        'QTDEOPERACAO'#9'20'#9'Quantidade'
        'VLROPERACAO'#9'20'#9'Valor'#9'F'
        'PERCTRANSF'#9'10'#9'Percentual')
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
    Width = 811
    Height = 410
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 4
    object pnlAltSaldos: TPanel
      Left = 1
      Top = 93
      Width = 809
      Height = 316
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
        DecDigits = 2
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
        Left = 717
        Top = 2
        Width = 90
        Height = 312
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
      Top = 93
      Width = 809
      Height = 316
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
      IndicatorColor = icBlack
      OnTopRowChanged = GridRefresh
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 809
      Height = 92
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
      object lblClasse: TLabel
        Left = 258
        Top = 4
        Width = 38
        Height = 13
        Caption = 'Classe'
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
      object Label1: TLabel
        Left = 621
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Observação'
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
      object dblkClasse: TwwDBLookupCombo
        Left = 258
        Top = 19
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Descrição'#9'F')
        LookupTable = qryClasseTit
        LookupField = 'IDCLASSETIT'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = dblkClasseEnter
        OnExit = dblkClasseExit
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 258
        Top = 59
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
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
    Width = 811
  end
  inherited Dock971: TDock97
    Top = 491
    Width = 811
    inherited tb97Fundo: TToolbar97
      Left = 639
      DockPos = 761
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 386
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
    Width = 811
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
      'OPERRENFIX.BOLETA'
      'OPERRENFIX.DATAOPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERRENFIX.VLROPERACAO'
      'OPERRENFIX.QTDEOPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Lote'
      'Data da Operação'
      'Investimento'
      'Valor Transferido'
      'Quantidade Transferida')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERRENFIX'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'OPERRENFIX.IDPLANPREVCTBPATR'
      'OPERRENFIX.IDINVESTIMENTO'
      'OPERRENFIX.DATAOPERACAO'
      'OPERRENFIX.IDOPERRENFIXAPLIC'
      'OPERRENFIX.BOLETA'
      'OPERRENFIX.VLROPERACAO'
      'OPERRENFIX.QTDEOPERACAO'
      'OPERRENFIX.PERCTRANSF'
      'OPERRENFIX.OBSERVACAO'
      'INVESTIMENTO.IDCLASSETIT')
    Filtro.Strings = (
      'OPERRENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERRENFIX.IDTIPOOPERACAO = -97'
      'SUBSTR(OPERRENFIX.BOLETA,1,2) = '#39'RF'#39)
    Mascaras.Strings = (
      ''
      'dd/mm/yyyy'
      ''
      '###,###,###,##0.00'
      '###,###,###,##0')
    Larguras.Strings = (
      '10'
      '18'
      '60'
      '10'
      '10')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    Left = 325
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 257
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 292
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT OP.BOLETA, PPO.PLANOPATROORIG, PPD.PLANOPATRODEST, CL.DES' +
        'CCLASSETIT, IV.DESCINVESTIMENTO,'
      
        '       OP.DATAOPERACAO, OP.VENCOPERACAO, OP.QTDEOPERACAO, OP.VLR' +
        'OPERACAO,'
      
        '       PPO.IDPLANPREVCTBPATR, PPD.IDPLANPREVCTBPATR, IV.IDCLASSE' +
        'TIT, OP.IDINVESTIMENTO, OP.PERCTRANSF'
      
        'FROM OPERRENFIX OP, OPERRENFIX OD, INVESTIMENTO IV, CLASSETITREN' +
        'FIX CL,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.I' +
        'DPLANPREVCTBPATR'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATRODEST, PA.I' +
        'DPLANPREVCTBPATR'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD'
      'WHERE ((:BOLETA IS NULL) OR (OP.BOLETA = :BOLETA))'
      '  AND OP.IDTIPOOPERACAO = -97'
      '  AND OP.BOLETA = OD.BOLETA'
      '  AND OD.IDTIPOOPERACAO <> -97'
      '  AND OD.IDOPERRENFIXORIG = OP.IDOPERRENFIXAPLIC'
      '  AND OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR'
      '  AND OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATR'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND IV.IDCLASSETIT = CL.IDCLASSETIT'
      ''
      'ORDER BY OP.BOLETA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 371
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptInputOutput
      end>
    object qryBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'BOLETA'
      Size = 30
    end
    object qryPLANOPATROORIG2: TStringField
      DisplayLabel = 'Plano Origem'
      DisplayWidth = 40
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object qryPLANOPATRODEST: TStringField
      DisplayLabel = 'Plano Destino'
      DisplayWidth = 40
      FieldName = 'PLANOPATRODEST'
      Size = 113
    end
    object qryDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryVENCOPERACAO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'VENCOPERACAO'
    end
    object qryQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0.#########'
    end
    object qryVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryPERCTRANSF: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCTRANSF'
      DisplayFormat = '#,##0.00'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryIDPLANPREVCTBPATR_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR_1'
      Visible = False
    end
    object qryIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
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
    Left = 230
    Top = 101
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
    Left = 230
    Top = 149
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
  object qryClasseTit: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDCLASSETIT,DESCCLASSETIT '
      'FROM '
      '   CLASSETITRENFIX'
      'ORDER BY DESCCLASSETIT  '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 93
    object qryClasseTitDESCCLASSETIT: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
    object qryClasseTitIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT (IV.DESCINVESTIMENTO || '#39' - '#39' || OP.DATAOPERACAO) AS DESC' +
        'INVESTIMENTO,'
      
        '       OP.QTDEOPERACAO, OP.PUOPERACAO, OP.VLROPERACAO, OP.VENCOP' +
        'ERACAO, CL.FLGUSAQTD,'
      '       OP.IDOPERRENFIXAPLIC, OP.IDINVESTIMENTO, IV.IDCLASSETIT'
      'FROM  OPERRENFIX OP, PARAMINVEST PA, CLASSETITRENFIX CL,'
      
        '      (SELECT IV1.IDINVESTIMENTO, IV1.DESCINVESTIMENTO, IV1.IDCL' +
        'ASSETIT'
      '       FROM INVESTIMENTO IV1'
      '       WHERE (IV1.IDTIPOINVEST = 1)'
      
        '         AND (((:IDEMISSOR IS NOT NULL) AND (IV1.IDEMISSOR = :ID' +
        'EMISSOR)) OR'
      '               (:IDEMISSOR IS NULL))'
      
        '         AND (((:IDCLASSETIT IS NOT NULL) AND (IV1.IDCLASSETIT =' +
        ' :IDCLASSETIT)) OR'
      '               (:IDCLASSETIT IS NULL))) IV'
      'WHERE (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)'
      '  AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      
        '  AND ((OP.VENCOPERACAO >= PA.DATAULTFECHRF) OR (OP.VENCOPERACAO' +
        ' IS NULL) OR (OP.VENCOPERACAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))' +
        ')'
      
        'ORDER BY IV.DESCINVESTIMENTO, OP.DATAOPERACAO, OP.IDOPERRENFIXAP' +
        'LIC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 454
    Top = 149
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 71
    end
    object qryInvestimentoQTDEOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEOPERACAO'
      Visible = False
    end
    object qryInvestimentoPUOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PUOPERACAO'
      Visible = False
    end
    object qryInvestimentoVLROPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      Visible = False
    end
    object qryInvestimentoVENCOPERACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'VENCOPERACAO'
      Visible = False
    end
    object qryInvestimentoIDOPERRENFIXAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERRENFIXAPLIC'
      Visible = False
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object qryInvestimentoFLGUSAQTD: TStringField
      FieldName = 'FLGUSAQTD'
      FixedChar = True
      Size = 1
    end
  end
  object qrySaldosATransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CL.DESCCLASSETIT,'
      '   IV.DESCINVESTIMENTO,'
      '   OP.DATAOPERACAO,'
      '   OP.VENCOPERACAO,'
      '   HR.SALDOQTDHISTRENFI,'
      '   HR.SALDOVLRHISTRENFI,'
      '   0 AS PERCTRANSFERIDO,'
      '   ROUND((HR.SALDOQTDHISTRENFI * 0),8) AS QTDTRANSFERIDO,'
      '   ROUND((HR.SALDOVLRHISTRENFI * 0),2) AS VLRTRANSFERIDO,'
      '   HR.DATAHISTRENFIX,'
      '   OP.QTDEOPERACAO,'
      '   OP.VLROPERACAO,'
      '   IV.IDEMISSOR,'
      '   HR.IDINVESTIMENTO,'
      '   HR.IDCARTEIRAINVEST,'
      '   OP.IDFORCLI,'
      '   OP.IDCUSTODIANTE,'
      '   OP.DATAEMISSAO,'
      '   OP.PUEMISSAO,'
      '   HR.IDOPERRENFIXAPLIC,'
      '   OP.IDUSUARIO,'
      '   IV.IDCLASSETIT,'
      '   IV.CARENCIA,'
      '   NVL(OP.IDCLASSRISCORENFIX,0),'
      '   OP.FLGCARTHIPO,'
      '   OP.QTDCARTHIPO,'
      '   OP.FLGNEGOCIACAO,'
      '   OP.IDPLANPREVCTBPATR,'
      '   OP.FLGOPERIMPLANT,'
      '   OP.MOECODIGO,'
      '   OP.DATALEILAO,'
      '   OP.PUOPERACAO,'
      '   OP.PUMERCADO,'
      '   HR.IDHISTRENFIX'
      
        'FROM  HISTRENFIX HR, OPERRENFIX OP, EMISSOR EM, CLASSETITRENFIX ' +
        'CL,'
      '     (SELECT'
      
        '         I.DESCINVESTIMENTO, I.IDEMISSOR, I.IDCLASSETIT, I.CAREN' +
        'CIA, I.IDINVESTIMENTO'
      '      FROM INVESTIMENTO I'
      '      WHERE'
      '           (I.IDTIPOINVEST = 1)'
      
        '      AND  ((:IDCLASSETIT IS NULL) OR (I.IDCLASSETIT = :IDCLASSE' +
        'TIT))) IV,'
      ''
      '     (SELECT MAX(H1.IDHISTRENFIX) AS IDHISTRENFIX'
      '      FROM HISTRENFIX H1'
      '      WHERE'
      
        '         ((H1.DATAHISTRENFIX, H1.IDINVESTIMENTO, H1.IDOPERRENFIX' +
        'APLIC, H1.IDPLANPREVCTBPATR) IN'
      
        '                 (SELECT MAX(H2.DATAHISTRENFIX), H2.IDINVESTIMEN' +
        'TO, H2.IDOPERRENFIXAPLIC, H2.IDPLANPREVCTBPATR'
      '                       FROM HISTRENFIX H2'
      
        '                  WHERE (H2.DATAHISTRENFIX <= TO_DATE(:DATAHISTR' +
        'ENFIX,'#39'DD/MM/YYYY'#39'))'
      
        '                    AND ((:IDINVESTIMENTO IS NULL) OR (H2.IDINVE' +
        'STIMENTO = :IDINVESTIMENTO))'
      
        '                    AND ((:IDOPERRENFIXAPLIC IS NULL) OR (H2.IDO' +
        'PERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      
        '                    AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDP' +
        'LANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                  GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPL' +
        'IC, H2.IDPLANPREVCTBPATR))'
      
        '     GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC, H1.IDPLAN' +
        'PREVCTBPATR) HMAX'
      '     '
      'WHERE (HR.IDHISTRENFIX = HMAX.IDHISTRENFIX)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      '--  AND ((HR.FLGRECALC IS NULL) OR (HR.FLGRECALC <> '#39'S'#39')) '
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      'ORDER BY DESCCLASSETIT, DESCINVESTIMENTO')
    UpdateObject = updSaldos
    ValidateWithMask = True
    Left = 568
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'DATAHISTRENFIX'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInputOutput
      end>
    object qrySaldosATransfDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 29
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object qrySaldosATransfDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 36
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qrySaldosATransfDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 11
      FieldName = 'DATAOPERACAO'
    end
    object qrySaldosATransfVENCOPERACAO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'VENCOPERACAO'
    end
    object qrySaldosATransfSALDOQTDHISTRENFI: TFloatField
      DisplayLabel = 'Qtd.Origem'
      DisplayWidth = 10
      FieldName = 'SALDOQTDHISTRENFI'
      DisplayFormat = '###,###,###,##0.#########'
    end
    object qrySaldosATransfSALDOVLRHISTRENFI: TFloatField
      DisplayLabel = 'Saldo Origem'
      DisplayWidth = 18
      FieldName = 'SALDOVLRHISTRENFI'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySaldosATransfDATAHISTRENFIX: TDateTimeField
      DisplayLabel = 'Transferência'
      DisplayWidth = 11
      FieldName = 'DATAHISTRENFIX'
    end
    object qrySaldosATransfPERCTRANSFERIDO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 8
      FieldName = 'PERCTRANSFERIDO'
      DisplayFormat = '###,##0.00'
    end
    object qrySaldosATransfQTDTRANSFERIDO: TFloatField
      DisplayLabel = 'Qtd. Transferida'
      DisplayWidth = 10
      FieldName = 'QTDTRANSFERIDO'
      DisplayFormat = '###,###,###,##0.#########'
    end
    object qrySaldosATransfVLRTRANSFERIDO: TFloatField
      DisplayLabel = 'Valor Transferido'
      DisplayWidth = 18
      FieldName = 'VLRTRANSFERIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySaldosATransfQTDEOPERACAO: TFloatField
      DisplayWidth = 14
      FieldName = 'QTDEOPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0'
    end
    object qrySaldosATransfVLROPERACAO: TFloatField
      DisplayWidth = 13
      FieldName = 'VLROPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySaldosATransfIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qrySaldosATransfIDINVESTIMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qrySaldosATransfIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qrySaldosATransfIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qrySaldosATransfIDCUSTODIANTE: TFloatField
      DisplayWidth = 14
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qrySaldosATransfDATAEMISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAEMISSAO'
      Visible = False
    end
    object qrySaldosATransfPUEMISSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PUEMISSAO'
      Visible = False
    end
    object qrySaldosATransfIDOPERRENFIXAPLIC: TFloatField
      DisplayWidth = 18
      FieldName = 'IDOPERRENFIXAPLIC'
      Visible = False
    end
    object qrySaldosATransfIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object qrySaldosATransfIDCLASSETIT: TFloatField
      DisplayWidth = 11
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object qrySaldosATransfCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'CARENCIA'
      Visible = False
    end
    object qrySaldosATransfNVLOPIDCLASSRISCORENFIX0: TFloatField
      DisplayWidth = 28
      FieldName = 'NVL(OP.IDCLASSRISCORENFIX,0)'
      Visible = False
    end
    object qrySaldosATransfFLGCARTHIPO: TStringField
      DisplayWidth = 12
      FieldName = 'FLGCARTHIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySaldosATransfQTDCARTHIPO: TFloatField
      DisplayWidth = 12
      FieldName = 'QTDCARTHIPO'
      Visible = False
    end
    object qrySaldosATransfFLGNEGOCIACAO: TStringField
      DisplayWidth = 14
      FieldName = 'FLGNEGOCIACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySaldosATransfIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 19
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qrySaldosATransfFLGOPERIMPLANT: TStringField
      DisplayWidth = 15
      FieldName = 'FLGOPERIMPLANT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySaldosATransfMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qrySaldosATransfDATALEILAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALEILAO'
      Visible = False
    end
    object qrySaldosATransfPUOPERACAO: TFloatField
      DisplayWidth = 12
      FieldName = 'PUOPERACAO'
      Visible = False
    end
    object qrySaldosATransfPUMERCADO: TFloatField
      DisplayWidth = 11
      FieldName = 'PUMERCADO'
      Visible = False
    end
    object qrySaldosATransfIDHISTRENFIX: TFloatField
      DisplayWidth = 12
      FieldName = 'IDHISTRENFIX'
      Visible = False
    end
  end
  object dsSaldosATransf: TwwDataSource
    AutoEdit = False
    DataSet = qrySaldosATransf
    OnStateChange = dsSaldosATransfStateChange
    Left = 596
    Top = 3
  end
  object pmnuFixaColunas: TPopupMenu
    OnPopup = pmnuFixaColunasPopup
    Left = 480
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
  object updSaldos: TUpdateSQL
    Left = 624
    Top = 3
  end
  object ppmSaldos: TPopupMenu
    OnPopup = pmnuFixaColunasPopup
    Left = 520
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
end
