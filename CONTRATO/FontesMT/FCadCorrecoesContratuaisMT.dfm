inherited frmCadCorrecoesContratuaisMT: TfrmCadCorrecoesContratuaisMT
  Left = 294
  Top = 145
  HelpContext = 120023
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Reajustes Contratuais / Procedimentos Cálculo'
  ClientHeight = 540
  ClientWidth = 759
  ShowHint = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 759
    Height = 454
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 168
      Width = 757
      Height = 285
      Tabs.Strings = (
        'Reajustes/Procedimentos')
      inherited pgctrlDetalhe: TPageControl
        Width = 659
        Height = 226
        inherited tbsDet: TTabSheet
          Caption = 'Reajustes/Procedimentos'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 651
            Height = 198
            Selected.Strings = (
              'DSC_ATIVO'#9'6'#9'Status'#9'F'
              'ORDEM'#9'6'#9'Ordem'#9'F'
              'DESCRICAO'#9'30'#9'Descrição'#9'F'
              'DESCTIPOCORR'#9'15'#9'Tipo de Correção'#9'F'
              'FREQUENCIA'#9'10'#9'Frequência'#9'F'
              'INTERVALO'#9'8'#9'Intervalo'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'DATAULTIMACORR'#9'14'#9'Última Correção'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 651
            Height = 198
            object pgcDadosCorrecao: TPageControl
              Left = 0
              Top = 0
              Width = 651
              Height = 198
              ActivePage = tbsDadosI
              Align = alClient
              TabOrder = 0
              OnDrawTab = pgcDadosCorrecaoDrawTab
              object tbsDadosI: TTabSheet
                Caption = 'Aditamento'
                ImageIndex = 3
                object dbmObsAditamento: TDBMemo
                  Tag = 2
                  Left = 0
                  Top = 57
                  Width = 643
                  Height = 113
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
                  Width = 643
                  Height = 57
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
                    Top = 43
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
                    Left = 449
                    Top = 0
                    Width = 112
                    Height = 13
                    Caption = 'Cód. do Aditamento'
                  end
                  object dbeDescricao: TwwDBEdit
                    Left = 8
                    Top = 17
                    Width = 433
                    Height = 21
                    DataField = 'DESCRICAO'
                    DataSource = dsDet
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeCodAditamentoCorr: TwwDBEdit
                    Left = 448
                    Top = 17
                    Width = 161
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
              object tbsDadosII: TTabSheet
                Caption = 'Referência'
                ImageIndex = 4
                object lblReferencia: TLabel
                  Left = 336
                  Top = 28
                  Width = 127
                  Height = 13
                  Caption = 'Referência de Cálculo'
                  Enabled = False
                end
                object rgValorBaseCalculo: TRadioGroup
                  Left = 24
                  Top = 24
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
                  Left = 336
                  Top = 45
                  Width = 265
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Nome'#9'F')
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
              object tbsDadosIII: TTabSheet
                Caption = 'Forma de Calculo'
                object lblValorCorrecao: TLabel
                  Left = 478
                  Top = 15
                  Width = 135
                  Height = 13
                  Caption = 'Percentual de Correção'
                end
                object lblMoedaCorrecao: TLabel
                  Left = 478
                  Top = 56
                  Width = 112
                  Height = 13
                  Caption = 'Moeda de Correção'
                  Enabled = False
                end
                object Label7: TLabel
                  Left = 478
                  Top = 96
                  Width = 97
                  Height = 13
                  Caption = 'Moeda Projetada'
                  Enabled = False
                end
                object dbrgTipoCorrecao: TDBRadioGroup
                  Left = 0
                  Top = 15
                  Width = 281
                  Height = 114
                  Caption = 'Tipo de Correção/Procedimento'
                  Columns = 2
                  DataField = 'TIPOCORRECAO'
                  DataSource = dsDet
                  Items.Strings = (
                    'Percentual'
                    'Valor Absoluto'
                    'Faixa (percentual)'
                    'Faixa (valor absol.)'
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
                  Left = 285
                  Top = 15
                  Width = 188
                  Height = 114
                  Caption = 'Faixa'
                  Enabled = False
                  TabOrder = 1
                  object Label3: TLabel
                    Left = 8
                    Top = 17
                    Width = 68
                    Height = 13
                    Caption = 'Valor Inicial'
                  end
                  object Label5: TLabel
                    Left = 8
                    Top = 40
                    Width = 61
                    Height = 13
                    Caption = 'Valor Final'
                  end
                  object edrFaixaFinal: TDBRealEdit
                    Left = 88
                    Top = 36
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
                    Top = 13
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
                  object dbrgTipoFaixa: TDBRadioGroup
                    Left = 74
                    Top = 105
                    Width = 184
                    Height = 55
                    DataField = 'FLGFAIXARATACU'
                    DataSource = dsDet
                    Items.Strings = (
                      'Normal'
                      'Rateio Acumulativo'
                      'Rateio Acum. Proporcional')
                    TabOrder = 2
                    Values.Strings = (
                      'N'
                      'A'
                      'P')
                    Visible = False
                    OnClick = dbrgTipoCorrecaoClick
                  end
                end
                object dbeVlrCorrecao: TDBRealEdit
                  Left = 478
                  Top = 30
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
                  Left = 478
                  Top = 73
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
                object dblcMoedaProj: TwwDBLookupCombo
                  Left = 478
                  Top = 113
                  Width = 137
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOEDESC'#9'20'#9'Moeda'#9'F')
                  DataField = 'MOECODIGOPROJ'
                  DataSource = dsDet
                  LookupTable = cdsMoeda
                  LookupField = 'MOECODIGO'
                  Enabled = False
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
              object tbsDadosIV: TTabSheet
                Caption = 'Frequência'
                ImageIndex = 4
                object lblTituloData: TLabel
                  Left = 400
                  Top = 20
                  Width = 100
                  Height = 13
                  Caption = 'Data Base/Inicial'
                end
                object Label1: TLabel
                  Left = 257
                  Top = 20
                  Width = 51
                  Height = 13
                  Caption = 'Intervalo'
                end
                object Bevel3: TBevel
                  Left = 0
                  Top = 105
                  Width = 616
                  Height = 2
                  Shape = bsBottomLine
                end
                object edDataBase: TCMDateTimePicker
                  Left = 400
                  Top = 37
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
                  TabOrder = 2
                  OnCloseUp = edDataBaseCloseUp
                  OnExit = edDataBaseCloseUp
                end
                object dbrgFrequencia: TDBRadioGroup
                  Left = 8
                  Top = 16
                  Width = 217
                  Height = 49
                  Caption = 'Frequência'
                  Columns = 3
                  DataField = 'FREQUENCIA'
                  DataSource = dsDet
                  Items.Strings = (
                    'Diária'
                    'Mensal'
                    'Anual')
                  TabOrder = 0
                  Values.Strings = (
                    'D'
                    'M'
                    'A')
                  OnChange = dbrgFrequenciaChange
                end
                object edrIntervalo: TDBRealEdit
                  Left = 257
                  Top = 37
                  Width = 118
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '1')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'INTERVALO'
                  DataSource = dsDet
                end
                object dbcbAfetaOutrasCorrecoes: TDBCheckBox
                  Left = 7
                  Top = 111
                  Width = 602
                  Height = 16
                  Caption = 
                    'Afeta valor a ser utilizado pelas correções seguintes, neste Ser' +
                    'v./Prod. x Item Contratual'
                  DataField = 'FLGAFETACORR'
                  DataSource = dsDet
                  Enabled = False
                  TabOrder = 3
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 749
      end
      inherited Dock974: TDock97
        Left = 663
        Height = 226
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 757
      Height = 167
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object dbeNomeContrato: TwwDBEdit
        Left = 65
        Top = 14
        Width = 392
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMECONTRATO'
        DataSource = ds
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rgAbrangencia: TRadioGroup
        Left = 464
        Top = 5
        Width = 257
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
        TabOrder = 1
        OnClick = rgAbrangenciaClick
      end
      object Panel3: TPanel
        Left = 0
        Top = 48
        Width = 757
        Height = 119
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object pgcMestre: TPageControl
          Left = 1
          Top = 1
          Width = 755
          Height = 117
          ActivePage = tbsObjetoCalcAtuacao
          Align = alClient
          TabOrder = 0
          object tbsObjetoCalcAtuacao: TTabSheet
            Caption = 'Objeto de Cálculo'
            ImageIndex = 2
            object lblProdutoServ: TLabel
              Left = 9
              Top = 13
              Width = 94
              Height = 13
              Caption = 'Serviço/Produto'
            end
            object lblX: TLabel
              Left = 44
              Top = 30
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
            object lblItemContratual: TLabel
              Left = 9
              Top = 48
              Width = 87
              Height = 13
              Caption = 'Item Contratual'
            end
            object dbrgAtuacao: TDBRadioGroup
              Left = 672
              Top = 5
              Width = 145
              Height = 60
              Caption = 'Atuação'
              DataField = 'ATUACAO'
              DataSource = dsObjetoxItemContratual
              Items.Strings = (
                'Correção '
                'Proced. de Cálculo')
              TabOrder = 0
              Values.Strings = (
                'C'
                'P')
              Visible = False
              OnClick = dbrgTipoCorrecaoClick
            end
            object dblcServProd: TwwDBLookupCombo
              Left = 111
              Top = 9
              Width = 457
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEOBJETO'#9'200'#9'Serviço/Produto'#9'F')
              LookupTable = cdsSrvProd
              LookupField = 'IDOBJETO'
              DropDownWidth = 457
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcServProdItemContratoChange
            end
            object dblcItemContratual: TwwDBLookupCombo
              Left = 111
              Top = 44
              Width = 457
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME_ITEM'#9'200'#9'Item Contratual'#9'F')
              LookupTable = cdsItemContratual
              LookupField = 'IDITEM'
              DropDownWidth = 457
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcServProdItemContratoChange
            end
          end
          object tbsAbatimento: TTabSheet
            Caption = 'Abatimento'
            ImageIndex = 1
            object Label13: TLabel
              Left = 9
              Top = 12
              Width = 172
              Height = 13
              Caption = 'Produto/Serviço a ser abatido'
            end
            object Label14: TLabel
              Left = 9
              Top = 44
              Width = 165
              Height = 13
              Caption = 'Item Contratual a ser abatido'
            end
            object dblcServProdAbatido: TwwDBLookupCombo
              Left = 194
              Top = 8
              Width = 521
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
              Left = 194
              Top = 40
              Width = 521
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
              Top = 69
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
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 759
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
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
    Top = 501
    Width = 759
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
    Left = 472
    Top = 0
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
    Left = 456
    Top = 0
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
    Left = 208
    Top = 216
  end
  object cdsSrvProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 232
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   COR.*,'
      '   C.*,'
      '   '#39'Ativo'#39' AS DSC_ATIVO,'
      '   0 AS IDOBJTODOCONTR,'
      '   0 AS IDITEMTODOCONTR,'
      
        '   DECODE(COR.DATAULTIMACORR,NULL,DECODE(COR.FREQUENCIA,'#39'D'#39',(COR' +
        '.DATABASE+COR.INTERVALO), '
      
        '                                                        '#39'M'#39',ADD_' +
        'MONTHS(COR.DATABASE,COR.INTERVALO), '
      
        '                                        '#9#9#9'    '#39'A'#39',ADD_MONTHS(CO' +
        'R.DATABASE,(12*COR.INTERVALO))), '
      
        #9#9'                             DECODE(COR.FREQUENCIA,'#39'D'#39',(COR.DA' +
        'TAULTIMACORR+COR.INTERVALO), '
      
        '                                                           '#39'M'#39',A' +
        'DD_MONTHS(COR.DATAULTIMACORR,COR.INTERVALO), '
      
        '                                          '#9#9#9#9'   '#39'A'#39',ADD_MONTHS(' +
        'COR.DATAULTIMACORR,(12*COR.INTERVALO)))) AS DATAEFETIVA, '
      '   DECODE(COR.TIPOCORRECAO,'#39'PC'#39','#39'Percentual'#39','
      '                            '#39'VA'#39','#39'Valor Absoluto'#39','
      '                            '#39'FP'#39','#39'Faixa Percentual'#39','
      '                            '#39'FV'#39','#39'Faixa Vlr Absoluto'#39','
      
        '                            '#39'MD'#39','#39'Moeda'#39','#39'Tipo Desconhecido'#39') AS' +
        ' DescTipoCorr '
      'FROM '
      '   CORRECAOCONTR COR, '
      '   CONTRATOCONTR C '
      'WHERE '
      '   (COR.IDCONTRATO = C.IDCONTRATO) AND '
      '   (C.IDPESSOA = 1) '
      ' ')
    ClientDataSet = cdsDet
    Left = 16
    Top = 464
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterScroll = cdsDetAfterScroll
    Left = 192
    Top = 216
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
    Left = 640
    Top = 200
  end
  object cdsSrvProdAbatido: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 384
    Top = 216
  end
  object cdsItemContratualAbatido: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 640
    Top = 184
  end
  object cdsObjetoxItemContratual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 408
  end
  object dsObjetoxItemContratual: TwwDataSource
    AutoEdit = False
    DataSet = cdsObjetoxItemContratual
    Left = 672
    Top = 392
  end
  object cdsValoresReferencia: TCMClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterScroll = cdsDetAfterScroll
    Left = 280
    Top = 216
    Data = {
      C00100009619E0BD01000000180000000700050000000300000034010A494452
      4546434F4E54520800040000000000044E4F4D45010049000000010005574944
      5448020002003C000A464C4753414241444F5301004900000002000753554254
      595045020049000A00466978656443686172000557494454480200020001000B
      464C47444F4D494E474F5301004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020001000B464C474645524941
      444F5301004900000002000753554254595045020049000A0046697865644368
      6172000557494454480200020001000D5452474454494E434C5553414F080008
      00000000000F54524755534552494E434C5553414F0100490000000100055749
      445448020002001E000100044C43494404000100090800000050010000000000
      00F03F055245462031009C6A3533BACC4202434D005001000000000000004005
      5245462032009C6A3533BACC4202434D00500100000000000008400552454620
      33009C6A3533BACC4202434D0050010000000000001040055245462034009C6A
      3533BACC4202434D0050010000000000001440055245462035009C6A3533BACC
      4202434D}
  end
  object cdsLogAditamento: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 672
    Top = 339
  end
  object cdsCtrlParcelaMedicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 256
  end
end
