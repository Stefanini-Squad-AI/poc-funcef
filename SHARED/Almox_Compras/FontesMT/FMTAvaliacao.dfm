inherited FrmMTAvaliacao: TFrmMTAvaliacao
  Left = 4
  Top = 138
  Caption = 'Avaliação de Fornecedor'
  ClientWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 780
    BevelInner = bvNone
    BevelOuter = bvNone
    object Splitter1: TSplitter
      Left = 188
      Top = 3
      Width = 8
      Height = 228
      Cursor = crHSplit
    end
    object plnGrd: TPanel
      Left = 3
      Top = 3
      Width = 185
      Height = 228
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'plnGrd'
      TabOrder = 0
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 181
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Avaliação'
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
        Left = 2
        Top = 33
        Width = 181
        Height = 193
        Selected.Strings = (
          'DESCTIPOAVALIACAO'#9'50'#9'Avaliação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsTipo
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
        IndicatorColor = icBlack
      end
    end
    object Panel2: TPanel
      Left = 196
      Top = 3
      Width = 581
      Height = 228
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 1
      object Panel3: TPanel
        Left = 5
        Top = 5
        Width = 571
        Height = 28
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 6
          Width = 71
          Height = 15
          Caption = 'Fornecedor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbForn: TLabel
          Left = 82
          Top = 6
          Width = 295
          Height = 16
          AutoSize = False
          Caption = 'Airto Senna'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 383
          Top = 6
          Width = 47
          Height = 15
          Caption = 'Nota Nº :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbNota: TLabel
          Left = 434
          Top = 6
          Width = 129
          Height = 15
          Caption = '213123123112134/909'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GrdCrit: TwwDBGrid
        Left = 5
        Top = 33
        Width = 571
        Height = 190
        Selected.Strings = (
          'DESCCRITAVALIACAO'#9'46'#9'Critério'
          'PESO'#9'10'#9'Peso'
          'NOTA'#9'10'#9'Nota')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsCrit
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnColExit = GrdCritColExit
        OnKeyPress = GrdCritKeyPress
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Width = 780
    inherited tb97Fundo: TToolbar97
      Left = 610
      DockPos = 629
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 443
      DockPos = 462
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 507
  end
  object ds: TwwDataSource
    AutoEdit = False
    Left = 133
    Top = 120
  end
  object dsTipo: TwwDataSource
    AutoEdit = False
    OnDataChange = dsTipoDataChange
    Left = 317
    Top = 120
  end
  object dsCrit: TwwDataSource
    Tag = 96
    AutoEdit = False
    Left = 405
    Top = 120
  end
  object CdsCrit: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = CdsCritNewRecord
    OnPostError = CdsCritPostError
    Left = 412
    Top = 91
  end
  object CdsTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 324
    Top = 99
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    Left = 133
    Top = 168
  end
end
