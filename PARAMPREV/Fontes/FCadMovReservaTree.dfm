inherited frmCadMovReservaTree: TfrmCadMovReservaTree
  Left = -4
  Top = -4
  HelpContext = 160124
  Caption = 'Cadastro de Padrão de Movimentação de Reservas'
  ClientHeight = 746
  ClientWidth = 1028
  Position = poDesigned
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1028
    Height = 707
    Font.Height = -11
    Font.Style = []
    ParentFont = False
    object Splitter1: TSplitter
      Left = 201
      Top = 1
      Width = 6
      Height = 705
      Cursor = crHSplit
    end
    object pnlgrid: TPanel
      Left = 207
      Top = 1
      Width = 820
      Height = 705
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object wwDBGrid1: TwwDBGrid
        Left = 2
        Top = 36
        Width = 816
        Height = 667
        Selected.Strings = (
          'SEQMOV'#9'1'#9'Sequência'
          'RESERVAORIG'#9'25'#9'Reserva Origem'
          'RESERVADEST'#9'25'#9'Reserva Destino'
          'NOMEREGRA'#9'25'#9'Regra de Validação'
          'REGRACALC'#9'25'#9'Regra de Cálculo'
          'PATROORIG'#9'25'#9'Patrocindora Origem'
          'PLANOORIG'#9'25'#9'Plano Origem'
          'PATRODEST'#9'25'#9'Patrocinadora Destino'
          'PLANODEST'#9'25'#9'Plano Destino')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Dock972: TDock97
        Left = 2
        Top = 2
        Width = 816
        Height = 34
        AllowDrag = False
        Background.Data = {
          760F0000424D760F0000000000007600000028000000800000003C0000000100
          040000000000000F000000000000000000001000000000000000000000008080
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777777171717777777777777177771777777777777777077F7FF7FFFF7
          77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
          777777777771717717777777777777777717777777777777777777777FFFFF7F
          7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
          77777777777777171777777777777777717777777777777777777777777FF7FF
          7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
          7777777777771771777777777777777771777777777777777777777777777FFF
          FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
          777777777777771777777777777777777777777777777777777777777777777F
          F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
          7777777777777777777777777777777777777777777777777777777777777771
          77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
          7777777777777177777777777777777777777777777777777777777777777777
          777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
          7777777777777777771777777777777777777777777777777777777777777777
          7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
          7777777777777717771777777777777777777777777777777777777777777777
          77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
          7777777777777771777777777777777777777777777777777777777777777777
          777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
          7777777777777777777777777777777777777777777777777777777777777777
          777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
          7777777777777777177777777777777777777777777777777777777777777777
          7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
          7777777777777777717777777777777777777777777777777777777777777777
          7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
          7777777777777777777771777777777777777777777777777777777777777777
          7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
          F7F7777777777777771777777777177777777777777777777777777777777777
          77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
          777F7F7777777777777177177771717777777777777777777777777777777777
          77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
          77777F7F77777777777717771777777777777777777777777777777777777777
          777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
          1777777777777777777771717717777177777777777777777777777777777777
          777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
          7777777777771777777777177771777777777777777777777777777777777777
          77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
          7777777777777777777771777777777777777777777777777777777777777777
          777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
          7777777777171777777717777777777777777777777777777777777777777777
          77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
          7777777777777177777771777777777777777777777777777777777777777777
          777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
          7777777777777777777771177777777777777777777777777777777777777777
          7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
          7777777777777777777771717777777777777777777777777777777777777777
          777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
          7777777777777777777777171777777777777777777777777777777777777777
          71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
          7777777777777777777777177777777777777777777777777777777777777717
          77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
          77777777777777777777777777777777777F7777777777777777777777777171
          7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
          771777777777777777777777777777777177F777777777777777777777777717
          171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
          7777777777777777777777777777777777777F77777777777777777777777777
          77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
          7177777177777777777777777777777777777FF7F77771777777777777777777
          1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
          7777777717777777777777777777777777777777777777777777777777777777
          717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
          7177777777777777777777777777777777771777777777777777777777777777
          77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
          777777F777777777777777777777777777777777717177717777777777777777
          77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
          171777F7F7777777777777177777777777777777777777777777777777777777
          777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
          7777777F77777777777777777777777777777777777777777777777777777777
          77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
          7717777F77777777777777717177777777777777777777777777777777777777
          7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
          777777777F777777777777777717777777777777777777777777777777777777
          777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
          7777777777777777777777771777777777777777777777777777777777777777
          77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
          7777777777777777777777777717177777777771777777777777777777777777
          7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
          7777777777777177777777777777777777777717177777777777777777777777
          77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
          7777777777717777777777777717177777777777777777777777777777777777
          777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
          777777777717171717777777777777777777777771777777777F777777777777
          777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
          77777777171777777777777777777777777777777777777777F7F77777777777
          77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
          7777777777171777777777777777777777777777777777777777777777777777
          777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
          7777777717177777777777777777777777777777777777777777777777777777
          77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
          7777777777171777777777777777777777777777777777777777777777777777
          7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
          77777777777777777F7F77777717777777777777777777777777777771777777
          7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
          77777777777777777F7F7F777777777777777777777777777777771777777777
          77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
          777777777777777777FFF77F7777717777777777777777777777777777177777
          77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
          77F7777777777777777777F77777777777777777777777777777777777777777
          77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
          F77777777777777777777777F7F7777777777777777777777777777777777777
          777777777717777777777777777777777777717777777777777F7F7F7F77F77F
          77F77777777F77777717777777F7777777777777777777777777777777777777
          77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
          7F77F77777777F77777717777777777777777777777777777777777777777777
          7777777777771777777777777777777777777777777777777F77F7F7F777F777
          F77F777777777777771771777777771777777777777777777777777777777777
          777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
          F7F7777777777777777717171777777777777777777777777777777777777777
          77777777777771777777777777777177777777777771777777777777F777F777
          7777777777777777777171717177771777777777777777777777777777777777
          77777777777777777777777777777777777777777777777777777F7F7F7F7777
          F77F77F777777777777771771717177777777777777777777777777777777777
          7777777777777777777777777777777777777777777177777777}
        BoundLines = [blTop, blBottom]
        object Toolbar971: TToolbar97
          Left = 0
          Top = 0
          Caption = 'Toolbar971'
          CloseButton = False
          DefaultDock = Dock972
          DockPos = 0
          TabOrder = 0
          object sbtnInserir: TToolbarButton97
            Left = 0
            Top = 0
            Width = 43
            Height = 28
            Hint = 'Inserir'
            AllowAllUp = True
            GroupIndex = 1
            DropdownArrow = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            Layout = blGlyphTop
            NumGlyphs = 2
            Opaque = False
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sbtnInserirClick
          end
          object sbtnAlterar: TToolbarButton97
            Left = 43
            Top = 0
            Width = 43
            Height = 28
            Hint = 'Alterar'
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            Layout = blGlyphTop
            NumGlyphs = 2
            Opaque = False
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sbtnAlterarClick
          end
          object sbtnApagar: TToolbarButton97
            Left = 86
            Top = 0
            Width = 43
            Height = 28
            Hint = 'Excluir'
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            Layout = blGlyphTop
            NumGlyphs = 2
            Opaque = False
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sbtnApagarClick
          end
        end
      end
    end
    object pnlop: TPanel
      Left = 207
      Top = 1
      Width = 820
      Height = 705
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object pnlBotoesMovReserva: TPanel
        Left = 745
        Top = 1
        Width = 74
        Height = 703
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object bbtnOkDet: TBitBtn
          Left = 2
          Top = 147
          Width = 72
          Height = 27
          Caption = '&OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bbtnOkDetClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303FF030303030303030303
            03030303030303040403030303030303030303030303030303F8F8FF03030303
            03030303030303030303040202040303030303030303030303030303F80303F8
            FF030303030303030303030303040202020204030303030303030303030303F8
            03030303F8FF0303030303030303030304020202020202040303030303030303
            0303F8030303030303F8FF030303030303030304020202FA0202020204030303
            0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
            040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
            03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
            FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
            0303030303030303030303FA0202020403030303030303030303030303F8FF03
            03F8FF03030303030303030303030303FA020202040303030303030303030303
            0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
            03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
            030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
            0202040303030303030303030303030303F8FF03F8FF03030303030303030303
            03030303FA0202030303030303030303030303030303F8FFF803030303030303
            030303030303030303FA0303030303030303030303030303030303F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnCancelarDet: TBitBtn
          Left = 2
          Top = 179
          Width = 72
          Height = 27
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bbtnCancelarDetClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303F8F80303030303030303030303030303030303FF03030303030303030303
            0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
            03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
            030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
            FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
            030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
            F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
            010101F8030303030303030303F8FF030303030303FFF8030303030303030303
            030101010101F80303030303030303030303F8FF0303030303F8030303030303
            0303030303F901010101F8030303030303030303030303F8FF030303F8030303
            0303030303030303F90101010101F8030303030303030303030303F803030303
            F8FF030303030303030303F9010101F8010101F803030303030303030303F803
            03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
            03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
            03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
            0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
            030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
            03030303030303030303030303030303030303030303030303F8F8F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          Spacing = 0
        end
      end
      object pgctrlMovReserva: TPageControl
        Left = 1
        Top = 1
        Width = 744
        Height = 703
        ActivePage = tbsInfPrincipais
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object tbsInfPrincipais: TTabSheet
          Caption = 'Informações Principais'
          object GroupBox1: TGroupBox
            Left = 2
            Top = 18
            Width = 495
            Height = 154
            Caption = ' Informe os Dados da Transferência '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label3: TLabel
              Left = 12
              Top = 20
              Width = 141
              Height = 13
              Caption = 'Patrocinadora de Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 12
              Top = 66
              Width = 179
              Height = 13
              Caption = 'Plano Previdenciário de Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 12
              Top = 111
              Width = 109
              Height = 13
              Caption = 'Reserva de Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 254
              Top = 20
              Width = 145
              Height = 13
              Caption = 'Patrocinadora de Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 254
              Top = 66
              Width = 183
              Height = 13
              Caption = 'Plano Previdenciário de Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 254
              Top = 111
              Width = 113
              Height = 13
              Caption = 'Reserva de Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cmbpatroorig: TwwDBLookupCombo
              Left = 12
              Top = 35
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Patrocinadora')
              LookupTable = qrypatroorig
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = cmbpatroorigCloseUp
            end
            object cmbplanoorig: TwwDBLookupCombo
              Left = 12
              Top = 80
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano')
              LookupTable = qryplanoorig
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = cmbplanoorigCloseUp
            end
            object cmbreservaorig: TwwDBLookupCombo
              Left = 12
              Top = 126
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Reserva')
              LookupTable = qryreservaorig
              LookupField = 'IDTIPORESERVA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbpatrodest: TwwDBLookupCombo
              Left = 254
              Top = 35
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Patrocinadora')
              LookupTable = qrypatrodest
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = cmbpatrodestCloseUp
            end
            object cmbplanodest: TwwDBLookupCombo
              Left = 254
              Top = 80
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano')
              LookupTable = qryplanodest
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = cmbplanodestCloseUp
            end
            object cmbreservadest: TwwDBLookupCombo
              Left = 254
              Top = 126
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Reserva')
              LookupTable = qryreservadest
              LookupField = 'IDTIPORESERVA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object GroupBox2: TGroupBox
            Left = 2
            Top = 177
            Width = 495
            Height = 142
            Caption = 'Informe os Parâmetros para Transferência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label9: TLabel
              Left = 5
              Top = 19
              Width = 103
              Height = 13
              Caption = 'Regra de Cálculo '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 250
              Top = 19
              Width = 217
              Height = 13
              Caption = 'Regra de Validação da Movimentação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 5
              Top = 61
              Width = 101
              Height = 13
              Caption = 'Ordem de Cálculo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 250
              Top = 61
              Width = 207
              Height = 13
              Caption = 'Regra de Valor a Abater da Reserva'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 250
              Top = 102
              Width = 153
              Height = 13
              Caption = 'Regra de Valor de Retorno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cmbregra: TwwDBLookupCombo
              Left = 5
              Top = 34
              Width = 240
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              LookupTable = qryregra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbregraval: TwwDBLookupCombo
              Left = 250
              Top = 34
              Width = 240
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              LookupTable = qryregraval
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbredseqnum: TRealEdit
              Left = 5
              Top = 75
              Width = 107
              Height = 21
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0')
              ParentFont = False
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fFixed
              Signal = False
            end
            object chkContabiliza: TCheckBox
              Left = 6
              Top = 102
              Width = 199
              Height = 17
              Caption = 'Contabilizar Transferência'
              TabOrder = 3
              OnClick = chkContabilizaClick
            end
            object cmbregrazera: TwwDBLookupCombo
              Left = 250
              Top = 75
              Width = 240
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              LookupTable = qryRegraZera
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkpcmbRegraRetorno: TwwDBLookupCombo
              Left = 250
              Top = 116
              Width = 240
              Height = 21
              Hint = 
                'Regra que calcula o valor a voltar para a reserva caso o benefíc' +
                'io seja encerrado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              LookupTable = qryRegraRetorno
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object tbsContabiliza: TTabSheet
          Caption = 'Informações para Contabilização'
          ImageIndex = 1
          object grpDebContab: TGroupBox
            Left = 0
            Top = 2
            Width = 250
            Height = 101
            Caption = 'Conta para Débito - Origem'
            TabOrder = 0
            object spdContaContabilD: TSpeedButton
              Left = 222
              Top = 27
              Width = 24
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaContabilDClick
            end
            object lblPlaContaD: TLabel
              Left = 4
              Top = 15
              Width = 127
              Height = 13
              Caption = 'Conta Contábil - Folha'
            end
            object edContaContabilD: TMaskEdit
              Left = 4
              Top = 28
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edContaContabilDExit
            end
            object GroupBox4: TGroupBox
              Left = 4
              Top = 52
              Width = 242
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 1
              object lbDescricaoContaD: TLabel
                Left = 6
                Top = 17
                Width = 230
                Height = 13
                AutoSize = False
                Caption = 'lblDescricaoConta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object grpCreContab: TGroupBox
            Left = 253
            Top = 2
            Width = 250
            Height = 101
            Caption = 'Conta para Crédito - Origem'
            TabOrder = 1
            object spdContaContabilC: TSpeedButton
              Left = 223
              Top = 29
              Width = 24
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaContabilCClick
            end
            object lbConta1: TLabel
              Left = 5
              Top = 16
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object edContaContabilC: TMaskEdit
              Left = 5
              Top = 30
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edContaContabilCExit
            end
            object grbGrConta1: TGroupBox
              Left = 4
              Top = 54
              Width = 242
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 1
              object lbDescricaoContaC: TLabel
                Left = 6
                Top = 17
                Width = 229
                Height = 13
                AutoSize = False
                Caption = 'lbDescricaoContaC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object treeContaContabilD: TCMTreeView
            Left = 403
            Top = 212
            Width = 138
            Height = 36
            PodeNavegar = True
            DataSource = dsContaContabilD
            CampoChave = qryContaContabilDPLACONTA
            CampoDescricao = qryContaContabilDPLANOME
            CampoTipo = qryContaContabilDPLATIPO
            OnDblClick = treeContaContabilDDblClick
            OnExit = treeContaContabilDExit
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Visible = False
          end
          object treeContaContabilC: TCMTreeView
            Left = 392
            Top = 206
            Width = 138
            Height = 36
            PodeNavegar = True
            DataSource = dsContaContabilC
            CampoChave = qryContaContabilCPLACONTA
            CampoDescricao = qryContaContabilCPLANOME
            CampoTipo = qryContaContabilCPLATIPO
            OnDblClick = treeContaContabilCDblClick
            OnExit = treeContaContabilCExit
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Visible = False
          end
          object GroupBox5: TGroupBox
            Left = 0
            Top = 226
            Width = 250
            Height = 46
            Caption = 'Centro de Custo para Débito'
            TabOrder = 4
            object cmbCCustoD: TwwDBLookupCombo
              Left = 7
              Top = 18
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Centro de Custo'#9'F'
                'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
              LookupTable = qryCCustoD
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Enabled = False
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox7: TGroupBox
            Left = 0
            Top = 273
            Width = 250
            Height = 46
            Caption = 'Subconta'
            TabOrder = 6
            object dblkSubconta: TwwDBLookupCombo
              Left = 7
              Top = 18
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'SubConta'#9'F')
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object GroupBox8: TGroupBox
            Left = 253
            Top = 273
            Width = 250
            Height = 46
            Caption = 'Atividade / Projeto'
            TabOrder = 7
            object lkcmbDescAtividade: TwwDBLookupCombo
              Left = 7
              Top = 18
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNECODIGO'#9'10'#9'UNECODIGO'#9'F')
              LookupTable = qryAtividade
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object grpDebContabDest: TGroupBox
            Left = 0
            Top = 104
            Width = 250
            Height = 101
            Caption = 'Conta para Débito - Destino'
            TabOrder = 2
            object spdContaContabilDDest: TSpeedButton
              Left = 222
              Top = 27
              Width = 24
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaContabilDDestClick
            end
            object lblPlaContaDDest: TLabel
              Left = 4
              Top = 15
              Width = 127
              Height = 13
              Caption = 'Conta Contábil - Folha'
            end
            object edContaContabilDDest: TMaskEdit
              Left = 4
              Top = 28
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edContaContabilDDestExit
            end
            object GroupBox9: TGroupBox
              Left = 4
              Top = 52
              Width = 242
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 1
              object lbDescricaoContaDDest: TLabel
                Left = 6
                Top = 17
                Width = 230
                Height = 13
                AutoSize = False
                Caption = 'lblDescricaoConta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object grpCreContabDest: TGroupBox
            Left = 253
            Top = 104
            Width = 250
            Height = 101
            Caption = 'Conta para Crédito - Destino'
            TabOrder = 3
            object spdContaContabilCDest: TSpeedButton
              Left = 223
              Top = 29
              Width = 24
              Height = 23
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaContabilCDestClick
            end
            object lbConta1Dest: TLabel
              Left = 5
              Top = 16
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object edContaContabilCDest: TMaskEdit
              Left = 5
              Top = 30
              Width = 218
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edContaContabilCDestExit
            end
            object grbGrConta1Dest: TGroupBox
              Left = 4
              Top = 54
              Width = 242
              Height = 39
              Caption = 'Descrição da Conta'
              TabOrder = 1
              object lbDescricaoContaCDest: TLabel
                Left = 6
                Top = 17
                Width = 229
                Height = 13
                AutoSize = False
                Caption = 'lbDescricaoContaC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object treeContaContabilDDest: TCMTreeView
            Left = 397
            Top = 209
            Width = 138
            Height = 36
            PodeNavegar = True
            DataSource = dsContaContabilDDest
            CampoChave = qryContaContabilDDestPLACONTA
            CampoDescricao = qryContaContabilDDestPLANOME
            CampoTipo = qryContaContabilDDestPLATIPO
            OnDblClick = treeContaContabilDDestDblClick
            OnExit = treeContaContabilDDestExit
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Visible = False
          end
          object treeContaContabilCDest: TCMTreeView
            Left = 400
            Top = 215
            Width = 138
            Height = 36
            PodeNavegar = True
            DataSource = dsContaContabilCDest
            CampoChave = qryContaContabilCDestPLACONTA
            CampoDescricao = qryContaContabilCDestPLANOME
            CampoTipo = qryContaContabilCDestPLATIPO
            OnDblClick = treeContaContabilCDestDblClick
            OnExit = treeContaContabilCDestExit
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Visible = False
          end
          object GroupBox6: TGroupBox
            Left = 253
            Top = 226
            Width = 250
            Height = 46
            Caption = 'Centro de Custo para Crédito'
            TabOrder = 5
            object cmbCCustoC: TwwDBLookupCombo
              Left = 7
              Top = 18
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Centro de Custo'#9'F'
                'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
              LookupTable = qryCCustoC
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Enabled = False
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
    end
    object pnlevento: TPanel
      Left = 1
      Top = 1
      Width = 200
      Height = 705
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 196
        Height = 23
        Align = alTop
        Alignment = taCenter
        Caption = 'Evento/Benefício'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object trvEventosBenef: TTreeView
        Left = 2
        Top = 25
        Width = 196
        Height = 678
        Align = alClient
        HideSelection = False
        Images = ImageList1
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnChange = trvEventosBenefChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 707
    Width = 1028
    inherited tb97Fundo: TToolbar97
      Left = 567
      DockPos = 567
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 398
      DockPos = 398
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
    Top = 0
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EVENTOGERADOR.NOME EVENTO,'
      '                BENEFICIO.NOME BENEF,'
      '                PATROORIG.NOME PATROORIG,'
      '                PLANOORIG.NOME PLANOORIG,'
      '                RESERVAORIG.NOME RESERVAORIG,'
      '                PATRODEST.NOME PATRODEST,'
      '                PLANODEST.NOME PLANODEST,'
      '                RESERVADEST.NOME RESERVADEST,'
      '                REGRA.NOMEREGRA REGRACALC,'
      '                REGRAVAL.NOMEREGRA,'
      '                SEQMOV,IDMOVIMENTO,'
      
        '                BENEFICIO.IDBENEFICIO, EVENTOGERADOR.IDEVENTOGER' +
        'ADOR,'
      '                REGRA.IDREGRA, IDPATROORIG,'
      
        '                IDPATRODEST, IDTIPORESERVAORIG, IDTIPORESERVADES' +
        'T,'
      
        '                IDPLANOPREVORIG, IDPLANOPREVDEST, IDREGRAVALIDAC' +
        'AO,'
      '                IDREGRAZERAVALOR,'
      '                MOV.FLGCONTABILIZA,'
      '                MOV.PLANO,'
      '                MOV.PLACONTAC,'
      '                MOV.PLACONTAD,'
      '                MOV.CODCENTROCUSTOC,'
      '                MOV.CODCENTROCUSTOD,'
      '                MOV.UNIDNEGOC,'
      '                MOV.CODSUBCONTA,'
      '                MOV.IDREGRARETORNO'
      
        'FROM BENEFICIO,EVENTOGERADOR,PLANPREV PLANOORIG,PLANPREV PLANODE' +
        'ST,PESSOA PATROORIG,'
      
        '     PESSOA PATRODEST,RESERVAXPLANO RESERVAORIG,RESERVAXPLANO RE' +
        'SERVADEST,REGRA,'
      '     MOVRESERVA MOV,REGRA REGRAVAL'
      'WHERE MOV.IDBENEFICIO = BENEFICIO.IDBENEFICIO(+)'
      'AND MOV.IDEVENTOGERADOR = EVENTOGERADOR.IDEVENTOGERADOR'
      'AND MOV.IDPLANOPREVORIG = PLANOORIG.IDPLANOPREV(+)'
      'AND MOV.IDPLANOPREVDEST = PLANODEST.IDPLANOPREV(+)'
      'AND MOV.IDPATROORIG = PATROORIG.IDPESSOA(+)'
      'AND MOV.IDPATRODEST = PATRODEST.IDPESSOA(+)'
      'AND MOV.IDTIPORESERVAORIG = RESERVAORIG.IDTIPORESERVA(+)'
      'AND MOV.IDTIPORESERVADEST = RESERVADEST.IDTIPORESERVA(+)'
      'AND MOV.IDREGRA = REGRA.IDREGRA(+)'
      'AND MOV.IDREGRAVALIDACAO = REGRAVAL.IDREGRA(+)'
      'AND MOV.IDPLANOPREVDEST = RESERVADEST.IDPLANOPREV(+)'
      'AND MOV.IDPLANOPREVORIG = RESERVAORIG.IDPLANOPREV(+)'
      'AND MOV.IDEVENTOGERADOR = :EVENTO'
      'AND MOV.IDBENEFICIO(+) = :BENEFICIO'
      'ORDER BY SEQMOV'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 8
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'EVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryevento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT NOME, IDEVENTOGERADOR FROM EVENTOGERADOR')
    ValidateWithMask = True
    Left = 96
    Top = 48
  end
  object qrybeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 96
    Top = 32
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 40
    Top = 32
  end
  object ImageList1: TImageList
    Left = 984
    Top = 48
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000840000008400
      0000FFFFFF0084000000FFFFFF00000000008484840000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000840000008400
      00008400000084000000FFFFFF00000000008484840000000000000000000000
      0000848484000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000FFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000FFFFFF00000000008484840000000000000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF000000000000FFFF0000000000FFFFFF0000000000FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000840000008400
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008007FFFF000000008007FFFF00000000
      8007C00700000000800780030000000080078003000000008007800100000000
      800780700000000080078078000000008002806C000000008000804C00000000
      8000808300000000FC00818700000000FE0083CF00000000FF0283DF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object qrypatroorig: TwwQuery
    AfterScroll = qrypatroorigAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  NOME , PESSOA.IDPESSOA '
      'FROM  PESSOA, PATRO, BENEFPLANPATRO B'
      'WHERE PATRO.IDPESSOA = PESSOA.IDPESSOA'
      'AND B.IDPESSJUR(+) = PESSOA.IDPESSOA '
      'AND B.IDBENEFICIO(+) = :IDBENEFICIO'
      'ORDER BY NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryplanoorig: TwwQuery
    AfterScroll = qryplanoorigAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM   PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE  PLP.IDPESSJUR  = :IDPESSJUR'
      'AND    PL.IDPLANOPREV = PLP.IDPLANOPREV'
      'ORDER BY PL.NOME')
    ValidateWithMask = True
    Left = 24
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryreservaorig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.NOME , RP.IDTIPORESERVA , RP.FLGCONTROLE'
      'FROM   RESERVAXPLANO RP'
      'WHERE  RP.IDPLANOPREV = :IDPLANOPREV'
      'AND    RP.ANALITICOSINTETI = '#39'A'#39
      'ORDER BY RP.NOME')
    ValidateWithMask = True
    Left = 96
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryreservadest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RP.NOME , RP.IDTIPORESERVA , RP.FLGCONTROLE'
      'FROM   RESERVAXPLANO RP'
      'WHERE  RP.IDPLANOPREV = :IDPLANOPREV'
      'AND    RP.ANALITICOSINTETI = '#39'A'#39
      'ORDER BY RP.NOME')
    ValidateWithMask = True
    Left = 96
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryplanodest: TwwQuery
    AfterScroll = qryplanodestAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM   PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE  PLP.IDPESSJUR  = :IDPESSJUR'
      'AND    PL.IDPLANOPREV = PLP.IDPLANOPREV'
      'ORDER BY PL.NOME')
    ValidateWithMask = True
    Left = 24
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qrypatrodest: TwwQuery
    AfterScroll = qrypatrodestAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  NOME , PESSOA.IDPESSOA '
      'FROM  PESSOA, PATRO, BENEFPLANPATRO B'
      'WHERE PATRO.IDPESSOA = PESSOA.IDPESSOA'
      'AND B.IDPESSJUR(+) = PESSOA.IDPESSOA '
      'AND B.IDBENEFICIO(+) = :IDBENEFICIO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 24
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryregraval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMEREGRA, IDREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 80
    Top = 144
  end
  object qryregra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA , NOMEREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 80
    Top = 128
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 8
    Top = 80
  end
  object qryCCustoD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME'
      'FROM   CENTCUST'
      'WHERE  CODCENTROCUSTO IN ( SELECT CODCENTROCUSTO'
      '                           FROM   CONTASxCC'
      '                           WHERE  IDEMPRESA = :IDEMPRESA'
      '                           AND    PLANO     = :PLANO'
      '                           AND    PLACONTA  = :PLACONTA )')
    ValidateWithMask = True
    Left = 152
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
  end
  object qryCCustoC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME'
      'FROM   CENTCUST'
      'WHERE  CODCENTROCUSTO IN ( SELECT CODCENTROCUSTO'
      '                           FROM   CONTASxCC'
      '                           WHERE  IDEMPRESA = :IDEMPRESA'
      '                           AND    PLANO     = :PLANO'
      '                           AND    PLACONTA  = :PLACONTA )')
    ValidateWithMask = True
    Left = 152
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA'
      'FROM   SUBCONTA'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 151
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryAtividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC,IDPESSOA,NOME,IDUSUARIO,UNETIPO,UNECODIGO'
      'FROM   UNIDNEGOCIO'
      'WHERE  IDPESSOA = :IDEMPRESA'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryContaContabilD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE  PLANO = :PLANO')
    ValidateWithMask = True
    Left = 40
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilDPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabilDPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilDPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
  end
  object dsContaContabilD: TwwDataSource
    DataSet = qryContaContabilD
    Left = 40
    Top = 360
  end
  object qryContaContabilC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE  PLANO = :PLANO')
    ValidateWithMask = True
    Left = 40
    Top = 344
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilCPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryContaContabilCPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'BASEDADOS.PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilCPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'BASEDADOS.PLANOCONTA.PLATIPO'
      FixedChar = True
      Size = 1
    end
    object qryContaContabilCPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'BASEDADOS.PLANOCONTA.PLACCUST'
      FixedChar = True
      Size = 1
    end
  end
  object dsContaContabilC: TwwDataSource
    DataSet = qryContaContabilC
    Left = 40
    Top = 328
  end
  object qryInsert: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO MOVRESERVA'
      '      ( IDMOVIMENTO,'
      '        IDEVENTOGERADOR,'
      '        IDPATROORIG,'
      '        IDPATRODEST,'
      '        IDPLANOPREVORIG,'
      '        IDPLANOPREVDEST,'
      '        IDTIPORESERVAORIG,'
      '        IDTIPORESERVADEST,'
      '        IDBENEFICIO,'
      '        SEQMOV,'
      '        IDREGRA,'
      '        IDREGRAVALIDACAO,'
      '        IDREGRAZERAVALOR,'
      '        FLGCONTABILIZA,'
      '        PLANO,'
      '        PLACONTAC,'
      '        PLACONTAD,'
      '        IDEMPRESA,'
      '        CODCENTROCUSTOC,'
      '        CODCENTROCUSTOD,'
      '        UNIDNEGOC,'
      '        CODSUBCONTA,'
      '        IDREGRARETORNO,'
      '        PLACONTACDEST,'
      '        PLACONTADDEST )'
      'VALUES( :IDMOV,'
      '        :IDEVENTO,'
      '        :IDPATROORIG,'
      '        :IDPATRODEST,'
      '        :IDPLANOORIG,'
      '        :IDPLANODEST,'
      '        :IDRESERVAORIG,'
      '        :IDRESERVADEST,'
      '        :IDBENEFICIO,'
      '        :SEQMOV,'
      '        :IDREGRA,'
      '        :IDREGRAVALIDACAO,'
      '        :IDREGRAZERAVALOR,'
      '        :FLGCONTABILIZA,'
      '        :PLANO,'
      '        :PLACONTAC,'
      '        :PLACONTAD,'
      '        :IDEMPRESA,'
      '        :CODCENTROCUSTOC,'
      '        :CODCENTROCUSTOD,'
      '        :UNIDNEGOC,'
      '        :CODSUBCONTA,'
      '        :IDREGRARETORNO,'
      '        :PLACONTACDEST,'
      '        :PLACONTADDEST )'
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATROORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRODEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANODEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESERVAORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESERVADEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRAVALIDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRAZERAVALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCONTABILIZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRARETORNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTACDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTADDEST'
        ParamType = ptUnknown
      end>
  end
  object qryEdit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE MOVRESERVA SET'
      'IDEVENTOGERADOR   = :IDEVENTO,'
      'IDPATROORIG       = :IDPATROORIG,'
      'IDPATRODEST       = :IDPATRODEST,'
      'IDPLANOPREVORIG   = :IDPLANOORIG,'
      'IDPLANOPREVDEST   = :IDPLANODEST,'
      'IDTIPORESERVAORIG = :IDRESERVAORIG,'
      'IDTIPORESERVADEST = :IDRESERVADEST,'
      'IDBENEFICIO       = :IDBENEFICIO,'
      'SEQMOV            = :SEQMOV,'
      'IDREGRA           = :IDREGRA,'
      'IDREGRAVALIDACAO  = :IDREGRAVALIDACAO,'
      'IDREGRAZERAVALOR  = :IDREGRAZERAVALOR,'
      'FLGCONTABILIZA    = :FLGCONTABILIZA,'
      'PLANO             = :PLANO,'
      'PLACONTAC         = :PLACONTAC,       '
      'PLACONTAD         = :PLACONTAD,       '
      'IDEMPRESA         = :IDEMPRESA,       '
      'CODCENTROCUSTOC   = :CODCENTROCUSTOC, '
      'CODCENTROCUSTOD   = :CODCENTROCUSTOD, '
      'UNIDNEGOC         = :UNIDNEGOC,       '
      'CODSUBCONTA       = :CODSUBCONTA,'
      'IDREGRARETORNO    = :IDREGRARETORNO,'
      'PLACONTACDEST     = :PLACONTACDEST,'
      'PLACONTADDEST     = :PLACONTADDEST     '
      'WHERE IDMOVIMENTO = :IDMOVIMENTO'
      ''
      '')
    ValidateWithMask = True
    Left = 152
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATROORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRODEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANODEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESERVAORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESERVADEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRAVALIDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRAZERAVALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCONTABILIZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRARETORNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTACDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTADDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryRegraZera: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMEREGRA, IDREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 80
    Top = 112
  end
  object qryRegraRetorno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMEREGRA, IDREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 80
    Top = 96
  end
  object qryContaContabilDDest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE  PLANO = :PLANO')
    ValidateWithMask = True
    Left = 152
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilDDestPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryContaContabilDDestPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'BASEDADOS.PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilDDestPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'BASEDADOS.PLANOCONTA.PLATIPO'
      FixedChar = True
      Size = 1
    end
    object qryContaContabilDDestPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'BASEDADOS.PLANOCONTA.PLACCUST'
      FixedChar = True
      Size = 1
    end
  end
  object dsContaContabilDDest: TwwDataSource
    DataSet = qryContaContabilDDest
    Left = 152
    Top = 360
  end
  object qryContaContabilCDest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE  PLANO = :PLANO')
    ValidateWithMask = True
    Left = 152
    Top = 344
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaContabilCDestPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.PLANOCONTA.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryContaContabilCDestPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'BASEDADOS.PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilCDestPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'BASEDADOS.PLANOCONTA.PLATIPO'
      FixedChar = True
      Size = 1
    end
    object qryContaContabilCDestPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'BASEDADOS.PLANOCONTA.PLACCUST'
      FixedChar = True
      Size = 1
    end
  end
  object dsContaContabilCDest: TwwDataSource
    DataSet = qryContaContabilCDest
    Left = 152
    Top = 328
  end
end
