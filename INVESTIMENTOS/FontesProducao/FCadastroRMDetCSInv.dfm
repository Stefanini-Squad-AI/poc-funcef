inherited frmCadastroRMDetInv: TfrmCadastroRMDetInv
  Left = 223
  Top = 78
  Caption = 'Cadastro'
  ClientHeight = 391
  ClientWidth = 457
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 457
    Height = 305
    object Bevel1: TBevel [0]
      Left = 1
      Top = 43
      Width = 455
      Height = 2
      Align = alTop
    end
    inherited pnlMestre: TPanel
      Top = 45
      Width = 455
      Height = 70
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 115
      Width = 455
      Height = 189
      inherited pgctrlDetalhe: TPageControl
        Width = 357
        Height = 130
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 349
            Height = 102
          end
          inherited pnlControlesDet: TPanel
            Width = 349
            Height = 102
          end
        end
      end
      inherited Dock973: TDock97
        Width = 447
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
      inherited Dock974: TDock97
        Left = 361
        Height = 130
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 42
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 180
        Height = 24
        Caption = 'Descrição da Tela'
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
  end
  inherited Dock972: TDock97
    Width = 457
  end
  inherited Dock971: TDock97
    Top = 352
    Width = 457
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 288
    Top = 2
  end
  inherited dsDet: TwwDataSource
    OnStateChange = dsDetStateChange
    Left = 227
    Top = 175
  end
  inherited ds: TwwDataSource
    Left = 330
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 346
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Left = 275
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 265
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 252
    Top = 2
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    Left = 361
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 276
    Top = 175
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 178
    Top = 175
  end
  object updDetalhe: TUpdateSQL
    Left = 130
    Top = 175
  end
end
