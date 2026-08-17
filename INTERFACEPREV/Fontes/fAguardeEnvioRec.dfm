inherited frmAguardeEnvioRec: TfrmAguardeEnvioRec
  Left = 199
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Interface com Patrocinadora'
  ClientHeight = 109
  ClientWidth = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblMensagem: TLabel
    Left = 6
    Top = 66
    Width = 322
    Alignment = taLeftJustify
    Caption = ''
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Layout = tlCenter
  end
  inherited pbAguarde: TProgressBar
    Left = 6
    Top = 85
    Width = 323
  end
  inherited Animate1: TAnimate
    Width = 335
    Height = 61
    AutoSize = False
    Align = alTop
    Center = False
    CommonAVI = aviFindFile
    StopFrame = 23
  end
end
