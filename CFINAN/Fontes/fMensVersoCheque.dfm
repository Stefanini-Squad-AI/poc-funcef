inherited frmMensVersoCheque: TfrmMensVersoCheque
  Left = 110
  Top = 186
  Caption = 'Mensagem do Verso do Cheque'
  ClientWidth = 630
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    object MemVersoCheque: TMemo
      Left = 5
      Top = 5
      Width = 620
      Height = 224
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Courier'
      Font.Pitch = fpFixed
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Width = 630
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
  end
end
