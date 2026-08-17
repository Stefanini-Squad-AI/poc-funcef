inherited frmCadastroMDetInv: TfrmCadastroMDetInv
  Left = 113
  Top = 168
  Caption = 'Cadastro'
  ClientHeight = 417
  ClientWidth = 489
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 489
    Height = 331
    object Bevel1: TBevel [0]
      Left = 1
      Top = 42
      Width = 487
      Height = 2
      Align = alTop
    end
    inherited pnlMestre: TPanel
      Top = 44
      Width = 487
      Height = 73
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 117
      Width = 487
      Height = 213
      Tabs.Strings = (
        'Nome do Detalhe')
      inherited pgctrlDetalhe: TPageControl
        Width = 389
        Height = 154
        inherited tbsDet: TTabSheet
          Caption = 'Eventos'
          inherited dbgrdDet: TwwDBGrid
            Width = 381
            Height = 126
            Selected.Strings = (
              'DATAREFERENCIA'#9'9'#9'Referência'
              'QTDCOTAS'#9'18'#9'Quantidade de Cotas'
              'VLRPATRIMONIO'#9'18'#9'Valor do Patrimônio')
            Font.Color = clBlack
            ParentFont = False
            TitleAlignment = taRightJustify
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 381
            Height = 126
          end
        end
      end
      inherited Dock973: TDock97
        Width = 479
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
        Left = 393
        Height = 154
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 487
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
  inherited Dock972: TDock97
    Width = 489
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 489
    inherited tb97Fundo: TToolbar97
      Left = 245
      DockPos = 245
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 76
      DockPos = 76
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 320
    Top = 3
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDetalhe
    OnStateChange = dsDetStateChange
    Left = 357
    Top = 200
  end
  inherited ds: TwwDataSource
    Left = 376
    Top = 3
  end
  inherited upd: TUpdateSQL
    Left = 387
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Left = 307
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 278
    Top = 3
  end
  inherited qry: TwwQuery
    UpdateObject = nil
    Left = 399
    Top = 3
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 240
    Top = 203
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 301
    Top = 200
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 329
    Top = 200
  end
end
