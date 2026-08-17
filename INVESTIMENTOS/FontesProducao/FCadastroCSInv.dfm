inherited frmCadastroCSInv: TfrmCadastroCSInv
  Left = 422
  Top = 203
  Caption = 'Cadastro'
  ClientHeight = 223
  ClientWidth = 381
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 381
    Height = 137
    object Bevel2: TBevel
      Left = 1
      Top = 42
      Width = 379
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 379
      Height = 41
      Align = alTop
      TabOrder = 0
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
    Width = 381
  end
  inherited Dock971: TDock97
    Top = 184
    Width = 381
    inherited tb97Fundo: TToolbar97
      Left = 209
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 40
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 54
  end
  inherited upd: TUpdateSQL
    Left = 322
    Top = 54
  end
  inherited MontaSelect: TMontaSelect
    Left = 293
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 281
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 268
    Top = 2
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      '')
    Left = 266
    Top = 54
  end
end
