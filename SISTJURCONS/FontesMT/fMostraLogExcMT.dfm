inherited FrmMostraLogExcMT: TFrmMostraLogExcMT
  Left = 280
  Top = 124
  Caption = 'LOG de Informações sobre a Operação de EXCLUSÃO'
  ClientHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 293
    object dbegrideleta: TwwDBGrid
      Left = 1
      Top = 1
      Width = 586
      Height = 291
      Hint = 
        'Seleção do respectivo usuário onde foi efetuado OPERAÇÃO de EXCL' +
        'USÃO '
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
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
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 293
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 191
    Top = 207
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 240
    Top = 208
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 159
  end
end
