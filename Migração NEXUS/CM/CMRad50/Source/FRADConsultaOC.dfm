inherited frmRADConsultaOC: TfrmRADConsultaOC
  Left = 177
  Top = 258
  Caption = 'Consulta OC'
  ClientHeight = 413
  ClientWidth = 749
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 749
    Height = 374
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 747
      Height = 372
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object plnItem: TPanel
        Left = 1
        Top = 86
        Width = 745
        Height = 285
        Align = alClient
        BevelOuter = bvNone
        Caption = 'plnItem'
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 361
          Top = 0
          Width = 8
          Height = 285
          Cursor = crHSplit
          Beveled = True
        end
        object PgOC: TPageControl
          Left = 0
          Top = 0
          Width = 361
          Height = 285
          ActivePage = TabItem
          Align = alLeft
          TabOrder = 0
          object TabItem: TTabSheet
            Caption = 'Itens da O.C.'
            object GrdItem: TwwDBGrid
              Left = 0
              Top = 0
              Width = 353
              Height = 257
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
              Height = 174
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
          Width = 376
          Height = 285
          ActivePage = TabPrazoEnt
          Align = alClient
          TabOrder = 1
          object TabPrazoEnt: TTabSheet
            Caption = 'Prazo de Ent.'
            object GrdPrazoEnt: TwwDBGrid
              Left = 0
              Top = 0
              Width = 368
              Height = 257
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
              Width = 368
              Height = 174
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
              Width = 368
              Height = 174
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
              Width = 368
              Height = 174
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
        Width = 745
        Height = 85
        Align = alTop
        TabOrder = 1
        object DBText1: TDBText
          Left = 142
          Top = 15
          Width = 53
          Height = 16
          AutoSize = True
          DataField = 'STATUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 317
          Top = 1
          Width = 28
          Height = 13
          Caption = 'Data'
          FocusControl = edData
        end
        object Label1: TLabel
          Left = 8
          Top = 40
          Width = 76
          Height = 13
          Caption = 'Razão Social'
          FocusControl = edFron
        end
        object Label3: TLabel
          Left = 6
          Top = 1
          Width = 48
          Height = 13
          Caption = 'O.C. no.'
          FocusControl = edData
        end
        object edData: TDBEdit
          Left = 317
          Top = 15
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
          TabOrder = 0
        end
        object edFron: TDBEdit
          Left = 8
          Top = 54
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
          TabOrder = 1
        end
        object edNumOC: TDBEdit
          Left = 7
          Top = 14
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
          TabOrder = 2
        end
        object GroupBox1: TGroupBox
          Left = 464
          Top = 4
          Width = 273
          Height = 70
          Caption = 'Legenda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label5: TLabel
            Left = 34
            Top = 20
            Width = 46
            Height = 13
            Caption = 'Pendente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label7: TLabel
            Left = 34
            Top = 47
            Width = 46
            Height = 13
            Caption = 'Recebido'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label8: TLabel
            Left = 143
            Top = 21
            Width = 51
            Height = 13
            Caption = 'Cancelado'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label6: TLabel
            Left = 145
            Top = 47
            Width = 114
            Height = 13
            Caption = 'Cancelado parcialmente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Panel6: TPanel
            Left = 10
            Top = 18
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'P'
            Color = 8454143
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Panel2: TPanel
            Left = 10
            Top = 44
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'R'
            Color = 8454016
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object Panel7: TPanel
            Left = 120
            Top = 18
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'C'
            Color = 8421631
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object Panel3: TPanel
            Left = 120
            Top = 44
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'A'
            Color = clAqua
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 580
      DockPos = 580
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 3
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
  object cdsPrazoPagOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 144
  end
  object cdsPrazoEntOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 208
  end
  object CdsOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 580
    Top = 223
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
  object cdsItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsItemOCAfterOpen
    Left = 664
    Top = 225
  end
  object cdsSCIOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 287
  end
end
