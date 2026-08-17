inherited frmBatimentoVlrContrib: TfrmBatimentoVlrContrib
  Left = 205
  Top = 212
  HelpContext = 3360028
  Caption = 'Batimentode valores nominais de contribuições - EXCEL'
  ClientHeight = 251
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 212
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Mês de Cobrança'
    end
    object memo: TMemo
      Left = 1
      Top = 55
      Width = 526
      Height = 121
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 1
      Top = 176
      Width = 526
      Height = 35
      Align = alBottom
      TabOrder = 1
    end
    object edmescob: TEdit
      Left = 143
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 212
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 67
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 304
    Top = 88
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Excel|*.xls'
    InitialDir = 'c:\'
    Title = 'Find Excel File'
    Left = 344
    Top = 96
  end
end
