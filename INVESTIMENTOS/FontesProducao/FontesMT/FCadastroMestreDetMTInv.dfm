inherited FrmCadastroMestreDetMTInv: TFrmCadastroMestreDetMTInv
  Left = 292
  Top = 173
  Caption = 'Cadastro'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object pnlTitulo: TPanel
        Left = 0
        Top = 0
        Width = 505
        Height = 31
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object lbNomItem: TfcLabel
          Left = 13
          Top = 3
          Width = 147
          Height = 24
          Caption = 'Titulo do Form'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
      end
      object pnlDados: TPanel
        Left = 0
        Top = 31
        Width = 505
        Height = 67
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            OnCalcCellColors = PintaGridZebrado
            OnTopRowChanged = GridRefresh
          end
        end
      end
      inherited Dock973: TDock97
        inherited tb97BotoesDetalhe: TToolbar97
          object sbtnConsDet: TToolbarButton97
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Consultar'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              1000030000000002000000000000000000000000000000000000007C0000E003
              00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
              1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
              1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
              1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
              00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
              FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
              FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
              104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
              1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
              1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C}
            ImageIndex = 1
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = sbtnConsDetClick
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inline fraMens: TfraMensagem
      Width = 167
      Height = 38
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 167
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Width = 72
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Width = 70
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 73
          Width = 93
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 91
            Height = 34
          end
        end
      end
    end
  end
end
