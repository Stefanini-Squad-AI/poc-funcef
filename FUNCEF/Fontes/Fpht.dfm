inherited frmPHT: TfrmPHT
  Left = 109
  Top = 146
  Caption = 'PHT'
  ClientHeight = 350
  ClientWidth = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 616
    Height = 311
    object Splitter1: TSplitter
      Left = 5
      Top = 161
      Width = 606
      Height = 5
      Cursor = crSizeNS
      Align = alTop
    end
    object mem: TMemo
      Left = 5
      Top = 5
      Width = 606
      Height = 156
      Align = alTop
      TabOrder = 0
    end
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 166
      Width = 606
      Height = 140
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
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
  inherited Dock971: TDock97
    Top = 311
    Width = 616
    object lbl: TLabel [0]
      Left = 13
      Top = 11
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 446
      DockPos = 571
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 196
      DockPos = 318
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        Caption = '&Commit'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 166
        Caption = '&Rollback'
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Faz'
        Default = True
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 210
    Top = 57
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 256
    Top = 88
  end
end
