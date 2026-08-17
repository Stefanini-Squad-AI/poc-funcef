inherited FrmMTValTotAgreg: TFrmMTValTotAgreg
  Left = 191
  Top = 165
  Caption = 'Valores Totais'
  ClientHeight = 320
  ClientWidth = 532
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 281
    object PnlGrd: TPanel
      Left = 24
      Top = 24
      Width = 483
      Height = 225
      BevelInner = bvLowered
      Caption = 'PnlGrd'
      TabOrder = 0
      object Label2: TLabel
        Left = 352
        Top = 176
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 479
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Total dos Agregados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbedValor: TDBRealEdit
        Left = 352
        Top = 192
        Width = 108
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        OnExit = dbedValorExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRAGREGADO'
        DataSource = dsValTotAgreg
      end
      object grd: TwwDBGrid
        Left = 2
        Top = 33
        Width = 479
        Height = 134
        Selected.Strings = (
          'CODTIPOCUSTAGREG'#9'10'#9'Código'
          'DESCCUSTAGREG'#9'25'#9'Descrição'
          'VLRAGREGADO'#9'10'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dsValTotAgreg
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnDblClick = grdDblClick
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 281
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 362
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 3
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object dsValTotAgreg: TwwDataSource
    AutoEdit = False
    DataSet = FrmMTRecebMerc.CdsValTotAgreg
    Left = 264
    Top = 200
  end
end
