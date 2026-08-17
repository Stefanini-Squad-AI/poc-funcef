inherited FrmMTViewSCI: TFrmMTViewSCI
  Left = 16
  Top = 163
  Caption = 'Visualização da S.C.I.'
  ClientHeight = 251
  ClientWidth = 742
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 742
    Height = 212
    object plnTitulo: TPanel
      Left = 1
      Top = 1
      Width = 740
      Height = 30
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 64
        Top = 7
        Width = 53
        Height = 16
        Caption = 'Código :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 224
        Top = 7
        Width = 70
        Height = 16
        Caption = 'Descrição :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbStatus: TLabel
        Left = 8
        Top = 7
        Width = 39
        Height = 16
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCodigo: TLabel
        Left = 120
        Top = 8
        Width = 45
        Height = 16
        Caption = 'Codigo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbDescricao: TLabel
        Left = 300
        Top = 7
        Width = 70
        Height = 16
        Caption = 'Deescrição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GrdSCI: TwwDBGrid
      Tag = 99
      Left = 1
      Top = 31
      Width = 740
      Height = 180
      Selected.Strings = (
        'NUMSOLCOMPRA'#9'10'#9'Nº  da SCI'#9'F'
        'CODARTIGO'#9'14'#9'Código'#9'F'
        'DESCRICAO'#9'35'#9'Descrição'#9'F'
        'CODMEDIDA'#9'4'#9'Unidade'#9'F'
        'QTDEPEDIDA'#9'10'#9'Qtde~Pedida'#9'F'
        'QTDEPENDENTE'#9'10'#9'Qtde~Pendente'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsSCI
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 212
    Width = 742
    inherited tb97Fundo: TToolbar97
      Left = 574
      DockPos = 589
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 65515
  end
  object dsSCI: TwwDataSource
    AutoEdit = False
    DataSet = cdsSCI
    Left = 392
    Top = 88
  end
  object cdsSCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 80
  end
end
