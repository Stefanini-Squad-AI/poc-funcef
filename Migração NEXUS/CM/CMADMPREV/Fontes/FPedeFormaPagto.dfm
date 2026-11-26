inherited frmPedeFormaPagto: TfrmPedeFormaPagto
  Left = 324
  Top = 170
  Caption = 'Pedir devolução de benefícios via ...'
  ClientHeight = 151
  ClientWidth = 331
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 331
    Height = 112
    object rgrpFormaPagto: TRadioGroup
      Left = 5
      Top = 5
      Width = 321
      Height = 102
      Align = alClient
      ItemIndex = 0
      Items.Strings = (
        'Folha de Benefícios'
        'Folha da Patrocinadora')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 112
    Width = 331
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 155
  end
end
Terminar em
