inherited FrmCadLayout: TFrmCadLayout
  Left = 160
  Top = 135
  Caption = 'Cadastramento de Tipos de Layout'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 542
      Height = 202
      Align = alClient
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label4: TLabel
        Left = 6
        Top = 72
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Edit3: TEdit
        Left = 6
        Top = 32
        Width = 57
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 6
        Top = 88
        Width = 237
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object wwDBGrid1: TwwDBGrid
        Left = 259
        Top = 5
        Width = 278
        Height = 191
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM TPLAYOUT')
    Left = 346
    Top = 6
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 427
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 509
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 387
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 468
    Top = 6
  end
end
