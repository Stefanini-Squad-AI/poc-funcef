inherited frmAgendaTrein: TfrmAgendaTrein
  Left = 30
  Top = 154
  Caption = 'Agenda de Treinamento nos Próximos 7 Dias'
  ClientHeight = 329
  ClientWidth = 733
  Constraints.MinHeight = 356
  Constraints.MinWidth = 741
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 290
    object dbGrd: TwwDBGrid
      Left = 5
      Top = 5
      Width = 723
      Height = 280
      Selected.Strings = (
        'DATPLINI'#9'12'#9'Data Início'
        'DATPLFIM'#9'13'#9'Data Término'
        'DESCRICAO'#9'40'#9'Curso'
        'LOCALCURSO'#9'80'#9'Local')
      IniAttributes.Delimiter = ';;'
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsHstTrn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 567
      DockPos = 575
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 321
    Top = 107
  end
  object dsHstTrn: TwwDataSource
    AutoEdit = False
    Left = 378
    Top = 106
  end
end
