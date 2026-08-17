inherited FrmNotaFiscal: TFrmNotaFiscal
  Left = 31
  Top = 52
  HelpContext = 50066
  Caption = 'Nota Fiscal'
  ClientHeight = 449
  ClientWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 730
    Height = 363
    inherited pnlMestre: TPanel
      Width = 728
      object lblNumDoc: TLabel
        Left = 8
        Top = 56
        Width = 130
        Height = 13
        Caption = 'Número da Nota Fiscal'
      end
      object lblBarra: TLabel
        Left = 152
        Top = 79
        Width = 7
        Height = 13
        Caption = '/'
      end
      object lblValor: TLabel
        Left = 224
        Top = 56
        Width = 149
        Height = 13
        Caption = 'Valor Total da Nota Fiscal'
      end
      object dbenNumDoc: TDBRealEdit
        Left = 8
        Top = 72
        Width = 142
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMNF'
        DataSource = ds
      end
      object dbeCompl: TwwDBEdit
        Left = 160
        Top = 72
        Width = 44
        Height = 21
        DataField = 'COMPLNF'
        DataSource = ds
        MaxLength = 3
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object gbDatas: TGroupBox
        Left = 440
        Top = 32
        Width = 273
        Height = 65
        Caption = ' Datas '
        TabOrder = 4
        object lblData: TLabel
          Left = 141
          Top = 22
          Width = 45
          Height = 13
          Caption = 'Entrada'
        end
        object lblEmissao: TLabel
          Left = 15
          Top = 22
          Width = 47
          Height = 13
          Caption = 'Emissão'
        end
        object dbeDataLanc: TCMDateTimePicker
          Left = 141
          Top = 36
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAENTDEVOL'
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
        end
        object dbeDataEmi: TCMDateTimePicker
          Left = 15
          Top = 36
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMISNF'
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
          TabOrder = 0
        end
      end
      object dbeValorCorrente: TDBRealEdit
        Left = 224
        Top = 72
        Width = 210
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRNOTAFISCAL'
        DataSource = ds
      end
      object dblcFornCli: TCMProcuraForCli
        Left = 8
        Top = 0
        Width = 425
        Height = 48
        Caption = ' Favorecido '
        TabOrder = 0
        OnExit = dblcFornCliExit
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'Fornecedor em branco'
        Mensagens.NaoExiste = 'Fornecedor não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
        MostraStatusCredito = False
      end
      object rgTipoNota: TDBRadioGroup
        Left = 440
        Top = 0
        Width = 273
        Height = 33
        Columns = 2
        DataField = 'FLGTIPONOTA'
        DataSource = ds
        Items.Strings = (
          'Entrada'
          'Saída')
        TabOrder = 5
        Values.Strings = (
          'E'
          'S')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 728
      Height = 263
      Tabs.Strings = (
        'Itens Nota'
        'Agregados da Nota')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 630
        Height = 204
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 622
            Height = 176
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Código'
              'DESCPROD'#9'30'#9'Descrição'
              'QTDERECEBDEVOL'#9'10'#9'Quantidade'
              'CODMEDIDA'#9'4'#9'Unid.'
              'VLRUNITARIO'#9'10'#9'Valor Unit.'
              'VALORTOTAL'#9'10'#9'Valor Total'
              'VLRESTOQUE'#9'10'#9'Valor Estoque')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 622
            Height = 176
            object pgclDadosItem: TPageControl
              Left = 0
              Top = 0
              Width = 622
              Height = 176
              ActivePage = tbsDadosGerais
              Align = alClient
              TabOrder = 0
              object tbsDadosGerais: TTabSheet
                Caption = '&Gerais'
                object Label2: TLabel
                  Left = 8
                  Top = 0
                  Width = 34
                  Height = 13
                  Caption = 'Artigo'
                end
                object Label12: TLabel
                  Left = 112
                  Top = 0
                  Width = 58
                  Height = 13
                  Caption = 'Descrição'
                end
                object Label13: TLabel
                  Left = 320
                  Top = 0
                  Width = 86
                  Height = 13
                  Caption = 'Qtde Recebida'
                end
                object Label15: TLabel
                  Left = 432
                  Top = 0
                  Width = 53
                  Height = 13
                  Caption = 'Un. Med.'
                end
                object lbvalorUN: TLabel
                  Left = 488
                  Top = 0
                  Width = 78
                  Height = 13
                  Caption = 'Valor Unitário'
                end
                object lbValorTot: TLabel
                  Left = 344
                  Top = 104
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                end
                object dblkpcmbArtigo: TwwDBLookupCombo
                  Left = 8
                  Top = 16
                  Width = 99
                  Height = 21
                  Hint = 'Lista de Codigos Cadastrados '
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODARTIGO'#9'14'#9'Código')
                  DataField = 'CODARTIGO'
                  DataSource = dsDet
                  LookupTable = cdsArtigo
                  LookupField = 'CODARTIGO'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblkpcmbArtigoCloseUp
                end
                object dblkpcmbDesc: TwwDBLookupCombo
                  Left = 112
                  Top = 16
                  Width = 199
                  Height = 21
                  Hint = 'Lista de Artigos Cadastrados por Descrição'
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCPROD'#9'40'#9'Descrição')
                  DataField = 'CODARTIGO'
                  DataSource = dsDet
                  LookupTable = cdsArtigo
                  LookupField = 'CODARTIGO'
                  Style = csDropDownList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = dblkpcmbDescCloseUp
                end
                object gbClasFisc: TGroupBox
                  Left = 8
                  Top = 104
                  Width = 321
                  Height = 55
                  Caption = 'Classificação Fiscal'
                  TabOrder = 6
                  object dblkpcmbClasFisc: TwwDBLookupCombo
                    Left = 15
                    Top = 19
                    Width = 282
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'CODFISCAL'#9'4'#9'Código'
                      'DESCCLASSIFISCAL'#9'50'#9'Descrição')
                    DataField = 'CODFISCAL'
                    DataSource = dsDet
                    LookupTable = cdsClasFisc
                    LookupField = 'CODFISCAL'
                    Options = [loTitles]
                    Style = csDropDownList
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                    OnExit = dblkpcmbClasFiscExit
                  end
                end
                object dblcUnidMedida: TwwDBLookupCombo
                  Left = 432
                  Top = 16
                  Width = 50
                  Height = 21
                  Hint = 'Unidades de Conversão deste Produto'
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODMEDIDA'#9'4'#9'Código'
                    'FATOR'#9'10'#9'Fator'
                    'DESCMEDIDA'#9'25'#9'Decrição')
                  DataField = 'CODMEDIDA'
                  DataSource = dsDet
                  LookupTable = cdsUnidMed
                  LookupField = 'CODMEDIDA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnEnter = dblcUnidMedidaEnter
                end
                object dbedQtdeEnt: TDBRealEdit
                  Left = 320
                  Top = 16
                  Width = 105
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 4
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'QTDERECEBDEVOL'
                  DataSource = dsDet
                end
                object dbedValUN: TDBRealEdit
                  Left = 488
                  Top = 16
                  Width = 109
                  Height = 21
                  Alignment = taRightJustify
                  Color = clWhite
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 4
                  WordWrap = False
                  OnExit = dbedValUNExit
                  IntDigits = 10
                  DecDigits = 6
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRUNITARIO'
                  DataSource = dsDet
                end
                object reValorTotal: TRealEdit
                  Left = 344
                  Top = 120
                  Width = 109
                  Height = 21
                  Alignment = taRightJustify
                  Enabled = False
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 7
                  WordWrap = False
                  OnExit = reValorTotalExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object GrpDestMerc: TGroupBox
                  Left = 8
                  Top = 40
                  Width = 592
                  Height = 64
                  Caption = ' Destino da Mercadoria '
                  TabOrder = 5
                  TabStop = True
                  object lblDestEdit: TLabel
                    Left = 304
                    Top = 16
                    Width = 120
                    Height = 13
                    Caption = 'Almoxarifado Destino'
                  end
                  object dblcCCusto: TwwDBLookupCombo
                    Left = 304
                    Top = 32
                    Width = 274
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'30'#9'Descrição'
                      'CODCENTROCUSTO'#9'10'#9'Código')
                    DataField = 'CODCENTROCUSTO'
                    DataSource = dsDet
                    LookupTable = CdsCentroCusto
                    LookupField = 'CODCENTROCUSTO'
                    Options = [loTitles]
                    Style = csDropDownList
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dblkpcmbAlmoxa: TwwDBLookupCombo
                    Left = 304
                    Top = 32
                    Width = 274
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCALMOX'#9'40'#9'Descrição'
                      'CODALMOXARIFADO'#9'10'#9'Código')
                    DataField = 'CODALMOXARIFADO'
                    DataSource = dsDet
                    LookupTable = cdsAlmox
                    LookupField = 'CODALMOXARIFADO'
                    Options = [loTitles]
                    Style = csDropDownList
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbrgECA: TDBRadioGroup
                    Left = 18
                    Top = 17
                    Width = 273
                    Height = 38
                    Columns = 3
                    DataField = 'FLGDESTINO'
                    DataSource = dsDet
                    DragMode = dmAutomatic
                    Items.Strings = (
                      '&Estoque'
                      '&Ativo Fixo'
                      '&Custo')
                    TabOrder = 0
                    TabStop = True
                    Values.Strings = (
                      'E'
                      'A'
                      'C')
                  end
                end
              end
              object tbsAgregItem: TTabSheet
                Caption = '&Agregados do Item'
                object PnlGrd: TPanel
                  Left = 6
                  Top = 1
                  Width = 595
                  Height = 150
                  BevelInner = bvLowered
                  TabOrder = 0
                  object Label1: TLabel
                    Left = 427
                    Top = 132
                    Width = 34
                    Height = 13
                    Caption = 'Valor:'
                  end
                  object Label4: TLabel
                    Left = 187
                    Top = 132
                    Width = 94
                    Height = 13
                    Caption = 'Base de Cáculo:'
                  end
                  object Label5: TLabel
                    Left = 16
                    Top = 132
                    Width = 51
                    Height = 13
                    Caption = 'Aliquota:'
                  end
                  object dbgrAgregItem: TwwDBGrid
                    Left = 2
                    Top = 25
                    Width = 591
                    Height = 93
                    Selected.Strings = (
                      'DESCCUSTAGREG'#9'45'#9'Imposto'#9'F'
                      'ALIQUOTA'#9'10'#9'Alíquota'
                      'BASECALCULO'#9'10'#9'Base'
                      'VLRAGREGADO'#9'10'#9'Valor')
                    IniAttributes.Delimiter = ';;'
                    TitleColor = clBtnFace
                    FixedCols = 0
                    ShowHorzScrollBar = True
                    Align = alTop
                    DataSource = dsAgregItem
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                    TitleAlignment = taCenter
                    TitleFont.Charset = ANSI_CHARSET
                    TitleFont.Color = clBlack
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = [fsBold]
                    TitleLines = 2
                    TitleButtons = False
                    OnExit = dbgrAgregItemExit
                    IndicatorColor = icBlack
                  end
                  object Panel1: TPanel
                    Left = 2
                    Top = 2
                    Width = 591
                    Height = 23
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = 'Agregados do Item'
                    Color = clGray
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Courier New'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 4
                  end
                  object dbedAliqItem: TDBRealEdit
                    Left = 69
                    Top = 124
                    Width = 73
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '      0,00')
                    TabOrder = 1
                    WordWrap = False
                    OnExit = dbedAliqItemExit
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'ALIQUOTA'
                    DataSource = dsAgregItem
                  end
                  object dbedBaseItem: TDBRealEdit
                    Left = 280
                    Top = 124
                    Width = 108
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '      0,00')
                    TabOrder = 2
                    WordWrap = False
                    OnExit = dbedBaseItemExit
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'BASECALCULO'
                    DataSource = dsAgregItem
                  end
                  object dbedValorAgrItem: TDBRealEdit
                    Left = 463
                    Top = 124
                    Width = 108
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '      0,00')
                    TabOrder = 3
                    WordWrap = False
                    OnExit = dbedValorAgrItemExit
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VLRAGREGADO'
                    DataSource = dsAgregItem
                  end
                end
              end
            end
          end
        end
        object tbsImpostosNota: TTabSheet
          Caption = 'TabAgregNota'
          ImageIndex = 1
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 622
            Height = 176
            Align = alClient
            BevelInner = bvLowered
            Caption = 'Panel2'
            TabOrder = 0
            object Label6: TLabel
              Left = 430
              Top = 156
              Width = 34
              Height = 13
              Caption = 'Valor:'
            end
            object Label7: TLabel
              Left = 190
              Top = 156
              Width = 94
              Height = 13
              Caption = 'Base de Cáculo:'
            end
            object Label8: TLabel
              Left = 19
              Top = 156
              Width = 51
              Height = 13
              Caption = 'Aliquota:'
            end
            object dbgrAgregNota: TwwDBGrid
              Left = 2
              Top = 25
              Width = 618
              Height = 117
              Selected.Strings = (
                'DESCCUSTAGREG'#9'45'#9'Imposto'#9'F'
                'ALIQUOTA'#9'10'#9'Aliquota'
                'BASECALCULO'#9'10'#9'Base'
                'VLRAGREGADO'#9'10'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alTop
              DataSource = dsAgregNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnExit = dbgrAgregNotaExit
              IndicatorColor = icBlack
            end
            object Panel3: TPanel
              Left = 2
              Top = 2
              Width = 618
              Height = 23
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Agregados da Nota'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object dbedAliqNota: TDBRealEdit
              Left = 72
              Top = 148
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              OnExit = dbedAliqNotaExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'ALIQUOTA'
              DataSource = dsAgregNota
            end
            object dbedBaseNota: TDBRealEdit
              Left = 283
              Top = 148
              Width = 108
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = dbedBaseNotaExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'BASECALCULO'
              DataSource = dsAgregNota
            end
            object dbedValorAgrNota: TDBRealEdit
              Left = 466
              Top = 148
              Width = 108
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = dbedValorAgrNotaExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRAGREGADO'
              DataSource = dsAgregNota
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 720
      end
      inherited Dock974: TDock97
        Left = 634
        Height = 204
      end
    end
  end
  inherited Dock972: TDock97
    Width = 730
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 730
    inherited tb97Fundo: TToolbar97
      Left = 558
      DockPos = 599
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50066
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 389
      DockPos = 430
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 794
    Top = 7
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
  inherited ds: TwwDataSource
    Left = 511
    Top = 123
  end
  inherited ImlPadrao: TImageList
    Left = 792
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 176
    Top = 31
  end
  inherited Cds: TCMClientDataSet
    Params = <
      item
        DataType = ftFloat
        Name = 'pIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspNota'
    Left = 300
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'NFRECEBDEVOL.NUMNF'
      'NFRECEBDEVOL.COMPLNF'
      'NFRECEBDEVOL.DATAEMISNF'
      'NFRECEBDEVOL.DATAENTDEVOL'
      'NFRECEBDEVOL.VLRNOTAFISCAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor'
      'Número da NF'
      'Complemento'
      'Data de Emissão'
      'Data da Entrada'
      'Valor da Nota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'NFRECEBDEVOL'
      'PESSOA')
    CamposChave.Strings = (
      'NFRECEBDEVOL.IDNFRECEBDEVOL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = NFRECEBDEVOL.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '45'
      '30'
      '10'
      '5'
      '10'
      '10'
      '10')
    Left = 249
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 36
    Top = 122
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsItemNota
    Left = 511
    Top = 110
  end
  object qryNota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      '       N.IDNFRECEBDEVOL,'
      '       N.NUMNF,'
      '       N.COMPLNF,'
      '       N.IDPESSOA,'
      '       N.CODDOCUMENTO,'
      '       N.FLGTIPONOTA,'
      '       N.DATAEMISNF,'
      '       N.IDFORCLI,'
      '       N.DATAENTDEVOL,'
      '       N.VLRNOTAFISCAL,'
      '       N.PLNCODIGO,'
      '       N.IDNFREFERENCIA'
      ' FROM'
      '       NFRECEBDEVOL N'
      '  WHERE'
      '       (N.IDNFRECEBDEVOL = :pIDNF)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 671
    Top = 157
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryNotaIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Origin = 'BASEDADOS.NFRECEBDEVOL.IDNFRECEBDEVOL'
    end
    object qryNotaNUMNF: TFloatField
      FieldName = 'NUMNF'
      Origin = 'BASEDADOS.NFRECEBDEVOL.NUMNF'
    end
    object qryNotaCOMPLNF: TStringField
      FieldName = 'COMPLNF'
      Origin = 'BASEDADOS.NFRECEBDEVOL.COMPLNF'
      Size = 5
    end
    object qryNotaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.NFRECEBDEVOL.IDPESSOA'
    end
    object qryNotaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.NFRECEBDEVOL.CODDOCUMENTO'
    end
    object qryNotaFLGTIPONOTA: TStringField
      FieldName = 'FLGTIPONOTA'
      Origin = 'BASEDADOS.NFRECEBDEVOL.FLGTIPONOTA'
      FixedChar = True
      Size = 1
    end
    object qryNotaDATAEMISNF: TDateTimeField
      FieldName = 'DATAEMISNF'
      Origin = 'BASEDADOS.NFRECEBDEVOL.DATAEMISNF'
    end
    object qryNotaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.NFRECEBDEVOL.IDFORCLI'
    end
    object qryNotaDATAENTDEVOL: TDateTimeField
      FieldName = 'DATAENTDEVOL'
      Origin = 'BASEDADOS.NFRECEBDEVOL.DATAENTDEVOL'
    end
    object qryNotaVLRNOTAFISCAL: TFloatField
      FieldName = 'VLRNOTAFISCAL'
      Origin = 'BASEDADOS.NFRECEBDEVOL.VLRNOTAFISCAL'
    end
    object qryNotaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.NFRECEBDEVOL.PLNCODIGO'
    end
    object qryNotaIDNFREFERENCIA: TFloatField
      FieldName = 'IDNFREFERENCIA'
      Origin = 'BASEDADOS.NFRECEBDEVOL.IDNFREFERENCIA'
    end
  end
  object qryItemNota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.CODFISCAL,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDITEMOC,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,    '#9
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      '      I.IDPRODVARI,'
      '      I.IDRESERVAORCAMEN,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      P.CODFISCALPADRAO,'
      '      P.CONSUMOREVENDA,'
      '      A.CODCOR,'
      '      A.CODTAMANHO,'
      '      0 as QTDETOTAL,'
      '      I.CODMEDIDA AS CODMEDORI,'
      '      '#39'T'#39' AS FLGPARCTOT'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE '
      '        (I.IDNFRECEBDEVOL = :pNUMIDNF)'
      '    AND (I.CODARTIGO = A.CODARTIGO) '
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 670
    Top = 143
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryItemNotaNUMOC: TFloatField
      DisplayLabel = 'O.C.'
      DisplayWidth = 8
      FieldName = 'NUMOC'
    end
    object qryItemNotaCODARTIGO: TStringField
      DisplayLabel = 'Código Item'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryItemNotaDESCPROD: TStringField
      DisplayLabel = 'Descrição do Item'
      DisplayWidth = 30
      FieldName = 'DESCPROD'
      Size = 60
    end
    object qryItemNotaQTDERECEBDEVOL: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDERECEBDEVOL'
      DisplayFormat = '#,####0.0000'
    end
    object qryItemNotaCODMEDIDA: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryItemNotaVLRUNITARIO: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VLRUNITARIO'
      DisplayFormat = '#,####0.0000'
    end
    object qryItemNotaVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qryItemNotaVLRESTOQUE: TFloatField
      DisplayLabel = 'Valor do Estoque'
      DisplayWidth = 10
      FieldName = 'VLRESTOQUE'
    end
    object qryItemNotaCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryItemNotaCODFISCAL: TStringField
      DisplayLabel = 'Código Fiscal'
      DisplayWidth = 4
      FieldName = 'CODFISCAL'
      Size = 4
    end
    object qryItemNotaDATAVALIDADE: TDateTimeField
      DisplayLabel = 'Validade'
      DisplayWidth = 10
      FieldName = 'DATAVALIDADE'
    end
    object qryItemNotaCODALMOXARIFADO: TFloatField
      DisplayLabel = 'Almoxarifado'
      DisplayWidth = 10
      FieldName = 'CODALMOXARIFADO'
    end
    object qryItemNotaCODCENTRORESPON: TStringField
      DisplayLabel = 'C.Respon.'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryItemNotaUNIDNEGOC: TFloatField
      DisplayLabel = 'Atividade'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
    end
    object qryItemNotaCODTIPRECDES: TStringField
      DisplayLabel = 'Tipo Desemb.'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryItemNotaCODCOR: TStringField
      DisplayLabel = 'Cor'
      DisplayWidth = 5
      FieldName = 'CODCOR'
      Size = 5
    end
    object qryItemNotaCODTAMANHO: TStringField
      DisplayLabel = 'Tam.'
      DisplayWidth = 3
      FieldName = 'CODTAMANHO'
      Size = 3
    end
    object qryItemNotaIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Visible = False
    end
    object qryItemNotaIDMOV: TFloatField
      FieldName = 'IDMOV'
      Visible = False
    end
    object qryItemNotaIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryItemNotaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryItemNotaIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Visible = False
    end
    object qryItemNotaFLGDESTINO: TStringField
      FieldName = 'FLGDESTINO'
      Visible = False
      Size = 1
    end
    object qryItemNotaRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryItemNotaIDPRODVARI: TFloatField
      FieldName = 'IDPRODVARI'
      Visible = False
    end
    object qryItemNotaCODFISCALPADRAO: TStringField
      FieldName = 'CODFISCALPADRAO'
      Visible = False
      Size = 2
    end
    object qryItemNotaCONSUMOREVENDA: TStringField
      FieldName = 'CONSUMOREVENDA'
      Visible = False
      Size = 1
    end
    object qryItemNotaIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Visible = False
    end
    object qryItemNotaIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Visible = False
    end
    object qryItemNotaQTDETOTAL: TFloatField
      FieldName = 'QTDETOTAL'
      Visible = False
      DisplayFormat = '#,####0.0000'
    end
    object qryItemNotaCODMEDORI: TStringField
      FieldName = 'CODMEDORI'
      Visible = False
      Size = 4
    end
    object qryItemNotaFLGPARCTOT: TStringField
      FieldName = 'FLGPARCTOT'
      Visible = False
      Size = 1
    end
  end
  object dspNota: TDataSetProvider
    DataSet = qryNota
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 158
  end
  object dspItemNota: TDataSetProvider
    DataSet = qryItemNota
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 144
  end
  object cdsItemNota: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspItemNota'
    Left = 420
    Top = 118
  end
  object qryArtigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        A.CODARTIGO,'
      '        P.DESCPROD,'
      '        P.CODFISCALPADRAO,'
      '        P.CONSUMOREVENDA,'
      '        P.LOTEVALIDADE,'
      '        P.FLGVARIAVEL,'
      '        P.ITEMESTOCAVEL,'
      '        G.CODTIPRECDES,'
      '        G.RECPAG,'
      '        G.IDPESSOA'
      'FROM'
      '       ARTIGO A,'
      '       PRODUTO P,'
      '       GRUPPROD G'
      'WHERE'
      
        '     (((A.FLGBLOQUEADO <> '#39'C'#39')  AND (A.FLGBLOQUEADO <> '#39'A'#39')) OR ' +
        '(A.FLGBLOQUEADO IS NULL))  '
      ' AND (A.CODPRODUTO = P.CODPRODUTO )'
      ' AND (P.CODGRUPOPROD = G.CODGRUPOPROD)'
      ' ORDER BY'
      '        P.DESCPROD'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 668
    Top = 129
    object qryArtigoCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryArtigoDESCPROD: TStringField
      FieldName = 'DESCPROD'
      Size = 40
    end
    object qryArtigoCODFISCALPADRAO: TStringField
      FieldName = 'CODFISCALPADRAO'
      Size = 2
    end
    object qryArtigoCONSUMOREVENDA: TStringField
      FieldName = 'CONSUMOREVENDA'
      Size = 1
    end
    object qryArtigoLOTEVALIDADE: TStringField
      FieldName = 'LOTEVALIDADE'
      Size = 1
    end
    object qryArtigoFLGVARIAVEL: TStringField
      FieldName = 'FLGVARIAVEL'
      Size = 1
    end
    object qryArtigoCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryArtigoRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryArtigoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryArtigoITEMESTOCAVEL: TStringField
      FieldName = 'ITEMESTOCAVEL'
      Origin = 'BASEDADOS.PRODUTO.ITEMESTOCAVEL'
      FixedChar = True
      Size = 1
    end
  end
  object dspArtigo: TDataSetProvider
    DataSet = qryArtigo
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 130
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspArtigo'
    Left = 420
    Top = 104
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT U.CODMEDIDA,U.DescMedida,C.FATOR '
      'FROM '
      '   CONVER C, '
      '   UnMedida U '
      'WHERE '
      '   rtrim(C.CodProduto) = rtrim(:pCodProd)'
      '   and( u.CodMedida = c.CodMedida )')
    ValidateWithMask = True
    Left = 667
    Top = 117
    ParamData = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    object qryUnidMedCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      FixedChar = True
      Size = 4
    end
    object qryUnidMedDESCMEDIDA: TStringField
      FieldName = 'DESCMEDIDA'
      Size = 25
    end
    object qryUnidMedFATOR: TFloatField
      FieldName = 'FATOR'
    end
  end
  object dspUnidMed: TDataSetProvider
    DataSet = qryUnidMed
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 117
  end
  object cdsUnidMed: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCodProd'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspUnidMed'
    Left = 420
    Top = 90
  end
  object dsAgregNota: TwwDataSource
    DataSet = cdsAgregNota
    Left = 510
    Top = 96
  end
  object qryAgregNota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRNFRECDEV,'
      '         A.IDNFRECEBDEVOL,'
      '         A.IDNFCOMPLEMENTAR,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO,'
      '         A.VLRRECUPERADO  '
      'FROM'
      '         TIPOAGRE T,'
      '         AGRNFRECDEV A'
      'WHERE'
      '            (T.FLGINCIDERECEB = '#39'S'#39')'
      '           AND (T.TOTALITEM = '#39'T'#39')'
      '           AND (T.CODTRATFISCE < '#39'8'#39' )'
      '           AND (A.IDNFRECEBDEVOL(+) = :iAgregNota)'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG(+))')
    ValidateWithMask = True
    Left = 667
    Top = 103
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregNota'
        ParamType = ptUnknown
      end>
    object qryAgregNotaDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 21
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object qryAgregNotaALIQUOTA: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNotaBASECALCULO: TFloatField
      DisplayLabel = 'Base de Cálculo'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNotaVLRAGREGADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAGREGADO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregNotaCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryAgregNotaCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Visible = False
      Size = 1
    end
    object qryAgregNotaPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Visible = False
      Size = 1
    end
    object qryAgregNotaIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Visible = False
    end
    object qryAgregNotaIDNFCOMPLEMENTAR: TFloatField
      FieldName = 'IDNFCOMPLEMENTAR'
      Visible = False
    end
    object qryAgregNotaIDAGRNFRECDEV: TFloatField
      FieldName = 'IDAGRNFRECDEV'
      Visible = False
    end
    object qryAgregNotaVLRRECUPERADO: TFloatField
      FieldName = 'VLRRECUPERADO'
      Visible = False
    end
  end
  object dsAgregItem: TwwDataSource
    DataSet = cdsAgregItem
    Left = 509
    Top = 82
  end
  object qryAgregItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         T.FLGBASE,'
      '         A.IDAGRITENSRECDEV,'
      '         A.IDITENSRECDEV,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO,'
      '         A.VLRRECUPERADO,'
      '         (0)  as ACUMBASE'
      'FROM'
      '         TIPOAGRE T,'
      '         AGRITENSRECDEV A'
      'WHERE'
      '               (T.FLGINCIDERECEB = '#39'S'#39')'
      '           AND (T.TOTALITEM = '#39'I'#39')'
      '           AND (T.CODTRATFISCE < '#39'8'#39' )'
      '           AND ( A.IDITENSRECDEV(+) = :iAgregItem)'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG(+))'
      'ORDER BY T.FLGBASE DESC, T.DESCCUSTAGREG')
    ValidateWithMask = True
    Left = 667
    Top = 89
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregItem'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryAgregItemDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 21
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object qryAgregItemALIQUOTA: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
    end
    object qryAgregItemBASECALCULO: TFloatField
      DisplayLabel = 'Base de Cálculo'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
    end
    object qryAgregItemVLRAGREGADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAGREGADO'
    end
    object qryAgregItemCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryAgregItemCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Visible = False
      Size = 1
    end
    object qryAgregItemPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Visible = False
      Size = 1
    end
    object qryAgregItemIDAGRITENSRECDEV: TFloatField
      FieldName = 'IDAGRITENSRECDEV'
      Visible = False
    end
    object qryAgregItemIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Visible = False
    end
    object qryAgregItemVLRRECUPERADO: TFloatField
      FieldName = 'VLRRECUPERADO'
      Visible = False
    end
    object qryAgregItemACUMBASE: TFloatField
      FieldName = 'ACUMBASE'
      Visible = False
    end
    object qryAgregItemFLGBASE: TStringField
      FieldName = 'FLGBASE'
      Visible = False
      Size = 1
    end
  end
  object cdsAgregNota: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'iAgregNota'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAgregNota'
    Left = 420
    Top = 77
  end
  object cdsAgregItem: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'iAgregItem'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspAgregItem'
    Left = 420
    Top = 64
  end
  object dspAgregNota: TDataSetProvider
    DataSet = qryAgregNota
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 104
  end
  object dspAgregItem: TDataSetProvider
    DataSet = qryAgregItem
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 91
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
    ProviderName = 'DspCentroCusto'
    Left = 419
    Top = 50
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '          NOME,'
      '          CODCENTROCUSTO  '
      'FROM '
      '         CENTCUST '
      'WHERE '
      '         (IDEMPRESA = :IDEMPRESA)'
      '     AND (STATUSGRUPOCDC = '#39'A'#39')'
      '     AND (ATIVO = '#39'S'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    OnFilterOptions = []
    Left = 666
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
  end
  object dspCentroCusto: TDataSetProvider
    DataSet = qryCentroCusto
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 579
    Top = 78
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODALMOXARIFADO,'
      '    DESCALMOX,'
      '   CODCENTROCUSTO,'
      '   CODCUSTEIO '
      'FROM'
      '    ALMOX '
      'WHERE'
      '      (PRINCIPSECUND = '#39'P'#39')'
      '  AND (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCALMOX'
      ' ')
    ValidateWithMask = True
    Left = 666
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAlmoxCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'BASEDADOS.ALMOX.CODALMOXARIFADO'
    end
    object qryAlmoxDESCALMOX: TStringField
      FieldName = 'DESCALMOX'
      Origin = 'BASEDADOS.ALMOX.DESCALMOX'
      FixedChar = True
      Size = 40
    end
    object qryAlmoxCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.ALMOX.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryAlmoxCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
      Origin = 'BASEDADOS.ALMOX.CODCUSTEIO'
    end
  end
  object dspAlmox: TDataSetProvider
    DataSet = qryAlmox
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 64
  end
  object cdsAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAlmox'
    Left = 419
    Top = 36
  end
  object qryClasFisc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        ' SELECT CODFISCAL,DESCCLASSIFISCAL FROM CLASFISC ORDER BY CODFIS' +
        'CAL ')
    PictureMasks.Strings = (
      'CODFISCAL'#9'0.00-0;0;_'#9'T'#9'T')
    ValidateWithMask = True
    Left = 666
    Top = 48
    object qryClasFiscCODFISCAL: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 4
      FieldName = 'CODFISCAL'
      Origin = 'CLASFISC.CODFISCAL'
      EditMask = '0.00-0;0;_'
      Size = 4
    end
    object qryClasFiscDESCCLASSIFISCAL: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCCLASSIFISCAL'
      Origin = 'CLASFISC.DESCCLASSIFISCAL'
      Size = 50
    end
  end
  object dspClasFisc: TDataSetProvider
    DataSet = qryClasFisc
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 580
    Top = 51
  end
  object cdsClasFisc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClasFisc'
    Left = 419
    Top = 22
  end
  object qryAgregItemDef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         A.CODTIPOCUSTAGREG,'
      '        T.CODTRATFISCE,'
      '         A.IDAGRITENSRECDEV,'
      '         A.IDITENSRECDEV,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO,'
      '         A.VLRRECUPERADO '
      'FROM'
      '         AGRITENSRECDEV A,'
      '         TIPOAGRE T,'
      '         ITENSRECEBDEVOL I'
      'WHERE'
      '          (I.IDNFRECEBDEVOL = :iAgregItem)'
      '          AND (A.IDITENSRECDEV = I.IDITENSRECDEV)'
      '          AND (A.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)')
    ValidateWithMask = True
    Left = 666
    Top = 36
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregItem'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object dspAgregItemDef: TDataSetProvider
    DataSet = qryAgregItemDef
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 579
    Top = 38
  end
  object cdsAgregItemDef: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'iAgregItem'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspAgregItemDef'
    Left = 419
    Top = 8
  end
end
