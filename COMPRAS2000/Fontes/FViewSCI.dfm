inherited FrmViewSCI: TFrmViewSCI
  Left = 45
  Top = 196
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
    object GrdSCI: TwwDBGrid
      Tag = 99
      Left = 5
      Top = 35
      Width = 732
      Height = 172
      Selected.Strings = (
        'NUMSOLCOMPRA'#9'10'#9'Nº  da SCI'
        'CODARTIGO'#9'14'#9'Código'
        'DESCRICAO'#9'35'#9'Descrição'
        'CODMEDIDA'#9'4'#9'Unidade'
        'QTDEPEDIDA'#9'10'#9'Qtde~Pedida'
        'QTDEPENDENTE'#9'10'#9'Qtde~Pendente')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = FrmCancelaOC.dsSCI
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object plnTitulo: TPanel
      Left = 5
      Top = 5
      Width = 732
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
      TabOrder = 1
      object Label1: TLabel
        Left = 64
        Top = 8
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
        Top = 8
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
      object DBText1: TDBText
        Left = 8
        Top = 8
        Width = 41
        Height = 17
        Alignment = taCenter
        DataField = 'STATUS'
        DataSource = FrmCancelaOC.dsItemOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 120
        Top = 8
        Width = 65
        Height = 17
        DataField = 'CODARTIGO'
        DataSource = FrmCancelaOC.dsItemOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 296
        Top = 8
        Width = 53
        Height = 16
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = FrmCancelaOC.dsItemOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 212
    Width = 742
    inherited tb97Fundo: TToolbar97
      Left = 576
      DockPos = 576
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
  end
end
