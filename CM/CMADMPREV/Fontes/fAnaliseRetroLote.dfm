inherited frmAnaliseRetroLote: TfrmAnaliseRetroLote
  Left = 0
  Top = 33
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Análise de Arquivo para Retroativo em Lote'
  ClientHeight = 512
  ClientWidth = 792
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 473
    object Panel2: TPanel
      Left = 5
      Top = 46
      Width = 782
      Height = 422
      Align = alClient
      TabOrder = 1
      object pnEstat: TPanel
        Left = 1
        Top = 1
        Width = 780
        Height = 62
        Align = alTop
        TabOrder = 0
        Visible = False
        object pn3: TPanel
          Left = 668
          Top = 1
          Width = 111
          Height = 60
          Align = alRight
          BevelInner = bvRaised
          BorderWidth = 3
          Font.Charset = OEM_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'terminal'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lbDecorrido: TLabel
            Left = 13
            Top = 30
            Width = 89
            Height = 18
            Alignment = taCenter
            Caption = '00:00:00'
          end
          object Label9: TLabel
            Left = 27
            Top = 8
            Width = 61
            Height = 22
            Caption = 'Tempo'
            Font.Charset = OEM_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object pn2: TPanel
          Left = 287
          Top = 1
          Width = 381
          Height = 60
          Align = alRight
          BevelInner = bvRaised
          BorderWidth = 3
          Font.Charset = OEM_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'terminal'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label6: TLabel
            Left = 54
            Top = 10
            Width = 163
            Height = 16
            Caption = 'Pessoas não cadastradas:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbPessNao: TLabel
            Left = 226
            Top = 9
            Width = 87
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Font.Charset = OEM_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'terminal'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 15
            Top = 33
            Width = 61
            Height = 16
            Caption = 'Elegíveis:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbPessEleg: TLabel
            Left = 82
            Top = 32
            Width = 87
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Font.Charset = OEM_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'terminal'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 182
            Top = 33
            Width = 87
            Height = 16
            Caption = 'Participantes:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbPessPart: TLabel
            Left = 277
            Top = 32
            Width = 87
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Font.Charset = OEM_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'terminal'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pn1: TPanel
          Left = 1
          Top = 1
          Width = 286
          Height = 60
          Align = alClient
          BevelInner = bvRaised
          BorderWidth = 3
          Font.Charset = OEM_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'terminal'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label8: TLabel
            Left = 10
            Top = 11
            Width = 167
            Height = 16
            Caption = 'Rubricas não cadastradas:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbRubNao: TLabel
            Left = 181
            Top = 10
            Width = 88
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Font.Charset = OEM_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'terminal'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbRubSim: TLabel
            Left = 181
            Top = 30
            Width = 88
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Font.Charset = OEM_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'terminal'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 35
            Top = 31
            Width = 139
            Height = 16
            Caption = 'Rubricas cadastradas:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object redResult: TRichEdit
        Left = 1
        Top = 63
        Width = 780
        Height = 358
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HideSelection = False
        HideScrollBars = False
        ParentFont = False
        PlainText = True
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
        WantReturns = False
        WordWrap = False
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 782
      Height = 41
      Align = alTop
      TabOrder = 0
      object lblArquivoPatro: TLabel
        Left = 25
        Top = 14
        Width = 145
        Height = 13
        Caption = 'Arquivo da Patrocinadora'
      end
      object spArquivoTexto: TSpeedButton
        Left = 748
        Top = 10
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = spArquivoTextoClick
      end
      object edTxt: TEdit
        Left = 180
        Top = 10
        Width = 561
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 473
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 444
      inherited sep1: TToolbarSep97
        Left = 244
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 164
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnAnalisar: TBitBtn
        Left = 82
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Analisar'
        TabOrder = 3
        OnClick = bbtnAnalisarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos Texto (*.txt)|*.txt'
    Title = 'Seleção de arquivo para Recebimento'
    Left = 47
    Top = 6
  end
end
