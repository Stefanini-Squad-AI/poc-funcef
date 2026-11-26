inherited frmProcessoPadrao: TfrmProcessoPadrao
  Left = 0
  Top = 137
  Caption = 'Tela Padrão de Processamento'
  ClientHeight = 399
  ClientWidth = 792
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 360
    object Splitter1: TSplitter
      Left = 1
      Top = 141
      Width = 790
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object pnlOpcoes: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 140
      Align = alTop
      TabOrder = 0
    end
    object pgctrlInformacoes: TPageControl
      Left = 1
      Top = 144
      Width = 790
      Height = 215
      ActivePage = tbsResultado
      Align = alClient
      HotTrack = True
      TabOrder = 1
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 3
        inline frameProgresso: TfrmFrameProgresso
          Width = 782
          Height = 187
          Align = alClient
          PopupMenu = frameProgresso.PopupMenu1
          inherited Panel1: TPanel
            Width = 782
            Height = 161
            inherited toolControles: TToolBar
              Width = 780
            end
            inherited redResultado: TRichEdit
              Width = 780
              Height = 119
              Font.Height = -12
              Lines.Strings = ()
            end
            inherited redTemp: TRichEdit
              Top = 56
              Width = 760
              Height = 197
              Font.Height = -12
            end
          end
          inherited BarraProgresso: TProgressBar
            Top = 161
            Width = 782
            Height = 7
          end
          inherited StatusBar1: TStatusBar
            Top = 168
            Width = 782
          end
          inherited ActionList1: TActionList
            Left = 320
            Top = 8
          end
          inherited ImageList1: TImageList
            Left = 248
            Top = 8
          end
          inherited qryFrame: TwwQuery
            Left = 400
            Top = 8
          end
          inherited PopupMenu1: TPopupMenu
            Left = 280
            Top = 8
          end
          inherited SaveDialog1: TSaveDialog
            Left = 360
            Top = 8
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 360
      inherited sep1: TToolbarSep97
        Left = 345
      end
      inherited bbtnSair: TBitBtn
        Left = 264
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 347
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 128
        Height = 33
        Caption = 'Processar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnProcessarClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
      end
      object bbtnProcessarOutro: TBitBtn
        Left = 128
        Top = 0
        Width = 136
        Height = 33
        Caption = '&Processar Outro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = bbtnProcessarOutroClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 851
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
end
