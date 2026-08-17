inherited frmPrincipal: TfrmPrincipal
  Left = 80
  Top = 43
  Caption = 'Contabilidade'
  ClientHeight = 591
  ClientWidth = 1120
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 1120
    inherited tb97Atalho: TToolbar97
      inherited ToolBarsep973: TToolbarSep97
        Blank = False
      end
    end
    object Toolbar971: TToolbar97
      Left = 216
      Top = 0
      Caption = 'Atalhos'
      CloseButton = False
      DefaultDock = Dock97Top
      DockableTo = [dpTop, dpBottom]
      DockPos = 216
      TabOrder = 1
      object tbtnAtuAnal: TToolbarButton97
        Left = 23
        Top = 0
        Width = 23
        Height = 22
        Action = ActAtuAnal
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055000000000000005500000057777777777777705500000057F8
          8888888888705500000057F808B0B0B8B8705500000057FB0B808B8B8B705500
          000057F80000B8B8B8705500000057FB0B808B828B705500000057F8B008B822
          28705500000057FB8B8B822222705500000057FFFFFF222722205500000057B8
          B8B8B255522255000000557B8B8B755555222500000055577777555555522200
          0000555555555555555522000000555555555555555555000000}
        Images = ImlPadrao
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnLancamentos: TToolbarButton97
        Left = 154
        Top = 0
        Width = 23
        Height = 22
        Action = ActLancamento
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055557000000005555500000055557BBBBBBB0555550000005555
          7777777705555500000055555555555555CC55000000555555555555555CC500
          00005700000000005555CC00000057BFB7BF7FB055C5CC00000057FBF7FB7BF0
          5CC5CC00000057BFB7BF7FB7CCCCCC00000057FBF7FB7BFCCCCCC500000057BF
          B7BF7FB7CCCC5500000057FBF7FB7BF05CC55500000057777777777055C55500
          0000555555555555555555000000555555555555555555000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object ToolbarSep971: TToolbarSep97
        Left = 69
        Top = 0
        SizeHorz = 8
      end
      object tbtnAtuSin: TToolbarButton97
        Left = 46
        Top = 0
        Width = 23
        Height = 22
        Action = ActAtuSin
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000055000000000000005500000057777777777777705500000057F8
          8888888888705500000057F80008B0B8B8705500000057FB8B808B8B8B705500
          000057F8B008B8B8B8705500000057FB0B8B8B828B705500000057F8B008B822
          28705500000057FB8B8B822222705500000057FFFFFF222722205500000057B8
          B8B8B255522255000000557B8B8B755555222500000055577777555555522200
          0000555555555555555522000000555555555555555555000000}
        Images = ImlPadrao
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnRateio: TToolbarButton97
        Left = 200
        Top = 0
        Width = 23
        Height = 22
        Action = ActRateio
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555500000057000000555700000000000057F8FBF05557F8FBF000000057B8
          BFB05057B8BFB000000057F8FBF05557F8FBF000000057777770555777777000
          000055555555555555555500000057000000000055505500000057BFB7BF7FB0
          55555500000057FBF7FB7BF055505500000057BFB7BF7FB055555500000057FB
          F7FB7BF055505500000057BFB7BF7FB055555500000057FBF7FB7BF050505500
          0000577777777770555555000000555555555555555555000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnPrePronta: TToolbarButton97
        Left = 177
        Top = 0
        Width = 23
        Height = 22
        Action = ActPrePronta
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555000000555057000000000055000000555557BFB7BF7FB0550000005505
          57FBF7FB7BF055000000555557BFB7BF7FB055000000505557FBF7FB7BF05500
          0000555557BFB7BF7FB055000000570007FBF7FB7BF05500000057EFE7777777
          77705500000057FEF7FE7EF055555500000057EFE7EF7FE055505500000057FE
          F7FE7EF055555500000057EFE7EF7FE055055500000057FEF7FE7EF055555500
          0000577777777770505555000000555555555555555555000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnAutomatica: TToolbarButton97
        Left = 223
        Top = 0
        Width = 23
        Height = 22
        Action = ActAutomatico
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555550000005555557000000000050000005555557BFB7BF7FB050000005555
          557FBF7FB7BF050000005555557BFB7BF7FB050000005555557FBF7FB7BF0500
          000055550000FB7BF7FB0500000055070807007FB7BF05000000557888887087
          7777050000005778707800055555550000005788070887055555550000005778
          7078000555555500000055788888705555555500000055770807005555555500
          0000555577775555555555000000555555555555555555000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object ToolbarSep972: TToolbarSep97
        Left = 246
        Top = 0
        SizeHorz = 8
      end
      object tbtnIntegraDia: TToolbarButton97
        Left = 77
        Top = 0
        Width = 23
        Height = 22
        Action = ActIntegracaoDia
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000050000000000000000000000050FF8FF8FF8FF8FF0000000050FF
          8F222F8FF8FF0000000050888222228888880000000050FF2228222FF8FF0000
          000050FF82F8F222F8FF0000000050888888882228880000000050FF8FF8FF82
          22FF0000000050FF8FF8FF8F22FF000000005088888888888888000000005044
          4447777777770000000050444447777777770000000050000000000000000000
          0000555555555555555550000000555555555555555550000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnOrcamento: TToolbarButton97
        Left = 277
        Top = 0
        Width = 23
        Height = 22
        Action = ActOrcamento
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555333333333
          33555331111111111133511188888888811155788F8F6F8888055578F8F666F8
          8805557F8F6F6F6F88055578F8F868688805557FFF86668F88055578F86868F8
          8805557FFF6F6F6F88055578FFF666F888055557FF8F6F8F80555557FFF8F8F8
          F05555557FFFFF8F0555555557F8F8F755555555557777755555}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object ToolbarSep974: TToolbarSep97
        Left = 146
        Top = 0
        SizeHorz = 8
      end
      object tbtnIntegraPlanilha: TToolbarButton97
        Left = 100
        Top = 0
        Width = 23
        Height = 22
        Action = ActIntPlanilha
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000057000000000000000000000057FBFBFB7BFB7BFB0000000057BF
          BFBF7FBF7FBF0000000057FBFB222BFB7BFB0000000057B8B22222B878B80000
          000057FB222B222B7BFB0000000057BFB2BF72227FBF0000000057FBFBFB7B22
          2BFB0000000057B8B8B878B222B80000000057FBFBFB7BFB22FB0000000057BF
          BFBF7FBF7FBF0000000057FBFBFB7BFB7BFB0000000057777777777777770000
          0000555555555555555550000000555555555555555550000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnEncerraPer: TToolbarButton97
        Left = 123
        Top = 0
        Width = 23
        Height = 22
        Action = ActEncerraPer
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000050000000000000000000000050FF8FF8FF8FF8FF0000000050FF
          8FF8FF8FF8FF0000000050888888888888880000000050FF8FF8FF8FF8FF0000
          000050FF8FF8FF8FF8FF0000000050888888888888880000000050FF8FF8FF71
          111F0000000050FF8FF8F8199991700000005088888881999999100000005044
          4447719FFFF91000000050444447719FFFF91000000050000000719999991000
          0000555555555719999170000000555555555551111550000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object ToolbarSep975: TToolbarSep97
        Left = 300
        Top = 0
        SizeHorz = 8
      end
      object tbtnConsultaLanc: TToolbarButton97
        Left = 308
        Top = 0
        Width = 23
        Height = 22
        Action = ActConsultLancamento
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888800000088888887000000000000000088888887BFB7BF7FB00000001888
          8887FBF7FB7BF000000011888887BFB7BF7FB000000011188887FBF7FB7BF000
          000081110000BFB7BF7FB00000008810E8E80BF7FB7BF0000000880E8E8E8077
          7777700000008808E8E8E088888888000000880E8E8E80888888880000008808
          E8E8E08888888800000088808E8E088888888800000088880000888888888800
          0000888888888888888888000000888888888888888888000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnConsultaSaldo: TToolbarButton97
        Left = 331
        Top = 0
        Width = 23
        Height = 22
        Action = ActConsultaSaldo
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888880000008888888888888888880000008888888888888488880000001888
          8888888844488800000011888888888484848800000011188888888884848800
          00008111000088884448880000008810E8E80884848888000000880E8E8E8084
          8484880000008808E8E8E088444888000000880E8E8E80888488880000008808
          E8E8E08888888800000088808E8E088888888800000088880000888888888800
          0000888888888888888888000000888888888888888888000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnAtuMoeda: TToolbarButton97
        Left = 0
        Top = 0
        Width = 23
        Height = 22
        Action = ActAtualizaMoeda
        DisplayMode = dmGlyphOnly
        Caption = '&Atualiza Moeda'
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550000055
          555555000000555008888800555555000000557B8B8B8B8805555500000057B8
          B8B4B8B8805555000000578B8B444B8B8055550000007FB8B4B4B4B8B8055500
          00007F8B8B84848B8805550000007FB8B84448B2B805550000007F8B84848B22
          2805550000007FB8B4B4B22222755500000057FB8B44222B22255500000057F8
          B8B4B2B8B22255000000557FFB8B8B8B75222500000055577FFFFF7755522200
          0000555557777755555522000000555555555555555555000000}
        Images = ImlPadrao
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnContas: TToolbarButton97
        Left = 254
        Top = 0
        Width = 23
        Height = 22
        Action = actContas
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333700007
          3333330000003333337FBFB03003000000003330707BFBF03333330000003337
          337FB77733333300000033303337733333333300000033373333333333333300
          00003330337000073333330000003337337FBFB03003000000003330707BFBF0
          3333330000003337337FB7773333330000003330333773333333330000003337
          3333333333333300000037000073333333333300000037FBFB03003000333300
          000037BFBF03333333333300000037FB77733333333333000000337733333333
          333333000000333333333333333333000000}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
      end
      object tbtnRelBalAnalPP: TToolbarButton97
        Left = 354
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Balancete Analítico Por Plano'
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484
          8484FFFFFFFFFFFF000000848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF848484848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
          FFFF848484848484FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFF
          FFFFFFFFFF000000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000FFFFFF000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF
          848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000FFFFFF848484848484FF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484848484FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFF848484848484FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84
          8484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = tbtnRelBalAnalPPClick
      end
      object tbtnRelRazAnal: TToolbarButton97
        Left = 377
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Razão Analítico'
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484
          8484FFFFFFFFFFFF000000848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF848484848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
          FFFF848484848484FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFF
          FFFFFFFFFF000000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000FFFFFF000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF
          848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000FFFFFF848484848484FF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484848484FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFF848484848484FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84
          8484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = tbtnRelRazAnalClick
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 261
    Top = 79
    inherited pnlTextoFluxOper: TPanel
      Caption = 'pnlTextoFluxOper'
    end
    inherited Panel2: TPanel
      inherited tb97btnCancelar: TToolbarButton97
        Left = 323
      end
    end
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 571
    Width = 1120
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlEmpresa_Padrao'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '310'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        Text = 'Usuario'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '140'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '64'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Style = psCapsLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psNumLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlDateTime'
        Style = psDateTime
        Tag = 0
        Text = '25/07/2018 17:35'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 49
  end
  inherited mnu: TMainMenu
    Left = 89
    Top = 248
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuParametrosClick
        end
        object DiasBloqueadosporMdulo1: TMenuItem [1]
          Caption = '&Dias Bloqueados por Sistema'
          OnClick = DiasBloqueadosporMdulo1Click
        end
      end
      inherited mnuUtilitario: TMenuItem
        object Importar1: TMenuItem
          Caption = '&Importações'
          HelpContext = 10001
          object Lanamentos2: TMenuItem
            Caption = 'Lançamentos'
            HelpContext = 10002
            OnClick = Lanamentos2Click
          end
          object LanamentosModelo21: TMenuItem
            Caption = 'Lançamentos "EXCEL"'
            HelpContext = 10003
            OnClick = LanamentosModelo21Click
          end
          object LanamentosModelo31: TMenuItem
            Caption = 'Lançamentos "Folha RM"'
            Enabled = False
            HelpContext = 10004
            Visible = False
          end
          object mnuValoresOrcados1: TMenuItem
            Caption = '&Valores Orçados "EXCEL"'
            OnClick = mnuValoresOrcados1Click
          end
          object PlanodeContas1: TMenuItem
            Caption = '&Plano de Contas'
            HelpContext = 10006
            OnClick = PlanodeContas1Click
          end
          object SaldoAnterior1: TMenuItem
            Caption = '&Saldo Anterior'
            HelpContext = 10007
            OnClick = SaldoAnterior1Click
          end
          object ContaCorrespondente1: TMenuItem
            Caption = 'Conta Correspondente'
            HelpContext = 10008
            OnClick = ContaCorrespondente1Click
          end
          object Fidlio1: TMenuItem
            Caption = 'Fidélio'
            Enabled = False
            HelpContext = 10010
            Visible = False
          end
          object SAF1: TMenuItem
            Caption = 'SA&F'
            Enabled = False
            HelpContext = 10011
            Visible = False
          end
          object LanamentosFolhaDinamica1: TMenuItem
            Caption = 'Lançamentos "Folha Dinamica"'
            Enabled = False
            HelpContext = 10012
            Visible = False
          end
          object LanamentosSRHPlus1: TMenuItem
            Caption = 'Lançamentos "SRH Plus"'
            Enabled = False
            HelpContext = 10013
            Visible = False
            object Eventos1: TMenuItem
              Caption = '&Cadastro de Eventos'
              Enabled = False
              HelpContext = 10014
              Visible = False
            end
            object Importao1: TMenuItem
              Caption = '&Importação'
              Enabled = False
              HelpContext = 10015
              Visible = False
            end
          end
        end
        object Exportaes1: TMenuItem
          Caption = 'Exportações'
          HelpContext = 10016
          Visible = False
          object ExportaContabil: TMenuItem
            Caption = 'Exportação Contábil'
            OnClick = ExportaContabilClick
          end
          object ExclusodeExportaoContbil1: TMenuItem
            Caption = 'Exclusão de Exportação Contábil'
            OnClick = ExclusodeExportaoContbil1Click
          end
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object VerificaLanamentos1: TMenuItem
          Caption = '&Verifica Lançamentos'
          HelpContext = 10017
          OnClick = VerificaLanamentos1Click
        end
        object AtualizaSaldoAnaltica1: TMenuItem
          Action = ActAtuAnal
        end
        object mnuAtualizaSaldo: TMenuItem
          Action = ActAtuSin
        end
        object AtualizaCdigosReduzidos1: TMenuItem
          Caption = 'Atualiza Códigos &Reduzidos'
          HelpContext = 10020
          OnClick = AtualizaCdigosReduzidos1Click
        end
        object AtualizaSaldodeEncerramentodasContas1: TMenuItem
          Caption = 'Atualiza Saldo de Encerramento das Contas'
          OnClick = AtualizaSaldodeEncerramentodasContas1Click
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object AtualizaNumeraodasPlanilhas1: TMenuItem
          Caption = 'Atualiza Numeração das &Planilhas'
          HelpContext = 10021
          OnClick = AtualizaNumeraodasPlanilhas1Click
        end
        object AtivarNumeraodePlanilhasPorSeqence1: TMenuItem
          Caption = 'Ativar Numeração de Planilhas Por Seqüence'
          HelpContext = 10136
          OnClick = AtivarNumeraodePlanilhasPorSeqence1Click
        end
      end
      object N6: TMenuItem [8]
        Caption = '-'
      end
    end
    object mnuPlanilha: TMenuItem [1]
      Caption = 'P&lanilhas'
      HelpContext = 10023
      object mnuLancamento: TMenuItem
        Action = ActLancamento
      end
      object mnuPrePronta: TMenuItem
        Action = ActPrePronta
      end
      object mnuRateio: TMenuItem
        Action = ActRateio
        Visible = False
      end
      object Automtico1: TMenuItem
        Action = ActAutomatico
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object AlteraodeData1: TMenuItem
        Caption = 'Alteração de &Data'
        HelpContext = 10028
        OnClick = AlteraodeData1Click
      end
      object ExclusodePlanilhasporFaixa1: TMenuItem
        Caption = '&Exclusão de Planilhas por Faixa'
        HelpContext = 10029
        OnClick = ExclusodePlanilhasporFaixa1Click
      end
    end
    object mnuProcessamentos: TMenuItem [2]
      Caption = '&Processamentos'
      HelpContext = 10030
      object mnuAtualizaMoeda: TMenuItem
        Action = ActAtualizaMoeda
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuIntegra: TMenuItem
        Caption = '&Integração'
        HelpContext = 10032
        object Dia1: TMenuItem
          Action = ActIntegracaoDia
        end
        object Planilha1: TMenuItem
          Action = ActIntPlanilha
        end
      end
      object VerificaPlanilhasemPreodosBloqueados1: TMenuItem
        Caption = 'Verifica Planilhas em Períodos Bloqueados'
        HelpContext = 10035
        OnClick = VerificaPlanilhasemPreodosBloqueados1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuApuracaoP: TMenuItem
        Caption = '&Apuração de Resultados do Período'
        HelpContext = 10137
        object mnuIncluiApur: TMenuItem
          Caption = 'Incluir'
          HelpContext = 10138
          OnClick = mnuIncluiApurClick
        end
        object N18: TMenuItem
          Caption = '-'
        end
        object mnuExcluiApur: TMenuItem
          Caption = 'Excluir'
          HelpContext = 10139
          OnClick = mnuExcluiApurClick
        end
      end
      object mnuProcRentabilidadeContabil: TMenuItem
        Caption = 'Rentabilidade Contábil'
        HelpContext = 10121
        OnClick = mnuProcRentabilidadeContabilClick
      end
      object ConsisteRegras1: TMenuItem
        Caption = 'Consiste &Regras'
        HelpContext = 10036
        OnClick = ConsisteRegras1Click
      end
      object mnuEncerraPerodo: TMenuItem
        Action = ActEncerraPer
      end
      object GerararquivoSPCCAP1: TMenuItem
        Caption = '&Gerar arquivo SIPC-CAP'
        HelpContext = 10141
        object SICCAP1: TMenuItem
          Caption = '&SIPC-CAP'
          HelpContext = 10142
          OnClick = SICCAP1Click
        end
        object SICCAPModelo20041: TMenuItem
          Caption = 'SIPC-CAP &Modelo 2004'
          HelpContext = 10143
          OnClick = SICCAPModelo20041Click
        end
        object mnuSIPCCAPModelo2010: TMenuItem
          Caption = 'SICADI'
          OnClick = mnuSIPCCAPModelo2010Click
        end
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object mnuEncerraContasdeResultado: TMenuItem
        Caption = 'Encerra &Contas de Resultado'
        HelpContext = 10038
        OnClick = mnuEncerraContasdeResultadoClick
      end
      object LanamentodaMeiaNoite1: TMenuItem
        Caption = 'Apuração de Resultados do Exercício (Lançamento da Meia-Noite)'
        Enabled = False
        Visible = False
      end
      object mnuEncerraExerccio: TMenuItem
        Caption = '&Encerra Exercício'
        HelpContext = 10039
        OnClick = mnuEncerraExerccioClick
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object GeraSaldoCalculadoporPerodo1: TMenuItem
        Caption = 'Gera &Saldo Calculado por Período'
        HelpContext = 10040
        OnClick = GeraSaldoCalculadoporPerodo1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object RateioporAtividadeProjeto1: TMenuItem
        Caption = 'Rateio por Ati&vidade/Projeto'
        Enabled = False
        HelpContext = 10041
        Visible = False
        object SaldoAnteior1: TMenuItem
          Caption = 'Saldo &Anterior'
          HelpContext = 10042
        end
        object GeraRateioporPerodo1: TMenuItem
          Caption = '&Gera Rateio por Período'
          HelpContext = 10043
        end
        object GeraLanamentosdoRateio1: TMenuItem
          Caption = 'Gera &Lançamentos do Rateio'
          HelpContext = 10044
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object PercentuaisdoRateio1: TMenuItem
          Caption = '&Percentuais do Rateio Administrativo'
          HelpContext = 10045
        end
        object GeraLanamentosdoRateioAdministrativo1: TMenuItem
          Caption = 'Gera Lançamentos do Rateio &Administrativo'
          HelpContext = 10046
        end
      end
      object RateioporPrograma1: TMenuItem
        Caption = 'Rateio por &Programa'
        HelpContext = 10122
        OnClick = RateioporPrograma1Click
      end
      object RateioporPlanoePatrocinadora2: TMenuItem
        Caption = 'Rateio por Plano e Patrocinadora'
        OnClick = RateioporPlanoePatrocinadora2Click
      end
      object SegregaoporPlanoePatrocinadora1: TMenuItem
        Caption = 'Segregação por Plano e Patrocinadora'
        object PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1: TMenuItem
          Caption = 'Percentuais do Rateio Administrativo por Plano e Patrocinadora'
          OnClick = PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1Click
        end
        object GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1: TMenuItem
          Caption = 
            'Gera Lançamentos do Rateio Administrativo por Plano e Patrocinad' +
            'ora'
          OnClick = GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1Click
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object GeraValordaCota1: TMenuItem
          Caption = 'Gera Valor da Cota '
          OnClick = GeraValordaCota1Click
        end
        object GeraosLanamentosdeSegregao1: TMenuItem
          Caption = 'Gera os Lançamentos de Segregação'
          OnClick = GeraosLanamentosdeSegregao1Click
        end
        object CadastrodeSaldodeCotas1: TMenuItem
          Caption = 'Cadastro de Saldo de Cotas'
          OnClick = CadastrodeSaldodeCotas1Click
        end
      end
      object mnuSegregacaoRecursos: TMenuItem
        Caption = 'Segregação de Recursos'
        HelpContext = 10145
        object mnuProcessaSegregao: TMenuItem
          Caption = 'Processa Segregação'
          HelpContext = 10146
          OnClick = mnuProcessaSegregaoClick
        end
        object mnuAjustePlanilhaDiverg: TMenuItem
          Caption = 'Ajuste de Planilhas Divergentes'
          HelpContext = 10147
          OnClick = AjustedePlanilhasDivergentes1Click
        end
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object GeraodeLanamentosdoConsolidado1: TMenuItem
        Caption = 'Geração de Lançamentos do Consolidado'
        Enabled = False
        HelpContext = 10047
        Visible = False
      end
      object DeParadoPlanodecontas1: TMenuItem
        Caption = 'De/Para do Plano de Contas'
        HelpContext = 10048
        object AgrupamentoeDesmembramentodeContas1: TMenuItem
          Caption = 'Agrupamento e Desmembramento de Contas'
          HelpContext = 10049
          OnClick = AgrupamentoeDesmembramentodeContas1Click
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object DeParadeContas1: TMenuItem
          Caption = 'De/Para de Contas Contábeis'
          HelpContext = 10051
          OnClick = DeParadeContas1Click
        end
        object AlterarPlanodeContas1: TMenuItem
          Caption = 'Alterar Plano de Contas'
          HelpContext = 10052
          OnClick = AlterarPlanodeContas1Click
        end
        object TabelasdaContabilidade1: TMenuItem
          Caption = 'Tabelas da Contabilidade'
          HelpContext = 10053
          OnClick = TabelasdaContabilidade1Click
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 10054
      object mnuQualificaodePlanos: TMenuItem
        Caption = '&Qualificação de Planos'
        HelpContext = 10055
        OnClick = mnuQualificaodePlanosClick
      end
      object mnuHistricoPadro: TMenuItem
        Caption = '&Histórico Padrão'
        HelpContext = 10056
        OnClick = mnuHistricoPadroClick
      end
      object mnuSubgrupos: TMenuItem
        Caption = '&Subgrupo de Contas'
        HelpContext = 10057
        OnClick = mnuSubgruposClick
      end
      object PlanodeContasNovo1: TMenuItem
        Action = actContas
      end
      object mnuSubconta: TMenuItem
        Caption = 'Sub&conta/Auxiliar'
        HelpContext = 10059
        OnClick = mnuSubcontaClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuPerodosContbeis: TMenuItem
        Caption = 'Pe&ríodos Contábeis'
        HelpContext = 10060
        OnClick = mnuPerodosContbeisClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuTermosdoDirio: TMenuItem
        Caption = '&Termos do Diário'
        HelpContext = 10061
        OnClick = mnuTermosdoDirioClick
      end
      object mnuCadPlanilhas: TMenuItem
        Caption = 'P&lanilhas'
        HelpContext = 10062
        object mnuCadPrePronta: TMenuItem
          Caption = '&Pré-Pronta'
          HelpContext = 10063
          OnClick = mnuCadPreProntaClick
        end
        object mnuCadRateio: TMenuItem
          Caption = 'Rateio por &Centro de Custo'
          HelpContext = 10064
          Visible = False
          OnClick = mnuCadRateioClick
        end
        object LanamentoAutomtico1: TMenuItem
          Caption = 'Lançamento &Automático'
          HelpContext = 10065
          OnClick = LanamentoAutomtico1Click
        end
        object RateioporPrograma2: TMenuItem
          Caption = 'Rateio por Pro&grama'
          HelpContext = 10131
          OnClick = RateioporPrograma2Click
        end
        object RateioporPlanoePatrocinadora1: TMenuItem
          Caption = '&Rateio por Plano e Patrocinadora'
          OnClick = RateioporPlanoePatrocinadora1Click
        end
      end
      object mnuCadRentabilidadeContabil: TMenuItem
        Caption = 'Tipo de Rentabilidade Contábil'
        HelpContext = 10123
        OnClick = mnuCadRentabilidadeContabilClick
      end
      object mnuRegras: TMenuItem
        Caption = '&Regras de Consistência de Balancetes'
        HelpContext = 10066
        OnClick = mnuRegrasClick
      end
      object MnuSegregaodeRecursos: TMenuItem
        Caption = 'Segregação de Recursos'
        HelpContext = 10132
        object mnuCriterioSegregacao: TMenuItem
          Caption = 'Critério para Segregação'
          HelpContext = 10133
          OnClick = mnuCriterioSegregacaoClick
        end
        object mnuCotacaoCriterio: TMenuItem
          Caption = 'Cotação do Critério'
          HelpContext = 10134
          OnClick = mnuCotacaoCriterioClick
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuSaldoAnterior: TMenuItem
        Caption = 'Saldo &Anterior'
        HelpContext = 10067
        OnClick = mnuSaldoAnteriorClick
      end
      object mnuOramento: TMenuItem
        Action = ActOrcamento
      end
      object MovimentodosExercciosAnteriores1: TMenuItem
        Caption = '&Movimento dos Exercícios Anteriores e Contas Estatísticas'
        HelpContext = 10069
        OnClick = MovimentodosExercciosAnteriores1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuDemontrativo: TMenuItem
        Caption = '&Demonstrativo'
        HelpContext = 10070
        OnClick = mnuDemontrativoClick
      end
      object mnuElementosdoDemonstrativo: TMenuItem
        Caption = '&Elementos do Demonstrativo'
        HelpContext = 10071
        OnClick = mnuElementosdoDemonstrativoClick
      end
      object LinhasdoDemonstrativoColunado1: TMenuItem
        Caption = 'Linhas do Demonstrativo Colunado'
        HelpContext = 10072
        OnClick = LinhasdoDemonstrativoColunado1Click
      end
      object ColunasdoDemonstrativo1: TMenuItem
        Caption = 'Colunas do Demonstrativo'
        HelpContext = 10073
        OnClick = ColunasdoDemonstrativo1Click
      end
      object LayoutsdosDemonstrativos1: TMenuItem
        Caption = 'La&yout'#39's dos Demonstrativos'
        HelpContext = 10074
        OnClick = LayoutsdosDemonstrativos1Click
      end
      object ElementosdoBalanoPatrimonial1: TMenuItem
        Caption = 'Elementos do &Balanço Patrimonial'
        HelpContext = 10075
        OnClick = ElementosdoBalanoPatrimonial1Click
      end
      object FaixadeDatasdoPlanoContbil1: TMenuItem
        Caption = 'Faixa de Datas do Plano Contábil'
        HelpContext = 10135
        OnClick = FaixadeDatasdoPlanoContbil1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited MnuLogdeOperaes_Padrao: TMenuItem
        HelpContext = 10076
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object Lanamentos1: TMenuItem
        Action = ActConsultLancamento
      end
      object Saldos1: TMenuItem
        Action = ActConsultaSaldo
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuFluxoFinanceiro: TMenuItem
        Caption = 'Fluxo Financeiro'
        HelpContext = 10130
        OnClick = mnuFluxoFinanceiroClick
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 18
    Top = 38
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Bitmap = {
      494C01012C003100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF008484
      840000FFFF000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000FFFF00FFFFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF00FFFFFF000000000000000000000000008484840000FF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF008484
      8400FFFFFF00000000000000000000000000000000008484840000FFFF00C6C6
      C600FFFFFF0000FFFF00000000000000000000000000000000008484840000FF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000008484840000FFFF00C6C6
      C600C6C6C60000FFFF008400000000FFFF00C6C6C60000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF008484
      840000FFFF000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000FFFF00FFFFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000084848400C6C6C60000FF
      FF0000FFFF0084000000840000008400000000FFFF00C6C6C60000FFFF00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C60000FFFF000000000000FFFF000000000000FFFF00C6C6C60000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF008484
      8400FFFFFF000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      84008484840084848400848484000000000084848400FFFFFF0000FFFF00C6C6
      C6008400000000FFFF008400000000FFFF008400000000FFFF00C6C6C60000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00C6C6C60000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      00008484840000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF008484
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF0000FFFF00C6C6C60084000000C6C6C60084000000C6C6C60000FFFF00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000000000000000000000000000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00848484000000000000000000000000000000000084848400000000000000
      000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF008484
      8400FFFFFF000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C600C6C6C600840000008400000084000000C6C6C60000FFFF000084000000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00C6C6C60000000000C6C6C60000FFFF00C6C6C60000840000C6C6
      C600848484000000000000000000000000000000000084848400FFFF0000FFFF
      FF00848484008484840084848400848484008484840084848400848484008484
      840084848400000000000000000000000000000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF0084000000C6C6C60084000000C6C6C60000FFFF0000840000008400000084
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C6000000000000000000C6C6C60000FFFF00C6C6C60000840000008400000084
      0000848484000000000000000000000000000000000084848400FFFFFF00FFFF
      000084848400FFFFFF00FFFF000084848400FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C6008400000000FFFF008400000000FFFF000084000000840000008400000084
      0000848484000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00C6C6C60000FFFF00C6C6C6000084000000840000008400000084
      0000848484000000000000000000000000000000000084848400FFFF0000FFFF
      FF0084848400FFFF0000FFFFFF0084848400FFFFFF00FFFF0000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00840000008400000000840000008400000084000000FFFF000084
      0000008400000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00008400000084000000840000848484000084
      0000008400000000000000000000000000000000000084848400FFFFFF00FFFF
      000084848400FFFFFF00FFFF000084848400FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C60000FFFF008400000000FFFF000084000000FFFF00C6C6C60000FF
      FF0000840000008400000000000000000000000000008484840000FFFF00C6C6
      C600C6C6C60000FFFF00C6C6C60000FFFF000084000000000000000000000000
      0000008400000084000000000000000000000000000084848400FFFF0000FFFF
      FF0084848400FFFF0000FFFFFF0084848400FFFFFF00FFFF0000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF008484
      84000084000000840000008400000000000000000000000000008484840000FF
      FF0000FFFF00C6C6C60000FFFF00848484000000000000000000000000000000
      0000008400000084000000840000000000000000000084848400FFFFFF00FFFF
      000084848400FFFFFF00FFFF000084848400FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000084000000840000008400000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000084000000840000008400000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400008484000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000848400008484000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF0000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000840000008400000084000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00008400000084000000840000FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00000000008484840000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF00FFFF
      FF0084848400FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600FFFFFF00C6C6C600FFFFFF0084840000FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000084000000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF0000840000008400000084000000FFFF00FFFFFF0000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF0000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FFFFFF00848400008484000084840000FFFFFF00C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000FFFFFF00FFFF
      FF00008400000084000000840000C6C6C600008400000084000000840000FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF00000000008484840000FFFF00C6C6
      C60000FFFF00008400000084000000840000008400000084000000FFFF00C6C6
      C60084848400C6C6C60000FFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF0084840000FFFFFF0084840000FFFFFF0084840000FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C60000840000FFFFFF00C6C6C600FFFFFF0000840000008400000084
      0000FFFFFF00C6C6C600FFFFFF00FFFFFF000000000084848400FFFFFF0000FF
      FF0000840000008400000084000000FFFF0000840000008400000084000000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C60084840000C6C6C60084840000C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600008400000084
      000000840000C6C6C600C6C6C600C6C6C600000000008484840000FFFF00FFFF
      FF0000FFFF000084000000FFFF00FFFFFF008484840000840000008400000084
      000084848400FFFFFF0000FFFF00FFFFFF00000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF00000000000000
      0000FF00000000000000FF000000FF000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C600848400008484000084840000C6C6C600FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C6000084
      00000084000000840000FFFFFF00FFFFFF000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00008400000084
      00000084000000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      0000FF00000000000000FF000000FF000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C60084840000C6C6C60084840000C6C6C600FFFFFF00C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF000084000000840000FFFFFF00FFFFFF00000000008484840000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60084848400C6C6C60000FFFF000084
      0000008400000084000000FFFF00C6C6C600000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF0084848400FF00
      0000FF000000FF000000FF000000FF000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0084840000FFFFFF0084840000FFFFFF0084840000FFFF
      FF00C6C6C600C6C6C60000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF0000FF
      FF000084000000840000FFFFFF0000FFFF000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00848400008484000084840000FFFFFF00C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000840000008400
      0000840000008400000084000000848484008484840084848400848484008484
      840084848400848484008484840084848400000000008484840000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FFFF00FFFF
      FF0084848400FFFFFF0000FFFF00FFFFFF00000000008484840000FFFF00FFFF
      FF008484840000FFFF00FFFFFF0084848400FFFFFF0000FFFF0084848400FF00
      0000FF000000FF00000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00C6C6C600FFFFFF0084840000FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000084848400FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFFFF0000FF
      FF008484840000FFFF00FFFFFF0000FFFF000000000084848400FFFFFF0000FF
      FF0084848400FFFFFF0000FFFF008484840000FFFF00FFFFFF00000000000000
      0000FF0000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF008484840000FF
      FF0084848400FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF000000840000000000000000000000
      0000000000000000000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFF
      FF008484840000FFFF00FFFFFF00000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000008484
      84000000000084848400FFFFFF0000FFFF008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF000000840000008400000000000000
      000000000000000000008484840000FFFF00FFFFFF0000FFFF008484840000FF
      FF0084848400FFFFFF0000FFFF00000000000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000840000008400000084000000
      0000000000000000000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFF
      FF008484840000FFFF00FFFFFF00000000000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF000000000000008400000084000000
      840000000000000000000000000000FFFF00FFFFFF0000FFFF008484840000FF
      FF0084848400FFFFFF0000FFFF00000000000000000000008400000084000000
      8400000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000008484
      84000000000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C600FFFFFF00FFFFFF000000000000000000000084000000
      000000000000FFFF0000000000000000000000FFFF00FFFFFF0084848400FFFF
      FF008484840000FFFF00FFFFFF00000000000000000000000000000084000000
      000000000000FFFF000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000000000000000000084848400848484008484
      840084848400848484008484840000000000000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000000000000000000000000000840000000000
      0000000000008400000000000000000000000000000000000000000000008484
      84000000000084848400FFFFFF0000FFFF008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00848484000000
      8400000084000000840000008400FFFFFF000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600000084000000
      FF000000FF000000FF000000FF0000008400000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000008484840084848400000084000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000008484840084848400000084000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000084000000
      FF000000FF000000FF000000FF00000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFF
      FF00FFFFFF0000FFFF000000000000000000000000008484840000FFFF00C6C6
      C600C6C6C60000FFFF008400000000FFFF00C6C6C60000FFFF00C6C6C600C6C6
      C60000000000000000000000000000000000000000008484840000FFFF00C6C6
      C600C6C6C60000FFFF008400000000FFFF00C6C6C60000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FF
      FF0000FFFF00FFFFFF0000000000000000000000000084848400C6C6C60000FF
      FF0000FFFF0084000000840000008400000000FFFF00C6C6C60000FFFF00C6C6
      C600000000000000000000000000000000000000000084848400C6C6C60000FF
      FF0000FFFF0084000000840000008400000000FFFF00C6C6C60000FFFF00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C6000000000000000000C6C6C60000FFFF000000000000FFFF00C6C6C60000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF00FFFFFF0000FFFF008484840000FFFF00FFFF
      FF00FFFFFF0000FFFF00000000000000000084848400FFFFFF0000FFFF00C6C6
      C6008400000000FFFF008400000000FFFF008400000000FFFF00C6C6C60000FF
      FF000000000000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C6008400000000FFFF008400000000FFFF008400000000FFFF00C6C6C60000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00C6C6C60000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000FFFF00FFFFFF0084848400FFFFFF0000FF
      FF0000FFFF00FFFFFF00000000000000000084848400FFFFFF00C6C6C60000FF
      FF0000FFFF00C6C6C60084000000C6C6C60084000000C6C6C60000FFFF00C6C6
      C6000000000000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF0000FFFF00C6C6C60084000000C6C6C60084000000C6C6C60000FFFF00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C6000000000000000000C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF008484840000FFFF00FFFF
      FF00FFFFFF0000FFFF00000000000000000084848400FFFFFF0000FFFF00C6C6
      C600C6C6C600840000008400000084000000C6C6C60000FFFF000084000000FF
      FF000000000000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C600C6C6C600840000008400000084000000C6C6C60000FFFF000084000000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000840000C6C6
      C600848484000000000000000000000000000000000000000000000000008484
      8400C6C6C6000000000084848400000000000000000084848400FFFFFF0000FF
      FF0000FFFF00FFFFFF00000000000000000084848400FFFFFF00C6C6C60000FF
      FF0084000000C6C6C60084000000C6C6C60000FFFF0000840000008400000084
      00000000000000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF0084000000C6C6C60084000000C6C6C60000FFFF0000840000008400000084
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C6000000000000000000C6C6C60000FFFF00C6C6C60000840000008400000084
      000084848400000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C6008484840000000000C6C6C600848484008484
      84008484840084848400000000000000000084848400FFFFFF0000FFFF00C6C6
      C6008400000000FFFF008400000000FFFF000084000000840000008400000084
      00008484840000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C6008400000000FFFF008400000000FFFF000084000000840000008400000084
      0000848484000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00C6C6C60000FFFF00C6C6C6000084000000840000008400000084
      000084848400000000000000000000000000000000008484840084848400C6C6
      C6000000000084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00840000008400000000840000008400000084000000FFFF000084
      0000008400000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF00840000008400000000840000008400000084000000FFFF000084
      0000008400000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00008400000084000000840000848484000084
      0000008400000000000000000000000000000000000084848400C6C6C600C6C6
      C6008484840000000000C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C60000FFFF008400000000FFFF000084000000FFFF00C6C6C60000FF
      FF00008400000084000000000000000000000000000084848400FFFFFF00C6C6
      C600C6C6C60000FFFF008400000000FFFF000084000000FFFF00C6C6C60000FF
      FF0000840000008400000000000000000000000000008484840000FFFF00C6C6
      C600C6C6C60000FFFF00C6C6C60000FFFF000084000000000000000000000000
      000000840000008400000000000000000000000000008484840084848400C6C6
      C6000000000084848400C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF008484
      840000840000008400000084000000000000000000000000000084848400FFFF
      FF0000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF008484
      84000084000000840000008400000000000000000000000000008484840000FF
      FF0000FFFF00C6C6C60000FFFF00848484000000000000000000000000000000
      000000840000008400000084000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000084000000840000008400000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000084000000840000008400000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000084000000840000008400000000000000000000848484008484
      8400C6C6C6000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000840000008400000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000000000000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      2900292929004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000039393900FFFFFF00FFFF
      FF00FFFFFF00CECECE00FFFFFF00FFFFFF00F7F7F700E7E7E700F7F7F700FFFF
      FF00FFFFFF003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000031313100DEDEDE00DEDE
      DE00DEDEDE00B5B5B500D6D6D600CECECE00A5A5A500A5ADAD00CECECE00DEDE
      DE00DEDEDE003131310000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000039393900F7F7F700F7F7
      F700F7F7F700C6C6C600F7F7F700EFEFEF007B8C8C005A737300ADB5B500EFEF
      EF00F7F7F7003131310000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000031313100DEDEDE00DEDE
      DE00DEDEDE00B5B5B500D6D6D600DEDEDE00A5B5B5006BA5A5005A8C8C009494
      9400DEDEDE003131310000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000000000000292929006B6B6B006B6B
      6B006B6B6B00636363006B6B6B008C8C8C00D6D6D600A5A5A5007BBDBD004A7B
      7B00A5A5A5001818180000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200737300005A5A00006363
      00006B6B00005A5A00006B6B0000525208006B6B5A009C9C9C007B7B7B007BCE
      CE004A4A4A003131310039393900000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200BDBD000052520000ADAD
      00004A4A00007B7B000084840000393908008C8C8400DEDEDE00F7F7F7009494
      94007BD6D600425A5A0000000000313131000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200ADAD0000292900004A4A
      000052520000313100005A5A00003939080063635A009C9C9C00A5A5A500ADAD
      AD005252520073EFEF00424A4A00212121000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200BDBD00006B6B0000A5A5
      00006363000084840000848400004A4A08008C8C8400DEDEDE00F7F7F700FFFF
      FF00FFFFFF00313131006BADAD00212121000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000005A5A5200B5B50000313100007373
      00004A4A00004A4A000063630000393908007B7B7300C6C6C600D6D6D600DEDE
      DE00DEDEDE0031313100636363005A5A5A000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000005A5A5200BDBD0000525200008C8C
      00005A5A00006B6B00007B7B00004242080084847B00D6D6D600EFEFEF00F7F7
      F700F7F7F7003131310000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000840000008400
      00008400000084000000FFFFFF00840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000005A5A5200B5B50000737300008C8C
      0000737300007B7B0000848400005252080052524A00636363005A5A5A005A5A
      5A005A5A5A004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000005A5A5200ADAD000084847B00DEDE
      D600DEDED600DEDED600B5B5A5003131100063635A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5200B5B50000525200005252
      00005252000052520000525200004A4A08006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031311800292900002929
      0000292900002929000029290000313121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000FFFF00008484
      8400848484000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFF000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000000000008484
      8400848484000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000840000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      8400000000000000000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00840000000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      00000000000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      00000000000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000000000000000
      00000000000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00008400000084000000840000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00008400000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000084000000
      8400000084000000FF0000008400000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000084000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000084000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000084848400008484000000
      0000000000000000000000848400008484000084840000000000000000000000
      0000008484008484840000000000000000008484840084848400848484008484
      8400848484008484840000008400000084000000840000008400000084000000
      8400000084000000FF0000008400000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000000000008484840000FFFF000084
      8400000000000084840000000000000000000000000000848400000000000084
      8400000000008484840000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000084848400FFFFFF00FFFF
      FF000084840000000000FFFFFF00FFFFFF0000FFFF0000000000008484000000
      0000000000008484840000000000000000008484840000848400000000000000
      0000000000000084840000848400008484000000000000000000000000000084
      8400000084000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000000FFFF008484840000FFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      840000000000848484000000000000FFFF008484840000FFFF00008484000000
      0000008484000000000000000000000000000084840000000000008484000000
      0000848484000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000084848400FFFFFF000000
      000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000000
      00000084840084848400000000000000000084848400FFFFFF00FFFFFF000084
      840000000000FFFFFF00FFFFFF0000FFFF000000000000848400000000000000
      0000848484000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF008400000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00000000000084840000000000000000008484840000FFFF00000000000000
      0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000008484000000
      0000848484000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000084848400FFFFFF00FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF0000000000000000000000000084848400000000000000000000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00000000000084
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000008484840000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      0000008484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF00000000000000000084848400FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000000000000000000000000000000000000000000C6C6C6000000
      000000000000C6C6C600000000000000000000FFFF000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000084840000848400008484000000000000FFFF0000FFFF000084
      84000084840000848400000000000000000000000000000000000084840000FF
      FF00000000000084840000000000008484000084840000000000000000000000
      0000008484000084840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000FFFF0000FFFF000084
      84000084840000848400000000000000000000000000000000000084840000FF
      FF0000000000008484000084840000848400FFFFFF000000000000FFFF000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00848484000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      84000084840000848400000000000000000084848400000000000000000000FF
      FF0000FFFF00000000000084840000848400C6C6C60000848400000000000084
      8400FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000000000000000000000000000848400008484000000
      000000848400FFFFFF00FFFFFF0000FFFF0000FFFF00FFFFFF0000FFFF0000FF
      FF00008484000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000848400008484000084
      8400FFFFFF0000FFFF000000000000000000000000000000000000000000C6C6
      C60000FFFF000000000000848400008484000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000FF000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008484
      84000000000000848400000000000000000000848400FFFFFF0000848400FFFF
      FF0000FFFF008484840084848400FFFFFF008484840084848400000000000084
      8400FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      FF000000FF000000000000FF000000FF000000FF000000000000FF000000FF00
      0000FF000000848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000000000000000000000000084840000848400008484000084
      8400FFFFFF008484840084848400FFFFFF00C6C6C60084848400000000008484
      840000FFFF00C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000FF000000FF000000FF000000FF000000FF000000000000FF00
      0000000000000000000000000000000000000000000000000000848484008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000000000000000000000084
      8400FFFFFF00FFFFFF0084848400FFFFFF00848484008484840000000000FFFF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000000000000000000000848400FFFF
      FF0000FFFF0000FFFF0084848400FFFFFF00C6C6C60084848400000000000084
      8400FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000084
      8400008484008484840084848400C6C6C6008484840084848400000000008484
      8400008484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF00000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      84000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF00008484
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF00008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008400840084008400840084008400
      84008400840084008400FF00FF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008400840084008400000000000000
      0000840084008400840084008400000000000000000000000000424200004242
      0000424200004242000042420000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484008484
      8400000000008484000000000000000000000000000000000000FFFF00000000
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000FF00FF008400840000000000FF00FF008400
      8400000000008400840084008400000000000000000042420000008400000084
      000000840000008400000084000042420000FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFF000084840000000000000000000000000000FFFF00000000
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008400840000000000FF00FF008400
      8400000000008400840000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FF000000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000848400000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF008400
      8400000000000000000000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF0084848400848484000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000848400000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000042420000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084840000848400008484
      000000000000FFFF000084840000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000008484000000000000000000000000000000000000FFFF00008484
      0000848400000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0084008400840084008400
      8400840084008400840000000000000000000084000000840000008400000084
      0000FFFFFF0000840000008400000084000042420000FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000848400000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0084008400840084008400
      8400840084008400840000000000000000000000000000840000008400000084
      0000008400000084000000840000424200008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084008400840084008400
      8400840084000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000422163004221630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000FFFF000000000000FFFF000000000000FFFF
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF000000848400FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004221630042216300FFC6C6004263630042216300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      00000000000000848400FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004221
      630042216300FFC6C600FFC6C600846384008421630042636300422163000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000084
      84000084840000848400FFFF000084008400FF00FF00FF00FF00FF00FF00FF00
      FF0000000000FFFF00000000000000000000000000004221630042216300FFC6
      C600FFC6C6008484840084216300842163008421630042636300426363004221
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFF00000084
      840000848400008484000084840084008400FF00FF00FF00FF00000000000000
      0000FFFF00000000000000000000000000004221630000002100FFC6C6008484
      8400842163008421630084216300842163008421630084216300426363004263
      6300422163000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF000084840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000C6C6C6000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00000084
      840000848400008484000000000000FFFF000000000000000000000000000000
      0000848484000000000000000000000000004221630000002100846384008421
      63008421630042FFFF0084216300842163008421630084216300842163004263
      6300426363004221630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      000000848400848484000000000000FFFF000000000000000000000000000000
      0000848484000000000000000000000000004221630084216300842163008421
      6300842163008421630084848400842163008421630084216300842163008421
      63004263630042636300422163000000000000000000000000000000000000FF
      FF000000000000FFFF0000000000000000000084840000FFFF000084840000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000C6C6C6000000
      00000000000000000000000000000000000000000000FFFF0000000000000084
      8400FFFF00000000000000FFFF00000000008484840000000000000000008484
      840084848400848484000000000000000000FF63840084218400842163008421
      6300842163008421630042C6C60042FFFF008421630084216300842163008421
      630084216300426363004263630042216300000000000084840000FFFF000084
      840000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C6000000000000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000FFFF00000084
      84008484840000FFFF0000FFFF00000000000000000000000000000000000000
      00008484840084848400000000000000000000000000FF638400842184008421
      630084216300842163008421630042C6C60042FFFF0000FFFF0000FFFF008463
      630084216300842163004263630084A5A5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FF000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      00008484840000FFFF0000FFFF00000000000000000000000000C6C6C6000000
      0000848484008484840084848400000000000000000000000000FF6384008421
      84008421630084216300842163008421630084216300842163008421630000FF
      FF0084636300842163008421630084A5A5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      84008421840084216300842163008463840084216300842163008421630000FF
      FF00842163008421630084216300842184000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000084848400000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000FF63840084218400842163008463840042C6C60000FFFF0000FFFF008421
      6300842163008421630084218400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63840084218400842163008421630084216300842163008421
      6300842184000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF638400842184008421630084216300842184000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF6384008421840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF07FFFFFE00381C0E01FC003
      F00381C0C00F8003D0038140800F8003F00381C0800F8003B00381C000078003
      F003FFFF000780038003801B000780038003801F00078003801F801B00078003
      801B801F80078003801F801B800380738017801FC001C0F1801F801BE018E1F8
      801F801FF07CFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00380008000F00F8000
      80008000F00F800080008000F00FC00180008000FFF3C00180008000FFF9C001
      80008000801CC001800080008014C001800080008014C001800080008000C001
      800080008001C001800080008003E003800080008017E003800080008017F007
      FFFFFFFFFFFFF80FFFFFFFFFFFFFFC1FFFFFFFFFF81FFFFFFC00FFFFF8148000
      FC00FFFFE01F80007C007FE7E81F80003C003FDBEFFF80001C001FFBE81F8000
      800081E7E8148000CA00CADFE01F8000C500C55BE81F8000DA7FDA67ECFF8000
      C57FC57FEFFF8000DA7FDA7F83FF8000E4FFE4FF83FF8000F1FFF1FF83FF8000
      FFFFFFFFCFFFFF80FFFFFFFFFFFFFFE1F07FF07FFFFFFFFFE01FE01FC003F801
      C00FC00F8003F801800F800F8003F801800F800F8003F801000700078003F801
      000700078003F001000700078003C001000700078003C001000700078003803F
      800780078003803F800380038073803FC001C001C0F1C07FE018E018E1F8C07F
      F07CF07CFFFCF1FFFFFFFFFFFFFFFFFFFFFFFFFF8003FFFF800380038003F3FF
      800380038003F1FF800380038003F8FF800380038003F87F800380038003FC3F
      800380030001F01F800380030002F87F800380030000FC3F800380030000FC1F
      800380030000E00F800380030003F03F800380030003F81F80038003007FF80F
      FFFFFFFF007FFC07FFFFFFFF80FFFFFFFFFFFFFFFFFFFC00FFFFF9FF000CFC00
      FFFFF9FF0008FC00FFFFF3C70001FC00FFFF73C70063E000FFF727FF00C3E000
      C1F707C701EBE000C3FB00C7016BE007C7FB01E300238007CBFB03F100678007
      DCF70638000F8007FF0F0E38000F801FFFFF1E38000F801FFFFF3F01005F801F
      FFFF7F83003F801FFFFFFFFF007FFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00
      FE00F6CFEFFD8000FE00F6B7C7FF0000FE00F6B7C3FB00008000F8B7E3F70000
      8000FE8FF1E700018000FE3FF8CF00038000FF7FFC1F00038001FE3FFE3F0003
      8003FEBFFC1F00038007FC9FF8CF0FC3807FFDDFE1E7000380FFFDDFC3F38007
      81FFFDDFC7FDF87FFFFFFFFFFFFFFFFFFEFFFFF7FFFFFFFFBC3DFFF30001FFFF
      8001FC010005FE008001FC000005FE00BFF900000005FE009C71000100058000
      80297FF300058000801938E30005800000081053000580008001003300058001
      8001201300058003800140030003800780010003FF07807FCC330003FF8F80FF
      BEFD0003FF8F81FFFEFFFFFFFFDFFFFFFFFFFFFF800FFFFFFFFFF83F8007FE3F
      83E090108003C22383E0E00F8001C00183E0C0078001C0018360800380010000
      EE3B800380010000EC1B8003DFE10000E0038003C0010000FC1F8003C0710000
      FE3FC007C089C001FF7FE00FF713C001FC1FB018FA23E003FC1FF83FFC43FC1F
      FC1FFFFFFE8FFE3FFC1FFFFFFE3FFFFFEA8FFFFFFFFFFF1FD505BFCFFF9FFC0F
      AA829FCFFE1FF00F01008F03F81FE00FF8018601E00FE007F3818400E00FF007
      F3818C00C007C003C1919C008007C0018081BE010003C0000001FF030001E001
      0081FF870000E0078181FF030001F003F181FE010007F001F5C1FE01801FF803
      FDE1FF03C1FFFC0FFC03FF87FFFFFE3FFFFFFFFFE007E1FFFE7FFFFFE007C0FF
      F83FFFFFE08F807FE01FFFFFF03F8001800FFFC3F91F00230007FF81F04F0047
      0003EB00F18F008300018002E04F000100000002E1A780E180000000E00F80C0
      C000FF81E19FC0F1E000FFC3E05FE081F001FFFFE0BFF0E1F807FFFFE01FF801
      FC1FFFFFF03FFC03FE7FFFFFFFFFFE1F00000000000000000000000000000000
      000000000000}
  end
  inherited AclPadrao: TActionList
    Left = 136
    Top = 264
    object ActAtualizaMoeda: TAction
      Caption = 'Atualiza Moedas'
      Enabled = False
      Hint = 'Atualiza Moeda'
      ImageIndex = 28
      OnExecute = mnuAtualizaMoedaClick
    end
    object ActAtuAnal: TAction
      Caption = 'Atualiza Saldo das Contas &Analíticas'
      Hint = 'Atualiza Saldo das Contas Analíticas'
      ImageIndex = 43
      OnExecute = AtualizaSaldoAnaltica1Click
    end
    object ActAtuSin: TAction
      Caption = 'Atualiza Saldo das Contas &Sintéticas'
      Hint = 'Atualiza Saldo das Contas Sintéticas'
      ImageIndex = 30
      OnExecute = mnuAtualizaSaldoClick
    end
    object ActIntegracaoDia: TAction
      Caption = 'Integração por &Dia'
      Hint = 'Integração por Dia'
      ImageIndex = 36
      OnExecute = Dia1Click
    end
    object ActIntPlanilha: TAction
      Caption = 'Integração por &Planilhas'
      Hint = 'Integração por Planilhas'
      ImageIndex = 37
      OnExecute = Planilha1Click
    end
    object ActEncerraPer: TAction
      Caption = 'Encerra &Período'
      Hint = 'Encerra Período'
      ImageIndex = 35
      OnExecute = mnuEncerraPerodoClick
    end
    object ActLancamento: TAction
      Caption = '&Lançamento'
      Hint = 'Lançamentos'
      ImageIndex = 38
      OnExecute = mnuLancamentoClick
    end
    object ActPrePronta: TAction
      Caption = 'Pré Pronta'
      Hint = 'Planilhas pré Prontas'
      ImageIndex = 40
      OnExecute = mnuPreProntaClick
    end
    object ActRateio: TAction
      Caption = 'Rateio'
      Hint = 'Planilhas de Rateio'
      ImageIndex = 41
      OnExecute = mnuRateioClick
    end
    object ActAutomatico: TAction
      Caption = 'Automático'
      Hint = 'Planilhas Automáticas'
      ImageIndex = 31
      OnExecute = Automtico1Click
    end
    object actContas: TAction
      Caption = '&Plano de Contas'
      Hint = 'Cadastro de Plano de Contas'
      ImageIndex = 34
      OnExecute = PlanodeContasNovo1Click
    end
    object ActOrcamento: TAction
      Caption = '&Orçamento'
      Hint = 'Cadastro de Orçamento'
      ImageIndex = 39
      OnExecute = mnuOramentoClick
    end
    object ActConsultLancamento: TAction
      Caption = '&Lançamentos'
      Hint = 'Consulta de Lançamentos'
      ImageIndex = 32
      OnExecute = Lanamentos1Click
    end
    object ActConsultaSaldo: TAction
      Caption = '&Saldos'
      Hint = 'Consulta de Saldos'
      ImageIndex = 33
      OnExecute = Saldos1Click
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 560
    Top = 56
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{5E31C11E-B870-43DC-B52B-42C479D88582}'
    ServerName = 'CMContabSvr50.DtmContabSvr50'
    Left = 344
    Top = 256
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{5E31C11E-B870-43DC-B52B-42C479D88582}'
    ServerName = 'CMContabSvr50.DtmContabSvr50'
    Left = 296
    Top = 256
  end
  inherited Web: TWebConnection
    ServerGUID = '{5E31C11E-B870-43DC-B52B-42C479D88582}'
    ServerName = 'CMContabSvr50.DtmContabSvr50'
    Left = 400
    Top = 256
  end
  inherited CorreioCM: TCorreioCM
    Left = 85
    Top = 317
  end
  inherited ResourceManager: TCMResourceManager
    Top = 176
  end
end
