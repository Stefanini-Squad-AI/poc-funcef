inherited frmParamrelRubFontePag: TfrmParamrelRubFontePag
  Left = 166
  Top = 191
  HelpContext = 180109
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relatório de Rubricas por Fonte Pagadora'
  ClientHeight = 101
  ClientWidth = 511
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 511
    Height = 62
    object GroupBox2: TGroupBox
      Left = 9
      Top = 5
      Width = 492
      Height = 49
      Caption = 'Fonte Pagadora'
      TabOrder = 0
      object CboFontePagadora: TComboBox
        Left = 8
        Top = 16
        Width = 473
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 62
    Width = 511
    inherited tb97Fundo: TToolbar97
      Left = 339
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 170
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 51
  end
  object qryFontePag: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDFONTEPAGADORA,'
      '      DESCRICAO,'
      '      CODFONTEPAGADORA'
      'FROM'
      '    FONTEPAGADORA'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 111
    Top = 50
  end
end
