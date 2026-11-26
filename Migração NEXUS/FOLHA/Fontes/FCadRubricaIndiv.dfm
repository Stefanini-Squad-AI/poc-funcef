inherited frmCadRubricaIndiv: TfrmCadRubricaIndiv
  Left = 189
  Top = 65
  HelpContext = 180032
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Rubricas Individuais'
  ClientHeight = 577
  ClientWidth = 1043
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1043
    Height = 491
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 45
      Width = 1041
      Height = 445
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Tabs.Strings = (
        'Pensão Alimentícia'
        'Outras Rubricas')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdOutrasRubricas')
      inherited pgctrlDetalhe: TPageControl
        Width = 1020
        Height = 386
        ActivePage = tbsOutrasRubricas
        TabOrder = 0
        inherited tbsDet: TTabSheet
          Caption = 'Pensão Alimentícia'
          inherited dbgrdDet: TwwDBGrid
            Width = 1012
            Height = 358
            Selected.Strings = (
              'IDMOSTRARUB'#9'10'#9'Cód. Rubrica~Desconto PA'#9'F'
              'FLGPERMANENTE'#9'10'#9'Permanente'#9'F'
              'DATAINICIO'#9'10'#9'Data de ~Início'#9'F'
              'DATAFINAL'#9'10'#9'Data ~Final'#9'F'
              'MESCOMPREEM'#9'7'#9'Mês de~Reembolso'
              'ANOMESREF'#9'8'#9'Mês de ~Referência'#9'F'
              'VALORRUBRICA'#9'10'#9'Valor'#9'F'
              'FAVORECIDO'#9'34'#9'Favorecido'#9'F'
              'DESCRICAO'#9'43'#9'Descrição da Rubrica de Desconto PA'#9'F'
              'FLGBASEPA'#9'12'#9'Forma a base ~de outras PA'#39's'#9'F'
              'FLGUSAABONO'#9'10'#9'Incide sobre ~Abono Anual'#9'F'
              'FLGANTECIPABONO'#9'12'#9'Incide s/ ~Antecip. Abono'#9'F'
              'PARCELAS'#9'10'#9'Total de ~Parcelas'#9'F'
              'NUMOCORRENCIAS'#9'10'#9'Parcelas ~Processadas'#9'F'
              'SEQRUBRICAINDIV'#9'8'#9'Sequencial'#9'F'
              'IDMOSTRARUB1'#9'10'#9'Cód. Rubrica~Provento PA'#9'F'
              'DESCRICAO_1'#9'46'#9'Descrição da Rubrica de Provento PA'#9'F'
              'FLGDESATIVADO'#9'10'#9'Desativada'#9'F'
              'FLGUSADO'#9'10'#9'Já~Processada'#9'F'
              'IDREGRACALCULO'#9'10'#9'Código da ~Regra'#9'F'
              'NOMEREGRA'#9'30'#9'Descrição da Regra'#9'F'
              'NUMPROCINSS'#9'15'#9'Nº Proc. INSS'#9'F'
              'TRGDTINCLUSAO'#9'19'#9'Data e Hora de Inclusão'#9'F'
              'NOME'#9'60'#9'Incluído por...'#9'F')
            MemoAttributes = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTrailingEllipsis, dgShowCellHint]
            TitleAlignment = taCenter
            TitleFont.Style = []
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 1012
            Height = 358
            BevelOuter = bvLowered
            object pnlOp1PA: TPanel
              Left = 1
              Top = 1
              Width = 1010
              Height = 69
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object dbrgrpPermanentePA: TDBRadioGroup
                Left = 0
                Top = 0
                Width = 107
                Height = 69
                Align = alLeft
                Caption = ' Permanente '
                DataField = 'FLGPERMANENTE'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Items.Strings = (
                  '  Sim'
                  '  Não')
                ParentFont = False
                TabOrder = 0
                TabStop = True
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgrpPermanentePAChange
                OnClick = dbrgrpPermanentePAClick
              end
              object grpParcelasPA: TGroupBox
                Left = 366
                Top = 0
                Width = 151
                Height = 69
                Align = alRight
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object lblParcelasPA: TLabel
                  Left = 27
                  Top = 19
                  Width = 41
                  Height = 13
                  Caption = 'Parcelas'
                end
                object lblProcPA: TLabel
                  Left = 7
                  Top = 43
                  Width = 61
                  Height = 13
                  Caption = 'Processadas'
                end
                object spedParcelasPA: TwwDBSpinEdit
                  Left = 79
                  Top = 15
                  Width = 61
                  Height = 21
                  Increment = 1
                  DataField = 'PARCELAS'
                  DataSource = dsDet
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  OnExit = spedParcelasPAExit
                end
                object spedNumOcorrenciasPA: TwwDBSpinEdit
                  Left = 79
                  Top = 40
                  Width = 61
                  Height = 21
                  Increment = 1
                  DataField = 'NUMOCORRENCIAS'
                  DataSource = dsDet
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
              end
              object grpPeriodoPA: TGroupBox
                Left = 702
                Top = 0
                Width = 308
                Height = 69
                Align = alRight
                Caption = ' Processamento '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object lblDePA: TLabel
                  Left = 9
                  Top = 21
                  Width = 14
                  Height = 13
                  Caption = 'De'
                end
                object lblAtePA: TLabel
                  Left = 6
                  Top = 46
                  Width = 16
                  Height = 13
                  Caption = 'Até'
                end
                object lblUltMesPA: TLabel
                  Left = 150
                  Top = 36
                  Width = 56
                  Height = 26
                  Alignment = taRightJustify
                  Caption = 'Último Mês Processado'
                  WordWrap = True
                end
                object dbdtInicioPA: TCMDateTimePicker
                  Left = 31
                  Top = 17
                  Width = 97
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINICIO'
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
                  OnExit = dbdtInicioPAExit
                end
                object dbdtFinalPA: TCMDateTimePicker
                  Left = 31
                  Top = 42
                  Width = 98
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAFINAL'
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
                  TabOrder = 1
                  UnboundDataType = wwDTEdtDate
                end
                object fcsbtnEstadoPA: TfcShapeBtn
                  Left = 161
                  Top = 9
                  Width = 119
                  Height = 26
                  Caption = 'SUSPENSO'
                  Color = clRed
                  DitherColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentClipping = True
                  ParentFont = False
                  RoundRectBias = 25
                  ShadeStyle = fbsHighlight
                  Shape = bsRoundRect
                  TabOrder = 2
                  TextOptions.Alignment = taCenter
                  TextOptions.VAlignment = vaVCenter
                  OnClick = fcsbtnEstadoPAClick
                end
                object dbUltmesProcPalim: TDBEdit
                  Left = 212
                  Top = 40
                  Width = 89
                  Height = 21
                  DataField = 'ULTMESPREPARO'
                  DataSource = dsDet
                  ReadOnly = True
                  TabOrder = 3
                end
              end
              object Panel1: TPanel
                Left = 517
                Top = 0
                Width = 185
                Height = 69
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 2
                object grpMesReferenciaPA: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 185
                  Height = 36
                  Align = alTop
                  Caption = ' Mês/Ano de Referência '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object cmb_mesrefPA: TComboBox
                    Left = 12
                    Top = 12
                    Width = 90
                    Height = 19
                    Style = csOwnerDrawFixed
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ItemHeight = 13
                    ParentFont = False
                    TabOrder = 0
                    Items.Strings = (
                      'Janeiro'
                      'Fevereiro'
                      'Março'
                      'Abril'
                      'Maio'
                      'Junho'
                      'Julho'
                      'Agosto'
                      'Setembro'
                      'Outubro'
                      'Novembro'
                      'Dezembro'
                      'Abono Anual')
                  end
                  object spn_anorefPA: TSpinEdit
                    Left = 103
                    Top = 12
                    Width = 63
                    Height = 22
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxValue = 0
                    MinValue = 0
                    ParentFont = False
                    TabOrder = 1
                    Value = 0
                  end
                end
                object gboxSeqPA: TGroupBox
                  Left = 0
                  Top = 36
                  Width = 185
                  Height = 33
                  Align = alBottom
                  Caption = 'Sequencial'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object dbeSequencialPA: TDBEdit
                    Left = 78
                    Top = 9
                    Width = 78
                    Height = 21
                    DataField = 'SEQRUBRICAINDIV'
                    DataSource = dsDet
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
              object grpMesReembolcoPA: TGroupBox
                Left = 107
                Top = 0
                Width = 194
                Height = 69
                Align = alLeft
                Caption = 'Ano e Mês de Comp/Reembolso INSS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                Visible = False
                object edtAnoMesReembPA: TMaskEdit
                  Left = 64
                  Top = 27
                  Width = 67
                  Height = 21
                  EditMask = '!9999/99;1;_'
                  MaxLength = 7
                  TabOrder = 0
                  Text = '    /  '
                end
              end
            end
            object Panel2: TPanel
              Left = 1
              Top = 70
              Width = 1010
              Height = 287
              Align = alClient
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object grpRegraPA: TGroupBox
                Left = 0
                Top = 0
                Width = 255
                Height = 287
                Align = alLeft
                Caption = ' Informações para Cálculo '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object lblValorPA: TLabel
                  Left = 5
                  Top = 16
                  Width = 89
                  Height = 13
                  Caption = 'Valor / Percentual '
                end
                object lblRegraPA: TLabel
                  Left = 5
                  Top = 55
                  Width = 91
                  Height = 13
                  Caption = 'Regra para Cálculo'
                end
                object lblNumProcInss: TLabel
                  Left = 7
                  Top = 213
                  Width = 81
                  Height = 13
                  Caption = 'Num. Proc. INSS'
                  Enabled = False
                end
                object dbreValor: TDBRealEdit
                  Left = 5
                  Top = 32
                  Width = 100
                  Height = 20
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00000000')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VALORRUBRICA'
                  DataSource = dsDet
                end
                object dblcRegraPA: TwwDBLookupCombo
                  Left = 5
                  Top = 71
                  Width = 245
                  Height = 21
                  DropDownAlignment = taRightJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'100'#9'Regra'#9'F'
                    'IDREGRA'#9'10'#9'Código'#9'F'
                    'DESCREGRA'#9'50'#9'Tipo'#9'F')
                  DataField = 'IDREGRACALCULO'
                  DataSource = dsDet
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loColLines, loRowLines, loTitles]
                  DropDownWidth = 320
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnCloseUp = dblcRegraPACloseUp
                end
                object fcsbtnRubXPA: TfcShapeBtn
                  Left = 123
                  Top = 16
                  Width = 121
                  Height = 44
                  Caption = 'Associa rubricas '#13#10'de exceção'
                  Color = clAqua
                  DitherColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  NumGlyphs = 0
                  ParentClipping = True
                  ParentFont = False
                  RoundRectBias = 25
                  ShadeStyle = fbsHighlight
                  Shape = bsRoundRect
                  TabOrder = 8
                  TextOptions.Alignment = taCenter
                  TextOptions.VAlignment = vaVCenter
                  OnClick = fcsbtnRubXPAClick
                end
                object dbchkBasePA: TDBCheckBox
                  Left = 6
                  Top = 97
                  Width = 244
                  Height = 17
                  Caption = 'Forma base de cálculo de outras PA'#39's'
                  DataField = 'FLGBASEPA'
                  DataSource = dsDet
                  TabOrder = 2
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkBasePAClick
                end
                object dbchkAbonoPA: TDBCheckBox
                  Left = 6
                  Top = 115
                  Width = 193
                  Height = 17
                  Caption = 'Utilizada no Abono Anual'
                  DataField = 'FLGUSAABONO'
                  DataSource = dsDet
                  TabOrder = 3
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkAbonoPAClick
                end
                object dbchkAntecipAbonoPA: TDBCheckBox
                  Left = 6
                  Top = 133
                  Width = 231
                  Height = 17
                  Caption = 'Utilizada na Antecipação de Abono FUNCEF'
                  DataField = 'FLGANTECIPABONO'
                  DataSource = dsDet
                  TabOrder = 4
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbcboxAbonoOutrosClick
                end
                object dbcboxCPMF: TDBCheckBox
                  Left = 6
                  Top = 169
                  Width = 244
                  Height = 17
                  Caption = 'Calcular CPMF quando possui IR Total'
                  DataField = 'FLGCALCULACPMF'
                  DataSource = dsDet
                  TabOrder = 5
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkBasePAClick
                end
                object dbedtNumProcInss: TDBEdit
                  Left = 109
                  Top = 209
                  Width = 142
                  Height = 21
                  DataField = 'NUMPROCINSS'
                  DataSource = dsDet
                  Enabled = False
                  TabOrder = 7
                end
                object dbcboxRetroagePA: TDBCheckBox
                  Left = 6
                  Top = 189
                  Width = 244
                  Height = 17
                  Hint = 
                    'Marque para considerar os valores retroativos referentes a meses' +
                    ' anteriores à data início da PA.'
                  Caption = 'Considera valores antes da data início da PA.'
                  DataField = 'FLGRETROACAO'
                  DataSource = dsDet
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkBasePAClick
                end
                object cbAntecipaAbonoINSS: TDBCheckBox
                  Left = 6
                  Top = 151
                  Width = 244
                  Height = 17
                  Caption = 'Utilizada na Antecipação de Abono INSS'
                  DataField = 'FLGANTECIPAABONOINSS'
                  DataSource = dsDet
                  TabOrder = 9
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkBasePAClick
                end
              end
              object pgctrlPA: TPageControl
                Left = 255
                Top = 0
                Width = 755
                Height = 287
                ActivePage = tbsDadosBasicosPA
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object tbsDadosBasicosPA: TTabSheet
                  Caption = 'Dados Básicos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  object grpRubricaPA: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 747
                    Height = 55
                    Align = alTop
                    TabOrder = 0
                    object lblRubDescPA: TLabel
                      Left = 12
                      Top = 9
                      Width = 210
                      Height = 13
                      Caption = 'Rubrica de Desconto da Pensão Alimentícia'
                    end
                    object sbtnRubDescPA: TSpeedButton
                      Tag = 1
                      Left = 678
                      Top = 25
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubDescPA: TSpeedButton
                      Tag = 1
                      Left = 703
                      Top = 25
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object dblcRubricaPA: TwwDBLookupCombo
                      Left = 12
                      Top = 26
                      Width = 665
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'IDRUBRICA'
                      DataSource = dsDet
                      LookupTable = qryDesconto
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      OnCloseUp = dblcRubricaPACloseUp
                      OnExit = dblcRubricaPAExit
                    end
                  end
                  object grpFavorecidoPA: TGroupBox
                    Left = 0
                    Top = 55
                    Width = 747
                    Height = 204
                    Align = alClient
                    Caption = ' Informações do Favorecido '
                    TabOrder = 1
                    object lblCPFPA: TLabel
                      Left = 12
                      Top = 14
                      Width = 58
                      Height = 13
                      Caption = 'CPF / CNPJ'
                    end
                    object lblNomeFavPA: TLabel
                      Left = 118
                      Top = 14
                      Width = 99
                      Height = 13
                      Caption = 'Nome do Favorecido'
                    end
                    object sbtnAddFav: TSpeedButton
                      Left = 678
                      Top = 28
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnAddFavClick
                    end
                    object sbtnRemFav: TSpeedButton
                      Left = 703
                      Top = 28
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = sbtnRemFavClick
                    end
                    object lblRubProvPA: TLabel
                      Left = 12
                      Top = 53
                      Width = 207
                      Height = 13
                      Caption = 'Rubrica de Provento da Pensão Alimentícia'
                    end
                    object sbtnRubCredPA: TSpeedButton
                      Tag = 2
                      Left = 678
                      Top = 67
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubCredPA: TSpeedButton
                      Tag = 2
                      Left = 703
                      Top = 67
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object lblportformaPA: TLabel
                      Left = 12
                      Top = 92
                      Width = 197
                      Height = 26
                      AutoSize = False
                      Caption = 'Contas/Caixas x Forma de Pagto (em branco se arquivo eletrônico)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object edCPFFavPA: TEdit
                      Left = 12
                      Top = 29
                      Width = 103
                      Height = 21
                      TabOrder = 0
                    end
                    object edNomeFavPA: TEdit
                      Left = 117
                      Top = 29
                      Width = 556
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object dblcRubricaFavPA: TwwDBLookupCombo
                      Left = 12
                      Top = 68
                      Width = 665
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'RUBRICAPROVENTOPA'
                      DataSource = dsDet
                      LookupTable = qryProvento
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object btnAlimentados: TButton
                      Left = 8
                      Top = 306
                      Width = 1221
                      Height = 20
                      Anchors = [akLeft, akRight, akBottom]
                      Caption = 'Alimentados vinculados'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -13
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnClick = btnAlimentadosClick
                    end
                    object dblkupPortFormaPA: TwwDBLookupCombo
                      Left = 211
                      Top = 94
                      Width = 517
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'50'#9'Descrição'#9'F'
                        'CODPORTFORMA'#9'10'#9'Código'#9'F')
                      DataField = 'CODPORTFORMA'
                      DataSource = dsDet
                      LookupTable = qryPortadorforma
                      LookupField = 'CODPORTFORMA'
                      Options = [loColLines, loRowLines, loTitles]
                      ParentFont = False
                      TabOrder = 3
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                    end
                  end
                end
                object tbsRubricaAbonoPA: TTabSheet
                  Caption = 'Rubricas para Abono'
                  ImageIndex = 1
                  object grpRubricaProventoAbonoPA: TGroupBox
                    Left = 0
                    Top = 55
                    Width = 747
                    Height = 57
                    Align = alTop
                    TabOrder = 1
                    object Label2: TLabel
                      Left = 8
                      Top = 12
                      Width = 256
                      Height = 13
                      Caption = 'Rubrica de Provento de Abono de Pensão Alimentícia'
                    end
                    object sbtnRubCredAbonoPA: TSpeedButton
                      Tag = 6
                      Left = 678
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubCredAbonoPA: TSpeedButton
                      Tag = 6
                      Left = 703
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object dblcRubricaAbonoFavPA: TwwDBLookupCombo
                      Left = 7
                      Top = 28
                      Width = 669
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'IDRUBRICAPROVENTO13'
                      DataSource = dsDet
                      LookupTable = qryProvento
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object grpRubricaAbonoPA: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 747
                    Height = 55
                    Align = alTop
                    TabOrder = 0
                    object Label1: TLabel
                      Left = 7
                      Top = 10
                      Width = 244
                      Height = 13
                      Caption = 'Rubrica de Desconto Abono da Pensão Alimentícia'
                    end
                    object sbtnRubDescAbonoPA: TSpeedButton
                      Tag = 5
                      Left = 678
                      Top = 25
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubDescAbonoPA: TSpeedButton
                      Tag = 5
                      Left = 703
                      Top = 25
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object dblcRubricaAbonoPA: TwwDBLookupCombo
                      Left = 7
                      Top = 26
                      Width = 670
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'IDRUBRICA13'
                      DataSource = dsDet
                      LookupTable = qryDesconto
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                end
              end
            end
          end
        end
        object tbsOutrasRubricas: TTabSheet
          Caption = 'Outras Rubricas'
          ImageIndex = 1
          object dbgrdOutrasRubricas: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1012
            Height = 358
            Selected.Strings = (
              'IDMOSTRARUBOUTROS'#9'10'#9'Cód. Rubrica'
              'FLGPERMANENTE'#9'10'#9'Permanente'
              'PARCELAS'#9'10'#9'Total de ~Parcelas'
              'NUMOCORRENCIAS'#9'10'#9'Parcelas ~Processadas'
              'VALORRUBRICA'#9'10'#9'Valor'
              'MESCOMPREEM'#9'7'#9'Mês de~Reembolso'
              'ANOMESREF'#9'7'#9'Mês de ~Referência'
              'SEQRUBRICAINDIV'#9'8'#9'Sequencial'
              'DESCRICAO'#9'60'#9'Descrição ~da rubrica'
              'DATAINICIO'#9'10'#9'Data de ~Início'
              'DATAFINAL'#9'10'#9'Data ~Final'
              'FLGUSAABONO'#9'10'#9'Incide sobre ~Abono Anual'
              'FLGANTECIPABONO'#9'10'#9'Incide s/ ~Antecip. Abono'
              'FAVORECIDO'#9'40'#9'Favorecido'
              'FLGDESATIVADO'#9'10'#9'Desativada'
              'FLGUSADO'#9'10'#9'Já~Processada'
              'IDREGRACALCULO'#9'10'#9'Código da ~Regra'
              'NOMEREGRA'#9'60'#9'Descrição da Regra'
              'NOME'#9'60'#9'Incluído por...'
              'TRGDTINCLUSAO'#9'18'#9'Data e Hora da Inclusão')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsOutros
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlDetOutras: TPanel
            Left = 0
            Top = 0
            Width = 1012
            Height = 358
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object pnlOp1Outras: TPanel
              Left = 1
              Top = 1
              Width = 1010
              Height = 69
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object dbrgrpPermanenteOutros: TDBRadioGroup
                Left = 0
                Top = 0
                Width = 107
                Height = 69
                Align = alLeft
                Caption = ' Permanente '
                DataField = 'FLGPERMANENTE'
                DataSource = dsOutros
                Items.Strings = (
                  '  Sim'
                  '  Não')
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgrpPermanenteOutrosChange
                OnClick = dbrgrpPermanenteOutrosClick
              end
              object grpPeriodoOutros: TGroupBox
                Left = 702
                Top = 0
                Width = 308
                Height = 69
                Align = alRight
                Caption = ' Processamento '
                TabOrder = 3
                object lblDeOutros: TLabel
                  Left = 9
                  Top = 21
                  Width = 14
                  Height = 13
                  Caption = 'De'
                end
                object lblAteOutros: TLabel
                  Left = 6
                  Top = 46
                  Width = 16
                  Height = 13
                  Caption = 'Até'
                end
                object lblUltMesOutros: TLabel
                  Left = 150
                  Top = 36
                  Width = 56
                  Height = 26
                  Alignment = taRightJustify
                  Caption = 'Último mês Processado'
                  WordWrap = True
                end
                object dbdtIniciooutros: TCMDateTimePicker
                  Left = 31
                  Top = 17
                  Width = 95
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINICIO'
                  DataSource = dsOutros
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
                  OnExit = dbdtIniciooutrosExit
                end
                object dbdtFinalOutros: TCMDateTimePicker
                  Left = 31
                  Top = 42
                  Width = 95
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAFINAL'
                  DataSource = dsOutros
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
                end
                object fcsbtnEstadoOutros: TfcShapeBtn
                  Left = 161
                  Top = 9
                  Width = 119
                  Height = 29
                  Caption = 'SUSPENSO'
                  Color = clRed
                  DitherColor = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  NumGlyphs = 0
                  ParentClipping = True
                  ParentFont = False
                  RoundRectBias = 25
                  ShadeStyle = fbsHighlight
                  Shape = bsRoundRect
                  TabOrder = 2
                  TextOptions.Alignment = taCenter
                  TextOptions.VAlignment = vaVCenter
                  OnClick = fcsbtnEstadoOutrosClick
                end
                object dbUltMesprocOutras: TDBEdit
                  Left = 212
                  Top = 40
                  Width = 89
                  Height = 21
                  DataField = 'ULTMESPREPARO'
                  DataSource = dsOutros
                  ReadOnly = True
                  TabOrder = 3
                end
              end
              object Panel3: TPanel
                Left = 517
                Top = 0
                Width = 185
                Height = 69
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 2
                object gboxSeqOutros: TGroupBox
                  Left = 0
                  Top = 36
                  Width = 185
                  Height = 33
                  Align = alBottom
                  Caption = 'Sequencial'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object dbeSequencialOutros: TDBEdit
                    Left = 78
                    Top = 9
                    Width = 78
                    Height = 21
                    DataField = 'SEQRUBRICAINDIV'
                    DataSource = dsOutros
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object grpMesReferenciaOutros: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 185
                  Height = 36
                  Align = alTop
                  Caption = ' Mês/Ano de Referência '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object cmb_mesrefoutros: TComboBox
                    Left = 11
                    Top = 12
                    Width = 91
                    Height = 19
                    Style = csOwnerDrawFixed
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ItemHeight = 13
                    ParentFont = False
                    TabOrder = 0
                    Items.Strings = (
                      'Janeiro'
                      'Fevereiro'
                      'Março'
                      'Abril'
                      'Maio'
                      'Junho'
                      'Julho'
                      'Agosto'
                      'Setembro'
                      'Outubro'
                      'Novembro'
                      'Dezembro'
                      'Abono Anual')
                  end
                  object spn_anorefoutros: TSpinEdit
                    Left = 102
                    Top = 12
                    Width = 63
                    Height = 22
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxValue = 0
                    MinValue = 0
                    ParentFont = False
                    TabOrder = 1
                    Value = 0
                  end
                end
              end
              object grpParcelasOutros: TGroupBox
                Left = 366
                Top = 0
                Width = 151
                Height = 69
                Align = alRight
                TabOrder = 1
                object lblParcelasOutros: TLabel
                  Left = 29
                  Top = 19
                  Width = 41
                  Height = 13
                  Caption = 'Parcelas'
                end
                object lblProcOutros: TLabel
                  Left = 9
                  Top = 43
                  Width = 61
                  Height = 13
                  Caption = 'Processadas'
                end
                object spedparcelasoutros: TwwDBSpinEdit
                  Left = 82
                  Top = 15
                  Width = 62
                  Height = 21
                  Increment = 1
                  DataField = 'PARCELAS'
                  DataSource = dsOutros
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  OnExit = spedparcelasoutrosExit
                end
                object spedNumOcorrenciasOutros: TwwDBSpinEdit
                  Left = 82
                  Top = 39
                  Width = 62
                  Height = 21
                  Increment = 1
                  DataField = 'NUMOCORRENCIAS'
                  DataSource = dsOutros
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
              end
              object GroupBox5: TGroupBox
                Left = 107
                Top = 0
                Width = 194
                Height = 69
                Align = alLeft
                Caption = 'Ano e Mês de Comp/Reembolso INSS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                Visible = False
                object edtAnoMesReembOutros: TMaskEdit
                  Left = 64
                  Top = 27
                  Width = 67
                  Height = 21
                  EditMask = '!9999/99;1;_'
                  MaxLength = 7
                  TabOrder = 0
                  Text = '    /  '
                end
              end
            end
            object Panel4: TPanel
              Left = 1
              Top = 70
              Width = 1010
              Height = 287
              Align = alClient
              TabOrder = 1
              object pgctrlOutros: TPageControl
                Left = 257
                Top = 1
                Width = 752
                Height = 285
                ActivePage = tbsDadosBasicosOutros
                Align = alClient
                TabOrder = 1
                object tbsDadosBasicosOutros: TTabSheet
                  Caption = 'Dados Básicos'
                  object grpRubricaOutros: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 744
                    Height = 58
                    Align = alTop
                    TabOrder = 0
                    object lblRubOutros: TLabel
                      Left = 10
                      Top = 12
                      Width = 95
                      Height = 13
                      Caption = 'Rubrica a processar'
                    end
                    object sbtnRubOutros: TSpeedButton
                      Tag = 3
                      Left = 678
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubOutros: TSpeedButton
                      Tag = 3
                      Left = 702
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object dblcRubricaOutros: TwwDBLookupCombo
                      Left = 12
                      Top = 27
                      Width = 667
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'IDRUBRICA'
                      DataSource = dsOutros
                      LookupTable = qryRubricaOutros
                      LookupField = 'IDPROVENTO'
                      Options = [loColLines, loRowLines, loTitles]
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      OnCloseUp = dblcRubricaOutrosCloseUp
                      OnExit = dblcRubricaOutrosExit
                    end
                  end
                  object grpFavorecidoOutros: TGroupBox
                    Left = 0
                    Top = 58
                    Width = 744
                    Height = 199
                    Align = alClient
                    Caption = ' Favorecido '
                    TabOrder = 1
                    object lblCPFOutros: TLabel
                      Left = 12
                      Top = 14
                      Width = 58
                      Height = 13
                      Caption = 'CPF / CNPJ'
                    end
                    object lblNomeFavOutros: TLabel
                      Left = 117
                      Top = 14
                      Width = 99
                      Height = 13
                      Caption = 'Nome do Favorecido'
                    end
                    object sbtnAddFavOutros: TSpeedButton
                      Left = 679
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnAddFavOutrosClick
                    end
                    object sbtnRemFavOutros: TSpeedButton
                      Left = 702
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = sbtnRemFavOutrosClick
                    end
                    object lblRubFavOutros: TLabel
                      Left = 12
                      Top = 54
                      Width = 180
                      Height = 13
                      Caption = 'Rubrica de Pagamento do Favorecido'
                    end
                    object sbtnRubFavOutros: TSpeedButton
                      Tag = 4
                      Left = 678
                      Top = 68
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubFavOutros: TSpeedButton
                      Tag = 4
                      Left = 703
                      Top = 68
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object lblPortFormaOutros: TLabel
                      Left = 12
                      Top = 100
                      Width = 191
                      Height = 26
                      AutoSize = False
                      Caption = 'Contas/Caixas x Forma de Pagto (em branco se arquivo eletrônico)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object lblSituacaoaJ: TLabel
                      Left = 13
                      Top = 143
                      Width = 123
                      Height = 13
                      Caption = 'Situação da Ação Judicial'
                    end
                    object lblobservacao: TLabel
                      Left = 173
                      Top = 143
                      Width = 58
                      Height = 13
                      Caption = 'Observação'
                    end
                    object edCPFFavOutros: TEdit
                      Left = 12
                      Top = 28
                      Width = 103
                      Height = 21
                      TabOrder = 0
                    end
                    object edNomeFavOutros: TEdit
                      Left = 117
                      Top = 28
                      Width = 558
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object dblcRubricaFavOutros: TwwDBLookupCombo
                      Left = 12
                      Top = 69
                      Width = 667
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'RUBRICAPROVENTOPA'
                      DataSource = dsOutros
                      LookupTable = qryRubFavOutros
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object dblcPortFormaOutros: TwwDBLookupCombo
                      Left = 195
                      Top = 102
                      Width = 535
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'50'#9'Descrição'#9'F'
                        'CODPORTFORMA'#9'10'#9'Código'#9'F')
                      DataField = 'CODPORTFORMA'
                      DataSource = dsOutros
                      LookupTable = qryPortadorforma
                      LookupField = 'CODPORTFORMA'
                      Options = [loColLines, loRowLines, loTitles]
                      ParentFont = False
                      TabOrder = 3
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                    end
                    object cboSituacaoAJ: TComboBox
                      Left = 13
                      Top = 160
                      Width = 144
                      Height = 19
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 4
                      Items.Strings = (
                        ''
                        'Em Liminar'
                        'Ganha'
                        'Perdida')
                    end
                    object mmobservacao: TMemo
                      Left = 172
                      Top = 160
                      Width = 793
                      Height = 63
                      ScrollBars = ssVertical
                      TabOrder = 5
                    end
                  end
                end
                object tbsRubricaAbonoOutros: TTabSheet
                  Caption = 'Rubricas para Abono'
                  ImageIndex = 1
                  object grpRubricaOutrosAbono: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 744
                    Height = 55
                    Align = alTop
                    TabOrder = 0
                    object Label5: TLabel
                      Left = 10
                      Top = 10
                      Width = 141
                      Height = 13
                      Caption = 'Rubrica a processa no Abono'
                    end
                    object sbtnRubAbonoOutros: TSpeedButton
                      Tag = 7
                      Left = 679
                      Top = 25
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubAbonoOutros: TSpeedButton
                      Tag = 7
                      Left = 702
                      Top = 25
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object dblcRubricaAbonoOutros: TwwDBLookupCombo
                      Left = 10
                      Top = 26
                      Width = 667
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'IDRUBRICA13'
                      DataSource = dsOutros
                      LookupTable = qryRubricaOutros
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object grpRubricaPagOutrosAbono: TGroupBox
                    Left = 0
                    Top = 55
                    Width = 744
                    Height = 57
                    Align = alTop
                    TabOrder = 1
                    object Label6: TLabel
                      Left = 10
                      Top = 12
                      Width = 229
                      Height = 13
                      Caption = 'Rubrica de Pagamento de Abono ao Favorecido'
                    end
                    object sbtnRubAbonoFavOutros: TSpeedButton
                      Tag = 8
                      Left = 679
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333333333333333333333333333333333333333333333333FF333333333333
                        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                        000033333373FF77777733333330003333333333333777333333333333333333
                        3333333333333333333333333333333333333333333333333333333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                      OnClick = sbtnRubClick
                    end
                    object sbtnRemRubAbonoFavOutros: TSpeedButton
                      Tag = 8
                      Left = 703
                      Top = 27
                      Width = 23
                      Height = 22
                      Anchors = [akTop, akRight]
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        04000000000000010000120B0000120B00001000000000000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                        05555777775555557F5555000555555505555577755555557555}
                      NumGlyphs = 2
                      OnClick = EliminaRubricaClick
                    end
                    object dblcRubricaFavAbonoOutros: TwwDBLookupCombo
                      Left = 10
                      Top = 28
                      Width = 668
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F')
                      DataField = 'IDRUBRICAPROVENTO13'
                      DataSource = dsOutros
                      LookupTable = qryRubFavOutros
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                end
              end
              object Panel5: TPanel
                Left = 1
                Top = 1
                Width = 256
                Height = 285
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object grpRegraOutros: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 256
                  Height = 156
                  Align = alTop
                  Caption = ' Informações para Cálculo '
                  TabOrder = 0
                  object lblValorOutros: TLabel
                    Left = 5
                    Top = 13
                    Width = 89
                    Height = 13
                    Caption = 'Valor / Percentual '
                  end
                  object lblRegraOutros: TLabel
                    Left = 5
                    Top = 53
                    Width = 91
                    Height = 13
                    Caption = 'Regra para Cálculo'
                  end
                  object dbreValorOutros: TDBRealEdit
                    Left = 5
                    Top = 29
                    Width = 100
                    Height = 20
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00000000')
                    TabOrder = 0
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 8
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VALORRUBRICA'
                    DataSource = dsOutros
                  end
                  object dblcRegraOutros: TwwDBLookupCombo
                    Left = 5
                    Top = 69
                    Width = 245
                    Height = 21
                    DropDownAlignment = taRightJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'100'#9'Regra'#9'F'
                      'IDREGRA'#9'10'#9'Código'#9'F'
                      'DESCREGRA'#9'50'#9'Tipo'#9'F')
                    DataField = 'IDREGRACALCULO'
                    DataSource = dsOutros
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loColLines, loRowLines, loTitles]
                    DropDownWidth = 320
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    OnCloseUp = dblcRegraOutrosCloseUp
                  end
                  object dbcboxAbonoOutros: TDBCheckBox
                    Left = 4
                    Top = 93
                    Width = 149
                    Height = 17
                    Caption = 'Utilizada no Abono Anual'
                    DataField = 'FLGUSAABONO'
                    DataSource = dsOutros
                    TabOrder = 2
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbcboxAbonoOutrosClick
                  end
                  object dbcboxAntecipAbonoOutros: TDBCheckBox
                    Left = 4
                    Top = 111
                    Width = 242
                    Height = 17
                    Caption = 'Utilizada na Antecipação de Abono FUNCEF'
                    DataField = 'FLGANTECIPABONO'
                    DataSource = dsOutros
                    TabOrder = 3
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbcboxAbonoOutrosClick
                  end
                  object DBCheckBox1: TDBCheckBox
                    Left = 4
                    Top = 128
                    Width = 242
                    Height = 17
                    Caption = 'Utilizada na Antecipação de Abono INSS'
                    DataField = 'FLGANTECIPAABONOINSS'
                    DataSource = dsOutros
                    TabOrder = 4
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbcboxAbonoOutrosClick
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 0
                  Top = 156
                  Width = 256
                  Height = 129
                  Align = alClient
                  TabOrder = 1
                  object Label3: TLabel
                    Left = 54
                    Top = 27
                    Width = 57
                    Height = 13
                    Caption = 'Saldo Inicial'
                  end
                  object Label4: TLabel
                    Left = 29
                    Top = 51
                    Width = 82
                    Height = 13
                    Caption = 'Saldo acumulado'
                  end
                  object dbcboxControlaSaldo: TDBCheckBox
                    Left = 7
                    Top = 9
                    Width = 93
                    Height = 17
                    Caption = 'Controla Saldo'
                    DataField = 'FLGCONTROLASALDO'
                    DataSource = dsOutros
                    TabOrder = 0
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbcboxControlaSaldoClick
                  end
                  object dbredSaldoInicial: TDBRealEdit
                    Left = 122
                    Top = 23
                    Width = 100
                    Height = 20
                    Alignment = taRightJustify
                    Enabled = False
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 1
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VLRSALDOINICIAL'
                    DataSource = dsOutros
                  end
                  object dbredSaldoAcumulado: TDBRealEdit
                    Left = 122
                    Top = 47
                    Width = 100
                    Height = 20
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
                    DataField = 'VLRTOTALPROC'
                    DataSource = dsOutros
                  end
                  object chkOutrasRubResgate: TDBCheckBox
                    Left = 4
                    Top = 74
                    Width = 242
                    Height = 17
                    Caption = 'Rubrica de Resgate'
                    DataField = 'FLGRUBRICARESGATE'
                    DataSource = dsOutros
                    TabOrder = 3
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbcboxAbonoOutrosClick
                  end
                  object chkOutrasRubResgateParc: TDBCheckBox
                    Left = 4
                    Top = 90
                    Width = 242
                    Height = 17
                    Caption = 'Resgate Parcelado'
                    DataField = 'FLGRESGATEPARCELADO'
                    DataSource = dsOutros
                    TabOrder = 4
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbcboxAbonoOutrosClick
                  end
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1033
      end
      inherited Dock974: TDock97
        Left = 1024
        Width = 13
        Height = 386
        Visible = False
        inherited tb97Detalhe: TToolbar97
          Top = 16
          DockPos = 16
          inherited bbtnOkDet: TBitBtn
            Left = 3
            Width = 1
          end
          inherited bbtnCancelarDet: TBitBtn
            Left = 3
            Width = 1
          end
          inherited bbtnVoltarDet: TBitBtn
            Left = 3
            Width = 1
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1041
      Height = 44
      TabOrder = 1
      object lblPessoa: TLabel
        Left = 9
        Top = -2
        Width = 60
        Height = 18
        Caption = 'Pessoa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lblCategoria: TLabel
        Left = 583
        Top = -2
        Width = 76
        Height = 18
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 453
        Top = -2
        Width = 73
        Height = 18
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object edTipo: TEdit
        Left = 583
        Top = 15
        Width = 157
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbeMatricula: TDBEdit
        Left = 453
        Top = 15
        Width = 121
        Height = 21
        Color = clSilver
        DataField = 'MATR_GERAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dblkpcmbBenef: TwwDBLookupCombo
        Left = 3
        Top = 15
        Width = 441
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Nome'#9'F'
          'MATRICULA'#9'15'#9'Matrícula'#9'F'
          'IDPESSOA'#9'10'#9'Identificador'#9'F')
        LookupTable = qryBenef
        LookupField = 'NOME'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        Enabled = False
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkpcmbBenefChange
        OnCloseUp = dblkpcmbBenefCloseUp
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1043
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 120
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 60
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 538
    Width = 1043
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 569
    Top = 443
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    OnStateChange = dsDetStateChange
    Left = 352
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 240
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 296
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona o Participante'
    UsaDistinct = True
    Left = 657
    Top = 467
  end
  inherited ImlPadrao: TImageList
    Left = 533
    Top = 459
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 156
    Top = 75
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      
        '  DECODE(VREC.IDRECEBEDOR, VREC.IDTITULAR, EL.MATRICULA, D.MATRI' +
        'CULA) AS MATR_GERAL,'
      '  D.MATRICULA AS MATR_DEP,'
      '  EL.MATRICULA,'
      '  PP.INSCRICAONUMERO,'
      '  PN.NUMDOCUMENTO,'
      '  PN.NOME AS RECEBEDOR,'
      '  PL.NOME AS PLANO,'
      '  PT.NOME AS PATROCINADORA,'
      '  VREC.IDTITULAR,'
      '  VREC.IDRECEBEDOR,'
      '  PP.IDPESSJUR,'
      '  PP.IDPLANOPREV,'
      '  PF.DATANASC,'
      '  PF.NUMDEPIRRF,'
      '  PF.FLGISENTOIRRF,'
      '  PD.IDPESSOA'
      'FROM'
      '  VW_RECEBEDOR VREC,'
      '  ELEGPATRO EL,'
      '  PARTPREVPLAN PP,'
      '  PESSOAFISICA PF,'
      '  PESSOA PN,'
      '  PESSOA PT,'
      '  PLANPREV PL,'
      '  DEPENTIT D,'
      '  PESSOA PD,'
      '  PATRO PAT'
      'WHERE'
      '  ( PP.IDPESSJUR     = EL.IDPESSJUR   ) AND'
      '  ( PP.IDPESSOA      = EL.IDPESSOA    ) AND'
      '  (PP.FLGDESATIVADO  = 0'
      '   OR'
      
        '  (PP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevpl' +
        'an ppp1'
      
        '                                        WHERE ppp1.idpessoa = pp' +
        '.idpessoa'
      
        '                                          AND ppp1.flgdesativado' +
        ' = 0)'
      
        '                                          AND (pp.idsitplanoprev' +
        ' = 25'
      
        '                                           OR (pp.idplanoprev = ' +
        '(select max(ppp1.idplanoprev) '
      
        '                                                                ' +
        ' from partprevplan ppp1'
      
        '                                                                ' +
        ' where ppp1.idpessoa = pp.idpessoa'
      
        '                                                                ' +
        ' and ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'
      
        '                                                                ' +
        '                             FROM partprevplan ppp2'
      
        '                                                                ' +
        '                             WHERE ppp2.idpessoa = ppp1.idpessoa' +
        ')'
      
        '                                                                ' +
        '                             and   not exists (select 1 from par' +
        'tprevplan ppp2'
      
        '                                                                ' +
        '                             where ppp2.idpessoa = ppp1.idpessoa'
      
        '                                                                ' +
        '                             and   ppp2.idsitplanoprev = 25)))))' +
        ') AND'
      ''
      '  ( VREC.IDRECEBEDOR = PN.IDPESSOA    ) AND'
      '  ( PP.IDPLANOPREV   = PL.IDPLANOPREV ) AND'
      '  ( PP.IDPESSJUR     = PT.IDPESSOA    ) AND'
      '  ( PF.IDPESSOA      = PN.IDPESSOA    ) AND'
      '  ( VREC.IDTITULAR   = PP.IDPESSOA    ) AND'
      '  ( VREC.IDTITULAR   = :PIDTITULAR    ) AND'
      '  ( VREC.IDRECEBEDOR = :PIDPESSOA     ) AND'
      '  ( D.IDTITULAR      = VREC.IDTITULAR ) AND'
      '  ( D.IDPESSOA       = PD.IDPESSOA    ) AND'
      '  ( PAT.IDPESSOA     = EL.IDPESSJUR   ) AND'
      '  ( PAT.IDFUNDACAO   = :PIDFUNDACAO   )')
    Left = 268
    Top = 3
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Top = 3
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       PD.DESCPARCIAL,'
      '       PD.FLGDESCONTO,'
      '       PD.FLGINSS,'
      '       PD.FLGIRRF,'
      '       PD.CODFONTEPAGADORA,'
      '       R.FLGUSAABONO,'
      '       R.FLGANTECIPABONO,'
      '       R.IDTITULAR,'
      '       R.DATAINICIO,'
      '       R.FLGBASEPA,'
      '       R.IDPESSOA,'
      '       R.IDEMPRESA,'
      '       R.NUMOCORRENCIAS,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.IDPROVENTO, PD.CODPROVD' +
        'ESC) AS IDMOSTRARUB,'
      '       PD.IDPROVENTO AS IDRUBRICA,'
      '       R.SEQRUBRICAINDIV,'
      '       R.IDFAVORECIDO,'
      '       R.IDREGRACALCULO,'
      '       R.VALORRUBRICA,'
      '       R.ANOMESINICIO,'
      '       R.FLGPERMANENTE,'
      '       R.PARCELAS,'
      '       R.FLGPERCENT,'
      '       R.FLGTPRUBMANUT,'
      '       R.FLGPENSAOALIM,'
      '       R.RUBRICAPROVENTOPA,'
      '       R.DATAFINAL,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD1.IDPROVENTO, PD1.CODPRO' +
        'VDESC) AS IDMOSTRARUB1,'
      '       R.ANOMESREF,'
      '       R.CODPORTFORMA,'
      '       P.NUMDOCUMENTO AS CPFFAVORECIDO,'
      '       P.NOME AS FAVORECIDO,'
      '       PD.DESCRICAO,'
      '       R.FLGDESATIVADO,'
      '       R.FLGUSADO,'
      '       R.ULTMESPREPARO,'
      '       PD1.DESCRICAO,'
      '       RG.NOMEREGRA,'
      '       R.FLGCALCULACPMF,'
      '       R.TRGDTINCLUSAO,'
      '       R.TRGUSERINCLUSAO,'
      '       PI.NOME,'
      '       R.NUMPROCINSS,'
      '       R.IDRUBRICA13,'
      '       R.IDRUBRICAPROVENTO13,'
      '       R.FLGRETROACAO, R.IDSEQINTERNOFB, R.FLGANTECIPAABONOINSS,'
      '       R.MESCOMPREEM'
      
        'FROM RUBRICAINDIV R, PROVDESC PD, PESSOA P, PROVDESC PD1, PARAMA' +
        'PREV PRM, REGRA RG, PESSOA PI'
      'WHERE R.IDTITULAR = :PIDTITULAR'
      'AND R.IDPESSOA = :PIDPESSOA'
      'AND R.IDEMPRESA = :PIDFUNDACAO'
      'AND R.FLGPENSAOALIM = 1'
      'AND R.FLGTPRUBMANUT = '#39'1'#39
      'AND PD.IDPROVENTO = R.IDRUBRICA'
      'AND R.IDFAVORECIDO = P.IDPESSOA(+)'
      'AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+)'
      'AND R.IDREGRACALCULO = RG.IDREGRA(+)'
      
        'AND SUBSTR(R.TRGUSERINCLUSAO, 3, LENGTH(TRIM(R.TRGUSERINCLUSAO))' +
        ') = PI.IDPESSOA'
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGBASEPA;CheckBox;1;0'
      'FLGUSAABONO;CheckBox;1;0'
      'FLGANTECIPABONO;CheckBox;1;0'
      'FLGPERMANENTE;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0'
      'FLGUSADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 636
    Top = 259
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  FLGUSAABONO = :FLGUSAABONO,'
      '  FLGANTECIPABONO = :FLGANTECIPABONO,'
      '  IDTITULAR = :IDTITULAR,'
      '  DATAINICIO = :DATAINICIO,'
      '  FLGBASEPA = :FLGBASEPA,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  NUMOCORRENCIAS = :NUMOCORRENCIAS,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  VALORRUBRICA = :VALORRUBRICA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  FLGPERMANENTE = :FLGPERMANENTE,'
      '  PARCELAS = :PARCELAS,'
      '  FLGPERCENT = :FLGPERCENT,'
      '  FLGTPRUBMANUT = :FLGTPRUBMANUT,'
      '  FLGPENSAOALIM = :FLGPENSAOALIM,'
      '  RUBRICAPROVENTOPA = :RUBRICAPROVENTOPA,'
      '  DATAFINAL = :DATAFINAL,'
      '  ANOMESREF = :ANOMESREF,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  FLGUSADO = :FLGUSADO,'
      '  FLGCALCULACPMF = :FLGCALCULACPMF,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  IDRUBRICA13 = :IDRUBRICA13,'
      '  IDRUBRICAPROVENTO13 = :IDRUBRICAPROVENTO13,'
      
        '  FLGRETROACAO = :FLGRETROACAO, IDSEQINTERNOFB = :IDSEQINTERNOFB' +
        ','
      '  FLGANTECIPAABONOINSS = :FLGANTECIPAABONOINSS,'
      '  MESCOMPREEM =:MESCOMPREEM  '
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV'
      ' ')
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      
        '  (FLGUSAABONO, FLGANTECIPABONO, IDTITULAR, DATAINICIO, FLGBASEP' +
        'A, '
      'IDPESSOA, '
      '   IDEMPRESA, NUMOCORRENCIAS, IDRUBRICA, SEQRUBRICAINDIV, '
      'IDFAVORECIDO, '
      '   IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, '
      'PARCELAS, '
      '   FLGPERCENT, FLGTPRUBMANUT, FLGPENSAOALIM, RUBRICAPROVENTOPA, '
      'DATAFINAL, '
      '   ANOMESREF, CODPORTFORMA, FLGDESATIVADO, FLGUSADO, '
      'FLGCALCULACPMF, NUMPROCINSS, IDRUBRICA13, IDRUBRICAPROVENTO13, '
      'FLGRETROACAO, IDSEQINTERNOFB, FLGANTECIPAABONOINSS, MESCOMPREEM)'
      'values'
      '  (:FLGUSAABONO, :FLGANTECIPABONO, :IDTITULAR, :DATAINICIO, '
      ':FLGBASEPA, '
      '   :IDPESSOA, :IDEMPRESA, :NUMOCORRENCIAS, :IDRUBRICA, '
      ':SEQRUBRICAINDIV, '
      
        '   :IDFAVORECIDO, :IDREGRACALCULO, :VALORRUBRICA, :ANOMESINICIO,' +
        ' '
      ':FLGPERMANENTE, '
      '   :PARCELAS, :FLGPERCENT, :FLGTPRUBMANUT, :FLGPENSAOALIM, '
      ':RUBRICAPROVENTOPA, '
      '   :DATAFINAL, :ANOMESREF, :CODPORTFORMA, :FLGDESATIVADO, '
      ':FLGUSADO, :FLGCALCULACPMF, '
      '   :NUMPROCINSS, :IDRUBRICA13, :IDRUBRICAPROVENTO13,'
      
        ':FLGRETROACAO, :IDSEQINTERNOFB, :FLGANTECIPAABONOINSS, :MESCOMPR' +
        'EEM)'
      ' ')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 408
    Top = 3
  end
  object qryDesconto: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGOBRIGAFAVOREC,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO,'
      '       CODFONTEPAGADORA'
      'FROM PROVDESC'
      'WHERE FLGDESCONTO = 1'
      'AND FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY IDPROVENTO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 107
  end
  object qryProvento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGOBRIGAFAVOREC,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      'FROM PROVDESC PD'
      'WHERE FLGDESCONTO = 0'
      'AND FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY IDPROVENTO'
      ' ')
    ValidateWithMask = True
    Left = 660
    Top = 3
  end
  object qryRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, R.IDTIPOREGRA'
      'FROM REGRA R, TIPOREGRA T'
      'WHERE R.IDTIPOREGRA = T.IDTIPOREGRA'
      'ORDER BY UPPER(R.NOMEREGRA)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 744
    Top = 3
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 604
    Top = 3
  end
  object MontaSelectFAV: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Favorecido'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CGC do Favorecido'
      'Nome do Favorecido')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA'
      '(PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI)'
      '(EMPRESAFORN.IDPESSOA = 1)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 629
    Top = 379
  end
  object dsOutros: TwwDataSource
    AutoEdit = False
    DataSet = qryOutros
    Left = 456
    Top = 91
  end
  object qryOutros: TwwQuery
    CachedUpdates = True
    AfterInsert = qryOutrosAfterInsert
    BeforePost = qryOutrosBeforePost
    AfterScroll = qryOutrosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       PD.DESCPARCIAL,'
      '       PD.FLGDESCONTO,'
      '       PD.FLGINSS,'
      '       PD.FLGIRRF,        '
      '       PD.CODFONTEPAGADORA,    '
      '       R.FLGUSAABONO,'
      '       R.FLGANTECIPABONO,'
      '       R.IDTITULAR,'
      '       R.DATAINICIO,'
      '       R.FLGBASEPA,'
      '       R.IDPESSOA,'
      '       R.IDEMPRESA,'
      '       R.NUMOCORRENCIAS,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.IDPROVENTO, PD.CODPROVD' +
        'ESC) AS IDMOSTRARUBOUTROS,'
      '       PD.IDPROVENTO AS IDRUBRICA,'
      '       R.SEQRUBRICAINDIV,'
      '       R.IDFAVORECIDO,'
      '       R.IDREGRACALCULO,'
      '       R.VALORRUBRICA,'
      '       R.ANOMESINICIO,'
      '       R.FLGPERMANENTE,'
      '       R.PARCELAS,'
      '       R.FLGPERCENT,'
      '       R.FLGTPRUBMANUT,'
      '       R.FLGPENSAOALIM,'
      '       R.RUBRICAPROVENTOPA,'
      '       R.DATAFINAL,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD1.IDPROVENTO, PD1.CODPRO' +
        'VDESC) AS IDMOSTRARUBOUTROS1,'
      '       R.ANOMESREF,'
      '       R.CODPORTFORMA,'
      '       P.NUMDOCUMENTO AS CPFFAVORECIDO,'
      '       P.NOME AS FAVORECIDO,'
      '       PD.DESCRICAO,'
      '       R.FLGDESATIVADO,'
      '       R.FLGUSADO,'
      '       R.ULTMESPREPARO,'
      '       PD1.DESCRICAO,'
      '       RG.NOMEREGRA,'
      '       PD.PRAZO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOME,'
      '       R.TRGDTINCLUSAO,'
      '       R.IDRUBRICA13,'
      '       R.IDRUBRICAPROVENTO13,'
      '       R.FLGCONTROLASALDO,'
      '       R.VLRSALDOINICIAL,'
      '       R.VLRTOTALPROC, R.IDSEQINTERNOFB, FLGANTECIPAABONOINSS'
      '      ,R.NUMPROCINSS'
      '      ,R.SITUACAOAJ'
      '      ,R.OBSERVACAO'
      '      ,R.FLGRUBRICARESGATE'
      '      , R.MESCOMPREEM'
      '      , R.FLGRESGATEPARCELADO'
      ''
      
        'FROM RUBRICAINDIV R, PROVDESC PD, PESSOA P, PROVDESC PD1, PARAMA' +
        'PREV PRM, REGRA RG'
      'WHERE R.IDTITULAR = :PIDTITULAR'
      '  AND R.IDPESSOA = :PIDPESSOA'
      '  AND ((R.FLGPENSAOALIM = 0) OR (R.FLGPENSAOALIM IS NULL))'
      '  AND R.IDEMPRESA = :PIDFUNDACAO'
      '  AND R.FLGTPRUBMANUT = '#39'1'#39
      '  AND PD.IDPROVENTO = R.IDRUBRICA'
      '  AND R.IDFAVORECIDO = P.IDPESSOA(+)'
      '  AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+)'
      '  AND R.IDREGRACALCULO = RG.IDREGRA(+)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updOutros
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0'
      'FLGUSAABONO;CheckBox;1;0'
      'FLGANTECIPABONO;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0'
      'FLGUSADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 300
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object updOutros: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  FLGUSAABONO = :FLGUSAABONO,'
      '  FLGANTECIPABONO = :FLGANTECIPABONO,'
      '  IDTITULAR = :IDTITULAR,'
      '  DATAINICIO = :DATAINICIO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  NUMOCORRENCIAS = :NUMOCORRENCIAS,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  VALORRUBRICA = :VALORRUBRICA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  FLGPERMANENTE = :FLGPERMANENTE,'
      '  PARCELAS = :PARCELAS,'
      '  FLGPERCENT = :FLGPERCENT,'
      '  FLGTPRUBMANUT = :FLGTPRUBMANUT,'
      '  FLGPENSAOALIM = :FLGPENSAOALIM,'
      '  RUBRICAPROVENTOPA = :RUBRICAPROVENTOPA,'
      '  DATAFINAL = :DATAFINAL,'
      '  ANOMESREF = :ANOMESREF,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  FLGUSADO = :FLGUSADO,'
      '  IDRUBRICA13 = :IDRUBRICA13, '
      '  IDRUBRICAPROVENTO13 = :IDRUBRICAPROVENTO13,'
      '  FLGCONTROLASALDO = :FLGCONTROLASALDO,'
      '  VLRSALDOINICIAL = :VLRSALDOINICIAL,'
      
        '  VLRTOTALPROC = :VLRTOTALPROC, IDSEQINTERNOFB = :IDSEQINTERNOFB' +
        ','
      '  FLGANTECIPAABONOINSS = :FLGANTECIPAABONOINSS'
      '  ,NUMPROCINSS = :NUMPROCINSS'
      '  ,SITUACAOAJ     = :SITUACAOAJ '
      '  ,OBSERVACAO  = :OBSERVACAO         '
      '  ,FLGRUBRICARESGATE =:FLGRUBRICARESGATE '
      '  ,MESCOMPREEM        =:MESCOMPREEM'
      '  ,FLGRESGATEPARCELADO =:FLGRESGATEPARCELADO '
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV'
      ' ')
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      
        '  (FLGUSAABONO, FLGANTECIPABONO, IDTITULAR, DATAINICIO, IDPESSOA' +
        ','
      'IDEMPRESA,'
      '   NUMOCORRENCIAS, IDRUBRICA, SEQRUBRICAINDIV, IDFAVORECIDO,'
      'IDREGRACALCULO,'
      '   VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, PARCELAS,'
      'FLGPERCENT, FLGTPRUBMANUT,'
      '   FLGPENSAOALIM, RUBRICAPROVENTOPA, DATAFINAL, ANOMESREF,'
      'CODPORTFORMA,'
      '   FLGDESATIVADO, FLGUSADO, IDRUBRICA13, IDRUBRICAPROVENTO13,'
      '  FLGCONTROLASALDO, VLRSALDOINICIAL, VLRTOTALPROC, '
      'IDSEQINTERNOFB, IDPLANOCONTABIL, FLGANTECIPAABONOINSS'
      
        '  ,NUMPROCINSS, SITUACAOAJ , OBSERVACAO,FLGRUBRICARESGATE, MESCO' +
        'MPREEM, FLGRESGATEPARCELADO)'
      'values'
      
        '  (:FLGUSAABONO, :FLGANTECIPABONO, :IDTITULAR, :DATAINICIO, :IDP' +
        'ESSOA,'
      '   :IDEMPRESA, :NUMOCORRENCIAS, :IDRUBRICA, :SEQRUBRICAINDIV,'
      ':IDFAVORECIDO,'
      
        '   :IDREGRACALCULO, :VALORRUBRICA, :ANOMESINICIO, :FLGPERMANENTE' +
        ','
      ':PARCELAS,'
      '   :FLGPERCENT, :FLGTPRUBMANUT, :FLGPENSAOALIM,'
      ':RUBRICAPROVENTOPA, :DATAFINAL,'
      '   :ANOMESREF, :CODPORTFORMA, :FLGDESATIVADO, :FLGUSADO,'
      ':IDRUBRICA13, :IDRUBRICAPROVENTO13,'
      ':FLGCONTROLASALDO, :VLRSALDOINICIAL, :VLRTOTALPROC, '
      ':IDSEQINTERNOFB, :IDPLANOCONTABIL, :FLGANTECIPAABONOINSS'
      
        ',:NUMPROCINSS,   :SITUACAOAJ, :OBSERVACAO,:FLGRUBRICARESGATE, :M' +
        'ESCOMPREEM, :FLGRESGATEPARCELADO)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 592
    Top = 227
  end
  object CmeDetOutros: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    DataSource = dsOutros
    OpenDsAutomatico = False
    Left = 564
    Top = 59
  end
  object qryPortadorforma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO'
      'FROM PORTADORFORMA '
      'WHERE RECPAG = '#39'P'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 688
    Top = 3
  end
  object qryRubricaOutros: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGOBRIGAFAVOREC,'
      
        '       DECODE(FLGDESCONTO,0,'#39'Provento'#39',1,'#39'Desconto'#39','#39'Informativa' +
        #39') AS TIPO,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO,'
      '       FLGINSS,'
      '       CODFONTEPAGADORA'
      'FROM PROVDESC'
      'ORDER BY IDPROVENTO'
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
    ValidateWithMask = True
    Left = 520
    Top = 91
  end
  object qryBenef: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME, V.IDRECEBEDOR AS PESSOAESCOLHIDA, V.IDTITULAR, P.' +
        'IDPESSOA,'
      '       D.MATRICULA'
      'FROM VW_RECEBEDOR V, PESSOA P, DEPENTIT D'
      'WHERE V.IDTITULAR = :PIDTITULAR'
      'AND V.IDRECEBEDOR = P.IDPESSOA'
      'AND V.IDTITULAR = D.IDTITULAR(+)'
      'AND V.IDRECEBEDOR = D.IDPESSOA(+)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 716
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end>
    object qryBenefNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object qryBenefMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryBenefIDPESSOA: TFloatField
      DisplayLabel = 'Identificador'
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryBenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryBenefPESSOAESCOLHIDA: TFloatField
      FieldName = 'PESSOAESCOLHIDA'
      Origin = 'BASEDADOS.DEPENTIT.IDPESSOA'
      Visible = False
    end
  end
  object MontaSelectRub: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleção das rubricas'
    Colunas.Strings = (
      'IDPROVENTO'
      'DESCRICAO'
      'PROVDESC.FLGDESCONTO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo da Rubrica')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'IDPROVENTO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 629
    Top = 467
  end
  object qryRubFavOutros: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGOBRIGAFAVOREC,'
      
        '       DECODE(FLGDESCONTO,0,'#39'Provento'#39',1,'#39'Desconto'#39','#39'Informativa' +
        #39') AS TIPO,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      'FROM PROVDESC'
      'ORDER BY IDPROVENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 364
    Top = 99
  end
  object qryRegraCPMF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, R.IDTIPOREGRA'
      'FROM REGRA R, TIPOREGRA T'
      'WHERE R.IDTIPOREGRA = T.IDTIPOREGRA'
      'ORDER BY UPPER(R.NOMEREGRA)')
    ValidateWithMask = True
    Left = 744
    Top = 51
  end
  object QryProcInss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      '   FROM BENEFBFCIARIO'
      '  WHERE IDPESSOA =:IDPESSOA'
      '    AND FONTEPAGADORA = '#39'2'#39
      '    AND ((IDSITBENEFICIO IN ('#39'1'#39','#39'2'#39')) OR'
      '        ((IDSITBENEFICIO <> '#39'1'#39') AND'
      '        (DATAFINAL = (SELECT MAX(DATAFINAL)'
      '                         FROM BENEFBFCIARIO'
      '                        WHERE IDPESSOA =:IDPESSOA'
      '                        AND FONTEPAGADORA = 2))))'
      'ORDER BY IDSITBENEFICIO')
    ValidateWithMask = True
    Left = 606
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFontepagadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT PD.CODFONTEPAGADORA'
      '    FROM PROVDESC     PD         '
      '   WHERE PD.IDPROVENTO = :IDRUBRICA'
      ''
      '     ')
    ValidateWithMask = True
    Left = 516
    Top = 3
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
end
