inherited FrmCadastroGridCSInvFMD: TFrmCadastroGridCSInvFMD
  Left = 373
  Top = 309
  Caption = 'FrmCadastroGridCSInvFMD'
  ClientHeight = 314
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 228
    object Bevel2: TBevel [0]
      Left = 1
      Top = 42
      Width = 550
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    inherited pnlControles: TPanel
      Top = 99
      Height = 128
    end
    inherited dbGrd: TwwDBGrid
      Top = 99
      Height = 128
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 550
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
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 550
      Height = 54
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 275
    inherited tb97Fundo: TToolbar97
      Left = 380
      DockPos = 900
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 211
      DockPos = 700
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 387
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 427
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Left = 509
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 468
    Top = 2
  end
  inherited qry: TwwQuery
    Left = 346
    Top = 2
  end
end
