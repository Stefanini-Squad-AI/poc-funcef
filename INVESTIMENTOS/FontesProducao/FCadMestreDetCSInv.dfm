inherited frmCadMestreDetalheCSInv: TfrmCadMestreDetalheCSInv
  Left = 205
  Top = 146
  Caption = 'frmCadMestreDetalheCSInv'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Bevel1: TBevel [0]
      Left = 1
      Top = 42
      Width = 495
      Height = 2
      Align = alTop
    end
    inherited pnlMestre: TPanel
      Top = 44
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 142
      Height = 195
      inherited pgctrlDetalhe: TPageControl
        Height = 136
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Height = 108
          end
          inherited pnlControlesDet: TPanel
            Height = 108
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
      inherited Dock974: TDock97
        Height = 136
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 495
      Height = 41
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 205
        Height = 24
        Caption = 'Descrição da Tabela'
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
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 325
      DockPos = 339
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 156
      DockPos = 170
    end
    inline fraMens: TfraMensagem
      Width = 161
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 161
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 81
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 79
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 82
          Width = 78
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 76
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 272
    Top = 2
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDetalhe
    OnStateChange = dsDetStateChange
    Left = 155
    Top = 218
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 386
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 402
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Left = 259
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 249
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 316
    Top = 2
  end
  inherited qry: TwwQuery
    Left = 417
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 236
    Top = 218
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 173
    Top = 218
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 193
    Top = 218
  end
end
