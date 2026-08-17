inherited FrmMTViewRestricao: TFrmMTViewRestricao
  Left = 102
  Top = 128
  Caption = 'Visualização de Restrição'
  ClientHeight = 357
  ClientWidth = 617
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 318
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Fornecedor'
    end
    object edForn: TEdit
      Left = 24
      Top = 32
      Width = 569
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'Airton Senna'
    end
    object plnf: TPanel
      Left = 5
      Top = 74
      Width = 607
      Height = 239
      Align = alBottom
      TabOrder = 1
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 605
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Restrições'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Grd: TwwDBGrid
        Left = 1
        Top = 32
        Width = 344
        Height = 206
        Selected.Strings = (
          'DATAINI'#9'10'#9'Data~Inicio'
          'DATAFIM'#9'10'#9'Data~Término'
          'FLEXIVEL'#9'3'#9'Flexível'
          'CODARTIGO'#9'14'#9'Código'
          'DESCRICAO'#9'35'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alLeft
        DataSource = ds
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 345
        Top = 32
        Width = 261
        Height = 206
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 2
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 259
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = 'Motivo'
          TabOrder = 0
        end
        object memMotivo: TDBMemo
          Left = 1
          Top = 32
          Width = 259
          Height = 173
          Align = alClient
          DataField = 'MOTIVO'
          DataSource = ds
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 451
      DockPos = 485
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = Cds
    Left = 325
    Top = 296
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 325
    Top = 266
  end
end
