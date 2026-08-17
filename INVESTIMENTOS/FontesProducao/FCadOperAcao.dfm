inherited FrmCadOperAcao: TFrmCadOperAcao
  Left = 110
  Top = 60
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Operacoes com Ações '
  ClientHeight = 470
  ClientWidth = 594
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 384
    object Label1: TLabel
      Left = 17
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Bolsa de Valores '
    end
    object Label2: TLabel
      Left = 17
      Top = 56
      Width = 40
      Height = 13
      Caption = 'Acões '
    end
    object Label3: TLabel
      Left = 324
      Top = 56
      Width = 134
      Height = 13
      Caption = 'Numero do Documento '
    end
    object Label4: TLabel
      Left = 324
      Top = 16
      Width = 109
      Height = 13
      Caption = 'Data da Operação '
    end
    object Label18: TLabel
      Left = 459
      Top = 16
      Width = 112
      Height = 13
      Caption = 'Data de Liquidação'
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 104
      Width = 584
      Height = 275
      ActivePage = TS1
      Align = alBottom
      HotTrack = True
      TabOrder = 5
      OnChange = PageControl1Change
      object TS1: TTabSheet
        Caption = 'Dados da Operação'
        object Bevel1: TBevel
          Left = 0
          Top = 0
          Width = 576
          Height = 247
          Align = alClient
        end
        object Label5: TLabel
          Left = 16
          Top = 6
          Width = 107
          Height = 13
          Caption = 'Tipo de Operação '
        end
        object Label6: TLabel
          Left = 16
          Top = 52
          Width = 118
          Height = 13
          Caption = 'Quantidade Operada'
          FocusControl = DBEdit3
        end
        object Label7: TLabel
          Left = 16
          Top = 92
          Width = 85
          Height = 13
          Caption = 'Preço por Lote'
          FocusControl = DBEdit4
        end
        object Label8: TLabel
          Left = 16
          Top = 140
          Width = 111
          Height = 13
          Caption = 'Valor da Operação '
          FocusControl = DBEdit5
        end
        object Label9: TLabel
          Left = 163
          Top = 52
          Width = 117
          Height = 13
          Caption = 'Quantidade por Lote'
        end
        object Label11: TLabel
          Left = 296
          Top = 6
          Width = 121
          Height = 13
          Caption = 'Corretora de Valores '
        end
        object Label20: TLabel
          Left = 296
          Top = 52
          Width = 143
          Height = 13
          Caption = 'Carteira de Investimento '
        end
        object Label21: TLabel
          Left = 296
          Top = 92
          Width = 106
          Height = 13
          Caption = 'Carteira de Origem'
        end
        object Label22: TLabel
          Left = 159
          Top = 92
          Width = 122
          Height = 13
          Caption = 'Identificação do Lote'
          FocusControl = DBEdit4
        end
        object Label25: TLabel
          Left = 296
          Top = 132
          Width = 141
          Height = 13
          Caption = 'Ordem de Movimentação'
        end
        object GrBxTransf: TGroupBox
          Left = 296
          Top = 169
          Width = 265
          Height = 73
          Caption = 'Investimento de Destino'
          TabOrder = 10
          Visible = False
          object Label24: TLabel
            Left = 5
            Top = 35
            Width = 85
            Height = 13
            Caption = 'Preço por Lote'
          end
          object Label23: TLabel
            Left = 136
            Top = 35
            Width = 66
            Height = 13
            Caption = 'Quantidade'
          end
          object DbLkcInvestTransf: TwwDBLookupCombo
            Left = 5
            Top = 13
            Width = 255
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'40'#9'Ação')
            DataField = 'IDINVESTDEST'
            DataSource = ds
            LookupTable = QryAcaoBolsaTransf
            LookupField = 'IDACAO'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object EdVlrUnitTransf: TRealEdit
            Left = 5
            Top = 48
            Width = 117
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 8
            NumberFormat = fNumber
            Signal = False
          end
          object EdQtdTransf: TRealEdit
            Left = 136
            Top = 48
            Width = 124
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            OnChange = EdQtdTransfChange
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 68
          Width = 129
          Height = 21
          DataField = 'QTDEOPERACAO'
          DataSource = ds
          MaxLength = 10
          TabOrder = 1
          OnExit = DBEdit3Exit
        end
        object DBEdit4: TDBEdit
          Left = 16
          Top = 108
          Width = 129
          Height = 21
          DataField = 'PRECOUNITOPERACAO'
          DataSource = ds
          MaxLength = 17
          TabOrder = 2
          OnKeyPress = DBEdit4KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 16
          Top = 156
          Width = 129
          Height = 21
          Color = clWhite
          DataField = 'VLROPERACAO'
          DataSource = ds
          TabOrder = 3
          OnExit = DBEdit5Exit
          OnKeyPress = DBEdit5KeyPress
        end
        object DbLkcTipoOperacao: TwwDBLookupCombo
          Left = 16
          Top = 22
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operacao')
          DataField = 'IDTIPOOPERACAO'
          DataSource = ds
          LookupTable = QryBuscaOperacao
          LookupField = 'IDTIPOOPERACAO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = DbLkcTipoOperacaoChange
          OnCloseUp = DbLkcTipoOperacaoCloseUp
        end
        object DbLkcBuscaCorretor: TwwDBLookupCombo
          Left = 296
          Top = 22
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCORRETVALORES'#9'40'#9'Sigla da Corretora ')
          DataField = 'IDCORRETVALORES'
          DataSource = ds
          LookupTable = QryBuscaCorretora
          LookupField = 'IDCORRETVALORES'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = DbLkcBuscaCorretorChange
        end
        object DBEdit2: TEdit
          Left = 182
          Top = 68
          Width = 105
          Height = 21
          TabOrder = 6
          Text = 'DBEdit2'
          Visible = False
        end
        object DBEdit2Tela: TRealEdit
          Left = 160
          Top = 68
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '      0,00')
          ParentFont = False
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object DblkcCarteira: TwwDBLookupCombo
          Left = 296
          Top = 68
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCARTINVEST'#9'40'#9'Carteira de Investimento')
          DataField = 'IDCARTEIRAINVEST'
          DataSource = ds
          LookupTable = QryBuscaCarteira
          LookupField = 'IDCARTEIRAINVEST'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = DblkcCarteiraChange
        end
        object DbLkcCarteiraDestOri: TwwDBLookupCombo
          Left = 296
          Top = 108
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCARTINVEST'#9'40'#9'Carteira de Investimento')
          DataField = 'IDCARTORIDEST'
          DataSource = ds
          LookupTable = QryCarteiraOriDest
          LookupField = 'IDCARTEIRAINVEST'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = DbLkcCarteiraDestOriChange
        end
        object PnlLote: TPanel
          Left = 160
          Top = 108
          Width = 121
          Height = 23
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 9
        end
        object DbLkcOrdMovInv: TwwDBLookupCombo
          Left = 296
          Top = 148
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'QTDEORDMOVINV'#9'10'#9'Qtd Papel'
            'PUORDMOVINV'#9'10'#9'Preço por Lote'
            'DATAORDMOVINV'#9'20'#9'Data')
          DataField = 'IDORDMOVINV'
          DataSource = ds
          LookupTable = QryOrdMovInv
          LookupField = 'IDORDMOVINV'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DbLkcOrdMovInvCloseUp
        end
      end
      object TS2: TTabSheet
        Caption = 'Carteira de Investimento'
        TabVisible = False
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 576
          Height = 247
          Align = alClient
        end
      end
      object TS3: TTabSheet
        Caption = 'Controle de Custodia'
        object Bevel3: TBevel
          Left = 0
          Top = 0
          Width = 576
          Height = 247
          Align = alClient
        end
        object Label26: TLabel
          Left = 20
          Top = 21
          Width = 68
          Height = 13
          Caption = 'Custodiante'
        end
        object DbLkcBuscaCust: TwwDBLookupCombo
          Left = 20
          Top = 35
          Width = 303
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCUSTODIANTE'#9'40'#9'Custodiante')
          DataField = 'IDCUSTODIANTE'
          DataSource = ds
          LookupTable = QryBuscaCustodiante
          LookupField = 'IDCUSTODIANTE'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = DbLkcBuscaCustChange
        end
        object GrBxTransfCust: TGroupBox
          Left = 8
          Top = 64
          Width = 322
          Height = 106
          Caption = ' Transferencias '
          TabOrder = 1
          object Label27: TLabel
            Left = 10
            Top = 19
            Width = 129
            Height = 13
            Caption = 'Custodiante de Origem'
          end
          object Label28: TLabel
            Left = 10
            Top = 58
            Width = 137
            Height = 13
            Caption = 'Custodiante de Destino '
          end
          object DbLkcCustOrig: TwwDBLookupCombo
            Left = 10
            Top = 33
            Width = 303
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'SGLCUSTODIANTE'#9'40'#9'Custodiante')
            DataField = 'IDCUSTORIG'
            DataSource = ds
            LookupTable = QryBuscaCustodiante
            LookupField = 'IDCUSTODIANTE'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DbLkcCustDest: TwwDBLookupCombo
            Left = 10
            Top = 74
            Width = 303
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'SGLCUSTODIANTE'#9'40'#9'Custodiante')
            DataField = 'IDCUSTDEST'
            DataSource = ds
            LookupTable = QryBuscaCustodiante
            LookupField = 'IDCUSTODIANTE'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object TS4: TTabSheet
        Caption = 'Rubricas da Operação '
        object Bevel4: TBevel
          Left = 0
          Top = 31
          Width = 576
          Height = 216
          Align = alClient
        end
        object PnlDespesas: TPanel
          Left = 0
          Top = 31
          Width = 576
          Height = 216
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label14: TLabel
            Left = 16
            Top = 48
            Width = 42
            Height = 13
            Caption = 'Credor '
          end
          object Label15: TLabel
            Left = 16
            Top = 91
            Width = 96
            Height = 13
            Caption = 'Valor da Rubrica'
            FocusControl = DBEdit7
          end
          object Label16: TLabel
            Left = 16
            Top = 131
            Width = 116
            Height = 13
            Caption = 'Data de Vencimento'
          end
          object Label19: TLabel
            Left = 200
            Top = 91
            Width = 111
            Height = 13
            Caption = 'Valor da Operação '
            FocusControl = DBEdit9
          end
          object Dock976: TDock97
            Left = 490
            Top = 1
            Width = 85
            Height = 214
            AllowDrag = False
            BoundLines = [blLeft]
            Position = dpRight
            object Toolbar973: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97Detalhe'
              DockPos = 0
              TabOrder = 0
              object BtOkDetDesp: TBitBtn
                Left = 0
                Top = 0
                Width = 80
                Height = 27
                Caption = '&OK'
                Default = True
                TabOrder = 0
                OnClick = BtOkDetDespClick
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
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
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  03030303030303030303030303030303030303030303FF030303030303030303
                  03030303030303040403030303030303030303030303030303F8F8FF03030303
                  03030303030303030303040202040303030303030303030303030303F80303F8
                  FF030303030303030303030303040202020204030303030303030303030303F8
                  03030303F8FF0303030303030303030304020202020202040303030303030303
                  0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                  0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                  040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                  03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                  FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                  0303030303030303030303FA0202020403030303030303030303030303F8FF03
                  03F8FF03030303030303030303030303FA020202040303030303030303030303
                  0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                  03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                  030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                  0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                  03030303FA0202030303030303030303030303030303F8FFF803030303030303
                  030303030303030303FA0303030303030303030303030303030303F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
              end
              object BtCancDetDesp: TBitBtn
                Left = 0
                Top = 27
                Width = 80
                Height = 27
                Cancel = True
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BtCancDetDespClick
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
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
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303F8F80303030303030303030303030303030303FF03030303030303030303
                  0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                  03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                  030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                  FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                  030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                  F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                  010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                  030101010101F80303030303030303030303F8FF0303030303F8030303030303
                  0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                  0303030303030303F90101010101F8030303030303030303030303F803030303
                  F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                  03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                  03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                  03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                  0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                  030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                  03030303030303030303030303030303030303030303030303F8F8F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
              end
              object BitBtn3: TBitBtn
                Left = 0
                Top = 54
                Width = 80
                Height = 27
                Cancel = True
                Caption = '&Voltar'
                TabOrder = 2
                OnClick = BtCancDetDespClick
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
          object Panel2: TPanel
            Left = 16
            Top = 18
            Width = 337
            Height = 25
            Alignment = taLeftJustify
            BevelOuter = bvLowered
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit7: TDBEdit
            Left = 16
            Top = 107
            Width = 153
            Height = 21
            DataField = 'VLRDESPOPER'
            DataSource = DsDespesasOperacao
            TabOrder = 1
            OnExit = DBEdit7Exit
            OnKeyPress = DBEdit6KeyPress
          end
          object DBDateEdit3: TCMDateTimePicker
            Left = 16
            Top = 147
            Width = 153
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCDESPOPER'
            DataSource = DsDespesasOperacao
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
          end
          object DbLckCredor: TwwDBLookupCombo
            Left = 16
            Top = 64
            Width = 337
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'RAZAOSOCIAL'#9'40'#9'Credor ')
            DataField = 'IDFORCLI'
            DataSource = DsDespesasOperacao
            LookupTable = QryBuscaCredor
            LookupField = 'IDPESSOA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBEdit9: TDBEdit
            Left = 200
            Top = 107
            Width = 153
            Height = 21
            Color = clBtnFace
            DataField = 'VLROPERACAO'
            DataSource = ds
            Enabled = False
            TabOrder = 5
          end
        end
        object GridDespesas: TDBGrid
          Left = 0
          Top = 31
          Width = 576
          Height = 216
          Align = alClient
          DataSource = DsDespesasOperacao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = BtAltDespClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCDESP'
              Title.Caption = 'Descricão da Rubrica'
              Width = 258
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAVENCDESPOPER'
              Title.Caption = 'Vencimento'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRDESPOPER'
              Title.Caption = 'Valor da Rubrica'
              Width = 161
              Visible = True
            end>
        end
        object Animate2: TAnimate
          Left = 2
          Top = 33
          Width = 272
          Height = 60
          Active = False
          Color = clNone
          CommonAVI = aviCopyFiles
          ParentColor = False
          StopFrame = 34
          Visible = False
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 31
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 3
          object Label10: TLabel
            Left = 16
            Top = 6
            Width = 198
            Height = 20
            Caption = 'Aguarde Processando ...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DkBtCancelaRubrica: TPanel
            Left = 405
            Top = 1
            Width = 167
            Height = 29
            Caption = 'DkBtCancelaRubrica'
            TabOrder = 0
            Visible = False
            object BtCancelaRubrica: TSpeedButton
              Left = 2
              Top = 2
              Width = 163
              Height = 25
              Caption = 'Cancelar Rubricas'
              Glyph.Data = {
                8A050000424D8A05000000000000360400002800000011000000110000000100
                0800000000005401000000000000000000000001000000010000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A600000000000000000000000000000000000000000000000000000000000000
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
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0003030303F8F8
                0303030303030303030303000000030303F90101F80303030303F9F803030300
                0000030303F9010101F8030303F90101F80303000000030303F901010101F803
                F901010101F80300000003030303F901010101F80101010101F8030000000303
                030303F90101010101010101F80303000000030303030303F9010101010101F8
                030303000000030303030303030101010101F803030303000000030303030303
                03F901010101F803030303000000030303030303F90101010101F80303030300
                00000303030303F9010101F8010101F803030300000003030303F9010101F803
                F9010101F8030300000003030303F90101F8030303F9010101F8030000000303
                030303F9010303030303F90101010300000003030303030303030303030303F9
                01F9030000000303030303030303030303030303030303000000030303030303
                0303030303030303030303000000}
              OnClick = BtCancelaRubricaClick
            end
          end
        end
      end
      object TS5: TTabSheet
        Caption = 'Impostos    '
        TabVisible = False
        object Bevel5: TBevel
          Left = 0
          Top = 31
          Width = 576
          Height = 216
          Align = alClient
        end
        object GridImpostos: TDBGrid
          Left = 0
          Top = 31
          Width = 576
          Height = 216
          Align = alClient
          DataSource = DsImpostosOperacao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = sbtnAltDetClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCIMPOSTO'
              Title.Caption = 'Descrição do Imposto'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CREDOR'
              Title.Caption = 'Credor'
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAVENCIMPINVEST'
              Title.Caption = 'Vencimento'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRIMPOSTOOPER'
              Title.Caption = 'Valor do Imposto '
              Width = 110
              Visible = True
            end>
        end
        object PnlImpostos: TPanel
          Left = 0
          Top = 31
          Width = 576
          Height = 216
          Align = alClient
          TabOrder = 0
          object Label12: TLabel
            Left = 16
            Top = 90
            Width = 100
            Height = 13
            Caption = 'Valor do Imposto '
            FocusControl = DBEdit6
          end
          object Label13: TLabel
            Left = 16
            Top = 130
            Width = 116
            Height = 13
            Caption = 'Data de Vencimento'
          end
          object Label17: TLabel
            Left = 16
            Top = 48
            Width = 38
            Height = 13
            Caption = 'Credor'
          end
          object DBEdit6: TDBEdit
            Left = 16
            Top = 106
            Width = 153
            Height = 21
            DataField = 'VLRIMPOSTOOPER'
            DataSource = DsImpostosOperacao
            TabOrder = 0
            OnExit = DBEdit6Exit
            OnKeyPress = DBEdit6KeyPress
          end
          object DBDateEdit2: TCMDateTimePicker
            Left = 16
            Top = 146
            Width = 153
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCIMPINVEST'
            DataSource = DsImpostosOperacao
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
          object Panel1: TPanel
            Left = 16
            Top = 18
            Width = 337
            Height = 25
            Alignment = taLeftJustify
            BevelOuter = bvLowered
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object Dock974: TDock97
            Left = 490
            Top = 1
            Width = 85
            Height = 214
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
                Width = 80
                Height = 27
                Caption = '&OK'
                Default = True
                TabOrder = 0
                OnClick = bbtnOkDetClick
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
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
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  03030303030303030303030303030303030303030303FF030303030303030303
                  03030303030303040403030303030303030303030303030303F8F8FF03030303
                  03030303030303030303040202040303030303030303030303030303F80303F8
                  FF030303030303030303030303040202020204030303030303030303030303F8
                  03030303F8FF0303030303030303030304020202020202040303030303030303
                  0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                  0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                  040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                  03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                  FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                  0303030303030303030303FA0202020403030303030303030303030303F8FF03
                  03F8FF03030303030303030303030303FA020202040303030303030303030303
                  0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                  03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                  030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                  0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                  03030303FA0202030303030303030303030303030303F8FFF803030303030303
                  030303030303030303FA0303030303030303030303030303030303F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
              end
              object bbtnCancelarDet: TBitBtn
                Left = 0
                Top = 27
                Width = 80
                Height = 27
                Cancel = True
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = bbtnCancelarDetClick
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
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
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303F8F80303030303030303030303030303030303FF03030303030303030303
                  0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                  03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                  030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                  FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                  030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                  F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                  010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                  030101010101F80303030303030303030303F8FF0303030303F8030303030303
                  0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                  0303030303030303F90101010101F8030303030303030303030303F803030303
                  F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                  03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                  03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                  03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                  0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                  030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                  03030303030303030303030303030303030303030303030303F8F8F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
              end
              object bbtnVoltarDet: TBitBtn
                Left = 0
                Top = 54
                Width = 80
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
          object DBEdit8: TDBEdit
            Left = 16
            Top = 64
            Width = 337
            Height = 21
            DataField = 'CREDOR'
            DataSource = DsImpostosOperacao
            Enabled = False
            TabOrder = 4
          end
        end
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 576
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnAltDet: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar Valores '
              AllowAllUp = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = sbtnAltDetClick
            end
            object sbtnExcluiDet: TSpeedButton
              Left = 25
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Excluir Lançamento'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              Visible = False
            end
          end
        end
        object Animate1: TAnimate
          Left = 2
          Top = 33
          Width = 272
          Height = 60
          Active = False
          Color = clNone
          CommonAVI = aviCopyFiles
          ParentColor = False
          StopFrame = 34
          Visible = False
        end
      end
    end
    object DbLkcBolsa: TwwDBLookupCombo
      Left = 17
      Top = 30
      Width = 298
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
      DataField = 'IDBOLSAVALORES'
      DataSource = DsSubTipo
      LookupTable = QryBolsaValores
      LookupField = 'IDBOLSAVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DbLkcBolsaChange
      OnEnter = DbLkcBolsaEnter
      OnExit = DbLkcBolsaExit
    end
    object DbLkcAcao: TwwDBLookupCombo
      Left = 17
      Top = 70
      Width = 298
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Ação')
      DataField = 'IDACAO'
      DataSource = DsSubTipo
      LookupTable = QryAcaoBolsa
      LookupField = 'IDACAO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBEdit1: TDBEdit
      Left = 324
      Top = 70
      Width = 223
      Height = 21
      Color = clWhite
      DataField = 'NUMDOCUMENTO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 3
    end
    object DBDateEdit1: TCMDateTimePicker
      Left = 324
      Top = 30
      Width = 125
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
      TabOrder = 2
      OnExit = DBDateEdit1Exit
    end
    object DBDateEdit4: TCMDateTimePicker
      Left = 460
      Top = 30
      Width = 112
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAVENCOPER'
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
      TabOrder = 6
    end
    object BtNovoDoc: TBitBtn
      Left = 551
      Top = 69
      Width = 23
      Height = 22
      Hint = 'Gera Número do Documento'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtNovoDocClick
      OnExit = BtNovoDocExit
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888FF8888888888888778888888888888F77F8888888888800F08
        8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
        88888887788888F7F8888887FFFFFFF088888887F88888878F888887FFFFFFFF
        08888887FF88888F7F88888B7FFFFFFF088888F77F88888878F88B8B7BFFFFFF
        F088878778F88888F78F888B87FFFFFFFF0888F7F7F8888888788BBBBBFFFFFF
        FFF08777778F888888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
        78888787F7878FF77888888B8888777888888887888877788888888888888888
        8888888888888888888888888888888888888888888888888888}
      NumGlyphs = 2
    end
  end
  inherited Dock972: TDock97
    Width = 594
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 120
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 269
      end
      object BtDetalhes: TToolbarButton97
        Left = 180
        Top = 0
        Width = 89
        Height = 41
        Hint = 'Consulta Detalhes do Documento'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Ordem '
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = BtDetalhesClick
      end
      object BtFechamento: TToolbarButton97
        Left = 329
        Top = 0
        Width = 76
        Height = 41
        Hint = 'Fechamento da Boleta'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Fechamento'
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777774F77777700000007777
          7777444F77777000000077777774444F777770000000700000444F44F7777000
          000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
          74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
          8777F07777774000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = BtFechamentoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 594
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Default = False
      end
    end
    inherited dbnav: TDBNavigator
      Width = 110
      VisibleButtons = []
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 17
    Top = 9
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 391
    Top = 36
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 502
    Top = 36
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 473
    Top = 36
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '      BL.IDBOLSAVALORES, BL.SGLBOLSAVALORES, BL.MOECODIGO, BL.ID' +
        'CUSTODIANTE'
      'FROM '
      '      CM.BOLSAVALORES BL,'
      '      CM.PARAMINVEST PI'
      'WHERE '
      '      BL.IDBOLSAVALORES <> PI.IDBMF'
      'ORDER BY SGLBOLSAVALORES '
      ''
      '')
    ValidateWithMask = True
    Left = 446
    Top = 139
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
    object QryBolsaValoresMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BOLSAVALORES.MOECODIGO'
    end
    object QryBolsaValoresIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BOLSAVALORES.IDCUSTODIANTE'
    end
  end
  object DsBolsaValores: TwwDataSource
    DataSet = QryBolsaValores
    Left = 411
    Top = 139
  end
  object QryAcaoBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsBolsaValores
    SQL.Strings = (
      
        'SELECT '#9'AXB.IDBOLSAVALORES, AXB.IDACAO, AXB.MOECODIGO, AXB.QTDEL' +
        'OTE,'
      #9'INV.DESCINVESTIMENTO, INV.IDEMISSOR, ACA.CODTIPOACAO,'
      '                ACA.FLGPROVISIONAIR'
      ''
      'FROM '#9'CM.ACOESXBOLSA AXB, CM.INVESTIMENTO INV, ACAO ACA'
      ''
      'WHERE '#9'INV.FLGATIVO  <> '#39'N'#39'                            '#9'AND '
      #9'AXB.IDACAO = INV.IDINVESTIMENTO AND '
      #9'AXB.IDACAO = ACA.IDACAO '#9#9'AND '
      #9'AXB.IDBOLSAVALORES = :IDBOLSAVALORES '
      ''
      'ORDER BY INV.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 15
    Top = 385
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object QryAcaoBolsaIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'ACOESXBOLSA.IDBOLSAVALORES'
    end
    object QryAcaoBolsaIDACAO: TFloatField
      FieldName = 'IDACAO'
      Origin = 'ACOESXBOLSA.IDACAO'
    end
    object QryAcaoBolsaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'ACOESXBOLSA.MOECODIGO'
    end
    object QryAcaoBolsaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'ACOESXBOLSA.QTDELOTE'
    end
    object QryAcaoBolsaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = '"CM.INVESTIMENTO".DESCINVESTIMENTO'
      Size = 60
    end
    object QryAcaoBolsaIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = '"CM.INVESTIMENTO".IDEMISSOR'
    end
    object QryAcaoBolsaCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = '"CM.ACAO".CODTIPOACAO'
      Size = 5
    end
    object QryAcaoBolsaFLGPROVISIONAIR: TStringField
      FieldName = 'FLGPROVISIONAIR'
      Origin = '"CM.ACAO".FLGPROVISIONAIR'
      Size = 1
    end
  end
  object DsAcaoBolsa: TwwDataSource
    DataSet = QryAcaoBolsa
    Left = 52
    Top = 385
  end
  object DsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = QrySubTipo
    Left = 354
    Top = 4
  end
  object QrySubTipo: TwwQuery
    AfterScroll = QrySubTipoAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '#9'IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, '
      #9'IDEMISSOR, DATAULTOPERACAO, NOVODIREITO, NUMCLIENTECORRET '
      ''
      'FROM CM.OPRACAO '
      ''
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 325
    Top = 4
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterScroll = QryPrincipalAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, IDTIP' +
        'OINVEST,'
      #9'IDTIPOOPERACAO, IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO, '
      #9'QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER,'
      #9'IDINVESTIMENTO, EMPRESAPROP, IDFORCLI, IDCORRETVALORES,'
      #9'MOECODIGO, IDCARTORIDEST, IDLOTE, IDMODULO, IDINVESTDEST,'
      '                IDORDMOVINV, IDCUSTORIG, IDCUSTDEST,VLRIR'
      ''
      'FROM CM.OPERACAOINVEST'
      ''
      'WHERE IDTIPOINVEST = 2 '
      ' ')
    UpdateObject = UpdPrincipal
    ValidateWithMask = True
    Left = 361
    Top = 36
    object QryPrincipalIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object QryPrincipalIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'OPERACAOINVEST.IDCUSTODIANTE'
    end
    object QryPrincipalIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object QryPrincipalIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOINVEST.IDTIPOINVEST'
    end
    object QryPrincipalIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object QryPrincipalIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
      Origin = 'OPERACAOINVEST.IDINSTFIN'
    end
    object QryPrincipalDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object QryPrincipalQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###'
      EditFormat = '################'
    end
    object QryPrincipalPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
      DisplayFormat = '###,###,##0.00######'
      EditFormat = '########0.00######;0'
    end
    object QryPrincipalVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '#############0.00;0'
    end
    object QryPrincipalNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object QryPrincipalDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryPrincipalIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryPrincipalEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object QryPrincipalIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryPrincipalIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryPrincipalMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryPrincipalIDCARTORIDEST: TFloatField
      FieldName = 'IDCARTORIDEST'
      Origin = 'OPERACAOINVEST.IDCARTORIDEST'
    end
    object QryPrincipalIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'OPERACAOINVEST.IDLOTE'
      Size = 10
    end
    object QryPrincipalIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'OPERACAOINVEST.IDMODULO'
    end
    object QryPrincipalIDINVESTDEST: TFloatField
      FieldName = 'IDINVESTDEST'
      Origin = 'OPERACAOINVEST.IDINVESTDEST'
    end
    object QryPrincipalIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
      Origin = '"CM.OPERACAOINVEST".IDORDMOVINV'
    end
    object QryPrincipalIDCUSTORIG: TFloatField
      FieldName = 'IDCUSTORIG'
      Origin = 'OPERACAOINVEST.IDCUSTORIG'
    end
    object QryPrincipalIDCUSTDEST: TFloatField
      FieldName = 'IDCUSTDEST'
      Origin = 'OPERACAOINVEST.IDCUSTDEST'
    end
    object QryPrincipalVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 532
    Top = 36
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INV.DESCINVESTIMENTO '
      'OPR .IDLOTE'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPR.DATAOPERACAO '
      'OPR.NUMDOCUMENTO '
      'INV.FLGATIVO'
      'CORRETVALORES.SGLCORRETVALORES')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição da Ação '
      'Lote'
      'Tipo de Operação'
      'Data da Operação '
      'Numero do Documento '
      'Ativa'
      'Corretora de Valores')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST OPR '
      'INVESTIMENTO INV'
      'OPRACAO OPA '
      'BOLSAVALORES BOV'
      'TIPOOPERACAO'
      'CORRETVALORES')
    CamposChave.Strings = (
      'OPR.IDOPERACAOINVEST')
    Filtro.Strings = (
      '(OPR.IDTIPOINVEST = 2)'
      '(OPR.IDOPERACAOINVEST = OPA.IDOPERACAOINVEST) '
      '(OPA.IDACAO = INV.IDINVESTIMENTO)                               '
      '(OPA.IDBOLSAVALORES = BOV.IDBOLSAVALORES)'
      '(OPR.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO)'
      'OPR.IDCORRETVALORES = CORRETVALORES.IDCORRETVALORES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '10'
      '40'
      '15'
      '20'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 561
    Top = 36
  end
  object QryBuscaOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      ''
      'FROM CM.TIPOOPERACAO'
      ''
      'WHERE IDTIPOOPERACAO IN (SELECT GXT.IDTIPOOPERACAO'
      
        '                         FROM CM.GRUPOUSU GXU, CM.GRUPOUSUXTIPOO' +
        'PER GXT'
      '                         WHERE GXU.IDGRUPO   = GXT.IDGRUPO AND'
      '                               GXU.IDUSUARIO = :IDUSUARIO)'
      'OR'
      '      IDTIPOOPERACAO NOT IN (SELECT GXT.IDTIPOOPERACAO'
      '                             FROM CM.GRUPOUSUXTIPOOPER GXT)'
      ''
      'AND   IDTIPOINVEST = 2'
      ''
      'ORDER BY DESCTIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 86
    Top = 385
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object QryBuscaOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.TIPOOPERACAO".IDTIPOINVEST'
    end
    object QryBuscaOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"CM.TIPOOPERACAO".IDTIPOOPERACAO'
    end
    object QryBuscaOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = '"CM.TIPOOPERACAO".IDMERCADO'
    end
    object QryBuscaOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = '"CM.TIPOOPERACAO".DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = '"CM.TIPOOPERACAO".NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = '"CM.TIPOOPERACAO".TIPOCUSTODIA'
      Size = 1
    end
    object QryBuscaOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = '"CM.TIPOOPERACAO".VENCIMENTO'
    end
    object QryBuscaOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = '"CM.TIPOOPERACAO".TIPCREDOR'
      Size = 2
    end
    object QryBuscaOperacaoFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = '"CM.TIPOOPERACAO".FLGTRANSF'
      Size = 1
    end
    object QryBuscaOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaOperacaoFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object QryBuscaOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Size = 1
    end
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA,  '
      '       FLGTRATALOTE, DATAINICIO, FLGCARTPROP,'
      '       IDPLANOPREV,IDPATROCINADORA'
      'FROM '
      '       CM.CARTEIRAINVEST'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 119
    Top = 385
  end
  object QryBuscaCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDCORRETVALORES, SGLCORRETVALORES'
      ''
      'FROM CM.CORRETVALORES'
      ''
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 152
    Top = 385
  end
  object DsImpostosOperacao: TwwDataSource
    DataSet = QryImpostosOperacao
    Left = 543
    Top = 139
  end
  object QryBuscaImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDIMPOSTOINVEST, MOECODIGO,DESCIMPOSTOINVEST'
      ''
      'FROM CM.IMPOSTOINVEST'
      '')
    ValidateWithMask = True
    Left = 184
    Top = 385
  end
  object QryDespesasOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT '#9'IDDESPOPERINVEST, EMPRESAPROP, IDFORCLI, IDOPERACAOINVES' +
        'T, IDTIPOINVEST,'
      #9'IDTIPOOPERACAO, VLRDESPOPER, IDTIPODESPINVEST, '
      #9'DATAVENCDESPOPER, IDREGRACALCUSADA, IDREGRAVENCUSADA,'
      #9'FLGCALCDIARIO, DATAOPERACAO'
      ''
      'FROM CM.DESPOPERINVEST'
      ''
      'WHERE '#9'(IDOPERACAOINVEST = :IDOPERACAOINVEST)  '
      ''
      'ORDER BY IDTIPODESPINVEST')
    ValidateWithMask = True
    Left = 468
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,#0.00'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoDESCDESP2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'DESCTIPODESPINV'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 40
      Lookup = True
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'DESPOPERINVEST.DATAOPERACAO'
    end
  end
  object DsDespesasOperacao: TwwDataSource
    AutoEdit = False
    DataSet = QryDespesasOperacao
    Left = 498
    Top = 4
  end
  object QryBuscaDespesa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV'
      ''
      'FROM CM.TIPODESPINVEST'
      ''
      'ORDER BY DESCTIPODESPINV'
      #9)
    ValidateWithMask = True
    Left = 217
    Top = 385
    object QryBuscaDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
    end
    object QryBuscaDespesaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'TIPODESPINVEST.MOECODIGO'
    end
    object QryBuscaDespesaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
  end
  object QryBuscaCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM PESSOA PS, EMPRESAFORN EF'
      ' '
      'WHERE EF.IDFORCLI = PS.IDPESSOA ')
    ValidateWithMask = True
    Left = 248
    Top = 385
    object QryBuscaCredorRAZAOSOCIAL: TStringField
      DisplayLabel = 'Credor '
      DisplayWidth = 40
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object QryBuscaCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object Regra: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 529
    Top = 4
  end
  object QryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 560
    Top = 4
  end
  object QryImpostosOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'#9'IDOPERACAOINVEST, IDTIPOINVEST, '#9'IDTIPOOPERACAO,'
      #9'IDIMPOSTOINVEST,    IDREGRACALCUSADA, '#9'IDREGRAVENCUSADA, '
      #9'VLRIMPOSTOOPER,    DATAVENCIMPINVEST, '#9'FLGCALCDIARIO,  IDPESSOA'
      ''
      ''
      'FROM CM.IMPOSTOSXOPERACAO'
      ''
      'WHERE '#9'IDOPERACAOINVEST = :IDOPERACAOINVEST  AND'
      #9'FLGCALCDIARIO = 0 ')
    ValidateWithMask = True
    Left = 512
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryImpostosOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryImpostosOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryImpostosOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryImpostosOperacaoIDIMPOSTOINVEST: TFloatField
      FieldName = 'IDIMPOSTOINVEST'
    end
    object QryImpostosOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
    end
    object QryImpostosOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
    end
    object QryImpostosOperacaoVLRIMPOSTOOPER: TFloatField
      FieldName = 'VLRIMPOSTOOPER'
    end
    object QryImpostosOperacaoDATAVENCIMPINVEST: TDateTimeField
      FieldName = 'DATAVENCIMPINVEST'
    end
    object QryImpostosOperacaoFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object QryImpostosOperacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryImpostosOperacaoDESCIMPOSTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCIMPOSTO'
      LookupDataSet = QryBuscaImposto
      LookupKeyFields = 'IDIMPOSTOINVEST'
      LookupResultField = 'DESCIMPOSTOINVEST'
      KeyFields = 'IDIMPOSTOINVEST'
      Size = 40
      Lookup = True
    end
    object QryImpostosOperacaoCREDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'CREDOR'
      LookupDataSet = QryBuscaCredor
      LookupKeyFields = 'IDPESSOA'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'IDPESSOA'
      Size = 40
      Lookup = True
    end
  end
  object UpdPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.OPERACAOINVEST'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDINSTFIN = :IDINSTFIN,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDCARTORIDEST = :IDCARTORIDEST,'
      '  IDLOTE = :IDLOTE,'
      '  IDMODULO = :IDMODULO,'
      '  IDINVESTDEST = :IDINVESTDEST,'
      '  IDORDMOVINV = :IDORDMOVINV,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDCUSTDEST = :IDCUSTDEST,'
      '  VLRIR = :VLRIR'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into CM.OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, IDTIPOINVE' +
        'ST, '
      'IDTIPOOPERACAO, '
      '   IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO, '
      'PRECOUNITOPERACAO, '
      '   VLROPERACAO, DATAVENCOPER, IDINVESTIMENTO, EMPRESAPROP, '
      'IDFORCLI, IDCORRETVALORES, '
      '   MOECODIGO, IDCARTORIDEST, IDLOTE, IDMODULO, IDINVESTDEST, '
      'IDORDMOVINV, '
      '   IDCUSTORIG, IDCUSTDEST, VLRIR)'
      'values'
      '  (:IDOPERACAOINVEST, :IDCUSTODIANTE, :IDCARTEIRAINVEST, '
      ':IDTIPOINVEST, '
      '   :IDTIPOOPERACAO, :IDINSTFIN, :DATAOPERACAO, :NUMDOCUMENTO, '
      ':QTDEOPERACAO, '
      '   :PRECOUNITOPERACAO, :VLROPERACAO, :DATAVENCOPER, '
      ':IDINVESTIMENTO, :EMPRESAPROP, '
      
        '   :IDFORCLI, :IDCORRETVALORES, :MOECODIGO, :IDCARTORIDEST, :IDL' +
        'OTE, '
      ':IDMODULO, '
      
        '   :IDINVESTDEST, :IDORDMOVINV, :IDCUSTORIG, :IDCUSTDEST, :VLRIR' +
        ')')
    DeleteSQL.Strings = (
      'delete from CM.OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 328
    Top = 36
  end
  object QryCarteiraOriDest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA,  FLG' +
        'TRATALOTE, '
      #9'TRGDTINCLUSAO, TRGUSERINCLUSAO'
      ''
      'FROM CM.CARTEIRAINVEST'
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 479
    Top = 139
  end
  object QryAcaoBolsaTransf: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsBolsaValores
    SQL.Strings = (
      
        'SELECT '#9'AXB.IDBOLSAVALORES, AXB.IDACAO, AXB.MOECODIGO, AXB.QTDEL' +
        'OTE,'
      #9'INV.DESCINVESTIMENTO, INV.IDEMISSOR, ACA.CODTIPOACAO'
      ''
      'FROM '#9'CM.ACOESXBOLSA AXB, CM.INVESTIMENTO INV, ACAO ACA'
      ''
      'WHERE '#9'INV.FLGATIVO  <> '#39'N'#39'                            '#9'AND '
      #9'AXB.IDACAO = INV.IDINVESTIMENTO AND '
      #9'AXB.IDACAO = ACA.IDACAO '#9#9'AND '
      #9'AXB.IDBOLSAVALORES = :IDBOLSAVALORES '
      ''
      'ORDER BY INV.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 279
    Top = 385
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'ACOESXBOLSA.IDBOLSAVALORES'
      Visible = False
    end
    object FloatField2: TFloatField
      FieldName = 'IDACAO'
      Origin = 'ACOESXBOLSA.IDACAO'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'ACOESXBOLSA.MOECODIGO'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'ACOESXBOLSA.QTDELOTE'
      Visible = False
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'ACAO.CODTIPOACAO'
      Visible = False
      Size = 5
    end
  end
  object QryOrdMovInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDORDMOVINV, O.OBSMOVINV, O.QTDEORDMOVINV, O.PUORDMOVIN' +
        'V,'
      
        '       T.DESCTIPOOPERACAO, O.QTDEORDENADA, O.NUMDOCMOVINV, O.DAT' +
        'AORDMOVINV'
      ''
      'FROM ORDMOVINV O, TIPOOPERACAO T'
      ''
      'WHERE'
      '        ( O.IDCORRETVALORES  = :pIDCORRETVALORES )  AND'
      '        ( O.IDINVESTIMENTO   = :pIDINVESTIMENTO )   AND'
      '        ( O.IDTIPOOPERACAO   = :pIDTIPOOPERACAO )   AND'
      '        ( O.IDCARTEIRAINVEST = :pIDCARTEIRAINVEST)  AND'
      ''
      '        ( (O.IDLOTE = :pIDLOTE) OR (:pIDLOTE IS NULL) ) AND'
      ''
      '        ('
      '          ((:pTIPOCONSULTA = '#39'A'#39') AND (O.STATMOVINV = '#39'A'#39')) OR'
      
        '          ((:pTIPOCONSULTA = '#39'P'#39') AND (O.STATMOVINV IN ('#39'A'#39','#39'P'#39')' +
        ')) OR'
      '           (:pTIPOCONSULTA = '#39'T'#39')'
      '        ) AND'
      ''
      '        ( O.IDTIPOOPERACAO = T.IDTIPOOPERACAO )'
      ''
      '')
    PictureMasks.Strings = (
      'QTDEORDMOVINV'#9'#'#9'T'#9'T')
    ValidateWithMask = True
    Left = 280
    Top = 353
    ParamData = <
      item
        DataType = ftString
        Name = 'pIDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPOCONSULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPOCONSULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPOCONSULTA'
        ParamType = ptUnknown
      end>
    object QryOrdMovInvIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
    object QryOrdMovInvOBSMOVINV: TStringField
      FieldName = 'OBSMOVINV'
      Size = 200
    end
    object QryOrdMovInvQTDEORDMOVINV: TFloatField
      FieldName = 'QTDEORDMOVINV'
    end
    object QryOrdMovInvPUORDMOVINV: TFloatField
      FieldName = 'PUORDMOVINV'
    end
    object QryOrdMovInvDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryOrdMovInvQTDEORDENADA: TFloatField
      FieldName = 'QTDEORDENADA'
    end
    object QryOrdMovInvNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Size = 30
    end
    object QryOrdMovInvDATAORDMOVINV: TDateTimeField
      FieldName = 'DATAORDMOVINV'
    end
  end
  object QryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGORDMOVINV, PERCPUORDMOVINV  FROM  PARAMINVEST'
      ''
      '')
    ValidateWithMask = True
    Left = 379
    Top = 139
    object QryParamInvestFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'PARAMINVEST.FLGORDMOVINV'
      Size = 1
    end
    object QryParamInvestPERCPUORDMOVINV: TFloatField
      FieldName = 'PERCPUORDMOVINV'
      Origin = 'PARAMINVEST.PERCPUORDMOVINV'
    end
  end
  object QryQtdOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(QTDEOPERACAO)  AS QTDETOTOPERACAO'
      'FROM   CM.OPERACAOINVEST'
      'WHERE  ( IDORDMOVINV      = :pIDORDMOVINV )       AND'
      '       ( IDCORRETVALORES  = :pIDCORRETVALORES )   AND'
      '       ( IDCARTEIRAINVEST = :pIDCARTEIRAINVEST )  AND'
      '       ( IDTIPOOPERACAO   = :pIDTIPOOPERACAO )    AND'
      '       ( IDINVESTIMENTO   = :pIDINVESTIMENTO )    AND'
      
        '       ( ( IDLOTE         = :pIDLOTE ) OR ( '#39'-1'#39'   = :pIDLOTE ) ' +
        ')'
      '')
    ValidateWithMask = True
    Left = 217
    Top = 353
    ParamData = <
      item
        DataType = ftString
        Name = 'pIDORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDLOTE'
        ParamType = ptUnknown
      end>
    object QryQtdOperacoesQTDETOTOPERACAO: TFloatField
      FieldName = 'QTDETOTOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
  end
  object msOrdem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ORDMOVINV.NUMDOCMOVINV'
      'ORDMOVINV.PUORDMOVINV'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CORRETVALORES.SGLCORRETVALORES'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'EMISSOR.SIGLAEMISSOR')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Num. Documento'
      'Valor Unitário'
      'Investimento'
      'Corretora'
      'Nome do Usuário'
      'Emissor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORDMOVINV'
      'INVESTIMENTO'
      'CORRETVALORES'
      'USUARIOSISTEMA'
      'EMISSOR')
    CamposChave.Strings = (
      'ORDMOVINV.IDORDMOVINV')
    Filtro.Strings = (
      'ORDMOVINV.IDCORRETVALORES=CORRETVALORES.IDCORRETVALORES'
      'ORDMOVINV.IDUSUARIO=USUARIOSISTEMA.IDUSUARIO'
      ' ( EMISSOR.IDEMISSOR=INVESTIMENTO.IDEMISSOR )'
      '( ORDMOVINV.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO )')
    Mascaras.Strings = (
      ''
      '###,###,###,##0.00'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '10'
      '40'
      '10'
      '20'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 289
    Top = 36
  end
  object QryDadosOrdemSel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDORDMOVINV, O.OBSMOVINV, O.QTDEORDMOVINV, O.PUORDMOVIN' +
        'V,'
      
        '       T.DESCTIPOOPERACAO, O.QTDEORDENADA, O.NUMDOCMOVINV, TO_CH' +
        'AR(O.DATAORDMOVINV,'#39'DD/MM/YYYY'#39') AS DATAORDMOVINV,'
      
        '       O.IDCORRETVALORES,O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O' +
        '.IDTIPOOPERACAO'
      ''
      'FROM ORDMOVINV O, TIPOOPERACAO T'
      ''
      'WHERE'
      '        ( O.IDORDMOVINV  = :pIDORDMOVINV )  AND'
      ''
      '        ('
      '          ((:pTIPOCONSULTA = '#39'A'#39') AND (O.STATMOVINV = '#39'A'#39')) OR'
      
        '          ((:pTIPOCONSULTA = '#39'P'#39') AND (O.STATMOVINV IN ('#39'A'#39','#39'P'#39')' +
        ')) OR'
      '           (:pTIPOCONSULTA = '#39'T'#39')'
      '        ) AND'
      ''
      '        ( O.IDTIPOOPERACAO = T.IDTIPOOPERACAO )'
      ''
      '')
    ValidateWithMask = True
    Left = 248
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPOCONSULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPOCONSULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPOCONSULTA'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CUS.IDCUSTODIANTE, CUS.SGLCUSTODIANTE'
      'FROM CM.CUSTODIANTE CUS'
      'ORDER BY CUS.SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 184
    Top = 353
  end
end
