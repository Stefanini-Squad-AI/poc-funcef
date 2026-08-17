inherited FrmMTCancelaOC: TFrmMTCancelaOC
  Left = 87
  Top = 164
  Caption = 'FrmMTCancelaOC'
  ClientHeight = 402
  ClientWidth = 762
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 47
    Width = 762
    Height = 316
    object plnItem: TPanel
      Left = 1
      Top = 81
      Width = 760
      Height = 234
      Align = alClient
      BevelOuter = bvNone
      Caption = 'plnItem'
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 361
        Top = 0
        Width = 8
        Height = 234
        Cursor = crHSplit
        Beveled = True
      end
      object PgOC: TPageControl
        Left = 0
        Top = 0
        Width = 361
        Height = 234
        ActivePage = TabItem
        Align = alLeft
        TabOrder = 0
        object TabItem: TTabSheet
          Caption = 'Itens da O.C.'
          object GrdItem: TwwDBGrid
            Left = 0
            Top = 0
            Width = 353
            Height = 206
            Hint = 'Duplo click para cancelar o item'
            Selected.Strings = (
              'STATUS'#9'1'#9#9'F'
              'CODARTIGO'#9'14'#9'Código'
              'IDRESERVAORCAMEN'#9'10'#9'Compromisso'#9'F'
              'QTDEPEDIDA'#9'10'#9'Quant. Pedida'
              'CODMEDIDA'#9'4'#9'Unidade'
              'VALORUN'#9'10'#9'Preço Uni.'#9'F'
              'TOTAL'#9'10'#9'Valor Total'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsItemOC
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = GrdItemCalcCellColors
            OnDblClick = GrdItemDblClick
            OnMouseDown = GrdItemMouseDown
            IndicatorColor = icBlack
            OnUpdateFooter = GrdItemUpdateFooter
          end
        end
        object TabOBS: TTabSheet
          Caption = 'Observação O.C.'
          Enabled = False
          object memObsOC: TDBMemo
            Left = 0
            Top = 0
            Width = 353
            Height = 219
            Align = alClient
            DataField = 'OBSOC'
            DataSource = dsOC
            MaxLength = 250
            TabOrder = 0
          end
        end
      end
      object PgItem: TPageControl
        Left = 369
        Top = 0
        Width = 391
        Height = 234
        ActivePage = TabPrazoEnt
        Align = alClient
        TabOrder = 1
        object TabPrazoEnt: TTabSheet
          Caption = 'Prazo de Ent.'
          object GrdPrazoEnt: TwwDBGrid
            Left = 0
            Top = 0
            Width = 383
            Height = 206
            Selected.Strings = (
              'QTDEENTREGA'#9'10'#9'Qtde. Entrega'#9'F'
              'PRAZOENTREGA'#9'10'#9'Prazo em dias'#9'F'
              'DATAENTREGA'#9'10'#9'Data Entrega'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPrazoEntOC
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object TabPrazoPag: TTabSheet
          Caption = 'Prazo de Pag.'
          object GrdPrazoPag: TwwDBGrid
            Left = 0
            Top = 0
            Width = 375
            Height = 219
            Selected.Strings = (
              'PERCPAGTO'#9'10'#9'Percentual'#9'F'
              'PRAZOPGTO'#9'10'#9'Prazo em dias'#9'F'
              'DATAPAGTO'#9'10'#9'Data Pagamento'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPrazoPagOC
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object TabAgreg: TTabSheet
          Caption = 'Agregados'
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 375
            Height = 219
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Descrição'#9'F'
              'ALIQUOTA'#9'10'#9'Aliquota'#9'F'
              'BASECALCULO'#9'10'#9'Base'#9'F'
              'VLRAGREGITEM'#9'10'#9'Valor'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAgregItemOC
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object TabObsItem: TTabSheet
          Caption = 'Obs. Item'
          Enabled = False
          object dbreOBS: TDBRichEdit
            Left = 0
            Top = 0
            Width = 375
            Height = 219
            Align = alClient
            DataField = 'OBSITEMOC'
            DataSource = dsItemOC
            MaxLength = 200
            TabOrder = 0
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 760
      Height = 80
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 632
        Top = 18
        Width = 83
        Height = 13
        Caption = 'Processo RAD'
      end
      object DBText1: TDBText
        Left = 520
        Top = 32
        Width = 60
        Height = 16
        AutoSize = True
        DataField = 'STATUS'
        DataSource = dsOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 424
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Data'
        FocusControl = edData
      end
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 76
        Height = 13
        Caption = 'Razão Social'
        FocusControl = edFron
      end
      object edProcesso: TDBEdit
        Left = 632
        Top = 32
        Width = 83
        Height = 21
        Color = clGray
        DataField = 'IDPROCESSO'
        DataSource = dsOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edData: TDBEdit
        Left = 424
        Top = 32
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'DATAOC'
        DataSource = dsOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edFron: TDBEdit
        Left = 16
        Top = 32
        Width = 393
        Height = 21
        Color = clGray
        DataField = 'RAZAOSOCIAL'
        DataSource = dsOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 762
    object Pendente: TLabel [0]
      Left = 32
      Top = 8
      Width = 67
      Height = 16
      Caption = 'Pendente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Recebido: TLabel [1]
      Left = 144
      Top = 8
      Width = 69
      Height = 16
      Caption = 'Recebido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel [2]
      Left = 248
      Top = 8
      Width = 76
      Height = 16
      Caption = 'Cancelado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel [3]
      Left = 360
      Top = 8
      Width = 164
      Height = 16
      Caption = 'Recebido Parcialmente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited tb97Fundo: TToolbar97
      Left = 594
      DockPos = 597
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 19
      Height = 17
      BevelInner = bvRaised
      Caption = 'P'
      Color = 8454143
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 120
      Top = 8
      Width = 19
      Height = 17
      BevelInner = bvRaised
      Caption = 'R'
      Color = 8454016
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 224
      Top = 8
      Width = 19
      Height = 17
      BevelInner = bvRaised
      Caption = 'C'
      Color = 8421631
      TabOrder = 3
    end
    object Panel4: TPanel
      Left = 336
      Top = 8
      Width = 19
      Height = 17
      BevelInner = bvRaised
      Caption = 'A'
      Color = clAqua
      TabOrder = 4
    end
  end
  object Dock972: TDock97 [2]
    Left = 0
    Top = 0
    Width = 762
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
    BoundLines = [blTop, blBottom]
    object Label5: TLabel
      Left = 560
      Top = 16
      Width = 63
      Height = 16
      Caption = 'O.C.  Nº :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 0
      TabOrder = 0
      object btnCancela: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        DropdownArrow = False
        Caption = '&Cancelar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = btnCancelaClick
      end
      object sbtnProcurar: TToolbarButton97
        Left = 60
        Top = 0
        Width = 60
        Height = 41
        Caption = '&Procurar'
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
        OnClick = sbtnProcurarClick
      end
    end
    object edNumOC: TDBEdit
      Left = 624
      Top = 16
      Width = 113
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NUMOC'
      DataSource = dsOC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65531
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  object dsOC: TwwDataSource
    AutoEdit = False
    DataSet = CdsOC
    Left = 193
    Top = 2
  end
  object dsItemOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsItemOC
    OnDataChange = dsItemOCDataChange
    Left = 292
    Top = 2
  end
  object dsPrazoEntOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoEntOC
    Left = 359
    Top = 3
  end
  object dsPrazoPagOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoPagOC
    Left = 437
    Top = 2
  end
  object dsAgregItemOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsAgregItemOC
    Left = 518
    Top = 3
  end
  object CdsOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 580
    Top = 223
  end
  object cdsItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsItemOCAfterOpen
    Left = 664
    Top = 225
  end
  object cdsPrazoEntOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 208
  end
  object cdsPrazoPagOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 144
  end
  object cdsAgregItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 144
  end
  object cdsSCItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 152
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'OC.NUMOC'
      'IT.CODARTIGO'
      'PRODUTO.DESCPROD'
      'OC.DATAOC'
      
        'DECODE(IT.FLGITEMATENDIDO, '#39'T'#39', '#39'Recebido'#39', DECODE(IT.FLGITEMATE' +
        'NDIDO, '#39'C'#39', '#39'Cancelado'#39', DECODE(NVL(IT.QTDERECEBIDA, 0), 0, '#39'Pen' +
        'dente'#39', '#39'Atendido Parcialmente'#39'))) AS STATUS'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº da O.C.'
      'Código do Item'
      'Descrição do Item'
      'Data da O.C.'
      'Status da OC'
      'Razão Social'
      'Nome Fantasia')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'OC'
      'ITEMOC   IT'
      'ARTIGO'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'OC.NUMOC')
    Filtro.Strings = (
      'OC.NUMOC          = IT.NUMOC'
      'IT.CODARTIGO      = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'IT.IDPRODVARI     = PRODVARI.IDPRODVARI(+)'
      'OC.IDFORCLI       = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      'dd/mm/yyyy'
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '14'
      '40'
      '10'
      '10'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 575
    Top = 53
  end
  object cdsSCIOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 287
  end
end
