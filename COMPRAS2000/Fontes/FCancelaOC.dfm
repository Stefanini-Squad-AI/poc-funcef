inherited FrmCancelaOC: TFrmCancelaOC
  Left = 24
  Top = 71
  Caption = 'Cancelamento de O.C.'
  ClientHeight = 402
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 47
    Width = 752
    Height = 316
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 76
      Height = 13
      Caption = 'Razão Social'
      FocusControl = edFron
    end
    object Label2: TLabel
      Left = 424
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Data'
      FocusControl = edData
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
    object Label3: TLabel
      Left = 640
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Nº do Processo'
      FocusControl = edData
    end
    object edFron: TDBEdit
      Left = 16
      Top = 32
      Width = 401
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
    object plnItem: TPanel
      Left = 5
      Top = 64
      Width = 742
      Height = 247
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'plnItem'
      TabOrder = 2
      object Splitter1: TSplitter
        Left = 361
        Top = 0
        Width = 8
        Height = 247
        Cursor = crHSplit
        Beveled = True
      end
      object PgOC: TPageControl
        Left = 0
        Top = 0
        Width = 361
        Height = 247
        ActivePage = TabItem
        Align = alLeft
        TabOrder = 0
        object TabItem: TTabSheet
          Caption = 'Itens da O.C.'
          object GrdItem: TwwDBGrid
            Left = 0
            Top = 0
            Width = 353
            Height = 219
            Hint = 'Duplo click para cancelar o item'
            Selected.Strings = (
              'STATUS'#9'3'#9' '
              'CODARTIGO'#9'14'#9'Código'
              'DESCRICAO'#9'30'#9'Descrição'
              'QTDEPEDIDA'#9'10'#9'Quant. Pedida'
              'QTDERECEBIDA'#9'10'#9'Quant. Recebida'#9'F'
              'CODMEDIDA'#9'4'#9'Unidade'
              'VALORUN'#9'10'#9'Preço')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsItemOC
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        Width = 373
        Height = 247
        ActivePage = TabObsItem
        Align = alClient
        TabOrder = 1
        object TabPrazoEnt: TTabSheet
          Caption = 'Prazo de Ent.'
          object GrdPrazoEnt: TwwDBGrid
            Left = 0
            Top = 0
            Width = 365
            Height = 219
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
            Width = 365
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
            Width = 365
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
            Width = 365
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
    object edProcesso: TDBEdit
      Left = 640
      Top = 32
      Width = 97
      Height = 21
      Color = clGray
      DataField = 'CODPROCESSO'
      DataSource = dsItemOC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 752
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
    end
    inherited tb97Fundo: TToolbar97
      Left = 583
      DockPos = 583
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
    object Panel2: TPanel
      Left = 224
      Top = 8
      Width = 19
      Height = 17
      BevelInner = bvRaised
      Caption = 'C'
      Color = 8421631
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 120
      Top = 8
      Width = 19
      Height = 17
      BevelInner = bvRaised
      Caption = 'R'
      Color = 8454016
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
    Width = 752
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
    Left = 787
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
  object qryOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      OC.NUMOC,'
      '      OC.IDFORCLI,'
      '      OC.IDPESSOA,'
      '      OC.OCATENDIDA,'
      '      OC.FLGIMPRESSA,'
      '      OC.FLGCOMSEMOC,'
      '      OC.FLGCOMSEMCOT,'
      
        '      DECODE(OC.FLGCOMSEMOC,'#39'S'#39','#39'SEM O.C.'#39',DECODE(OC.FLGCOMSEMCO' +
        'T,'#39'C'#39','#39'COM COTAÇÃO'#39','#39'SEM COTAÇÃO'#39')) AS STATUS,'
      '      OC.OBSOC,'
      '      OC.DATAOC,'
      '      OC.IDPROCESSO,'
      '      P.RAZAOSOCIAL'
      'FROM'
      '      PESSOA P,'
      '      OC OC'
      'WHERE'
      '      (OC.NUMOC = :pNUMOC)'
      '  AND (OC.IDFORCLI = P.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 156
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMOC'
        ParamType = ptUnknown
      end>
    object qryOCNUMOC: TFloatField
      FieldName = 'NUMOC'
    end
    object qryOCIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryOCIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryOCOCATENDIDA: TStringField
      FieldName = 'OCATENDIDA'
      Size = 1
    end
    object qryOCFLGIMPRESSA: TStringField
      FieldName = 'FLGIMPRESSA'
      Size = 1
    end
    object qryOCFLGCOMSEMOC: TStringField
      FieldName = 'FLGCOMSEMOC'
      Size = 1
    end
    object qryOCSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 11
    end
    object qryOCOBSOC: TStringField
      FieldName = 'OBSOC'
      Size = 250
    end
    object qryOCDATAOC: TDateTimeField
      FieldName = 'DATAOC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOCIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object qryOCRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryOCFLGCOMSEMCOT: TStringField
      FieldName = 'FLGCOMSEMCOT'
      Size = 1
    end
  end
  object dsOC: TwwDataSource
    AutoEdit = False
    DataSet = qryOC
    Left = 193
    Top = 2
  end
  object qryItemOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IT.IDITEMOC,'
      '     IT.NUMOC,'
      '     IT.CODARTIGO,'
      '     IT.CODMEDIDA,'
      '     IT.QTDEPEDIDA,'
      '     IT.QTDERECEBIDA,'
      '     IT.VALORUN,'
      '     IT.FLGITEMATENDIDO,'
      
        '     DECODE(IT.FLGITEMATENDIDO,'#39'T'#39','#39'R'#39',DECODE(IT.FLGITEMATENDIDO' +
        ','#39'C'#39','#39'C'#39',DECODE(NVL(QTDERECEBIDA,0),0,'#39'P'#39','#39'A'#39'))) AS STATUS,'
      '     IT.OBSITEMOC,'
      '     IT.IDPRODVARI,'
      
        '     SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60) AS DESCRICAO,'
      '     P.CODPRODUTO,'
      '     CO.CODPROCESSO'
      'FROM'
      '     COTACOES CO,'
      '     ITEMOC IT,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     PRODVARI PV'
      'WHERE'
      '       (IT.NUMOC      = :NUMOC)'
      '   AND (IT.IDITEMOC   = CO.IDITEMOC(+))'
      '   AND (IT.CODARTIGO  = A.CODARTIGO)'
      '   AND (A.CODPRODUTO  = P.CODPRODUTO)'
      '   AND (IT.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 241
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMOC'
        ParamType = ptUnknown
      end>
    object qryItemOCSTATUS: TStringField
      Alignment = taCenter
      DisplayLabel = ' '
      DisplayWidth = 3
      FieldName = 'STATUS'
      Size = 1
    end
    object qryItemOCCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = 'ITEMOC.CODARTIGO'
      Size = 14
    end
    object qryItemOCDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryItemOCQTDEPEDIDA: TFloatField
      DisplayLabel = 'Quant. Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      Origin = 'ITEMOC.QTDEPEDIDA'
      DisplayFormat = '#,##0.00'
    end
    object qryItemOCCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'ITEMOC.CODMEDIDA'
      Size = 4
    end
    object qryItemOCVALORUN: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 10
      FieldName = 'VALORUN'
      Origin = 'ITEMOC.VALORUN'
      DisplayFormat = '#,##0.00'
    end
    object qryItemOCFLGITEMATENDIDO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGITEMATENDIDO'
      Origin = 'ITEMOC.FLGITEMATENDIDO'
      Visible = False
      Size = 1
    end
    object qryItemOCIDITEMOC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMOC'
      Origin = 'ITEMOC.IDITEMOC'
      Visible = False
    end
    object qryItemOCNUMOC: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMOC'
      Origin = 'ITEMOC.NUMOC'
      Visible = False
    end
    object qryItemOCQTDERECEBIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDERECEBIDA'
      Origin = 'ITEMOC.QTDERECEBIDA'
      Visible = False
    end
    object qryItemOCOBSITEMOC: TStringField
      DisplayWidth = 200
      FieldName = 'OBSITEMOC'
      Origin = 'ITEMOC.OBSITEMOC'
      Visible = False
      Size = 200
    end
    object qryItemOCIDPRODVARI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRODVARI'
      Origin = 'ITEMOC.IDPRODVARI'
      Visible = False
    end
    object qryItemOCCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Visible = False
      Size = 6
    end
    object qryItemOCCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
    end
  end
  object dsItemOC: TwwDataSource
    AutoEdit = False
    DataSet = qryItemOC
    OnDataChange = dsItemOCDataChange
    Left = 292
    Top = 2
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'OC.NUMOC'
      'ITEMOC.CODARTIGO'
      'PRODUTO.DESCPROD'
      'OC.DATAOC'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Nº da O.C.'
      'Código do Item'
      'Descrição do Item'
      'Data da O.C.'
      'Razão Social'
      'Nome Fantasia')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'OC'
      'ITEMOC'
      'ARTIGO'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'OC.NUMOC')
    Filtro.Strings = (
      'OC.NUMOC = ITEMOC.NUMOC'
      'ITEMOC.CODARTIGO = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'ITEMOC.IDPRODVARI = PRODVARI.IDPRODVARI(+)'
      'OC.IDFORCLI = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      'dd/mm/yyyy'
      ''
      '')
    Larguras.Strings = (
      '10'
      '14'
      '40'
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 639
    Top = 5
  end
  object dsPrazoEntOC: TwwDataSource
    DataSet = qryPrazoEntOC
    Left = 359
    Top = 3
  end
  object qryPrazoEntOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDITEMOC,'
      '      PARCELAENTREGA,'
      '      PRAZOENTREGA,'
      '      QTDEENTREGA,'
      '      PERIODOPRAZO,'
      '      DATAENTREGA'
      'FROM'
      '      PRAZOENTREGAOC '
      ''
      'WHERE'
      '     (IDITEMOC  = :IDITEMOC )'
      'ORDER BY DATAENTREGA')
    ValidateWithMask = True
    Left = 359
    Top = 65526
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDITEMOC'
        ParamType = ptUnknown
      end>
    object qryPrazoEntOCQTDEENTREGA: TFloatField
      DisplayLabel = 'Qtde. Entrega'
      DisplayWidth = 10
      FieldName = 'QTDEENTREGA'
      Origin = 'PRAZOENTREGAOC.QTDEENTREGA'
    end
    object qryPrazoEntOCPRAZOENTREGA: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOENTREGA'
      Origin = 'PRAZOENTREGAOC.PRAZOENTREGA'
    end
    object qryPrazoEntOCDATAENTREGA: TDateTimeField
      DisplayLabel = 'Data Entrega'
      DisplayWidth = 10
      FieldName = 'DATAENTREGA'
      Origin = 'PRAZOENTREGAOC.DATAENTREGA'
    end
    object qryPrazoEntOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'PRAZOENTREGAOC.IDITEMOC'
      Visible = False
    end
    object qryPrazoEntOCPARCELAENTREGA: TFloatField
      FieldName = 'PARCELAENTREGA'
      Origin = 'PRAZOENTREGAOC.PARCELAENTREGA'
      Visible = False
    end
    object qryPrazoEntOCPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGAOC.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
  end
  object dsPrazoPagOC: TwwDataSource
    DataSet = qryPrazoPagOC
    Left = 437
    Top = 2
  end
  object qryPrazoPagOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDITEMOC,'
      '      PARCELAPGTO,'
      '      PRAZOPGTO,'
      '      PERIODOPRAZO,'
      '      PERCPAGTO,'
      '      DATAPAGTO'
      'FROM'
      '      PRAZOPGTOOC'
      'WHERE'
      '     (IDITEMOC = :IDITEMOC)'
      'ORDER BY DATAPAGTO')
    ValidateWithMask = True
    Left = 437
    Top = 65524
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDITEMOC'
        ParamType = ptUnknown
      end>
    object qryPrazoPagOCPERCPAGTO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCPAGTO'
      Origin = 'PRAZOPGTOOC.PERCPAGTO'
    end
    object qryPrazoPagOCPRAZOPGTO: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTOOC.PRAZOPGTO'
    end
    object qryPrazoPagOCDATAPAGTO: TDateTimeField
      DisplayLabel = 'Data Pagamento'
      DisplayWidth = 10
      FieldName = 'DATAPAGTO'
      Origin = 'PRAZOPGTOOC.DATAPAGTO'
    end
    object qryPrazoPagOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'PRAZOPGTOOC.IDITEMOC'
      Visible = False
    end
    object qryPrazoPagOCPARCELAPGTO: TFloatField
      FieldName = 'PARCELAPGTO'
      Origin = 'PRAZOPGTOOC.PARCELAPGTO'
      Visible = False
    end
    object qryPrazoPagOCPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTOOC.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
  end
  object dsAgregItemOC: TwwDataSource
    DataSet = qryAgregItemOC
    Left = 518
    Top = 3
  end
  object qryAgregItemOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      AI.IDITEMOC,'
      '      AI.IDAGREGITEMOC,'
      '      AI.CODTIPOCUSTAGREG,'
      '      AI.ALIQUOTA,'
      '      AI.BASECALCULO,'
      '      AI.VLRAGREGITEM,'
      '      TA.DESCCUSTAGREG'
      'FROM'
      '      AGREGITEMOC AI,'
      '      TIPOAGRE TA'
      'WHERE'
      '     (IDITEMOC = :IDITEMOC )'
      ' AND (TA.FLGINCIDECOMPRA = '#39'S'#39')'
      ' AND (AI.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG)'
      'ORDER BY TA.DESCCUSTAGREG')
    ValidateWithMask = True
    Left = 518
    Top = 65525
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDITEMOC'
        ParamType = ptUnknown
      end>
    object qryAgregItemOCDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object qryAgregItemOCALIQUOTA: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'ALIQUOTA'
      Origin = 'AGREGITEMOC.ALIQUOTA'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregItemOCBASECALCULO: TFloatField
      DisplayLabel = 'Base'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
      Origin = 'AGREGITEMOC.BASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregItemOCVLRAGREGITEM: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRAGREGITEM'
      Origin = 'AGREGITEMOC.VLRAGREGITEM'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregItemOCIDITEMOC: TFloatField
      FieldName = 'IDITEMOC'
      Origin = 'AGREGITEMOC.IDITEMOC'
      Visible = False
    end
    object qryAgregItemOCIDAGREGITEMOC: TFloatField
      FieldName = 'IDAGREGITEMOC'
      Origin = 'AGREGITEMOC.IDAGREGITEMOC'
      Visible = False
    end
    object qryAgregItemOCCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'AGREGITEMOC.CODTIPOCUSTAGREG'
      Visible = False
    end
  end
  object qrySCItemOC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDITEMOC,'
      '      NUMSOLCOMPRA,'
      '      IDITEMSOLI'
      'FROM'
      '      SCITEMOC'
      'WHERE'
      '     (IDITEMOC = :IDITEMOC )')
    ValidateWithMask = True
    Left = 584
    Top = 66
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDITEMOC'
        ParamType = ptUnknown
      end>
    object qrySCItemOCIDITEMOC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMOC'
      Origin = 'SCITEMOC.IDITEMOC'
    end
    object qrySCItemOCIDITEMSOLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMSOLI'
      Origin = 'SCITEMOC.IDITEMSOLI'
    end
    object qrySCItemOCNUMSOLCOMPRA: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMSOLCOMPRA'
      Origin = 'SCITEMOC.NUMSOLCOMPRA'
    end
  end
  object qrySelCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.CODPROCESSO, C.IDPROCXART, P.IDCOMPRADOR '
      'FROM COTACOES C, PROCESSO P'
      'WHERE (C.IDITEMOC = :IDITEMOC) AND'
      '      (C.CODPROCESSO = P.CODPROCESSO)')
    ValidateWithMask = True
    Left = 333
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITEMOC'
        ParamType = ptUnknown
      end>
    object qrySelCotacaoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'COTACOES.CODPROCESSO'
    end
    object qrySelCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'COTACOES.IDPROCXART'
    end
    object qrySelCotacaoIDCOMPRADOR: TFloatField
      FieldName = 'IDCOMPRADOR'
      Origin = 'PROCESSO.IDCOMPRADOR'
    end
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsSelCotacao
    SQL.Strings = (
      
        'SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA, QTDEFORNECID' +
        'A,'
      
        '       PRECO, CODMEDIDA, NUMCOT, DATACOT, OBS, MOECODIGO, TXJURO' +
        'S'
      'FROM COTACOES'
      'WHERE (CODPROCESSO = :CODPROCESSO) AND'
      '      (IDPROCXART  = :IDPROCXART)'
      '')
    ValidateWithMask = True
    Left = 489
    Top = 167
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryCotacaoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'COTACOES.CODPROCESSO'
    end
    object qryCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'COTACOES.IDPROCXART'
    end
    object qryCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
    end
    object qryCotacaoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryCotacaoQTDEFORNECIDA: TFloatField
      FieldName = 'QTDEFORNECIDA'
      Origin = 'COTACOES.QTDEFORNECIDA'
    end
    object qryCotacaoPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'COTACOES.PRECO'
    end
    object qryCotacaoCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'COTACOES.CODMEDIDA'
      Size = 4
    end
    object qryCotacaoNUMCOT: TFloatField
      FieldName = 'NUMCOT'
      Origin = 'COTACOES.NUMCOT'
    end
    object qryCotacaoDATACOT: TDateTimeField
      FieldName = 'DATACOT'
      Origin = 'COTACOES.DATACOT'
    end
    object qryCotacaoOBS: TStringField
      FieldName = 'OBS'
      Origin = 'COTACOES.OBS'
      Size = 200
    end
    object qryCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'COTACOES.MOECODIGO'
    end
    object qryCotacaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'COTACOES.TXJUROS'
    end
  end
  object qryProcxArt: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsSelCotacao
    SQL.Strings = (
      'SELECT IDPROCXART, CODPROCESSO, IDPRODVARI, CODARTIGO,'
      '       QTDEPEDIDA, CODMEDIDA, DATANECESSIDADE'
      'FROM PROCXART'
      'WHERE (CODPROCESSO = :CODPROCESSO) AND'
      '      (IDPROCXART  = :IDPROCXART) ')
    ValidateWithMask = True
    Left = 561
    Top = 167
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryProcxArtIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PROCXART.IDPROCXART'
    end
    object qryProcxArtCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PROCXART.CODPROCESSO'
    end
    object qryProcxArtIDPRODVARI: TFloatField
      FieldName = 'IDPRODVARI'
      Origin = 'PROCXART.IDPRODVARI'
    end
    object qryProcxArtCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'PROCXART.CODARTIGO'
      Size = 14
    end
    object qryProcxArtQTDEPEDIDA: TFloatField
      FieldName = 'QTDEPEDIDA'
      Origin = 'PROCXART.QTDEPEDIDA'
    end
    object qryProcxArtCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'PROCXART.CODMEDIDA'
      Size = 4
    end
    object qryProcxArtDATANECESSIDADE: TDateTimeField
      FieldName = 'DATANECESSIDADE'
      Origin = 'PROCXART.DATANECESSIDADE'
    end
  end
  object dsSelCotacao: TwwDataSource
    DataSet = qrySelCotacao
    Left = 333
    Top = 174
  end
  object qryPrazoPgto: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsSelCotacao
    SQL.Strings = (
      'SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA, IDPRAZOPGTO,'
      '       PRAZOPGTO, PERIODOPRAZO, DATAPGTO, PERCENT'
      'FROM PRAZOPGTO'
      'WHERE (CODPROCESSO = :CODPROCESSO) AND'
      '      (IDPROCXART  = :IDPROCXART)'
      '')
    ValidateWithMask = True
    Left = 642
    Top = 170
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryPrazoPgtoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOPGTO.CODPROCESSO'
    end
    object qryPrazoPgtoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOPGTO.IDPROCXART'
    end
    object qryPrazoPgtoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOPGTO.IDFORCLI'
    end
    object qryPrazoPgtoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOPGTO.PROPOSTA'
    end
    object qryPrazoPgtoIDPRAZOPGTO: TFloatField
      FieldName = 'IDPRAZOPGTO'
      Origin = 'PRAZOPGTO.IDPRAZOPGTO'
    end
    object qryPrazoPgtoPRAZOPGTO: TFloatField
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTO.PRAZOPGTO'
    end
    object qryPrazoPgtoPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTO.PERIODOPRAZO'
      Size = 1
    end
    object qryPrazoPgtoDATAPGTO: TDateTimeField
      FieldName = 'DATAPGTO'
      Origin = 'PRAZOPGTO.DATAPGTO'
    end
    object qryPrazoPgtoPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'PRAZOPGTO.PERCENT'
    end
  end
  object qryPrazoEntrega: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsSelCotacao
    SQL.Strings = (
      'SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA, IDPRAZOENT,'
      '       CODMEDIDA, PERIODOPRAZO, DATAENT, QTDEENT'
      'FROM PRAZOENTREGA'
      'WHERE (CODPROCESSO = :CODPROCESSO) AND'
      '      (IDPROCXART  = :IDPROCXART)'
      '')
    ValidateWithMask = True
    Left = 498
    Top = 230
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryPrazoEntregaCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOENTREGA.CODPROCESSO'
    end
    object qryPrazoEntregaIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOENTREGA.IDPROCXART'
    end
    object qryPrazoEntregaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOENTREGA.IDFORCLI'
    end
    object qryPrazoEntregaPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOENTREGA.PROPOSTA'
    end
    object qryPrazoEntregaIDPRAZOENT: TFloatField
      FieldName = 'IDPRAZOENT'
      Origin = 'PRAZOENTREGA.IDPRAZOENT'
    end
    object qryPrazoEntregaQTDEENT: TFloatField
      FieldName = 'QTDEENT'
      Origin = 'PRAZOENTREGA.QTDEENT'
    end
    object qryPrazoEntregaCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'PRAZOENTREGA.CODMEDIDA'
      Size = 4
    end
    object qryPrazoEntregaPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGA.PERIODOPRAZO'
      Size = 1
    end
    object qryPrazoEntregaDATAENT: TDateTimeField
      FieldName = 'DATAENT'
      Origin = 'PRAZOENTREGA.DATAENT'
    end
  end
  object qryImpostos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsSelCotacao
    SQL.Strings = (
      
        'SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA, CODTIPOCUSTA' +
        'GREG,'
      '       BASECALCULO, PERCENT, VALOR'
      'FROM VALORAGREGCOT'
      'WHERE (CODPROCESSO = :CODPROCESSO) AND'
      '      (IDPROCXART  = :IDPROCXART)')
    ValidateWithMask = True
    Left = 603
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryImpostosCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'VALORAGREGCOT.CODPROCESSO'
    end
    object qryImpostosIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'VALORAGREGCOT.IDPROCXART'
    end
    object qryImpostosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'VALORAGREGCOT.IDFORCLI'
    end
    object qryImpostosPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'VALORAGREGCOT.PROPOSTA'
    end
    object qryImpostosCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'VALORAGREGCOT.CODTIPOCUSTAGREG'
    end
    object qryImpostosBASECALCULO: TFloatField
      FieldName = 'BASECALCULO'
      Origin = 'VALORAGREGCOT.BASECALCULO'
    end
    object qryImpostosPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'VALORAGREGCOT.PERCENT'
    end
    object qryImpostosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALORAGREGCOT.VALOR'
    end
  end
  object qrySCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SOLI.NUMSOLCOMPRA,'
      '      IT.CODARTIGO,'
      '      IT.QTDEPEDIDA,'
      '      IT.QTDEPENDENTE,'
      '      IT.CODMEDIDA,'
      '      IT.OBSITEMSOLIC,'
      
        '      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVAR' +
        'I),1,60) AS DESCRICAO'
      'FROM'#9#9
      '     ITEMSOLI IT,'
      '     ( SELECT NUMSOLCOMPRA  '
      '       FROM  SOLICOMP'
      '       GROUP BY NUMSOLCOMPRA '
      '   '#9') SOLI,'
      '    SCITEMOC SXC,'
      '    PRODUTO P,'
      '    ARTIGO A,'
      '    PRODVARI PV'
      'WHERE'
      '      (SXC.IDITEMOC    = :IDITEMOC)'
      '  AND (IT.IDITEMSOLI   =  SXC.IDITEMSOLI)'
      '  AND (IT.NUMSOLCOMPRA = SOLI.NUMSOLCOMPRA )'
      '  AND (A.CODARTIGO     = IT.CODARTIGO)'
      '  AND (A.CODPRODUTO    = P.CODPRODUTO)'
      '  AND (IT.IDPRODVARI  = PV.IDPRODVARI(+))'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 409
    Top = 247
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDITEMOC'
        ParamType = ptUnknown
      end>
    object qrySCINUMSOLCOMPRA: TFloatField
      DisplayLabel = 'Nº  da SCI'
      DisplayWidth = 10
      FieldName = 'NUMSOLCOMPRA'
    end
    object qrySCICODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qrySCICODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qrySCIQTDEPEDIDA: TFloatField
      DisplayLabel = 'Qtde~Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#,##0.00'
    end
    object qrySCIQTDEPENDENTE: TFloatField
      DisplayLabel = 'Qtde~Pendente'
      DisplayWidth = 10
      FieldName = 'QTDEPENDENTE'
      DisplayFormat = '#,##0.00'
    end
    object qrySCIOBSITEMSOLIC: TStringField
      DisplayLabel = 'OBS'
      DisplayWidth = 200
      FieldName = 'OBSITEMSOLIC'
      Visible = False
      Size = 200
    end
    object qrySCIDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsSCI: TwwDataSource
    DataSet = qrySCI
    Left = 409
    Top = 231
  end
end
