inherited FrmDocumConcFinan: TFrmDocumConcFinan
  Left = 254
  Top = 159
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Documentos Conciliados/Regularizados no Controle Financeiro'
  ClientHeight = 302
  ClientWidth = 489
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 489
    Height = 263
    object Grid: TwwDBGrid
      Left = 1
      Top = 71
      Width = 487
      Height = 191
      Selected.Strings = (
        'DATALANCFINAN'#9'13'#9'Data'#9'F'
        'HISTORICO'#9'60'#9'Histórico'#9'F'
        'NODOCUMENTO'#9'10'#9'Documento'#9'F'
        'NUMCHQBORDERO'#9'15'#9'Num.Chq./Bordero'#9'F'
        'PORTADORFORMA'#9'50'#9'Contas/Caixas x Tipo de Cobrança'#9'F'
        'VALORLANCFINAN'#9'10'#9'Valor'#9'F'
        'VALOROUTRAMOEDA'#9'15'#9'Valor Outra Moeda'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      OnCalcCellColors = GridCalcCellColors
      OnTitleButtonClick = GridTitleButtonClick
      IndicatorColor = icBlack
      OnTopRowChanged = GridTopRowChanged
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 487
      Height = 70
      Align = alTop
      TabOrder = 1
      object Memo1: TMemo
        Left = 32
        Top = 8
        Width = 433
        Height = 73
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Para tais baixas a excluir, existem conciliações realizadas '
          'no Controle Financeiro. Ao continuar o processo, as '
          'conciliações serão automaticamentes desfeitas.')
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 263
    Width = 489
    inherited tb97Fundo: TToolbar97
      Left = 317
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 148
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 723
    Top = 27
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object ds: TwwDataSource
    DataSet = CdsDocFinan
    Left = 760
    Top = 32
  end
  object CdsDocFinan: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsDocFinanAfterOpen
    Left = 705
    Top = 73
  end
end
