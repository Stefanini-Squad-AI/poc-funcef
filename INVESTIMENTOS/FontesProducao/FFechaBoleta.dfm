inherited FrmFechaBoleta: TFrmFechaBoleta
  Left = 226
  Top = 102
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Fechamento da Boleta'
  ClientHeight = 512
  ClientWidth = 790
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 473
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 49
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 113
        Top = 4
        Width = 53
        Height = 13
        Caption = 'Corretora'
      end
      object Label2: TLabel
        Left = 575
        Top = 4
        Width = 98
        Height = 13
        Caption = 'Data Referência '
      end
      object Label3: TLabel
        Left = 679
        Top = 4
        Width = 98
        Height = 13
        Caption = 'Data Liquidação '
      end
      object Label4: TLabel
        Left = 9
        Top = 4
        Width = 65
        Height = 13
        Caption = 'Documento'
      end
      object Label11: TLabel
        Left = 302
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Plano / Patro'
      end
      object dbeCorretora: TDBEdit
        Left = 113
        Top = 20
        Width = 179
        Height = 21
        DataField = 'NOME'
        DataSource = DsConsulta
        Enabled = False
        TabOrder = 0
      end
      object dbeDtRef: TDBEdit
        Left = 575
        Top = 20
        Width = 95
        Height = 21
        DataField = 'DATAOPERACAO'
        DataSource = DsConsulta
        Enabled = False
        TabOrder = 1
      end
      object dbeDataLiquidacao: TDBEdit
        Left = 679
        Top = 20
        Width = 95
        Height = 21
        DataField = 'DATAVENCOPER'
        DataSource = DsConsulta
        Enabled = False
        TabOrder = 2
      end
      object dbeDocumento: TDBEdit
        Left = 9
        Top = 20
        Width = 95
        Height = 21
        Color = clWhite
        DataField = 'NUMDOCUMENTO'
        DataSource = DsConsulta
        Enabled = False
        TabOrder = 3
      end
      object dbePlanoPatro: TDBEdit
        Left = 301
        Top = 20
        Width = 266
        Height = 21
        DataField = 'PLANPRVCONTABPATRO'
        DataSource = DsConsulta
        Enabled = False
        TabOrder = 4
      end
    end
    object PnlOperDoc: TPanel
      Left = 1
      Top = 50
      Width = 788
      Height = 158
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object pnlConsulta: TPanel
        Left = 1
        Top = 24
        Width = 786
        Height = 133
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 2
        OnExit = PnlDadosDespesaExit
        object lblBolsa: TLabel
          Left = 16
          Top = 8
          Width = 96
          Height = 13
          Caption = 'Bolsa de Valores'
        end
        object lblInvestimento: TLabel
          Left = 16
          Top = 53
          Width = 30
          Height = 13
          Caption = 'Ação'
        end
        object lblTpOperacao: TLabel
          Left = 216
          Top = 8
          Width = 103
          Height = 13
          Caption = 'Tipo de Operação'
        end
        object lblQuantidade: TLabel
          Left = 328
          Top = 53
          Width = 66
          Height = 13
          Caption = 'Quantidade'
        end
        object lblVlrOperacao: TLabel
          Left = 504
          Top = 53
          Width = 107
          Height = 13
          Caption = 'Valor da Operação'
        end
        object dbeVlrOperacao: TDBEdit
          Left = 504
          Top = 69
          Width = 169
          Height = 21
          DataField = 'VLROPERACAO'
          DataSource = DsConsulta
          TabOrder = 0
        end
        object Dock972: TDock97
          Left = 700
          Top = 1
          Width = 85
          Height = 131
          AllowDrag = False
          BoundLines = [blLeft]
          Position = dpRight
          object Toolbar971: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97Detalhe'
            DockPos = 0
            TabOrder = 0
            object bbtnOkConsulta: TBitBtn
              Left = 0
              Top = 0
              Width = 80
              Height = 27
              Caption = '&OK'
              Default = True
              TabOrder = 0
              OnClick = bbtnOkConsultaClick
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
            object bbtnCancelaConsulta: TBitBtn
              Left = 0
              Top = 27
              Width = 80
              Height = 27
              Cancel = True
              Caption = '&Cancelar'
              TabOrder = 1
              OnClick = bbtnCancelaConsultaClick
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
            object bbtnVoltarConsulta: TBitBtn
              Left = 0
              Top = 54
              Width = 80
              Height = 27
              Cancel = True
              Caption = '&Voltar'
              TabOrder = 2
              OnClick = bbtnVoltarConsultaClick
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
        object dbeInvestimento: TDBEdit
          Left = 16
          Top = 69
          Width = 297
          Height = 21
          DataField = 'DESCINVESTIMENTO'
          DataSource = DsConsulta
          Enabled = False
          TabOrder = 2
        end
        object dbeTpOperacao: TDBEdit
          Left = 216
          Top = 24
          Width = 329
          Height = 21
          DataField = 'DESCTIPOOPERACAO'
          DataSource = DsConsulta
          Enabled = False
          TabOrder = 3
        end
        object dbeQuantidade: TDBEdit
          Left = 328
          Top = 69
          Width = 169
          Height = 21
          DataField = 'QTDEOPERACAO'
          DataSource = DsConsulta
          Enabled = False
          TabOrder = 4
        end
        object dbeBolsa: TDBEdit
          Left = 16
          Top = 24
          Width = 169
          Height = 21
          DataField = 'SGLBOLSAVALORES'
          DataSource = DsConsulta
          Enabled = False
          TabOrder = 5
        end
      end
      object dbGridConsulta: TDBGrid
        Left = 1
        Top = 24
        Width = 786
        Height = 133
        Align = alClient
        DataSource = DsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopConsulta
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbGridConsultaCellClick
        OnDblClick = dbGridConsultaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'SGLBOLSAVALORES'
            Title.Alignment = taCenter
            Title.Caption = 'Bolsa'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCINVESTIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Investimento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCTIPOOPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo de Operação'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCMERCADO'
            Title.Alignment = taCenter
            Title.Caption = 'Mercado'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDEOPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Operação'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOUNITOPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Preço Unit.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLROPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Operação '
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALDESPESAS'
            Title.Alignment = taCenter
            Title.Caption = 'Tot.Despesa'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -9
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 786
        Height = 23
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Operações do Documento'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 403
      Width = 788
      Height = 69
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lblDespesas: TLabel
        Left = 8
        Top = 10
        Width = 72
        Height = 16
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 173
        Top = 10
        Width = 92
        Height = 16
        Caption = 'Total Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PnlTotLiquido: TPanel
        Left = 173
        Top = 28
        Width = 151
        Height = 25
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PnlDespesas: TPanel
        Left = 8
        Top = 28
        Width = 151
        Height = 25
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlMensagem: TPanel
        Left = 372
        Top = 4
        Width = 415
        Height = 26
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object pnlProgresso: TPanel
        Left = 372
        Top = 36
        Width = 415
        Height = 26
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        object prgProgresso: TProgressBar
          Left = 2
          Top = 2
          Width = 411
          Height = 22
          Align = alClient
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
    end
    object PnlDesp: TPanel
      Left = 1
      Top = 208
      Width = 788
      Height = 195
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 3
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 786
        Height = 23
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Despesas da Operação'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object PgCt: TPageControl
        Left = 1
        Top = 24
        Width = 786
        Height = 170
        ActivePage = TbConsolidado
        Align = alClient
        HotTrack = True
        TabOrder = 1
        TabPosition = tpBottom
        OnChange = PgCtChange
        object tbDet: TTabSheet
          Caption = 'Detalhes'
          object PnlDadosDespesa: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 142
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            OnExit = PnlDadosDespesaExit
            object SB1: TSpeedButton
              Left = 381
              Top = 80
              Width = 22
              Height = 23
              Hint = 'Busca Credor'
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
              ParentShowHint = False
              ShowHint = True
              OnClick = SB1Click
            end
            object Label7: TLabel
              Left = 16
              Top = 10
              Width = 124
              Height = 13
              Caption = 'Descrição da Rubrica'
            end
            object Label8: TLabel
              Left = 16
              Top = 64
              Width = 38
              Height = 13
              Caption = 'Credor'
            end
            object Label9: TLabel
              Left = 424
              Top = 8
              Width = 98
              Height = 13
              Caption = 'Data Vencimento'
            end
            object Label10: TLabel
              Left = 424
              Top = 64
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object DBEdit6: TDBEdit
              Left = 16
              Top = 80
              Width = 361
              Height = 21
              DataField = 'NOME'
              DataSource = DsDespesasOperacao
              Enabled = False
              TabOrder = 1
            end
            object DBEdit8: TDBEdit
              Left = 424
              Top = 80
              Width = 169
              Height = 21
              DataField = 'VLRDESPOPER'
              DataSource = DsDespesasOperacao
              TabOrder = 3
            end
            object Dock974: TDock97
              Left = 692
              Top = 1
              Width = 85
              Height = 140
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
            object DBEdit5: TDBEdit
              Left = 16
              Top = 24
              Width = 361
              Height = 21
              Color = clBtnFace
              DataField = 'DESCTIPODESPINV'
              DataSource = DsDespesasOperacao
              Enabled = False
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 424
              Top = 24
              Width = 169
              Height = 21
              Color = clBtnFace
              DataField = 'DATAVENCDESPOPER'
              DataSource = DsDespesasOperacao
              Enabled = False
              TabOrder = 2
            end
          end
          object GridDespesas: TDBGrid
            Left = 0
            Top = 0
            Width = 778
            Height = 142
            Hint = 'Botão Direito Altera'
            Align = alClient
            DataSource = DsDespesasOperacao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = PopDespesas
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnColExit = GridDespesasColExit
            OnDblClick = GridDespesasDblClick
            OnExit = GridDespesasExit
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCTIPODESPINV'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Descricão das Despesas'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 213
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Title.Alignment = taCenter
                Title.Caption = 'Credor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 288
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAVENCDESPOPER'
                Title.Alignment = taCenter
                Title.Caption = 'Vencimento'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLRDESPOPER'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 126
                Visible = True
              end>
          end
        end
        object TbConsolidado: TTabSheet
          Caption = 'Consolidado'
          object pnlDetlConsolidado: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 142
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            OnExit = PnlDadosDespesaExit
            object Label5: TLabel
              Left = 16
              Top = 10
              Width = 148
              Height = 13
              Caption = 'Devolução de Corretagem'
            end
            object Dock973: TDock97
              Left = 692
              Top = 1
              Width = 85
              Height = 140
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object Toolbar972: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object btnOkConsolidado: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 80
                  Height = 27
                  Caption = '&OK'
                  Default = True
                  TabOrder = 0
                  OnClick = btnOkConsolidadoClick
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
                object btnCancelaConsolidado: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Cancelar'
                  TabOrder = 1
                  OnClick = btnCancelaConsolidadoClick
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
                object btnVoltarConsolidado: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = btnVoltarConsolidadoClick
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
            object edtPercDevCorret: TEdit
              Left = 18
              Top = 27
              Width = 121
              Height = 21
              TabOrder = 1
              Text = '0,00'
            end
          end
          object GridConsolidado: TDBGrid
            Left = 0
            Top = 0
            Width = 778
            Height = 142
            Align = alClient
            DataSource = DtsConsolidado
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            PopupMenu = PopAltDevCorret
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCTIPODESPINV'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Descricão da Despesa'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 492
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLRDESPOPER'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 233
                Visible = True
              end>
          end
        end
        object TbObs: TTabSheet
          Caption = 'Observação'
          object mmoObs: TMemo
            Left = 0
            Top = 0
            Width = 778
            Height = 142
            Align = alClient
            MaxLength = 300
            TabOrder = 0
          end
        end
      end
      object pnlCorretLiquida: TPanel
        Left = 608
        Top = 175
        Width = 150
        Height = 18
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        BevelOuter = bvLowered
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel8: TPanel
        Left = 420
        Top = 175
        Width = 174
        Height = 18
        Anchors = [akRight, akBottom]
        BevelOuter = bvLowered
        Caption = 'Corretagem Líquida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 473
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 14
      DockPos = 302
      inherited sep1: TToolbarSep97
        Left = 689
      end
      inherited bbtnSair: TBitBtn
        Left = 608
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 691
      end
      object BtImprimeDocumento: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Imprime o Detalhamento da Boleta '
        Cancel = True
        Caption = '&Detalhes'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BtImprimeDocumentoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnConfirmar: TBitBtn
        Left = 447
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        Enabled = False
        TabOrder = 3
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 527
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Cancelar'
        TabOrder = 4
        OnClick = bbtnCancelarClick
        Kind = bkCancel
        Spacing = 2
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Imprime a Boleta de Operação'
        Cancel = True
        Caption = '&Boleta'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        NumGlyphs = 2
        Spacing = 2
      end
      object BtRecalcula: TBitBtn
        Left = 160
        Top = 0
        Width = 146
        Height = 33
        Caption = 'Recalcula Despesas'
        TabOrder = 6
        OnClick = BtRecalculaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        Margin = 1
        NumGlyphs = 2
      end
      object BtMovCarteira: TBitBtn
        Left = 306
        Top = 0
        Width = 141
        Height = 33
        Caption = 'Movimenta Carteira '
        TabOrder = 7
        OnClick = BtMovCarteiraClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888800000088888008888888888800000088880FF008888888880000008880
          F00FF008888888000000880F0FF00FF008888800000080F0F78FF00FF0888800
          0000880F70078FF008888800000080F70FB0078FF088880000008800FBFBF007
          088888000000880FBFBFBFB008888800000080FBFBFBFBFBF088880000008800
          BFBFBFBF088888000000888800FBFBF088088800000088888800B80880008800
          0000888888880088000008000000888888888888880888000000888888888888
          880888000000888888888888888888000000}
        Margin = 1
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 461
    Top = 139
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object DsConsulta: TwwDataSource
    DataSet = QryConsulta
    Left = 117
    Top = 57
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 693
    Top = 177
  end
  object QryBuscaDespesa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV, '
      #9'NATUREZAOPERACAO'
      ''
      'FROM CM.TIPODESPINVEST')
    ValidateWithMask = True
    Left = 637
    Top = 217
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
    object QryBuscaDespesaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPODESPINVEST.NATUREZAOPERACAO'
      Size = 1
    end
  end
  object QryBuscaCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM PESSOA PS, EMPRESAFORN EF '
      ''
      'WHERE PS.IDPESSOA  = EF.IDFORCLI '
      ''
      'ORDER BY PS.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 661
    Top = 177
    object QryBuscaCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
    object QryBuscaCredorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object UpdDespesas: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.DESPOPERINVEST'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  VLRDESPOPER = :VLRDESPOPER,'
      '  DATAVENCDESPOPER = :DATAVENCDESPOPER'
      'where'
      '  IDDESPOPERINVEST = :OLD_IDDESPOPERINVEST')
    InsertSQL.Strings = (
      'SELECT * FROM DESPOPERINVEST'
      'WHERE 1=2'
      ''
      '')
    DeleteSQL.Strings = (
      'SELECT * FROM DESPOPERINVEST'
      'WHERE 1=2'
      ''
      '')
    Left = 212
    Top = 51
  end
  object QryDespesasOperacao: TwwQuery
    CachedUpdates = True
    AfterOpen = QryDespesasOperacaoAfterOpen
    AfterInsert = QryDespesasOperacaoAfterInsert
    AfterPost = QryDespesasOperacaoAfterPost
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    DataSource = DsConsulta
    SQL.Strings = (
      
        'SELECT '#9'DOP.IDDESPOPERINVEST, DOP.IDFORCLI,       DOP.IDOPERACAO' +
        'INVEST,'
      
        '        DOP.IDTIPOINVEST,     DOP.IDTIPOOPERACAO, NVL(DOP.VLRDES' +
        'POPER,0) AS VLRDESPOPER,'
      
        '        OI.DATAOPERACAO,      PE.NOME,            OI.IDPLANPREVC' +
        'TBPATR, '
      
        '        DOP.IDTIPODESPINVEST, DOP.DATAVENCDESPOPER, DOP.IDREGRAC' +
        'ALCUSADA,'
      
        '        DOP.IDREGRAVENCUSADA, OI.NUMDOCUMENTO,      OI.IDINVESTI' +
        'MENTO, OI.IDCORRETVALORES,'
      
        '        OI.IDCARTEIRAINVEST,  OI.IDCARTEIRAGERENC,  OI.VLROPERAC' +
        'AO,    OI.QTDEOPERACAO, OI.MOECODIGO, OI.IDLOTE,'
      
        '        DECODE(DOP.FLGCALCDIARIO,0, '#39'N'#39', '#39'S'#39') AS FLGCALCDIARIO, ' +
        'TP.DESCTIPOOPERACAO,'
      
        '        IV.DESCINVESTIMENTO, TP.NATUREZAOPERACAO, TD.DESCTIPODES' +
        'PINV,'
      '        CONCAT(TR.CODTIPRENFIXA, AC.CODTIPOACAO) AS TIPOTITULO'
      ''
      'FROM '#9'CM.DESPOPERINVEST DOP, CM.OPERACAOINVEST OI,'
      #9'      CM.TIPOOPERACAO TP,    CM.INVESTIMENTO IV,   CM.ACAO AC,'
      #9'      CM.TITRENFIXA TR,      CM.TIPODESPINVEST TD, CM.PESSOA PE'
      ''
      'WHERE '#9'      (DOP.IDOPERACAOINVEST = :IDOPERACAOINVEST)   AND'
      #9'      (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      #9'      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      #9'      (DOP.IDFORCLI         = PE.IDPESSOA)         AND'
      #9'      (OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)      AND'
      #9'      (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)      AND'
      #9'      (IV.IDINVESTIMENTO = AC.IDACAO(+))           AND'
      #9'      (IV.IDINVESTIMENTO = TR.IDTITRENFIXA(+))'
      ''
      'ORDER BY OI.NUMDOCUMENTO, TD.DESCTIPODESPINV'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpdDespesas
    ValidateWithMask = True
    Left = 218
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = '"CM.DESPOPERINVEST".IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"CM.DESPOPERINVEST".IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = '"CM.DESPOPERINVEST".DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,#0.00'
      EditFormat = '##########0.00'
    end
    object QryDespesasOperacaoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Required = True
      Size = 30
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      ReadOnly = True
      Size = 1
    end
    object QryDespesasOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryDespesasOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryDespesasOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryDespesasOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryDespesasOperacaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDespesasOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryDespesasOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryDespesasOperacaoTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Size = 10
    end
    object QryDespesasOperacaoNATOPERDESP: TStringField
      FieldKind = fkLookup
      FieldName = 'NATOPERDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'NATUREZAOPERACAO'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 1
      Lookup = True
    end
    object QryDespesasOperacaoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryDespesasOperacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryDespesasOperacaoDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryDespesasOperacaoIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryDespesasOperacaoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryDespesasOperacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object DsDespesasOperacao: TwwDataSource
    DataSet = QryDespesasOperacao
    Left = 224
    Top = 83
  end
  object QryConsolidado: TwwQuery
    AfterOpen = QryConsultaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'TD.DESCTIPODESPINV, SUM(NVL(DOP.VLRDESPOPER,0)) AS VLRDE' +
        'SPOPER'
      ''
      
        'FROM '#9'CM.OPERACAOINVEST OI, CM.DESPOPERINVEST DOP, CM.TIPODESPIN' +
        'VEST TD'
      ''
      'WHERE '#9'(OI.NUMDOCUMENTO      = :NUMDOC) '#9'     AND'
      '        (OI.IDCARTEIRAGERENC IS NULL)                AND'
      #9'(DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      #9'(DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)'
      ''
      'GROUP BY TD.DESCTIPODESPINV'
      ''
      'ORDER BY TD.DESCTIPODESPINV'
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 115
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptUnknown
        Value = 'RV-99/0037'
      end>
    object QryConsolidadoDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryConsolidadoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,#0.00'
    end
  end
  object DtsConsolidado: TwwDataSource
    DataSet = QryConsolidado
    Left = 629
    Top = 139
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BOL.IDBOLETA, BOL.OBSERVACAO'
      ''
      'FROM CM.BOLETA BOL'
      ''
      'WHERE BOL.IDBOLETA = :IDBOLETA')
    ValidateWithMask = True
    Left = 598
    Top = 178
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object PopDespesas: TPopupMenu
    Left = 534
    Top = 307
    object Alterar1: TMenuItem
      Caption = 'Alterar'
      OnClick = Alterar1Click
    end
  end
  object MSBuscaCredor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Credor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 461
    Top = 91
  end
  object QryConsulta: TwwQuery
    CachedUpdates = True
    AfterOpen = QryConsultaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.' +
        'QTDEOPERACAO, OI.IDOPERACAOINVEST,'
      
        #9'    OI.PRECOUNITOPERACAO, OI.VLROPERACAO, DS.TOTALDESPESAS, SUB' +
        'STR(ME.DESCMERCADO,1,10) AS DESCMERCADO,'
      
        #9'    PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMEN' +
        'TO, TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,'
      
        '       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,'
      
        '       OI.IDCARTEIRAGERENC, AC.CODTIPOACAO, OI.MOECODIGO, OI.IDI' +
        'NVESTIMENTO, OI.IDLOTE, OI.FLGSTATUSFECHBOL, OI.IDPLANPREVCTBPAT' +
        'R, '
      '       DECODE(TI.NATUREZAOPERACAO, '#39'D'#39','#39'R'#39','
      '          DECODE(TI.NATUREZAOPERACAO, '#39'S'#39','#39'R'#39','
      '             DECODE(TI.NATUREZAOPERACAO, '#39'O'#39','#39'R'#39','
      '                DECODE(TI.NATUREZAOPERACAO, '#39'R'#39','#39'R'#39','
      
        '                   DECODE(TI.NATUREZAOPERACAO, '#39'I'#39','#39'R'#39','#39'P'#39'))))) ' +
        'AS  RECPAGBOL,'
      
        '       TI.CODTIPDOC, COUNT(*) OVER(PARTITION BY OI.NUMDOCUMENTO)' +
        ' NUMREC,'
      '       VWP.PLANPRVCONTABPATRO'
      ''
      
        'FROM '#9'OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV' +
        ','
      #9'   INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,'
      
        '      '#9'(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOT' +
        'ALDESPESAS'
      #9'       FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI'
      #9'       WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST '#9'AND'
      '                      TDI.NATUREZAOPERACAO NOT IN ('#39'N'#39')'
      #9'       GROUP BY DOI.IDOPERACAOINVEST) DS,'
      '         VWPLANPREVCTBPATR VWP'
      ''
      'WHERE (OI.NUMDOCUMENTO     = :NUMDOC) '#9#9'      AND'
      '      (OI.IDCARTEIRAGERENC IS NULL)                   AND'
      '      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)     AND'
      '      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+))  AND'
      '      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) '#9'      AND'
      '      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)'#9'      AND'
      '      (OA.IDACAO '#9'   = IV.IDINVESTIMENTO)       AND'
      '      (TI.IDMERCADO '#9'   = ME.IDMERCADO)'#9'      AND'
      '      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)       AND'
      '      (OI.IDINVESTIMENTO   = AC.IDACAO)               AND'
      '      (VWP.IDPLANPREVCTBPATR = OI.IDPLANPREVCTBPATR)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updConsulta
    ValidateWithMask = True
    Left = 125
    Top = 75
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptResult
        Value = 'RV-06/0066'
      end>
    object QryConsultaSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object QryConsultaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryConsultaDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryConsultaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '#,#0'
    end
    object QryConsultaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryConsultaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '#,#0.00'
    end
    object QryConsultaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,#0.00'
    end
    object QryConsultaTOTALDESPESAS: TFloatField
      FieldName = 'TOTALDESPESAS'
      DisplayFormat = '#,#0.00'
    end
    object QryConsultaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object QryConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryConsultaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object QryConsultaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryConsultaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryConsultaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryConsultaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryConsultaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryConsultaIDTIPOOPERACAO_1: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
    end
    object QryConsultaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryConsultaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryConsultaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryConsultaCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object QryConsultaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryConsultaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryConsultaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryConsultaFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object QryConsultaRECPAGBOL: TStringField
      FieldName = 'RECPAGBOL'
      Size = 1
    end
    object QryConsultaCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object QryConsultaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryConsultaPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object QryAtualizaOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOINVEST SET FLGSTATUSFECHBOL = '#39'F'#39
      'WHERE NUMDOCUMENTO= :BOLETA')
    ValidateWithMask = True
    Left = 272
    Top = 305
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptUnknown
      end>
  end
  object QryCorretagemDevol: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nvl(DOP.VLRDESPOPER,0) AS VLRDESPOPER, TD.DESCTIPODESPINV'
      ''
      'FROM '#9'CM.DESPOPERINVEST DOP,      CM.TIPODESPINVEST TD'
      ''
      'WHERE       (DOP.IDOPERACAOINVEST =:IDOPERACAOINVEST) AND'
      
        '           ((TD.DESCTIPODESPINV   Like '#39'%Devolucao Corretagem%'#39')' +
        '    OR'
      
        '            (TD.DESCTIPODESPINV   Like '#39'%Devolucao de Corretagem' +
        '%'#39') OR'
      
        '            (TD.DESCTIPODESPINV   Like '#39'%DEVOLUCAO DE CORRETAGEM' +
        '%'#39') OR'
      
        ' '#9'     (TD.DESCTIPODESPINV  Like '#39'%DEVOLUCAO CORRETAGEM%'#39'))   AN' +
        'D'
      '            (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)'
      ''
      'UNION'
      ''
      'SELECT nvl(DOP.VLRDESPOPER,0) AS VLRDESPOPER, TD.DESCTIPODESPINV'
      ''
      'FROM CM.DESPOPERINVEST DOP, TIPODESPINVEST TD'
      ''
      'WHERE (DOP.IDOPERACAOINVEST =:IDOPERACAOINVEST) AND'
      '     ((TD.DESCTIPODESPINV  Like '#39'Corretagem%'#39')  OR'
      '      (TD.DESCTIPODESPINV  Like '#39'CORRETAGEM%'#39')) AND'
      '      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)'
      ' ')
    ValidateWithMask = True
    Left = 354
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryVerifMovCart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDHISTCARTINV '
      'FROM '
      '     HISTCARTINV HC'
      'WHERE IDHISTCARTINV IN ('
      '     SELECT H.IDHISTCARTINV'
      '     FROM HISTCARTINV H, OPERACAOINVEST O'
      '     WHERE (O.NUMDOCUMENTO     = :pDocumento) AND'
      '                    (H.IDDESPOPERINVEST IS NOT NULL)  AND'
      '                    (H.IDOPERACAOINVEST = O.IDOPERACAOINVEST))')
    ValidateWithMask = True
    Left = 272
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'pDocumento'
        ParamType = ptUnknown
      end>
  end
  object QryConsultaGerencial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.' +
        'QTDEOPERACAO, OI.IDOPERACAOINVEST,'
      
        #9'    OI.PRECOUNITOPERACAO, OI.VLROPERACAO, DS.TOTALDESPESAS, SUB' +
        'STR(ME.DESCMERCADO,1,10) AS DESCMERCADO,'
      
        #9'    PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMEN' +
        'TO, TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,'
      
        '       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,'
      
        '       OI.IDCARTEIRAGERENC, AC.CODTIPOACAO, OI.MOECODIGO, OI.IDI' +
        'NVESTIMENTO, OI.IDLOTE, OI.FLGSTATUSFECHBOL, OI.IDPLANPREVCTBPAT' +
        'R, '
      '       DECODE(TI.NATUREZAOPERACAO, '#39'D'#39','#39'R'#39','
      '          DECODE(TI.NATUREZAOPERACAO, '#39'S'#39','#39'R'#39','
      '             DECODE(TI.NATUREZAOPERACAO, '#39'O'#39','#39'R'#39','
      '                DECODE(TI.NATUREZAOPERACAO, '#39'R'#39','#39'R'#39','
      
        '                   DECODE(TI.NATUREZAOPERACAO, '#39'I'#39','#39'R'#39','#39'P'#39'))))) ' +
        'AS  RECPAGBOL,'
      '       COUNT(*) OVER(PARTITION BY OI.NUMDOCUMENTO) NUMREC'
      ''
      
        'FROM '#9'OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV' +
        ','
      #9'   INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,'
      
        '      '#9'(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOT' +
        'ALDESPESAS'
      #9'       FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI'
      #9'       WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST '#9'AND'
      #9'              TDI.NATUREZAOPERACAO NOT IN ('#39'N'#39')'
      #9'       GROUP BY DOI.IDOPERACAOINVEST) DS'
      ''
      'WHERE (OI.NUMDOCUMENTO     = :NUMDOC) '#9#9'      AND'
      '      (OI.IDCARTEIRAGERENC IS NOT NULL)               AND'
      '      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)     AND'
      '      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+))  AND'
      '      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) '#9'      AND'
      '      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)'#9'      AND'
      '      (OA.IDACAO '#9'   = IV.IDINVESTIMENTO)       AND'
      '      (TI.IDMERCADO '#9'   = ME.IDMERCADO)'#9'      AND'
      '      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)       AND'
      '      (OI.IDINVESTIMENTO   = AC.IDACAO)'
      ''
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
    ValidateWithMask = True
    Left = 533
    Top = 43
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptUnknown
        Value = 'RV-99/0037'
      end>
    object StringField1: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object FloatField1: TFloatField
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###'
    end
    object FloatField2: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object FloatField3: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,###,###,###0.0000'
    end
    object FloatField4: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'TOTALDESPESAS'
      DisplayFormat = '###,###,###,###0.00'
    end
    object StringField2: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object StringField5: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object FloatField6: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object FloatField7: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object FloatField8: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
    end
    object FloatField9: TFloatField
      FieldName = 'IDFORCLI'
    end
    object FloatField10: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object StringField8: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object FloatField11: TFloatField
      FieldName = 'MOECODIGO'
    end
    object FloatField12: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object StringField9: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object StringField10: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Size = 1
    end
    object StringField11: TStringField
      FieldName = 'RECPAGBOL'
      Size = 1
    end
    object FloatField13: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryConsultaGerencialNUMREC: TFloatField
      FieldName = 'NUMREC'
    end
    object QryConsultaGerencialIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object QryDespesasOperacaoGer: TwwQuery
    CachedUpdates = True
    AfterOpen = QryDespesasOperacaoAfterOpen
    AfterInsert = QryDespesasOperacaoAfterInsert
    AfterPost = QryDespesasOperacaoAfterPost
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'DOP.IDDESPOPERINVEST, DOP.IDFORCLI,       DOP.IDOPERACAO' +
        'INVEST,'
      
        '        DOP.IDTIPOINVEST,     DOP.IDTIPOOPERACAO, NVL(DOP.VLRDES' +
        'POPER,0) AS VLRDESPOPER,'
      '        OI.DATAOPERACAO,      PE.NOME,'
      
        #9'DOP.IDTIPODESPINVEST, DOP.DATAVENCDESPOPER, DOP.IDREGRACALCUSAD' +
        'A, OI.IDPLANPREVCTBPATR, '
      
        #9'DOP.IDREGRAVENCUSADA, OI.NUMDOCUMENTO,      OI.IDINVESTIMENTO, ' +
        'OI.IDCORRETVALORES,'
      
        #9'OI.IDCARTEIRAINVEST,  OI.IDCARTEIRAGERENC,  OI.VLROPERACAO,    ' +
        'OI.QTDEOPERACAO, OI.MOECODIGO, OI.IDLOTE,'
      
        #9'DECODE(DOP.FLGCALCDIARIO,0, '#39'N'#39', '#39'S'#39') AS FLGCALCDIARIO, TP.DESC' +
        'TIPOOPERACAO,'
      #9'IV.DESCINVESTIMENTO, TP.NATUREZAOPERACAO, TD.DESCTIPODESPINV,'
      #9'CONCAT(TR.CODTIPRENFIXA, AC.CODTIPOACAO) AS TIPOTITULO'
      ''
      
        'FROM '#9'CM.DESPOPERINVEST DOP, CM.OPERACAOINVEST OI, CM.TIPOOPERAC' +
        'AO TP,'
      
        '        CM.INVESTIMENTO IV,   CM.ACAO AC,  CM.TITRENFIXA TR, CM.' +
        'TIPODESPINVEST TD,'
      '        CM.PESSOA PE'
      ''
      'WHERE '#9'(DOP.IDOPERACAOINVEST = :IDOPERACAOINVEST)   AND'
      #9'(DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      #9'(DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      #9'(DOP.IDFORCLI         = PE.IDPESSOA)         AND'
      #9'(OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO)   AND'
      #9'(OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO)   AND'
      #9'(IV.IDINVESTIMENTO    = AC.IDACAO(+))        AND'
      #9'(IV.IDINVESTIMENTO    = TR.IDTITRENFIXA(+))'
      ''
      'ORDER BY OI.NUMDOCUMENTO, TD.DESCTIPODESPINV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 666
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object FloatField14: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = '"CM.DESPOPERINVEST".IDDESPOPERINVEST'
    end
    object FloatField15: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDOPERACAOINVEST'
    end
    object FloatField16: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPOINVEST'
    end
    object FloatField17: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"CM.DESPOPERINVEST".IDTIPOOPERACAO'
    end
    object FloatField18: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPODESPINVEST'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = '"CM.DESPOPERINVEST".DATAVENCDESPOPER'
    end
    object FloatField19: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRACALCUSADA'
    end
    object FloatField20: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRAVENCUSADA'
    end
    object FloatField21: TFloatField
      FieldName = 'IDFORCLI'
    end
    object FloatField22: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,#0.00'
      EditFormat = '##########0.00'
    end
    object StringField12: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Required = True
      Size = 30
    end
    object StringField13: TStringField
      FieldName = 'FLGCALCDIARIO'
      ReadOnly = True
      Size = 1
    end
    object FloatField23: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object FloatField24: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object FloatField25: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object FloatField26: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object StringField14: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object StringField15: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object FloatField27: TFloatField
      FieldName = 'MOECODIGO'
    end
    object StringField17: TStringField
      FieldName = 'TIPOTITULO'
      Size = 10
    end
    object StringField18: TStringField
      FieldKind = fkLookup
      FieldName = 'NATOPERDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'NATUREZAOPERACAO'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 1
      Lookup = True
    end
    object StringField19: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object StringField20: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField21: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object FloatField28: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object FloatField29: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryDespesasOperacaoGerIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object updConsulta: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.OPERACAOINVEST'
      'set'
      '  VLROPERACAO = :VLROPERACAO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    DeleteSQL.Strings = (
      '')
    Left = 133
    Top = 90
  end
  object PopConsulta: TPopupMenu
    Left = 182
    Top = 143
    object AlterarConsulta: TMenuItem
      Caption = 'Alterar'
      OnClick = AlterarConsultaClick
    end
  end
  object qryUpdVlrOperacao: TwwQuery
    CachedUpdates = True
    AfterOpen = QryConsultaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV'
      'SET VLRMOVCARTINV = :VLRMOVCARTINV'
      'WHERE IDOPERACAOINVEST = :IDOPERACAOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 85
    Top = 253
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryUpdFlgCalcSaldo: TwwQuery
    CachedUpdates = True
    AfterOpen = QryConsultaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV'
      'SET FLGCALCSALDO = 2'
      'WHERE IDOPERACAOINVEST >= :IDOPERACAOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 85
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object PopAltDevCorret: TPopupMenu
    Left = 634
    Top = 307
    object AltDevCorret: TMenuItem
      Caption = 'Altera Devolução de Corretagem'
      OnClick = AltDevCorretClick
    end
  end
  object qryBuscaDevCorret: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VALOR'
      'FROM'
      '   VALTABGENER'
      'WHERE'
      '   (CODTABELA = '#39'DESPESAS-BVSP'#39') AND'
      '   (CODCAMPO = '#39'DEVOL'#39') AND'
      '   (NUMLINHA = (SELECT'
      '                   MIN(NUMLINHA) FROM VALTABGENER'
      '                WHERE'
      '                   (CODTABELA = '#39'DESPESAS-BVSP'#39') AND'
      '                   (CODCAMPO = '#39'CODOPER'#39')))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 186
    Top = 249
    object qryBuscaDevCorretVALOR: TStringField
      FieldName = 'VALOR'
      EditMask = '###,###,###,#0.00'
      Size = 60
    end
  end
  object qryAtualizaBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET STATUS = '#39'F'#39','
      '    PLANO = :PLANO,'
      '    PLNCODIGO = :PLNCODIGO,'
      '    CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE IDBOLETA = :BOLETA'
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaDespCarteiraGerenc: TwwQuery
    CachedUpdates = True
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(DOI.VLRDESPOPER) TOTALDESPESAS'
      'FROM   OPERACAOINVEST OI, DESPOPERINVEST DOI'
      'WHERE'
      '      (OI.NUMDOCUMENTO     = :NUMDOCUMENTO) AND'
      '      (OI.IDCARTEIRAGERENC IS NOT NULL)     AND'
      '      (OI.IDOPERACAOINVEST = DOI.IDOPERACAOINVEST(+))'
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 267
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptResult
      end>
  end
  object QryUpdDespOperInvest: TwwQuery
    CachedUpdates = True
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE DESPOPERINVEST SET VLRDESPOPER = VLRDESPOPER + :VLRDESPOP' +
        'ER WHERE'
      '       IDDESPOPERINVEST = :IDDESPOPERINVEST'
      ''
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 211
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRDESPOPER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDESPOPERINVEST'
        ParamType = ptResult
      end>
  end
  object QryBuscaDespOperInvest: TwwQuery
    CachedUpdates = True
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   DESPOPERINVEST'
      'WHERE'
      '       IDOPERACAOINVEST = :IDOPERACAOINVEST'
      ''
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 171
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptResult
      end>
  end
  object QryBuscaDespOperInvestGer: TwwQuery
    CachedUpdates = True
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   OPERACAOINVEST O, DESPOPERINVEST D'
      'WHERE'
      '       O.QTDEOPERACAO     =:QTDEOPERACAO       AND'
      '       D.IDTIPODESPINVEST =:IDTIPODESPINVEST   AND'
      '       O.IDCARTEIRAGERENC IS NOT NULL          AND'
      '       D.IDOPERACAOINVEST = O.IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 426
    Top = 307
    ParamData = <
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptResult
      end>
  end
  object qryBuscaDevCorrAtual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.DEVOLUCAO, C.CORRETAGEM, ROUND((NVL(D.DEVOLUCAO,0) / NV' +
        'L(C.CORRETAGEM,1)),2) AS PERCDEV'
      'FROM (SELECT SUM(nvl(DOP.VLRDESPOPER,0)) AS DEVOLUCAO'
      
        '      FROM OPERACAOINVEST OI, DESPOPERINVEST DOP, TIPODESPINVEST' +
        ' TD'
      '      WHERE (OI.NUMDOCUMENTO = :NUMDOCUMENTO)'
      '        AND (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      
        '        AND ((TD.DESCTIPODESPINV  Like '#39'%Devolucao Corretagem%'#39')' +
        '    OR'
      
        '             (TD.DESCTIPODESPINV  Like '#39'%Devolucao de Corretagem' +
        '%'#39') OR'
      
        '             (TD.DESCTIPODESPINV  Like '#39'%DEVOLUCAO DE CORRETAGEM' +
        '%'#39') OR'
      '       '#9' (TD.DESCTIPODESPINV  Like '#39'%DEVOLUCAO CORRETAGEM%'#39'))'
      '        AND (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)) D,'
      '     (SELECT SUM(nvl(DOP.VLRDESPOPER,0)) AS CORRETAGEM'
      
        '      FROM OPERACAOINVEST OI, DESPOPERINVEST DOP, TIPODESPINVEST' +
        ' TD'
      '      WHERE (OI.NUMDOCUMENTO = :NUMDOCUMENTO)'
      '        AND (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '        AND ((TD.DESCTIPODESPINV  Like '#39'Corretagem%'#39') OR'
      '             (TD.DESCTIPODESPINV  Like '#39'CORRETAGEM%'#39'))'
      '        AND (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)) C'
      '')
    ValidateWithMask = True
    Left = 186
    Top = 313
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptResult
      end>
    object qryBuscaDevCorrAtualDEVOLUCAO: TFloatField
      FieldName = 'DEVOLUCAO'
    end
    object qryBuscaDevCorrAtualCORRETAGEM: TFloatField
      FieldName = 'CORRETAGEM'
    end
    object qryBuscaDevCorrAtualPERCDEV: TFloatField
      FieldName = 'PERCDEV'
    end
  end
end
