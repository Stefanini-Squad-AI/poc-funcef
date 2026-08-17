inherited frmCadCorrecoesContratuaisMT: TfrmCadCorrecoesContratuaisMT
  Left = 177
  Top = 152
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Correções Contratuais/Procedimentos Cálculo'
  ClientHeight = 510
  ClientWidth = 740
  ShowHint = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 424
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 144
      Width = 738
      Height = 279
      Tabs.Strings = (
        'Correções/Procedimentos')
      inherited pgctrlDetalhe: TPageControl
        Width = 640
        Height = 220
        inherited tbsDet: TTabSheet
          Caption = 'Correções/Procedimentos'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 632
            Height = 192
            Selected.Strings = (
              'DESCRICAO'#9'59'#9'Descrição'#9'F'
              'DATAULTIMACORR'#9'19'#9'Data da Última Correção'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 632
            Height = 192
            object pgcDadosCorrecao: TPageControl
              Left = 0
              Top = 0
              Width = 632
              Height = 192
              ActivePage = tbsAditamento
              Align = alClient
              TabOrder = 0
              object tbsDadosI: TTabSheet
                Caption = 'Dados I'
                ImageIndex = 4
                object lblTituloData: TLabel
                  Left = 376
                  Top = 100
                  Width = 100
                  Height = 13
                  Caption = 'Data Base/Inicial'
                end
                object Label1: TLabel
                  Left = 377
                  Top = 52
                  Width = 51
                  Height = 13
                  Caption = 'Intervalo'
                end
                object Bevel5: TBevel
                  Left = 339
                  Top = 1
                  Width = 6
                  Height = 158
                  Shape = bsRightLine
                  Style = bsRaised
                end
                object lblReferencia: TLabel
                  Left = 24
                  Top = 92
                  Width = 127
                  Height = 13
                  Caption = 'Referência de Cálculo'
                  Enabled = False
                end
                object edDataBase: TCMDateTimePicker
                  Left = 376
                  Top = 117
                  Width = 118
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATABASE'
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
                  TabOrder = 4
                  OnCloseUp = edDataBaseCloseUp
                  OnExit = edDataBaseCloseUp
                end
                object dbrgFrequencia: TDBRadioGroup
                  Left = 376
                  Top = 8
                  Width = 217
                  Height = 41
                  Caption = 'Frequência'
                  Columns = 3
                  DataField = 'FREQUENCIA'
                  DataSource = dsDet
                  Items.Strings = (
                    'Diária'
                    'Mensal'
                    'Anual')
                  TabOrder = 2
                  Values.Strings = (
                    'D'
                    'M'
                    'A')
                  OnChange = dbrgFrequenciaChange
                end
                object edrIntervalo: TDBRealEdit
                  Left = 377
                  Top = 69
                  Width = 118
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '1')
                  TabOrder = 3
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'INTERVALO'
                  DataSource = dsDet
                end
                object rgValorBaseCalculo: TRadioGroup
                  Left = 24
                  Top = 8
                  Width = 289
                  Height = 73
                  Caption = 'Base de cálculo da Correção/Reajuste'
                  ItemIndex = 0
                  Items.Strings = (
                    'Valor do Serviço/Produto x Item Contratual'
                    'Valor da Tabela de Valores de Referência')
                  TabOrder = 0
                  OnClick = rgValorBaseCalculoClick
                end
                object dblcReferencia: TwwDBLookupCombo
                  Left = 24
                  Top = 109
                  Width = 289
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'NOME'#9'F')
                  DataField = 'IDREFCONTR'
                  DataSource = dsDet
                  LookupTable = cdsValoresReferencia
                  LookupField = 'IDREFCONTR'
                  Enabled = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
              object tbsDadosII: TTabSheet
                Caption = 'Dados II'
                object Bevel1: TBevel
                  Left = 218
                  Top = 1
                  Width = 6
                  Height = 131
                  Shape = bsRightLine
                  Style = bsRaised
                end
                object lblValorCorrecao: TLabel
                  Left = 454
                  Top = 6
                  Width = 103
                  Height = 13
                  Caption = 'Valor de Correção'
                end
                object lblMoedaCorrecao: TLabel
                  Left = 454
                  Top = 47
                  Width = 112
                  Height = 13
                  Caption = 'Moeda de Correção'
                  Enabled = False
                end
                object Bevel2: TBevel
                  Left = 433
                  Top = 1
                  Width = 6
                  Height = 131
                  Shape = bsRightLine
                  Style = bsRaised
                end
                object Bevel3: TBevel
                  Left = 0
                  Top = 134
                  Width = 616
                  Height = 2
                  Shape = bsBottomLine
                end
                object dbrgTipoCorrecao: TDBRadioGroup
                  Left = 16
                  Top = 7
                  Width = 193
                  Height = 122
                  Caption = 'Tipo de Correção'
                  DataField = 'TIPOCORRECAO'
                  DataSource = dsDet
                  Items.Strings = (
                    'Percentual'
                    'Valor Absoluto'
                    'Faixa (percentual)'
                    'Faixa (valor absoluto)'
                    'Moeda')
                  TabOrder = 0
                  Values.Strings = (
                    'PC'
                    'VA'
                    'FP'
                    'FV'
                    'MD')
                  OnClick = dbrgTipoCorrecaoClick
                end
                object gbFaixa: TGroupBox
                  Left = 237
                  Top = 8
                  Width = 188
                  Height = 121
                  Caption = 'Faixa'
                  Enabled = False
                  TabOrder = 1
                  object Label3: TLabel
                    Left = 8
                    Top = 19
                    Width = 68
                    Height = 13
                    Caption = 'Valor Inicial'
                  end
                  object Label5: TLabel
                    Left = 8
                    Top = 50
                    Width = 61
                    Height = 13
                    Caption = 'Valor Final'
                  end
                  object edrFaixaFinal: TDBRealEdit
                    Left = 88
                    Top = 46
                    Width = 89
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 1
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'FAIXAFINAL'
                    DataSource = dsDet
                  end
                  object edrFaixaInicial: TDBRealEdit
                    Left = 88
                    Top = 15
                    Width = 89
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 0
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'FAIXAINICIAL'
                    DataSource = dsDet
                  end
                  object dbcRateioAcumulativo: TDBCheckBox
                    Left = 8
                    Top = 82
                    Width = 169
                    Height = 17
                    Caption = 'Tipo Rateio Acumulativo'
                    DataField = 'FLGFAIXARATACU'
                    DataSource = dsDet
                    TabOrder = 2
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
                object dbeVlrCorrecao: TDBRealEdit
                  Left = 454
                  Top = 22
                  Width = 137
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '10,00')
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VALOR'
                  DataSource = dsDet
                end
                object dblcMoeda: TwwDBLookupCombo
                  Left = 454
                  Top = 64
                  Width = 137
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOEDESC'#9'20'#9'Moeda'#9'F')
                  DataField = 'MOECODIGO'
                  DataSource = dsDet
                  LookupTable = cdsMoeda
                  LookupField = 'MOECODIGO'
                  Enabled = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dbcbAfetaOutrasCorrecoes: TDBCheckBox
                  Left = 7
                  Top = 138
                  Width = 602
                  Height = 16
                  Caption = 
                    'Afeta valor a ser utilizado pelas correções seguintes, neste Ser' +
                    'v./Prod. x Item Contratual'
                  DataField = 'FLGAFETACORR'
                  DataSource = dsDet
                  Enabled = False
                  TabOrder = 4
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
              object tbsDadosIII: TTabSheet
                Caption = 'Dados III'
                ImageIndex = 3
                object dbmObsAditamento: TDBMemo
                  Tag = 2
                  Left = 0
                  Top = 102
                  Width = 616
                  Height = 54
                  Align = alClient
                  DataField = 'OBSADITAMENTO'
                  DataSource = dsDet
                  MaxLength = 500
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
                object Panel1: TPanel
                  Left = 0
                  Top = 0
                  Width = 616
                  Height = 102
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 9
                    Top = 0
                    Width = 58
                    Height = 13
                    Caption = 'Descrição'
                  end
                  object Label8: TLabel
                    Left = 9
                    Top = 88
                    Width = 425
                    Height = 13
                    Anchors = [akLeft, akBottom]
                    Caption = 
                      'Observação a ser utilizada no aditamento do contrato, no ato da ' +
                      'correção '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label4: TLabel
                    Left = 9
                    Top = 43
                    Width = 125
                    Height = 13
                    Caption = 'Código do Aditamento'
                  end
                  object dbeDescricao: TwwDBEdit
                    Left = 8
                    Top = 17
                    Width = 601
                    Height = 21
                    DataField = 'DESCRICAO'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeCodAditamentoCorr: TwwDBEdit
                    Left = 8
                    Top = 60
                    Width = 153
                    Height = 21
                    DataField = 'CODADITAMENTO'
                    DataSource = dsDet
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
              end
              object tbsAditamento: TTabSheet
                Caption = 'Aditamento da Correção/Procedimento'
                ImageIndex = 4
                object Panel2: TPanel
                  Left = 0
                  Top = 0
                  Width = 624
                  Height = 61
                  Align = alTop
                  TabOrder = 0
                  object Label7: TLabel
                    Left = 8
                    Top = 4
                    Width = 28
                    Height = 13
                    Caption = 'Data'
                  end
                  object Label10: TLabel
                    Left = 8
                    Top = 44
                    Width = 58
                    Height = 13
                    Anchors = [akLeft, akBottom]
                    Caption = 'Descrição'
                  end
                  object Label9: TLabel
                    Left = 168
                    Top = 4
                    Width = 40
                    Height = 13
                    Caption = 'Código'
                  end
                  object edDataAditamento: TCMDateTimePicker
                    Left = 8
                    Top = 20
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAASSADITAMENTO'
                    DataSource = dsAditamento
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
                  object dbeCodigoAditamento: TDBEdit
                    Tag = 1
                    Left = 168
                    Top = 20
                    Width = 121
                    Height = 21
                    DataField = 'CODADITAMENTO'
                    DataSource = dsAditamento
                    TabOrder = 1
                  end
                end
                object dbeDescricaoAditamento: TDBMemo
                  Tag = 2
                  Left = 0
                  Top = 61
                  Width = 624
                  Height = 103
                  Align = alClient
                  DataField = 'DESCADITAMENTO'
                  DataSource = dsAditamento
                  MaxLength = 500
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 730
      end
      inherited Dock974: TDock97
        Left = 644
        Height = 220
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 738
      Height = 143
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object dbeNomeContrato: TwwDBEdit
        Left = 65
        Top = 15
        Width = 384
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMECONTRATO'
        DataSource = ds
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 43
        Width = 738
        Height = 100
        ActivePage = TabSheet4
        Align = alBottom
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Atuação'
          object dbrgAtuacao: TDBRadioGroup
            Left = 8
            Top = 5
            Width = 185
            Height = 60
            Caption = 'Atuação'
            DataField = 'ATUACAO'
            DataSource = dsObjetoxItemContratual
            Items.Strings = (
              'Correção '
              'Procedimento de Cálculo')
            TabOrder = 0
            Values.Strings = (
              'C'
              'P')
            OnClick = dbrgTipoCorrecaoClick
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Objeto x Item Contratual'
          ImageIndex = 3
          object Label11: TLabel
            Left = 9
            Top = 15
            Width = 80
            Height = 13
            Caption = 'Prod./Serviço'
          end
          object Label15: TLabel
            Left = 44
            Top = 29
            Width = 7
            Height = 13
            Caption = 'x'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label12: TLabel
            Left = 1
            Top = 45
            Width = 87
            Height = 13
            Caption = 'Item Contratual'
          end
          object dblcItemContratual: TwwDBLookupCombo
            Left = 104
            Top = 11
            Width = 433
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME_ITEM'#9'200'#9'Item Contratual'#9'F')
            LookupTable = cdsItemContratual
            LookupField = 'IDITEM'
            DropDownWidth = 700
            Enabled = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblcServProdItemContratoChange
          end
          object dblcServProd: TwwDBLookupCombo
            Left = 104
            Top = 41
            Width = 433
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEOBJETO'#9'200'#9'Serviço/Produto'#9'F')
            LookupTable = cdsSrvProd
            LookupField = 'IDOBJETO'
            DropDownWidth = 700
            Enabled = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblcServProdItemContratoChange
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Abatimento'
          ImageIndex = 1
          object Label13: TLabel
            Left = 9
            Top = 6
            Width = 172
            Height = 13
            Caption = 'Produto/Serviço a ser abatido'
          end
          object Label14: TLabel
            Left = 337
            Top = 8
            Width = 165
            Height = 13
            Caption = 'Item Contratual a ser abatido'
          end
          object dblcServProdAbatido: TwwDBLookupCombo
            Left = 8
            Top = 22
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEOBJETO'#9'200'#9'Serviço/Produto'#9'F')
            DataField = 'IDOBJABATCORR'
            DataSource = dsObjetoxItemContratual
            LookupTable = cdsSrvProd
            LookupField = 'IDOBJETO'
            DropDownWidth = 700
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblcServProdContratoAbatidoChange
          end
          object dblcItemContratualAbatido: TwwDBLookupCombo
            Left = 336
            Top = 23
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME_ITEM'#9'200'#9'Item Contratual'#9'F')
            DataField = 'IDITEMABATCORR'
            DataSource = dsObjetoxItemContratual
            LookupTable = cdsItemContratualAbatido
            LookupField = 'IDITEM'
            DropDownWidth = 700
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblcServProdContratoAbatidoChange
          end
          object dbcbPermResMenor: TDBCheckBox
            Left = 10
            Top = 47
            Width = 583
            Height = 17
            Caption = 'Permite que após o abatimento o Resultado seja negativo'
            DataField = 'FLGRESMENABAT'
            DataSource = dsObjetoxItemContratual
            Enabled = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Aditamento'
          ImageIndex = 2
          object Label24: TLabel
            Left = 8
            Top = 4
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label26: TLabel
            Left = 136
            Top = 4
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object Label25: TLabel
            Left = 272
            Top = 4
            Width = 58
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Descrição'
          end
          object edDataAditamentoAbat: TCMDateTimePicker
            Left = 8
            Top = 20
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAASSADITAMENTO'
            DataSource = dsAditamento
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
          object dbeCodigoAditamentoAbat: TDBEdit
            Tag = 1
            Left = 136
            Top = 20
            Width = 129
            Height = 21
            DataField = 'CODADITAMENTO'
            DataSource = dsAditamento
            TabOrder = 1
          end
          object dbmDescricaoAditamentoAbat: TDBMemo
            Tag = 2
            Left = 272
            Top = 20
            Width = 449
            Height = 49
            DataField = 'DESCADITAMENTO'
            DataSource = dsAditamento
            MaxLength = 500
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
      end
      object rgAbrangencia: TRadioGroup
        Left = 456
        Top = 5
        Width = 265
        Height = 36
        Hint = 'Teste'
        Caption = 'Abrangência'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Todo o Contrato'
          'Serv/Prod x Item')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = rgAbrangenciaClick
      end
    end
  end
  inherited Dock972: TDock97
    Width = 740
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnOrdenar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Ordenar'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
          FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
          FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
          FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
          00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
          55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
          5555777577775755555550FBFB0555555555575FFF7555555555570000755555
          5555557777555555555555555555555555555555555555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnOrdenarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 471
    Width = 740
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 664
    Top = 0
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 48
  end
  inherited ImlPadrao: TImageList
    Left = 544
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 328
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 208
    Top = 48
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTRATOCONTR.NOMECONTRATO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Contrato')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR')
    CamposChave.Strings = (
      'CONTRATOCONTR.IDCONTRATO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '300')
    Left = 584
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 392
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 232
    Top = 200
  end
  object cdsSrvProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 64
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'select * from referenciacontr')
    ClientDataSet = cdsValoresReferencia
    Left = 16
    Top = 464
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterScroll = cdsDetAfterScroll
    Left = 192
    Top = 200
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 64
    Top = 464
  end
  object cdsAditamento: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 672
    Top = 328
  end
  object dsAditamento: TwwDataSource
    AutoEdit = False
    DataSet = cdsAditamento
    Left = 672
    Top = 312
  end
  object cdsItemContratual: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 624
    Top = 72
  end
  object cdsSrvProdAbatido: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 288
    Top = 192
  end
  object cdsItemContratualAbatido: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 448
    Top = 200
  end
  object cdsObjetoxItemContratual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 392
  end
  object dsObjetoxItemContratual: TwwDataSource
    AutoEdit = False
    DataSet = cdsObjetoxItemContratual
    Left = 672
    Top = 376
  end
  object cdsValoresReferencia: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterScroll = cdsDetAfterScroll
    Left = 368
    Top = 200
  end
end
