inherited FrmMTViewCotacao: TFrmMTViewCotacao
  Left = 45
  Top = 144
  Caption = 'Visualizazação da Cotação'
  ClientHeight = 297
  ClientWidth = 706
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 706
    Height = 258
    object Panel1: TPanel
      Left = 5
      Top = 30
      Width = 696
      Height = 223
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object plnItem: TPanel
        Left = 333
        Top = 5
        Width = 358
        Height = 213
        Align = alRight
        BevelOuter = bvNone
        Caption = 'plnItem'
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 0
          Width = 8
          Height = 213
          Cursor = crHSplit
          Beveled = True
        end
        object PgItem: TPageControl
          Left = 8
          Top = 0
          Width = 350
          Height = 213
          ActivePage = TabPrazoEnt
          Align = alClient
          TabOrder = 0
          object TabPrazoEnt: TTabSheet
            Caption = 'Prazo de Ent.'
            object GrdPrazoEnt: TwwDBGrid
              Left = 0
              Top = 0
              Width = 342
              Height = 185
              Selected.Strings = (
                'QTDEENT'#9'10'#9'Qtde.'
                'CODMEDIDA'#9'4'#9'Unid.'
                'DATAENT'#9'10'#9'Data')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsPrazoEntrega
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
              IndicatorColor = icBlack
            end
          end
          object TabPrazoPag: TTabSheet
            Caption = 'Prazo de Pag.'
            object GrdPrazoPag: TwwDBGrid
              Left = 0
              Top = 0
              Width = 342
              Height = 185
              Selected.Strings = (
                'PERCENT'#9'10'#9'Percentual'
                'PRAZOPGTO'#9'10'#9'Prazo em dias'
                'DATAPGTO'#9'18'#9'Data Pagto.')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsPrazoPgto
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
              IndicatorColor = icBlack
            end
          end
          object TabAgreg: TTabSheet
            Caption = 'Agregados'
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 342
              Height = 185
              Selected.Strings = (
                'DESCCUSTAGREG'#9'20'#9'Descrição'#9'F'
                'PERCENT'#9'10'#9'Aliquota'
                'BASECALCULO'#9'10'#9'Base'
                'VALOR'#9'10'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsImpostos
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
              IndicatorColor = icBlack
            end
          end
          object TabObsItem: TTabSheet
            Caption = 'Obs. Item'
            Enabled = False
            object memObsItem: TDBMemo
              Left = 0
              Top = 0
              Width = 365
              Height = 185
              Align = alLeft
              DataField = 'OBS'
              DataSource = dsCotacao
              MaxLength = 200
              TabOrder = 0
            end
          end
        end
      end
      object GrdItem: TwwDBGrid
        Left = 5
        Top = 5
        Width = 328
        Height = 213
        Hint = 'Duplo click para cancelar o item'
        Selected.Strings = (
          'VENCEDOR'#9'1'#9'  '#9'F'
          'RAZAOSOCIAL'#9'30'#9'Fonecedor'#9'F'
          'QTDEFORNECIDA'#9'10'#9'Qtde. '#9'F'
          'PRECO'#9'10'#9'Preço'#9'F'
          'CODMEDIDA'#9'4'#9'Unid.'#9'F'
          'NUMCOT'#9'10'#9'Nº da Contação'#9'F'
          'DATACOT'#9'18'#9'Data'#9'F'
          'TXJUROS'#9'10'#9'Tx. Juros'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsCotacao
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object PlnDescProd: TPanel
      Left = 5
      Top = 5
      Width = 696
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      Caption = '  Descrição do Produto'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 258
    Width = 706
    inherited tb97Fundo: TToolbar97
      Left = 540
      DockPos = 557
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object dsCotacao: TwwDataSource
    AutoEdit = False
    DataSet = cdsCotacao
    OnDataChange = dsCotacaoDataChange
    Left = 436
    Top = 54
  end
  object dsPrazoEntrega: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoEntrega
    Left = 444
    Top = 142
  end
  object dsImpostos: TwwDataSource
    AutoEdit = False
    DataSet = cdsImpostos
    Left = 548
    Top = 142
  end
  object dsPrazoPgto: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoPgto
    Left = 588
    Top = 78
  end
  object cdsCotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 39
  end
  object cdsPrazoEntrega: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 444
    Top = 127
  end
  object cdsImpostos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 548
    Top = 128
  end
  object cdsPrazoPgto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 588
    Top = 63
  end
end
