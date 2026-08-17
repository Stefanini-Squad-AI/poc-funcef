inherited frmOkListaAdvertencias: TfrmOkListaAdvertencias
  Caption = 'Lista de Advertências'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object MmAdvertencias: TMemo
      Left = 1
      Top = 1
      Width = 526
      Height = 232
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
