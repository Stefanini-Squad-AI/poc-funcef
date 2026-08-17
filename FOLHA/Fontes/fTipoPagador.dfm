inherited frmTipoPagador: TfrmTipoPagador
  Left = 206
  Top = 153
  Caption = 'Tipo Pagador'
  ClientHeight = 210
  ClientWidth = 301
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 301
    Height = 171
    object rgTipoPagador: TRadioGroup
      Left = 57
      Top = 30
      Width = 185
      Height = 105
      Caption = 'Tipo de Pagador'
      ItemIndex = 0
      Items.Strings = (
        'Banco'
        'Participante')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 171
    Width = 301
    inherited tb97Fundo: TToolbar97
      Left = 135
      DockPos = 135
    end
  end
end
