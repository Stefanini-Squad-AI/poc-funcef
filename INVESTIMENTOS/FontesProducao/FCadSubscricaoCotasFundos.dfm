inherited FrmCadSubscricaoCotasFundos: TFrmCadSubscricaoCotasFundos
  Left = 126
  Top = 58
  HelpContext = 790218
  Caption = 'Operação'
  ClientHeight = 434
  ClientWidth = 721
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 348
    inherited Bevel1: TBevel
      Width = 719
    end
    inherited tbcDetalhe: TTabControlDetalhe [1]
      Top = 169
      Width = 719
      Height = 178
      TabOrder = 0
      Tabs.Strings = (
        'Fluxo'
        'Operação'
        'Saldo')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdOpe'
        'dbgrdSld')
      inherited pgctrlDetalhe: TPageControl
        Width = 621
        Height = 119
        inherited tbsDet: TTabSheet
          Caption = 'Fluxo'
          inherited dbgrdDet: TwwDBGrid
            Width = 613
            Height = 91
            Selected.Strings = (
              'DATAINTEGRALIZAR'#9'20'#9'Data'#9'F'
              'QTDINTEGRALIZAR'#9'74'#9'Quantidade de Cotas'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel
            Width = 613
            Height = 91
            object Label2: TLabel
              Left = 7
              Top = 7
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label1: TLabel
              Left = 7
              Top = 50
              Width = 120
              Height = 13
              Caption = 'Quantidade de Cotas'
            end
            object dbdDtaFluxo: TCMDateTimePicker
              Left = 7
              Top = 21
              Width = 108
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINTEGRALIZAR'
              DataSource = dsDet
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
            object dbeQtdCotas: TDBRealEdit
              Left = 8
              Top = 64
              Width = 209
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000000')
              TabOrder = 1
              WordWrap = False
              OnExit = dbeQtdCotasExit
              IntDigits = 10
              DecDigits = 12
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDINTEGRALIZAR'
              DataSource = dsDet
            end
          end
        end
        object tbsOpe: TTabSheet
          Caption = 'Operação'
          ImageIndex = 1
          object dbgrdOpe: TwwDBGrid
            Left = 0
            Top = 0
            Width = 613
            Height = 91
            Selected.Strings = (
              'DATAOPERACAO'#9'20'#9'Data da Integralização'
              'QTDOPERACAO'#9'27'#9'Quantidade Integralizada'
              'VLRCOTA'#9'25'#9'Valor da Cota'
              'VLROPERACAO'#9'21'#9'Valor Integralizado')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsOperacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsSaldo: TTabSheet
          Caption = 'Saldo'
          ImageIndex = 2
          object dbgrdSld: TwwDBGrid
            Left = 0
            Top = 0
            Width = 613
            Height = 91
            Selected.Strings = (
              'DATAHISTCOTAINTEG'#9'10'#9'Data Atual'
              'DATAAPLICACAO'#9'10'#9'Aplicação'
              'QTDHISTCOTAINTEGR'#9'20'#9'Quantidade'
              'VLRCOTAINTEGR'#9'18'#9'Valor da Cota'
              'VLRHISTCOTAINTEGR'#9'18'#9'Valor Atualizado'
              'VLRVARIACAODIA'#9'15'#9'Variação Dia'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsSaldo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 711
        object lblQtd: TfcLabel [0]
          Left = 656
          Top = 5
          Width = 31
          Height = 15
          Align = alLeft
          Caption = '0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
        end
        object lblCapQtd: TfcLabel [1]
          Left = 238
          Top = 6
          Width = 249
          Height = 14
          Align = alRight
          Caption = 'Quantidade Total de Cotas a Integralizar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.VAlignment = vaVCenter
        end
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Height = 24
          end
        end
      end
      inherited Dock974: TDock97
        Left = 625
        Height = 119
      end
    end
    inherited pnlMestre: TPanel [2]
      Width = 719
      Height = 125
      TabOrder = 1
      object pgcOper: TPageControl
        Left = 0
        Top = 0
        Width = 719
        Height = 125
        ActivePage = TbsOperacao
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object TbsOperacao: TTabSheet
          Caption = 'Operação'
          ImageIndex = 1
          object lbFundoInvestOper: TLabel
            Left = 5
            Top = 40
            Width = 136
            Height = 13
            Caption = 'Fundo de Investimentos'
          end
          object Label25: TLabel
            Left = 232
            Top = 79
            Width = 27
            Height = 13
            Caption = 'Cota'
          end
          object lbDataOper: TLabel
            Left = 327
            Top = 0
            Width = 105
            Height = 13
            Caption = 'Data da Operação'
          end
          object lbTotalCotas: TLabel
            Left = 5
            Top = 79
            Width = 84
            Height = 13
            Caption = 'Total de Cotas'
          end
          object lbVlrTotCotas: TLabel
            Left = 451
            Top = 79
            Width = 123
            Height = 13
            Caption = 'Valor Total das Cotas'
          end
          object lbTipoCota: TLabel
            Left = 451
            Top = 40
            Width = 74
            Height = 13
            Caption = 'Tipo de Cota'
          end
          object lbTipoFundo: TLabel
            Left = 5
            Top = 0
            Width = 83
            Height = 13
            Caption = 'Tipo de Fundo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblFundoInvestOper: TwwDBLookupCombo
            Left = 6
            Top = 54
            Width = 429
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'50'#9'Descrição'#9'F')
            DataField = 'IDFUNDOINVEST'
            DataSource = ds
            LookupTable = QryFundoInvestOper
            LookupField = 'IDFUNDOINVEST'
            Options = [loColLines, loRowLines]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnCloseUp = dblFundoInvestOperCloseUp
            OnExit = dblFundoInvestOperExit
          end
          object dbeVlrCota: TDBRealEdit
            Left = 234
            Top = 93
            Width = 199
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000000000')
            TabOrder = 5
            WordWrap = False
            OnExit = dbeVlrCotaExit
            IntDigits = 14
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRCOTA'
            DataSource = ds
          end
          object dbdDataOper: TCMDateTimePicker
            Left = 327
            Top = 14
            Width = 108
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
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
            TabOrder = 1
            OnExit = dbdDataOperExit
          end
          object dbeTotQtdCotas: TDBRealEdit
            Left = 5
            Top = 93
            Width = 211
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000000000')
            TabOrder = 4
            WordWrap = False
            OnExit = dbeVlrCotaExit
            IntDigits = 14
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
            DataField = 'QTDOPERACAO'
            DataSource = ds
          end
          object dbeVlrTotCotas: TDBRealEdit
            Left = 451
            Top = 93
            Width = 184
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
            DataSource = ds
          end
          object dblTipoCota: TwwDBLookupCombo
            Left = 451
            Top = 54
            Width = 225
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
            DataField = 'IDTIPOCOTA'
            DataSource = ds
            LookupTable = QryTipoCota
            LookupField = 'IDTIPOCOTA'
            Options = [loColLines, loRowLines]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnCloseUp = dblTipoCotaCloseUp
            OnExit = dblTipoCotaExit
          end
          object dblTipoFundo: TwwDBLookupCombo
            Left = 5
            Top = 14
            Width = 303
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
            DataField = 'IDTIPOFUNDOINVEST'
            DataSource = ds
            LookupTable = QryTipoFundo
            LookupField = 'IDTIPOFUNDOINVEST'
            Options = [loColLines, loRowLines]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblTipoFundoExit
          end
        end
        object tbsObservacao: TTabSheet
          Caption = 'Observação'
          object dbmObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 694
            Height = 115
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = ds
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlTitulo: TPanel
      Width = 719
      inherited lbNomItem: TfcLabel
        Width = 399
        Caption = 'Subscrição de Cotas Fundos Fechados'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 549
      DockPos = 605
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 380
      DockPos = 436
    end
    inherited fraMens: TfraMensagem
      Width = 380
      inherited pnlProgresso: TPanel
        Width = 380
        inherited pnlProgressoMensagem: TPanel
          Width = 335
          inherited lblProgressoMensagem: TfcLabel
            Width = 333
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 336
          Width = 43
          inherited pgbProcesso: TProgressBar
            Width = 41
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 488
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    Left = 232
    Top = 260
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 232
    Top = 217
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDCOTAINTEGRALIZA = :IDCOTAINTEGRALIZA,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, '
      '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, '
      'VLROPERACAO, '
      '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, '
      'IDOPERACAOORIGEM, '
      '   DATACOTIZACAO, OBSERVACAO, PLANO, PLNCODIGO, CODDOCUMENTO, '
      'IDTIPOCOTA, '
      '   IDCOTAINTEGRALIZA, IDPLANPREVCTBPATR)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, '
      ':QTDOPERACAO, '
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, '
      ':STACONFIRMA, '
      '   :IDOPERACAOORIGEM, :DATACOTIZACAO, :OBSERVACAO, :PLANO, '
      ':PLNCODIGO, '
      '   :CODDOCUMENTO, :IDTIPOCOTA, :IDCOTAINTEGRALIZA, '
      ':IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 204
    Top = 217
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLRCOTA'
      'OPERACAOFUNDO.VLROPERACAO'
      'TIPOCOTA.DESCTIPOCOTA')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Fundo de Investimento'
      'Data da Operação'
      'Tota de Cotas'
      'Cota'
      'Valor Total das Cotas'
      'Tipo de Cota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'FUNDOINVEST'
      'TIPOCOTA')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOOPERACAO = -119'
      'FUNDOINVEST.IDFUNDOINVEST    = OPERACAOFUNDO.IDFUNDOINVEST'
      'OPERACAOFUNDO.IDTIPOCOTA = TIPOCOTA.IDTIPOCOTA(+)')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###0.000000000'
      '###,###,###0.000000000'
      '###,###,###0.00'
      '')
    Larguras.Strings = (
      '30'
      '10'
      '22'
      '20'
      '22'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 380
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 132
    Top = 218
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT TP.DESCTIPOOPERACAO   AS DESCTIPOOPERACAO,'
      '       OP.IDOPERACAOFUNDO,   OP.IDCARTEIRAINVEST,'
      '       OP.IDPEDIDOFUNDO,     OP.IDTIPOINVEST,'
      '       OP.IDTIPOOPERACAO,    OP.IDFUNDOINVEST,'
      '       OP.DATAOPERACAO,      OP.DATALIQUIDACAO,'
      '       OP.QTDOPERACAO,       OP.VLROPERACAO,'
      '       OP.VLRCOTA,           OP.VLRIR,'
      '       OP.VLRIOF,            OP.VLRRENDIMENTO,'
      '       OP.STACONFIRMA,       OP.IDOPERACAOORIGEM,'
      '       OP.DATACOTIZACAO,     OP.OBSERVACAO,'
      '       OP.PLANO,             OP.PLNCODIGO,'
      '       OP.CODDOCUMENTO,      OP.IDTIPOCOTA,'
      '       OP.IDCOTAINTEGRALIZA, OP.IDPLANPREVCTBPATR,'
      '       FI.IDTIPOFUNDOINVEST '
      'FROM'
      '       OPERACAOFUNDO OP, TIPOOPERACAO TP, FUNDOINVEST FI'
      'WHERE'
      '       OP.IDOPERACAOFUNDO    = :IDOPERACAOFUNDO'
      '  AND  TP.IDTIPOINVEST       = OP.IDTIPOINVEST'
      '  AND  TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO'
      '  AND  FI.IDFUNDOINVEST      = OP.IDFUNDOINVEST   '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 176
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
    object qryDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
    end
    object qryQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object qryVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object qryVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object qrySTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      FixedChar = True
      Size = 1
    end
    object qryIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryIDCOTAINTEGRALIZA: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
    end
    object qryIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    ApplyInsert = CmeDetalheApplyInsert
    Left = 131
    Top = 260
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update COTAINTEGRALIZA'
      'set'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  DATAINTEGRALIZAR = :DATAINTEGRALIZAR,'
      '  QTDINTEGRALIZAR = :QTDINTEGRALIZAR'
      'where'
      '  IDCOTAINTEGRALIZA = :OLD_IDCOTAINTEGRALIZA')
    InsertSQL.Strings = (
      'insert into COTAINTEGRALIZA'
      
        '  (IDCOTAINTEGRALIZA, IDOPERACAOFUNDO, IDFUNDOINVEST, IDTIPOCOTA' +
        ', '
      '   DATAINTEGRALIZAR, QTDINTEGRALIZAR)'
      'values'
      
        '  (:IDCOTAINTEGRALIZA, :IDOPERACAOFUNDO, :IDFUNDOINVEST, :IDTIPO' +
        'COTA,'
      '   :DATAINTEGRALIZAR,  :QTDINTEGRALIZAR)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from COTAINTEGRALIZA'
      'where'
      '  IDCOTAINTEGRALIZA = :OLD_IDCOTAINTEGRALIZA')
    Left = 204
    Top = 260
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDCOTAINTEGRALIZA,'
      '      IDOPERACAOFUNDO,'
      '      IDFUNDOINVEST,'
      '      IDTIPOCOTA,'
      '      DATAINTEGRALIZAR,'
      '      QTDINTEGRALIZAR,'
      '      '#39' '#39' AS ALTERADO'
      'FROM'
      '      COTAINTEGRALIZA'
      ''
      'WHERE (IDOPERACAOFUNDO = :IDOPERACAOFUNDO)'
      ''
      'ORDER BY DATAINTEGRALIZAR DESC'
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
    Left = 176
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
    object qryDetalheDATAINTEGRALIZAR: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 20
      FieldName = 'DATAINTEGRALIZAR'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.DATAINTEGRALIZAR'
    end
    object qryDetalheQTDINTEGRALIZAR: TFloatField
      DisplayLabel = 'Quantidade de Cotas'
      DisplayWidth = 74
      FieldName = 'QTDINTEGRALIZAR'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.QTDINTEGRALIZAR'
      DisplayFormat = '###,###,###0.000000000'
    end
    object qryDetalheIDTIPOCOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.IDTIPOCOTA'
      Visible = False
    end
    object qryDetalheIDCOTAINTEGRALIZA: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.IDCOTAINTEGRALIZA'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object qryDetalheALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.DESCTIPOOPERACAO, T.FLGGERACONTAB, T.IDTIPOOPERACAO, T.' +
        'IDTIPOINVEST,'
      
        '       T.FLGGRAVAIRLITIGIO, T.FLGISENTOIR, T.NATUREZAOPERACAO, T' +
        '.FLGTRATAIR,'
      '       T.TIPCREDOR, T.RECPAG, T.VENCIMENTO, T.FLGCONTAINVEST'
      'FROM TIPOOPERACAO T'
      'WHERE'
      '    (T.IDTIPOINVEST    = :IDTIPOINVEST)'
      'AND (T.IDTIPOOPERACAO  = -119)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 355
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
    object QryTipoOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 579
  end
  object QryFundoInvestOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.MOECODIGO' +
        '         ,'
      
        '   FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.STAEXCLUS' +
        'IVO      ,'
      
        '   FUN.PZOCARENCIA       , FUN.PZOANIVERSARIO    , FUN.QTDDECQTD' +
        '         ,'
      
        '   FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTI' +
        'ZACAO    ,'
      
        '   FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.STAPROVIS' +
        'IONAIR   ,'
      
        '   FUN.DATAINICIOFUNDO   , FUN.DTAINIPROC        , FUN.IDGESTORC' +
        'ARTEIRA  ,'
      '  TFI.IDTIPOINVEST'
      'FROM'
      ' (SELECT'
      '     IDFUNDOINVEST     , DESCFUNDOINVEST   , MOECODIGO         ,'
      '     IDCARTEIRAINVEST  , IDTIPOFUNDOINVEST , STAEXCLUSIVO      ,'
      '     PZOCARENCIA       , PZOANIVERSARIO    , QTDDECQTD         ,'
      '     QTDDECVALOR       , STAFUNDO          , PZOAMORTIZACAO    ,'
      '     PERCTXPERFORM     , PERCTXADM         , STAPROVISIONAIR   ,'
      '     DATAINICIOFUNDO   , DTAINIPROC        , IDGESTORCARTEIRA'
      
        '  FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENC' +
        'IA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        ' (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/MM/YYYY, ' +
        'HH24:MI:SS'#39')'
      '  FROM HISTFUNDOINVEST'
      
        '  WHERE DTAVIGENCIA       < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')+' +
        '1'
      '  AND (((:IDTIPOFUNDOINVEST IS NOT NULL)           AND'
      '        (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))  OR'
      '        (:IDTIPOFUNDOINVEST IS NULL))'
      '  GROUP BY IDFUNDOINVEST))) FUN,  TIPOFUNDOINVEST TFI'
      'WHERE'
      '    TFI.IDTIPOINVEST      =:IDTIPOINVEST'
      'AND (((:IDTIPOFUNDOINVEST IS NOT NULL)           AND'
      '   (TFI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '      (:IDTIPOFUNDOINVEST IS NULL))'
      'AND FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST'
      'ORDER BY  FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 531
    Top = 140
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
        Name = 'IDTIPOINVEST'
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
      end>
    object QryFundoInvestOperDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestOperMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryFundoInvestOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestOperIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestOperSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestOperPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestOperQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestOperQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestOperSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestOperPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestOperPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryFundoInvestOperSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Visible = False
    end
    object QryFundoInvestOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryFundoInvestOperDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object QryFundoInvestOperIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDTIPOCOTA,'
      '     DESCTIPOCOTA'
      'FROM'
      '     TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ' ')
    ValidateWithMask = True
    Left = 531
    Top = 52
    object QryTipoCotaDESCTIPOCOTA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
    object QryTipoCotaIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
      Visible = False
    end
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOFUNDOINVEST,'
      '   IDTIPOINVEST,'
      '   DESCTIPOFUNDOINV,'
      '   DATAULTFECH'
      'FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0)) '
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 531
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoFundoDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DATAULTFECH'
      Visible = False
    end
  end
  object QryBuscaOperacaoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOFUNDO'
      'FROM OPERACAOFUNDO OP, FUNDOINVEST FI'
      'WHERE'
      '     OP.IDTIPOINVEST      =:IDTIPOINVEST'
      ' AND OP.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR'
      ' AND OP.IDFUNDOINVEST     =:IDFUNDOINVEST'
      ' AND OP.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      ' AND OP.IDTIPOOPERACAO    =:IDTIPOOPERACAO'
      ''
      ' AND (((:IDTIPOCOTA IS NOT NULL)      AND'
      '      (OP.IDTIPOCOTA = :IDTIPOCOTA))  OR'
      '      (:IDTIPOCOTA IS NULL) )'
      ''
      ' AND FI.IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST'
      ' AND FI.IDFUNDOINVEST     = OP.IDFUNDOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 355
    Top = 91
    ParamData = <
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
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
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
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object QryCotaIntegrFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNDOINVEST, DATACOTA, VLRCOTA'
      'FROM   COTAINTEGRFUNDO'
      'WHERE    (IDFUNDOINVEST = :IDFUNDOINVEST)'
      '  AND    (DATACOTA      = TO_DATE(:DATACOTA,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (((:IDTIPOCOTA IS NOT NULL)   AND (IDTIPOCOTA =:IDTIPOCOTA' +
        ')) OR'
      '        (:IDTIPOCOTA IS NULL))'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 355
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
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
  end
  object QryVerIntegrCotasLancadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOFUNDO'
      'FROM   OPERACAOFUNDO'
      'WHERE  IDOPERACAOORIGEM = :IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 355
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryBuscaFluxoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNDOINVEST'
      'FROM COTAINTEGRALIZA'
      'WHERE'
      '     IDFUNDOINVEST     =:IDFUNDOINVEST'
      ''
      ' AND DATAINTEGRALIZAR  =TO_DATE(:DATAINTEGRALIZAR,'#39'DD/MM/YYYY'#39')'
      ''
      ' AND (((:IDTIPOCOTA IS NOT NULL)      AND'
      '        (IDTIPOCOTA = :IDTIPOCOTA))  OR'
      '       (:IDTIPOCOTA IS NULL) )'
      ' ')
    ValidateWithMask = True
    Left = 355
    Top = 187
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINTEGRALIZAR'
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
  end
  object QryVerFluxoCotasIntegr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO'
      'WHERE  IDCOTAINTEGRALIZA = :IDCOTAINTEGRALIZA '
      ' ')
    ValidateWithMask = True
    Left = 355
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCOTAINTEGRALIZA'
        ParamType = ptInput
      end>
  end
  object QryOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OPER.DATAOPERACAO, OPER.QTDOPERACAO, OPER.VLROPERACAO, OP' +
        'ER.VLRCOTA'
      'FROM ('
      
        '      SELECT OO.DATAOPERACAO, OO.QTDOPERACAO, OO.VLROPERACAO, OO' +
        '.VLRCOTA'
      '      FROM   OPERACAOFUNDO OO'
      '      WHERE'
      '             OO.IDOPERACAOORIGEM  = :IDOPERACAOFUNDO AND'
      '             OO.IDTIPOOPERACAO NOT IN (-165,-173)'
      '      UNION'
      ''
      
        '      SELECT OP.DATAOPERACAO, OP.QTDOPERACAO, OP.VLROPERACAO, OP' +
        '.VLRCOTA'
      '      FROM   OPERACAOFUNDO OP'
      '      WHERE'
      '             OP.IDOPERACAOORIGEM IN (SELECT O.IDOPERACAOFUNDO'
      '                                     FROM OPERACAOFUNDO O'
      '                                     WHERE  '
      
        '                                            O.IDOPERACAOORIGEM  ' +
        '= :IDOPERACAOFUNDO   AND'
      
        '                                            O.IDTIPOOPERACAO IN ' +
        '(-165,-166))         AND'
      '      ((OP.IDTIPOOPERACAO = -100) OR (OP.IDTIPOOPERACAO = -105))'
      '      ) OPER'
      'ORDER BY OPER.DATAOPERACAO DESC'
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 308
    ParamData = <
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
    object QryOperacaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Integralização'
      DisplayWidth = 20
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATAOPERACAO'
    end
    object QryOperacaoQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade Integralizada'
      DisplayWidth = 27
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDOPERACAO'
    end
    object QryOperacaoVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 25
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOTA'
    end
    object QryOperacaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Integralizado'
      DisplayWidth = 21
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object DsOperacao: TwwDataSource
    AutoEdit = False
    DataSet = QryOperacao
    OnStateChange = dsStateChange
    Left = 232
    Top = 308
  end
  object QrySaldo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    HC.QTDHISTCOTAINTEGR, HC.DATAAPLICACAO, HC.DATAHISTCOTAINTEG' +
        ','
      
        '    HC.VLRCOTAINTEGR,     HC.VLRHISTCOTAINTEGR, HC.VLRVARIACAODI' +
        'A'
      'FROM'
      '    HISTCOTAINTEGRALIZA HC'
      ''
      'WHERE'
      '    (HC.IDHISTCOTAINTEGR IN (SELECT MAX(HC1.IDHISTCOTAINTEGR)'
      '                             FROM   HISTCOTAINTEGRALIZA HC1'
      '                             WHERE'
      
        '                                     (HC1.IDPLANPREVCTBPATR  = :' +
        'IDPLANPREVCTBPATR)'
      
        '                             AND     (HC1.DATAHISTCOTAINTEG <= :' +
        'DATAHISTCOTAINTEG)'
      
        '                             AND    ((HC1.IDOPERACAOFUNDO    = :' +
        'IDOPERACAOFUNDO) OR'
      '                                     (HC1.IDOPERACAOFUNDO IN'
      
        '                                         (SELECT IDOPERACAOFUNDO' +
        ' FROM OPERACAOFUNDO WHERE'
      
        '                                          IDOPERACAOORIGEM = :ID' +
        'OPERACAOFUNDO)))'
      '                             GROUP BY HC1.DATAHISTCOTAINTEG))'
      'AND (HC.QTDHISTCOTAINTEGR > 0)'
      'ORDER BY  HC.DATAHISTCOTAINTEG DESC, HC.DATAAPLICACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 173
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
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
    object QrySaldoDATAHISTCOTAINTEG: TDateTimeField
      DisplayLabel = 'Data Atual'
      DisplayWidth = 10
      FieldName = 'DATAHISTCOTAINTEG'
    end
    object QrySaldoDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QrySaldoQTDHISTCOTAINTEGR: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDHISTCOTAINTEGR'
    end
    object QrySaldoVLRCOTAINTEGR: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 18
      FieldName = 'VLRCOTAINTEGR'
    end
    object QrySaldoVLRHISTCOTAINTEGR: TFloatField
      DisplayLabel = 'Valor Atualizado'
      DisplayWidth = 18
      FieldName = 'VLRHISTCOTAINTEGR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoVLRVARIACAODIA: TFloatField
      DisplayLabel = 'Variação Dia'
      DisplayWidth = 15
      FieldName = 'VLRVARIACAODIA'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object DsSaldo: TwwDataSource
    AutoEdit = False
    DataSet = QrySaldo
    OnStateChange = dsStateChange
    Left = 229
    Top = 357
  end
  object QryAtualOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TP.DESCTIPOOPERACAO   AS DESCTIPOOPERACAO,'
      '       OP.IDOPERACAOFUNDO,   OP.IDCARTEIRAINVEST,'
      '       OP.IDPEDIDOFUNDO,     OP.IDTIPOINVEST,'
      '       OP.IDTIPOOPERACAO,    OP.IDFUNDOINVEST,'
      '       OP.DATAOPERACAO,      OP.DATALIQUIDACAO,'
      '       OP.QTDOPERACAO,       OP.VLROPERACAO,'
      '       OP.VLRCOTA,           OP.VLRIR,'
      '       OP.VLRIOF,            OP.VLRRENDIMENTO,'
      '       OP.STACONFIRMA,       OP.IDOPERACAOORIGEM,'
      '       OP.DATACOTIZACAO,     OP.OBSERVACAO,'
      '       OP.PLANO,             OP.PLNCODIGO,'
      '       OP.CODDOCUMENTO,      OP.IDTIPOCOTA,'
      '       OP.IDCOTAINTEGRALIZA, OP.IDPLANPREVCTBPATR,'
      '       FI.IDTIPOFUNDOINVEST '
      'FROM'
      '       OPERACAOFUNDO OP, TIPOOPERACAO TP, FUNDOINVEST FI'
      'WHERE'
      '       OP.IDOPERACAOFUNDO    = :IDOPERACAOFUNDO'
      '  AND  TP.IDTIPOINVEST       = OP.IDTIPOINVEST'
      '  AND  TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO'
      '  AND  FI.IDFUNDOINVEST      = OP.IDFUNDOINVEST   '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 169
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
  end
  object QryBuscaOperOrig: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO  WHERE'
      'IDTIPOINVEST      = :IDTIPOINVEST       AND'
      'IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR  AND'
      'IDOPERACAOORIGEM  = :IDOPERACAOORIGEM   AND'
      'IDTIPOOPERACAO    = -173'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 308
    ParamData = <
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
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptInput
      end>
  end
end
