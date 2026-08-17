inherited frmRADConsultaViewCotacao: TfrmRADConsultaViewCotacao
  Left = 215
  Top = 187
  Caption = 'Consulta Cotação'
  ClientHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 293
    object PlnDescProd: TPanel
      Left = 1
      Top = 1
      Width = 586
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
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 1
      Top = 26
      Width = 586
      Height = 266
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 1
      object plnItem: TPanel
        Left = 223
        Top = 5
        Width = 358
        Height = 256
        Align = alRight
        BevelOuter = bvNone
        Caption = 'plnItem'
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 0
          Width = 8
          Height = 256
          Cursor = crHSplit
          Beveled = True
        end
        object PgItem: TPageControl
          Left = 8
          Top = 0
          Width = 350
          Height = 256
          ActivePage = TabPrazoEnt
          Align = alClient
          TabOrder = 0
          object TabPrazoEnt: TTabSheet
            Caption = 'Prazo de Ent.'
            object GrdPrazoEnt: TwwDBGrid
              Left = 0
              Top = 0
              Width = 342
              Height = 228
              Selected.Strings = (
                'QTDEENT'#9'10'#9'Qtde.'
                'CODMEDIDA'#9'4'#9'Unid.'
                'DATAENT'#9'10'#9'Data')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
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
              MaxLength = 200
              TabOrder = 0
            end
          end
        end
      end
      object GrdItem: TwwDBGrid
        Left = 5
        Top = 5
        Width = 218
        Height = 256
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
  end
  inherited Dock971: TDock97
    Top = 293
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object cdsCotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 340
    Top = 71
  end
  object dsCotacao: TwwDataSource
    AutoEdit = False
    DataSet = cdsCotacao
    Left = 340
    Top = 86
  end
  object cdsPrazoPgto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 492
    Top = 95
  end
  object dsPrazoPgto: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoPgto
    Left = 492
    Top = 110
  end
  object cdsImpostos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 452
    Top = 160
  end
  object dsImpostos: TwwDataSource
    AutoEdit = False
    DataSet = cdsImpostos
    Left = 452
    Top = 174
  end
  object cdsPrazoEntrega: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 348
    Top = 159
  end
  object dsPrazoEntrega: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoEntrega
    Left = 348
    Top = 174
  end
end
