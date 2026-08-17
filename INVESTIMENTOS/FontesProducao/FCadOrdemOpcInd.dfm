inherited frmCadOrdemOpcInd: TfrmCadOrdemOpcInd
  Left = 351
  Top = 270
  HelpContext = 790311
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro'
  ClientHeight = 434
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 47
    Width = 640
    Height = 348
    inherited bvlSepTit: TBevel
      Width = 638
    end
    inherited pnlTitulo: TPanel
      Width = 638
      inherited lbNomDescricao: TfcLabel
        Width = 286
        Caption = 'Ordens de Opções de Índice'
      end
    end
    object pnlMestre: TPanel
      Left = 1
      Top = 45
      Width = 638
      Height = 51
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object lblCorretora: TLabel
        Left = 135
        Top = 4
        Width = 103
        Height = 13
        Caption = 'Sigla da Corretora'
      end
      object lblDtOperacao: TLabel
        Left = 16
        Top = 3
        Width = 105
        Height = 13
        Caption = 'Data da Operação'
      end
      object Label1: TLabel
        Left = 471
        Top = 3
        Width = 105
        Height = 13
        Caption = 'Nº do Documento:'
      end
      object dbDocumento: TEdit
        Left = 471
        Top = 20
        Width = 141
        Height = 21
        TabOrder = 2
      end
      object dbdDataOperacao: TCMDateTimePicker
        Left = 16
        Top = 20
        Width = 107
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
        TabOrder = 0
        DisplayFormat = 'dd/mm/yyyy'
        OnExit = dbdDataOperacaoExit
      end
      object dblkCorretora: TwwDBLookupCombo
        Left = 135
        Top = 20
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCORRETVALORES'#9'30'#9'Descrição'#9'F')
        LookupTable = QryCorretValores
        LookupField = 'IDCORRETVALORES'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblkCorretoraExit
      end
    end
    object pnlDetalhe: TPanel
      Left = 1
      Top = 96
      Width = 638
      Height = 251
      Align = alClient
      TabOrder = 2
      object pgctrlDetalhe: TPageControl
        Left = 1
        Top = 1
        Width = 636
        Height = 249
        ActivePage = tbsCesta
        Align = alClient
        TabOrder = 0
        OnChange = pgctrlDetalheChange
        object tbsOrdem: TTabSheet
          Caption = 'Operações'
          object dbgOrdem: TwwDBGrid
            Left = 0
            Top = 31
            Width = 628
            Height = 190
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'25'#9'Investimento'#9'F'
              'DESCTIPOOPERACAO'#9'43'#9'Tipo de Operação'#9'F'
              'QUANTIDADE'#9'12'#9'Quantidade'#9'F'
              'PREMIO'#9'12'#9'Prêmio'#9'F'
              'VALOR'#9'14'#9'Valor'#9'F'
              'CARTEIRA'#9'28'#9'Carteira'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsOrdem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 2
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgOrdemDblClick
            IndicatorColor = icBlack
          end
          object pnlControlesDet: TPanel
            Left = 0
            Top = 31
            Width = 628
            Height = 190
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object pnlDadosDet: TPanel
              Left = 1
              Top = 1
              Width = 536
              Height = 188
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object pgcOrdemDet: TPageControl
                Left = 0
                Top = 0
                Width = 536
                Height = 188
                ActivePage = tbsOrdemDados
                Align = alClient
                MultiLine = True
                TabOrder = 0
                TabPosition = tpRight
                object tbsOrdemDados: TTabSheet
                  Caption = 'Dados'
                  object Label4: TLabel
                    Left = 21
                    Top = 2
                    Width = 45
                    Height = 13
                    Caption = 'Carteira'
                  end
                  object lblOpcao: TLabel
                    Left = 21
                    Top = 82
                    Width = 38
                    Height = 13
                    Caption = 'Opção'
                  end
                  object lblQtdOper: TLabel
                    Left = 21
                    Top = 122
                    Width = 66
                    Height = 13
                    Caption = 'Quantidade'
                  end
                  object lblPremio: TLabel
                    Left = 184
                    Top = 122
                    Width = 39
                    Height = 13
                    Caption = 'Prêmio'
                  end
                  object lblVlrOper: TLabel
                    Left = 345
                    Top = 122
                    Width = 30
                    Height = 13
                    Caption = 'Valor'
                  end
                  object Label3: TLabel
                    Left = 21
                    Top = 41
                    Width = 56
                    Height = 13
                    Caption = 'Operação'
                  end
                  object Label5: TLabel
                    Left = 344
                    Top = 82
                    Width = 26
                    Height = 13
                    Caption = 'Lote'
                  end
                  object dblkOpcao: TwwDBLookupCombo
                    Left = 21
                    Top = 98
                    Width = 316
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F')
                    DataField = 'IDINVESTIMENTO'
                    DataSource = dsOrdem
                    LookupTable = qryOpcao
                    LookupField = 'IDINVESTIMENTO'
                    Options = [loColLines, loRowLines, loTitles]
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbreQtdOper: TDBRealEdit
                    Left = 21
                    Top = 137
                    Width = 153
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 4
                    WordWrap = False
                    OnExit = dbreQtdOperExit
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'QUANTIDADE'
                    DataSource = dsOrdem
                  end
                  object dbrePremio: TDBRealEdit
                    Left = 183
                    Top = 137
                    Width = 153
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 5
                    WordWrap = False
                    OnExit = dbrePremioExit
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'PREMIO'
                    DataSource = dsOrdem
                  end
                  object dbreVlrOper: TDBRealEdit
                    Left = 344
                    Top = 137
                    Width = 153
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,00')
                    TabOrder = 6
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VALOR'
                    DataSource = dsOrdem
                  end
                  object dblkTipoOperacao: TwwDBLookupCombo
                    Left = 21
                    Top = 58
                    Width = 478
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCTIPOOPERACAO'#9'40'#9'Descrição'#9'F')
                    DataField = 'IDTIPOOPERACAO'
                    DataSource = dsOrdem
                    LookupTable = qryTipoOperacao
                    LookupField = 'IDTIPOOPERACAO'
                    Options = [loColLines, loRowLines, loTitles]
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                    OnEnter = dblkTipoOperacaoEnter
                    OnExit = dblkTipoOperacaoExit
                  end
                  object dblkCarteiraOrdem: TwwDBLookupCombo
                    Left = 21
                    Top = 16
                    Width = 478
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'CARTEIRA'#9'40'#9'Descrição'#9'F')
                    DataField = 'IDCARTEIRAINVEST'
                    DataSource = dsOrdem
                    LookupTable = qryCarteiraOrdem
                    LookupField = 'IDCARTEIRAINVEST'
                    Options = [loRowLines, loTitles]
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object dbeLote: TwwDBEdit
                    Left = 344
                    Top = 98
                    Width = 153
                    Height = 21
                    DataField = 'IDLOTE'
                    DataSource = dsOrdem
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object tbsOrdemObs: TTabSheet
                  Caption = 'Observação'
                  ImageIndex = 1
                  object dbmObs: TDBMemo
                    Left = 0
                    Top = 0
                    Width = 511
                    Height = 178
                    Align = alClient
                    DataField = 'OBSERVACAO'
                    DataSource = dsOrdem
                    TabOrder = 0
                  end
                end
              end
            end
            object Dock975: TDock97
              Left = 537
              Top = 1
              Width = 90
              Height = 188
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object tb97Detalhe: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object bbtnOkOrdem: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  TabOrder = 0
                  OnClick = bbtnOkOrdemClick
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
                object bbtnCancelarOrdem: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = bbtnCancelarOrdemClick
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
                object bbtnVoltarOrdem: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = bbtnCancelarOrdemClick
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
          object Dock973: TDock97
            Left = 0
            Top = 0
            Width = 628
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object tb97BotoesDetalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object sbtnInsOrdem: TToolbarButton97
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Inserir'
                AllowAllUp = True
                GroupIndex = 2
                ImageIndex = 0
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnInsOrdemClick
              end
              object sbtnAltOrdem: TToolbarButton97
                Left = 25
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                ImageIndex = 1
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAltOrdemClick
              end
              object sbtnExcluiOrdem: TToolbarButton97
                Left = 50
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Excluir'
                AllowAllUp = True
                ImageIndex = 2
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnExcluiOrdemClick
              end
              object sbtnConsOrdem: TToolbarButton97
                Left = 75
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Consulta'
                AllowAllUp = True
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  1000030000000002000000000000000000000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
                  1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
                  1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
                  1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
                  00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
                  FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
                  FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
                  104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
                  1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
                ImageIndex = 3
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnConsOrdemClick
              end
            end
          end
        end
        object tbsCesta: TTabSheet
          Caption = 'Cesta'
          ImageIndex = 1
          object dbgCesta: TwwDBGrid
            Left = 0
            Top = 31
            Width = 628
            Height = 190
            Selected.Strings = (
              'DATAVIGENCIA'#9'10'#9'Vigência'#9'F'
              'DESCINVESTIMENTO'#9'41'#9'Investimento'#9'F'
              'QUANTIDADE'#9'15'#9'Quantidade'#9'F'
              'COTACAO'#9'10'#9'Cotação'#9'F'
              'VALOR'#9'15'#9'Valor'#9'F'
              'SGLCUSTODIANTE'#9'16'#9'Custodiante'#9'F'
              'CARTEIRA'#9'40'#9'Carteira'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCesta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 2
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgCestaDblClick
            IndicatorColor = icBlack
          end
          object pnlControlesCesta: TPanel
            Left = 0
            Top = 31
            Width = 628
            Height = 190
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object pnlDadosCesta: TPanel
              Left = 1
              Top = 1
              Width = 536
              Height = 188
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvNone
              TabOrder = 1
              object lblCarteira: TLabel
                Left = 26
                Top = 18
                Width = 45
                Height = 13
                Caption = 'Carteira'
              end
              object lblCustodiante: TLabel
                Left = 26
                Top = 65
                Width = 68
                Height = 13
                Caption = 'Custodiante'
              end
              object Label2: TLabel
                Left = 26
                Top = 109
                Width = 30
                Height = 13
                Caption = 'Ação'
              end
              object Label6: TLabel
                Left = 352
                Top = 18
                Width = 66
                Height = 13
                Caption = 'Quantidade'
              end
              object lblCotacao: TLabel
                Left = 352
                Top = 65
                Width = 96
                Height = 13
                Caption = 'Cotação Unitária'
              end
              object Label8: TLabel
                Left = 352
                Top = 109
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object dblkCarteiraCesta: TwwDBLookupCombo
                Left = 26
                Top = 33
                Width = 292
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CARTEIRA'#9'40'#9'Carteira'#9'F')
                DataField = 'IDCARTEIRAINVEST'
                DataSource = dsCesta
                LookupTable = qryCarteiraCesta
                LookupField = 'IDCARTEIRAINVEST'
                Options = [loColLines, loRowLines, loTitles]
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnEnter = dblkCarteiraCestaEnter
                OnExit = dblkCarteiraCestaExit
              end
              object dblkCustodianteCesta: TwwDBLookupCombo
                Left = 26
                Top = 80
                Width = 292
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'SGLCUSTODIANTE'#9'10'#9'Custodiante'#9'F')
                DataField = 'IDCUSTODIANTE'
                DataSource = dsCesta
                LookupTable = qryCustodianteCesta
                LookupField = 'IDCUSTODIANTE'
                Options = [loColLines, loRowLines, loTitles]
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnEnter = dblkCustodianteCestaEnter
                OnExit = dblkCustodianteCestaExit
              end
              object dblkAcao: TwwDBLookupCombo
                Left = 26
                Top = 125
                Width = 292
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F')
                DataField = 'IDINVESTIMENTO'
                DataSource = dsCesta
                LookupTable = qryAcaoCesta
                LookupField = 'IDINVESTIMENTO'
                Options = [loColLines, loRowLines, loTitles]
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnEnter = dblkAcaoEnter
                OnExit = dblkAcaoExit
              end
              object dbreQtdCesta: TDBRealEdit
                Left = 352
                Top = 33
                Width = 153
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 3
                WordWrap = False
                OnExit = dbreQtdCestaExit
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'QUANTIDADE'
                DataSource = dsCesta
              end
              object dbreVlrCesta: TDBRealEdit
                Left = 352
                Top = 125
                Width = 153
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 5
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALOR'
                DataSource = dsCesta
              end
              object dbreCotacao: TDBRealEdit
                Left = 352
                Top = 80
                Width = 153
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,000000')
                TabOrder = 4
                WordWrap = False
                OnExit = dbreCotacaoExit
                IntDigits = 19
                DecDigits = 6
                NumberFormat = fNumber
                Signal = False
                DataField = 'COTACAO'
                DataSource = dsCesta
              end
            end
            object Dock976: TDock97
              Left = 537
              Top = 1
              Width = 90
              Height = 188
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object Toolbar973: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object bbtnOkCesta: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  TabOrder = 0
                  OnClick = bbtnOkCestaClick
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
                object bbtnCancelarCesta: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = bbtnCancelarCestaClick
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
                object bbtnVoltarCesta: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = bbtnCancelarCestaClick
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
          object Dock974: TDock97
            Left = 0
            Top = 0
            Width = 628
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar972: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object sbtnInsCesta: TToolbarButton97
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Inserir'
                AllowAllUp = True
                GroupIndex = 2
                ImageIndex = 0
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnInsCestaClick
              end
              object sbtnAltCesta: TToolbarButton97
                Left = 25
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                ImageIndex = 1
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAltCestaClick
              end
              object sbtnExcluiCesta: TToolbarButton97
                Left = 50
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Excluir'
                AllowAllUp = True
                ImageIndex = 2
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnExcluiCestaClick
              end
              object sbtnConsCesta: TToolbarButton97
                Left = 75
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Excluir'
                AllowAllUp = True
                ImageIndex = 3
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnConsCestaClick
              end
            end
            object Toolbar974: TToolbar97
              Left = 112
              Top = 0
              Caption = 'Toolbar974'
              DockMode = dmCannotFloat
              DockPos = 129
              TabOrder = 1
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 510
                Height = 25
                Align = alBottom
                BevelOuter = bvLowered
                TabOrder = 0
                object lblValTotCesta: TfcLabel
                  Left = 414
                  Top = 1
                  Width = 84
                  Height = 23
                  Align = alRight
                  Caption = '1.000.000,00'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TextOptions.Alignment = taRightJustify
                  TextOptions.Style = fclsLowered
                  TextOptions.VAlignment = vaVCenter
                end
                object fcLabel1: TfcLabel
                  Left = 1
                  Top = 1
                  Width = 60
                  Height = 23
                  Align = alLeft
                  AutoSize = False
                  Caption = '  Mínimo:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.VAlignment = vaVCenter
                  TextOptions.WordWrap = True
                  Visible = False
                end
                object lblValMinCesta: TfcLabel
                  Left = 61
                  Top = 1
                  Width = 84
                  Height = 23
                  Align = alLeft
                  Caption = '1.000.000,00'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Style = fclsLowered
                  TextOptions.VAlignment = vaVCenter
                  Visible = False
                end
                object fcLabel3: TfcLabel
                  Left = 145
                  Top = 1
                  Width = 93
                  Height = 23
                  Align = alLeft
                  AutoSize = False
                  Caption = '          Máximo:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.VAlignment = vaVCenter
                  Visible = False
                end
                object lblValMaxCesta: TfcLabel
                  Left = 238
                  Top = 1
                  Width = 84
                  Height = 23
                  Align = alLeft
                  Caption = '1.000.000,00'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.Style = fclsLowered
                  TextOptions.VAlignment = vaVCenter
                  Visible = False
                end
                object fcLabel2: TfcLabel
                  Left = 340
                  Top = 1
                  Width = 74
                  Height = 23
                  Align = alRight
                  AutoSize = False
                  Caption = '  Valor Atual: '
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TextOptions.Alignment = taLeftJustify
                  TextOptions.VAlignment = vaVCenter
                end
                object pnlEspacador: TPanel
                  Left = 498
                  Top = 1
                  Width = 11
                  Height = 23
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 640
    inherited tb97Fundo: TToolbar97
      Left = 468
      DockPos = 1149
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 299
      DockPos = 980
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    inline fraMensOpcInd: TfraMensagem
      Top = -1
      Width = 377
      Height = 39
      Align = alClient
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 377
        Height = 39
        inherited pnlProgressoMensagem: TPanel
          Width = 208
          Height = 37
          inherited lblProgressoMensagem: TfcLabel
            Width = 206
            Height = 35
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 209
          Width = 167
          Height = 37
          inherited pgbProcesso: TProgressBar
            Width = 165
            Height = 35
          end
        end
      end
    end
  end
  object Dock972: TDock97 [2]
    Left = 0
    Top = 0
    Width = 640
    Height = 47
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BackgroundTransparent = True
    BoundLines = [blTop, blBottom]
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 0
      TabOrder = 0
      object sbtnInserir: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownArrow = False
        Caption = '&Inserir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        ImageIndex = 0
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnInserirClick
      end
      object sbtnAlterar: TToolbarButton97
        Left = 60
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Alterar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        ImageIndex = 1
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnAlterarClick
      end
      object sbtnProcurar: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarClick
      end
      object sbtnApagar: TToolbarButton97
        Left = 120
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Excluir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        ImageIndex = 2
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
      end
      object sbtnBuscaSaldos: TToolbarButton97
        Left = 240
        Top = 0
        Width = 90
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Saldos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnBuscaSaldosClick
      end
      object sbtnMontaCesta: TToolbarButton97
        Left = 330
        Top = 0
        Width = 90
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Monta Cesta'
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777000000007777777888888888077777780F708708077777780F7087080
          77777780F708708077777788FF88708077777780F70870807777778FFF777880
          7777700F0000000007777087F8888888077777008F0000007777777708888077
          777777777700777777777777777777777777}
        ImageIndex = 9
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
      end
      object sbtnMovimento: TToolbarButton97
        Left = 420
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Movimento'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnMovimentoClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 579
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object ImlPadrao: TImageList
    Left = 537
    Top = 3
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF000000000000000000848484000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF000000000000000000848484000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF000000000000000000848484000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0084848400848484000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF000000000000000000848484000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFE01F00000000FFFFC00F00000000FFFFC48F00000000FFFFC48F00000000
      E007C48F00000000F00FC08F00000000F81FC48F00000000FC3FC38F00000000
      FE7F800700000000FFFF900700000000FFFFC00F00000000FFFFF03F00000000
      FFFFFCFF00000000FFFFFFFF00000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Boletas de Opção de Índice'
    Colunas.Strings = (
      'ORDEMOPCIND.DATAORDEM'
      'ORDEMOPCIND.IDBOLETA'
      'CORRETVALORES.SGLCORRETVALORES'
      'INVESTIMENTO.DESCINVESTIMENTO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data da ordem'
      'Boleta'
      'Corretora'
      'Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORDEMOPCIND'
      'INVESTIMENTO'
      'CORRETVALORES')
    CamposChave.Strings = (
      'ORDEMOPCIND.DATAORDEM'
      'CORRETVALORES.SGLCORRETVALORES'
      'ORDEMOPCIND.IDBOLETA')
    Filtro.Strings = (
      'ORDEMOPCIND.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'ORDEMOPCIND.IDCORRETVALORES = CORRETVALORES.IDCORRETVALORES')
    Mascaras.Strings = (
      'dd/mm/yyyy'
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '30'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 507
    Top = 3
  end
  object qryOrdem: TwwQuery
    CachedUpdates = True
    AfterOpen = qryOrdemAfterOpen
    AfterPost = qryOrdemAfterPost
    AfterScroll = qryOrdemAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OD.IDORDEMOPCIND, OD.DATAORDEM, OD.IDCORRETVALORES, OD.ID' +
        'BOLETA, OD.IDINVESTIMENTO,'
      
        '       OD.IDTIPOOPERACAO, OD.IDTIPOINVEST, OD.QUANTIDADE, OD.PRE' +
        'MIO, OD.VALOR, OD.OBSERVACAO,'
      
        '       OD.STATUS, OD.IDUSUARIO, OD.IDPLANPREVCTBPATR, OD.STACONF' +
        'IRMA, OD.STAAUTORIZA,'
      
        '       OD.IDCESTAOPCIND, OD.IDCARTEIRAGERENC, OD.IDCARTEIRAINVES' +
        'T, OD.IDLOTE, '
      
        '       IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO, CV.SGLCORRETVAL' +
        'ORES, CI.DESCCARTINVEST,'
      
        '       DECODE(NVL(OD.IDCARTEIRAGERENC,0),0, CI.DESCCARTINVEST, C' +
        'G.DESCCARTGERENC) AS CARTEIRA'
      
        'FROM ORDEMOPCIND OD, INVESTIMENTO IV, CORRETVALORES CV, TIPOOPER' +
        'ACAO TP,'
      '     CARTEIRAINVEST CI, CARTEIRAGERENC CG'
      'WHERE OD.DATAORDEM = TO_DATE(:DATAORDEM,'#39'DD/MM/YYYY'#39')'
      
        '  AND (((:IDCORRETVALORES IS NOT NULL) AND (OD.IDCORRETVALORES =' +
        ' :IDCORRETVALORES)) OR'
      '        (:IDCORRETVALORES IS NULL))'
      '  AND (OD.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (OD.IDCORRETVALORES = CV.IDCORRETVALORES)'
      '  AND (OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '  AND (OD.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST(+))'
      '  AND (OD.IDCARTEIRAGERENC = CG.IDCARTEIRAGERENC(+))'
      'ORDER BY OD.IDLOTE, OD.IDORDEMOPCIND'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updOrdem
    ValidateWithMask = True
    Left = 142
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end>
    object qryOrdemDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrdemDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 43
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOrdemQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 12
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,##0.'
    end
    object qryOrdemPREMIO: TFloatField
      DisplayLabel = 'Prêmio'
      DisplayWidth = 12
      FieldName = 'PREMIO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrdemVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOrdemCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 28
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryOrdemDATAORDEM: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAORDEM'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrdemIDBOLETA: TStringField
      DisplayWidth = 30
      FieldName = 'IDBOLETA'
      Visible = False
      Size = 30
    end
    object qryOrdemIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryOrdemIDORDEMOPCIND: TFloatField
      FieldName = 'IDORDEMOPCIND'
      Visible = False
    end
    object qryOrdemIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Visible = False
    end
    object qryOrdemIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryOrdemIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryOrdemOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryOrdemSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrdemIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object qryOrdemIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryOrdemSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrdemSTAAUTORIZA: TStringField
      FieldName = 'STAAUTORIZA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrdemIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
    object qryOrdemIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryOrdemSGLCORRETVALORES: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Visible = False
      Size = 10
    end
    object qryOrdemDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object qryOrdemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryOrdemIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
  end
  object dsOrdem: TwwDataSource
    AutoEdit = False
    DataSet = qryOrdem
    Left = 202
    Top = 136
  end
  object updOrdem: TUpdateSQL
    ModifySQL.Strings = (
      'update ORDEMOPCIND'
      'set'
      '  DATAORDEM = :DATAORDEM,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDBOLETA = :IDBOLETA,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  PREMIO = :PREMIO,'
      '  VALOR = :VALOR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  STATUS = :STATUS,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  STAAUTORIZA = :STAAUTORIZA,'
      '  IDCESTAOPCIND = :IDCESTAOPCIND,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDLOTE = :IDLOTE'
      'where'
      '  IDORDEMOPCIND = :OLD_IDORDEMOPCIND')
    InsertSQL.Strings = (
      'insert into ORDEMOPCIND'
      '  (IDORDEMOPCIND, DATAORDEM, IDCORRETVALORES, IDBOLETA, '
      'IDINVESTIMENTO, '
      '   IDTIPOOPERACAO, IDTIPOINVEST, QUANTIDADE, PREMIO, VALOR, '
      'OBSERVACAO, '
      
        '   STATUS, IDUSUARIO, IDPLANPREVCTBPATR, STACONFIRMA, STAAUTORIZ' +
        'A, '
      'IDCESTAOPCIND, '
      '   IDCARTEIRAGERENC, IDCARTEIRAINVEST, IDLOTE)'
      'values'
      '  (:IDORDEMOPCIND, :DATAORDEM, :IDCORRETVALORES, :IDBOLETA, '
      ':IDINVESTIMENTO, '
      
        '   :IDTIPOOPERACAO, :IDTIPOINVEST, :QUANTIDADE, :PREMIO, :VALOR,' +
        ' '
      ':OBSERVACAO, '
      '   :STATUS, :IDUSUARIO, :IDPLANPREVCTBPATR, :STACONFIRMA, '
      ':STAAUTORIZA, '
      
        '   :IDCESTAOPCIND, :IDCARTEIRAGERENC, :IDCARTEIRAINVEST, :IDLOTE' +
        ')')
    DeleteSQL.Strings = (
      'delete from ORDEMOPCIND'
      'where'
      '  IDORDEMOPCIND = :OLD_IDORDEMOPCIND')
    Left = 174
    Top = 136
  end
  object qryCesta: TwwQuery
    CachedUpdates = True
    AfterOpen = qryCestaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CO.IDCESTAOPCIND, CO.DATAVIGENCIA, CO.IDINVESTIMENTO, CO.' +
        'QUANTIDADE, CO.COTACAO, CO.VALOR,'
      
        '       CO.IDCUSTODIANTE, CO.IDCARTEIRAINVEST, CO.IDCARTEIRAGEREN' +
        'C,'
      '       IV.DESCINVESTIMENTO, CU.SGLCUSTODIANTE,'
      
        '       DECODE(NVL(CO.IDCARTEIRAGERENC, 0), 0, CA.DESCCARTINVEST,' +
        ' CG.DESCCARTGERENC) AS CARTEIRA'
      
        'FROM CESTAOPCIND CO, INVESTIMENTO IV, CUSTODIANTE CU, CARTEIRAIN' +
        'VEST CA, CARTEIRAGERENC CG'
      'WHERE CO.IDCESTAOPCIND    = :IDCESTAOPCIND'
      '  AND CO.DATAVIGENCIA     = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39')'
      '  AND CO.IDINVESTIMENTO   = IV.IDINVESTIMENTO'
      '  AND CO.IDCUSTODIANTE    = CU.IDCUSTODIANTE'
      '  AND CO.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)'
      '  AND CO.IDCARTEIRAGERENC = CG.IDCARTEIRAGERENC(+)'
      'ORDER BY IV.DESCINVESTIMENTO'
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
    UpdateObject = updCesta
    ValidateWithMask = True
    Left = 252
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryCestaDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Vigência'
      DisplayWidth = 10
      FieldName = 'DATAVIGENCIA'
    end
    object qryCestaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 41
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryCestaQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryCestaCOTACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 10
      FieldName = 'COTACAO'
      DisplayFormat = '###,###,##0.00####'
    end
    object qryCestaVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryCestaSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 16
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryCestaCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryCestaIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
    object qryCestaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryCestaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryCestaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCestaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object updCesta: TUpdateSQL
    ModifySQL.Strings = (
      'update CESTAOPCIND'
      'set'
      '  QUANTIDADE = :QUANTIDADE,'
      '  COTACAO = :COTACAO,'
      '  VALOR = :VALOR,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC'
      'where'
      '  IDCESTAOPCIND = :OLD_IDCESTAOPCIND and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into CESTAOPCIND'
      '  (IDCESTAOPCIND, DATAVIGENCIA, IDINVESTIMENTO, QUANTIDADE, '
      'COTACAO, VALOR, IDCUSTODIANTE, IDCARTEIRAINVEST,    '
      'IDCARTEIRAGERENC)'
      'values'
      '  (:IDCESTAOPCIND, :DATAVIGENCIA, :IDINVESTIMENTO, :QUANTIDADE, '
      ':COTACAO, :VALOR, :IDCUSTODIANTE, :IDCARTEIRAINVEST,     '
      ':IDCARTEIRAGERENC)')
    DeleteSQL.Strings = (
      'delete from CESTAOPCIND'
      'where'
      '  IDCESTAOPCIND = :OLD_IDCESTAOPCIND and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 280
    Top = 136
  end
  object dsCesta: TwwDataSource
    AutoEdit = False
    DataSet = qryCesta
    Left = 308
    Top = 136
  end
  object qryCarteiraOrdem: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.DESCCARTINVEST AS CARTEIRA,'
      '       CI.IDCARTEIRAINVEST  AS IDCARTEIRA,'
      '       CI.IDCARTEIRAINVEST'
      'FROM CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE (CI.IDCARTEIRAINVEST = PI.IDCARTOPCIND)'
      'ORDER BY CARTEIRA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 51
    Top = 354
    object qryCarteiraOrdemCARTEIRA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'CARTEIRA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraOrdemIDCARTEIRA: TFloatField
      FieldName = 'IDCARTEIRA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraOrdemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO IN (-84,-86,-88,-90)'
      'ORDER BY IDTIPOOPERACAO DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 203
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object qryTipoOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
      Visible = False
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperacaoFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
      Visible = False
    end
    object qryTipoOperacaoFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryTipoOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryTipoOperacaoFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryTipoOperacaoFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoMOTBLOQCARTORIG: TFloatField
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTORIG'
      Visible = False
    end
    object qryTipoOperacaoMOTBLOQCARTDEST: TFloatField
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTDEST'
      Visible = False
    end
    object qryTipoOperacaoTIPSALDOCARTORIG: TStringField
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPSALDOCARTDEST: TStringField
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGOPGERENC: TStringField
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryTipoOperacaoSTAATIVO: TStringField
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryOpcao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDINVESTIMENTO, I.DESCINVESTIMENTO, O.VLRPRECOEX, O.VLR' +
        'STRIKEPUT, O.VLRPONTO,'
      
        '       O.STATPAMERICANA, O.STAOPCCOMPRA, O.TIPCOTVENC, O.DTAVENC' +
        'TO'
      'FROM OPCOES O, INVESTIMENTO I,'
      '     (SELECT DISTINCT IDINVESTIMENTO'
      '      FROM ORDEMOPCIND)  OP'
      'WHERE O.IDTIPOOPCAO = 1'
      '  AND O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '  AND O.IDINVESTIMENTO = OP.IDINVESTIMENTO(+)'
      
        '  AND (((:IDTIPOOPERACAO BETWEEN -87 AND -84) AND (STAOPCCOMPRA ' +
        '= '#39'S'#39')) OR'
      
        '       ((:IDTIPOOPERACAO BETWEEN -91 AND -88) AND (STAOPCCOMPRA ' +
        '= '#39'N'#39')) OR'
      '        (:IDTIPOOPERACAO IS NULL))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 51
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object qryOpcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryOpcaoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPCOES.IDINVESTIMENTO'
      Visible = False
    end
    object qryOpcaoVLRPRECOEX: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRPRECOEX'
      Origin = 'OPCOES.VLRPRECOEX'
      Visible = False
    end
    object qryOpcaoVLRSTRIKEPUT: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRSTRIKEPUT'
      Origin = 'OPCOES.VLRSTRIKEPUT'
      Visible = False
    end
    object qryOpcaoVLRPONTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRPONTO'
      Origin = 'OPCOES.VLRPONTO'
      Visible = False
    end
    object qryOpcaoSTATPAMERICANA: TStringField
      DisplayWidth = 1
      FieldName = 'STATPAMERICANA'
      Origin = 'OPCOES.STATPAMERICANA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOpcaoSTAOPCCOMPRA: TStringField
      DisplayWidth = 1
      FieldName = 'STAOPCCOMPRA'
      Origin = 'OPCOES.STAOPCCOMPRA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOpcaoTIPCOTVENC: TStringField
      DisplayWidth = 1
      FieldName = 'TIPCOTVENC'
      Origin = 'OPCOES.TIPCOTVENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOpcaoDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
      Visible = False
    end
  end
  object qryCarteiraCesta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.DESCCARTINVEST AS CARTEIRA,'
      
        '      (CI.IDCARTEIRAINVEST || CG.IDCARTEIRAGERENC) AS IDCARTEIRA' +
        ','
      '       CI.IDCARTEIRAINVEST,'
      '       CG.IDCARTEIRAGERENC'
      'FROM  CARTEIRAINVEST CI, CARTEIRAGERENC CG, PARAMINVEST PI'
      'WHERE (CI.IDCARTEIRAINVEST = CG.IDCARTEIRAGERENC(+)) AND'
      '      (CI.IDCARTEIRAINVEST <> CG.IDCARTEIRAGERENC(+)) AND'
      '      (CI.FLGCARTLASTRO = '#39'S'#39') AND'
      '      (CG.IDCARTEIRAGERENC IS NULL) '
      'ORDER BY CARTEIRA'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 252
    object qryCarteiraCestaCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryCarteiraCestaIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 80
    end
    object qryCarteiraCestaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraCestaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object qryCustodianteCesta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CT.SGLCUSTODIANTE, H1.IDCUSTODIANTE'
      'FROM'
      
        '   HISTCUSTODIA H1, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTODIA' +
        'NTE CT'
      'WHERE'
      
        '   (((:IDCARTEIRAINVEST IS NOT NULL) AND (H1.IDCARTEIRAINVEST = ' +
        ':IDCARTEIRAINVEST)) OR'
      '     (:IDCARTEIRAINVEST IS NULL))    AND'
      
        '   (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)                      ' +
        '                     AND'
      
        '   (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)                  ' +
        '                     AND'
      
        '   (H1.IDCUSTODIANTE = CT.IDCUSTODIANTE)                        ' +
        '                     AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL))' +
        ' AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      '                (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND'
      '                (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                ((H2.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR'
      
        '                 ((H2.DATAMOVCUSTOD = TO_DATE(:DATAMOV, '#39'DD/MM/Y' +
        'YYY'#39')) AND (H2.IDCUSTODIA < 9999999))))) AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE = H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      '                (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND'
      #9'          (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      '                (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD) AND'
      
        '                ((H3.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR (H3.IDCUSTODIA < 9999999)))) AND'
      '   (H1.SALDOLIBERADO > 0)'
      'ORDER BY CT.SGLCUSTODIANTE'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end>
    object qryCustodianteCestaSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteCestaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryAcaoCesta: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IV.DESCINVESTIMENTO, CT.SGLCUSTODIANTE, H1.SALDOLIBERADO, H1.' +
        'SALDOBLOQUEADO,'
      
        '   H1.IDCARTEIRAINVEST, H1.IDCUSTODIANTE, H1.IDINVESTIMENTO, H1.' +
        'IDLOTE'
      'FROM'
      
        '   HISTCUSTODIA H1, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTODIA' +
        'NTE CT'
      'WHERE'
      
        '   (((:IDCARTEIRAINVEST IS NOT NULL) AND (H1.IDCARTEIRAINVEST = ' +
        ':IDCARTEIRAINVEST)) OR'
      '     (:IDCARTEIRAINVEST IS NULL))    AND'
      
        '   (((:IDCUSTODIANTE IS NOT NULL)   AND (H1.IDCUSTODIANTE = :IDC' +
        'USTODIANTE))       OR'
      '     (:IDCUSTODIANTE IS NULL))      AND'
      
        '   (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)                      ' +
        '                     AND'
      
        '   (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)                  ' +
        '                     AND'
      
        '   (H1.IDCUSTODIANTE = CT.IDCUSTODIANTE)                        ' +
        '                     AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL))' +
        ' AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      '                (H2.IDCUSTODIANTE = H1.IDCUSTODIANTE) AND'
      '                (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                ((H2.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR'
      
        '                 ((H2.DATAMOVCUSTOD = TO_DATE(:DATAMOV, '#39'DD/MM/Y' +
        'YYY'#39')) AND (H2.IDCUSTODIA < 9999999))))) AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      '                (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE) AND'
      #9'          (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      '                (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD) AND'
      
        '                ((H3.DATAMOVCUSTOD < TO_DATE(:DATAMOV, '#39'DD/MM/YY' +
        'YY'#39')) OR (H3.IDCUSTODIA < 9999999)))) AND'
      '   (H1.SALDOLIBERADO > 0)'
      'ORDER BY'
      '   IV.DESCINVESTIMENTO, DATAMOVCUSTOD DESC, IDCUSTODIA DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end>
    object qryAcaoCestaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAcaoCestaSGLCUSTODIANTE: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Visible = False
      Size = 10
    end
    object qryAcaoCestaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
      Visible = False
    end
    object qryAcaoCestaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Visible = False
    end
    object qryAcaoCestaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryAcaoCestaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryAcaoCestaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryAcaoCestaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
  end
  object QryCorretValores: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCORRETVALORES,'
      '     SGLCORRETVALORES'
      'FROM'
      '      CORRETVALORES'
      'WHERE'
      '     FLGATIVARV='#39'S'#39
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 51
    Top = 203
    object QryCorretValoresSGLCORRETVALORES: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'SGLCORRETVALORES'
      Origin = 'BASEDADOS.CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.CORRETVALORES.IDCORRETVALORES'
      Visible = False
    end
  end
  object qryVerificaVigencias: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DATAVIGENCIA'
      'FROM CESTAOPCIND'
      'WHERE IDCESTAOPCIND = :IDCESTAOPCIND'
      '  AND DATAVIGENCIA > TO_DATE(:DATAVIGENCIA, '#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 51
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryVerificaVigenciasDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
    end
  end
  object MSBuscaSaldos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'HISTOPCIND.DATAHISTOPCIND'
      'HISTOPCIND.IDBOLETA'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CORRETVALORES.SGLCORRETVALORES'
      'HISTOPCIND.SLDQTDHISTOPCIND')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Data'
      'Boleta'
      'Investimento'
      'Corretora'
      'Saldo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTOPCIND'
      'INVESTIMENTO'
      'CORRETVALORES'
      'ORDEMOPCIND'
      
        '(SELECT MAX(IDHISTOPCIND) AS IDHISTOPCIND FROM HISTOPCIND H, PAR' +
        'AMINVEST P WHERE (H.DATAHISTOPCIND >= (P.DATAULTFECH-30)) GROUP ' +
        'BY DATAHISTOPCIND, IDINVESTIMENTO, IDOPEROPCIND) IDS')
    CamposChave.Strings = (
      'HISTOPCIND.IDPLANPREVCTBPATR'
      'HISTOPCIND.IDTIPOOPERACAO'
      'HISTOPCIND.DATAHISTOPCIND'
      'HISTOPCIND.SLDQTDHISTOPCIND'
      'HISTOPCIND.IDLOTE'
      'HISTOPCIND.IDBOLETA'
      'HISTOPCIND.IDCARTEIRAINVEST'
      'HISTOPCIND.IDINVESTIMENTO'
      'HISTOPCIND.IDTIPOINVEST'
      'ORDEMOPCIND.IDCORRETVALORES'
      'CORRETVALORES.SGLCORRETVALORES'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'HISTOPCIND.IDCARTEIRAGERENC'
      'HISTOPCIND.IDOPEROPCIND'
      'ORDEMOPCIND.IDCESTAOPCIND')
    Filtro.Strings = (
      'HISTOPCIND.SLDQTDHISTOPCIND > 0'
      'HISTOPCIND.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'HISTOPCIND.IDBOLETA = ORDEMOPCIND.IDBOLETA'
      'HISTOPCIND.IDINVESTIMENTO = ORDEMOPCIND.IDINVESTIMENTO'
      'ORDEMOPCIND.IDCORRETVALORES = CORRETVALORES.IDCORRETVALORES'
      'HISTOPCIND.IDHISTOPCIND = IDS.IDHISTOPCIND')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '30'
      '60'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 341
    Top = 68
  end
  object qryAux: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 419
    Top = 52
  end
end
