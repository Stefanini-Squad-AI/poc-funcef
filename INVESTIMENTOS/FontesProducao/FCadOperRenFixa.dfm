inherited FrmCadOperRenFixa: TFrmCadOperRenFixa
  Left = 213
  Top = 58
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Operacoes de Renda Fixa'
  ClientHeight = 515
  ClientWidth = 611
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 611
    Height = 429
    object Label2: TLabel
      Left = 17
      Top = 16
      Width = 123
      Height = 13
      Caption = 'Titulo de Renda Fixa '
    end
    object BtCriaTitulo: TSpeedButton
      Left = 292
      Top = 30
      Width = 23
      Height = 22
      Hint = 'Cria ou Pesquisa Informações dos Titulos '
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF005555555B5555
        55555B5555BB775555B555BB5500F055BB5555BB00FFF0BBBB555500FFFFFF0B
        B555557FFFFC8F0B5555557FFCCFFFF0B55555B7FFFFC8F0BB55BBB7FFCCFFFF
        0BBB55BB7FFFFC8FF055555B7FFCCFFFFF05555BB7FFFFFF775555BBBB7FFF77
        BB5555BB55B77755BB555B55555B555555B55555555B55555555}
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = BtCriaTituloClick
    end
    object Label3: TLabel
      Left = 17
      Top = 56
      Width = 134
      Height = 13
      Caption = 'Numero do Documento '
    end
    object Label18: TLabel
      Left = 347
      Top = 56
      Width = 112
      Height = 13
      Caption = 'Data de Liquidação'
    end
    object Label4: TLabel
      Left = 348
      Top = 16
      Width = 109
      Height = 13
      Caption = 'Data da Operação '
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 100
      Width = 609
      Height = 328
      ActivePage = TS1
      Align = alBottom
      HotTrack = True
      MultiLine = True
      TabOrder = 0
      OnChange = PageControl1Change
      object TS1: TTabSheet
        Caption = 'Dados da Operação'
        object Bevel1: TBevel
          Left = 0
          Top = 0
          Width = 601
          Height = 300
          Align = alClient
        end
        object Label5: TLabel
          Left = 8
          Top = 2
          Width = 107
          Height = 13
          Caption = 'Tipo de Operação '
        end
        object Label6: TLabel
          Left = 8
          Top = 42
          Width = 118
          Height = 13
          Caption = 'Quantidade Operada'
          FocusControl = DBEdit3
        end
        object Label7: TLabel
          Left = 8
          Top = 81
          Width = 77
          Height = 13
          Caption = 'PU Operação'
          FocusControl = DBEdit4
        end
        object Label8: TLabel
          Left = 8
          Top = 121
          Width = 111
          Height = 13
          Caption = 'Valor da Operação '
          FocusControl = DBEdit5
        end
        object Label9: TLabel
          Left = 296
          Top = 81
          Width = 117
          Height = 13
          Caption = 'Quantidade por Lote'
          Visible = False
        end
        object Label11: TLabel
          Left = 296
          Top = 2
          Width = 121
          Height = 13
          Caption = 'Corretora de Valores '
        end
        object BtCalc: TSpeedButton
          Left = 162
          Top = 137
          Width = 25
          Height = 25
          Flat = True
          Glyph.Data = {
            EE000000424DEE0000000000000076000000280000000F0000000F0000000100
            0400000000007800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDD0DDD000000000DDD0DD08888888880DD0DD0FF8F8F8F80DD0DD0F00000008
            0DD0DD0FF8F8F8F80DD0DD0F000000080DD0DD0FF8F8F8F80DD0DD0F00000008
            0DD0DD0FF8F8F8F80DD0DD0F000000080DD0DD0F000000080DD0DD0FFFFFFFF8
            0DD0DDD000000000DDD0DDDDDDDDDDDDDDD0}
          Visible = False
        end
        object Label19: TLabel
          Left = 296
          Top = 42
          Width = 143
          Height = 13
          Caption = 'Carteira de Investimento '
        end
        object Label22: TLabel
          Left = 159
          Top = 42
          Width = 122
          Height = 13
          Caption = 'Identificação do Lote'
          FocusControl = DBEdit4
        end
        object Label10: TLabel
          Left = 8
          Top = 241
          Width = 69
          Height = 13
          Caption = 'Observação'
          FocusControl = DBEdit5
        end
        object BtMostraCot: TSpeedButton
          Left = 139
          Top = 97
          Width = 23
          Height = 22
          Hint = 'Mostrar Cotação do Investimento'
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
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = BtMostraCotClick
        end
        object Label20: TLabel
          Left = 145
          Top = 161
          Width = 100
          Height = 13
          Caption = 'Valor do Imposto '
          FocusControl = DBEdit10
        end
        object Label21: TLabel
          Left = 8
          Top = 161
          Width = 89
          Height = 13
          Caption = 'PU de Mercado'
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 61
          Width = 129
          Height = 21
          DataField = 'QTDEOPERACAO'
          DataSource = ds
          MaxLength = 21
          TabOrder = 1
          OnChange = DBEdit3Change
          OnExit = DBEdit5Exit
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 97
          Width = 129
          Height = 21
          DataField = 'PRECOUNITOPERACAO'
          DataSource = ds
          MaxLength = 21
          TabOrder = 2
          OnChange = DBEdit3Change
          OnExit = DBEdit5Exit
          OnKeyPress = DBEdit4KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 137
          Width = 153
          Height = 21
          Color = clWhite
          DataField = 'VLROPERACAO'
          DataSource = ds
          TabOrder = 3
          OnChange = DBEdit5Change
          OnExit = DBEdit5Exit
          OnKeyPress = DBEdit5KeyPress
        end
        object DbLkcTipoOperacao: TwwDBLookupCombo
          Left = 8
          Top = 18
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
          OnExit = DBEdit5Exit
        end
        object DBEdit2: TEdit
          Left = 312
          Top = 97
          Width = 105
          Height = 21
          TabOrder = 12
          Text = 'DBEdit2'
          Visible = False
        end
        object DBEdit2Tela: TRealEdit
          Left = 296
          Top = 97
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
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object DbLkcBuscaCorretor: TwwDBLookupCombo
          Left = 296
          Top = 18
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
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object DbLkcCarteira: TwwDBLookupCombo
          Left = 296
          Top = 58
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
          OnExit = DBEdit5Exit
        end
        object GrbSaldo: TGroupBox
          Left = 8
          Top = 204
          Width = 265
          Height = 37
          Caption = ' Saldo de Caixa '
          TabOrder = 8
          Visible = False
          object PnlSaldoCaixa: TPanel
            Left = 2
            Top = 15
            Width = 261
            Height = 20
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Saldo de Caixa'
            TabOrder = 0
          end
        end
        object PnlLote: TPanel
          Left = 160
          Top = 61
          Width = 121
          Height = 23
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 9
        end
        object edtObs: TDBMemo
          Left = 8
          Top = 256
          Width = 545
          Height = 41
          DataField = 'OBSERVACAO'
          DataSource = ds
          MaxLength = 200
          TabOrder = 10
        end
        object DBEdit10: TDBEdit
          Left = 145
          Top = 177
          Width = 153
          Height = 21
          Color = clWhite
          DataField = 'VLRIR'
          DataSource = ds
          TabOrder = 11
          OnChange = DBEdit5Change
          OnKeyPress = DBEdit5KeyPress
        end
        object DBEdit11: TDBEdit
          Left = 8
          Top = 177
          Width = 129
          Height = 21
          DataField = 'PUMERCADO'
          DataSource = ds
          MaxLength = 21
          TabOrder = 4
          OnChange = DBEdit3Change
          OnExit = DBEdit5Exit
          OnKeyPress = DBEdit4KeyPress
        end
      end
      object TS2: TTabSheet
        Caption = 'Carteira de Investimento'
        TabVisible = False
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 576
          Height = 212
          Align = alClient
        end
      end
      object TS3: TTabSheet
        Caption = 'Custodia    '
        TabVisible = False
        object Bevel3: TBevel
          Left = 0
          Top = 0
          Width = 576
          Height = 250
          Align = alClient
        end
      end
      object TS4: TTabSheet
        Caption = 'Rubricas da Operação'
        object Bevel4: TBevel
          Left = 0
          Top = 31
          Width = 601
          Height = 269
          Align = alClient
        end
        object GridDespesas: TDBGrid
          Left = 0
          Top = 31
          Width = 601
          Height = 269
          Align = alClient
          DataSource = DsDespesasOperacao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 3
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
              Width = 307
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAVENCDESPOPER'
              Title.Caption = 'Vencimento'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRDESPOPER'
              Title.Caption = 'Valor da Rubrica'
              Width = 156
              Visible = True
            end>
        end
        object PnlDespesas: TPanel
          Left = 0
          Top = 31
          Width = 601
          Height = 269
          Align = alClient
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
          object Label1: TLabel
            Left = 200
            Top = 91
            Width = 111
            Height = 13
            Caption = 'Valor da Operação '
            FocusControl = DBEdit9
          end
          object Dock976: TDock97
            Left = 515
            Top = 1
            Width = 85
            Height = 267
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
        object Dock975: TDock97
          Left = 0
          Top = 0
          Width = 601
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object Toolbar972: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object BtAltDesp: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar Valores'
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
              OnClick = BtAltDespClick
            end
          end
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
      end
      object TS5: TTabSheet
        Caption = 'Impostos    '
        TabVisible = False
        object Bevel5: TBevel
          Left = 0
          Top = 31
          Width = 601
          Height = 269
          Align = alClient
        end
        object GridImpostos: TDBGrid
          Left = 0
          Top = 31
          Width = 601
          Height = 269
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
          Width = 601
          Height = 269
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
            Left = 515
            Top = 1
            Width = 85
            Height = 267
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
          Width = 601
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
    object DbLkcTitRenFixa: TwwDBLookupCombo
      Left = 17
      Top = 30
      Width = 272
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Titulos de Renda Fixa')
      DataField = 'IDINVESTIMENTO'
      DataSource = ds
      LookupTable = QryTitRenFixa
      LookupField = 'IDTITRENFIXA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DbLkcTitRenFixaChange
    end
    object DBEdit1: TDBEdit
      Left = 17
      Top = 70
      Width = 272
      Height = 21
      Color = clWhite
      DataField = 'NUMDOCUMENTO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 2
    end
    object BtNovoDoc: TBitBtn
      Left = 292
      Top = 69
      Width = 23
      Height = 22
      Hint = 'Gera Número do Documento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtNovoDocClick
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
    object DBDateEdit4: TCMDateTimePicker
      Left = 348
      Top = 70
      Width = 144
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
      TabOrder = 4
    end
    object DBDateEdit1: TCMDateTimePicker
      Left = 348
      Top = 30
      Width = 144
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
      TabOrder = 5
      OnChange = DbLkcTitRenFixaChange
    end
  end
  inherited Dock972: TDock97
    Width = 611
  end
  inherited Dock971: TDock97
    Top = 476
    Width = 611
    inherited tb97Fundo: TToolbar97
      Left = 439
      DockPos = 441
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 270
      DockPos = 272
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
    inherited dbnav: TDBNavigator
      Width = 110
      VisibleButtons = []
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
    Left = 502
    Top = 196
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 197
    Top = 6
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 168
    Top = 6
  end
  object QryTitRenFixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'TRF.IDTITRENFIXA, INV.DESCINVESTIMENTO, INV.IDEMISSOR,'
      #9'TTR.CODTIPRENFIXA, IDMOEDAREG, VLRRESGATE'
      'FROM TIPOTITRENFIXA TTR, TITRENFIXA TRF, INVESTIMENTO INV'
      ''
      'WHERE '#9'TRF.CODTIPRENFIXA = TTR.CODTIPRENFIXA AND '
      #9'TRF.IDTITRENFIXA     = INV.IDINVESTIMENTO'
      ''
      'ORDER BY TTR.DESCTIPRENFIXA ')
    ValidateWithMask = True
    Left = 267
    Top = 353
  end
  object DsTitRenFixa: TwwDataSource
    DataSet = QryTitRenFixa
    Left = 304
    Top = 353
  end
  object DsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = QrySubTipo
    Left = 343
    Top = 4
  end
  object QrySubTipo: TwwQuery
    AfterScroll = QrySubTipoAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT '#9'IDREGRACALCUSADA, IDOPERACAOINVEST, SALDOTIT, VLRAGIOOPE' +
        'R'
      ''
      'FROM CM.OPRRENFIX'
      ''
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 313
    Top = 4
    object QrySubTipoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
    end
    object QrySubTipoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QrySubTipoSALDOTIT: TFloatField
      FieldName = 'SALDOTIT'
    end
    object QrySubTipoVLRAGIOOPER: TFloatField
      FieldName = 'VLRAGIOOPER'
    end
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterScroll = QryPrincipalAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST,IDTIPO' +
        'INVEST,'
      #9'IDTIPOOPERACAO, IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO, '
      #9'QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER,'
      #9'IDINVESTIMENTO, EMPRESAPROP, IDFORCLI, IDCORRETVALORES,'
      #9'MOECODIGO, IDLOTE, OBSERVACAO, FLGCUSTODIA,VLRIR,PUMERCADO'
      ''
      ''
      'FROM CM.OPERACAOINVEST'
      ''
      'WHERE IDTIPOINVEST =1'
      ''
      ' ')
    UpdateObject = UpdPrincipal
    ValidateWithMask = True
    Left = 503
    Top = 148
    object QryPrincipalIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryPrincipalIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryPrincipalIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryPrincipalIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryPrincipalIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryPrincipalIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
    end
    object QryPrincipalDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryPrincipalNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryPrincipalQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryPrincipalPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object QryPrincipalVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
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
    object QryPrincipalIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryPrincipalOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object QryPrincipalFLGCUSTODIA: TStringField
      FieldName = 'FLGCUSTODIA'
      Size = 1
    end
    object QryPrincipalVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryPrincipalPUMERCADO: TFloatField
      FieldName = 'PUMERCADO'
      Origin = 'BASEDADOS.OPERACAOINVEST.PUMERCADO'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 227
    Top = 6
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERACAOINVEST.DATAOPERACAO'
      'OPERACAOINVEST.NUMDOCUMENTO'
      'INVESTIMENTO.FLGATIVO'
      'TIPOOPERACAO.DESCTIPOOPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Titulo de Renda Fixa'
      'Data da Operação '
      'Número do Documento '
      'Ativa'
      'Tipo Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'INVESTIMENTO'
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'OPERACAOINVEST.IDOPERACAOINVEST')
    Filtro.Strings = (
      'OPERACAOINVEST.IDTIPOINVEST = 1 '
      'OPERACAOINVEST.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERACAOINVEST.IDTIPOOPERACAO  = TIPOOPERACAO.IDTIPOOPERACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '8'
      '19'
      '1'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 256
    Top = 6
  end
  object QryBuscaOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV,  RECPAG'
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
      'AND   IDTIPOINVEST = 1'
      ''
      'ORDER BY DESCTIPOOPERACAO'
      ''
      '')
    ValidateWithMask = True
    Left = 346
    Top = 353
    ParamData = <
      item
        DataType = ftUnknown
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
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Size = 1
    end
    object QryBuscaOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9
      '      IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA, '
      '      TRGDTINCLUSAO, TRGUSERINCLUSAO,IDPLANOPREV,'
      '      IDPATROCINADORA'
      'FROM '
      '      CM.CARTEIRAINVEST'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 491
    Top = 313
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
    Left = 412
    Top = 353
  end
  object DsImpostosOperacao: TwwDataSource
    DataSet = QryImpostosOperacao
    Left = 407
    Top = 4
  end
  object QryBuscaImposto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDIMPOSTOINVEST, MOECODIGO,DESCIMPOSTOINVEST'
      ''
      'FROM CM.IMPOSTOINVEST'
      '')
    ValidateWithMask = True
    Left = 444
    Top = 353
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
      'WHERE '#9'(IDOPERACAOINVEST = :IDOPERACAOINVEST)  ')
    ValidateWithMask = True
    Left = 444
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = 'DESPOPERINVEST.IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'DESPOPERINVEST.IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'DESPOPERINVEST.IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'DESPOPERINVEST.IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'DESPOPERINVEST.IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = 'DESPOPERINVEST.DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = 'DESPOPERINVEST.IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = 'DESPOPERINVEST.IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoDESCDESP: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'DESCTIPODESPINV'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 40
      Lookup = True
    end
    object QryDespesasOperacaoDESCCRED: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCCRED'
      LookupDataSet = QryBuscaCredor
      LookupKeyFields = 'IDPESSOA'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'IDFORCLI'
      Size = 40
      Lookup = True
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'DESPOPERINVEST.FLGCALCDIARIO'
    end
    object QryDespesasOperacaoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,#0.00'
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'DESPOPERINVEST.DATAOPERACAO'
    end
  end
  object DsDespesasOperacao: TwwDataSource
    AutoEdit = False
    DataSet = QryDespesasOperacao
    Left = 474
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
    Left = 477
    Top = 353
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
      'FROM PESSOA PS, EMPRESAFORN EF '
      ''
      'WHERE EF.IDFORCLI = PS.IDPESSOA '
      '')
    ValidateWithMask = True
    Left = 508
    Top = 353
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
    Left = 377
    Top = 4
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
      '  IDLOTE = :IDLOTE,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  FLGCUSTODIA = :FLGCUSTODIA,'
      '  VLRIR = :VLRIR,'
      '  PUMERCADO = :PUMERCADO'
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
      '   MOECODIGO, IDLOTE, OBSERVACAO, FLGCUSTODIA, VLRIR, PUMERCADO)'
      'values'
      '  (:IDOPERACAOINVEST, :IDCUSTODIANTE, :IDCARTEIRAINVEST, '
      ':IDTIPOINVEST, '
      '   :IDTIPOOPERACAO, :IDINSTFIN, :DATAOPERACAO, :NUMDOCUMENTO, '
      ':QTDEOPERACAO, '
      '   :PRECOUNITOPERACAO, :VLROPERACAO, :DATAVENCOPER, '
      ':IDINVESTIMENTO, :EMPRESAPROP, '
      
        '   :IDFORCLI, :IDCORRETVALORES, :MOECODIGO, :IDLOTE, :OBSERVACAO' +
        ', '
      ':FLGCUSTODIA, '
      '   :VLRIR, :PUMERCADO)')
    DeleteSQL.Strings = (
      'delete from CM.OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 473
    Top = 148
  end
end
