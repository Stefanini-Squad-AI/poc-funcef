inherited frmApropContabil: TfrmApropContabil
  Left = 75
  Top = 107
  Caption = 'Apropriação Contábil'
  ClientHeight = 115
  ClientWidth = 608
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 76
    object grpMesRef: TGroupBox
      Left = 6
      Top = 4
      Width = 594
      Height = 61
      Caption = 'Histórico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dblkfolha: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 561
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO')
        LookupTable = qryHist
        LookupField = 'HISTORICO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 76
    Width = 608
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHSTFOLHABENEF, HISTORICO '
      'FROM HSTFOLHABENEF'
      'WHERE FLGESTADO <> 2'
      'ORDER BY 1 DESC')
    ValidateWithMask = True
    Left = 64
    Top = 5
    object qryHistHISTORICO: TStringField
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHistIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
end
