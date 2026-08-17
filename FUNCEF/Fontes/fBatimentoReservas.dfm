inherited frmBatimentoReservas: TfrmBatimentoReservas
  Left = 148
  Top = 155
  HelpContext = 3360027
  Caption = 'Batimento de arquivos de reservas - EXCEL'
  ClientHeight = 205
  ClientWidth = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 472
    Height = 166
    object Panel1: TPanel
      Left = 1
      Top = 130
      Width = 470
      Height = 35
      Align = alBottom
      TabOrder = 0
    end
    object memo: TMemo
      Left = 1
      Top = 9
      Width = 470
      Height = 121
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 166
    Width = 472
    inherited tb97Fundo: TToolbar97
      Left = 300
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 131
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 379
    Top = 99
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Excel|*.xls'
    InitialDir = 'c:\'
    Title = 'Find Excel File'
    Left = 344
    Top = 96
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 304
    Top = 88
  end
end
